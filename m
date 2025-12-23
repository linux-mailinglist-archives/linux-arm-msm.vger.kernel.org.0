Return-Path: <linux-arm-msm+bounces-86294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F6CD87DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B3473013736
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 08:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A28D322B68;
	Tue, 23 Dec 2025 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0DtgB2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjxO4Qj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6601FC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480071; cv=none; b=L0GtLFEqtvBFLZ4Cr4KsjLbCcrF4tzHCCgtlkqJa8gHZccrPfxQFiudBTIMpdlf5dBkJ6b4Rj+Ihvd7hjxQjYT+BdgeJnjkyDctYsIi6C2cWhSNSivTdnnRuNRnmlhb6O5M7MDjyDjk6JZCkweNrLsJAbVcyxFfVH+ogxovFv5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480071; c=relaxed/simple;
	bh=pSJq5XZ91f5uuUVRf7omVZ+UJBMIzGWBASaAIl3A9qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rWrN9Jc2jcUMWsFcBCk0jKfnte7W/HVd64AdchNOtCzXDoixa3R800JChcQxc7BV7CqvsCg9Vycd5S2ukpK6RF47Nj+vZuTfAGucfMD5ojuyBYOK6jnuTZ8LbxSm77NLK5+dE08Gd2hZz92C3sjBoIGRPIVnNoxRmyys1ueHyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0DtgB2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjxO4Qj8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6pbpN2115197
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 08:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZRY9vyDYki7A6Jcf0130lc
	so/UifiqyGKduY8v9D3nQ=; b=n0DtgB2pRxfA620V+PJLCAusfaM0KILYgCTVDR
	XTWaLE/j5qVLy5lubaD3mx0+r4+EX4gqxOauObi+WVdukhAWJQxfbSsDWUNyYbjB
	Zd4bjgLkc25bxRWOdls7ejBlNE6iqV1DIk4VQehPxEI0Cx+UIzg/s/9sWAd1ajRC
	jxY/Q3sXOuFss3m+8vM7BhYSlC9P/Bj6olu5sVoHzjRWWIff9Dfdt8RMdYBa4QTr
	EyJPPSgw/CM5UYMYSQG9iFzY0uiexkWL7Z/rFD73Mqm4bmyuA8UJEo8Iof4wabpl
	X7l+4PhZ8zaz0tp4mw8+HCn6Sa58SWp81oKo+xN5srZZPyeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudhytf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 08:54:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f177f4d02so108232275ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 00:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766480068; x=1767084868; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRY9vyDYki7A6Jcf0130lcso/UifiqyGKduY8v9D3nQ=;
        b=gjxO4Qj8LKHz3ppcAc1pcpazJGvYfyZrJTueh7Mw+im7CWzlTV7E5EeeeHWHBTG3jb
         Sgs3ivGDzE1OVGJWPy0cHtJEaMJt+nHXbUehU0AhrCsgq4cFpAgCEE5VdYZXahGbzoOk
         fzj6zkUvifn4eB8Jf74Y+Rt/e5tvmC+3yAV0uKmlByVWSb0/N57vPcmlRHFtOPypuRR7
         GqiQwR5TE55RTYOS3L0aPeu+Kk+KAjBRzWq2tipPaaoewH3ecZDVlbRX4tfxmR07BrvK
         Xq9BdfcvlDdmUebWvXm6ymWQNpkukNCk+IVfqgS33AAoLqS8aXgtkV+yXnUudQBxihWk
         AESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766480068; x=1767084868;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRY9vyDYki7A6Jcf0130lcso/UifiqyGKduY8v9D3nQ=;
        b=T947/PAAYaY7qAQmYO/jQ/CssOqyzqNC7430dYykfE1xP90cPAwHYG5fEA3eXKuW84
         YvUT23WQqMfs3cX9l40vqw7NB9TAuWaNWvzAtrFXKVZIHj1RbTTo4jdYHHLl7k+wfMiU
         sN3oJONLpN/IEkrXJT6KNqCMelN9/qLmVpynz1x9cfUoOhs0A+vwBSSnNOUWmzxps+g8
         C63V+sS+l3P3k6vsCBmKH9esmu5o0KnEo/GHyaJYILs6zRMRAXZHuX8bqcZoeLR3CTfe
         eap3P89kDyF2iki8Hb9GFXM6JAVEQjV1F5ya4CgQU4D+sZMqxaZE5cuD/vyUA4s1gqoE
         fZhQ==
X-Gm-Message-State: AOJu0YzHaBE+yCZb0p/9sBsjL6PNHRL1D2mp1b+SXIgHAA4VsSQuGLyD
	DNV9SRnPFRGwkRyR+iOFX9kjzsJkaaeLLkoEnfqYg4Zp+rAL2gFazsIuSxffKFI33AAry5J0M/y
	7rrvA69A/e6z1MgL87RzsEUzdmuaoSAa1h9ELW02t57lQ5yej5jSMekqWK3JZUXzuO93A
X-Gm-Gg: AY/fxX5F77hu1uEleRN7jxSJnPor2zDAjFAkrZxxW4eZ69iiPCMujpE6WxhxGZvCbDB
	BiJKHshYlHq7XmvwppZcEwIK8WksTtC4+spuXY8s4lnw89xGbdK+puquRBMOyY8ORbrCAyAGrEe
	6PmS9jYmi28Aknluuf8rSWTDw3nk8G6XfK8oEu3w+RDzMRgDa9D9cZ/Ff2QSuPrcwbbR8DifJVQ
	emGkPUk2JhaAlXudu/pE23oSkGLP1Hs6R+S5xMEvGAn41zsAo55rfzDfLSrUksxZwIl6s5coxK8
	ENuka0j4DhEDaU1aT99oGMYmXdHO2PH37CcW9hN7UGoAcrprSYHgP4PXiCI+MX2fLQ7OoP7Gr0P
	+Z+C7VEEWOi8p0ZQpK51iRQIkCfwXP51ddCBLwbmwfYBnDic=
X-Received: by 2002:a17:902:d481:b0:2a1:e19:ff4 with SMTP id d9443c01a7336-2a2f272b102mr129756825ad.29.1766480068316;
        Tue, 23 Dec 2025 00:54:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDHE7P2QEt7DiGykRUaggE3ilRmbm7MHQ1Aqva1h8b6BQC4Vo9P5yQJNB4t3gOJzyrFDkYQA==
X-Received: by 2002:a17:902:d481:b0:2a1:e19:ff4 with SMTP id d9443c01a7336-2a2f272b102mr129756715ad.29.1766480067836;
        Tue, 23 Dec 2025 00:54:27 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm11767912a12.17.2025.12.23.00.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:54:27 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 14:24:20 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: add QCrypto node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-enable-qualcomm-crypto-engine-for-lemans-v1-1-f2c8f8e4f3cd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALtYSmkC/x2NQQrCMBAAv1L27ILZtiB+RTwk6bYuJJu6UbGU/
 t3gceYws0NlE65w7XYw/kiVog3cqYP48LowytQY6EyjIyJk9SExPt8+xZIzRtvWV2l6EWWci2H
 i7LXiQK7nS6B+HAK03Go8y/e/ut2P4wfM4OqPegAAAA==
X-Change-ID: 20251222-enable-qualcomm-crypto-engine-for-lemans-4213e8b2354b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a58c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Hq7ZOB1SP9n91VY8OngA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vQLP4xLc0Kg8kVK9k_b1CHyp2yGNZabe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MyBTYWx0ZWRfXxUW67Ne6YwNr
 VldyGgGH1A7lW9bcbgxYxSS3K7xz6s3doaHqB8+3Fe/2YsQwteAPDoMz6UBoQUVZ9uMii8t41I2
 iLKF/eLXgxAq3G03D7T+qYPOp+uKf+7jfHDw0U0LmV2kbDOKXkaJ2ZZ6gOouuwR4XwCOeuCwJWK
 kXhpuJWP5H5kJ0EepDQqgzapKMXIHPxTB0owhuyafoHm2lKKYavs0nYTy3WvtaCAsg4JBblnDv8
 j7IL3J2fcljS8UT0NZ6Wb7C+GyVLoLpC9a9eRoizLxRKtv6WR1WYhY8A7uVA3iuqUSwquRXc7sr
 JVaoYdNOqYiorS4uWSA+VViALBCmcnzMhxmdsf/BcbDrppn1vIVITGTmwRfkOxRMfB5CdICml0n
 TUPgipIsJO8J2MXqSaGLKxwcjAXDnxib3dO/VvQM0tXKec+TjVMu9XaBMZQ8WiMRUP3or94PQOf
 JLXMMqzaArGvENAAhSA==
X-Proofpoint-ORIG-GUID: vQLP4xLc0Kg8kVK9k_b1CHyp2yGNZabe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230073

Add Qualcomm Crypto Engine device node for LeMans platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
QCE and Crypto DMA nodes patch was applied as part of the
commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add QCrypto nodes"),
however was partially reverted by commit 92979f12a201 ("arm64: dts:
qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add
QCrypto nodes"") due to compatible-string being miss-matched
against schema.

Resubmitting the enablement of QCE device node for lemans platform
with compatible-string being aligned with qcom-qce schema.

Bindings and Crypto DMA nodes for the same platform is already
present in the tree.
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..342afcb207939a74d2ce4d7fd655840f0208dd2a 100644
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
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
+					 &mc_virt SLAVE_EBI1 0>;
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


