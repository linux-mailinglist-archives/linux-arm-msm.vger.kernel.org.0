Return-Path: <linux-arm-msm+bounces-86499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD3CDBACE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E829430124F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 08:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3559032E737;
	Wed, 24 Dec 2025 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHP0VlCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV6Y5q1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2632E6B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565192; cv=none; b=qQJwRQAIus5OsA3RQSqApQ7UsiouSLQp3+wU0JL5GuC5lI/PeKjtb8OIf/7t+7WPwYo40oiKVO9xzXKNWK9PxNXl55qv/q4boLzHMCMr1e/smDAg/p/hHB/IFyn2sKd8fQqXepRz7IogezA0I2iLJmLUnzx9N+8DiTvDC/ZblxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565192; c=relaxed/simple;
	bh=vtBdoO2M+vbPTa34JUYJExYy8YdaHh+zp2dlzK191z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HrIsKXo/jOTNDa2sVXUtuddYA4GUwFYNHS21Jg8Yww8CFoUyFZEn9S3fkCMZxWsX4dNdocV+qkBTESCsV0e4qKI0WLRUK4Xra8FxjIm790y19uG95pZbfzP58L/8ZxS1NNO9411b/OL/C4h6hB31Sp0PZMtQN4KqOG5EscXsPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHP0VlCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV6Y5q1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNLweNP700449
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J0NNhkniBUXkB9cGmD0RCN
	kW76VJe1o1RjwjKDBEtss=; b=lHP0VlCNJhCcPQrL86XN0wkfPa936d1QA9NmjB
	gcz4vuf/1RuwXn2qGg0l/17cwIffsMjiXaCl70BsaiQR+risAsZOF+9D8a7sue8Y
	ksy98FXyyWHpGdNQ0N242/60iJBoqPPfv/mke4W7s9SFW2pWFJaZvPAygsfqLESY
	zGyg/0nO1WZYXg1AOFqG2bueutMAGFDaGHd/MfZLuzzK94x4jVwRZpKctNpNl5zJ
	Nfry2A92AncbnjAuqaErK8qHKrdt10VJglzfSEZ3+MjDE4mKFodgivb567sf8FBy
	yqcW27V4ItFf5a3jDGuxWR4+69JWSR9XtjmxKaXSy6JHhrHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7ju5dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:33:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a090819ed1so50344775ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766565188; x=1767169988; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0NNhkniBUXkB9cGmD0RCNkW76VJe1o1RjwjKDBEtss=;
        b=aV6Y5q1c2LxNPaCxylcX7S42pg9q+rjELvNIMc4zOkt5PrNs7eEQ8UG9jCPINxdG0R
         wt33l6Z49G4UXw6nlp2UC7yGINQIAClhhsdlrDXJuoB0PFM8T2eFFay3DUmH8FWjVIIE
         HJwShUpjzlqqfsB1FVXqNe2CTmp7q9sJJsBI+45HNpMF9mV+G8kpe3Leq5Jr7B1LtTAf
         u8Pj0l3y+L74PpYvei3BZWW3fWVVsCB1m4/8RNShG5PzGgzMSNocni06okHVeNSncgtW
         73d2EcrJxqqilmvwDKB1n0jJFjOZrrVWOXuX+f6TcnS+aNxoYXTyAA1gg/F6GmgZl6yA
         +xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766565188; x=1767169988;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0NNhkniBUXkB9cGmD0RCNkW76VJe1o1RjwjKDBEtss=;
        b=SGRwKNHnDYY56lLYBR9e1cd2ib00e4THzkp5ICyo0lMNFjGrUaeO0dt4YSu6BO+Ld/
         tAK05oYEg6rnnYL/p1iNqVGIu/n6zeDuvWiSjgDZW5YT3PaDhpylo5PlkIrI4f5DOk/U
         LcrHucg1kmpj2vEfIOXCGEjCzsybZZlg4/oKfUdEl37ucmcIbJnJk+FsYkiK9AcsfCeV
         81fuNshPl2uagIIYppRiOYxMaNUWp98qDUU+bcFYMwj1c5wu2PmKYzNuKuoFsvHyOKe/
         AhCWYMe1hOB5b3qhI5yRFoOLfA0/wfvMGiEFdYE0UEjZuOhkFjQL6Xmm3RJq3irs4jxF
         JBxA==
X-Gm-Message-State: AOJu0YycPXaXFvkfzAp3eND4DP/EST4P+YBC0m0PKtVuEWS9+yge7zLt
	CXsGTuhzgnQT82u/37lZ+G8Viwj5zuOKf/BzL7TBhTGhh6Yca+hyTORand8Ffdh9g12WLnA6YCQ
	Abqtv2WOjpY6HWNJF2kccTSjJtINU1NMKX02MA7zu1ClVikpkOADjdaZWusFJqyMjAB99
X-Gm-Gg: AY/fxX4XNSq8P158cpEF9XP1vnzboFy2RjjDZ8o0djXoXasQWwL7i1rcPc6B+5HAsm+
	nITk7CIW+utrhVF1giPjrYspek71alkSvE/YYHKFH9/B2QPNw4i0ySzgyxwmOlFS4gX29oUrkhu
	w/cfvN5naYjuM/Hcb0PY1gzO4SxOjnpJ6ZcyowIJseVzTFtRE5LWki3Ax2TKtBul3CyyO8BZdoD
	LVdrU2sVsaC7ScuJ9eqgffxvznWrPsEUqSWuUPmKen99f3nRDv2EdqLRRjsilflwPZpyXX7DvvA
	HjcoQMkFfkbWxsGMj+/aTsDcq0Uo7r8z//WP/jSXJACXa+fA0rLrue/zrHxplnPyoGDqcGpuzDf
	+OgvVrqyxGRB9mHEQXiGMARJ4C092HIoVt9oSDl6MbS7/NT0=
X-Received: by 2002:a17:902:e5c8:b0:2a0:d149:5d0f with SMTP id d9443c01a7336-2a2f2220592mr165554555ad.17.1766565188268;
        Wed, 24 Dec 2025 00:33:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJmVfsP42PZqoKGg/TQcsisXEvsCXYSEhdsz+84Un4HWtHQVCNw6vR8WDbCAzx6mdT5ts5jQ==
X-Received: by 2002:a17:902:e5c8:b0:2a0:d149:5d0f with SMTP id d9443c01a7336-2a2f2220592mr165554305ad.17.1766565187792;
        Wed, 24 Dec 2025 00:33:07 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77446sm151450775ad.93.2025.12.24.00.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:33:07 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 14:03:02 +0530
Subject: [PATCH v3] arm64: dts: qcom: monaco: add QCrypto node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-qualcomm-crypto-engine-for-monaco-v3-1-6073430bbc13@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD2lS2kC/52NQQrCMBBFryJZO+JMa0JdeQ9xkaaTGmgTTTQop
 Xc3CoILN7oZeB/mvUkkjo6T2C4mETm75IIvUC0Xwhy17xlcV1jQmjZIRMBetwPD+aoHE8YRTLy
 fLqHMvfMMNkQYg9cmgDKybRBJqaYTRXeKbN3tldofCh9duoR4f5UzPtc/IhkBYS1VjZ1kLaXeh
 ZRW779VOeLZyvTpr37wU/FLUrVBK7GS9ot/nucHWjXPNUcBAAA=
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3MyBTYWx0ZWRfX41WhDU59cg3O
 jiSa2zK1t1QqS1sZsEg86eq64/G0E6+UZvo+/U+gNHRQuufDJHDVzrhpWnifdkKNLZuF701Xec6
 LmTWLxlZEhKeW24J6DLkWqA3rZ/VHx0hkyKL5QyV2PtxR5jb7Ua8gL4D4NgiSONPzulm0B6y44p
 H/drjTvWT30NBqCmuwttrzg7anIycsWBOcOm/L61e9jj1Yl6JF0IIZ9djUGfEramgV2UX7ZCoVd
 3eQkD6V+HeABoHILCWGGCaz74U92h6xa8DuhkaBs+RObCsWNzD0/WrTEfi5v/kwrQiILhxDbdyi
 XJO244XSvrLUEfldCRGulgQHFCmXpcveu4I9YuICgMxFBR01SYCaoAbZMznElMVNYOEji76s85l
 wLD7MSQy84bIeNS/q3i7y7V0QyUp6xK13O2bPxzYnpiTGa7pXrgwifbfgPhConU3KocE6oPOMtR
 Cb9fu/ypECbcCUpEMww==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ba545 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FhPRrsT0u4Bh14IxxtkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0OvVDHJgCRhji5CjiJWOvDb60p5dfMrH
X-Proofpoint-ORIG-GUID: 0OvVDHJgCRhji5CjiJWOvDb60p5dfMrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240073

Add Qualcomm Crypto Engine device node for Monaco platform.

QCE and Crypto DMA nodes patch was applied as part of
commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
however was partially reverted by commit cdc117c40537 ("arm64: dts: qcom:
qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"")
due to compatible string being mismatched against schema.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
QCE device node was reverted for Monaco platform as compatible-string
did not match with bindings schema.

This patch is intended in resubmitting the enablement of
QCE device node for Monaco platform with compatible-string
being aligned with qcom-qce.

Bindings and Crypto DMA nodes for the same platform is already
present in the tree.
---
Changes in v3:
- Update the commit message and cover-letter description.
- Link to v2: https://lore.kernel.org/r/20251223-enable-qualcomm-crypto-engine-for-monaco-v2-1-6274c1f6136f@oss.qualcomm.com

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


