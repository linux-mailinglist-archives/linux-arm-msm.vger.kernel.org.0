Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECD6687D1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 13:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbjBBMUn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 07:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjBBMUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 07:20:42 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C425721E4
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 04:20:41 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1265493wmq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 04:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WT4Dzf2UAf3S9tJQ5wOXPV943mqxRoRu0Jh1ygzYClE=;
        b=RLZwiAH/Gnq66c6xCREMygzm/p96mAGSvtaIJdkXtoRxQ5IBHFjMXfDve76V5SQPYz
         y6ca+xACABjsFX3qtMuq2OH+HLR69LFS0+z/gCO1USbXWFOGEPaVOYzSC0RYD+jhevhz
         bqR69UqTtyPeAgDZodJG9t9Bb/SEcl/oua2e7CvWTo9z98/PkeHx4jX2dDFm46VZ4AVj
         2RYG7juccanMlcv3xrTUvqdQ+BMqiTCEP89XXmJertAXIO8Vw6KBtnuyOB9cWWOv64/s
         W1I+aksdKDFpgvVZWWAf69zT3ZJMLkwxpzOK+F3s0SlES5dodFS7e8vPVfDtUVx1lXyB
         ygLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WT4Dzf2UAf3S9tJQ5wOXPV943mqxRoRu0Jh1ygzYClE=;
        b=kAfqyi3nnnejyLX0fIox1lPU4x0cDCXmarFrElzIBiqp6bi5rEaVc1PZL3owwMgq7f
         kmfWzx8aU12BjfSx80CD4a9v+rPfCucHcp3lpVYEaNv5i3PaaDWkcBRGladJ6A+mhYBo
         6WGrlu9bGd4Uk1Hk+0Gicu0sfPJmG3WyXgfheucBLp5V0s4NA7W83AdNgf++Nij1DgjQ
         YDyeeIK74aztou4uanzSH4IXV3V6ot/zTqGbAXxXq34lMtxqUwJ+Sm6T7+QF0m+jRG9m
         DbKsTRgdAZHXxqOU7vhxrir5u4pMEpsIBbGK93fJ3TFttZ/tXlIKlq9PKhuBeZnODopm
         avGg==
X-Gm-Message-State: AO0yUKXtR0NrBwJ0qI4Z3W9cWtAZukpLm2X5G6fi9wqapRjkMyVK2hrR
        7twx2efQogHzR3hIxgpFEu++eQ==
X-Google-Smtp-Source: AK7set84hP8thWj1wcNndmiSXoQdXhE24CGTllU1HZWXWCqKvRGEcbnYtdNE7OOPBGrYAeCU9pFfQg==
X-Received: by 2002:a05:600c:1f10:b0:3db:742:cfe9 with SMTP id bd16-20020a05600c1f1000b003db0742cfe9mr5750134wmb.34.1675340440221;
        Thu, 02 Feb 2023 04:20:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003d237d60318sm4528388wmi.2.2023.02.02.04.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:20:39 -0800 (PST)
Message-ID: <a95f11cb-efaf-1363-a258-9d6626bd7534@linaro.org>
Date:   Thu, 2 Feb 2023 13:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 15/23] interconnect: exynos: fix registration race
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-16-johan+linaro@kernel.org>
 <e706bb89-bb79-33e3-f319-268ec4695015@linaro.org>
 <Y9up2gKUpZXhI+J8@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9up2gKUpZXhI+J8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 13:17, Johan Hovold wrote:
> On Thu, Feb 02, 2023 at 12:04:49PM +0100, Krzysztof Kozlowski wrote:
>> On 01/02/2023 11:15, Johan Hovold wrote:
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

