Return-Path: <linux-arm-msm+bounces-103794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDa7BPtT5mmwuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:27:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721C42F7DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 203AA3385D11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBC132E757;
	Mon, 20 Apr 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUIbGvQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjAnNSTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E4632AADC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699109; cv=none; b=LnGxEe2edOulQmGARQevk2pXnccDDd2xSZ79zzswFBioIa468tgNlcoanVrMnYK22f/b5HoB0w9q8iSO9RolKCdrhFQv1udLZWS/MeSnKi6UaS1cZ862Zr5+UNo/VxReLPYiqTHSzdYNxtoIraONdBUK3jAJy4yyqJCSdPAW62E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699109; c=relaxed/simple;
	bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mN+q7tsfLEV3ZJp5juel23kuaggPg7ForQ99/XByLXCVqQN4RH3TF9kNIHrtRN7IBvtu6geydXKuzb2pB2pBFuAInHZUc2SUjqrV5uZbNC7WgzkGtIe61JodtkeaKD3Zpu5jyjdHsur1GKB+/Qy3pHjBMxfiMhUT5URvuW9FNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUIbGvQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjAnNSTV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K985ua1600585
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=; b=lUIbGvQZ5qpNp4Gr
	QY6vrMBwk+A6tYOPjjoOHnbdSdN3EyYfSEgfbOzFlvu/aTF87y02bKmkxi3fhzyp
	ZLqsTfOcH7bUoEfoDkeQdsfcrL/2WeOKCs5wzHFizkFr1jcHuW/DkpzDvgs8D8TL
	m2KsoVMlz7UD+hSPF9Sjown2QTRx03z8jYu7KvlbH5Rqm6hn6lViKzI4O1Pl8sDG
	o1MP1usTGTfAD5l5lQuVBoCYh8k2z37Wbhvz6YbAXZy6BsuSJ6EDfL7lQ5RZP1Nr
	yu0VyVqqrDy56UkKqn36L/WUrK0SoUC0KJzEM78z0PIC2Y+hZ+8s4m24sKJIanIh
	Wnoe6w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh899d1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479d74f0d95so681347b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699105; x=1777303905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=DjAnNSTVs4JBhMhbhH9CbKyhCFMIwvpKNSf8aGRwiNyQDWA1JavWwrLbVTZslp2rEJ
         ZZiXByw/PnRtxLPdL3mkGnKxnzbR+UQe6gfyYfyEVV6KVOdpNC0+0Opj+vc+ufPmsmlJ
         htve+E7KSDLfj7Un2avM+gLXoNsua2MN34ihWYqEwykKqUUncGCOA1HfqZeQ3Kv0Cpq4
         u1ABaobhEaHgqJTUPx9Rc+HW2sVCZLwzu+0nqSnNaS9rALKHnn5aJG+WAbw483RvSQL/
         J11Y0HZowiI96KiZDS/HFb61QlW7kLrnBwf9YpHUITOO5en89GBcPY0NhISZ1rRcQrUw
         yPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699105; x=1777303905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUxjcmVB1mry2JFOZUVE65+ZJk/cVp6zUgik6yCWYSo=;
        b=q6QCDqvl5Z8pYpiBoPdlxVdFiifpvZEwh9Zow7wsZunGAxP3XrQiHsT2B1wdMVVvsL
         3fDlK7cdgiywsbBBQpmqYYpW4XzUyhhTRVR48UTQnvUh/aYGAxgruSp5bZF2j56olkC2
         RGjlMX/PtK8DxjqrvrK9nSDYSlprBwe+mdqu3aSfy4/BDfHNofoSa/AESxJwxpGFOQEa
         BgDsKARL6z1qJYWc6ybz84ZTNN3HVEAS6kLRfQKY3ajTasDitlPU1dMvr6ebx/QUkXyn
         st2bRsDcxn8miR3K1p3dxrHNeJbvRWWuUBG8Bp8IDNYVNifc0qLFo91aUCtSed/yklx3
         w9NA==
X-Forwarded-Encrypted: i=1; AFNElJ/vuQwfMr5F0nuwLdqOWgoHvKbnYdH4XxJ4aqvZsdd/30trh7sw1qQ6fxMrWy0/3X9cmTBWN3j7nT5Gq0V/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9z57sJleoI2T/BTp8ni8bDZHdlUZYuPfz1buxU0FgGp0e7qr2
	RcxG2otnUihKIdRaJL1PmdrxAf/Xwc8m8CAmrN76F7ukUpRbFUGzE93nU/lSscDjC7y0q7lrR/2
	5ifH+PjA8+OYjxcFLQjwDAQ6qlPby5dkIAiO7NoFyhzFkDZKkfLoelR8bKGi4lNe626la
X-Gm-Gg: AeBDiet9kDaONWTPewa1LY8YphtDY88+RXhHvuE/+cDbckR/Kbr99UmZAJ9KcSjzopl
	dAoURkSUt/FjbzVYAbPNWCSK76zpu1qhZ7YjluMydH0Xas/os0gZaRlt+5dAfAZO6sQlXBlJSAf
	dhiGRKS0mB8vj4us5DNl0gT0ltTTJQqygjNeOiCfJKPqrdP/VZuwQI+mp1FVa1qyYvqvX0KB2Pn
	9QIySOW2mbypFmp26AHbI31TYZ2hCditXLqKwOJ51ADEqUMywVrtRNrSggFe2A9Sf3qwTICPBRv
	3w1P5Uy8rvOXEgH7lcRZYLr53hvWaSrKhByB9B9hC+Gok2vX7ibo9WjLkPCT5B2sceTw4Xg8GQe
	SLilYvXD/XYc6ef172flCmU1YptAwelUAScUkq2TORdsUXYWSAulTZLXb9Al6xKriCfqUSU8bjd
	ohNWyLojh+V33rVJbznesqHWG0GnA/WvpKcgMN/ICm3w601Q==
X-Received: by 2002:a05:6808:2448:b0:467:db23:25c with SMTP id 5614622812f47-4799ca83a59mr7243601b6e.46.1776699105202;
        Mon, 20 Apr 2026 08:31:45 -0700 (PDT)
X-Received: by 2002:a05:6808:2448:b0:467:db23:25c with SMTP id 5614622812f47-4799ca83a59mr7243507b6e.46.1776699104557;
        Mon, 20 Apr 2026 08:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:39 +0300
Subject: [PATCH v2 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-1-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnVODOLTo2WpHrvqFht5FXa9gKD0IeWSjwE7+hKxwmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbc/UNMXpIQgQu+RMvj2dYIBCbr7675k+ZbB
 1bJy3KI4xuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1ZEhB/40fMwfOsuT8UnELg06dXKJmgx9BwjiERV+6ig4vkQlD1N3pMzFrTpR7ZV19GcfER4uBAb
 mhH1u4t1lQPCH/rYzpC8djiuPi598d6eQCICO45jiYBrWW2m/5hWcc1ACFO6LwpEJNAMZS9AJTE
 j+Zl4yyKkFLCFRwPOIKR88dQp2S5TYCbs9dHrEQPeNXrhvp3LouEZ6NXq0xRvDGczDb4zKk4GNc
 a4TA9/WzbbmISLLs1bNG76+FGXHvATVLYt+Q/LC+/CBuA1b4WSZzkymfPFtaT3QUMDhR2DHmk9D
 4iKNimC7DYMtYIj+iG+/H2jJk00Ad7W3ys+v2IZuw5LMMjFa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX+YZ7EcY886dU
 zeRXm/vX0VFiSr2XKXu4tWPYvyLRd1v4IlL6ZELiEngXzHezskySaGlqiDQYSk+Mb+H1+nHoY+5
 e4E731fvqAkLzCJQfuQ8+i1WGDbNroQCpsw4MILiH3tZvt5fjEnHWx2iQZoSoeb3vvrcmnLjJqv
 UTBWoC3oXW/8ruaANIh7Q+kdHcCOm4CwirkzhMH0/HRhZQh61BX0N3OkBc+KtnFFhG5mEbDu6X2
 XGtpRxQ5iyr8JRw3VcpvKg7Vt3FNd42Fp8tbnQVz2+91HBS85RkZF4aGE8LwMx7xby/OnrJGNF1
 xXYN9shfoujbjMV90W52BncphmD3p5JtR42bz48B7YrOknVnsz9iERomscOcSo2WAvw3nH4CHl2
 18USSk9bSFN2DSOPUM2FnrunMeiYa/daeQnBY832yETV5QFyL4soG4F9+6eHhXW8mq57zs3UyQE
 Go5NzgtM55tNxhJWO3Q==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e646e2 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-JEBqWJC5KD3P7x9m9UA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: jfD5h5V5ylhdRnbCNy6yo0nRp4vAxxSt
X-Proofpoint-GUID: jfD5h5V5ylhdRnbCNy6yo0nRp4vAxxSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103794-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7721C42F7DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are ported through the bits in the AltMode VDOs.

Extend the drm_connector_oob_hotplug_event() interface and report IRQ
events to the DisplayPort Sink drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          |  5 ++++-
 drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
 include/drm/drm_connector.h              | 19 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..edee9daccd51 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @extra_status: additional information provided by the sink without changing
+ * the HPD state (or in addition to such a change).
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector;
 
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 35d9c3086990..7182a8e2e710 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 */
 	if (dp->pending_hpd) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			if (dp->hpd) {
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f83f28cae207..e05197e970d3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_status_extra - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_status_extra {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


