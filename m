Return-Path: <linux-arm-msm+bounces-115299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jcTNM/ZrQ2rMYAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:10:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8686E0FE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:10:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fX8m94t3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IPBrM5Xx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115299-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115299-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF77A3001845
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30253988F9;
	Tue, 30 Jun 2026 07:10:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9109A3BED06
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803441; cv=none; b=YGYxIyz9WhAdlNb0/Cr0B4vTQd50oS3lzwLVyD6UNR4a0bidLDDLd1tQhVKOamQzktQLTYoDNLSX/9oyJWRTHTyBYqHR9tEDvYrbbVCJyi4/4v/GhOQgG9vRTy2XZhOH7IoK757Yq4oBlbiMsaUHsIXtMOPrBIqFKPgNwUV3mOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803441; c=relaxed/simple;
	bh=y/yDjjLkDUh8iGsWzfnxYn81hfEg3x1PqIo//TUmAhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eA14U2x56A9zCHjowG0LDgh3FobVD+WBJC7iBvHCb/2uDBKQB6mOC2nEV71U/H+55OVy5V5LLQqXz3ZWw/4KZrB7rYNDCowoknvauoxi/bIORRgXxnFDXvkmhKxU2ZS4c5RQQIIV7DmvhabkFNb33DDDs8lUQLHvCbj9aaGNleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX8m94t3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPBrM5Xx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CJWa1008537
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=laNitI81tOcv3NnixGTD6j
	dGRDX4c/NTa7r69SA/O8g=; b=fX8m94t3Eb94xyNO4k362lRctMyG9is9Bl7XQA
	pkSVUKnxZYQYPOkcRxzHFtCmNu6NRyc1y2Cjorwk+fBLZh9/O90mMIyczRDt6VOL
	bRfDXnF2hkwNZNCpQkaeLLCOU8Ey09oB6ELilvi5o2GNIr4hB3GA6pNlsr6I/v3M
	1+BdWNnuG8X0HGbEznRhw5K13VUS+u8XI+JR5W1aT/HSkvUZ0LWxG7f8xcFQtQA4
	0wOEA1hWrVDVQWgBKyVti5YBG0epdoKqwWu5rX8+pS+S3Gjk7mnENW5uppjf6eWk
	nmCOLPLNcKO693Gb+yvv3j3SeA1KRWISBsez0uRm+ieP53mg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw91wc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:10:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e86066fc53so7827826d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782803439; x=1783408239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=laNitI81tOcv3NnixGTD6jdGRDX4c/NTa7r69SA/O8g=;
        b=IPBrM5XxU8mCUTkHSuhfv/VTYmjSnH5sBXzg4FkzIP0/DUhIKv/7OK24aIdRvU7vn7
         B1XcPbbjyDnW9jeBL464Os1lOzFpnjdc/8LNFABgBWX0b6kGIC5vkTOBXNueyGXRSXIG
         zdtBDM+Uu/FXUb5XLZboHGSNVcpoP9KR/YOGZBXMiOSpYPmOXqV28FM1OhAa9mR8FNkC
         maorwLjzlInVXw6x2JpmZMzDgLUCu6YXVaY0QADFE3x15xvvDL3KhjxOtu9VLkj2KlyM
         h6b83kzIa7oiHDCL6b44/vWJFtJOey7KxGtznBfBvgRvcnBazmSXPdCH4K39VhHObWJE
         i6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803439; x=1783408239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laNitI81tOcv3NnixGTD6jdGRDX4c/NTa7r69SA/O8g=;
        b=DJF5XnHZg3zTmDiZjEgvDJthS/JI4eHbXZYJYPKMoA3Q8eZDb/7clkvbtgLOCgttb/
         GBjiD9UCiQ4cIofBT9FWas+WEJR+5XbUu/Nj7nArS7I7Jq5KhxDmWr7JKMXF8FI0o+6G
         KfWOIJuCQRfYtdXOrU8mZ/yCFGIMMm0Cb6Q4UBNeGxh3ZDkiW/aJb/Bd6YFlyuKJ2YM4
         PSDIj6MouMzD5aNIoFSJyYCTmNv5rtjvMb3lwqBsafxOG+k+Fz3R41Ilojg7HQIl7fa+
         QeHTh8AQiJPGLfbMqS8vzUvVrUrnGwXnIHg3PRNn87fXj+W1DB1s0YT2t9oBYDnsESZm
         qt2g==
X-Gm-Message-State: AOJu0YygpbXVdh4IyYyKVAlo+k0fQidxBwopWNH0PZNNYhW2975QzpU4
	AcwnTsP4UsnUobCfzyV2njHmdfmwsJaMb3llMQWRQx6s6pty4s5IVZVSL6MvtP1lfRhjRynJJy5
	qhm7fNj2mHjLdIx1iAW5l2RJZb3glHV6pf/4jeJXUFJbPypllf0mTgIEEb6M64Bx92csB
X-Gm-Gg: AfdE7clJkePh6/PN88u2coZNgmTQYtyhTvl97NWe3AhGrrq+oPN4CgXrLNxSQoa6pBi
	s3QWrgSrn1hZgVsKQlRzmorUzD+g5AIMH+bftkWMhaTJQH/BwxDbCQhsHZpf0xdIg+pVmqe5PD9
	jLLjgz+Cs+2rioaknkheB9pSU5Jl23IhvGAcfW81/XrDhMKPH20HXLwp2WHObYIiEBYiIZk3OQQ
	p81uhKgRA/HOWmzstQM+J6jcLy5tnNr8OQjyYg70ofueDnFP4axbNUPiZki6XfRZWFZ+yyAsnuQ
	Ttq5Lgk3B1V6K+lInCN9uP/8dvyGst+1hueM0ll66ScxBaF+8X3b1HBSnw0ifZxWX2x9+wVVpsg
	7gLNJ4U5CcS++JkNzew4mVGICwNnKVb1VGJNhWgbfpPdZbLZ4f/EaI2AbxChkB3w7MyqTqg==
X-Received: by 2002:a05:6214:2aac:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-8f25202dd9cmr6553816d6.1.1782803438925;
        Tue, 30 Jun 2026 00:10:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aac:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-8f25202dd9cmr6553516d6.1.1782803438337;
        Tue, 30 Jun 2026 00:10:38 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f19f770c41sm17471956d6.0.2026.06.30.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:10:37 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH 0/2] Initial support for Qualcomm Hamoa IOT COME board
Date: Tue, 30 Jun 2026 15:10:10 +0800
Message-ID: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfXwddxltGakt3q
 38WVGFHkeJ8WzlLnnr3Q4SerUVmUEJLRqA4VKnvzZfDeh60qHB01T9noHKM7MNgmfsmrFNLQVkG
 iHreyKoAJxHPWwZN6sFCjLF9uQOgVZs=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a436bef cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=juaxyESPAC5OR6l5tJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: srZjTOqgn5PsKsWNZOZco5bm2mN20x7Z
X-Proofpoint-ORIG-GUID: srZjTOqgn5PsKsWNZOZco5bm2mN20x7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX6ACQiyT8t94D
 vzM3o75pNezhlJN2Z/b+Sv8ReNCJ2vhNY/NPM2kMR1zlf2lau0EgNaEsH9BLe6T1YKAdSkKDkds
 vugO0AGGYthAfFJNzMgRw6tIb/TQbaVZs1PEIGv/E2s1RIfd6vs4/pjOjiYE4qS2V9i5qjBoOFt
 pA7ITCWbaV3f67c44FqZJndteOPo807/mGH7IRe4Jn0RDkzsMZ0LEK50FSTbiNYB6xC1rt5XHk9
 b7JeecGxvgho8LHxeSJFwfV8bfc06rLAKjd2+q2CBSbmEh9dE/ef307U5qpDl4v24Gu6OSYvT5K
 3KAjS1yhOSGEYq7ZJgZ07XON6Tnwcqi8nWedYmnAWDeY5yzt7Y1sEb7CI925tiLZow7+4YUphgx
 SD+FbX31yqruxsxH18BPmg3MMYrYf5wo8Of+UqHTWAalkrw9K+9M4eLhaVIPZ1LA6ck1Ia83ql9
 wvd2qKP25FIoqbaGVEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115299-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yuanjie.yang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB8686E0FE9

Introduce the device tree, DT bindings for HAMOA-IOT-COME board.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

┌───────────────────────────────┐
│          SoM (Module)         │
│   System on Module (small     │
│   pluggable board)            │
│                               │
│   ┌───────────────────────┐   │
│   │        SiP            │   │
│   │   System in Package   │   │
│   │        (chip)         │   │
│   │                       │   │
│   │   ┌───────────────┐   │   │
│   │   │     SoC       │   │   │
│   │   │               │   │   │
│   │   └───────────────┘   │   │
│   │                       │   │
│   │                       │   │
│   └───────────────────────┘   │
│                               │
└──────────────┬────────────────┘
               │ Plugs into
┌──────────────▼────────────────┐
│   Carrier Board (COME)        │
│                               │
└───────────────────────────────┘


Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---

Yuanjie Yang (2):
  dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
  arm64: dts: qcom: Add base HAMOA-IOT-COME board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
 5 files changed, 157 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.43.0


