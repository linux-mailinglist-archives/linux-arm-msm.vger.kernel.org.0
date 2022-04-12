Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021344FE3CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 16:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353760AbiDLObn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 10:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233717AbiDLObi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 10:31:38 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF13F27CD4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:29:18 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e2afb80550so9011041fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GxA+wuzS2VTnaCpw8/DQnNsOeYcblk4406tgOs1kPrI=;
        b=MH0U2Ei66jCCDx0swymTSyZNk3sqbf2rY3WLX5Pwrwu1nh4V8Y30+ZB3CqJ1LQTgYF
         RW6NfbBcMkKOLWwftzRLiHSJBGsZD7uVe1vSQ4XPpr3C+w9StxSqyq39xfujlxaCzZEA
         jh1nYCzV2j1fN0bitFi8h9P9jpzUWygVsUE/JfpK8emwb9gw7IGIrpA+ga80zMSiiJbk
         sQ4E87/XQxmcKR07uUxArDcPJ/l4LmYlza7SP9SO5H2V9EjHZpBqti6iDGJM1tNIsN5P
         QrJVCvwLMoVMNAFUcdQCeKSfHTQHoV+PtB0amwIE5Sy4AN4cRWRSiiMauKoIpfpZshw/
         4iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GxA+wuzS2VTnaCpw8/DQnNsOeYcblk4406tgOs1kPrI=;
        b=eYxuzs1mVAPYyqy9lC8ZfsAOUAwsNSI5KFMEmhQ+XC/ojZaxWmPIfk7HgLu5nENhcD
         OMHHLs+/OPQNmPvUxJ3VADc80M8aSlh82LWJQgVp9cswK86RKIwo03IahfUPkqDT/io1
         104FDwK8+m4ZGrrsYr4Shyr5POIrrbHFU9PQ4ABQtGkyhyTqxi684nAd1kLdVeYgtyub
         yAJ8FDTa/63ou8bE/oWvbD6PbhR8l5Re8VQc2XntuaaO7U/WQEUjswltGOaFUN+oZ5wI
         LuGBtV+xaQ5GW3/GkjXn6sGwoYtmZI3HZg7lbUVTdr38q9iJcNViKbOgDwNCjpJ/W553
         Om0Q==
X-Gm-Message-State: AOAM531n1/BRYxaNzT+HXnBHCmSwMmnfuLCGwDg2tCvei1htGWl5JV8l
        X4R8jXw137+s0Wofca0oWfQ2zA==
X-Google-Smtp-Source: ABdhPJxZW+yVNF/lJYAiuoC2KDAAc81y2wKm3Y8r2ObfycQAn7jcAdHMNb2ptE++bS1LUV+uIg2qCw==
X-Received: by 2002:a05:6870:b40a:b0:d7:5c87:64ab with SMTP id x10-20020a056870b40a00b000d75c8764abmr2204624oap.168.1649773758139;
        Tue, 12 Apr 2022 07:29:18 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id r82-20020aca5d55000000b002ecaaa13cafsm12579555oib.8.2022.04.12.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 07:29:17 -0700 (PDT)
Date:   Tue, 12 Apr 2022 09:29:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     cgel.zte@gmail.com
Cc:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        gregkh@linuxfoundation.org, sdharia@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] slimbus: qcom: fix error check return value of
 platform_get_irq()
Message-ID: <YlWMu9D/6nVl5tqV@builder.lan>
References: <20220412090259.2533316-1-lv.ruyi@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412090259.2533316-1-lv.ruyi@zte.com.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Apr 04:02 CDT 2022, cgel.zte@gmail.com wrote:

> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> platform_get_irq() return negative value on failure, so null check of
> ctrl->irq is incorrect. Fix it by comparing whether it is less than zero.
> 
> Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/slimbus/qcom-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index f04b961b96cd..b2f01e155d77 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -510,7 +510,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
>  	}
>  
>  	ctrl->irq = platform_get_irq(pdev, 0);
> -	if (!ctrl->irq) {
> +	if (ctrl->irq < 0) {
>  		dev_err(&pdev->dev, "no slimbus IRQ\n");
>  		return -ENODEV;
>  	}
> -- 
> 2.25.1
> 
