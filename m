Return-Path: <linux-arm-msm+bounces-115181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /quzHH2HQmrf9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7936DC577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:55:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CN2dAyMl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Phoo6Kvy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E68830A640F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAA1423A83;
	Mon, 29 Jun 2026 14:48:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B83FB07E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744529; cv=none; b=XP1MnQ9tdpnTxKPa9Nuezto4yFXObIDixLdSqRUhs4qF5tw5tccgtRl3g83J+/1YW/E4MoNs4TV4/dYRZ686pLwbp2crtrlr6uJZgsgF39xzWUM+FhXcWqmPaaL0JrwqkE0CtMshY8VAg4GI6AxjsjBKMwDFeqqRJp+sFDKWErc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744529; c=relaxed/simple;
	bh=HP/cW/Tw37YstcovENSRbx+bTNeC9rrNJjB508cDOAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPBgBZ9yJCbN/HG8KeOpXFrrwjRhLmSwizCI9O7vKWwks+Pl74LxgH39vEuuU7wZWcd20sisJ/p5MZgcrNHNZPy5DmTGCwtuW/eg65/LpmJrz9Eyo4Ny8GpHGpNpBOuxsO6GAUrQHy+E1HT4gFIOcjzfGD6T4rl1MnE0lrwI4oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CN2dAyMl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Phoo6Kvy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT6GE2641555
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DCRc1+pd9Su9ZSSDRhIagXJRwfB5gYRz2Ej4HsfPXE=; b=CN2dAyMlR6FulHz/
	L2n4JtnXLBj5ia8K5IadUawl7zDfJRIk4A0w13vLZMqxvaCTgMMymgGM7/BKX09P
	RCvjyKNID6nZ2MtTvpLdlQdoMNeDbz59482ygF6ek0Woq5hrTT4siHya/USurtTE
	vWyZnKdr8EBIOvQMTnIfBEwwxfu2BNv6kbqEKeZT7MP7Pph69VS+Qiv45sM4FKAk
	VXdA6VGaTJKv7NXxbPj2FqryLI/HMc3odkPmFzH6HGtkJNJKD5KN6Sq6OnusyNpt
	BlA8MteewBp4Lf3P+0p7Qpv/Cbk6zkEYBhhee1XLHVBFzKCpjeY3OAnYEhXET+W1
	LWeFgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1htx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so232749685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744527; x=1783349327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DCRc1+pd9Su9ZSSDRhIagXJRwfB5gYRz2Ej4HsfPXE=;
        b=Phoo6KvycPU7uapDekWvbobOZt3nONxsq+/EnTeb1V1VpxQ56ZaKxKCdh3EgiF5BUm
         3f5fy8XBHKgERqCyP5LToIGW67446eQVeJzq9R9TpXjpZoTvARdRSMpLLbO0FXDW5Nk6
         tSxSFkBXy/qcZyYJjzHQwlBVI91RDb1TlNHVId165hFqlueP7jV+GnbrSrKm2sa3viMl
         ojIkBPf5EjlVD3O5bx2+LLtxIH+ZsJNuPw20fBIa/23LoFqAIUjFSx2QWLKEOwzqLaAA
         kZpBT8ppu9X5CKovIioImjRPkhR601227kVRPWl+y2jZ0dScQab0U9i+27du2wTrJmyU
         ZR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744527; x=1783349327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DCRc1+pd9Su9ZSSDRhIagXJRwfB5gYRz2Ej4HsfPXE=;
        b=XDvEzTb9XrJPesqb8tbCUgAYKb9BbbVJDMirxMN7fDqNOxksP5DEq4Wede8mWdI2IC
         0Tt7SBpZTBN8Ne4sUnZIZIqemi405nNJFJ7eQafV8PCO8T2mpjGoL3ZXY5F0y/kZSJer
         Zl5JCOszGH30eydWedR2J5TWMJ+xVLqLX3Ft+l0uQjNiJml6S4bhFvtmI12W3Qnnz9k2
         o95f4mI0BaXSIsGeHhmD8yL3HWNGd5xmPnfZHAynoFCPTnAsn9JXW9IgigCmAazDMPE7
         FDsCQ9KiHpkU01RxSoF8xMEM/7UEvOALr+5fccXgz6nS2ugZJsxo2sB/bbeOZFRjvnQH
         usFA==
X-Forwarded-Encrypted: i=1; AFNElJ8GB2bMmfjfTQLytDctS17HYtqIk7Q2uVjFdei2jxwv+zSljm3ccP5WQcg5ec/IyfDEo93lWnVnsRtfU82z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyktu6f2X137APLTimyrU2LQ82rxV0X5WorUQzJ9ywotIXCIsIL
	KaippAKBilgH9Nl2c+h+9FQXXfxKT5NvmHgHFvcrRNtvDvvpGXPyBCa/oK7bLRBbpk4DbSqM5+w
	KBS4x3Yoam5Q8k6UAYsInIdHhb1JLuZaMQ1Ah+ih0seu5JALJS9UolsqpSTqbtnjGBK9g
X-Gm-Gg: AfdE7cn5XVoN2Aurd5P1bsO847khY40dd76O4auVYvpiBBPzOnze58vN2mLKXEOewsF
	0d8RNE+p9xxQcjGV9pBpqfS6o1kH4cTa4YOf/htwadm3054Fxz+FD8uYakxY8nQyCTor7HcHj77
	Ck+DNx5/tDDVxeDK/w49eFOjTMeLm5x3bGVmi1o2epRFOQUcewwL/PJOLImQqmMLr0WfkY5hIU3
	UxDeMYwTm6s6AdmmEIK7JOTXBbs4zW6QCefKH8VOKiK9KDh5cZgOV8/Ybt7bT50MBg+mkOx6OwI
	WC/0iOviVPXhfI2ATZ1HJkD2m6VchFHYVvUcb+6B+KgMMbUWZgPVTygahpsGkhnvYxS+MSFF7FH
	hCbcbD/nZiQaJZw6PuFDAGrRbS1J3q5uJiGDRAE4QOiPLo3mMrI1Qkt1D9GMpzStlSv+0Z2PROQ
	==
X-Received: by 2002:a05:620a:4050:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-92b3b00a2d1mr1531803785a.10.1782744526581;
        Mon, 29 Jun 2026 07:48:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4050:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-92b3b00a2d1mr1531790485a.10.1782744525425;
        Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:05 +0800
Subject: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during MST
 operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=2450;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=HP/cW/Tw37YstcovENSRbx+bTNeC9rrNJjB508cDOAc=;
 b=DhGa0Wr8tIbwVvFaZ+bpQnM6r2zbyTcERPBAAfH1jQ8mk+FZG4WQ2mgMtUZ4hCw5ENlOZGq6j
 uU8xr6dBr2YA52fJcrO1a+YGmKFCgXLAWGeqtbRA1D/miCilsRUfAJV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXwbJ3rHufu/oq
 ZPPsis5og08CUcJikiyvbPEFj+kyWap1xpAQZNjoNO3QGUfUb4yeFXa8aVbVSAf9bb/9FzeDE6X
 bCQIwPMarinC5s4g3AFL/QEZ48M2y5U=
X-Proofpoint-ORIG-GUID: uvDfGxaZaDR4R6cq2b23yyQtvpsRl3hq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX/vkeYdXCnnjD
 V5SymHroN+MNk43iOPY02+h6xHw6X5ctnEDWVG6lm4XsL2b/IXLKewSrs6ohDJcdktdIUGkk6Z0
 l5wZohF/nkaAmw4umv8LicdKWlPsNqxOPlueTOfi1y0A9Xyyy07Xyb9bcecNlz696+PZh22IEVh
 dLj4/gZJineUymKoF6JVZ9thlyFzjRMU2+21Wd+IE/XOjXl8XuAR7bm/KuYAWaqAHboKtZZUKYZ
 UHYAilijU27BU3Sz4dK0vqM4Qs2CVRQtIJ0a+GRsuLSlt5nYDWylI1T0trIQnZYGENPDcdYxaoH
 KyGgLe3y6D7+WotcG+4lRIs6TMarP1MJkZ0csATOH47DKP+TnrECCP5Xq8q38WVwZgMgJosq1Di
 TvWza4qzet1swZqe4tvJngjmFgYhrXeEHrBFNuD3mgqmO3OwUgvnfBXFgvAehXkIrJjpGNh3STQ
 j06a9kYlgTWIrBHksIg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4285cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MZjPE3D8UQgFyAeDyYcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uvDfGxaZaDR4R6cq2b23yyQtvpsRl3hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115181-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:yongxing.mou@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1E7936DC577

The DP MST framework already generates the required hotplug events for
MST topology changes.

Suppress connector hotplug event generation from the bridge connector
path while MST is active, and continue propagating HPD notifications to
the DP driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7334d6677604..82ed0dc450ab 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
+	bool send_hotplug = true;
 
 	/*
 	 * IRQ-only notification: extra_status carries the event but
@@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
 
-	drm_kms_helper_connector_hotplug_event(connector);
+	if (send_hotplug)
+		drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6835c68fe510..bc93b566fbca 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			msm_dp_hpd_plug_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
+			/* mst_active is set in plug_handle; suppress SST hotplug */
+			if (send_hotplug && msm_dp_display->mst_active)
+				*send_hotplug = false;
 		}
 	} else {
-		if (hpd_link_status == ISR_DISCONNECTED)
+		if (!msm_dp_display->mst_active) {
 			msm_dp_hpd_unplug_handle(dp);
+		} else if (send_hotplug) {
+			msm_dp_hpd_unplug_handle(dp);
+			*send_hotplug = false;
+		}
 	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);

-- 
2.43.0


