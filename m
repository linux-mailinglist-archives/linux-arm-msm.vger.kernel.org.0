Return-Path: <linux-arm-msm+bounces-10416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED884FF40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97433B26AC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5691038DF1;
	Fri,  9 Feb 2024 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xinAG5Ei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B03839F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707515444; cv=none; b=pNyvx7RmZsOzxO1/KdeMxgyDhhW41idAkFZwTarlWdGteTBSnKo5eEsEuel6VMzKqY3H/1/Zd0lsw5itvi5k/gtkm/diNtza9wciDJE7sa8MCjHn8kk0xcfTM8ZDjCm96CJgHt/jO+P59x9mK6I0CL2LhdYpDj0AKhEg3zGG3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707515444; c=relaxed/simple;
	bh=74MCy96nF03W7EAJTz2PT10B7QEkB+SqtG1CDRc9HX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8wD3Y4bjSvjSN+rkMRsn3sf/koG7q5fJkMt+gdVi+oH4OR6nyDCnC+iB3ctTay/yXf+toya7KAbzTQEYSqIWBYAwWVvZKw3Qmjyjtc0rp+cI95A8d1+blyIrPLv+YtsGX18tt9olaTZyMNawPsLnjkbpZx8DJQXHrrt2XoecO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xinAG5Ei; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d073b54359so18784411fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707515440; x=1708120240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v20cGtgi8PVpPVdnThFjD58lzld+LA+T4nI6IieahUk=;
        b=xinAG5EiKQqnaVxnBCwJMu0k2ZRT5VFIblSkehdEq0AkNJtXEbj5UNFOR8a0Izaw0F
         LNU8+wGe+WAjrpWwSHI8AWaDijbVrg8WxSg5d9hwjnc2HQcwZDieqrw5Kf+JpSjXxpxy
         3y92alrJva+EcueT1LbXUUuYf2KSVWP0QU+M/5sylD3L7h+2dFTBI4O69aLy7ui/8D/A
         Xuk+OjG0J2RUEtlCzq0OOc49v0rojHaFTQIFnD1msVQqn5XtMVcyrFGZDduYUl6FTnt7
         tOgKZFnXiZjodWnnK3xADde5LIeZKF/EKIBkda6IqmjNOMDH5Ctgc9cjeHcOnGEXd0Yd
         dnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707515440; x=1708120240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v20cGtgi8PVpPVdnThFjD58lzld+LA+T4nI6IieahUk=;
        b=UWAoEl0Jz4F1fjWouMpSpJT/m/XURtcgaPgnkDS4WurN1f6fq4xXUmcSUN1ww90B/Q
         cu+aWVTdoI/9ZGemxnoMNTX4GRtA3c1FQuSvQGI5DqALT+Cw+AZzJq+4Co65fTytldHK
         k+VwgMVrzugCzZAciz1EvhJSxQI1boe+PsweiBbf6LKmgcbMAF+eaPKjEdMCkboUAqKk
         5j+xfj3Vl1TJouiXOnG81Gyepkmi2QwBpFfDlMZ8Yn6IZTsfls4XfFnm0M/Yb8bjkAtD
         qPoh6HAg2GZSrH/RFWgF9oGI2K685A6fFbX4UGq3Z/bCU1WVR7s1FnS/769WPuCvrT8D
         qh4Q==
X-Gm-Message-State: AOJu0YxY3p5ZV+8Ji8guvrCa8MPxvkJ0DInYpYFL2NiCeJJynKjry0SS
	8FYeTsBkmzOzq+0nv6cm1LYvSDrR7UFx/lwJhF2r13B/GrERgR3k75iyccdn64w=
X-Google-Smtp-Source: AGHT+IGVOM4JYXMSQBQEWi4mjU6HTWulEOLVqsiC6pwlL45ECHXhHKIE2cNtxQxUTg9k+481ofY64g==
X-Received: by 2002:a2e:8884:0:b0:2d0:cd24:24c3 with SMTP id k4-20020a2e8884000000b002d0cd2424c3mr155994lji.53.1707515440667;
        Fri, 09 Feb 2024 13:50:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSDVrhLuIic87LKe8KhZUCIZcaWQiQsLS690R6xfrOlLzh85+PVdRgQh3iOt6PsrtNNRuEZE9vJeHm8rfE4OJlVOjtRRgL7tws5m5e45D7xNOXq2o1TErLhHTGuAB0mp/WM7dyM7WBM2SXpxj5d1GlEPkECWWiKYL/lam53AYUSBYW7Q9KlkBIrteDIoN/hrRic2mVqTZGVeP+HBvIHcaTVUey++KN+UsIR1q1rm/+B0wGHNPlxibQW7NN+O8IG3XT4dDwd0kIRyFIj8mMwnpSaQQKVgyJy9JbsN6JgnTxhK/ctKKed9dvWL9O0DLQfCh/RA8EhVd96q6tCPzacJf443hDOaxH5BLe8wvjmJ9Pg69kgEXBIFP4+65XKDKq8gHuSfbyaZuUGDt+7kTImyyNO0/vt3MSjlx3dy3SCawKakGAkALtuBQJ0C0BQzRGdAD0C79PIi42n6GFlPJedPY+qIRFafoU1xOIKXx4J0bAvJWJQOI2tI80DLrzFj3hCkWhjEn1tvFaNb5Hhsq4/aV3axdTC3Ixyx0KM+W/BN+94CH/a6o6C8nprkNOKDZIBhcinGSyqk51uzo+lMC/N92f2X6PVp6gb8U=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e2d01000000b002d0ac71862csm391162ljt.9.2024.02.09.13.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:50:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 09 Feb 2024 23:50:38 +0200
Subject: [PATCH 8/8] arm64: dts: qcom: msm8996: drop source clock entries
 from the UFS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-msm8996-fix-ufs-v1-8-107b52e57420@linaro.org>
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
In-Reply-To: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=74MCy96nF03W7EAJTz2PT10B7QEkB+SqtG1CDRc9HX8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qxeZoc8focG91fuD+QiwgTVXfYLbhfe8ah0En9E7Tdd
 2eHs5zqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBFvNj/cJSpqqwrZ7xzo1w2
 50q+6cGaxe6ChiynXr6PiT62e3qM/wze1yInZWtf1PqcsdIU5fM/ofFlR4fKI2u5Ezeudm3yZv8
 9zT3cWGjew1ePOyZwrPvq0lhk65xpU6jq92/nLoHa6rRpB+YWh3FpWC6xYav1PqK0UmjTO+X0zE
 7eP4IP2gLfcpsVXrPP1r/cECD1TruuoPXrNnWGyS5CzefP3jBveK3K2nth1SRZ14nXohancVaue
 RHBE7fp1YxH+6MCn/Y0dCeer5rCcOno49g8n2zpedfN57y9fz3LpmCV+cmVnPcMLpsy7JtWeD+6
 9nbjxxjWdUf9yudybkl7sDN3zn7+n++8UpRyo7YF5JYDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to mention and/or to touch in any way the intermediate
(source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
the example lead by all other platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6c847fdff192..fc44979d7902 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2047,12 +2047,10 @@ ufshc: ufshc@624000 {
 			power-domains = <&gcc UFS_GDSC>;
 
 			clock-names =
-				"core_clk_src",
 				"core_clk",
 				"bus_clk",
 				"bus_aggr_clk",
 				"iface_clk",
-				"core_clk_unipro_src",
 				"core_clk_unipro",
 				"core_clk_ice",
 				"ref_clk",
@@ -2060,12 +2058,10 @@ ufshc: ufshc@624000 {
 				"rx_lane0_sync_clk",
 				"rx_lane1_sync_clk";
 			clocks =
-				<&gcc UFS_AXI_CLK_SRC>,
 				<&gcc GCC_UFS_AXI_CLK>,
 				<&gcc GCC_SYS_NOC_UFS_AXI_CLK>,
 				<&gcc GCC_AGGRE2_UFS_AXI_CLK>,
 				<&gcc GCC_UFS_AHB_CLK>,
-				<&gcc UFS_ICE_CORE_CLK_SRC>,
 				<&gcc GCC_UFS_UNIPRO_CORE_CLK>,
 				<&gcc GCC_UFS_ICE_CORE_CLK>,
 				<&rpmcc RPM_SMD_LN_BB_CLK>,
@@ -2074,8 +2070,6 @@ ufshc: ufshc@624000 {
 				<&gcc GCC_UFS_RX_SYMBOL_1_CLK>;
 			freq-table-hz =
 				<100000000 200000000>,
-				<100000000 200000000>,
-				<0 0>,
 				<0 0>,
 				<0 0>,
 				<0 0>,

-- 
2.39.2


