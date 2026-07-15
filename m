Return-Path: <linux-arm-msm+bounces-119225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRZkKpB1V2okOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:57:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F28AA75DD54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:57:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W9upAbMH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 050A93010164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B3842BC5F;
	Wed, 15 Jul 2026 11:52:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438A44A708;
	Wed, 15 Jul 2026 11:52:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116372; cv=none; b=r0e2z7nt6YQqgJigbeMMxxTEU0VMple0td7KXjbawD9PsSTV1Ag35Mo+eZHlB5CVOb+sqCJBG6tc7A48TNlUXDezTG3/iYgrgIFHCfCWtZPcV7IZhXY7kuI9EqicHoPRTWTlVz2rpaesnjZqqZg6kpbE40Xbw6nh3gGZsxb1N0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116372; c=relaxed/simple;
	bh=ZSF8JHKi2pKQ4zmD1RFOzmFP2NHqtcBXdsDged0G6xg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BF8MHz+FtKjfmt2x9+CBGFFNWda5nRz9YpeSAZk+sBLrlwAaoLgr/zBI74g4tlK9hTB9YKU1Swh4XFSFX0Bk3p+J9wiweo/516XNlFAbXDNaLvjNhBRNwPapIx2gZR1o0UtIyz6nZEJKc0RFJfw3+3YG6bNrsvM0m0efbC7xsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9upAbMH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcqaF523552;
	Wed, 15 Jul 2026 11:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eKlXuL8krmwHy7dm/mlBkjLjR2xOKjkvcB8
	QhVUqCRc=; b=W9upAbMHTXADlZT0Pb0hR8nMebj4/FvnUhIK4LBX6WjmjVmN+TI
	SZOyiITr0ojV0a99J7UpOfRlWPrbL5pLkTOkFdrSd8oBaGWHp/ljd4N9CRQazydF
	DVWFWjOsEBC2wBhZngIL5Iawqso6U6PMqj38pLpTHJZ/l+xebiFXKE5XKo81moDZ
	Iu/4CU8WhndSgn/amTPe2N0TOKHJ5gWtxPQWmrUZSlC/Kh8/j9MtqxYXmzeDYeit
	/tDiVN/ICC2z4nRzIoyek36nyAVfx6OfYs8FDPpeI/Qa5Eqo74tTFe9sR9PJEbIW
	G/quAVEgLmp9f8OUMVcsHjJJrNz/80pzPWg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrws4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:52:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66FBqY5h021446;
	Wed, 15 Jul 2026 11:52:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewk6ngc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:52:34 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66FBqYba021429;
	Wed, 15 Jul 2026 11:52:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66FBqYdv021425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:52:34 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2A382635; Wed, 15 Jul 2026 17:22:33 +0530 (+0530)
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
Subject: [PATCH v4 0/2] Add support for the Qualcomm WSA885X Stereo smart speaker amplifier
Date: Wed, 15 Jul 2026 17:22:18 +0530
Message-Id: <20260715115220.3093799-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: LlnbSeJzp9T7YOpO58EzWDQZvCwMzVW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX9T8Tls+QbLwX
 M6Wzmu/tvQUEM8bL0PNfnijk1koHGkl4FFzPBJtyKNqM2Sxm5uZLcIzTdxW2AIpGvBYTEF5xVkE
 6TujmZNQF1/Mtc7JJuJL/JgRorsuIOZuTgcCwpm5i7UhSiTOa4h0enYoTTesvE/DUKY9BMOpcKQ
 IIpAB1Hn4IHnihDsBTovp4wrztWOyId2VbpRQYRly5KVT9BTt26GURq1wSQGBRzZ+jhGhExtg6Y
 x9scBlZ1pRN9pHsVX38gmYgAZh/OXcAwn4zze2p3SA54Jj961DTXYtClfqScaEAj+QNPt0cS34g
 6Q3zumVnsC/FTc7YO28t3wuVBSFlnCRZc3KKssPMvQqh0PtnGbK8jCEAIepTNblghVyCqibJqrf
 vI/vgofSZJf+VZIZ5zEfGOfUyZLKRkFc9oD1NhQ0gP3IFRCsszSm73bGWrUwUYDqTO61nl3/DI1
 vMwvmKlt+lwGuBKPMVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX3bkTuxur8M52
 PyHN8FO5Uz6HXYUQo6+goAvgnUO2ddxT+r2LWuK1XgPCb5IhHLqWPhBiY6QhFm/1iP4dniVHY4A
 NEOPsULW/YVpCkUfvKZ1eeNdR0B0QNY=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a577487 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uthJsKoNB9gwUhIDdEMA:9
X-Proofpoint-GUID: LlnbSeJzp9T7YOpO58EzWDQZvCwMzVW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150117
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
	TAGGED_FROM(0.00)[bounces-119225-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F28AA75DD54

The series first documents the WSA885X devicetree binding,
including supplies, GPIOs, Interrupt and battery configuration.

It then adds the ASoC codec driver with register programming, serial
interface setup, clock handling, mute and gain control, reset handling,
interrupt support, runtime TDM slot-count configuration, and stream-time
power-state sequencing.

validated speaker playback on Shikra and Hawi platforms.

Changes in v4:
	- Addressed comments from sashkio - Fix ASoC component/IRQ registration race condition.
	- Addressed comments from sashkio - Mark SDCA_COMMIT register as volatile.
	- Addressed comments from sashkio - Fix I2S TDM RX slot mask configuration for STEREO mode.
	- Link for v3: https://lore.kernel.org/linux-arm-msm/20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com/

changes in v3:
	- Addressed comments from sashkio.
	- Addressed Mark comments and Updated the sample rate which are validated.
	- Addressed Krzysztof comments, added support for shared gpio pin.
	- Link for v2: https://lore.kernel.org/linux-arm-msm/20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com/

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
	- Link for v1: https://lore.kernel.org/linux-arm-msm/20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com/

This series depends on:
 - https://lore.kernel.org/all/20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com/

Prasad Kumpatla (2):
  ASoC: dt-bindings: qcom,wsa8855: add Qualcomm WSA8855 speaker
    amplifier
  ASoC: codecs: add Qualcomm WSA885X codec driver

 .../bindings/sound/qcom,wsa8855.yaml          |   93 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa885x.c                    | 1533 +++++++++++++++++
 4 files changed, 1639 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
 create mode 100644 sound/soc/codecs/wsa885x.c

-- 
2.34.1


