Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6683478C18B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 11:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjH2Jcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 05:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234879AbjH2JcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 05:32:12 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F208DCC2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 02:31:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-500b6456c7eso3453343e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693301498; x=1693906298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ac6xqVgSskbwf+6SFx252FM1re6neKrPp+nbe33qmqk=;
        b=sMt8FogipfV40ZJ0kVIacpgxgR0aLO7WAv6xB5Hh1O5yCe9iGO1h/pivrQAY/VOqkn
         Q95EVL22BhWl1ZKU+EEn0fggXzJ0/Bco3sOYlweLnyQC4cX60I34KXygTmcrylsmM0PY
         LKckbEt33wz6mv9wa8Kl0j2NB39/SYQT0nALjpFMQzslNU2INY3mVWw9ZP9pidQV0rSd
         8IzOFXWefH/7rDZGgnzopZVn0Gr4PqwTWMD3yJmEGLf1H/c/Ldf+aqwdYcSe1SdFo5+L
         JUUp3XJ+7XPiDKk4+tYiQvzGp4LEv+n58BOG8xa1U2Hg6YMAg1Ca3HgYUCik58DmgOyF
         YCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693301498; x=1693906298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac6xqVgSskbwf+6SFx252FM1re6neKrPp+nbe33qmqk=;
        b=jSg9Yxelw+4VsKgb8A7SukLmp5R5OdMs+Eze43u1+bwbOu3aNK4CLlXwUnZJFs1fWd
         9YeBp9cp63EEobqa9AvRB0PJzU5affRFeY6ivyJyyWdzslT0p92yDXrqRo1MEMJ/3Cy4
         k5axqhQOtkZOE7sMGvftbjx6FmlVy6VgHhUKXWxr3JM8dW4n3piOP3DbAf2KGbsXQCsP
         xS3/XP0NKMGLOte8MtCF/GTEPHRpvJebgaMbmAkHRJHN531ULDEvtFxhlXWxWzcYJEVw
         S7yuaZJqtk4HlBSr+eVPYeJD4q+NfkV3HG6ygLMqPaUSUP5yO8pncmqTHa+PXAyMEwim
         N74w==
X-Gm-Message-State: AOJu0YwP4njKv5eOzVZ6kajuyLyjzS0vQxGVfI9hC/LbpEnXZT/ENEdD
        roITW2fxKTEN3X1zwBraR0xN+A==
X-Google-Smtp-Source: AGHT+IG5GaoltkaSnPoIGiS46RWBV3F2tskphsVOJLvNIjlOmoXNR8DJalLo+GUytEuPS1sXXvoPlA==
X-Received: by 2002:a05:6512:3d0f:b0:500:b9f3:1dc4 with SMTP id d15-20020a0565123d0f00b00500b9f31dc4mr3855419lfv.68.1693301497780;
        Tue, 29 Aug 2023 02:31:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b0050087b72169sm1868261lfm.24.2023.08.29.02.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 02:31:37 -0700 (PDT)
Message-ID: <7ec87a0f-3404-46b3-be18-e7af870e6411@linaro.org>
Date:   Tue, 29 Aug 2023 12:31:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] phy: qcom: m31: Fix indentation issues
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <cover.1693296360.git.quic_varada@quicinc.com>
 <6087788f2e2a8e88a0cf3df64d20abbada17cdd0.1693296360.git.quic_varada@quicinc.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6087788f2e2a8e88a0cf3df64d20abbada17cdd0.1693296360.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2023 11:37, Varadarajan Narayanan wrote:
> Fix incorrect indentation
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v10:
> 	Restore register success print per Dmitry's comment
> v9:
> 	Fix line break alignment
> 	Remove register success print
> 	v8 version of the driver has been picked up for merge.
> 	(https://lore.kernel.org/linux-arm-msm/169226613917.81413.1200008047604336868.b4-ty@kernel.org/)
> v8:
> 	Change commit subject and message per review comments
> 	Don't include of_platform.h
> 	Change struct init coding style
> 	GENMASK -> BIT for one define
> v6:
> 	Kconfig:Add COMPILE_TEST and remove USB_GADGET from 'depends'
> 		Change 'selects' USB_PHY -> GENERIC_PHY
> 	Driver:	Use correct headers
> 		const int -> unsigned int for 'nregs' in private data
> 		Use generic names for clk, phy in m31 phy structure
> 		Init register details directly instead of using macro
> 		Use dev_err_probe in the error paths of driver probe
> v5:
> 	Kconfig and Makefile:- place snippet according to sorted order
> 	Use generic phy instead of usb-phy
> 	Use ARRAY_SIZE for reg init instead of blank last entry
> 	Fix copyright year
> 
> v4:
> 	Remove unused enum
> 	Error handling for devm_clk_get
> v1:
> 	Combine driver, makefile and kconfig into 1 patch
> 	Remove 'qscratch' region and its usage. The controller driver takes care
> 	of those settings
> 	Use compatible/data to handle ipq5332 init
> 	Drop the default case
> 	Get resources by index instead of name as there is only one resource
> 	Add clock
> 	Fix review comments in the driver
> ---
>   drivers/phy/qualcomm/phy-qcom-m31.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

