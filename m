Return-Path: <linux-arm-msm+bounces-86549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B42CDBF43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1AF3300647A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6384A25F98B;
	Wed, 24 Dec 2025 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8PxPkYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGvabVSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DBD283FD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571635; cv=none; b=ZByEpHDzGV+4heKsBfOlDVGwvscuXymq01CCOYXVmpfrnBM6eavdt4vgd7td+2yEzL9bYRxDPYATYbVLuchiYG9qFqjLMeXZCxTO0nA5tut7DIDMhM8lMXZDh/NwCUbp+xMHnpr/TDQg6J1uMz18vBIJ1SIaeL6lu+d5lpM+XfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571635; c=relaxed/simple;
	bh=9RmhvMyaZZ5e34lSfaxzMXFo0arYi8LVGWz3MTD5+NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CFe2AzJXe91YXtWL7yMkg6VqNvhRa27vpYvEKCckUtvk6LWP/Whet6aEpBtVn97m0eYzKX6B95G/HrsdgMwQJn9wXLw7MV51QaqW4Dcdf7aL5BviXczRo7ISbP8gn7UVI177/DxVskQoHVdNVrPXqwu9ETLyEOcv6oZEpyCXXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8PxPkYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGvabVSL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8PClG721286
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HpLnN7aPK2c+91HezIkwL7
	2d3oosY+si26VN888iGvI=; b=k8PxPkYdHyUW/g1E7XuDpxpNvrqpLpBTOvcoLB
	rnJnluw6PGn13154Yc9TjkmSYKTtdfUgfsz4M5/SLE0f0QPrUPrr3DoRJiuaQYbQ
	x96eu9v/Iwgvd5/g0RjnbEzbdu1G/+K9fxEFAsAfk2RsgJU+QjfxI8yT49ARM+2X
	Pa1D6bY6v9At9kH5VnO8AT2TJb3GCGuVB8bAsUUY7q+MiqwSkSAGVSZZ3doWY3a2
	4UcFTRGf8DX3NGrLECkE3eXvwXabMFIX5j4g6h1zg4l/M1zw+fiwiqKpGXtlO7oD
	wUvp2t2NZUhy1UUuTWaLo/BnzAjBzUko/hWBWfXCBDl3zcTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9x8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:20:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so68835375ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766571632; x=1767176432; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpLnN7aPK2c+91HezIkwL72d3oosY+si26VN888iGvI=;
        b=aGvabVSLiuVQGmKwQKghlQ/ZutN4dJVF+05P1flIPDhLtFqFjugYD48/6j1Fvr/L1/
         SXozOFZkzU7sLMOWn0UUKvqWLH9oSyi1Y1Z3+VA3Vha35B6uiqmP0s3mhbKEe2ZgMi23
         wijEHWaeFHhUfYP3uLXBSHxmpFBNUrpxF4OEmdcMylPYfYUl3dsZmlwlw2fiG/QacYZz
         PJ0ZE/r6xLewhggBYKns43phTG0xw7EO/oohX9IINj57SLz+AVpM8XudKkh/lQNptFV2
         LEwA5wyW5zETY02e+bMP0SzOwh3bn36shkv8M8CsIN+VMcPrQnSwgp0Tl/ZA4QOoo3wV
         gLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766571632; x=1767176432;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpLnN7aPK2c+91HezIkwL72d3oosY+si26VN888iGvI=;
        b=cxFUsckoystGtjiJMsKf/EKp5C7nx1P9obC5wIc+pfoXaVJpRDnwgveLX8f9KB2hAn
         pATxDTj6+JrX723BBBSufSsFRCovZSZxCJXJYIebWXQxtRnAT0xyv/wrnuL8UeZPZIMq
         JYZhTU3borHC6tplr8PmyAV3VU8ezAc2rLGcVaHn4ClZireIDhDTrExmJvuVUPCpVc/N
         QeW5UjsWJ2/et7AcNUxqe5jw5w96j5R7RhzGpHJiahFl3MIzHEJRdiqSAQivAdZHFfMm
         Zwpr+IeKydD1C0yitfApUaCneg4/Dl4z2LAorS9ddgwlNBC2lXmdi2/6pUdRQqvppsw1
         e0GA==
X-Gm-Message-State: AOJu0Yw4nhmxirGu/vcyonLxEiY2+2+KFgGOw2MTtXDLPw/xusP4PhjX
	gmS51THC2c+UpQuDjTrsEi8XJVERwjxhAqZ19eqtAe3f6u4yOpU0/1Bec+nLTxdY1ju36AGk3xg
	UqbdPIU6oEo7hsyBdkEl0uDD5ZWgY1DDLOjQX2k2QD1iW4O0PxsCAdVnWaLoEr7KgtP31
X-Gm-Gg: AY/fxX5jkvxpkFyQyftziZyp4mO6B152gHM8M0sKuI39XMmuRnAXSTFteEaR5LFbygL
	qK7z0YOtv4zrBHLiNuctGT/ayrX51iYDVpqMGFOKoQfeYUN7ci2V1eCLgPvAYhoharPH7zBMeUn
	kh0IfzTz2wZSuoD7VXHBC3nUxzpMJ9irOizMKLwQ4nxXZcjh4OVcRoXTtrpt0NijNUQCDNkpFrv
	zw6akKuyGK6CXU5lvs8y48r1Uyheik3ayZ7KQvfzcNZJSI2JrNpbbIK+YOendC3nOHCofxjTVVT
	SOHdR0FL6CXtSjnUz5Ug46OhLYsEVOLxqgTbCXXO80oHnjhe5FBh59yVnLZ+jFjav+4mS+4EDO6
	0UHWu8C3V6KiBziJciN+U6PU/TCCRGWg0LdqjXdWmB4QhdXc=
X-Received: by 2002:a17:902:dace:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a2caab6e40mr199822485ad.9.1766571631593;
        Wed, 24 Dec 2025 02:20:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaEYLB2rKs1wQB4ymJi2MCOdPUTqckXuQkeo584DrKSI8kymNPiZTmkBcFqCvMhXNNDJ7pAw==
X-Received: by 2002:a17:902:dace:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a2caab6e40mr199822195ad.9.1766571631097;
        Wed, 24 Dec 2025 02:20:31 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66473sm129685195ad.13.2025.12.24.02.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:20:30 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 15:50:24 +0530
Subject: [PATCH v2] arm64: dts: qcom: lemans: add QCrypto node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-qualcomm-crypto-engine-for-lemans-v2-1-a707e3d38765@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGe+S2kC/42NwQqDMBBEf0Vy7kqzUZCe+h/FQ4wbDWhisyoV8
 d+bCt57GXgDM28XTNERi0e2i0irYxd8ArxlwvTadwSuTSzwjqVERCCvm4HgvejBhHEEE7dpDqn
 unCewIcJAo/YMBUpFVYOqLBqR7qZI1n1O1atO3DueQ9xO8yp/7SVR/0tWCRIsmspWVFhl2mdgz
 q9dnkLUx3F8AXnk0+rnAAAA
X-Change-ID: 20251222-enable-qualcomm-crypto-engine-for-lemans-4213e8b2354b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bbe70 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=w4gSpCwTmaNIqBQonZ0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: UXrlF2F3ncR5v6fEOQLnipN1fLfmKesN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4OCBTYWx0ZWRfX4KKRB+w50fYF
 djcFZi6kO3Y6I5/V8wQ9KtoPbi8LWKIgAjZIxypNfv3OzzCgF5x0tmpEyrKbYNv9aE168TatD5y
 ZR3wGj2rp1Qe7Z83YAMousSpooNPD3yb/Ct/uLdXpqjrNHl3W6D5HL2/wQ+CVOSJNiyO65rbOQV
 6RpkXLuD6uxS2oBpY778sA3uYKPNPGB38+5HK65X4AoM+WkAqu31rBVjNDL1OPPDGPZF628Bu7x
 gn0bVh5fD9qtDCNbIUAjpNGzX8FM5NG+mRfxP/dhAapvLS1ARp5Kv8OUrOLpu3fX+lSYbsfXH8V
 NR0eob65d13ZVV7cp7L43O040Z3ZB4bPOOZZczTl+nsp93oYIW8NABgd3/FnCvh0dM7qXvFpDCp
 UtJ8dcMaBwr7bdLitSc8HcqxGaM++GcBExYzoGXHcIrz+nbAsBD+vY1Kp/e8RRgXgA9cCcehPIk
 k3GZup5Q656RHIwbRUQ==
X-Proofpoint-ORIG-GUID: UXrlF2F3ncR5v6fEOQLnipN1fLfmKesN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240088

Add Qualcomm Crypto Engine device node for LeMans platform.

QCE and Crypto DMA nodes patch was applied as part of the
commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add QCrypto nodes"),
however was partially reverted by commit 92979f12a201 ("arm64: dts: qcom:
sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"")
due to compatible-string being miss-matched against schema.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
QCE device node was reverted for LeMans platform as compatible-string
did not match with bindings schema.

This patch is intended in resubmitting the enablement of
QCE device node for LeMans platform with compatible-string
being aligned with qcom-qce.

Bindings and Crypto DMA nodes for the same platform is already
present in the tree.
---
Changes in v2:
- Update the commit message and cover-letter description.
- Set the interconnect tag to QCOM_ICC_TAG_ALWAYS instead of passing 0(no TAG).
- Link to v1: https://lore.kernel.org/r/20251223-enable-qualcomm-crypto-engine-for-lemans-v1-1-f2c8f8e4f3cd@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..6751ed4ebb3c40ee2724fbc7efcec84a2a0fb1ad 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2769,6 +2769,18 @@ cryptobam: dma-controller@1dc4000 {
 				 <&apps_smmu 0x481 0x00>;
 		};
 
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		ctcu@4001000 {
 			compatible = "qcom,sa8775p-ctcu";
 			reg = <0x0 0x04001000 0x0 0x1000>;

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-enable-qualcomm-crypto-engine-for-lemans-4213e8b2354b

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


