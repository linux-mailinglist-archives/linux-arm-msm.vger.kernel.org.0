Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666BA629A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 14:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbiKONcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 08:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238338AbiKONbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 08:31:42 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF32A2099B
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:31:30 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id f27so36088707eje.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Fov8iE/sdW1px1P+pOp4rUXG2qai5ScCDQVqwGHb0o=;
        b=csl4NTIIDxeh8MyyI+Ga/ULew0VG/j57aFAtB8Mjx8NgO2yoy//AuyswpL4h/hRKXf
         3gjn1bcuwulVoldABTYrOl8XxGq7Xr3L77R546yQGRykoR+4UWpv93Rh3wVcxmzMr6GS
         YHuw5G0aDXKKEm4P65PpUVaTmLCylxhunwi4BXOSAdlQl5VLnX66Et7MNoifRZWOiHhN
         e7SGHEf+fT/vYJshKcpbxpJVROcx8qA6Z3SJ7kYuySljtBQmtVbQKLuNmWGce4qZL2Ew
         BSCe26tX/OfGGg2gmGCAFpzM/lEXRFi0GKyTH6PKhZBQossvMc92Vh6VJdrXASMwqHeL
         x2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Fov8iE/sdW1px1P+pOp4rUXG2qai5ScCDQVqwGHb0o=;
        b=04llKgKCrm/3hTYoFpanNfbAD9fYXGZpID3R48RHUDEfvOw+HM/SBRcI8pYnuRidWj
         6FemLslA7ibyjUt9/GlOMRXP5JWyiI7wmUuhzP+pIboXKEimNRtc5XrkEMDM3FKyCOIB
         JcYdWkEeFyT8pZe7TitZk8/to4p7XZ8bimk2nFpoZXWBdqAtRDm+UB0lxFJ+XBuIcB6Z
         ZePODw8gOpA3j7vP+FjbHAHpEr2x46jhtHjOWuSMQqMYU1Ne9QQ97JL/WhcdKksnirGP
         amuSQ40gePFNrFntMsZ0LBzmtl97TZM96CMn8w+ccz7Y49FfoPdJI9ri9awZatUH4WQt
         w/dg==
X-Gm-Message-State: ANoB5pmVwTG1uhRsY1xA7rZoXL1rtdnnlpOz2PLaigAlOpVRAUOz6zU2
        Vvy9t4OtZY+BMNTbG5r/MyZ9LA==
X-Google-Smtp-Source: AA0mqf6/2IvtQ9tyYDU30EBz5bwd3Og7fYNxlk9thXt+BmYji4UroSU1/DeLM42jZ1SNFLkKsR0Vyw==
X-Received: by 2002:a17:906:da0c:b0:78d:b43c:81be with SMTP id fi12-20020a170906da0c00b0078db43c81bemr14106931ejb.600.1668519089264;
        Tue, 15 Nov 2022 05:31:29 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:31:28 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        robert.foss@linaro.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Subject: [PATCH v2 08/12] arm64: dts: qcom: sm8350: Remove mmxc power-domain-name
Date:   Tue, 15 Nov 2022 14:31:01 +0100
Message-Id: <20221115133105.980877-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mmxc power-domain-name is not required, and is not
used by either earlier or later SoC versions (sm8250 / sm8450).

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index cbd48f248df4..805d53d91952 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2558,7 +2558,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 
 			power-domains = <&rpmhpd SM8350_MMCX>;
-			power-domain-names = "mmcx";
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.34.1

