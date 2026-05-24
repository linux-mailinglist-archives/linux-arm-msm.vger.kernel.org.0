Return-Path: <linux-arm-msm+bounces-109533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Za+hAJFYE2q1+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:59:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BEE5C40B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AB9C305E19C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9BA328B62;
	Sun, 24 May 2026 19:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGsLT25h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brtmXI/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1087A31DDBF
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652236; cv=none; b=tR3geKsRAEM5S4ABurJU2MYmcQJUKBaUBUePHi1EGqgK2VLZtjCTJsPEidvjXQhRp/0v0IE5Di0Smgqmk3xuKr8snGRdM4NhQCyyiYYUW1rT7VwAvUwxNWNRCHa3/csi0+sSsehFteQRYqeVHltTM+oXC3xxE9fnHXNKqgBHJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652236; c=relaxed/simple;
	bh=HZ7/7IjeZoPhuLN/esuvDjyXVaXxhOuhe52lN9ZMwac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0NV8e9qGaI4TCMY7LxPldTKE+VKpNC8DQ6Zj9/jiBvNGmRHenmXYt7i+i19sUhn6OUQs5ra2xQf9e0/KjMMYCys2eAwD6TXhgKY0wi5YVhPQhJNxOuXf37cB+hrsoQ3xS3MlKy+7k+7FcvGuh0h4O0zmcnsgIIMTxmxVSFLdCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGsLT25h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brtmXI/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OIuLCa4115476
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjPFT0emV6C2WElXznwvtli7ABAsS8Isx5jqdt400LQ=; b=VGsLT25hOjHPVj+q
	99Ha/BwlM3UQP5OnOnUuBTkh6fYdcG7eeTN/peYQdg61tWLzHwmrjLhLOanIz7OY
	9/mdNZmYRy5ifXtJfV521+oo6794cdn6M/3EAOeqxidVDovpSNsXD62o+L9V0cT1
	8b7Pxfa19qB77fpZcD+G+ZSzSvQ+6j9XGhJrVUOLl+Kuw9ZT+4ZoFMh/6WggzQEt
	ewhJfdOtJT8N5UDfLWnKXhMcJoQTVrZatYzudB5UB6rYLWPWXatNo1mNTX1JMyGu
	Zoo6qIsvhk+Sz5Tn6lzG5GJbhd0qK0Q9M9IFid5FCKymHZRZaMseZySplCOtF+2r
	xWiEWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386m2v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so8030063a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652233; x=1780257033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjPFT0emV6C2WElXznwvtli7ABAsS8Isx5jqdt400LQ=;
        b=brtmXI/Mv3egUhAXroXJ2TxGnttUkuZ6h3dViXCp4GUMw5ojhbyclbmVJaspJusPmo
         Qs4c+Rea6xp4Ev0rHJi3gzJmKF9S2s/UIMXHSBVQB7iXdJ3X8aCDdwrlh5jqLwZXlwdb
         EkYQEVPZ7YXikafCgvzDr3yPoR3ahO7a6PvEcl+wg1BK+FEjLL0NvHtGsQvMjunuWQvT
         32SXuSJ3zrBOaJq0Ks0PaX/muMSBwqbDFFwp7xsQr3xOVItj/jLZu9UH83Vm/4bLHWb5
         VK7NEtFDcRQQHZWsQKvQbPIblknic/sFJVPBKU3nyGk+77dJpZuuIU8FCe0w/3avbuMK
         o/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652233; x=1780257033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QjPFT0emV6C2WElXznwvtli7ABAsS8Isx5jqdt400LQ=;
        b=VVQvubfJjnFXBPkAYBSsfrn1pIMtijzYbUOfL5bC04g63MWnEZ1+gp4QV0zd3+WOsS
         SXM+sRxNNGFBoZT00EVwEf1XWEC2De8CHlsX1DF5mc2YAUOkLX+bJVq7UR/qATTkYFlp
         Um02DjvM1+FlfJOif/jWACkoPVF47ed/VYPkJ+RV3JtS7uBusV49O7K/u6bH33UviuAz
         47vF8Ryn64JBdcUB/rOMQwrYxHrkaqDoYi5w2g0tKjWIfA6KAmnENvn59geoZgq88OY8
         o3rdOzHEN1iFKUTykJshpbfHOAiFbyYpcOBZyy81K8CZ6jdtDyYN4n4hso/K8DKsAPYf
         uK+Q==
X-Gm-Message-State: AOJu0YxukoRHqe4Hq+UNAkhuLtDANCPaNoHJHE8aFV4Aj/qRCZJY9ZbC
	Qg42RVMycGl64uWzSKuZr1xD4nK5X59geYmn6bTrMKxdEyzVYBiDrTQWi0DmpbsO9sBhML+HNBn
	fptDygdpcN0n4PYBO0bGVkYfudBWMRZsriKRQTvz9JTz6o/HUBOjZDHBG7FuZnN/ysilC
X-Gm-Gg: Acq92OFAeOk/g6fBA4SP1xE50+HEk1anzDjEISavN83LKB4/bJi0JYBr/9pIGSj3hax
	pRc+0jvTJ1CgXiHvj7PMfFdPO0NHx9Rq6e9the8gWyHSXgUgaVmjmhZWg7/WwP+EWESR1bv1ndW
	leXZzPn9qMDtAVbJ9r+tHSIObVlVPjEgtgAbdsi0U5Hdmt59mmKEpPfyN8xgB2a9UAijMZRboJl
	G9etCLx3+8/NhcWULFEN1WJW3bNAXlLvy14jUmkfMUCz34HR66tF8A+NjxQOOnznI6ll5fKLWxQ
	zhw3L7tipIgjIbdVZ/6e3c3d6wWzH0Ne2kdfRoBQTk5Usjm+NoqW6N511jedc6XtTK5rYERQUkD
	wrYi5l7uUuagpCiwvJ5d4apuB+JBfQ8thXS+F
X-Received: by 2002:a17:90b:2b4e:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-36a67719220mr12526928a91.7.1779652232902;
        Sun, 24 May 2026 12:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4e:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-36a67719220mr12526916a91.7.1779652232445;
        Sun, 24 May 2026 12:50:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:16 +0530
Subject: [PATCH 12/16] arm64: dts: qcom: shikra-iqs: Enable CDSP, LPAICP
 and MPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-12-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1018;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3Lftxp5wY6kDco3NZNja7NALjN725ANWhNeWOYYhkAM=;
 b=VrlMrPDl3C+ezrF9VyKFMopuk63KiuZBmykDz1gHiy8/Xii3Syr0n/6ETHr3lm44J6ffV2Mk2
 Vpstd7HuwODCUZdQlaTB1cwRi31DZ6GYbrvzsJUoaEw/5kjiysAkIkL
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: dOmwgRr-DFbHxHPuHKUQ81EcTJBarRwz
X-Proofpoint-GUID: dOmwgRr-DFbHxHPuHKUQ81EcTJBarRwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXxpwR4SWrAopv
 2GqL/Vs4Vcu1PKIsL+a1y06Bl0tGiP3x2qnvM85lfFKRt7ntA8vUAVnmbqFNcAX6PxN9V0BhHbE
 7uItxPPqwEDiBNI3ge3VikHt633ufA9/NreXZnGQMtPD//j4SoIEgRUDQWAP1/MZ/kfot1E3LCP
 u84TvPuZn4ORrHh1nc32MHlqSqhS/Duwgu6jYr47PFqDNP/midGCTvDvsEeUDur37loTColH29w
 2+Z/+xak6qGAQ4xVMP2jEPprBHRFDIiLsZgc/iQoxI/ruzyJJ0pMK/spIbyYk01KCHdZqH/XHyz
 Unh3cZTyfaCw3Oe+dR447uOA3vJ15eDhAXl5rIfOr+NJZkn6/4fVcJXOaGP0skCQwL9tsc/G4VV
 +1RNPPaqxU2j8NeKgZq8Vp7laM+i4uAnaZRo/tgb7icDHbGuJPcpzjDtrNK4iH5iI+YgpdLBPXg
 joicg6iXDPTLdkMwHJw==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a13568a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O3QOSsIWTsd9q-9u8mAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109533-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49BEE5C40B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1


