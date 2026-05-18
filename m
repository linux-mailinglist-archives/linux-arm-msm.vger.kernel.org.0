Return-Path: <linux-arm-msm+bounces-108173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BOODTz3CmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:25:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4956B837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BBDC30A33BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617073F44F5;
	Mon, 18 May 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYync8jG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE7D3F39F8;
	Mon, 18 May 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102331; cv=none; b=JQoXNotuYSEHxekgmn1Fd5VXIXu7rRO9k0KtepW6giYxiEGihSgwhWedp6V2f2WtVJXmtW9gXy/d0Z0ALcpzoJA/m9YCKFTZDWR4qertha863ntkBp3au0YdDXRSjmty+nTLsnGqR8+CEsIs9C2VKTB0fpaqbYADzaqYJS3LyMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102331; c=relaxed/simple;
	bh=UZ97L/KZ4eYqPgLughWBBH00R3zXkGppr8qwNHi4vqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VQAp8slBWG+nzfyKjy0czxVG57cxr5mPcnUcMQpGXHeuXwqnDtUsesiCrsk3dRRO4pJjSHq0Wt/ua6UUkiPnRTwMIpOzSEFk9/epkrMaSugA0WMk4ut7tMW5YIzD9lc+JdorV5YFpq1cm4tqd62e5i3fGq5p6bVyFOhuyOu809w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYync8jG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7g6s92190258;
	Mon, 18 May 2026 11:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jsNFcYj7rd9sHRTCfVbvAE
	eO9/X5C0HMzuGPDw9W7wA=; b=QYync8jGkR6OUOlslOExXfjOPGIaan0WYrwA+R
	6Q24D7qlzIM/PnFi3SOghSryWKb4dDz/JXxx28gv0JNykxCTG503xrcRWxt+TRiO
	/RBceR5VxTiEibrxvrQmOI4ifqZ2DQkDH3bIjCS325i433BFIUssXhettQjyacQt
	/YwxfOQ7hgtPHD29Fq7GGizkY5/0tNHKDvQfmuJ/yABOr1dgvG7sh0GeLBeucdOg
	PckbFK4FtcOhJ7euE7Y6XdTjD1dlER+lspW1OFXery9YVKPHn4IT/cRqKCp93Z+V
	0YczlKPtUWbLXsSSZHAbA2PCkuYQT2P3T3t4itDB+3FmA6jQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkuguxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64IB52PX032185;
	Mon, 18 May 2026 11:05:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716d13up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64IB51dP032156;
	Mon, 18 May 2026 11:05:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64IB51nl032144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:01 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 870EF60D;
	Mon, 18 May 2026 16:35:00 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/panel: Add driver for DLC DLC0697 DSI panel
Date: Mon, 18 May 2026 16:34:11 +0530
Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvyCmoC/x3MQQqAIBBA0avErBNUMK2rRAvNqQbERCEC8e5Jy
 7f4v0LBTFhgGSpkfKjQHTvEOMB+2XgiI98NksuJK2EYBdKG68KSjRiYUbP0Vgkn0EGPUsaD3n+
 4bq19bPkIK2AAAAA=
X-Change-ID: 20260518-ili7807s-panel-8592da51b1eb
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779102300; l=1225;
 i=arpit.saini@oss.qualcomm.com; s=20260518; h=from:subject:message-id;
 bh=UZ97L/KZ4eYqPgLughWBBH00R3zXkGppr8qwNHi4vqk=;
 b=5mbGvAbStsFREPK/hQ04+Yep7Q9am+yoCf8VecvNANOa8GRe+QvxrtqDKjVmiIEct4OFwoVHI
 Y3ykR+3z+64AX2an8tX1hy+bGQQxVNju4TcoYIj7dWmk4hEiO/Ch2+M
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=OGOh7FGwrnkILHNlcTTABbBMQxxo319duzbTg0YPDAc=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXxQUi7MTZM4Ts
 FU41xGTyHlvHbpDe7ZpMws1tD+P7Ru+i2f6dhgl73y4gPklf7XYhYOmbNG+9zBNp3jZRY12VAoS
 IJ6rYp0veS6wH1zevReAMCYdvQPBnMP63C4mOTTprhdS1OJKtUxKmaI0y3/k3umBCSQCbU1e4bq
 V+a/g7x5bbw+qMavZQQrW/CVT9M0YAW9dQ3FWEXI42dtW2yjvzL07ytyWHjA2b19w1jiEwt8pf5
 gKEt4/mNH+VQl/RFfyK5C1dzKqxkf9MZ+teYL7a/40GlIPbrJQIrtPSdc0EFui/AJMnBeZuqPpd
 kIoKsLtCgHMevS0mUf9zBZg01CiMZUzpcHp4O8ecEQL884qrS1/uZg/GtsNeLrfSUE3OMhi9PUa
 qdisq5He0qTUhCxeYriF+DiiTzmQobzShflX7x4RfUYe/jJXjP6y+fYGDO8zeVehD0Fjui0Ru3h
 0EH125Ta+Hovqz2Ef0A==
X-Proofpoint-GUID: Uxre5ScLFqTtnRAkZcIiaeL7ZXQkBMZ0
X-Proofpoint-ORIG-GUID: Uxre5ScLFqTtnRAkZcIiaeL7ZXQkBMZ0
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0af262 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=x7m1sqbGGMxIV0qBVDEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
X-Rspamd-Queue-Id: ACB4956B837
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,60hz:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This series adds support for the DLC DLC0697 1080x1920@60Hz MIPI DSI
panel which uses the Ilitek ILI7807S display controller.

The panel operates in video burst mode with four data lanes using
RGB888 pixel format. Backlight brightness is controlled by sending
DCS commands directly over DSI.

A panel_desc descriptor struct is used to describe the panel-specific
init sequence and display mode, allowing additional ILI7807S-based
panels to be added in the future.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
Arpit Saini (2):
      dt-bindings: display: panel: add Ilitek ILI7807S panel controller
      drm/panel: add Ilitek ILI7807S panel driver

 .../bindings/display/panel/ilitek,ili7807s.yaml    |  80 +++++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili7807s.c      | 328 +++++++++++++++++++++
 5 files changed, 428 insertions(+)
---
base-commit: 61680cdf162e59a3c7cde3a2b026a448e1b65a53
change-id: 20260518-ili7807s-panel-8592da51b1eb

Best regards,
-- 
Arpit Saini <arpit.saini@oss.qualcomm.com>


