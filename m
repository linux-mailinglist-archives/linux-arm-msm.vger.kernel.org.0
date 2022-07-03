Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A52C25643DE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiGCD5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiGCD5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:14 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EEDCB1F2
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:12 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so8767660fac.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qTOyy2/JdFkkz38IA987tX7IhjzWIZRnBsxa6wBl+9w=;
        b=eTiTBfmlIiiiLB9bEKNxh31D8jx9vdzJWFR+/l2ziMFUekkk6KCHZTxFh3KBdxGVPK
         JI1kFWLUhKaxrUSnmQ0GazvEKv8NvrMue9cMTf4EVykXWEuuOb8n0jfI3qSVyytYpJsr
         NyE2DNjpxHjk3QdQ7vyGBRYIHWsFsMPXvAJRvBuEH2LPfQGsX1va7wgXSwChh7MmSEHR
         8bBi4SUuGH6RoI0cQvdU/hVMg7PztkwrU7QbI+l9teRGoocb9PjHUdpQib5IyLSotn1k
         t/zAcEGMiv09/te/eaKc2+qliZebetzFkLNErYknT4x2HuncE+f4H+E1clS8LqMAvHnB
         HIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qTOyy2/JdFkkz38IA987tX7IhjzWIZRnBsxa6wBl+9w=;
        b=ROyUEB6UmMhaCpGQEXp2sC+xHxsoyvvVS6XLqQVcxF66E3AVkFMr3FgymPFMvKeeS1
         KkLbFEGPCVy3SAn5ZSeawRpT+OCiQgBdxaiZzRg+nwduPZl/xZWi4YQntLriVHHa2rin
         lHy/sNHuDfTU2mW+h/rT8gfb5yPBYsdLEc/brFL0rW0J3V55Gno2DBasivoSJcAd1pw3
         fonEdU9eZizqom4FnF5x1M8Vg470EhDzBXHycE87HRmkL8RpF2HGaUh3JZyD2lGYh84H
         +VBXGbdzSHw8mm7/FnNhu12t9FVLpCa+LSFduzOGntHj5ZATakvx7gHX8XkWkQ3jNENA
         g9jA==
X-Gm-Message-State: AJIora9fYISmK0bAXyPm3GiyTPpkZ/SlGZmsXzioNoOoNOEF5A/bkAdw
        oj+aXGFtdYoP/vAPghgSwM6+Mg==
X-Google-Smtp-Source: AGRyM1uuFT49Kd/sKw0e0u57HrTsvy/iUrNBY7O7o4cq8JQfpP5t6Ik/6lE5bd9zL3crr47rSqq/NA==
X-Received: by 2002:a05:6870:7a18:b0:106:a2be:5644 with SMTP id hf24-20020a0568707a1800b00106a2be5644mr12830730oab.185.1656820632282;
        Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7 00/11] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Sat,  2 Jul 2022 22:56:08 -0500
Message-Id: <165682055967.445910.13864416753207164786.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 23:26:57 +0300, Dmitry Baryshkov wrote:
> This work is largely based on the previous work by Bjorn Andersson ([1])
> 
> Changes since v6:
> - Rebase on top of linux-next
> - Reorder last two patches to have bindings come before the dts (Marijn)
> - Add missed R-b tags, excuse me Marijn.
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy by default
        commit: 79d8e016fddfe0315c4b682a891b446ec748a6e5
[02/11] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
        commit: 7d8ee8e5db53b99cb522dd5126dc80fa5726aa07
[03/11] arm64: dts: qcom: sdm630: disable GPU by default
        commit: 1c047919763b4548381d1ab3320af1df66ab83df
[04/11] arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
        commit: 924bbd8dd60e094344711c3526a5b308d71dc008
[05/11] arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
        commit: 696dea7e1c3a568b125baee98bbf6b8db09a7afb
[06/11] arm64: dts: qcom: sdm630: add second (HS) USB host support
        commit: 8b6da22e6a44b597a0a4e2d60d81303090b6d24e
[07/11] arm64: dts: qcom: sdm630: fix gpu's interconnect path
        commit: 3cd1c4f41d64a40ea6bc4575ae28e37542123d77
[08/11] arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
        commit: 3a04cec9cba393abfe70fc62e523f381c9baec2e
[09/11] arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board files
        commit: 5e9bc1ba7ace0793b62e612eb48b7774a13e7f74
[10/11] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
        commit: bbd5a68919081d2fea6b0a6d6ab4c34effbf2847
[11/11] arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
        commit: 34279d6e3f32c7b2dd1192d8ba3e1d28b6ac775e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
