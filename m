Return-Path: <linux-arm-msm+bounces-3712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C898088DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6AC7282720
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD4F40BE9;
	Thu,  7 Dec 2023 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYz6isMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD57010CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:11 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50c05ea5805so788846e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954430; x=1702559230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwm1Y1yKYRC2h+rKhVRBCueR16O0EXSdEm7pH6xao2g=;
        b=CYz6isMC4XqKxXl2Izr2XBttNL+qp6C+gbDxjxxCAF5Y7XqLnKphXNM4MhkLL6c6ig
         TxazQVBh6VsS174iWamCB3Vc8PSe7gVhPXKHR9t6fyl6iGXkF2GCo2dzlFOJ4UqQPMnr
         q3F5Il0TULRlQFk3XGj9f4YsBpsVLa4A+bhgLWpYL4z/UOVKPLE6SJ/dy2EkDJd8Xs2q
         zbTDQWfJIXp0/e/6c5HfFuoe2z4YaPI4Z8sMBj1BVHUbzdHC03PAdtX6g+moAiykO/kd
         xEo1Pwc38jU9ef7/NtKPkO4tZfhlORzQfbgp9co1dcoGCx8TUGZexVHrhdXDSXLHfL1y
         Ejlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954430; x=1702559230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwm1Y1yKYRC2h+rKhVRBCueR16O0EXSdEm7pH6xao2g=;
        b=OI667vhqoTC2m7C3HT5/NDI3pfD06dMKHM3MalQOL0qFxEV64jFxUZIiX69KtXvmQX
         QY4FXsJhfpmSETEB0078zGAqbMSRu9AWWUCzhgj5W9GGu//ghtnYToIiiXtFXQ2COV+J
         U30TFi/HQShHO9ixADnp4y1jYOBkhbvsQ7FxPs5FQtoQALW32TZ4IRDJcxDlk9l895Ru
         RF0YMRKzGIZc035Hm4N1yHmMfp0/tHo3yddILzW0tTXBsKvN/H4ZvDxaCgYQTsXvk4iw
         AZljgMG2GURG4cftn0GNrouG/JuM3w5xGbf2QEGonoFv4vPfxDygmY5HN19df96fKcjf
         SB2w==
X-Gm-Message-State: AOJu0YzDxyKZ7lKvwyF9POzZ/9yutR9cfIMJXYby1ALrdEY1eoU7igfA
	Ra2Xvdxg53sBxMpcIFUm1WV1eg==
X-Google-Smtp-Source: AGHT+IEoYiX1iwS8glqG1IEYAQZrBhn9TOIMfG304nXtZ9/ea/nUt3pFlT1VP0RjtnpyvZpCvWGnPA==
X-Received: by 2002:ac2:4ecd:0:b0:50b:f15e:3ee6 with SMTP id p13-20020ac24ecd000000b0050bf15e3ee6mr1658642lfr.13.1701954430111;
        Thu, 07 Dec 2023 05:07:10 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 07/10] ARM: dts: qcom: apq8084: drop 'regulator' property from SAW2 device
Date: Thu,  7 Dec 2023 16:07:00 +0300
Message-Id: <20231207130703.3322321-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator node show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 2b1f9d0fb510..24bc2cbfbd96 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -652,7 +652,6 @@ saw3: power-controller@f90b9000 {
 		saw_l2: power-controller@f9012000 {
 			compatible = "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
-			regulator;
 		};
 
 		acc0: power-manager@f9088000 {
-- 
2.39.2


