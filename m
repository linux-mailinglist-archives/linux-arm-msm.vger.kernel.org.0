Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B695FCCE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiJLVP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbiJLVPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:15:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EC2D7E21
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:15:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu25so27596976lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbUlA3t62cYiSgjKjqmxBis0XWCHhSo31vwAwTxf5hY=;
        b=dr8jymAsgJbJ3bD1RSIr3m9U4kEE1PF+KztxBNU8+EgILr4mZ4BMCoSuVYyD3yoY/b
         pVr8bOg8mAvl2hw9AKF2WpV2SNK76gBaViKQ7QI+MBAGY7FswSM8vS6QRlRqO5V9JCiC
         kPVQFJacg9Z0KyhL34+zBSKt3DX1wfPn0+ya2KB6fkWXTihGUMtN/Br2T2jlpZxifvMD
         dTaFK4un781zbp2vmTgcBJM+rEfYDTezigTs17gOzq+trbXnE+GJW9Qzm2k674zMT1xj
         Yk920FIxBOLgPNz8ZqBN5uHZKk++DIg1pjCTUeYx7nYEk2yC4aGjt1MwRh7G/e1BNEKm
         +hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbUlA3t62cYiSgjKjqmxBis0XWCHhSo31vwAwTxf5hY=;
        b=Cq+O8lk4dp6+c22J2H4rFrA7U74BtcxM+IKt8IQFo7R3WF1E6eZPyxP22FNX2tLRc2
         bVrasJAdj3VuKQO4OvfuB7Z7p6Ls9TC9cucm2lereg9jyrY4L8EJ/xd2y0TQ7Yj3Nktt
         OR2vBqDf2TJgDNFNbsnG6yN6GkcG/iapEhYVFYEc44XRqCKg0CLNQ7C5yAeOPyGToVBy
         KQtP1+i5+oUdxqZxS8CfPSRTHrH8/fnKXTpptdcty3hwxMMCzKIglwtlgmgEEjoifaIs
         lgSfPnCuRNT9w4SOU8pCP4VHOhlY57QFhm8r1V+TDwy51InAECXsi44zeGsAkLcgosJo
         12Dg==
X-Gm-Message-State: ACrzQf3loHtUWixSOs4QRnuidv0yw02c+dGys+uhmd9XgMP+tZLZZuhJ
        ShUfpS6NsKOb3AUfnXikpt8pLw==
X-Google-Smtp-Source: AMsMyM7vL2mB+XFGIGYX46c+KPs4vYKDa1O5nLsF2hbfco6fH7OQpcw2/M7SHnsf4IMvn+barBddyw==
X-Received: by 2002:a05:6512:61c:b0:4a2:35fa:bdfd with SMTP id b28-20020a056512061c00b004a235fabdfdmr11964339lfe.215.1665609331706;
        Wed, 12 Oct 2022 14:15:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z9-20020a2e9649000000b0026c2d2a9b92sm111574ljh.101.2022.10.12.14.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:15:31 -0700 (PDT)
Message-ID: <664b93de-6ea9-9b38-770f-bdb56fd4d8e2@linaro.org>
Date:   Thu, 13 Oct 2022 00:15:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 13/20] phy: qcom-qmp-usb: clean up status polling
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012084846.24003-1-johan+linaro@kernel.org>
 <20221012085002.24099-1-johan+linaro@kernel.org>
 <20221012085002.24099-13-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-13-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:49, Johan Hovold wrote:
> Clean up the PHY status polling by dropping the configuration mask which
> is no longer needed since the QMP driver split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 25 ++-----------------------
>   1 file changed, 2 insertions(+), 23 deletions(-)

Same comment as for 08/20. With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

