Return-Path: <linux-arm-msm+bounces-118073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R51LMJjhT2rBpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:59:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD98734161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 19:59:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KSQDfGuN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118073-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118073-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6DC9301D94F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 17:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D6B4DB556;
	Thu,  9 Jul 2026 17:59:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D94DA53B;
	Thu,  9 Jul 2026 17:59:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619980; cv=none; b=Zp2Wem8bFiORu2qqNeuuZe0IrdRdywVxMr26taZNMIqcveelthtQkk6Fdn4HkkDlyx+joIz5qIwGX2IT9GhyaTQHlrI8rjBTYEaJZzfH3RYpVPrQ9sHDcAdRkEznjnwHVLAK3uKLomgaI+yQPapEVq3w7GxNgAcXVNupCUPPx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619980; c=relaxed/simple;
	bh=CG9Bt+imzkZh0V1YS6jUTmxNR0JEiYcfMJrmIibkhMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SXLKl5d3bXQtmMHbGdOwCgfRTS+Iy1Mb1cyH7HT4BlYAHBDIHesS0lFkcCh4SSOAa0UcLaRbS24opE8wzwgfw/HdoSDwfdy0RaTAJi7aBzVBUNptn7mjqWDBjiIEXSVP+B+4RTrH2y2LsWMF0JsyWTmi7pAf09KU4FrMOQcZWkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSQDfGuN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWxUY2514973;
	Thu, 9 Jul 2026 17:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2ci9LSmM42a8Lx1wgUmOK5q0PK6b0rpGvgO
	eqOLsMdc=; b=KSQDfGuNNuknHkQxebZxyfdAaDqY7EWhTp+2R0wvy6xYHW4O54y
	BDi/nFRYMaba0HtDoaRQxnGE7P+zWghvUE8K8mv4Ou4n0weP/Y9/jI0eI5gxlLP2
	2+lH/H/CBv6SuOOIIZxEBp23O6bn4LTOeYCPxa5DMDLO5fDqU8VNVNqbVi/6Rio2
	oaM2b+2csJO9ADJeya+/mnZ+Swzh8qYSo/id6tJHjqinkBuO+32tzdgcnmK9UhSG
	wY6Tml1YS/eghzQVSjho/7kmLlYRVGl+JNzTInU6lqU4kEg8VXxvC22o6Qy9qJ7a
	SmtM0+Snur4Xxmbzgx02mNXrlLhDDlkHR6A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418ks7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 17:59:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 669HxIeQ020151;
	Thu, 9 Jul 2026 17:59:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8m4wrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 17:59:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 669HxHvU020136;
	Thu, 9 Jul 2026 17:59:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 669HxHIg020134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 17:59:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 81C2B634; Thu,  9 Jul 2026 23:29:16 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for the Qualcomm WSA885X Stereo smart speaker amplifier
Date: Thu,  9 Jul 2026 23:29:13 +0530
Message-Id: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4fe179 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uthJsKoNB9gwUhIDdEMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NyBTYWx0ZWRfX8q+rXT+Fpj8c
 aAeysBzfBLy/Cnp12i47UuCBJwfPpUuqoRXNcz+1Vz9tvJ/jvbBUjupRJnXW6O/2euUrp5QSjsG
 R/AoNHbHK8BrliCqKTtAzX35IbBsk2NmfnfdLkebXTkFuC7JD0GIAwkl67SJspoXgp7nMo35wTQ
 eud7jzY60B+A2x01yAZNHD1dysD0WLo5Lf62tkW6P1VlEuIw9ZJXZv3QpnZkIit5s6gqBOqjGsd
 KSFk8B3N+q6ijOj2qSSAT6pgnqbAbdpthwstWxxhBYr+Pa0lN+34Keo8BhQZvfXAZf7645EKz4E
 mJvOl8+If2kBv5xcwkLbb4b6Qp/bAe4H+n5hu+shBdfBnA9jFFbuLPFHLY0OdaMi3BluIsrU4aZ
 CckhbstW2MPW9AX4Fkshq0HvurQUvJvUrZxXaRphjxTuZmcDKsthZWoYp7iqX5QOvzBP0e2tiOm
 8GkPDLxfsmfnJfJ2Qqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NyBTYWx0ZWRfX7eYnGbsWLcDb
 eu2ZrCwPgO/dE+jPPYBE66eW8/scQFsYmVNETS31l0DtVqgXT+hKgabrUdbnUGfYNMomEs/S9Me
 8Ab6ItMV+AzlytvVRHWVnATah4a8sew=
X-Proofpoint-GUID: gUWb4nxSV7qJ2G6xERNwaZ_54R4bvGKe
X-Proofpoint-ORIG-GUID: gUWb4nxSV7qJ2G6xERNwaZ_54R4bvGKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118073-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,pengutronix.de,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:p.zabel@pengutronix.de,m:prasad.kumpatla@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FD98734161

The series first documents the WSA885X devicetree binding,
including supplies, GPIOs, Interrupt and battery configuration.

It then adds the ASoC codec driver with register programming, serial
interface setup, clock handling, mute and gain control, reset handling,
interrupt support, runtime TDM slot-count configuration, and stream-time
power-state sequencing.

validated speaker playback on Shikra and Hawi platforms.

changes in v3:
	- Addressed comments from sashkio.
	- Addressed Mark comments and Updated the sample rate which are validated.
	- Addressed Krzysztof comments, added support for shared gpio pin.

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

This series depends on:
 - https://lore.kernel.org/all/20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com/

Prasad Kumpatla (2):
  ASoC: dt-bindings: qcom,wsa8855: add Qualcomm WSA8855 speaker
    amplifier
  ASoC: codecs: add Qualcomm WSA885X codec driver

 .../bindings/sound/qcom,wsa8855.yaml          |   93 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa885x.c                    | 1526 +++++++++++++++++
 4 files changed, 1632 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
 create mode 100644 sound/soc/codecs/wsa885x.c


base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
-- 
2.34.1


