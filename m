Return-Path: <linux-arm-msm+bounces-112512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EfkGNhmQKWqQZgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:26:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7E66B730
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:26:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sv9Qvmjv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112512-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112512-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94AF033F8F62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEC04418D7;
	Wed, 10 Jun 2026 15:45:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF81A2BDC26;
	Wed, 10 Jun 2026 15:45:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106350; cv=none; b=KAsgbK9lbDALtc4K/VARCdF8ma7e3CnGshoO0xvvcaYDUdolvtzHGuvujOmu7Md69N8KiNh3yIpp/lRMZE5aHO/aEnj3Ud73yGzfNyvQEY1ybsBSh5iS7kGIGz9wJEGq3HsbhcE5ZlEmb0/xo0Zj4LIIC10sZDGLnx1UWchPGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106350; c=relaxed/simple;
	bh=Mk9yuLrT6THr7C4oUkfV/fcuz0ierRDAt6UJjU3/CjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q6HAHl+1fW764Hn2r1XDknYEfhMxKPNu0yUvRwXIUT8jPKPdDxYtYcrtlA1x7V+H0jd8pvcl9VHPPnLMx0VNw6VnA/mbDwgOXTW6QrENKoAMwp5oPEp8mPBKkEHFl6bbl8iFDDq0bItHqjgZoJ9ND7Ok3U1gwxU1a2u41wVWIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sv9Qvmjv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdZh1134931;
	Wed, 10 Jun 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z5wSQ5tKJ1GjgrX1wwkeFjVEOit3E08G+tB
	3TNlbTZs=; b=Sv9QvmjvkDgwyPIAaaP/kuAoBGDTETNQI8UFcIgUwSTKCcUBUff
	sd2C7HA70MikEdcuMZFd/oVN0NDgrIdNwXWdljxv2Rz1lPB9vEfPgYXQJBVIuC5+
	suSXjfOXL/F8gdDsszQYku4g8lycNyL/z+4jKt39eVfedNlRSbPZTPaXIRDab9pT
	TuMnkXrjQrMOaj951mt75JzhCHZYcmVm/ZKuPXYM2Iab1CDSjSrISYFhF5Dl3p0X
	nBCMlP2Op/IvLANf0uxQJR4GMrHwpiLl7i+6+oEGZsQ93I2wZZadL2nRZAPJgvda
	t0eHlWyRqpvRIvouSVqFjBOpJIgjbseowsw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1tnxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjW8x003510;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjWxw003486;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjWTT003476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 6940A631; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 0/6] ASoC: qcom: add AudioReach TDM backend support
Date: Wed, 10 Jun 2026 21:15:11 +0530
Message-Id: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfX0Qca21d8Rlmc
 MfkBEjM1llokaHUeOQ5zVlEJRtX0tyC5HLmdRcpnHtbqi+0Cyl0oRDPXszgYrUHpRO7hxWp126m
 pVXNoXoTtF4Uhv3+G1cKEaR3rcTeNPDAGdXO3AzseGe6FLdOerAoKAXh1u1vfnH+cyV5Za/nMEv
 uuctV/9Ew91RI0p3MNiY3Jxj7qvmNhed4m+KDavF8QFzWuOI10susQeF4SXKrIi7iRcVjV5TmPn
 7YGi4qQ/CZHbxNC4qnuEi+z0Gvp0BU3xk0JWDxoDzsZLcjZHND5f589fTYpUVERy4m7ZV0yFpaa
 PiIkcu/5ThjZ6s+m50xf+P2pqfwv9OhpVzO3dyZJJMUN6UN4z+vL0dbnik2Msrl3EsGd0ydTFAO
 ZTwuP/xHS9+PN/9kej/wHQymrX1G39clz6MYHzVBYL8xXXbeROwbiknrxMUm2/4v/gUsPYqTPZ1
 SJgnAi+HFfxRrPZT/ew==
X-Proofpoint-GUID: ltFV8bhoGEKB6RopB3YsfgTmXLT3WBay
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8
 a=1KI02nGqYswE6hbM9OkA:9 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: ltFV8bhoGEKB6RopB3YsfgTmXLT3WBay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112512-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F7E66B730

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

This series depends on:
- https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com/
- https://lore.kernel.org/linux-arm-msm/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Prasad Kumpatla (6):
  ASoC: qcom: qdsp6: add topology-driven Audio IF support
  ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
  dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
  ASoC: qcom: q6prm: add Audio IF clock IDs
  ASoC: qcom: common: add DAI-node TDM slot helpers
  ASoC: qcom: sc8280xp: add TDM hw_params support

 .../sound/qcom,q6dsp-lpass-ports.h            |  57 ++++++
 include/uapi/sound/snd_ar_tokens.h            |  58 +++++++
 sound/soc/qcom/common.c                       | 164 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  97 +++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  62 +++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  64 ++++++-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 +++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 ++++
 sound/soc/qcom/qdsp6/topology.c               | 108 ++++++++++++
 sound/soc/qcom/sc8280xp.c                     |  59 +++++++
 11 files changed, 739 insertions(+), 1 deletion(-)


base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 222630a15afc952683d954a3c66617a223546de0
prerequisite-patch-id: 3c55edb41f1e25920a350ce1c6f31fde67fee45a
-- 
2.34.1

