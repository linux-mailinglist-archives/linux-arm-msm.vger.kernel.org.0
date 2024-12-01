Return-Path: <linux-arm-msm+bounces-39766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6CB9DF5E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 14:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA61AB2194B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506911D2B30;
	Sun,  1 Dec 2024 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER99qdtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA901D27B9;
	Sun,  1 Dec 2024 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733061441; cv=none; b=LtnwJ3HwAQ0KNNcFRq/3pZTQC9gF5pmw+qj5fu6rvi5C2ynbyHYAh+Ok0TgBvu1afRABXBJ3DX3OjWq+myMnQsFT8k2fRTDjXU3zuG0bmxKsZfblTcZT/6Rguky13GYGmRGbZU6Igu0u1U/mdzut1KZgkJuquY9gLFmPggDrOWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733061441; c=relaxed/simple;
	bh=iGOS0BxMkN+goOQ2G0G1bCT84brcDpqwOAacbt0Gs+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNqYFxvmlKlVDCP6yKNaSuuvTF5T4x5Wlzg1W5vlK6rqaYIWlJNI1yxz9nU4pJODz7GJd4lCLmSOZVIeZ4g0eIihIOwnRVRq87DbGRDHQzzBXx2hfPf3fS2nGfVzCz6t6DXsHd3W0aZdOh7MtXV2jlSHAI540AMTZGCzThbQJ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER99qdtM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7253bc4d25eso2160429b3a.0;
        Sun, 01 Dec 2024 05:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733061439; x=1733666239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSi63laDVLde5pIwB6wSgBpmbCeHCRHr3UINQDkHQJQ=;
        b=ER99qdtMi4kEWHLJgiUVFP85qnwXkRLUOaFcPG2n+0SpKyqaRW43NFGwnkI+sj5nlQ
         w8RbFmCjIyNDifbd2lhyTjMyjrmqoPjwqxaOtQI69D7PkN9Ud1JrcL3uflyvLv/iPPrq
         iyHtOyGqFuG9yfqDBK9z9zuFpzghr7c4gUpeJIoyBrHyQ/veCKHjTEGbPEIGnTcXyiun
         0TsNKTGiWooLWtR3lZl54eEmiz/IGsCORtKcnWy7t1YkCpGFuwMxs9ygoGevCb4phfug
         CvQabfX0LTnR+smTKsVOXx/5Q6ak1CtXn1l1IwuHlXLeegjKEU1J8HQQzTWfIHNLFztq
         j5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733061439; x=1733666239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSi63laDVLde5pIwB6wSgBpmbCeHCRHr3UINQDkHQJQ=;
        b=IgDM9sff5tHX+C2hQY5KKM1CNGkhGJP6NfN3R5b13Ms9amRtrafSWCW812sEjbsCHS
         oQd1N/COIyYYP4wJw2HLzy0vxHI/WETgxRV+0oUFG/YXDmRXepA77UYX+awS4PFzYDP0
         moOlfbrIf7xKG/Jvz8NwcaoGnb2tt4Od4Qsv5dGll8pC79OnDcdV/nDbUo2+ACvdjzz1
         2exc9EhpgdyCGeHn9rzZ2sNO7SBN4aWY8/E8bNZcXPf6+ilf0x1heCn0SaMler6GsAES
         CBMvwnKvg4pxEizFxalrEe1S3s0NaVHbeMRT4OncR43hDJhMC4VzRPz4VDVhCnBl/oMZ
         gHdw==
X-Forwarded-Encrypted: i=1; AJvYcCUoe5UYx54xG9jwlcFeFGGVnvXCIlfr10J1h1Hf2x8+ahXkd+4E1BfRY1O6tZPUBbIbCI3qs768MJ0f@vger.kernel.org, AJvYcCVT4sh43dyNYzunYUjqnblBaj0oVBuFa4bmTq8uKtosBLm8NxHVe5W8Ltn4Od70oNwcVBrKC6EhOFUCrx1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tQIgNLEGvouGd/wCtjXi+8RYJn4w03zgydlvJxtRYLTZXbHW
	uo9f+Izy/H34HShpg9mFfMbgGnMK4f+SbA8QKCz26yk+iSkGWptB
X-Gm-Gg: ASbGncuU66IAISxcwSwrHZBDZaKx19aDocwzy36uQFWBu1arTPd+7vWmT3Fcs9E3ror
	h6R+a9XfAiUWjiwfNNVbsnPLFnqbIFBoe4PpGjod/1piV96dsRDIYJuwpo9msCIj3WzfoQ1JbTM
	kc43gJ2ubiwWZBVDoxO87o/Mim9E/Kf09oUO10qzOqquB3gN1PnD3UIwi6g9tSi5yH2gHgP3LPy
	9fXe6PA31zHGyJ96liR6qHOGOFp06c31NTkCx1wuAOP9qaaJGJ7yYN2TtEa2VRvEbzP
X-Google-Smtp-Source: AGHT+IFaEuhkU4qR7aHB0uV1Ch6t4H7GsWfvPfZ9GTPabcTVWYOp6CJKYF0f3EY1mkzg2xv4eosLWw==
X-Received: by 2002:aa7:93b5:0:b0:725:3fb5:5151 with SMTP id d2e1a72fcca58-7253fb5528amr18770034b3a.12.1733061438923;
        Sun, 01 Dec 2024 05:57:18 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c30e2d8sm5260617a12.38.2024.12.01.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 05:57:18 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Sun,  1 Dec 2024 21:57:16 +0800
Message-ID: <20241201135716.141691-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241201135716.141691-1-lujianhua000@gmail.com>
References: <20241201135716.141691-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bluetooth node and this bluetooth module is connected to uart.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v4.

No changes in v3.

changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 7a55e271c3ac..100607da42ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -30,6 +30,10 @@ / {
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
 	qcom,board-id = <0x10008 0>;
 
+	aliases {
+		serial0 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -799,6 +803,21 @@ wlan_en_state: wlan-default-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
-- 
2.47.0


