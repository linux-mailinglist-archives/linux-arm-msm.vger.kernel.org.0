Return-Path: <linux-arm-msm+bounces-86362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C71C5CD9CA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0446302957D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4964030F937;
	Tue, 23 Dec 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVpWRIP6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ep82BO4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1AB29DB6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503570; cv=none; b=bX4uA6TXlRbd3wrtnXLsWKSk8Fzv27peYN+G9ICMEV5uIjUeQyJNQRmGsXgJ7wwmiQqj0MIYzbNrjaFnr3wyH2nNj7QYrjjImQeJpK17ahABnV2wpX9xkFOxn6UzGeHQcc1K0JA2GQDaQSTAxOP3nRwa8jvDGkBiFWqlK6YXGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503570; c=relaxed/simple;
	bh=Nb5cz42qvJQ7hyn0jX756pVrOq5QEAsXNNZgRqRzhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9w6uRa7Z7sRgp6dbEJHgtgnwwusJR+iR6GPYIOsHE8YzEhfNua/hJf6+9NTnUlOu2VKQNiBAnMUdTCyxKAafIFxAs6K6U0+LMigrDyJ81e8D9n48+wsU4qI5t7ui4E4VVuVq5B5qHOBa0fupkAYY3k2pSuwMUPS+9LWWhR3jGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVpWRIP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ep82BO4d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNErttQ461351
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=loserLUTki76e0mv2DkZGtYk0KYhHV04tTK
	M8DpaI7g=; b=PVpWRIP6UmMYN9Cw4895uXqGxuVDY/JHU9IizH1f6DPnEJQhZZ5
	QVY1xnAA8phDcrshMfb94UtEpj+IQbvNJNwY2Yn40Yn2oOtoziFhh1L5vKuUDXG/
	IztmsvMiy0hH5p/kj6ni8g77lbJ66rzZxBu0QcJLW3VPgb2m/v5v6+n8+jkN46EW
	EpGC3Xa+UQl4oNVdjFMzA7Wjaw0oHi8G4qPyUhnR79nGqc9an5jW/6LfN1rb7Xbc
	E+0tiEsxgeRmstYofVFIdgdvklXY4ao7OHe7RpkaEu0yak3qzy+vc+4iXiZhRL4v
	K8EEMm3QSWqr93Yu1yJZr/YuiiikGHYwZtw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fr32v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ff3de05so143888011cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503566; x=1767108366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=loserLUTki76e0mv2DkZGtYk0KYhHV04tTKM8DpaI7g=;
        b=ep82BO4dni0Y20tZYmDl+mwOIcboiLUgWmVfmDhgAVS5oXEM/YHrhtdbBN1gM44d0t
         x7jQ5iV0iozfHleKfBszq3VVlary3SiN30trx74YqLETHORu+ejdJCMV0aS7gHdJy4f0
         JDNiCqi4vUOwKy/LIjae8DHjLMBzb5hHzcyU44eoVgSUHkyK2OOoqQE7qZTO3nbxnBP0
         fkAUjdPf7qqw2zuGTL7Y7MCQz5fhBz9yXXgkRZZnkG42tFRJIGL6m48qRzKSDBZiygdW
         msP34M/fr9kHMceJ9rzObd/aqn5kjUWvC0FOvgo1NEuzRL5atUMTiDdl6y9rmLrtN5WJ
         WNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503566; x=1767108366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loserLUTki76e0mv2DkZGtYk0KYhHV04tTKM8DpaI7g=;
        b=bW8vWIM+phFBs5C0QEKsF/vNdc5PAcF/21B0Ke/ljbbOD4msHsc5JnMJqRpuDtk5nm
         iZ6bdoAwLref4R9LJPoeDYAh/JyiPmPlLRNYA1XNL4l6Pq/dNWhO7rBOZG4/75Syzxrb
         cpCMCi9zMXXoQ9erbPj9blMy8LbIhIRZobDyvdq48Fy/cdSh9qMxBlptdIz+S4k/Pv8s
         NywILgruc+BhmLihsNuSHFMFhYkp+YyjscS6SQ8lk7F/QH5deTtai017xngC2wjhnA4u
         8GY692C6KWY267pC383xw5e9y29ppIPd63+PGdP30IXXHAVG5P5oAc/j7yKTnyQ/Hwtb
         Z14w==
X-Forwarded-Encrypted: i=1; AJvYcCUk34whWosCWEY1vijBkUGCOcm5IDdxwHcw4FXiQ0tpopKCua1RngZq4URmI1FxmaILQkEzUBs3B8xc8+4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxL1u+uZUpvGv60AMkUBFfb2kzFzW2/fhJckHDNmxurz0z/03RR
	M8puavvG+IM2hUqIcTajl5XdVGHZnp7lxOnxGtwk7sjJu8nNXhDROmbzaEj3EorJzZyntFltshT
	11s7WRPc2zEhWcQZRhepGmShMYl8B8/ZIUzajtRJIw1M8g3q19EvPA7/MFM0U2c84nOMm
X-Gm-Gg: AY/fxX5yCTF2vVM9zSX88cVjt/qeHlGuF9s/0Hpzqbnp/NDSVxEXHHjOSsg4RqC0o5Z
	2535p5FTEnY/1XoHFTovsM7Z29M46D7p9GcGtE+AMS2AZ96y+RHpooq3qgoWNiQwwCZYY+dpa8t
	NuQSpaf/OxTFhpcfwqgfdNSJ5ZoVP5B8kOLaL6cFk7EYEjzVqU8LSAkpuFdWC5FprE8XzGn+ZGj
	/FpfalrhwUz9a5b2/63ixOjFIar4Lw/dnxNyvfp56/ZgLfzJ0IUKT+ahe0LiSwH+itsN16Ljxhy
	LW0BJE1rkqEntcK/8ROi2NanoNYKAeKbpUJC5GPcQ8V4ukqGLpPTpzXalbk3IWhrArSO9pMlu88
	OalroWdoY9AmthgXGnOl/4+1P14frs61ukJGJNorxjmGMuHtFIZgLH6vMeAFr7p4O8nQ=
X-Received: by 2002:a05:622a:5a13:b0:4f0:131f:66fe with SMTP id d75a77b69052e-4f4abdb3a07mr199218951cf.59.1766503565979;
        Tue, 23 Dec 2025 07:26:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZzkG1ybsE5+jipmRBJynt+75FLhzoKRzkFARG2q8zp/VVHuNkqHHEENXiKc4+6iU/nKm19w==
X-Received: by 2002:a05:622a:5a13:b0:4f0:131f:66fe with SMTP id d75a77b69052e-4f4abdb3a07mr199218471cf.59.1766503565443;
        Tue, 23 Dec 2025 07:26:05 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9ef904bcsm13268409a12.22.2025.12.23.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: Minor whitespace cleanup
Date: Tue, 23 Dec 2025 16:26:00 +0100
Message-ID: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11615; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Nb5cz42qvJQ7hyn0jX756pVrOq5QEAsXNNZgRqRzhlA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrSHJI5icWyjEBlsRRKm5n6Up+PncqPkZZcQN
 vEywIlfjwaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0hwAKCRDBN2bmhouD
 14d7EACNe0LrNQdN1c2/JZigzlDY/MALN978W5K+DPLci2F7CQrCUKpHUp637SfA7KrXGIBfNOR
 6VjRKejnwZ2yE5zuHzslfPlksWzU8zSZbhvLKUeIWbi1aUnkzzo7D/hd0GUslyu7BG1/4QATOOw
 uEqQ2PAmtCbfiEPhYJqmjPV988n5zBHvHRqrkJYAskHVv5q/FikbegahhQtW8cMBJEd4hS3g3Ej
 PzZdCxjhoOKYoBI81s3G+hjNzQ9PI0O1ds3ioe66JNpeGRO3GzxF3hCo1JaUnYtiaNhBTB9Gq+y
 /ZXjtPFPKceK28Gsdl+MhEtMDqH+v8oNHexiF32wkCa5Bhy8ciyE32GMI/8YWsi5RwNPzu4epiK
 1Ev2oAYmNn5/o8N3VQkN9bg0Tpy4/eVcNxURl6fOAvnuHHuWXUu2hoQaF7y4nLFuHtRWRu8cHmw
 D4e/FDsASlQmZpXPeByN1kb7feN08CeZldfIiQijTDjrX+9V7lrW6S/bgkwgtexX25WmP0XIorg
 NNuB7Y/KcF+bxV7sWEGloo2ywKNPgyOk3vC1VWCn4scDl7Phxa+CVwdBZ0pkyQvYAgb+VAy+/nV
 FwfjWpD2C0rwfvZIqmghT3WRstUt1OT3NfoWxsq4UbGIixN56nRaZke+Nr+teWoshRtpUOV9WM3 GVc/v+FEm/F6y7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tq3WmQIvcQrjPsw_Sb7W2YovTerJprgX
X-Proofpoint-ORIG-GUID: Tq3WmQIvcQrjPsw_Sb7W2YovTerJprgX
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694ab48f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hlyClpkOwkLfOEj7GOUA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX3i+Qe9T7qWNO
 6uMRzYPxhZnZ68n6rYvvuYPwR7ZorX9ckqakjJo37YINvuMEKLx+CE8vjzdR8vQQoA+8WPur6Dz
 9K1xunhW8QbOs4U8WkIAWPHo9neXJcXADAvxWvfqtbSJMPnrsDXfGMM07UB/02UONVUPUyouqI2
 mVCtOjoU4ibwGGCc4GANIVMoKe+IEr34shVVydzKvZKzbGRTHHyF5QR7hr9fR7WyQpWcn+pDWzF
 A2Tv4qx/YMDLc4TQjNQ+RtySAFJKxAktLtnd/DUa8XCrDX0gAAquxI4MX5eYf+mu83ej0l5vG8y
 AwhcQr8m4ByblLjcEPkNzpmSXQKZ7Jv20FoQv0Ov/k9MH0gojzw+KGR40r4pvt5Zgisr//6edHf
 hfoZS1+k+FT4WtXS0Z9qUwamSy/QWyg0BnqMboGES1vCLLODP0sqeQIn93VtLJrnsTPhnglDAG+
 qRJjZfmBl9kH/A/f2UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127

The DTS code coding style expects exactly one space around '=' and
before '{' characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 226 ++++++++++++------------
 arch/arm64/boot/dts/qcom/lemans.dtsi    |   2 +-
 2 files changed, 114 insertions(+), 114 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 51f8b3e0749c..9ef57ad0ca71 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1100,119 +1100,119 @@ apps_smmu: iommu@15000000 {
 			compatible = "qcom,kaanapali-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;
 
-			interrupts =<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
-				    <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>;
 
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..132fe92f179e 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4928,7 +4928,7 @@ mdss0_dsi0_in: endpoint {
 					port@1 {
 						reg = <1>;
 
-						mdss0_dsi0_out: endpoint{ };
+						mdss0_dsi0_out: endpoint { };
 					};
 				};
 
-- 
2.51.0


