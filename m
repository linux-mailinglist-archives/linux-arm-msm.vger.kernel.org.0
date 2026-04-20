Return-Path: <linux-arm-msm+bounces-103796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yChVAA5f5mndvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26C430CD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EDD3341DD36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F28330B2D;
	Mon, 20 Apr 2026 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzNtXH2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7cPakGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9C32ED4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699112; cv=none; b=I1k0Xu/U8wQhqsRpiOF5r2ne4x772pqRPpJXfV444JKYb91y9bsHFyBFjkCI1Yjh2PCmfK5p+SaEuN4+5XCWjb2ymfneBgVaRxtuz0NXvZdTGBzHSfgd1fJigIIkof7Ws8EBZRQbKE9xPyyH9rKABmdgqHpCWxpaBHg85gKFavY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699112; c=relaxed/simple;
	bh=k6AWZfyGwiIVOlZPNJJzk3hTEvXIgqogLu61ZvsyYxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7PXEZHXeWe1AFXCKOrzkji5i0RRdyW5HC/cu3mwZGkuS6kQ0SULF0rTI8MbKMK9IF2KLi9Tk/K/5rmZhXDjiv0DxGIPYtKgGe8pDtLOeCf/ZGjQLIVChJo5nOr3Zif2JmQlj7+x1NLb9IXGcGJtd1D9rcQqsrJ3msuHeCYGKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzNtXH2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7cPakGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBl2lL1598282
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmYXQGfZQ3O+GgA0tO4TttSZ2SWimLy/iubKy0FAa3c=; b=HzNtXH2bvzTox7o2
	vnkPd4sgI/sS/DKOfRf6aX53mydCGVWVJlA4CK/Ed53DieRqMAFPl59F3iZtAPvP
	xRZm50UiMSsamOVwmEbOGL74IkUpoYbuJf54e9C6+3KOTQyzfqZDqM7RAUNfzL/A
	fR+b0R/crLZGrmqg90XO8eJG+ggQa3Ly/SID9r/nwgpha4viJgun5m+QMxRGqXE/
	pv6wdVpbMZIBmCowX7vjYZQVVjZCBSJjVxJfBw1kHc4P9zlkQemuwlAdOv9X+cE3
	xGNCuSJaERFq7jS7xr/oNVn9KfLMuR0Fg90XbpPyWQ+nvXKk5KH/QsJgIM/yBGjX
	OE4YRA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnj42a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:49 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dbe11b1f03so6032702a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699109; x=1777303909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmYXQGfZQ3O+GgA0tO4TttSZ2SWimLy/iubKy0FAa3c=;
        b=Y7cPakGMV4grBN8U6hdzoTEfE5t1ENsv006RNIRi1OvdEZ3ahbG8SCtqpIzBepzztk
         MxwRA4IIlBIofExmJ0Eb+MqYHBTtA/S9J5vlj1cPQWmAs9hkBAIYy9yXA7k9wqeNSSFO
         8xqoGAyoZHJm7AubHO2SbfZX4eZjtMHfq1hXlOt56rztD//3w/6X4axlkI3NpBs8b+KX
         XdYrmjTVmXaZFW7VxDN3cVwfRfoie2OMNjq3E23agGNAobiI3J+8LATWtan4AyLoFCcT
         Kp+6OzE8GUfF+nyzSIZVFVZygZEsP6SHGyDmIqGNEyMsADE7q2u5XQzWOKezQVZ2h4q7
         lfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699109; x=1777303909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AmYXQGfZQ3O+GgA0tO4TttSZ2SWimLy/iubKy0FAa3c=;
        b=If2/le+d/0rg0SezRpVWG77v8UfL6cg3tZ2zWyUXgkGzjvMmGig3xtUwOi4drZ7Rkb
         uHK5wgcgSOsg/i8TA8yQ7Ag/ygSb0i3UZ8D6whyobyvro4cpONk31o0dWwcbMFMPe57U
         FnU9hfk+eZxEfDYC7QT61mQpC7v3FIGiYtq+hjxwdjMNYZxfeZJLGMcD3H9b/5nxY3mx
         /m9r9KFImsRuqj1MhC/e+jButBzGhVKrF/C/Zt2W/Pl3gT6ZGfoCoLf2QJnw4t65bM/X
         4XcXMbPAOCBj5tR5HofeykipMJhAUb/f9K3D1smW+y/vav4/oQG2eSmre6tPTKGqaMGZ
         mc7w==
X-Forwarded-Encrypted: i=1; AFNElJ937WSZnkWC80VymgehJJfzoeHWGWTnJX6tuV178Wisk6rC6g2XsRDvjbfRMwTLIrxYDw9LkkGWmHmouc1U@vger.kernel.org
X-Gm-Message-State: AOJu0YyAaxPDGXkEOKYYxzzJ61HuzJXvK/Si6cVbmxzBybTzfcBVU3Z7
	3TGUgrzwrAQzZfSMqXNqrUdXRuGnWXWvxXy2peUGrEGC5mGOq1dvd77eJ56Kwk1+TTbVfc2haXR
	R8Kc2xB1zQb1UCWBCcO+QzN8pSibDlS95o86e1J5ySyvh2Umh+hA1NJVeh4YVaIJcOl0v
X-Gm-Gg: AeBDieswmZYn6eImIqV/Ct7SMceyVKYZ/bTWd9axbVLISZtrhyWR3Q3n1XWQ4asdoTM
	vIJ581d6SrVUzRQPfAWKytEoTyAmmLlPFreKdFzbh3PEw69n3rFjS1gtbLG7zPfQJD3yPf7iW9f
	gn+s6K7089KgcmWLa9ZL7X6bytZZeGZeLtcR0iHMRJTXG9Xgh6yCOEzYDdbk+lQjkSi97wOu9OA
	TPAu3SoOv5igSgTCxKici2zqaz1Ysuw0d/u98E25MBaIyRtZcI3fTRKipvavJsCi6gOpbR8Vrhl
	WyWlyAkJ7woUfOTOteMRCA7wcWxWYWsi/+xotoWZYCpKtwIwhlse/cuIODg+a5uFPfCVcuTDKC4
	e/HZG5+ag4lA2VqmMSXoRINvjzMTQg2n58RTBcgPlPK7udUQeHCw7zrCuKrgOiUqpWtMVKzy7BQ
	GBRiROp+seFVNoLJW1ls9JqxFdZgP0/1/NalRGnCjWrsuKxA==
X-Received: by 2002:a05:6808:220f:b0:46a:5558:59a6 with SMTP id 5614622812f47-4799c917c15mr7094917b6e.6.1776699108566;
        Mon, 20 Apr 2026 08:31:48 -0700 (PDT)
X-Received: by 2002:a05:6808:220f:b0:46a:5558:59a6 with SMTP id 5614622812f47-4799c917c15mr7094834b6e.6.1776699107907;
        Mon, 20 Apr 2026 08:31:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:41 +0300
Subject: [PATCH v2 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-3-402ffe27e9e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=k6AWZfyGwiIVOlZPNJJzk3hTEvXIgqogLu61ZvsyYxE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbcgJtT3lfdmdIakF6z34HZ3ktHXV3p5BfOq
 8z0zUrUpH+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1emiB/9qqgqonWDO5IRxMutPkvsP/O4ZS025ejyoyaHHApifkD4C9iGzmoGgjhWTkfpnRhKgQ2r
 isp0o3w5u5p1qilZ4V6XFgsyRjfLzICk7d4DvrH5EvOUEmvAa2mS+K7jYE7qKFvKudyGvkv2DoI
 tt38bW6J7tDM6lKdvnf76uqsppAMrrt3IxrUjPImUdq4j/2qMAqOPdm0Qn/UrrDUS1JpAVFe//a
 4rMM3d0LOFW8D4FY7E1lGZI74H65rwyepCg9WZRJ63ZP6ZiSwTmDkUNbVABy1OydVVQyTEtIrcL
 tyGhgYg2tvFXBSx1rzfsvkhA5hiunDOHNOAVyeg4gsu4okr0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: i8bE7hLw_6UGuqFddjXu0O1LXJ5bGIUi
X-Proofpoint-GUID: i8bE7hLw_6UGuqFddjXu0O1LXJ5bGIUi
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e646e5 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sF2-0BiPaN5ps1Od_V4A:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfXw9PEnBK3Bv+H
 Z7+zIE0rITbfATCfI0u9Y5PJ/JgIsTsnXNKCqZTfInEFMe4YbY92fRAMkgzo/lTXx6kJEaAVfxm
 N6IAEIxlz3FR4WvpxJtvI7lCcqyGdOvImwH7wZj58/s33grEIcOCMA0b+XPEbUbmT7lvy5R6uwM
 4d7d8quSEbxCV62/zY5eYGD8J7jP4eJeVpiU9M/F6adJ2Lp3yOXg6MLmcWj4ulOQN5xu4yOZBxz
 hik6ih3JHQHiNZZ1jkdJSvAKTHPrqTQ6wtRSrmEQfBCaNQA1ijvvyHUpjA9eHdSeMhPKFh+0GS2
 NeuG7KjpbhANo+t89ZhJyFrpItxAt2S7GTzZxqcZiP3SGZlp1UVP5dAubqub+ZFp6085JZeV3al
 1V7CWKvp2Jxy8X9QcQ8TGO0pV/D6wa7pLfLPYo/YNqfy7XkRDS6fmvjicTghYOPEZPQEYZ1fWHm
 Xlsj5yOyCPqbf7hKHJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103796-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 4F26C430CD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is keps to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the driver which only care about the connector status and will always
pass false as the irq_hpd event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 17 ++++++++++-------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..0e2f0b046121 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @extra_status: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -153,9 +156,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, extra_status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c8c3301cd936..09c3f5954ade 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @extra_status: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..7b258485acbd 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status);
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3e4672fbd7a8..2cf604cf02db 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1556,8 +1556,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3


