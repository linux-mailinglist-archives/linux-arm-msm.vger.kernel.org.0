Return-Path: <linux-arm-msm+bounces-33461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AB2993B4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 01:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8CF28553C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 23:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0F01991D5;
	Mon,  7 Oct 2024 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQwh/ook"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4450F193099
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728344235; cv=none; b=rn/ohK61M51ZbiVlMiPjudM/vha3uaKUTBUohg5xiv2oBay5vIDxKQuEEe3G6w+TGwC4UTNNyK+7AYJFvE4SGxQyhUUPpjG3DAbnB1XRbf3z8XJyNUM25OuJW1UkNWaXh/OzDBv9B/EYGTkjs8F1UD0FZwPeuqfv2NJdxcH/5yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728344235; c=relaxed/simple;
	bh=znBSTsvoia8jtv0vOla1luWvWrIdThhCQ3A7+DTU46M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AANHp1wngBiNW6B64xn2x/bMNMw0YkJUN7fT+O5iMlQoWBD/vka6BRE63TQaXsXDIXDTe5MGUA84ndvx4DwU7/X1cyQyzdxMrSxK4sqfcoEC3hDpQMfWrBbR3lOER9w02vPINGLQTuTJ1JUZo+h35BXbISCia4B4VHvnmHM30EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQwh/ook; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398f3be400so5648741e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728344231; x=1728949031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXGWJXNTWFyBHQiOjJ39OoJK5jFoxYtKruKryESO2Ts=;
        b=QQwh/ookSzrN2JWieKZKMgwx5n+6VbVZMslERL3U5lhWXR011dwB4pf8gabMyMBSn5
         gfUounsKUTYsw0h25X0y1uLep86ZCHgBQhun68OWDrAfKxwv1lsS6e5YkSFQaVBWgfYp
         fKk15azQMKIA30/h9lQid6UeNhT2ULjTL+bSXrA1sVGNhi4apgxwaJXKSysIuNNOeqQA
         FTq7Iz1GluACSutQwrhtJwHbCt+et5vxW1s9LulUvUYQhatbTGOey8NO7s1jwJk5T7nD
         JaWqjpUI/kGXUanpKB3okSX4IbJcCYnU9/OrQWk/ZY4pp0myRyeIBLAjrjlG0Y1ZMGDo
         pDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728344231; x=1728949031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXGWJXNTWFyBHQiOjJ39OoJK5jFoxYtKruKryESO2Ts=;
        b=IPIuILDvhfTJrZUbQz0R/X1/s4iAI+IuVz5kx4ZEn2XXPnXSlF1V9UlSCiUsDjwnLQ
         FDYZtgNioSEynVQvFZicBgIvDw8kbl+hATmH943uH/+Zsi0qXO+67ic77ipDORfBLRT8
         owmHjuMMtdIvfCvFUkxbDQfxOPROxxQEnaENiZwz30BhqwdWupJOW/bnPpPeutkoUAXO
         U+zqo5Vl1CNnhtP4bjt9bycAR/loIIX/ELsX+7apbQ+BVhYGJRM8/dbR2zcCCBHAYtIa
         kR+Fi4f539hdIZS0P9oFqUdccdchcInnZzTLbym8QXlZ0o8an2jiaYf4ILKPU5uI+BNx
         0ubA==
X-Forwarded-Encrypted: i=1; AJvYcCXnveCyXoYraG2tu5Ax7cIGfBYz96diufWDwse3vItde8GDeIGd77Gd0UtvtIaHoEVT88Gr5cVKVbKDjHP4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdKR6kfddbFWAvf4G9WNL0GKfZFocAMK6x0WTU/ku8Chn8CtG
	e/W1GXfVCWygd/gwOfMzHH/7Fhs3E95QaVvl8gm+Bao8/O0YkHUokgOqNaQHCc4=
X-Google-Smtp-Source: AGHT+IE+4VzcRhbm1VFqYCLGq2Nrkh1v+z8RzQxhbXAwdRI0uxpOV12A3qgzgle5GzStCLctDb2jwA==
X-Received: by 2002:a05:6512:b14:b0:536:53f0:2f8e with SMTP id 2adb3069b0e04-539ab9dd5f6mr6662392e87.37.1728344231168;
        Mon, 07 Oct 2024 16:37:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1300sm1002256e87.17.2024.10.07.16.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 16:37:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 08 Oct 2024 02:37:00 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: correct MDSS interconnects
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-fix-sm8x50-mdp-icc-v1-2-77ffd361b8de@linaro.org>
References: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
In-Reply-To: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=znBSTsvoia8jtv0vOla1luWvWrIdThhCQ3A7+DTU46M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnBHCeZFq3YI77GP+xE8vYq8jrRhjgLpkER4n3s
 EJe/us/uoCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZwRwngAKCRCLPIo+Aiko
 1S+ZCACjueCogk9kziFFtp2pQBwNgoEJIQOWFaoFCx6WssaAdkVv7aXZZB9N9+b8VXHEpE2XPfd
 bmvT9i3GzdC+IxJDCl6EjWpnP6MRhvvu+eZaBaIZtkr+MrW+o2BsXiHFt+rcwGzu6qiU4Q1iWYT
 N0jvH556UF45CesUsd/Pjr8oeL8E0ASt2e3/V8NTiujHTAoBUdEsOKvknFW5k3ZPWEA4LgpFYPS
 vXUn6zzsTVsuz3YXzGsuiQEtvrvSpfvENMd2JTix0FNJqLIN9iFuXd7mqWkzCBNel66CHeBgsqk
 W6kyjEqsoVwA/oQxEnmlq1+uggMQ14WFVo+gCL0TaqKxBKWS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

SM8650 lists two interconnects for the display subsystem, mdp0-mem
(between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
The second interconnect is a misuse. mdpN-mem paths should be used for
several outboud MDP interconnects rather than the path between LLCC and
memory. This kind of misuse can result in bandwidth underflows, possibly
degradating picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop the second path and use direct MDP-EBI path for mdp0-mem until we
support separate MDP-LLCC and LLCC-EBI paths.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: stable@kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa6..455774516b08 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3455,11 +3455,8 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
-					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem",
-					     "mdp1-mem";
+			interconnect-names = "mdp0-mem";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.39.5


