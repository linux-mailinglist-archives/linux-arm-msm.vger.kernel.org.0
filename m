Return-Path: <linux-arm-msm+bounces-96468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDuTM8SRr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:36:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D428244DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49ED63030769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC183B961F;
	Tue, 10 Mar 2026 03:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV4HOCde";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c26nDL74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20605392C4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113794; cv=none; b=lpJ6oH+fOSVWiC3tmGq53q4oI3JSufjSsnVXuc/CWUJpneplTQWvsJO0b7NlGKgX9V9gyprVB7OfgPxIn3EqebXznmSoFsGJn1VXlhejx2atOe0oZ+54ax+3OaQV+89JH8ySwh+Ajrd0bgfwCHaIfdx1ERX5c6YbxrZoVanm6II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113794; c=relaxed/simple;
	bh=UZqsG1l1FYP/qw2Do3iyUOeOrDb1Y45bUAV0oMsrKOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rlI4rJqaIiiG+8Nib4ztI2ipIKlMlPlvPkUqJF1W/9HUe4vmsOsWPvwzjFz70SQyfnuelMjxvdDn8PN0xVO1IqVofPNZFtEspP9pBXqLvY87Nq5I9Wvv8/2/ZEtRPIYlox6m+cibo67a+/omPMoXv8Dr7J1x/gcbMFXmUhNstA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV4HOCde; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c26nDL74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EObm2817430
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BctsGw03G9IPD/DsgTi0UPGzrsA0Ri/tv2f
	hcq+4PYU=; b=FV4HOCdeTAj8t4eA3hZ0uvgTfWnntoKaPDZ4yemnxLvhjkCdK9J
	O1IhT+Ip0X/4Zwean/1OHREXCucQ8czKDsgpVxTRzsSf2RKCreYu/T1H3U+pcfoe
	vijt5txtxDioasmjANw/3eB3eli6xbNixxBzJ+TelEWoAs2F939wTePstw7iOJ74
	uFh3qGV11FR7lPTGZai5WYLHHeO1m4lsh025qMvRwn57Y3fo3ovRuYNOJSpca+lm
	FXqVOweEEIXcsmxVuP0IStKqiCXsp91v4CE11TXS9/fKzkgRiG6eoLtkpKofjjVW
	tvVZwuaY2m0qXNcynprgnTIBJkB54DlMuaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr42ag6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35979a03106so9476556a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113791; x=1773718591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BctsGw03G9IPD/DsgTi0UPGzrsA0Ri/tv2fhcq+4PYU=;
        b=c26nDL74BXmNisCf2ViEaNAlkCGEjkNnEC+s1w6Zny5ATVjUous5iLZlZPqprennfm
         a5p3IdhePHatno94uGbXNLg9lWKCgzQ+EUzjDRsdXb4dSFzT/WNVahmuDGOgCTmGNQDi
         q+spXMSNfzH0GN18nZNh767icGLqOIJOQ5tC/+IycKoGiDdFRGeceu5E9D9/zK0kkInm
         NnsNTLg1aDjByB25Ku9SekmoUrt5HLRWRii8gLqNywVP4MFxm4lGvt/KbvHaXZdvWg5V
         uGy/qb9syAIG+0zh8Up6+Ye2B6lpeSNdf98mudP1J/juWYP2LPa77p3UnP2y3jDGXDdq
         uVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113791; x=1773718591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BctsGw03G9IPD/DsgTi0UPGzrsA0Ri/tv2fhcq+4PYU=;
        b=jTtEyuh2aDNs/B9kRIjPMON/wecxg1Frf2zKgYVer7t8fTBvx/b2fKuU5BGaewjvGs
         XwBoMUM80tELRJ98y5oxDNW3ik8vweXoKCHR2znJeAEr7pu9mg2PAwsRa/1Bnz/8Y5Vs
         mcjvFcqD5ZaUXKTLO9AWwRxPs7hns0+YT8uiBCOTQ4Zi8aK7yZHl+kvZYKG08yHzabYo
         QmzdbBkqWmHRo/EXlMLa5VVdaPC7ZJ0ynN+HXMveQAAChNsDy1ey+fVBCLiqO4QQzLdK
         MeY33y7VeAzJOX1JhAoIj0Os46hY/0wamd752+2WfcKdnM8gBJVHiwRHPlpahuftaTcc
         yQWw==
X-Forwarded-Encrypted: i=1; AJvYcCWkkXbzm9t2X8Nzit4fURPYFQw1jNF2RU3TO1Uz/iuNBoBc+C95c6aJdKSLGO1TDsKK9VO5XfONJjKUhA81@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5KO1XBojzIpVfUYUzK24UEZEIuqbNjlray0hsUS2QwJ3awQPd
	pRYuzW1Dr23maGP5q658bhXiV7IWKEzdyztsD++/sGaBYWgh72MEWSOIAmkN6wASwK7ccX3TQZf
	p3dyYmM0UmMIKOhpIbRx1SBHBNMTKX4bWGWe1MvGFkPE9gYj4rItP0kyoSCk3yI/EZ2R9
X-Gm-Gg: ATEYQzwRYXiuAPCXFlvD7njmhkxreRSfXH4bkcmJA0PptlXZnPSAUuXx7MfhaAabRBa
	jDrC2HW2gS8eHHJxEm45I5Lv7DfDg0NaXKHqg2MhDg7XDDnNExP/UnN4OhtIXo2ZofsI3pYM3co
	MaGmud3H9H+h6bhsdpn9fw/4rPaNHVNYxtzJv8AUVeFS0Oy9cVEZURvT6F7xhzlrTzc9PLQvXO5
	vaS74nnWnw/z3uwQiLbSWA/GkpwvFMKxW3WgmTmL7FqVDorfmoYdAWjIzvsEfLTFBYMJxjTgspo
	uWL/qYuNtklCsvHcLImPoLV9hRb1JzYGDMpFmU+nHY51+oFtL9b2w+jljn8Oo/7MzdMH48VsxTh
	yb0bQ7Z4sTQTyAV1xgvH7mRkMaFjdCgF2bTS7Vr7N0rXqp4gVX6qtAIz4cKHzOIP5j+smdhQWRr
	6O3fbrECOJ7uXiQkihLQj6VlhwLggpO39X8lwf
X-Received: by 2002:a05:6a21:71ca:b0:398:6e6b:da1e with SMTP id adf61e73a8af0-3986e6bde4fmr8743073637.28.1773113791053;
        Mon, 09 Mar 2026 20:36:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:71ca:b0:398:6e6b:da1e with SMTP id adf61e73a8af0-3986e6bde4fmr8743036637.28.1773113790591;
        Mon, 09 Mar 2026 20:36:30 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:30 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Tue, 10 Mar 2026 09:06:12 +0530
Message-Id: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX7Q1EsaPnbqc1
 o2hAlF6zKmne/jMcVVwHMAV/TBr4+JblKKy/nKWFysSsdY+LZhOkoz/EcOIHvyJB+42xloqfL+c
 uwTFB5Xryro6beY0ZCQizALO8ULX0IV+BoSSgrDfYFtZu7H58hYQiZpWyCvlhmibhem7pVtr3VZ
 01YhkIHwWtzJh8HYhaG+4FVBG1ehd7T1xx+t/pFnSWW701mMcCW/zXEvOUX5B0phhuTNCuia3xX
 Wjk07uEPKh6a1ZRE2h8KmGcmKhHjpTbJErgxrR4SZquyn7kNJ0bT09VTLWajUb5Pfv/zxxKBZTb
 ZXvH9XX6dNynfCVZmBmAFOKUR/3WEu6P6qLUxVvA18bCSdZfriJDRu7qF/KM7ehM9kD9bnu3Tym
 nAs0PH38M5qiJkWeOEW5OFDxgBS7DYCumNEOG9pO0y+L9PVHscpT6G7zxOGb1XmHu7OyQ8Uxvk4
 C1Tz1oNtxDuoQyixrPg==
X-Proofpoint-GUID: btwE1ZBwak5qojlCBX528gQHfGCrtAi7
X-Proofpoint-ORIG-GUID: btwE1ZBwak5qojlCBX528gQHfGCrtAi7
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af91c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s31CYYquAgwWBkh-MLYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025
X-Rspamd-Queue-Id: 4D428244DAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96468-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
-Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Sibi Sankar (5):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |   4 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  14 +
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 286 ++++++++++++++++++
 4 files changed, 312 insertions(+), 3 deletions(-)


base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
-- 
2.34.1


