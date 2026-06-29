Return-Path: <linux-arm-msm+bounces-115178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZWKrFy+JQmpr9QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:03:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB746DC69C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EW68smx1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LUh7S4ey;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F0BA3012D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A8E3537FD;
	Mon, 29 Jun 2026 14:48:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BBC344D91
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744511; cv=none; b=D/evvE5JbuI6tMJfLFrlyzAi6ox8LokVS6hC49uXMtP4GkugJBD6ynNyZtAthVUBJpwcIncghpio0adDfthBeBM9PmotBdLzsQxWjire8F+HGywN307KMWrQjJ81jYT45mCMnv4ynObuNAmBfaWyxtksDi+ayjkdKRd+/TvZHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744511; c=relaxed/simple;
	bh=PZfP5zuUOw1cQ4+LbkkW+tP+uE6tAqqOHKM8isRi0iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2eH/iIfbolx6VJsxHvGNQzh7AMhZ5K1L47sXO7jisUiAgW1Dhq3SZFHwziGbxb6tCw2I509BSKak0RDKXX6i979fKN2ceu//dNnbfFOUXspSSj5QqSk8WrrSCJUGxXb0w0VKan3KLthyB1mPt0vIW6nblOBOibn8Nm/B8EQVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW68smx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUh7S4ey; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATMs82647667
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9Wvi0l8jMqT7/U0aQTPnpvZ/UDWx6KX/hO6+hpKeMw=; b=EW68smx10BFKmiie
	Uc6Qa69muzZ00svaL3GZ8DyOhIC3AFRTjGt27zJ1utDUIR+jS3P0XNp67lSDLuRF
	GevsOXtZ598t3WpdoFUdv2YOhya55lbryzDz5qPaeuFNonWu6uPcd+49xYOz8i+8
	M2hrj8wgrVsd+zYz2l+LVF66ZRU56fNUDsIQEMghjj9Pf0aEHd+9d0Ej4zyOE6MQ
	N0rbh0aCMoC2n5+fUowhCIhT3R9xuS3Vmr+vUyxRCxfbyvHfUWNQ5w+fy0E19mlY
	Xy/sFISbVztQgjmL4HuOa64wfZJG0dGNF1D4ecAb7UmJ1ATgcLKUc9KWbelT/xB6
	46in+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsu53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92a62578049so552328085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744507; x=1783349307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9Wvi0l8jMqT7/U0aQTPnpvZ/UDWx6KX/hO6+hpKeMw=;
        b=LUh7S4eyQLiouH27iS7kmD4aY1a6EwqKmnACUt0/OyKU61fB1T3RzIV6BQkBevTNJb
         0dzRU94BK40hQpkNmDBIleIDFMJLGs+ZbaqpaB7dtBkNp919hbi2MCQjFnh8kyWKLANk
         1TE82KuOBi2+5NvyWUBjzVqN3nuvDAyYLyDM+yP0vBMQ4XARrnGy2sIxRncfTtudJNe6
         pmBJhmGLLS5U42iIOKbvL+t57xInGLRcA8VsvkhoiYiACpX4L/th3d5IB7AI+mePXk5+
         CjQtNFvYgW8Rmbc/zXidyty7tjdemLOdk/Ib1W/+Zd8bmwFHY5M4IykCCZWrwupSM3AI
         8sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744507; x=1783349307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9Wvi0l8jMqT7/U0aQTPnpvZ/UDWx6KX/hO6+hpKeMw=;
        b=gtbY00prRidMxPFKFtD0UydTJ8fPsKWwkNZDVfroLcY7vBnPkyE5L7ZIZxzBDeLy4d
         DGRRhA4+ZOQIK7gav6QXtf5zMOLNlHNLZDd6EMYPDpXk6EEexhdkKsd5aQhbv/jbBJ/x
         SqCxNQmwUoPi3Qt+wf/IHLEEvqNW2VqIYdVbwzqi3iWMDR7kSIh4SsodM4yd94Eqx4nX
         sHWxVqjR+KCxsXH8C16DmOEvI1FLilvqF8THhI8ci8ADgz+X3NZWEpb91gTeyZiZxXZK
         AH4NpwezPoUoA/kV2J+xfjKhHRx9bqDVBEX9Vu6hf1WI2UQgT5qlcPFwc9kMntVuX2ti
         pEHA==
X-Forwarded-Encrypted: i=1; AFNElJ+N8Q2KHazJoSi+exw+FS0tRoo9921gKb8SRSvtzQxs7QnBHtCLBrXKTckGhTL4r+k0UVFZs4FhEl0NQlH6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+6XyxaflQgwCHRxqG4e2aw6gCr+QzK2bc9J1HCrzXnR2IWU9
	65zFiwSIZWB8gl/NxSedYen+xxwO16Vn1RJexaK/fG4THUly2vjtzGK9q17ttcDODQ4vpQpUL4S
	2SPsBda1RhCaQgcduuNxSt5uXlFD/lmYiqxzXv2r4Sk/+QPjgOGx1w4XUQJgy2XjlHTt0
X-Gm-Gg: AfdE7ckT9EUE39LmKyKgEpQDip4Ui1Lq7WGhpsPcHRtNf2JikqX7ykNyI6goCoiJe+Q
	1UmzxkQDt7l7rHDn+4W287jdS7jS597x9uzGEaRMrcoAVGpSipVv2bqH7NNpWWjXk46RQsFFg2T
	V0WK0N3kCR6uS5uYZpko5Mc0hqSE4QCK8/UyL8/amRwno95ba17fflCykFdTt309jdiWzT/ztBy
	X4k6ogrwj2FkoRh3dhaJooI8PGVLF2ZOFAEBDIyIJVjonCAPotTGlMOaDQTwKOrcODgQnnDBJYy
	4GaxJwow3AF70FxY0hr8Kk6OYSagVkAbLBviXnxkXr4KIvv/Be3AMt4KSg4yJRuRYR8GZtWehGi
	SBAL6eNsgBTpsQhmVeMk3fBbsyzah5NFnBwhOq/O9YKHtjXdo+bZndVEGv9axgO+XFLEyI70fTQ
	==
X-Received: by 2002:a05:620a:269f:b0:910:c308:159f with SMTP id af79cd13be357-92927eac1a7mr2441205185a.28.1782744507185;
        Mon, 29 Jun 2026 07:48:27 -0700 (PDT)
X-Received: by 2002:a05:620a:269f:b0:910:c308:159f with SMTP id af79cd13be357-92927eac1a7mr2441197485a.28.1782744506554;
        Mon, 29 Jun 2026 07:48:26 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:03 +0800
Subject: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=7698;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=PZfP5zuUOw1cQ4+LbkkW+tP+uE6tAqqOHKM8isRi0iE=;
 b=PvOG0vzHfOEMpn6Uc9ILDR0y6vdBC7zisS8HN4guZduHppi/Eca5NIGvMGyXQQ7++RkaWSBX4
 xjf96he6N3RBpVPKPXR/VP/AEMmjfUrD/o/s9muDMP+aPYaMRfJzPQT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX5SKODSCYqDt2
 elLZotMfSp7dA/g97OUJ3vbYb9HfUm8s2nqYmpwisKgCp2celhg+2hGeIVOfsNmGYKZCCjeDPgW
 F8i6Ttwe85+9IcRB9uQ2kyDtMztoBvINZITPwNlgmKr7z9cPzTQMn8AhA+x2/WsHw+7WfWH406F
 ibJA+syhF6oFNWKSrAhv8mnJDL3NraFVkmgTJ65ZIrvALRlT/NzHuy/z6G2Z9G+oztFdyIdsiO/
 PxFeTrotoVeWDTStYK2oeG0ZMCk3EfUHcAyA0Hc4Wr3vrN5sgxiV1UIf9vZ8Tnu0KnfM9Z2UwjX
 2I3ZsYSk+VGVUg+sTaVbrlhuu7nNWQvnfgWnp6pnbuvrCTsZFVQLLQFB1U22qWMFW7Q/qu4yTMg
 DvLxjIo2kHvDmpfGQQQ0Xlvz9KM9iJjXV19DdTPIldvTqmmuHi6fiXuQNz+pitwr+zQ8fvXUr8P
 gUSv0Rsnlli1973z8pA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4285bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dveiew7hPdaQvXAhsgwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX7enSh4kb//y7
 5k4hPmiu+FGqn7mbJFSwsCFr8jEq509b1w2pxb64cTfFPlJVhTbSKwOeVyKDQQJFPC/m9KVqjQA
 ftDcTVeNEhJZcrdXf77bhT8UtBcIHBQ=
X-Proofpoint-ORIG-GUID: Qwo09qdRk_1-508f2UVB5RZwvtdU11ED
X-Proofpoint-GUID: Qwo09qdRk_1-508f2UVB5RZwvtdU11ED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115178-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:yongxing.mou@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FB746DC69C

The bridge connector framework currently invokes all bridge
hpd_notify() callbacks and unconditionally emits a connector hotplug
event afterwards.

However, not every HPD notification requires a userspace hotplug event.

In particular, DP MST bridges may use hpd_notify() to propagate HPD and
IRQ notifications through the bridge chain while the actual hotplug
handling is performed by the DRM DP MST core. Connector creation,
removal and userspace hotplug events are already managed by the MST
topology framework.

Allow hpd_notify() implementations to suppress the bridge connector
hotplug event by introducing a bool *send_hotplug parameter. Drivers
can clear this flag when HPD processing should not result in a
connector hotplug notification.

A NULL pointer indicates that hotplug suppression is not supported by
the caller, such as the connector detect polling path.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 include/drm/drm_bridge.h                       |  3 ++-
 7 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 8cb17bd0e238..42e1cadcd3fb 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -430,7 +430,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
 					enum drm_connector_status status,
-					enum drm_connector_status_extra extra_status)
+					enum drm_connector_status_extra extra_status,
+					bool *send_hotplug)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8f7075fd2aa5..5edca47a025f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 					    enum drm_connector_status status,
-					    enum drm_connector_status_extra extra_status)
+					    enum drm_connector_status_extra extra_status,
+					    bool *send_hotplug)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -150,13 +151,14 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status, extra_status);
+			bridge->funcs->hpd_notify(bridge, connector, status,
+						  extra_status, send_hotplug);
 	}
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status,
-					    enum drm_connector_status_extra extra_status)
+	enum drm_connector_status status,
+	enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -165,7 +167,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status, extra_status);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -227,7 +229,8 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		drm_bridge_connector_hpd_notify(connector, status,
+						DRM_CONNECTOR_NO_EXTRA_STATUS, NULL);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 4aecf0ffcf75..a67e7b365c5b 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -324,7 +324,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
 					  enum drm_connector_status status,
-					  enum drm_connector_status_extra extra_status)
+					  enum drm_connector_status_extra extra_status,
+					  bool *send_hotplug)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fcfee26f0078..6835c68fe510 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1763,7 +1763,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
 			      enum drm_connector_status status,
-			      enum drm_connector_status_extra extra_status)
+			      enum drm_connector_status_extra extra_status,
+			      bool *send_hotplug)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f6b96c27408a..07ddcd055962 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,6 +32,7 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
 			      enum drm_connector_status status,
-			      enum drm_connector_status_extra extra_status);
+			      enum drm_connector_status_extra extra_status,
+			      bool *send_hotplug);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index d02d432abde4..ad659cef16f5 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -430,7 +430,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
 				    enum drm_connector_status status,
-				    enum drm_connector_status_extra extra_status)
+				    enum drm_connector_status_extra extra_status,
+				    bool *send_hotplug)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9c4c88024cc5..e6de665ce8f6 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -616,7 +616,8 @@ struct drm_bridge_funcs {
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
 			   enum drm_connector_status status,
-			   enum drm_connector_status_extra extra_status);
+			   enum drm_connector_status_extra extra_status,
+			   bool *send_hotplug);
 
 	/**
 	 * @hpd_enable:

-- 
2.43.0


