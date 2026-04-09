Return-Path: <linux-arm-msm+bounces-102556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB5qEL0T2Gm9XAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:01:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F03CFB37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 364383009E2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EC034E777;
	Thu,  9 Apr 2026 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c85I1AWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW6szNAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837B0342CBA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768502; cv=none; b=jrYDPKaFZ9Ieu1XY/Q6UeqKHCtzT2j95VasOtAOkiplUyg6f8haybSIR9I7DKr+S4jKn9oY/Puo/8rpN+0YH+dVS9C47EP0FXNQMuGvQbxXpv9wfUN/S22bJZhueeYUg2ZZnjdj8xbwb41D4U4o3aYGgcjArhh0fk5NHrW0fZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768502; c=relaxed/simple;
	bh=vZHVaFbSwQ1qSUva5/AHIir0gLS9fMoZzp5OXBqA5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z82X/6RY0h2S4NNpGxZ+cEtH9Joph5EdbZ4SVYd+I472SBcu/q77/xlucIfPFBj5KWKtPqALFBHg4Whx4bqJkt2HYjs5tLbW/B3xu9o1Z292f0DOMQTyun/vuRB/pGgeng971i2Tx7bsp06lJL2Fj209xJk0yjzYlXH+VKZDWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c85I1AWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW6szNAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KPJhh731207
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5dEL5MOodw+HHIahyhw+Hp
	mUMby25CJ3xWcG0oDGS5g=; b=c85I1AWg14+OWNu7z3e6Bj1RuzgGV+X2eey+pn
	+ZduAVIEPhxv0mFsa++QFSwAyynp+ULcSswe0siaht3SI9W/4mBGISctFw2fFOFf
	J9I2qJ5dXI5fZv5Tb4SDyNK9rMG9hP+2nsOD25XGeICSISZYBqVS2FGdWnsYq1Dt
	poMftjJltU6bxTbxNkCw4UTI5iB7MFQZRwBbiUHCNdr9gkaLQ8E/OtY+nfJJNXAE
	Su1PnnnqHiJONGxwdC9QxGSkw3LMbGGwHkpzFSi/gn2wVubReY37hlTrYN2W3Bfo
	VL78hiaG2O0FfX6sBdL8gM7eTqyLktPssRqgKKqlGmn6r5Bg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c834k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:01:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ce1fe49225so1258762eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768500; x=1776373300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dEL5MOodw+HHIahyhw+HpmUMby25CJ3xWcG0oDGS5g=;
        b=jW6szNAOzwkghZDmi7IeqIa8ueMuUCRZ5THo4XE2/jxEQK40KXm1rCwfN1jAI4F9QQ
         glx1Qg+Hg2r1gdPb9tGb1qopCl+GEWVw90roWw6Gc9rz6BcIJbvlwj/dpZNI2mqvYv2D
         MpauJyyiOnKjfKO/ERCAUmik5YjmEnNXSN5ZDBITqZLRGDRvmJzHuYWFz/M5j9McqXHz
         kB6/lXLC57Wm2S8NUtMChXGDTZqG8I2e5sULvqBGu0K8Oc49j7HBwBEXT9yQU7edF9x4
         9+GyBlH4a9OoryVfsDvvi0R7Z9jheIHKubEGiDegEiIXnXe3KssYcIv29jXq5wtlkOuT
         rNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768500; x=1776373300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dEL5MOodw+HHIahyhw+HpmUMby25CJ3xWcG0oDGS5g=;
        b=djeekpiood7USrT0142CkBp384AfB8fE59PPSrDnNVDHobyfIFNBVTof39AHpMpGNj
         zd2M9T8zB4guBisTPFNJeEBWnZDzmFPeajt+zKIoXCYbX54L9jhYRgcKAlrBBX1N2TgH
         A+sC2ZOVB4OS4ll329U8EC/2rjy63agq8vIBYxOiLeoUZOLW7XkpKTSp26AvtdrVAIAL
         2TNhKcB2VD5i9YVuSUEF/bHsa9oEdK4WJ6Hx0A/OQfwcbxaA+KRfIQcA4T7LQUQF8wEc
         qqqLvtkt6UMFeDezoFKFrkQJS8ZI3eHdTdUEtiVjBEtH5acDZ2WQO7Ot1YxFiHkkNF8D
         fqTg==
X-Gm-Message-State: AOJu0YwsVo54YfYk0WFMnKMdES3q6vMESHvPsiPvos3IFnLXtFonM4jb
	DsRGh0Y1U6f8fof+r9aIK1NVadLD2dPGW/Uiocz4S2S3MMFTtRVwvBTo8LGxPEL8E1HbWoUapuN
	7Mbp/RctAWdeIwBPnAgRxqULjejOO+D+kQnqam1wIUsqjuNJOO6m+qMrrqKLAb84K6fyR
X-Gm-Gg: AeBDiesUrNvncXLIgt3KGOX52gOrZGJkGybpohY1GPzcXF8qgkBzds30s8jiq4I0az9
	4yVvv2Hswb03K2N6MpFev6Vh/zrDw2WQFm1PTmIbjC7KVRU4jQx1/1xChERPsOBwYQuM4Yg+ryl
	egMn8nuobGmgiox0MplsDlULcp+ATybi1msBBYm89eUumbCnvHeYaI0e1TqJCNlzfnkeQceYlMC
	qkK2aEbq2lYYQv4JEEUI/qUupijv7dB2QLDwmK8l9Tb5GN5GyNyAG8Bi6HCzpf2/84pWjJS8Lt+
	puuQFiHl57zcfG76Q3arMbBdycB+T44bJYVlQR0Lrrrpn4iDZ61F2bezkeoj6TeYzQoZ3BXy7Zw
	tsAxTMn1Sp5hI0YChgonKoLhMukw6k9dR45ZLVCGgDw0PIdeL4FtjKZK9e0oZ09wnGffNrcJnI9
	aE
X-Received: by 2002:a05:7301:6706:b0:2c8:fe46:eeb6 with SMTP id 5a478bee46e88-2d5881a91e7mr369495eec.16.1775768500108;
        Thu, 09 Apr 2026 14:01:40 -0700 (PDT)
X-Received: by 2002:a05:7301:6706:b0:2c8:fe46:eeb6 with SMTP id 5a478bee46e88-2d5881a91e7mr369462eec.16.1775768499349;
        Thu, 09 Apr 2026 14:01:39 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm1292549eec.26.2026.04.09.14.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:01:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v3 0/2] interconnect: qcom: Add support for upcoming Hawi
 SoC
Date: Thu, 09 Apr 2026 14:01:36 -0700
Message-Id: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAT2GkC/22MzQ6CMBAGX8X0bEl/aAFPvofxUNtFNhGqrVYN4
 d0txAQPXjaZzTczkggBIZLdZiQBEkb0Qwa53RDbmeEMFF1mIpjQTHJO0VramSdSp53lWrV1IxX
 J82uAFl9L6nDM3GG8+/BeyonP329EsjWSOGW0PKnSNFA5Wdu9j7G4PczF+r4v8iFzK4nVL5n+8
 UX2tW0B6spwJ9Qff5qmD0dt1XnnAAAA
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775768498; l=1351;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=vZHVaFbSwQ1qSUva5/AHIir0gLS9fMoZzp5OXBqA5jE=;
 b=gPopFiLQgKOjXkIc12tHBPsFGUlodoo1j83DUElqhPrZCdWNRwZ6xPGUdB21QiZoQjM7MFex/
 6Za6fTxe31yAgN5Ul99VzY9fRHqZZVmbHtuI4dl8p8gWhzrtHM6Ex7c
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX5Fu/SLqQ9CEs
 C1tpU9AVYziLoJ7POTHcZQIwugVoBhi+EQzmm3RyX2bsRPthp3GTHiiEPUECKkaJbYpnQ9sFmS6
 KlNxTuB2Lzf88+nipFIidki4XRvQRY2bP1/5knvq5uCEfsOP0WexERsawTI5nQab32Xpcrj+Qwh
 stzkzfNaLmpqcNcyJ1q/UE2iSMjYyL9L9XZcFsBdaAptNExOHjzQq53LoIcOHUsLMJ9nTt/KPe7
 jXNpWaYOjPY55o6K8H1DEd2Ij//PNE1oYRQqa1FRgzqo9C27PKHLpDKr+UKamhDVRH8s3NRR0WS
 QATI3Cdvgs5dWElEYbvuqmZfA4z7/J0rRwRCfT9dn29ETQ8HbBwcBtyVXhMd+5TQH2D9XbN2Lsq
 tiavUDCjv+bAUjPqDkTmaEjb3k7emjvDGjL+bHf2b8I+feLRzH245XjZMR5JQYNOnLgyV56QQ//
 tioKGoGb1vpOX9ly2hA==
X-Proofpoint-ORIG-GUID: Hp9hNEpJ4PqHxazStsjpzSwuYcny8VaE
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d813b4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Q3xDJHZUcaiZJ3d9McA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Hp9hNEpJ4PqHxazStsjpzSwuYcny8VaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090194
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-102556-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 451F03CFB37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v3:
- Fix alignment of macros in the binding header.
- Update binding header commit summary and description to mention
  Qualcomm SoC
- Collected missing Reviewed-bys.
- Link to v2: https://lore.kernel.org/r/20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com

Changes in v2:
- Fix warning reported by dt_binding_check.
- Collected Acked-bys
- Link to v1: https://lore.kernel.org/r/20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: interconnect: qcom: document the RPMh NoC for Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  131 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2021 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  164 ++
 5 files changed, 2327 insertions(+)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


