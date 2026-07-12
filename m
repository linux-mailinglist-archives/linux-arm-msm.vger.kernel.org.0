Return-Path: <linux-arm-msm+bounces-118568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7tuCGZ6ZU2qacAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2897744D2A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gMiPKHhT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118568-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118568-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDE90300A8C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0121A3ACEE9;
	Sun, 12 Jul 2026 13:41:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0F846A;
	Sun, 12 Jul 2026 13:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863698; cv=none; b=ovSybpEBqjF63Jz9blb5LCxqcXo4Xy/HBKOEZOZ8pyH9xtNu5uTGmKMGLQdww+RCMJjDNal+GKlzK2xWtzl5Iele0isZ2VQVbBqwDXMnxVxTtV/XOT2KeLXmaW9MDm/RUzTCg1E3Rh29aHIh/UT/mlhoElWw3Y9y7bdw3KBu1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863698; c=relaxed/simple;
	bh=hh/6qxVidLE2Ge/SklSm9EoIUyIiocHxv9nUCIFdZM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOVH5zUpHvGEv0ubqpxZ2/2OjVB0fYO4npK9DY7DztF38FySdqCYtICd5Oy188SvxM52z+3leHhpY3+5YYxXQFAsXAP70sVXmsAKCMkhextQrFaMDQ6VmIzZmfeFgkyJREhQZKu457VdWOrfu7OjRJ5aNdrrQpyRztqVPOLwBgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMiPKHhT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZLe22563048;
	Sun, 12 Jul 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=riHUCnFWRJvl5C6MsInMzBc7VZH3YiO6vPl
	fuAUn1K8=; b=gMiPKHhT3EhEz+FNN3G9ozhneBHuWJh3M3vxfNF9pS0WhHT6YXq
	jypczIf7ibOH7Nj3fs5zK2FiOoDgr3AJKq2y6VnRdXk/9W+44qYzeX6iXqlKugZU
	xAGvqBpHBgwuiCE0oiMPv+J3V3UjJcxe26PRb2c8GM2nh64kbrwZuTl98DdHNub1
	a/sqzUqpvdbM9blr1x8/7Jn+YfeykNBpDvQe0rkqwtp2QfIECSO+NFqGyuGccLGf
	fgQenIwq3BTbord31QXNXIkbwkxL2sdP/SyzURS0U5TVQjYskGnRaXWxEsRRoN7Y
	3C80jQi+TmvMcaxpv78LMo6U+zHNLNL4okw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf482qka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66CDfDwt026839;
	Sun, 12 Jul 2026 13:41:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewhmf79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:13 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66CDfDAC026811;
	Sun, 12 Jul 2026 13:41:13 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66CDfDJS026800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 42B35634; Sun, 12 Jul 2026 19:11:12 +0530 (+0530)
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
Subject: [PATCH v4 0/7] ASoC: qcom: add AudioReach TDM backend support
Date: Sun, 12 Jul 2026 19:11:03 +0530
Message-Id: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX7D6i4UPEpwOH
 qG90wb9iWnMPlLldTrAuszWOaKtlVcJpn+ylf3tKe8bEV6m+cW6ZMB4LP5Zby3U9Q0oH535l7Hc
 tD1NmBAgcW6UfrJCm7n2MJDMqe3lKVM=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a53997d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5LSzgCIJ2aLde3To2nUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX6sm+aNZX+C98
 VjiK7dd7Rq3ed3Il0IgYNq+/Kcnd+gw8F81dwlJMWMujMvLgwN9WZ06/7hYTSPMFLJJAEtZ56TZ
 /eyIbpVmlHBZaXcJQ1yui1nDu99VIUl9K51Q8CmMkI4MQOo9fqvnLAOQG+RNcN+MaDOLkAulUth
 a4FycEyRtOK2LmWpy/rMTgJKrOgIBD6Q++fzCuhEwgHY+8WRW3ywQKyeunYJzf4ZZ8M+A0Coikt
 gWhr8LMConx9lfdFvo7m2wTBSTnrb+iglwjTDRRbatHHjztZIHcn68gED5806/RbBqg94VwijAi
 TpkWquIu0jWo2kmE3AOSVYEZM7eFDLPvK5uUodtRzXyWGIGvkboSHoXp2J/pMocFcHl3QFMB2vZ
 HfLHXOMwZf0vwfmLxGAjFIkk1jeoloxBqB+Wgk8JNfX31jA9df8FD/t/zgXvoD3dUYKuW6Y1QQv
 /Lr/kw3jeRRhXVyCPTw==
X-Proofpoint-GUID: jwEyECC3GS4xaFxYUTpNYY8Unn_l5LX9
X-Proofpoint-ORIG-GUID: jwEyECC3GS4xaFxYUTpNYY8Unn_l5LX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120143
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
	TAGGED_FROM(0.00)[bounces-118568-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2897744D2A

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

Changes in v4:
	- Addressed comments related to bindings from Rob.
	- Link to v3: https://lore.kernel.org/all/20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v3:
	- Reusing of tdm-slot.yaml and update the bindings.
	- Link to v2: https://lore.kernel.org/all/20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v2:
	- Update AR Module token definitions and validation prefixes.
	- Reorder module addresses.
	- Add kernel-doc for `struct param_id_audio_if_intf_cfg`.
	- Remove unused code and stale comments.
	- Clean up comments and naming in q6apm-lpass-ports.h.
	- Add bindings for TDM slots.
	- Link to v1: https://lore.kernel.org/all/20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com/

This series depends on:
	- https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Prasad Kumpatla (7):
  ASoC: qcom: qdsp6: add topology-driven Audio IF support
  ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: add Audio IF clocks
  ASoC: qcom: qdsp6: q6prm: add Audio IF clock IDs
  Asoc: dt-bindings: qcom,sm8250: Add TDM slot properties
  ASoC: qcom: common: add DAI-node TDM slot helpers
  ASoC: qcom: sc8280xp: add TDM hw_params support

 .../bindings/sound/qcom,sm8250.yaml           |  16 ++
 .../sound/qcom,q6dsp-lpass-ports.h            |  29 +++
 include/uapi/sound/snd_ar_tokens.h            |  89 ++++++++++
 sound/soc/qcom/common.c                       | 165 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  14 ++
 sound/soc/qcom/qdsp6/audioreach.c             |  97 ++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  81 +++++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  57 ++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  28 +++
 sound/soc/qcom/qdsp6/q6prm.h                  |  29 +++
 sound/soc/qcom/qdsp6/topology.c               | 105 +++++++++++
 sound/soc/qcom/sc8280xp.c                     |  60 +++++++
 12 files changed, 770 insertions(+)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
prerequisite-patch-id: 28f571976819748d886ecdd32e1ea3976440374b
prerequisite-patch-id: 1b00c4a50852a4058eb2e1e609769ba067fd8d4a
prerequisite-patch-id: 6320a0e2ad587fa5c7fe999ae168689af724a4af
-- 
2.34.1


