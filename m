Return-Path: <linux-arm-msm+bounces-86519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8CCDBC47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C8A6303EF59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1048F330B12;
	Wed, 24 Dec 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSrDd3j4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UF9rzksN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FC330333
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567263; cv=none; b=UJBNtc0SmnO2HFavF91YZlcG0UN0HXSxbJOguUSjeXdAe29Zm49lX29+GBKpmnnVTu8mSpS9aQAE00NuWLFEq2vgVNIm/sRDafRCro8X2Swx58OJDrQLwu7Rjl29QzqBjb/+7QChG5e/CwgzSy8lFELhov564xSoEG301GYRW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567263; c=relaxed/simple;
	bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxxQfR4N37zmuKFxg1V/CseguSeCKX2z+glexLKJcTiKrDJCn8NhDrLwc7HE1QzPSEuxZ7rlAuG8i0xt8NjqswTr/Ptdna0NNB8L/YL+W/jWio3V5hInx5lHFi+MVjpoyQPmCAmlbw2zDHA/06q42H3RkI4Ahr+2d1ZaPljTrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSrDd3j4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UF9rzksN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNL0vbU700440
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=OSrDd3j4D1M6iMRF
	drhYNwsm6BxjHnc+2o8SZUOKM5dsoq5nJTuZqu7/MfOnu7IH/UP268Gp7nNZln6u
	MrAFzOnChYi9gbtCN5XJFgDIhKX42mGMGxonm3UxGDlguhOpobY9dpSNwzTQ+3KM
	AYFAdPpA8V2Jgoypqd0rhj/pM/X/7u5vB1y9YAJSiPnWVHknrS6zGJ97OUB6Gsvj
	E5G3cyqHeVC1vch3h06Va54tlGpwo9GXHdI2q/9WVg5q2cXRvj23UxKl6lpLFps2
	92qkss3LHeZvO3nDdpMcB5KregO43FtA25alfaTD4PUciRf33s/S9qNrDTkbxH5A
	YrRUlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7ju8c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bae9acd4so54585195ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567260; x=1767172060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=UF9rzksNeFTUwS3itGbPR8HoFssSWYwpKWD7TNWhSvwXOzvYNRb+QJAqc+MlU42HGG
         rzfRUjHVTu9UyUHbxUgX3Thrb5D9TtMKetLf7wPxk8hfaN6KN9exNd9VlINZdg5Roauc
         HSfgEbcLPbM22hHP87d8BdzsTztQIlUxOgv2h6mIrKcY2D8dPJiorq9ZEouZJMLsLq/l
         AB37qmlv0XWi/YxR5w6dolDrJALSIIKKu7TfLulfHhKEzgv8xIm9sNsHm+8ABpK+AgoP
         RcStMjS/HCcANc/Mjb7CABF2uh5BfZ0F43CnhXcoulndd6L3SPctsLky0eVWm6CqHd8B
         jHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567260; x=1767172060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=PYzl7Za552g+XQD2UQHwZE49Ipv57RIuWwxYB+e7+NUMhpnLISzZo2wGYCuW2HXLxv
         Dt2aLbdf+R2ZIF3PcpG5Flf+Z20xwcmL9jrdSe92r9J/pbCTt1kdGHEZNvmzRltPCaWM
         tIaVxD2h24wJg+uh0Uy7LkIIH0sGVNhCcAhC+ypl3WVD8b9iE3OsmR5aJNFA/mtfJgp7
         DOzzzvxR1PThEsXXXO/h0iABznV9OkETMYDhQUMarsnx4wA5hvfxEwwIsQiLMRNFusqJ
         DWbfIq9ycxPEPd3XaGkjk1qF9tdvuIfAxs+h1kT1cbVcFCLJpmngPE8Y8GcN57BFAP87
         i6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVMR0aF+fq+bCEUhbrRxSnNi/w8xpBpJMQCE38pFPr88UXlqLJRCn491W62Er6zbZq9Jg/ar/lP+9bnpX0@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHg9h7He8LdXmKKknwD2/HSZ8FmlJvadj01GEEDPlGWbDJrQ5
	9Mtw1z+N1C2TCPRSXITuuD10ZKlggCBeigIOkBBo+oo6ME8jeIDYFCN4ShbMmjrii+o+W1OrZSm
	lOYb+CvmfMBpTmAe1Cyl7SYvx3p+EMMiiCqUvyT9FM64IzDkIBlayGtMtdMdYMF2IKfS0
X-Gm-Gg: AY/fxX56WgJ2QlJpJp8MwSwuqYYPc0PNI/pNqcubWAqz8MugD1T0UoC9u7hx/LVw9f6
	X31k9L+Xdb1v7ocFXXqe805ZXf7GVN9b/bbndLkFSzM0R68G/FJSz1gyy17Mavl6XWFix1eZg5R
	9Nuv5rk1s5ZL6TYB2Zcmfj0vW7j0AariQ1q2aTc2pPNi5LyNEdRJJvWt5SDkK+1jqyIDgeMeitt
	omgAqptncXnLYrJU9+eI2Sp5STsk0zSuMGA9jNGIVTcqChaNqCZbXOHXdefFmTtPaAe2ZqWXKS3
	T4Ki1k7LntgB/sO6AfrQkjWx5CibzTEBAh+bvDGssn1AP6I1iBfRkyuojQo0Gc03BXFi6odPKcE
	lv/ipL/b9GN+PS7miFJUT3Ee46c2sWcbfbqGqPlqrMJ51zlxZxa6zcm/pZuqGUM71T4UUd0xj
X-Received: by 2002:a17:903:240f:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a2f220d4ebmr190382315ad.2.1766567260058;
        Wed, 24 Dec 2025 01:07:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfndQQFrwSQmYqTWg9bPiFI4xmA7WAVtvf5bj4/YDmimFXEhX/VKCH/nn9DarFxK9sBxj5Hw==
X-Received: by 2002:a17:903:240f:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a2f220d4ebmr190382015ad.2.1766567259590;
        Wed, 24 Dec 2025 01:07:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:18 +0800
Subject: [PATCH v9 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-8-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=/7WMljk2g9bMwcAUVum+/8ImzjtIdqkJ6u3LAw/S1RhZMZQVJ9HIbk3/Y9i5dVhdvInLNMczD
 oObxP7p5avFCgtwV7858IVS3H6cwDqA8doPNQaq74IT4n106PqSnj5E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX5T1V8/UoENav
 x5wS6yo3YdneHYiHRcHLADwax5nUeVjiuvRyS2Bs8sigZyKs8U11Eh7gm+nuRourrJsIF2lojdu
 5aU5IV2v8V7R5UcpqSJRZb/HY6WV3uvH0NHDNhAe+WMzHwVipFHH4xj3VvmTzrr5VyWbMMJl9CF
 u72cXLN940Zhez9BglU9bMhpEdw+T5peIecNX32C22ZKdKgUS+pLSpXn5fDMfSnZDtYBvhSOTL6
 jxtIzXXNwB/GjlFyobRLpsrcmLYOFWS3Z0yUGXOxxPfdlUsAnitLsUayisW20HFpCr5EqIWA3BT
 5DTVx8py/QxaasfUB5sa5subAfgNKib+UWtyyFFsz1MFZ7vqnVjJbj/iQZrgWpO2TB5sQgVQb3p
 +x5966PBi/iadg9R1cnJ6dkfu8C/V3sl/HNURMwqNgLYy5LqjG/sDTozFpW8aZIQutj9GpwFQnn
 PMsblzz9dmgGUaSdWIw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bad5d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DUsqbbvBkGu8e6RFi4gd_y8OzHJ6uc70
X-Proofpoint-ORIG-GUID: DUsqbbvBkGu8e6RFi4gd_y8OzHJ6uc70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


