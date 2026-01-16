Return-Path: <linux-arm-msm+bounces-89468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFAD388BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3082C3001EC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1AB30101F;
	Fri, 16 Jan 2026 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNoEiUGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSJGTsTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CFB22425B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599843; cv=none; b=eYrOGwme0rM9Td1zwTo/aX4jS7Zq4foijaranxnjPA4NbLlc14HqzhwYeLo/+Zy4PVYMxa4R1Y62kOPFWCR/kHwB9oBwk0NtcnQiaETbardJuSQfSFhxIgRcVGxj3/ljYzWf6M8PpNPGOZQpgHGDMVYx89luGCVBYDdan36KQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599843; c=relaxed/simple;
	bh=HDjGJMT34IohiRCOOuNgq6gxCU8IB2yHdxCtwJ57gck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sBF07uM5woAiKc13nwzCJvc3kDeLbYZo9oPz4LMZgkK9wc2EFMw0o7oX9S72YIAvoxtfZeGONGQU8DNWsTFKiAmWXi5Ryfm+ng0AyxyQra3mnele9iHgsDcpPGhhrlv2WhbHR3LjtzHAtuTeGki3UaO9zlAe3Mfh2ROYQy4P+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNoEiUGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSJGTsTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKUpYp4026836
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VNoqiC//E85gHZtN2/oFbwvGsCoNOSLzjOl
	BzIhcmU4=; b=aNoEiUGK5sYMoy69uDFzGY4xwBr7FktKF5vnssjRVUUxawZAi0G
	IU6YE1stjPXWRizlbo6KF+3zXutrlxkODRYl38/8cEVThb4YDMFHCoOUmJklGt7S
	HcCv9AvY/AFcU7QcihOHqkWbrxHk/fvxDfZ9zDXu+ovO1T1alGAB3ZjsPALvlUzb
	i0ok7wVgPIXkduQmsQKIGkyTg9RT6fe9+eZ/D31zo99EJiTAIQ1HOzk29e7dH1am
	aHAtLDfhluoZgOb+8qpXVZqaGAPqx2c2tumqeKzdpUTrXd5B1UENks0K+5PxbpiT
	E4gq4HYAcUCn955SGHJGFzGwK1N1IFBbI0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqved059p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso672859785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768599841; x=1769204641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNoqiC//E85gHZtN2/oFbwvGsCoNOSLzjOlBzIhcmU4=;
        b=iSJGTsTRu0IdZZVe32WZfYZ1kgYesZHdmWYVs2yufbejMNUgT4F+hqu+PDbDy5yctI
         o93mauWqyS4L/ZEg1Sza/XxCRmLkYU4JGUdUbEb2NpEal2rdstZ+LQG/R22Tmki2bpWn
         3Zjg6rrMyEv1Zq33/mutahnet8dVMGi/jtnyU+bLRQL0ahqfQJFEXwYvPIBOBnRFpytl
         zQGgsSVpjl/rX+NpfaTrU2cueIZN+lyFHGHMT9D6U5pVT3ebvhxN7GQ57+s8HDY3CJuI
         GRCef8uSjaclHNVZZqWwLzSL2R5H4I6ZSbE9LOuxXlOUZHuFDNNgdvh47Ne2yM8a+bML
         rYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599841; x=1769204641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNoqiC//E85gHZtN2/oFbwvGsCoNOSLzjOlBzIhcmU4=;
        b=eXUJh454BJkDcOCUs4gAcLlXEmdlRLLdRVxdPZKNnjMAgIe0SVXht9dD1F+yUlNgGb
         NrCNFJ6LuZz9SKwKX0Bhc5GI2DqczekKR2pdCUY3hCJj2nVVDRqidD4x/diljBUsRhQh
         BjW4EuwKNJgDlJ1CGxjZahYn9fL6UTXCQ/6z9qmGBlA283YYh1BGEm6MnrcyP7UAM6sf
         V49lS4RddeuiQ9c7WXm7hRNZGhG9M59h5zC2twXc7j+m6kssW3m45vRMmK/ii5bbKGmy
         cQ2P2CN/Pnl+ilTL3ac+doItTjhRh9t7nPDU6AwUqJ1kZ0rBKcpLMkTW8Ibe5/4GTXVF
         CIFA==
X-Gm-Message-State: AOJu0YwWHV5lcPxQ3muW/SDKA4IEUomE6vskwrJs79DtfErEgP4m6WoO
	lU5eG5uUEgZ0fNOl06dDu+1Hw37yqQPY7gZORna27yBliaXi9WXI31xscusynZK8FMOh6kZjNCa
	Uuc3xccnrP/So6XeRoNm7tNQEAUExifE4ldJqFfKGl+oJqAJ5rWGIk0+4dps/2Np+K1oL
X-Gm-Gg: AY/fxX5DjAMKTuYRmUhV3Rqvh8m9FNj5k2a4CgDCunB+E4tdEo5vj53aJ8r6glurbSW
	tY8EPdfz1OFs/aW5izQiEtdkXICe83DKNb5f3g+ImWYQVpsKmBTNaJbbrMnF4SI3Z5hv2iCVlVN
	kx618w0Wj28LyQLHfC3/DuydNDyNrDK1RGSOdZ7IOJUuwDt8+vJO9KfUjsR0JN5Kcept1Ve4Pv/
	j7uHoy/3t5bUDthPzH9rdCiwW3OpAMu9A1b61KqsSKfQNSvBL/8Vq+WyzPQ08ibjj6U5ixX3y01
	f13yLvIi364g8hYFEvMoxE4VJC3KH9Tgp6qfuEd4LX8ppUc5BWNOW8VB8V8qdFs7tz0ta/bZZXZ
	gQrHWpCjhwj4lupdWnBdvwc+2HRHflq/uuQz1NN2m0xWWKad41Ac2lfIaB5H9gXJ2A2Jb6DRnXi
	JV
X-Received: by 2002:a05:620a:3942:b0:8b2:f9ac:a88b with SMTP id af79cd13be357-8c6a66e453amr599875985a.21.1768599840810;
        Fri, 16 Jan 2026 13:44:00 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:f9ac:a88b with SMTP id af79cd13be357-8c6a66e453amr599874185a.21.1768599840422;
        Fri, 16 Jan 2026 13:44:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:910f:b77e:d7fd:93ac])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce433sm3479743a12.3.2026.01.16.13.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 13:43:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: monaco-evk: Enable onboard eMMC
Date: Fri, 16 Jan 2026 22:43:52 +0100
Message-Id: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1VbPxgu2j812EEjysVRGCCbQQtv4I6Xy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2MiBTYWx0ZWRfX9jvHfsoYFsXr
 WzBpm0sr0xysD6wiDT2Xxem/+Rjt2kOFrQblFVC32CsNSj+H5iArx6gLCVk7TXZINACLQndQjMQ
 HMDBYrnUiAO2bvH4uqLxeNIX0fpmcZ7Hxn4H0ud8BA6J4skmTZ5M3rKA1bn77BPyyY3t/FJ3OPC
 QfEuD5VmYVXY4oDvm15kPEBJBdD77y15RKdB4GdenQj8LA4cTgtezVOnHVcgqHq41mTttLkgS1J
 CDtPnnG1AJCGYADO8Q8r4U6yp/kAa5kfVaooOY396Hp33yEjJxIM1MpTBXrkLKvUgMSLjBRVaK5
 GCdbO8LSWXfEn+WinL4Pl/W4/TWS1BJwnLYCN2yhk2QDRaVDd0ylpgFRQvJj/bDBC37qVLJVl1c
 abdf1lLVO12oeZrIFwBgfhCCPj+5EkYXmEimW957ceJnst/xRsuoJNI5COss94IDxu3i16Wig/d
 xazOPwfIlPrAT0Okrpw==
X-Proofpoint-ORIG-GUID: 1VbPxgu2j812EEjysVRGCCbQQtv4I6Xy
X-Authority-Analysis: v=2.4 cv=aMv9aL9m c=1 sm=1 tr=0 ts=696ab121 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ib6eIcfWTTzlqJScnlkA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601160162

Complete the SDHC1 definition for the Qualcomm to support HS200,
HS400 and 8-bit mode.

Enables the SDHC1 node on the Monaco EVK, wiring up the regulators
and marking the device as non-removable eMMC, which is the default
EVK configuration (alternate config is SDCARD).

Loic Poulain (2):
  arm64: dts: qcom: monaco: Complete SDHC definition
  arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 10 ++++++++++
 2 files changed, 30 insertions(+)

-- 
2.34.1


