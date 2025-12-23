Return-Path: <linux-arm-msm+bounces-86289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F79CD84CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AD17300CDB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 06:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24B5303A30;
	Tue, 23 Dec 2025 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGAoJRSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzGcdPYH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6482F5468
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472928; cv=none; b=raaWz59NHs+LQReEJ8rRCactF/bbE0noc6xD1m6W+OFezHabDdBBLNOhtV8l7+/MQ0evkS/kle6V05rfoG1KqCziJ2nb7mMxvCT8GPKv2FGNoVqFIN25FvbaOlTOCCnWColA1auJz1LY6Nb3CuFjlSABiHPX2Yb1mtGRQynJQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472928; c=relaxed/simple;
	bh=8qhlSpuMQaoYSIBkroli52m/TP766lVphDVD3HmvRtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tRa+SKH8oQNj01K1sX+3aJcilqEQiVxOzPw2n8UWUQ2ivlYFyymPq3IO9IbIjQpQ1qIJEdPrB/Fk1P97c7FZkIm/as9h+XzpWD8m7OrYQBPB5T3cXmsirWN0Mbt3caOUt70kwSUzqeGL3Y57/jyPbwFXSfB8N/9oJ2rHQ9k+VnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGAoJRSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzGcdPYH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2uPix1889173
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2ZbJwo3hWsY+AQ9WcCTWCp
	2+d/RG//DNbYietI1S81w=; b=OGAoJRSgA5p2c5u2idm2P7YyFMYsdbhHIpchlV
	tNFkqp24LT9GUYyS+KD5WoQUhsYBpqX8aBMaseaUJ1mCZcOEWMl9/56NSUvb69DX
	AUlOwZ5GGYxOboRZGBGlto5lMe5EQ0hOUM/UNvXbpYgpm0fYnq55P5IYaRaI1wn2
	FCldTGsIVz5m9eJurPWHa/Wz8+Va+sptzQueFuinslYKk396BYq/7MUcBSo+/b8q
	S5rep7zzH7W9g31W+V2JArfyrZiBjZLa7p23tJ4gOwjVN/vbadZdoBt7TfloPBy7
	rCJY1QHkoelTO23Nl3/FKEudYeTKN9WyaBtTpSRVubLE/ECA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ajh2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:55:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c1d27c65670so2665427a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 22:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766472925; x=1767077725; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZbJwo3hWsY+AQ9WcCTWCp2+d/RG//DNbYietI1S81w=;
        b=DzGcdPYHnmpn5HiO/4ezptwjfJgbN4Fwul6GJiSACe6jHfyXVtMLWSpxpPQs/27dG8
         ivsnHp8ykUZgQJc4Jhqfw8v3+QfOA/GlX6v2ODaDoC/mJIkJAoQ4hZQ48OEUB9h8ilBL
         72PC4JK0OWL7IsDNBzF1Ty/CwdnP9vAMwixaOZAdIwEuLoktwJVv9fIZa+KruCwzIRC+
         Nv+LZwnQ4F9yB4ul/M5uM5pmEO8KZ2vIqyxDsJ1DBLBn6iJ0PV6a/8+NfQZZ10VIN4hj
         HWoaYNInVSzG7Pp0U0zKLPfUMKW8jNgd5pccFqz3dUccdsg5tMuzT/OnfYDmLj+LJ0RA
         +C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472925; x=1767077725;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZbJwo3hWsY+AQ9WcCTWCp2+d/RG//DNbYietI1S81w=;
        b=rbURp3YbUMfqiSF8h6Z+GyYdb/t37FEP3Z1UzC/3CmcowLel/9O5VsXo+5CE/VQoX/
         WOaVCev5IaWTDJ3Y3xBd8Q59AAV9aSOeaixbjEbT4hRXjfsOUxj0zxSqX9IOZSVf9ZXO
         Opo9ff+qN4HaifEAMRYZWsUOEVXydilXpGQWKSVWY7cZZTMWEoYFftq+sNPoP36IVBG5
         Bpfq6YHAMXYZnG5k54xIoWX8owUXVI8rbAiIc3hGivhXmCZoAjzr4OF+/5t6d4TcVbOM
         pnngSR/H9JtkSnxkpzMk6603XbFebJtTG+9OadWg2QaNHAN3+RSKfTQM0ErxqtbAcKxm
         PZCw==
X-Gm-Message-State: AOJu0YzjaMIRi00nDKUUx3UJM7abaoSLfeGhh7aP1JWIIQBVmRo/GxNG
	3aYn+/ahv5y3kg5BYjgrXBD7nI9DdVB5MmhxvOyNjq9chI+bCKqm2eyqVLKOz7LSxtRec4D+3Jd
	WUuE/G9Oi+ucZEMMuCvPcBkE3mexUL1arfVSkC3A16IWeeDVVKDRZfUVYwJqAi0ZyfWAd
X-Gm-Gg: AY/fxX7dJcIQc8p8Eu4VuHW+rmGjPzrY46Xuh8smiws5qzj1lYozah1+4w0hYnDImAL
	jx18DfyCvODXNs2CshVwfQFMod+uuu2Xne2Yy6hnWj+NmglvFfoGXqWAaRg63vUuY4aWk9WZHcl
	y0xljDnlVpQ6a4radibANh00g+hOeKymZ0gE8eoUg/BD3EOjM/eJtDJkgVBmD374EFyXVhKmQry
	zBj7lqqwUpl2StNVnTzqXk09Qn8bzEcj3+O9QUBCDdSl8qa4OUaaSbykTDeBz6K5aHUO6pb/xe+
	Xd41JfhfEc3rqCV6N/MkvGsqAnHmMFRlcBOMK1XxhVcK7KinzK0/eSqngDbJVEDwsXEBDBUxKjh
	1UTdnnU+SkrECtttqtblQneSsqWIrwZ7nXDtrD5QLeZ9Gllo=
X-Received: by 2002:a05:6a20:728f:b0:34f:66ca:60aa with SMTP id adf61e73a8af0-3769d4ba1cdmr14529298637.6.1766472924920;
        Mon, 22 Dec 2025 22:55:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmapJyX26gOd4NYTq7poLUVwFEN6Dw+HKezMSoXpAOO3DEBP2byvbqqailiBj1EnERNBBNuQ==
X-Received: by 2002:a05:6a20:728f:b0:34f:66ca:60aa with SMTP id adf61e73a8af0-3769d4ba1cdmr14529265637.6.1766472924427;
        Mon, 22 Dec 2025 22:55:24 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7727356dsm7126782a91.4.2025.12.22.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:55:24 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 12:25:18 +0530
Subject: [PATCH v2] arm64: dts: qcom: monaco: add QCrypto node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-enable-qualcomm-crypto-engine-for-monaco-v2-1-6274c1f6136f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANY8SmkC/52NQQqDMBBFryJZd8QMbYJd9R7FRYyjBjSjiZWKe
 PemQi/QzYf34f+3i0jBURT3bBeBVhcd+wR4yYTtje8IXJNYYIE3iYhA3tQDwfwyg+VxBBu2aeF
 Ud84TtBxgZG8sg7aqLqVErctGpLspUOvep+pZJe5dXDhsp3mV3/YPySpBQqH0VTaKjFLmwTHmv
 12eQlTHcXwAY0R8s+cAAAA=
X-Change-ID: 20251222-enable-qualcomm-crypto-engine-for-monaco-7c6b9112779d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1NyBTYWx0ZWRfX+7V0Hk9zTPFI
 usDzVIoym6JQMaslOHz5g/lgmUDhsMZiuFs35iQPb5v7tjwz6doaBKtEbpwQsobAPmZ3u2ubzLG
 9XvXah9evVVf6oMXXKaCeYHzLY83hk+TiAgfMjRVh35h9SWLsSNfsYZDaplFGwEfrnsjvwdSQjq
 RxoJ7KcFUrHW8iMItuhEe8pFeaWPwzSAOWiwPDtD+v+7sSSKKvUzxFYsaydTgDNQYAS2OmSDo99
 xRAv2A39oswL+qBWK9a9VH3ZwvpN/gg12/Lm0ZCaU0w4YgyUeno+yuucKvNnU4SlNnstEH6bdG5
 UOPBkSSt/3OHt0Wp8Pg9UWaJohl6G8OdtM54MhW/ylORINWOqgxzRA51VAnAFX0NqMhvHF7aDXZ
 rHafGHmV/YaTr49n4Ciwb3cDMaDzoZKa19FWt5KKBHL0Ss28SI9o0lToUP/MMyzSBglnZhwMAfs
 8Mi/bfRCEqvqtBpEjFQ==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a3cdd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Pul_FEBVa7MJ9lUudr4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: NcMera38c4O90qWYOBBRNjD4UHhv_lP9
X-Proofpoint-ORIG-GUID: NcMera38c4O90qWYOBBRNjD4UHhv_lP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230057

Add Qualcomm Crypto Engine device node for Monaco platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
QCE and Crypto DMA nodes patch was applied as part of the
commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
however was partially reverted by commit cdc117c40537 ("arm64: dts:
qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add
QCrypto nodes"") due to compatible string being miss-matched
against schema.

Resubmitting the enablement of QCE device node for monaco platform
with compatible-string being aligned with qcom-qce schema.

Bindings and Crypto DMA nodes for the same platform is already
present in the tree.
---
Changes in v2:
- Move the description and history for the patch in cover-letter as suggested in patchset v1.
- Use 0x0 inplace of 0x00 for iommus SMR mask field as suggested in patchset v1.
- Link to v1: https://lore.kernel.org/r/20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..c0cf56c46ed50bd558f7cdfc8e55a58d738ef911 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2350,6 +2350,18 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,qcs8300-qce", "qcom,sm8150-qce", "qcom,qce";
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
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-enable-qualcomm-crypto-engine-for-monaco-7c6b9112779d

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


