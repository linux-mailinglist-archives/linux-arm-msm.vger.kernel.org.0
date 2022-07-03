Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758CE5643D7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbiGCD5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiGCD5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:07 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B8AB1EC
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:05 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id l81so8912836oif.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yEsAUw4aHtO0UTFe6lluQAoyFRt4Qgh9+0RC0ziZ3nA=;
        b=A/4u79QOtyk00OMsdOM9RTjWFxVGIbou/dfGxwgI7/AaJZSQ3hGpVXut6JM33D7Uwd
         qpcx2grXxVWNeYsWuCbVs9poScTjD7Ek6q1OShwiUYt7XASNNkCex/vFABVtHegzbEeD
         zigpeWH/AjDQLRB8HZHmTt+b7txB2B7ANwmL0tx222ROLMrheJ/nYP6nV+Mk2HLkyXYf
         NxMWyJDZvFQf8oYZ1sUyLtXZFKkINzzModfTOYITjnDg6xzmxTD4sojSYLUA+dVvDIaK
         E2ikEPQDPs9nnwjVtMoZiFDxxsNYLNB6rgZLe4fCv7YKJxKFKy5EiaC4/JxWL8csohel
         mTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yEsAUw4aHtO0UTFe6lluQAoyFRt4Qgh9+0RC0ziZ3nA=;
        b=rjh4+H2YlFA8AMAnzkaiqlTS3f4Aw0L9cU2kNn+mQvjRA/VkDJhDH0ZxlZXx3TPadN
         PvR77H7lCn4WTG1d9O84iKRten6VsNoui8b860NkE0rgbceltm8AFiihcApLp3Ex/vcF
         T2AFw8I7oxacm6kNXV1psUV8sj26QviW5djeedPC+xtRgd0zUnqej/AVIAaNMMIwQ9Z0
         MwJaQBt+6sXkNxAC1w3IjTNkcoB1uxvTYWAtUS0yyYefb3jhdqcQbjUR4/Vz2uxebizb
         pRPi+gi9UVmPpUPAo7ZLhSKzMmRoHyiCtLM5vo7amCwl51SUhI1wZfEmctLmVALdvXQe
         qQ/w==
X-Gm-Message-State: AJIora/h7ZwV5CqBlYocDdBuKNzBUK2oJ4GeKFnWXZH7UBlNSHpr0l2v
        YKYXCV7QNIQwmBZXUptSAx3Uug==
X-Google-Smtp-Source: AGRyM1sX6wnWSfQYLR7rmJdTZ6HVvtncDvqjZa67GMYZ7KLsdu4AsTevS5QLKu7RxxoHZxpGPF7nxw==
X-Received: by 2002:a05:6808:f90:b0:337:b3a8:ecc3 with SMTP id o16-20020a0568080f9000b00337b3a8ecc3mr1608538oiw.269.1656820625303;
        Sat, 02 Jul 2022 20:57:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:04 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: enable tri-leds on RB5 board
Date:   Sat,  2 Jul 2022 22:56:01 -0500
Message-Id: <165682055969.445910.14289246793199354999.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
References: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 May 2022 17:50:59 +0300, Dmitry Baryshkov wrote:
> Add LPG device nodes in pm8150b/pm8150l include files.
> Enable three user leds on Qualcomm/Thundercomm RB5 platform.
> 
> Dmitry Baryshkov (3):
>   arm64: dts: pm8150b: add Light Pulse Generator device node
>   arm64: dts: pm8150l: add Light Pulse Generator device node
>   arm64: dts: qrb5165-rb5: declare tri-led user leds
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: pm8150b: add Light Pulse Generator device node
      commit: efe9185c4e213680b7089931d0b7fc2a3416fe51
[2/3] arm64: dts: pm8150l: add Light Pulse Generator device node
      commit: 3e48f7428c1e8a4cf2477489d6d0e400c41df28f
[3/3] arm64: dts: qrb5165-rb5: declare tri-led user leds
      commit: bf3708c6734a4bc8e9c538fa586d798c4768bf3f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
