Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D52365B3469
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbiIIJsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbiIIJsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:48:53 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C1B113C44
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:48:51 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id bs13so1165143ljb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WancZI8YP8VSBJAFL6bEJwq5YWTwAf+vMCt1jVIkDpI=;
        b=c/DmfEX3Jnhh+mQTSH6JbH+SMCc4p+AoYmc3hYG/O7E55Ha0yMLz0LyHjH4BBA9h7P
         YwSD50JRjdW2rpXjQVFTdSHT+OkvV8DUFPjZrmhMsjyzOpbL6H1XGyo5ookN1wEA7C/A
         +iI6tKzRSuLL2mO5re+U9nkTNEq5tWIqmMJOfh06fW/yHtBbXTgLrgauEL4OIb+vt94Z
         C3BheGp56c4OUqj6H2vGytcBKd/QaePsJHYGJllGCgUay3NAANXzJPQGOLsPphaKat39
         utwY+/tHIOdD6F38N1H8k76MOvpNA4cqHJwzvEAnhX5j1wugGQKXoJ6meKM9lbfrjpNc
         qnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WancZI8YP8VSBJAFL6bEJwq5YWTwAf+vMCt1jVIkDpI=;
        b=ZAF8ae2YtXeTCVAwbtH17K9/wmFsp2BBLVgTk1vhAuddFlhiUebpJuzJEWaLbw28d1
         +mV3dPnJ35U8dRDlKuLnAnff0h9KC7DGjlu0anpZn8SGFkEsJclEig7XVoR2cGNBsCPw
         5CvABNi3KWymxUWiZgZT+EQqpT/W/yBe8x0L0M8K4g78B7/a0+/y2qWziKok9wEM6C1C
         g166vRWp2+GAXWI0+YzPxqM2u2qEuNS25wppnDxCjzEZKi8V3fv5Rc69Hf/OjIWGeolW
         nZmIpWfVnoKO3czVtpKRZC//0K3hbs6QI9A/A07h2btV3jwTlx57H/OSnu00c22H5O5j
         B0LQ==
X-Gm-Message-State: ACgBeo1UQF96cXzJC/SdCJzotupH4o2o2Nx5FiI5R1q7lobOPsu/tVrd
        r0xMco8+VC7kiiaC66fmJoacUQ==
X-Google-Smtp-Source: AA6agR5kHxbAlNJlHm7H2K0r9upPb4NqqNY6jgApbJ1GdX2iE/bsEdx4ndsCr2/DKqvXVTOk656snQ==
X-Received: by 2002:a05:651c:1a1e:b0:25f:e7bd:6a4e with SMTP id by30-20020a05651c1a1e00b0025fe7bd6a4emr3995212ljb.362.1662716929326;
        Fri, 09 Sep 2022 02:48:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p21-20020a2eb7d5000000b0026b96b8ecb6sm3814ljo.111.2022.09.09.02.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:48:49 -0700 (PDT)
Message-ID: <03814cce-4b48-0570-7638-a84bd84c6f7a@linaro.org>
Date:   Fri, 9 Sep 2022 12:48:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 16/16] phy: qcom-qmp-usb: shorten function prefixes
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
 <20220907110728.19092-17-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907110728.19092-17-johan+linaro@kernel.org>
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
> The driver function prefix has gotten unnecessarily long and hurts
> readability.
> 
> Shorten "qcom_qmp_phy_" to "qmp_" (which likely stands for "Qualcomm
> Multi PHY" or similar anyway).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c |   3 +-
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 121 ++++++++++++------------
>   2 files changed, 60 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index b020409b92e0..4d0eee620f37 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1105,8 +1105,7 @@ static const struct phy_ops qcom_qmp_ufs_ops = {
>   	.owner		= THIS_MODULE,
>   };
>   
> -static
> -int qmp_ufs_create(struct device *dev, struct device_node *np, int id,
> +static int qmp_ufs_create(struct device *dev, struct device_node *np, int id,
>   			void __iomem *serdes, const struct qmp_phy_cfg *cfg)

This likely should go to the previous patch.

Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>   {
>   	struct qcom_qmp *qmp = dev_get_drvdata(dev);
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index 08e0799e8832..41635c21e3ca 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
-- 
With best wishes
Dmitry

