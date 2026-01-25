Return-Path: <linux-arm-msm+bounces-90464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB8EEiI4dmmTNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:34:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D07181406
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C221302F3A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3D132571A;
	Sun, 25 Jan 2026 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovh9zf6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAGTizYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2ED325705
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355192; cv=none; b=QgxPuJO418AFBpMiX04ZW5RuzQtrCjI1o1fMASG3CV1A90i5o8U5iLHKBkBY0J1Th0Fs6UP3Sc1Knw1zuZ80MbZSpjtP9uqhFLrlLgio/vCPy2ZISEvLfmj31SruOcd/ZtTyvvTVMTVIBHb6eV7BbQhtJzPOSt/SAUo4AhhWHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355192; c=relaxed/simple;
	bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp3RydTNTj7iVocfylrMODfZsZQvzoLU8LY6kfRxfyPYGEOCbEHdbbKAJGnFfcMWF1iiDHel4y+GfZ8CATwOHhjjDwga8C7UndRues5sKgnmgC7orXcyQ4df7lejKz41WLiEOhuZ2DvLLr+IKD+RYyy83UPTU9YbX1w8jxArh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovh9zf6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAGTizYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OMP24C1547356
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=; b=ovh9zf6wlMl+Q7vZ
	Xwv4t4ADzIfcX2DYHPsVtiKnrTa8dm1R9tC4N+pymdki76GWYt6QA6PCLVa2Ggiy
	q0xm0ampT2p5BIgC7PhQFD4RusYg0MWD0u4ZAm2Zwv6KEhDgnYiFH9plMDKTa3ed
	a/tpswVv1xyCgvu53JHtbxpWUxdqjz1DAD3QtHA4ySbs6Gep6cVRS7nsV0eHkymB
	iQCggtWRbR2xkTI9HR4CVrgQ2KiD4tr1nGrpCURXxAP3Uxq/krPaTCfxsM0y9n09
	UfUaZh4XyfcUYEGXfkAqZtWfHaqKg7AS07bWjbk2DmKagRkI5kNqrqJ4s8sx/lA3
	1Bq1SQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wst70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso41361985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355189; x=1769959989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=QAGTizYJgrtmnNpjH49irnsl++qcjndjRO6HOVQ6/6ItnFVvrkwQG+XePOw6q+vsF4
         NwUoNEPRBospqxHYtoTzZLx2uOyIsECEP7IFRONlJJRYnUnYc6rdS1EVBWRKqNTLL5k4
         QLTlLXsXUIxuONXT2etBs1XvNxocohqreOoaeMBDKiGAG/4Ka+qEmwGT3bNGbg+MGjgk
         blyLmWTNnZNua3XMqpKRZ5k0A5A36okAXD3mFq06JSFIHEdiJvdZ5QTlVRusVfxj3wT4
         WI2U7mEDN958fSkYrQiV7zsyF1V22TxgPYr54Pv5dRmJBvhoD7D9zDbq++jNy9sUZnN5
         NlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355189; x=1769959989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=Rvw9yDOcbbPOyXBapCQjLO/Jga8lkZHmXMLiAXT1dPoqsnRleXtRbCVsOatGpIHOLX
         /iKK9A0QiiP9zVMmLaHVmwIuUqVFlM3FsG6atbuccf9XATIsryrdOue8PC24CH2ZY1oi
         Vbk1LTRfymiPZfWbZLzYjqM3du62TD/1sdmjBYKAvhiiNeGduCNUCRARlV2F9Z56bcst
         JH0U9y/xc0xEEIF/BoChtWuHOfugF6PFRw+SHATpJxIj//BQvGVRePF4YqR0TifLnP/+
         d2F1TmB8K/LDiOI0ZZg8o+gxL1uTau4rcHk8A9Y2wbEa5Uxji39y4lcOSrg/AkCNEzXZ
         rWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN/ydXmP0kke4D6FFzgE5EkRRLHJeVX6Q9Y6o8h2rmK/2lmUp72qv7NvS8CbHfIAb1/4PQiPjczvHSmZ0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7hiysqynPA72ySGsh8knnXjNuQcfOtvBbG7rM3GyKnQzwlnWd
	3uwJRqmMrutmfFAhBlCZBgRnQsOs4Z2aJRt2ChYouGmRm3xHzYNiThJh6Z7Aeea6KR4O8D2vnVB
	mTkAo4DbuvbS6nWqolE/MSlbVNVNcKmBQim2au+T0LJIfIvNRd6DhgDSWmnEwuB0NDfqAvMt3If
	dC
X-Gm-Gg: AZuq6aL918u2UcaYc1880TXJQJ1kS3N94olaijNOUqOTyluhNpqJs+hnT0TTvSl+qM7
	R/Qgj/2gvhzqSjya92nuYRbcnYYI0rJ1FYRsUYTWBNAe2+uOnV5clscvBEeo5+3l3m9CUpuTIcU
	3MZfEA7J4An+nnnEyJ1uFPmsd0cbErxd85wOuj7WVyJ1CKBLw16Va1eIXYL9pFw+bpjGYgfwl7p
	C+ECKM/2kBIEKVlbhoMCSnVIQgYJ7/X+knjiD6NQPLCyIDhu8rY9G8jkFhB5NFZKZkhZS5LHi1k
	zabgYFnB6y31LW213iBPK5DhuhiMtOs9MkLpmrfKYehsNL6dt4wRwZ4tus2WLFSuxaMZjGObHGe
	fowJNNvMmHr7mTxA2pAMTRc+ykxprwMrqiwfM7Hn6TIicHeIJW3g23Fx4H7UxLLr0LqDZW6K8vv
	YO5LRt0yfjGbUBJ9PK7ZxhUYA=
X-Received: by 2002:a05:620a:8b17:b0:8c6:b14b:8a6c with SMTP id af79cd13be357-8c6f9572a75mr157736785a.6.1769355188996;
        Sun, 25 Jan 2026 07:33:08 -0800 (PST)
X-Received: by 2002:a05:620a:8b17:b0:8c6:b14b:8a6c with SMTP id af79cd13be357-8c6f9572a75mr157733385a.6.1769355188532;
        Sun, 25 Jan 2026 07:33:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:00 +0200
Subject: [PATCH v3 3/7] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-3-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjesD1a4RxxNBNxxxD9jFoq3Kt0SH2L09if81
 T5Ari+O3V+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1e7FB/9ks/6z7PTg3zg8PbMYeD1FIq1Bm/HvznkTUZtHSpfxHNn2bOKEv38fCxu6fy9ea2vohDY
 Z4BGT6oYjrdKomjyq1zUvywEngHeQNbmy1uD/9zsoq2F/RmzPNL9Hap0jDPZggdpZviulm1au/l
 vELPfGUA+AwcD6mWWakuHrMCs8EUYPclQkaBnyVYhgR4h5lmrOYJe7T96oMMxisOORVz/vUolu1
 3XQCJp2g1bqK271jbWQyYMK+CzwGhsHtU0ZZHwgs20kK/7Nw778Q6Y0tEXnPaF0WpUIs8zrQEyA
 ZoMYu/FF9OlDIwEzX/LqPkSz1sDmNr7qVnjhca12yGlmhYi0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cX_w_0TT2_xVGaUufmCQkKdE-Y5_GIv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX33zTJ2bicLta
 2X+mHZB9ZSqQr1uokv3RGHMj32O4n5nAtmGDKZPw9HiWPjnn1SKa8EBkxIBJrBt+VAntyj3dL3f
 341M+ywECICRDHJeep9ljMw2fmej/Yarp0sP3fALJ0W3tNeigMBU+c94E27RNzZEFdBhQqckbF7
 xgxiLJDU+mQgO3/uSDwQXGLywXuo1uopzXakc0FJt74WzvVbTwEcPWPGNitf5frLH3koTmaaYhg
 ZVXci+xElbtbbqK9etIO6lbvoUbhMYvJ+uNr3z58OmK6Y8TWzl2Ske+KFiUpXDLeSV4uLJ45inn
 vSLTBU0WMmoy2JpYxwO3cXVwjQD1s27Q5cBDnZmFuOPGNkkUXpAKLGIkatlLWuhw7AtH3by0+xk
 w42YuQcYQTFqDI2lUrS9T6w3Woq8/WqT6VxsppS9+/ndWj1tDO34ksoSAH6C+vMeotINLFCIR5v
 jZpH94mcBSoLWRzeNpA==
X-Proofpoint-ORIG-GUID: cX_w_0TT2_xVGaUufmCQkKdE-Y5_GIv9
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=697637b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90464-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[8a100000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,8bf00000:email,85b00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D07181406
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..41c57e7dc433 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -691,11 +691,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -711,6 +706,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3


