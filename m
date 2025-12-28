Return-Path: <linux-arm-msm+bounces-86748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E8CE548A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 959AB3016CE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C420A23B62B;
	Sun, 28 Dec 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjuVKYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQnAq+Iw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2E215F7D
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942504; cv=none; b=GUjwU8pvirvJ9fyNoGwJxZUrDx6a+2PVgNjP2P+bbpc4dZFHBoocQu+7uMlh6ReWXUZ1PYfkIa+OoYQBJwpAGCAnjIV9ILXf2TxrerSftSNg/nE1IcC5RVm013X5PYV4oBXB92FddqiMPqtaHl+jSSWghgNEKd2ZLApJv5+XgSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942504; c=relaxed/simple;
	bh=D3eLDF/ONraT+LuQe8030Tgbd5SBZ0lrgjEs8Csfuoc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DR4NuKg3w1KEXh4jZveKfva8XqZ6ehpsPrbKUycVV/Lr2WAU3Zv6bVXUx+rtJMesVQIfkTWXUjiMf8JYdSMKMEI8AHZxmJYBJkxDYHn9IY/mwbCEJ0kDId1ToNp5xTdUVImmnWxrljVN42Xo+nAOkcxBZJ6iLP1y56PBI+4ANSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNjuVKYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQnAq+Iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS4OloE2276889
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=npwPiqZPrPU3R5s5/Q1G9H
	2LQKQVo5umALTPvs9VpAM=; b=jNjuVKYqLyVHeDRPDfJP4BL7ITLMfohoZXGubK
	njZ2OQY9In69Ksj9v8xbCatD7iglvaXSjQ0zAJxME5igWnxTopRbRXYIdzRIGOuN
	fQ1A11IMpsFQP3ipy8JmTU+nrKrEnJDHQXWyR6H6DhZSHckGHxwFb2gedQZMYfbM
	JhVpLdH4IAd74/fnMHK451q6b5A0ebZP0JEDlUUb1YEBP21zIDbB/Nh3ncHRe5vk
	zzyrxnVF5iyiluh2m7tSNgNDaQQzxaWP8thcad0rIr85a54K1sjBkkjZ29xsXnyr
	oPu5iTz8AXtrKaAfN92inqCwidyplmCmJ7KADnTGRzTbzmJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f62ja5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso216912511cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942501; x=1767547301; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
        b=gQnAq+IwNz6goF7ScbxpAp4hhX5j+a+9IB2UnDrvP5x1FBnIZNCsFHfyi2Qxi9jUP/
         LYqWytBue72kO/OpW5bGMjPVYuXvJSkd8J0CmUUejomaMLkEoM82pDx5PYBiwD/hlNzp
         cI3NbAo+kwi5ng8G3LEekafpiyEj7fSGp8TRWAlu1ay2/gM+jqgzgAGg8jvLVRt/xcDN
         lRORTiYQcAHeHdZyhoaxGN3bc59ZdeEqloaKeYrJEvMt0VqL79y3VR0zM4DaLK/4wGl6
         B0Ro7BsKua+4/mOg2oq8qdTQxhKmssF/H/yjph5KMj1HwcdI1z6IGVbjwkQdGj6JczLU
         XtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942501; x=1767547301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
        b=fK7cjY3dph5YO2PBnZa0c21WBGnMI5HUtOTYXHZ66dmmiJnAdCryZXE1ch942MY28j
         rMYWsvgvoynPCtwRLGPSjOP+k1qTBm7FrI0gF8h5po8lkMglLMe4LxvpBIDwTvwwTbup
         lgZgjXbPdtIDTYcVJ7Yh+MG0nS67xdt7cBW0NUqZ/qdINQHAvXz5ee4toj9Uw/ARsKJQ
         IxL1nej2u0llrIPxlsgJh4Ul4rFJ/rmiQWy6AEBmSA1iJRn14QVRS8WoZndH8Mc69Jq4
         BSDvaoXR4ImmeISy7SQjEcBtb3pzmxB6mC2ZmD7jJRzGbMuxdXc4W9eMr76QVATnQ/QT
         t8MA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ag/Fty31X9H3zppVKTSZeLtKIuJmsJHpfKY+nhYPwSFsuvXN7F9JmrIZutta7i7wzzgUH+OJ6cPFuYuN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyE527Uoj/CREGJaIY9YPRy/Sg2RV6IwmkPbg8GOYfGbIlaA0
	M8W0mllZeO4TGLSh9hDycPNyz1BfH6I5o55s9gGrVFOk8xO91D5eu9hn0YmRIqW39ctB9JyxN1y
	J8WkHipvmCTGKT9Bz1McLrI8OhDGM7WXhgnVNhBoqULK9N5BWsWClHfOEUITGsLDANubj
X-Gm-Gg: AY/fxX6XJ7FXGY8Xqj3ZAvHNcBGJR1TYJ5Ox0kgDADN7XBJNNdS4d1iv2/o92IEidIA
	z7uyeZeUFA0K6W3PGX+L6JCwaVpzljaySXYZ0qqPtphTdoU8QLwtR90dE9B4rdZbtJ5Ptxhq7an
	Qmn2QS6PDmWDrRijL6ih4ufMm/hrGhs80uw7thHtjAdJ6Wt2mzJ1NI885BCY5ALGXXMfD9oNJht
	YYTa7R8e0X5iqyIUqVDluGeGIy5R/8MAbv5jtexG4speejwc42as9Abx32jGmcFzkijJ1GarURK
	Jju5dYnWVevt7Axbmt1d7hoyq04DSuGVt0iI74Ev2o6TlrL3fny2QDTSZrlNXvSp5LKmmoZZ30O
	qPNcB+vE6wQWLUsOM4VW2aaY7P5yCr+TTu92yiCZ9as84wHo0z1soRoRVlg9ZetW9PCR15OEufD
	KS+E+5iWV2cmhmAe5rB+A3Lks=
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id d75a77b69052e-4f4abd16604mr430244381cf.34.1766942500971;
        Sun, 28 Dec 2025 09:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwPjyBUi1UQCzq/+IC2coGHTnCTbnWaC3MbyIVz6JKpNNu1oBmd8akd4pb25eofkn5Y3rA7w==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id d75a77b69052e-4f4abd16604mr430244011cf.34.1766942500365;
        Sun, 28 Dec 2025 09:21:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Sun, 28 Dec 2025 19:21:32 +0200
Message-Id: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxnUWkC/3XQzW7DIAwH8FeJOM8dEBJCT3uPaQc+zIq0hBbSr
 FPVd5/TalKlrhfkP7J/yJxZxZKwsm1zZgWXVFOeKKiXhvmdnT4RUqDMJJcdH7iAbweh5D3g5HP
 AAkZb7nXnQhc0o6l9wZhOV/H9g/Iu1TmXn+sDi1hvn1uLAA6DVL3quZJRh7dc6+ZwtF8+j+OGD
 raSi7xjRP/ISGKi6URArqKK5gnT3jPmkWmJcWqwvY3a8Nb9w1xuGxc8HOnr5tvazNmKsDaledu
 EMsKYqn/9K2DC00yjl1+UvbV/fQEAAA==
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D3eLDF/ONraT+LuQe8030Tgbd5SBZ0lrgjEs8Csfuoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWchvMQTty0uidqYbUpbagdcXDCL/HNaNtTjc
 gXyLfXm79qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIQAKCRCLPIo+Aiko
 1dS6B/9v4YpvNb+8kATi0akALEa9MAmZaPvRBfo2I7SBnNWUTZs62wLmxz9qRqqQCfnQxeADXSR
 kwiG1sur1Im1iK1bk4XPHGEYq3DBHehmUGkjdUWCcts+Urt0/3qBWUscnAKUAXd+cKMx1EDpzMl
 HYSEdzZ+HbmSj5nXgs9nSONxq2uqKHmrg9Bds/IFFFR4oNHSYTjTL4xDNfII/WwBUbMmfnbhCwB
 MnsOx0g/aPtdaSn3weUDoE2KCHq9TQyml8iiAJkSEhl41yNBlbGf4+AQl5EAeah7MbDQ3IMrhRe
 RpISU1QfeWdCNaLXMpRQr3fq54fkXsA+iPtecT4mtcbnbZY9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Uc7wKnBpkVtIUn1ZTTWis2fytMb3hzjZ
X-Proofpoint-ORIG-GUID: Uc7wKnBpkVtIUn1ZTTWis2fytMb3hzjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfXwy/4admXe80Z
 SCXnlhDVVYe/In86yVGAy6rg6FPdmpiNE61I4YISejsXxyU/Vh1cEWqJZK1AyjnCqIlNX+Wsuhn
 D1SqPJ7TYw9eqKJkFjjt98g6AjrKRWjBdutEqjaX5jQ2NiZpo3bnBspDmwfodUOjrQwhN/L7Bcw
 y7cblAeWV6JAVVwL8d4pS25+UvXimbFNVkxVQuh6FvckrnIHpzdtiV8bxM/UieU3ED6C1yojBmq
 RkagHiwD6CLfu3rbQ57ySOWFU6udi34+IX5PIRnEXGti1tEnx3eII5m96bEp0A0uzTyKkBB7U9O
 wWO2Ygn2fF4AG9My0fsqcsRvLNhAqNSN+mQzN6JSgxOH8il6Hw/97dObBiXQBmYDoGGLBMuYDnQ
 Td0gCo5OMVUoZxLyFrHszzWRPh/3CiFL8Dquh7U0MhIayBIPddrPjyeqJrrh0Os6sdDmFBzeszj
 Z9Iv/HHNgh5lz5pL/VQ==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69516725 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Note: Christophe pointed out that AMDGPU driver leaks connector memory.
As it's not related to this series (and as I don't have enough
proficiency in the driver) I'm not going to fix those in this series.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't mix devm and drmm functions
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  3 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 76 insertions(+), 125 deletions(-)
---
base-commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry


