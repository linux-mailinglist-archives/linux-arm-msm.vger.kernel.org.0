Return-Path: <linux-arm-msm+bounces-118764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYy+HgrZVGowfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:24:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7C74AE9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:24:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PqjZ3sox;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gxSlukUv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118764-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118764-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F7C13075362
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FF33E6381;
	Mon, 13 Jul 2026 12:18:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511E388E4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945116; cv=none; b=EvH1jzUoVbvq7suhTsf5ctJNMqcCZtIKz6ylmbdpT5ad56VKOMmW0ObKQ0hXufNyh5qRaANlwI2U8Nb6D4Sa1RGM2i753og042r/gV12HFPhQ9Ywg+1MaoBq9b+zSUpoOBO/8FBsimAiNXZPKJMK1JsnhkDb2Crez022R0ucFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945116; c=relaxed/simple;
	bh=3H33GfzAIP76oitt3B4uvJkW3GSZ5xl/RIys50/AQuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tDs2LWaqxuj9v0J2//Cvx6pxJKQi9dyZ+QRB3mggW7jTcxgtVOFrHzJuxQ726/bZz8HeEnYGiTuxBl2/yuzCez26+bhQkk8qQw+Xxqo1ed5FlfItm5Nk0mS6MMwy2BxJmwkC0uN5pUSeUep2G6yjl+wo1YJ1qVLaeyWxNJ0D0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqjZ3sox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxSlukUv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCELaA1333515
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YeyQU+5LKQejPxEv6hTrwhVsNk7qBCl6Xr5
	s2PmOHn0=; b=PqjZ3soxVynWJD+VJoFwOB7OMe8IMS3YlzkCOHBkF0xF1RUaQDl
	K8CPnc3Vb6FJAFXml7prMzvYKdWnE4DSsRmc7IbcwVt5dU71eEIrT81xREDBdgZO
	YaFy/Uc0kC8d0ORSn0UWQcgONtndN9YL4mtkuSBTHlDmH9jLwPctDeDgly0lzvS9
	b+ZXsRnYVLkpodTLsXA2ZgZLbVKFJqeYm6OfWNQH9qJ3tf9pKGPJM7BxSUlnuEKH
	M3NaZMwuhZKgI5HX0eXQX5kTUjLOw46If8Yrwmu10EHDr57upPFC2RToLCZKE0oF
	aw9YC0T/B2Ki0BpaJRYt08xZyFXFh5o3e6Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hegk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1565288b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945114; x=1784549914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeyQU+5LKQejPxEv6hTrwhVsNk7qBCl6Xr5s2PmOHn0=;
        b=gxSlukUv92X8eeRtvnogKu3XLkWkTuy7423V2se9YqW1VIOOh7YVlIhJoJbAmF81lF
         A04uUc+L3KxvGpj3jKUYTu5p5tHqTSgG6cqAWAkamx5rTZz7l+bb2MHAB5+CPzqFf/EW
         UvjYU1oxjLkwmuzhr6+AOhXKBs0Lq4GAfL3xUBL8dtlChQsL4cdDsTYyZ5LTCDv78qGx
         NDZUuibRQZEFQ606A9APUA0mL9FKENxs8fDg6t2zY5oL+uW3nrqvbaQB8MTjbSQM4AfC
         dbJmeghdgDYZO5F2LfnNTFhQzo4s+9Pqtm9mduPekdBPqD109l5szS1NbKjCSSRQyMxI
         S44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945114; x=1784549914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeyQU+5LKQejPxEv6hTrwhVsNk7qBCl6Xr5s2PmOHn0=;
        b=hvzS5Gg1qyQXaX6W+hyEHlyWa5p5Fs+CmVjcGmHCzkGkRgjCnd1qFgFoQvlzhJkqGA
         QWBvRYqAy6pvbkyTDy6CUt1qsx6tM0uTfWtjxX2iMPod0NpHeVCVeAQ6iCUdLq0mwRWO
         phcNwdb0EDJIsXT6+u/Xg6p7erR3c7AEA1tsolB7IlRHVWFG7pMEDg6RhsrO1wpJux9N
         oK3IJCut8Nhvn0nc2PEoUV+oB8L05Ogidh8Y6kGsejgllbpjS4CcaFFdfnuk5HjmxN9A
         gGixpkBsf5bGKu9YMf7ZZBJI622u03CySPbWOJcAYMOPnWV5cgjHxhYUTI2FuW9EBAkr
         TCaA==
X-Gm-Message-State: AOJu0YxzT0xI6ivaNsM7rzWwiXkMz7DMRIbA1KcbbmNLYjgo8NDghBOT
	8NIph3GVLBT9ogi/iFjM1wtOCMQiNw0EZ4OaTsndDEAk/WIpITtIT7fGbjflED0exLxrjFE2IK5
	1u8VIHR6CkS4ZDLMidjZ4g6LndoaHcV3HLGBgx+1C8NlMhQr5GX53ufgZ6G3eiCNQmgtc
X-Gm-Gg: AfdE7clYydzOwGSrtATf7w+AxsRo1dmrqHpu3Ltoj21ATcrpShBTORxwe+nwIhi7sbN
	W8aHIdT0Y+U8A7uGr4tOkWqaMhL1TT/Z1K+imgNWVMlRKLj5aoBdWG1pwvQn5qYDYHH8HV9saBv
	KfHXynVvE2Iq+sEpTVcCxW/oo0GRANsjPqaS3kan+KtFFLYH93ZoudPPqDHSGJi0rQ3Wrhpixxq
	tuLa8GUN3rnaNNTmR/L4JxjkR3Usj4/kv68SkuKxAC9RyvdFWHIfoeLqnIbONSvDBqtCRx3+vnP
	mVLwMkOcT5OPfXHJFjtfmmlfQlQHMEBXFgIXdHpGm9QaaezZaJhSSG8OCys4BksvBQXywKm5V7p
	VIzLYO+6LpXKM0J/xXTMyBwoULr+7s8pl/FUhLqGT
X-Received: by 2002:a05:6a00:301f:b0:848:3576:3204 with SMTP id d2e1a72fcca58-8488ad07e25mr7451847b3a.34.1783945114276;
        Mon, 13 Jul 2026 05:18:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:301f:b0:848:3576:3204 with SMTP id d2e1a72fcca58-8488ad07e25mr7451809b3a.34.1783945113757;
        Mon, 13 Jul 2026 05:18:33 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4375340b3a.16.2026.07.13.05.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:18:32 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Mon, 13 Jul 2026 17:48:14 +0530
Message-Id: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fPqdp41GM2Y25tOKNUDYLunGbCpPCo8x
X-Proofpoint-ORIG-GUID: fPqdp41GM2Y25tOKNUDYLunGbCpPCo8x
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54d79a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UXKuTb5PfgFJ0Lj5Uo0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX1wAThwiCSO2h
 BDLHEfPFiqybEs80EYj8lNv0gdbmMeKYGzZRU/xENxmLFvqqjfEQc/DBy/KuHuXBVE3jRMUrbe/
 IBNOSEMYiEYMthAHfuLoMfRPFUG6YcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/P0zirZkX0/w
 I6sTSrAOlKCOy0Ix14Ax08RBkqUzjMnfJj/mtWIqSiSGouPkav9ovPgBzila0VYivMSUZA7PGxF
 jZs/SZS7wEnkladC72RDQMw/YbkM8QzFwkjWTYQEq62dZGzPWLBmPvLIDMjimsdzf7HjPX3mNgb
 hb91c/0EjXVLLRUCH9U83IoFX0n2upyit4mmchMnpV23UJxfEZpw8lPsYSGMLVgTg1f9qyGuS69
 1p9FyLp5NLylrCqsCKnqIvaDAL3r+fntN8imdyc+A/czc/bT6MG3CReYK61FDsILvfZr1bmY4kh
 oaqK73dF3svpWc2OuvjnOLdryUr1qd+zs/1OYUZtEzIsWXwgGB/+9r+PBWsIqrupqC0u4yQMYuh
 +08RUEcqttsGGOHhd0oh578tA6czFAGKEYyy4rcQC/mWEu+ItYVT6LqDBwFMby0xd2/RNsFHasI
 p6+KMPTS/I/uL4cSU0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118764-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD7C74AE9D

Add audio support for the Qualcomm Eliza SoC and CQS EVK board.

Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
WSA SoundWire pinctrl states. The macro and SoundWire nodes are kept
disabled so board DTS files can selectively enable and configure them.

Patch 2 enables the sound card on the Eliza CQS EVK platform, including
the WSA8845 external speaker path and DMIC capture via VA macro, along
with the required LPASS macro and SoundWire configurations.

Changes in v2:
- Fix node ordering in eliza.dtsi, lpass_wsamacro and swr0 nodes must
  come before lpass_lpiaon_noc to maintain ascending address order
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Replace gpio-hog with gpio property in regulator-fixed node so the
  regulator core controls PM7550 GPIO8 directly
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Move status = "okay" to last property in all override nodes
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Link to v1: https://lore.kernel.org/all/20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
  arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with
    WSA8845 and DMIC

 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 150 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi        | 192 +++++++++++++++++++++
 2 files changed, 342 insertions(+)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
prerequisite-patch-id: aaa4ebdde2d635a3c5efed97e2105b38506f5f2c
prerequisite-patch-id: 707f23d1ad401ed79c1a2812c294cca66fe9d9d8
prerequisite-patch-id: 84282f8a368672c3f0f8944c442c71713cfd7390
-- 
2.34.1


