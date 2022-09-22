Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D3E5E65BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbiIVOeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiIVOd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:33:56 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82845F686A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:33:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j16so15041656lfg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JxU3uKVUWz+9uazTKxzXKSZw/vdNYr+DWen17yUI8Jk=;
        b=UzRNr1HH172T/6Hta/GANHerNgkfJHmBMe9uw+ywAaTpTi2qPayhfmmRTtUZNWBxdS
         +qt1hjin1V8oFIv3vkfFXaeAon/rqqNm9dB8ANbt+O+/6vW0BC/hWtKV/iJnxZ5AP9g1
         jxC1QSjg7FIqU+lJlPq6gJXdz0VKO5XdnAqoBJHIjI81/4y0326iUeioV0TljBBlqGkD
         Dh4/n3phj6QmamyVgATL9y0RC6bpZBJFcCDdf+sRWEnvTawA4HqwRlI6dCOLD2K5oCHe
         iQlN5ArVdox5uwSC/vqFm3k8AsKFpraHMHrtzAs7cDm26O1DIAhRZPg467B5pMlsTXWM
         +m1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JxU3uKVUWz+9uazTKxzXKSZw/vdNYr+DWen17yUI8Jk=;
        b=JBOqO31PjR9GFgUA/p3Df1F6qbNE3KPHwu51iiSL+/FPZCubm7dxk4ahKi89AiC1DY
         acGAY3OiGEiNaDcaNSWBYH7u1GGXJcb4NsrUXHNDMahEv8y7RBJ+NCoZ9Q8MOhsQU+qe
         pL0oz+UQbkYZggFay6c2M9rYuIGE/j3n5m/eOQcQ9ijuuO72D4cAdNmQ9nU5pf3v+7TW
         +bDKX8HRBbiTkyjzPfbYQTjfnfInd1+87ozajt4GrhKsKQWHv0uuMva2C3Mkip5Ei/45
         HqteL7P3Mp0iTL2mwcoCsdVnZGG6rUw63aW1BmDDkyjtN812AAU9oMuLeK7NX1GqpunJ
         T2mA==
X-Gm-Message-State: ACrzQf2oPohHmt0+5NUs+NwyCL2e1KPfMcvpCiEq69QJsafjUI0uBPcb
        cYpqCPzdZW56qAtb5tLhup8PSg==
X-Google-Smtp-Source: AMsMyM4NGpSqJPgoG+mfWgdzhFHm14FMjK4eGJDPejgN+ufox6PMD6+NsIo0h3SwZCrkBLk3uRDaJg==
X-Received: by 2002:a05:6512:409:b0:49a:eadb:5ec9 with SMTP id u9-20020a056512040900b0049aeadb5ec9mr1285259lfk.253.1663857233608;
        Thu, 22 Sep 2022 07:33:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004994c190581sm960728lfg.123.2022.09.22.07.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:33:53 -0700 (PDT)
Message-ID: <f3f740c7-1463-28fa-bd64-4da6612e3f09@linaro.org>
Date:   Thu, 22 Sep 2022 17:33:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/17] phy: qcom-qmp-usb: drop unused type from config
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-5-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> The configuration PHY type is no longer needed since the QMP driver
> split so drop it from the configuration and suspend callbacks.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 26 -------------------------
>   1 file changed, 26 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

