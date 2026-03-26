Return-Path: <linux-arm-msm+bounces-100126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJTuOlVXxWkk9gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:57:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E59337F72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AA783153B87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE7E3FB7E2;
	Thu, 26 Mar 2026 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfFDsaJU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSUrxhA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00F3F9F40
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539688; cv=none; b=KOAGmwTp4/5AGz8+YhcjCZv0kA+TE/TuHewiFGhuoqCW6Ox1i8si35lS+KWTP3JyoDnYbpU346qHYQyU89hdjb0GFgfxjLMSTrLe7x3vubYcssYmOECoB3MaTdwSRraABw0RrGC2YgPjd64Qbefje51SxFinO6sQFYcn7YHiTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539688; c=relaxed/simple;
	bh=Wf0oWZY0oRn4dN/vCQzyx0UpsMK0rAk5jldZnxn48aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RgJroVFZwH/89X4FyFbO831x8Ap46wjXpqGDCRix7QCxHSzc0NHXeW3OL5koFpxo3Pze9iSDFOzM59DmlmtH/n7yLbaVgscOxkzQ+vJPbnn0HiI8Dv6309ZMfg9S419PzR16L4NFdA+WGqHyDZJmEpWIFRGCYRVHkNkddYJ6LU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfFDsaJU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSUrxhA8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9i3V1666587
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h9cTHuXTabtypHLXwNdj/XBLnWzsA9Y+HAH
	wL+4eL+o=; b=KfFDsaJU41Kh3aQqAU0slvLHD+dcUHf+AvAjsEPDVerS/+1s4uA
	Qburc39WscRr7HR08dViP+hDOWGxEXI0APh2DnjmxH+8buGYK7DlHinsh754B+YR
	hLv+EJ4QMPfllvPdAMOsKamaGeuI5f6VZL0Y2cE6KK401HWkrgChnz2xs/EbQ6M0
	EBOZrjex4zk3eJPoD0+CvfObUmmbuu2/izKnQbCc69AbidZMIvRfBeCKUhLLDD0d
	NUo90YkBGygraFhdyaDbzJ6t2jzlj7pE9dvr0xrUmUFXUU1bsysPh+KVbvtKVQ7Q
	rZ+wefPboZyxCaPGm6YqWVy54B2NGTx21qQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjajtxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:41:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so33240011cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774539686; x=1775144486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9cTHuXTabtypHLXwNdj/XBLnWzsA9Y+HAHwL+4eL+o=;
        b=PSUrxhA8/c0JxmYv9Zf6mmWgaGagch10j32wqOEdXu5K1KGj8oqQdpYlDRw+BpILnj
         WYSB5Kd8gD1LLEmAFD7KLd4ze3sEcaNQS2zCqnmNlBIX7MTalNH/E3/V8FFtwUFfR5d5
         Co/d/3AlQA3gHfZ39jp5hQUG9dIz5zbMwG01VkU8T2mgBjKCIepbL6HUvR/sEgrSUwFo
         RlA844yXGKaYvZay2bG0LTSza1Gcn7X1tVXWyFRwUw97wcpuKUioPDTfrzM5M4FH9Z+y
         oOpPrr014awww89e3wG2hA+uIl58RnM2H98ESAU4hsYQde9nbUgDr44kcB0vyjlr9OnZ
         5z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539686; x=1775144486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9cTHuXTabtypHLXwNdj/XBLnWzsA9Y+HAHwL+4eL+o=;
        b=e1qESwTFk1psKklNgHoWlROyn30pdG/UHIcRiZlvAdC4OAvSpq459d7xLD+3bVV7Jd
         NDaJ6pRvIDKXrcgiD5bk0SY3YmnbSjysLBgyD2CQGXKW9LGXs1xZSWJ1hhSRUM74eRzy
         qYmNOsf3pPywL+yfu0d1BQ0cX3JnA1+gKuSyoaDjXJlxYkPskgu/abfJZIwZLZ78+RY7
         /Cxw7IdYfYjVdc0fe4Ymby2hVeTThaLpM2SASH2gwfQdtihI+0GGaMB73TwlPyfGOxdA
         kvx0MnOjyHlb2ZaxV0u4KfwXqCtA8YbPOxscYrp6eBOtNeDmYTUv4iMR6VqhDHUOEqoR
         Sftw==
X-Gm-Message-State: AOJu0Yx2UwpqaKHTFFEkz/WiBo02GtJWrgS/Un5w3nprnevkYulLa8fk
	v2I7I+ojfzCcoB1eoOWk2k8UuK15QLHx5caMFFIE2+LOEn7bAtgr8jcDAt0YkxtTcvxRt2Tgwoi
	ETSOxZvnPEB8XVVoXPzBSHIpS2bhnvY71Z7bfz8hIRLAnSI3IhQQrs6JGXiPj9J3o6KOz
X-Gm-Gg: ATEYQzzba2Gjs1UdA3DQjdjDExN9mv0SotEfXey/STXEOwxEYzYqQ/Gmh52VjfFi20N
	2eAniTf0dxKhlToE94dBhtCK121WE8thntF/eD4YnB6oJq8RLusO/HsHh0iPsJVZP/hbn1tFTc0
	/6noGKUWU4eHM/JpT4+QDXd0pVpa2ie1b/siqFJ3QEsvFDWf7/24cgq8W4EL5BJrBKPtb1bY/Mu
	CEs9jz5XykhbBbrr76bufLvz7/JKOnAfhl7q4ZCYLuT+aVHNaGaiu8C6QMbZTTeMs5WG9Tfgqik
	q2zReSDIaDa2QcGlGtoBd3xn4IeWPE1G1+beu0048oh1DoITIM5HZqXTfiBAQ/XWz59Rfov+W//
	+Z9M4cuLOR5Kd1qtQe95sdQPabzpn2TsP8AD7wth0IXiVYYuCcYrAzfY=
X-Received: by 2002:a05:622a:4a09:b0:50b:3be7:afd with SMTP id d75a77b69052e-50b90c8c660mr68758711cf.65.1774539685765;
        Thu, 26 Mar 2026 08:41:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4a09:b0:50b:3be7:afd with SMTP id d75a77b69052e-50b90c8c660mr68758161cf.65.1774539685206;
        Thu, 26 Mar 2026 08:41:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fbbf65asm25765265e9.2.2026.03.26.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:41:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
Date: Thu, 26 Mar 2026 15:41:11 +0000
Message-ID: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fM93HAO-6g_ua4Sl0ZK0ADeReMOzi7ux
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c553a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ebg3YuX8VNz3oMcFMKwA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fM93HAO-6g_ua4Sl0ZK0ADeReMOzi7ux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMSBTYWx0ZWRfX+XNZqmGi93i+
 AE6sg4zB2KjmtTsD2aJHnlmYCjcITEuxmX/DQQqU/24ZmcywUJ/MhZWGXBr7CBNPieswvzXPrms
 CAenwixXjn5ybLPmHvb5HJ3pDoDZoCFmgHCSqIji/ybtvgG4g/VEtMMUR4+wRL4an7YjUBxnWCk
 RaK/b3OInXcWh/UCMTmqoiZiT3vLPREoUjpwUnq87uT+IreyEdmbpT7+OEEWUHFd64KZhe3dIhD
 RVW1zXIytk9jXV3SPtTAQ+xckMi71dVb5xd0pdNr/OlN/MlvDmOjiP39QsGOiFwC5HRyulk3KX8
 xYWWl+dpmPWdYTlxePGQBqnKiW9psC7h9DdmFhW2f9sQoNHPd3M/VIw2AHEkRYToZOYQWB5PA+2
 bdVDcYLCrliFjzsXPBIfQTNjMz4LRe7FDLF5vp3aSXGO64paLiOkvjQ/rwdnqB/syJSEmguBK25
 C3NKdM8Xai3FOEBpicg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260111
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100126-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.8:email,0.0.0.5:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5E59337F72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For some reason we ended up adding only 4 out of 11 compute cb's for
CDSP, add the missing compute cb. This will also improve the end
user-experience by enabling running multiple AI usecases in parallel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 10e799dd4a78..38fbd44c7d8f 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7739,6 +7739,55 @@ compute-cb@4 {
 							 <&apps_smmu 0x1964 0x0400>;
 						dma-coherent;
 					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x19c5 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x19c6 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x19c7 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x19c8 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x19c9 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xb>;
+						iommus = <&apps_smmu 0x19cb 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xc>;
+						iommus = <&apps_smmu 0x19cc 0x000>;
+						dma-coherent;
+					};
 				};
 			};
 		};
-- 
2.47.3


