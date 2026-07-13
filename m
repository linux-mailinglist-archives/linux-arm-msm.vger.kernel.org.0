Return-Path: <linux-arm-msm+bounces-118728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6oquCKG9VGrCqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B0749CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=prfvBxaJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HB3DxCi7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D87EA3016672
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE7D3EA968;
	Mon, 13 Jul 2026 10:26:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737F3EA957
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938398; cv=none; b=omLOlgwyP3b/0Qoe4Czy8finC6RdQQiTV11itlyzCUeYZG+MZxXfcugTLvghkd/nwhD/4Hioti8SYkX4gH2uRNRrs6wyu03C8R+KqhAiTzbkvKWpUx/oaFmW+Gekxs0C8XKnAw0xfJ1fNCiVn1qpjSYlmHBpm53rCEONByPBBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938398; c=relaxed/simple;
	bh=pJvORH2B0CFvIb1tE1AYLEqzkZUM4Vp2vEOH40sQNzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDf0T9JGPKQz6sYhFCWmlOpEP1d94Wm1FtFBCQHue5mN8+sDQOtUrZUjYF/3Bux2Kb/VaZSPTEtXNEBMuYbvqpYrZOXuA8o9RwKo3AhETj1G0D6Ta3Uy0oNspUV1WD5ondorRXQzutE3IlNtF5sTFU8SlXwFQKo6+ld2duXHxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prfvBxaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HB3DxCi7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NiV8507140
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	db+2G2/jV4f6A95sH42c8phPYnw7WNjYfywj4FppW5A=; b=prfvBxaJ7ydTX9pE
	qUv1N1nEgma783NJaafHbHRhHlqHeZM/aU1OFuccHP1Zgl5J3lEgyli3t1JWsvwy
	kXMBwDNiNF3gRCzhA6rvA58HTiu3UKIZNu8DtCYUuyjuglRdIqrT/0AouTeueluD
	JoaNtKmRbMjlT/v1OMnd39IYZdNOCJIoqWU/P46JDRo7Al9E2DhMrIHlg0CR2j/0
	one640RtpCTX1UdClBEgxddOkJUoW5oFj6hvhMC4aph3Ev8/zofjT6GK1P3pt9/G
	NfV9/yO+RKpsGmJEOCHw/Lbgos9Z7KZ3prJT5o3n9tKWS/ue4G+qKXsYxyL/SseT
	YzzgRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h1qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3911595a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938391; x=1784543191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=db+2G2/jV4f6A95sH42c8phPYnw7WNjYfywj4FppW5A=;
        b=HB3DxCi70uGa02Q8B7FbCOdiBEkGCTtAl1K+I0xEpb+MRqA4XUQb0UzvAoCQw0LI44
         QRLHN0C/+kgZXcfjXb5cnp6W6Ybj/M583vb0gsUG+7J55d+wWfEYu2y9h0LlKoid5rtb
         TvASONInQ3JXYufwY2/cdqTmj2EScZzMZS14g3XFZUFj20aLMBAZZI/W8c/5JIguldwg
         hBto1HDy55M1B9QVGtKM1L6bzsy4F5FqtnOJIkMaluzAIvMkZbDgaq5DXiKGc+E5DRMo
         BqZLmTg+mBjiIPHdqx7gcKvKpPIvqMeRZt4pFof1DAdRmdLY512ZEEsqE2xpjAzFEXck
         JW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938391; x=1784543191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db+2G2/jV4f6A95sH42c8phPYnw7WNjYfywj4FppW5A=;
        b=FN4IWIa04C5T/SiW/jDj5qAB9mS2U+tpsyf6uYi8ws2TaMTCeaDXhj+6KFyx6eSyLa
         hOMvqpbuFx140Bc/hVqSmr1d/pAzcI+6NIvdqKKBgPEFLn9jFQXSv8HtcCPeRTJPGRen
         wnNmixQcVzsxup+FnXk1NyaLZtWa7dKw0Cz0nwaC/MwfmHrKBvy34DdYMZfJTywAvgpJ
         ogT3nLU0jkwUVLyD+J3UC5DcdAtQsgs2fIso2g9orXgL/x6J1c5t5niWfBFePJNrJF2+
         chREZa4wga3VZxnQPTdCYuhsEKsiytJDiQ3U2X1KrjQSackMkDwsMP52o6HUhMkakQuW
         8O6A==
X-Gm-Message-State: AOJu0YxtjfovDOhkS17lVfpwHuuj6OmAjJUDvLH2mS9cocociGadp5dE
	Gdm+w17/c6fdNkEQoKJ1wvRsOtCvXB7LNdgGr8K7zepw46Vk1qx2b6D5/l2L5WmYcNKnFJ3ld1S
	+h8vZ3xZHf3eDIzoqK0bd2omgKmrovdecwOiHRvd7dpCiEFqsLI/pXaXJhLjDOUQokhsw
X-Gm-Gg: AfdE7ckWgRFjMqXJSc4Ti0FBLpSkwNL5Hixlm89XcWHnpJXgSUhgvlDxm7zBlu7jFnb
	KY9ha9U9/Di2B5pGMv6VP9yNcB84moIv2fn980i4ZatAARXZBp2advYS/6RUcN+Ft2eJztMfAw7
	pvTXH0YYRc69ewrfzeypgFZDm6/uNuUBZbI6FpMEG/67ybhT1cPIzfqXh3X3/ioN6M/c1cHQ4Ma
	xVuG7oTl8jKHn9J2MIPNNcMr7OGfVMzcPUoxAcrk96veUtzh4Mmo3bsZoYJj7dDrW9hbk6O1WOa
	nYqDmk8jcCrzgxnAh/5C74otjAA2uiHloJc/0BwWuH0TOux/r7oq8Nx/RpdySNWBfz2h7ENz92L
	ou+bcfr2ptCb3H6NA66gaKqplqrJJnxi3oEJvjZw2
X-Received: by 2002:a05:6a21:748b:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c110899dd4mr9265870637.36.1783938390725;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:748b:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3c110899dd4mr9265847637.36.1783938390322;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:29 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:46 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=1193;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=pJvORH2B0CFvIb1tE1AYLEqzkZUM4Vp2vEOH40sQNzw=;
 b=E4XHVkRxG5fZ2ltmKZ9kmfJ7/r/dU7c5zBhJjFxU9O0FNgFv9STh/UCnYCKnUgPv1ejQ+F/WI
 8wzNd6um93xCMjg1kjK8wqNNgrvHZW5FtY2gdkNvlJ2IOJ8bBxTUgFc
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: wOPjK1tm10XmUqHrVH6dNpohv1XQ_Oju
X-Proofpoint-ORIG-GUID: wOPjK1tm10XmUqHrVH6dNpohv1XQ_Oju
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bd57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RDWDdWZ4iDCRx9RkWiAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2xEor4+YclW4
 GmeBSY2JK3Z16plg6wY4/eT0mn0mhW6cKCqGySW5zG9g86SlPnRha+HSSjMZQRGJO3fQM5iuC+d
 54ZvlPxcXtSJir3DmTFQi+SrW23H2ZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX7G+21N3+emjl
 rkJcpoeqWH+G1THyWfG8OtZT0cMpNZGgwARIZI9+ERFXhMmmGRUspgvoyxVFUPOis4NcR8LlmQ2
 GszFLEghuP7uABS8lVAQpsn+w+jl076Tg1PihKCxONWcGIGPaJzmcpkmK0Uu/73zmZVKNwOro9P
 ETcux0a7ruJ5xxAy2np/1OrZvrnbyNi8xkD0/yiksW2XPj3TqAtkS2gWj2IsXXnTDus5drKmXjp
 3x2WPauUStmiVqnskyMww4RH6sqgGmNpv0gp/80yvBXqZG0orOnhSO3e53Pxl6Lv+nltH8NA/ck
 +KXWOiQmfh13misIrN2Ad3m6LGZzCklDH5H/k2L6NXQs4TB+kqr64l9gjdrYR2QACuuq2wm3M6+
 72AczKWrQk1RsHLWHivz1xAHOkzsahjQmFV/hWSmWoIr9/TVl8pF+92wB27CWUhnQHbJlfZLbAH
 9jCewyYMyrZFqTxgcUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D12B0749CE9

Do not mark MPM device as power domain since it leads to idle-states init
failure because of probe dependencies.

CPU cluster power domain node is kept disabled and hence CPU cluster will
never power collapse. Do not register MPM under it in this case.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cpu-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep>;
 		};
 	};
@@ -281,7 +280,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1


