Return-Path: <linux-arm-msm+bounces-115724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eIFTCgwjRWqX7goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:24:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1A6EEADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jiQwEST2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115724-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115724-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0BA31D3794
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9772D8379;
	Wed,  1 Jul 2026 13:59:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE0829C327;
	Wed,  1 Jul 2026 13:59:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914377; cv=none; b=QCwI4viGTvugCGzKXAvqIGZBvjTRKHAlDYqWb9s1NfFlmn6E9JjXYOQtuu+QZPC8QRznnnicyntp+plF8gjDLU8lA2n8dfSn+MClRW0xCxAXoC1avCvyjY6xcVDENT8Twra1U7agyqiCN0aHnIFTyWmK+kXdzmx/Rvni/nZTEl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914377; c=relaxed/simple;
	bh=YombgYiVsvDqpZ8iUpzBKs0BWRVmVA0eEUC9K9Xvqlw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KDCGwIRa++1pfyRnqdwsSAZShUQSCo72vCax7WaZCHNzlr4GWGcCOrPxliqsTWXdchYX8SeL/CmN6sD4s5i0bh/jmZqsnrwM8wn8kfOktlKcT+pcVw0srynNp76tAk8Hx7MYkEXODBz+3kxS1DgmbKhVgooGzZlZiSXwEyCtZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiQwEST2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Vf3744177;
	Wed, 1 Jul 2026 13:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J8XPGGwjIZw2KuLAICukdwvbiLaLxZ+57Bo
	bw0mRH70=; b=jiQwEST2xtuh8VKy/UK9UNm3X2xyyrYqrsmj7xdHRLsbihNuKF2
	cFlrTF6dDp27qMu+oGQHyJBUM2dVxAC9sOTs4mqcw5i5p1IO/DKHLxpitX1u9zoc
	pTyVWpluP2MAw/P41TzXOlqBn7TtldnTZBQSUsSydycwgfpUrrAJM5Om7yj4ZhYy
	SQDoltERovZQbTXvVzcvI09d0us+i+dAMl5HXdIe3aYkoHaDZ4meJlDO+/qnOWJN
	K0YRfo9U+T35qyyi/Bs7AU38PxW0xZjrn3m2NvQeF8Hh+UnIBevn0UKD2P1dpRUv
	XcHsBj4TsSFGalWDzHzoSPdK7FaSKVEa1NA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thtr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:59:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661DxKr0030995;
	Wed, 1 Jul 2026 13:59:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kk260k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:59:20 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 661DxKiC030980;
	Wed, 1 Jul 2026 13:59:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 661DxK2N030974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:59:20 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 57EBE631; Wed,  1 Jul 2026 19:29:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] ASoC: add Qualcomm WSA885X codec support
Date: Wed,  1 Jul 2026 19:29:11 +0530
Message-Id: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: AuO2WwPqep6uGC290jrwAF_OzzjO7Idj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NiBTYWx0ZWRfX/8YzOvt+twA7
 pA4DxduX7Y13yXdIWCVtnUefUzTnx29273ufgG9SCLQJra5fZM7tiOXEe1OZ5y6BUWl4wTy+/zQ
 nzZpytOzoXdJBWqZ4a+QMV4kJWs+32c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NiBTYWx0ZWRfX2sn3EyswFIJ1
 NLAWMDgw19dsJscgUvUkUGdKvLYzvz+UI5DTjO02U5evnGQzK/ysh1Hnj3/7d0ohlPNegH+CM79
 edpobWD+KTTRN/Hg4RGDzTCWAcJcCWnr4Dro+lMwPYNHKiF64zhpAOTXBMUa3Rz/0WERSvMsMr7
 rVLVeWHSXVDgUs3PFhEYqkvV+yrU6CVr8hTphDNB4A5FJvlcRdyF4UpT/Bve0kv0YfLW6q45crT
 IojQu4ZQ2x+u8uAoFuiIjr4ZLfdVNra+qNzYJDYlJMCYfGu9wrciQj0buCk74pol3AFbRf+EO9t
 qoPoYVooqKkBG0O4EpGwCvsjqIzao+x4BIGhIlMjH+hF6qQKpFJLOPThY4z8yJX8jYQKYtdv/sY
 J7zv3vDgCg4SHp9swNqeL99iTJPiPGhCfXa2FFtH2N7ywr9keCt8WXadbOrF4EvJTRSgOyyWNoV
 tSSFrfkD+Fe0/Qo1FmA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a451d3c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=yJEcsWRw-JlrEdEBibIA:9
X-Proofpoint-ORIG-GUID: AuO2WwPqep6uGC290jrwAF_OzzjO7Idj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115724-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73C1A6EEADC

Add support for the Qualcomm WSA885X Stereo smart speaker amplifier
accessed over I2C.

The series first documents the WSA885X devicetree binding,
including supplies, GPIOs, Interrupt and battery configuration.

It then adds the ASoC codec driver with register programming, serial
interface setup, clock handling, mute and gain control, reset handling,
interrupt support, runtime TDM slot-count configuration, and stream-time
power-state sequencing.

validated speaker playback on Shikra and Hawi platforms.

Changes in v2:
	- Drop "-i2c" suffix from the binding filename.
	- Convert qcom,battery-config to string-based configuration with improved documentation.
	- Remove register/value initialization data from DT and move it to the driver.
	- Replace interrupt-gpios with interrupts.
	- Address all review comments and update the binding to follow upstream DT conventions.
	- Removed redundant GPIO abstraction layer and direct GPIO API wrapper.
	- Dropped unnecessary NULL checks on driver private data.
	- Switched regulator management to devm_regulator_get_enable().
	- Converted I2C device ID table entries to use named initializers.
	- Cleaned up code per review feedback and aligned with upstream kernel conventions.

Prasad Kumpatla (2):
  dt-bindings: sound: add WSA8855 bindings
  ASoC: codecs: add Qualcomm WSA885X codec driver

 .../bindings/sound/qcom,wsa8855.yaml          |   83 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/WSA885X.c                    | 1490 +++++++++++++++++
 4 files changed, 1586 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
 create mode 100644 sound/soc/codecs/WSA885X.c

-- 
2.34.1


