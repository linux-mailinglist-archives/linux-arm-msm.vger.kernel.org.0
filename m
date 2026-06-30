Return-Path: <linux-arm-msm+bounces-115340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P4OEFHeNQ2qqbQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:33:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EC6E239A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jzz3lIEP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115340-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115340-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B3113037F2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB503955F2;
	Tue, 30 Jun 2026 09:20:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A881331EA1;
	Tue, 30 Jun 2026 09:20:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811234; cv=none; b=AXCI07J67t1bh/Lk9ogo6suT0o4rlCagoHRrn3dUNmL90P8rkRODY7Kc8FfW565N4pGH0foL7cDxfVjDv+Rx1TyJIUp2aJ0Y6cBL44AvytFHlg70EzZxAsJ6rD0aqYWLdLHihlv8HrQjJgB9Xt3zsEXIBvP0vQUiIR+Xv0REvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811234; c=relaxed/simple;
	bh=EM6GTUUOcyDcbTcn4dXTRrWcKby8vrdaNqwx3TXO43M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gQhfASTyTrJjZ1LAYNq4TK57OJ/69BxG7CUSw7t0YCZgENtIoFZBJvikr6Kvs0gvMZuMu8FaNJnd4lkAvdAdz/QWtnMHIlN+r0gxagHgRA8PilzYcLAGfrLvruUe+aKf+0Pe/jpC8AZM04rWfgw2A5Zqo6xeV6CJdcc4yDtXlyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzz3lIEP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CUpb1097910;
	Tue, 30 Jun 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QreerZkOGGn2nswlnnG6gGAtB3ajUJpzB18
	I9cYzTnQ=; b=jzz3lIEPzl6jVcsD4CNs+YULhF2XSYLg6s/VciHrwRqDjDIhNjp
	RQG9hNLYQEZ1PiGx7S//LMrHIUhd9VfUE+j680AjFOmCdEiC4+z+4Sx0uSGd4Q9R
	sYsMXS01Hy3/I01zDWAqxkGuMG437/tENMpve+9+KyabKKyV7A07Gf60ReE8LBFx
	e0vHGJnzJFrm8Bh+1J6j+BY+tiSxagnCdUwjPbYkM5KCqpxcnQ7BTc2X4iBixKuM
	SfaYCrluoCLuGIEHGvFKVGQNXEG/pBv936QV3n0uKVDQ4f2zoAeeEg+SjjKaAKcG
	BBfc7QNgnZcyGEXcfjxINl0LTeolHX+5yLw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cu0th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9KIwW010623;
	Tue, 30 Jun 2026 09:20:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjmep1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65U9KHLa010593;
	Tue, 30 Jun 2026 09:20:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65U9KHOh010585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7BAC8631; Tue, 30 Jun 2026 14:50:16 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 0/7] ASoC: qcom: add AudioReach TDM backend support
Date: Tue, 30 Jun 2026 14:45:58 +0530
Message-Id: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX7s+hVLhIOjCt
 29sTzykFQLWU0wnXK6TmCST+2QyCl8yOCvAwhqaW03v0yq2nvlu6BdbZxacZ+iwbql0+8DWkiZy
 KKyKgdWWAiTSAqmF5rrTS2WVdag9hbbmW2cnnCIIV/zksLLnM8qDQ8DKt6VdpD5bNLu/YjPJFQ/
 1Kx+Y5a1wmbzlaBNxqUJkncfWaus6un8QSygCGkuYmYkh4JPP55CDoQvv9a1y9xV1JT+GHmXfni
 9FSneKIKCtDpgpy2v5TMlYoLV4RP8zhNi4jVgGqM58nVIo0U+YnBIROMsNfdpozS6Fy8E1z3iQq
 BaAnTvqJQbI+/MblohrOUcaUKrnz6S9Yyx6tgdOYj1dhb3jmq2ov9pE1gu5cZ9P7NA4VzB2yQ0P
 04pPv++cV0EYa8Gh841jMEflmD9q9eH76QBZsaH499s2T9dZsi1jeWXw9J+1OP0FP8JgU47Eq6i
 QF3jvJBsOd9PX+rlmqw==
X-Proofpoint-ORIG-GUID: DWDSY1Ssb8U3QhxAqLmcSMtoBm2XZw_c
X-Proofpoint-GUID: DWDSY1Ssb8U3QhxAqLmcSMtoBm2XZw_c
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a438a56 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8
 a=BJ-3GoJ0_9qtf8P2sP4A:9 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX4XZjCY0rxse8
 qtg0T+sk3NYI/8Jphmm0F1+bPIFlrZqUTbD7WIysFnW5AtnNQ4TKQPV4RYfFBlvMm9FaknYwm1X
 8hyLdqssvtTn2+MrjUT4P5vQcsEOWsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115340-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 444EC6E239A

Add AudioReach support for LPASS Audio IF based TDM backends and wire it
up for the sc8280xp machine driver.

The series first adds topology-driven Audio IF source/sink handling so
the DSP interface parameters can be described by topology while runtime
media format and slot configuration still come from the machine driver.
It then adds TDM DAI operations for q6apm-lpass-dais, exposes the Audio
IF clock IDs through the q6dsp-lpass-ports binding and q6prm clock
tables, and introduces common QCOM helpers for parsing standard
dai-tdm-slot-* properties from backend CPU and codec endpoints.

Finally, sc8280xp uses the common helpers during hw_params to program
CPU and codec TDM slots, derive the backend bit clock from the active
PCM parameters, and request the CPU and codec clocks before the stream is
started.

Changes since v1:
	- Update AR Module token definitions and validation prefixes.
	- Reorder module addresses.
	- Add kernel-doc for `struct param_id_audio_if_intf_cfg`.
	- Remove unused code and stale comments.
	- Clean up comments and naming in q6apm-lpass-ports.h.
	- Add bindings for TDM slots 

This series depends on:
- https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com/
- https://lore.kernel.org/linux-arm-msm/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/


Prasad Kumpatla (7):
  ASoC: qcom: qdsp6: add topology-driven Audio IF support
  ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
  dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
  ASoC: qcom: q6prm: add Audio IF clock IDs
  dt-bindings: sound: qcom,sm8250: allow TDM slot properties
  ASoC: qcom: common: add DAI-node TDM slot helpers
  ASoC: qcom: sc8280xp: add TDM hw_params support

 .../bindings/sound/qcom,sm8250.yaml           |  26 +++
 .../sound/qcom,q6dsp-lpass-ports.h            |  29 +++
 include/uapi/sound/snd_ar_tokens.h            |  99 ++++++++++-
 sound/soc/qcom/common.c                       | 165 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  97 ++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  81 +++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  59 +++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 +++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 +++
 sound/soc/qcom/qdsp6/topology.c               | 108 ++++++++++++
 sound/soc/qcom/sc8280xp.c                     |  59 +++++++
 12 files changed, 789 insertions(+), 5 deletions(-)

Prasad Kumpatla (7):
  ASoC: qcom: qdsp6: add topology-driven Audio IF support
  ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
  dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
  ASoC: qcom: q6prm: add Audio IF clock IDs
  dt-bindings: sound: qcom,sm8250: allow TDM slot properties
  ASoC: qcom: common: add DAI-node TDM slot helpers
  ASoC: qcom: sc8280xp: add TDM hw_params support

 .../bindings/sound/qcom,sm8250.yaml           |  26 +++
 .../sound/qcom,q6dsp-lpass-ports.h            |  29 +++
 include/uapi/sound/snd_ar_tokens.h            |  89 ++++++++++
 sound/soc/qcom/common.c                       | 165 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  97 ++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  81 +++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  59 +++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 +++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 +++
 sound/soc/qcom/qdsp6/topology.c               | 105 +++++++++++
 sound/soc/qcom/sc8280xp.c                     |  59 +++++++
 12 files changed, 781 insertions(+)


base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 222630a15afc952683d954a3c66617a223546de0
prerequisite-patch-id: 3c55edb41f1e25920a350ce1c6f31fde67fee45a
-- 
2.34.1


