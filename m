Return-Path: <linux-arm-msm+bounces-114312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BVfuG8ibO2o7aQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:56:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB76BCBA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:56:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="e/AkngrM";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114312-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114312-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA65B30A78B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5564399CF0;
	Wed, 24 Jun 2026 08:54:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824F30B525;
	Wed, 24 Jun 2026 08:54:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291255; cv=none; b=SyuBbuQCJFwCwgbWSK1j9RA1AO2jAWZSR41p6C82k714OYmxcFPqBiYRVRAHbbAja1Mq2hbZ/DdlmEUAiJAS1vWQnNpAVrOLX5tifgUH4Mi1MdwoZo1HjW5MVuSKSM8rleuh71bjlxlIkdmz0QxKTtjLLOf9lXZqIt+Ko9lawlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291255; c=relaxed/simple;
	bh=Fv4t24U4qIyt+txv+AYBAngaBAML14UvjtFFAc3BDf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E1RQVuFbu5pAwurpixWHX/XJaKxF60vq5yXc/oCeD69mYsDj0uQTtmqfcRI2v5czi55sfPx/Z28aozJ5peIVtYSncF6XRnUWfN24OVC1IgaglvTR3o06Cdu+hrQFZa+7m8XUp5FhwdLwDb//9/m/Tmu/wf45rDD1IoxbBgKBW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/AkngrM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u6qL1976802;
	Wed, 24 Jun 2026 08:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hJHk5wjhlMQ0wgulFoUtIN
	frY0/hDHa/js0k3HbsAKw=; b=e/AkngrM2ySBmXH+u2bvlzoXa/KtpmBhm5Dtcq
	ykVbRmHMjUHoVpThjZZWDh3pD/vq18CI5NaeR8PaDKmo3goFM0qZuq172QCSKJBg
	Cvs0puqBPDaxn9ISNiEE1SYCtbaO1Pu1JUZSown3efrk411nznziBVAtN4OL7oKi
	pV47QJRCcgJDw7JcYioJ/ytfhXp13axIjfjHqoqNhMq4WfJGA0o9KKmTMSA7KG+/
	Ddt0y18o6FFC1kmD5d/ZgL+FVdBPoUmJxF3opQe/kHXWXcow2ZJ0XaCYXXZord66
	m6LNcegnHdILl1ZQ6J3cVUxoLJsCOzLipAsUz8yf+/eULV4g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aq9bev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 08:54:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65O8s24F009039;
	Wed, 24 Jun 2026 08:54:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ewkxk3jsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 08:54:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65O8puWD006941;
	Wed, 24 Jun 2026 08:54:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65O8s2qF009009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 08:54:02 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 7947B630;
	Wed, 24 Jun 2026 14:24:01 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: [PATCH v3 0/2] drm/panel: add support for Ilitek ILI7807S DSI
 panels
Date: Wed, 24 Jun 2026 14:23:50 +0530
Message-Id: <20260624-ili7807s-v3-0-ddf37052a289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6bO2oC/0WNQQqDMBBFryJZdyRGqrar3qO4SNKxDmiiGSsW8
 e6NltLNwJv/+H8VjIGQxTVZRcCZmLyLkJ8SYVvtngj0iCyUVIUssjNQR2UlS4ZBO+xE9IxmBBO
 0s+1uOlwm+Ooq3/MhYEPLsXGvI7fEkw/vY3JW+/fXXv3bZwUSTN5Im8mLyaS6eeZ0fOnO+r5P4
 xH1tm0fsk1IesAAAAA=
X-Change-ID: 20260615-ili7807s-panel
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: arpit.saini@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com,
        rajeevny@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782291241; l=1563;
 i=arpit.saini@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fv4t24U4qIyt+txv+AYBAngaBAML14UvjtFFAc3BDf0=;
 b=CDKIUPvFA7Ey7flh+uupHMksl5BbSxbgC3GlnhtpBlas/H/xDJbk+oRjICLkMV5jGpqS9o1WE
 WFn9t7ThTy2Cn3D6by0R0rneqARzmDoO2HD5V5p3+1sgxcB5cdhl9LE
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=OGOh7FGwrnkILHNlcTTABbBMQxxo319duzbTg0YPDAc=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MyBTYWx0ZWRfX2wLIbM4jCvdY
 K547A6Iz8wvLx6W6lshfnCzVAWv2z7k8MVK/caFm7x9rqZafG1a9Hw9+3Ldrz2GIshhoNDU/n+8
 rdMb22/oN48din4h1hzUW5HiRyfVj3dNuVew5NMegqH2BEoaxKpxwsgRPWNy6wDSrSuUBGy3iJ7
 vSm6P3OIu8tz/XQV8OuWqziJ8o4DHZc8Bjfn5LDCYQhSKfaXplCByGkdvoxEfsg2XyLImmtMPPZ
 sWhvvZg/jfhYZ52Sz/4Ffrv0dQygk4KUZXFLiEJ3ddPnZnbAfaNU+pLvdeJosu+SOuwwLavKWGl
 ZivLaoLRjpKKHfWa000mlgIZnQZxNY9ZpAqW8YxFXkfXNK3AUiD6oivBwaC4xmtyjnE9tDeUCYb
 oyk0TLLUr9QO0heM4EBSafU8DkE4DBpqUoXRpSScMOku7WMw1OyNageTyGGYI1QnuilRrI325eC
 nLBxbj7SfV5sa2N6BCg==
X-Proofpoint-GUID: 9j_u4p_gl5xroIuQq5jQ1M53vvj12UiI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MyBTYWx0ZWRfX/gub8XPq9uNN
 XjpJGEtf4TVFJTMt6sW4CdiTsaT1OgpxRRAG0LzxLZWTnKXFai1R6bTh4zShXPU5TDlVftBgazO
 Ga8YeXWI9yBWxwvCDT+J/2+q+UhlkSk=
X-Proofpoint-ORIG-GUID: 9j_u4p_gl5xroIuQq5jQ1M53vvj12UiI
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3b9b2e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RCrcYMzkqC15-5_egV8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114312-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10AB76BCBA9

Add DT bindings and a DRM panel driver for panels based on the Ilitek
ILI7807S display controller. The first supported panel is the DLC
DLC0697 1080x1920@60Hz MIPI DSI panel.

Changes in v3:
- Return devm_mipi_dsi_attach() directly (Neil Armstrong)
- Link to v2: https://lore.kernel.org/all/20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com/

Changes in v2:
- Drop MAINTAINERS entry (Dmitry Baryshkov)
- Use devm_drm_panel_add() instead of drm_panel_add() to avoid
  manual drm_panel_remove() in the error path (Dmitry Baryshkov)
- Rework backlight: call drm_panel_of_backlight() first and fall back
  to creating a DCS backlight device if panel->backlight is still NULL
  (Dmitry Baryshkov)
- Remove backlight-en-gpios from the binding (Dmitry Baryshkov)
- Fix mode_flags LPM not restored on backlight update error path
- Link to v1 : https://lore.kernel.org/all/20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com/

---
Arpit Saini (2):
      dt-bindings: display: panel: add Ilitek ILI7807S panel controller
      drm/panel: add Ilitek ILI7807S panel driver

 .../bindings/display/panel/ilitek,ili7807s.yaml    |  71 +++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili7807s.c      | 293 +++++++++++++++++++++
 4 files changed, 377 insertions(+)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260615-ili7807s-panel

Best regards,
-- 
Arpit Saini <arpit.saini@oss.qualcomm.com>


