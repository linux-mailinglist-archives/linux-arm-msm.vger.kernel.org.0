Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752C65B3461
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbiIIJrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbiIIJrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:47:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476A5F3BE4
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:47:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so1793513lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=v4ZqJESqWEDqaIz6R+zp2/x1nVd3NULUMDv3pG+GOq4=;
        b=Zh89azYzcvL1KK99kdg8dL5hwP1TOMs46RS3tyx6ccu2sNlSmxjN4FTc3DTkMpcDw1
         z3w/rlcBV1N3iv05Bk9b8LpIthKMSeFdXXpIDWuP7ZvUP2DrZ/iHRDID03U/sBwQSVZl
         ALr49/V3fMiF7j1mXGTS/5GK0vlWYJvkfuiAuscNfc0H6XHFbXUF76P8vvLesWHT+ACu
         KTweSG1g16wTF5l3US5O7akQA2aCucezmMsKKchRQTD4h8m+vtVvSGm53i5YRkKb839O
         fwqR+Ju9WrAQyZ8XFBlfn+W/WXmZhZVKkeM4bzoNddRskgWEj0MHvlbGQBGOg+jV1MoT
         IXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=v4ZqJESqWEDqaIz6R+zp2/x1nVd3NULUMDv3pG+GOq4=;
        b=h4oDXOUuvE2UUPRvLObby/ukhaHQA1OijAdomdgl2RKi1xSipOCZ7enqmN3TNMQRYn
         RkuLRDvH3NnZrA0rn5HqmMK6bbMROrcslHshd/5qc/R/DGk18GAWkae1PjwydZlNmn5c
         Ux4pa6RM6D24JO8picHgrJmfUVH4cJLkWpUgl/kRLK0EIlDMVRU93IUlpSSmPqWXLrBa
         Ip8/6BMkYYUWp8I3JoEFEFqIhZHa7q59Sog593dVqtHPJ2DRt2IclT4Ao4BDxWQn6wB8
         2IhAY5iz6SVFLSrlL9heOAcDnZK1JqrGZcNbIoHFVO2fSQFAROuxab7dud5HfJABfTyi
         ckXQ==
X-Gm-Message-State: ACgBeo3o64ow54eAw7jCnUXLvTmNSKI3LpuVvnS4+Qv8VI7MfMpBwKzv
        q1jdqZQix5HDx7EJe7Mx1w13fg==
X-Google-Smtp-Source: AA6agR7ictm0hi0zGBTrEMlAhD5zXwZHeImTpbkkQLuEw05MdbjhA91y32yrf70t+577Wlx0JkMYLQ==
X-Received: by 2002:a05:6512:10c1:b0:492:a27d:ff44 with SMTP id k1-20020a05651210c100b00492a27dff44mr3819219lfg.405.1662716840687;
        Fri, 09 Sep 2022 02:47:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a05651236c300b00497a5a91763sm21221lfs.12.2022.09.09.02.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:47:20 -0700 (PDT)
Message-ID: <e1a2c231-b524-821c-afb5-865cd88606b4@linaro.org>
Date:   Fri, 9 Sep 2022 12:47:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 13/16] phy: qcom-qmp-pcie-msm8996: drop unused secondary
 init tables
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220907110728.19092-1-johan+linaro@kernel.org>
 <20220907110728.19092-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907110728.19092-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 14:07, Johan Hovold wrote:
> Drop the secondary register initialisation tables which aren't used by
> this driver.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 26 -------------------
>   1 file changed, 26 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

