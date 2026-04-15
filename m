Return-Path: <linux-arm-msm+bounces-103319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB0VCv4d4GkGcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:23:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0454408E60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EB0030F2A44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0D13939A5;
	Wed, 15 Apr 2026 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g09MrNJn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLG3UIL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DB3939D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295368; cv=none; b=eUyIL8dWEeUSFK+TNwQzsRuIinUBAb+EbtwjhiQH70hwN8UL4TV9ZLAHw2mjKqOVt5T626Nd3V7cmIl3wTwnjOhZP3hTc/sQdaM3jiqFBLpKP9dvN+a7OQNDf+OW132z9C2pw9aa5XEuLDMqirAXrO+K5y8V5L61QmcyEMuwneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295368; c=relaxed/simple;
	bh=6rORaArznpSQQTKVl4Kfyi2yktT022Z5u+bODOjXSJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJh3RwCFjdJfHPur0VTVdXLNhufbvBbTPtcEI1a9ghJtvXEbBWNUc1/nKyFWwGpKKJcO59nNH/19z5sgKUbfBZKFxWgngtFkxJO+GGqpeD2/M2hmgUTdUlLj0eGsfNxiyNCywptbvc7obOeHkx8CPHKdGmWEs1+3sRuRRFFZnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g09MrNJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLG3UIL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFa67o4053063
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=; b=g09MrNJnRHLdHWgi
	9uj2h6yUKloyNbKSypu1vYKLlUIHqQS7Bi4IEwXxUAFFtp/U41fOCBx0PeUPlDjk
	ZLuctqZIDW84MWPIHmyXbkAZpeW3o2KAslECftGynDtxsy2c/ZsH6yUcG6kWG5c6
	e/RM4Rs8ajT00PdeJWYAgB8ZbgIjD/ptneM6WOeKWAgQmdAPqYjhwszd6ikTLinG
	jGpo0JK4NSEz2NH7vNS3egm7j68KbxhnsWEtX7kbeIMZqBvq1NQUH/vi4VFx2pHy
	pNdeDrPY8KG2k8Cur6igphFAKaB1vIZWL4CkzquNlUBw5HeSookC/a27pm+rGLQH
	KKgbjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5tr0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca14d1faaso188344996d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295365; x=1776900165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=;
        b=KLG3UIL6dmEJ5rpSii91mKnf8DGcQrB6jUAaWivUdgcOp/TrtFWp1gDo1jFpW8XcZq
         zMw0XLUgk0GW4NQJoBvBY/rI6Vp1jcyXMcB/RXBLQsV457sKIn4j4y7OrVLTXMfDzFti
         ToqvZlDo86qQ6+ARRytb38Ey4lD6B9LhERUPvbxwLIhUEo3hrUMX0poky3iYeSpuZ1JR
         RYczMjmzCWL0PvOPbMyo5KT1Av1eLFHhs/dJaQ8uZDwl9kHTLW8THk1sQCqG/bTprr80
         EI14LJPPKJsYEUgzMD+0HaFmF8PxP2BY34Jw9KDkVNhgw00ykn3bCTmzalDnjWdgloWq
         xKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295365; x=1776900165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZoYO/dltykYoPLKNW3ahMj9QZ/WW1GzPElSF85LROqY=;
        b=WYmJd2AuniqIXVS3Za9zJNpe7qZpQrIWoOBg2UAB3tzgzz4B+/Z3Xwc8bOA7bF+2Dt
         ZMOMI2JZWsbhg+URymGS1yIaogrRj4/zEkswiEqsdlt7t0j2qsZmxMOddH9eZJeblRcE
         Y0fZAFO0adb470fihA17jZ0sV6SVph/9OR0PrkFvMenFD9DeYghOF43xOctUcPx7bscz
         +gsYbkqRAwSTX4MjszR5bkWq/ZV1vwZHLSOE7/HaLphoa8YxOD2Tj3bczNED7ydqQADm
         8Nyb3jLICxcDCd2Xq9OYovtkEGtH4ljYJIwlXzZA+H08JzLl9aSnHgf5ei7+tcuDNthZ
         c0wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UFp/v2j74v9pcNKi/tLionOB/rlMAxnUbckD97PcHvGiyuq5C3I+udpcL+EjfmiortneT4yOmpKUUJ8zv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QiP/+bcdfJThLb/z+PhCSjq9ZxBN2x4A5KZIS3MbBVsn1srM
	NrJNV2X1xRmxon7oK9fruyU3+eAzZjiCuw6m1PaVboOyoX0DVrgqCzpIaX4ixsXSp4MgpY+KwCX
	wzUDFCZzFYeZnwFUM/vZU7f9FaL/AmweJgbWV9UkeApJD9V3ihn21GCpzcgl75Fzae2fx
X-Gm-Gg: AeBDieuw9YuYz8wI+7hP5JALMRwBlxwtIca0ZIm1zlpv8wxfAHXCIgealhON+zpS61Q
	RghsCGC8EOgnks6C/cWojPeBPPPn0BT32Ljo42Od9rLU/4XMU/EgiFoU8pQ1KNrhoud47sEXmle
	D5734Es4OQHDiR5Zt26vekmvWX149+oH4EtHLmKgzZcMF6gzG0qrUU5ig4mJRuWbK9O4ATLwp7T
	0EzPd0h8XRqFbPis3go2QBd6WrdcYgbRmxxgH/lKvFFN+P2LDysiRK6paBculGMYL1Y2kMyTW+g
	H5HSAnqWpKJcavcQqbpppHPKCgLGqbDBUvUaZo5EW9mdVMlZ3iAIN0bnAdIf1BQZ4wMmsOni+vl
	7DhHnCeDRyXUOFMzXfdI4Cgkp+W7gOved6oQc/Fm7qsmSZv+7ZVULaX4hfq17vU/re4lV3b1h/M
	Mqi1Il0OtNFHkpErB0td/+JURRg0W/hJhWo7yIZakNpfOwnw==
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr290989531cf.36.1776295364510;
        Wed, 15 Apr 2026 16:22:44 -0700 (PDT)
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr290989011cf.36.1776295363986;
        Wed, 15 Apr 2026 16:22:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:33 +0300
Subject: [PATCH 2/6] drm/bridge: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-2-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12643;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6rORaArznpSQQTKVl4Kfyi2yktT022Z5u+bODOjXSJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25qCkiDb9+iE2BeoGKl2Q1oeTgvlffW/Aa7
 0io9+1ZlsCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QWAB/9wBep+eelol4BgqqokK0DSPhbOav8X1GICl2RUKLcA8yPvCyJ9cmsk0svCAZr6NKF3MEg
 yxJoc3jncoJbnOTBGdNrbmbj12uv5aRWod96Rf2kXiJnyYfQDF1A/fmKs5UNT1uEixt03Y6nZuG
 sLq1QU7oztnQFihmuEUByqKLnnqh1Ms5zl+ob9JhOrsFMEhhYVYGYjLwbsbOOlNMHYZyC9H39X7
 sO1pRBznlkIHboz340sLs+ohTehASX9UXtUpNlkWdEKs114OcoOhOp5H/U7JGN9pCzuIqNT/nGg
 HqnJUfKVj1oIljk2Iwek9QaprPCFVbuCf+nI51OkTr3o3GZv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69e01dc5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ytOayRieDpR7XCQrtqAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jgK99DuJvpi5MEb4BHRBG255xKJVCpi7
X-Proofpoint-GUID: jgK99DuJvpi5MEb4BHRBG255xKJVCpi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX5EmFCR23jvKX
 rWel+s9jt6J4CubDY//iSDPztKqkbRKjpnkQsnl+/agRSfgQAr1VQmFMFLDPT6KRXEAgDuCsLAK
 pXyQFgmMfBQXroLQTsY1T1++cl60a7oa7dj5ZpBGt+2+UVya4EeKyNGC5alwtGFWmzZLjN9/SYK
 DpmhXOAen9IPJc1+jWtqy/aLihkXcSnGHcAmjCi4IKUrEDk2yWGka2yEcc33l4J3FosMjpME2Wc
 0y00wv5sJsrZf6OqVtRx5hlZt+Whe905RvMCCuS73ksN33XD7DJ8ssU4HTE5xq4jXbgcBhTkcYw
 XjTD2t4EEyggUC+70/t2ZGa0i997SyaBgO0iq0OrBPmvusorAsSiAQlaALUQjUSg0CN72R+8TgN
 peUjY4mT8vh+WrX+KSvuNerZzAvnUVgqWbK2YxmK2pc/OPTK72SJbUwb1bhEL+YP9wz/ZzTz0kl
 /E3C1iPaGpMDpgI0gvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103319-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: D0454408E60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass down the notifications about the IRQ_HPD events down to the
individual drivers, letting them handle those as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 21 ++++++++++++---------
 drivers/gpu/drm/drm_bridge.c                   |  5 +++--
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 include/drm/drm_bridge.h                       |  8 +++++---
 include/drm/drm_connector.h                    |  3 ++-
 14 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 54d49d4882c8..6d932dbe062b 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -259,7 +259,7 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status, bool irq_hpd)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 8a0b48efca58..3ffbb7346418 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -504,7 +504,7 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status, bool irq_hpd)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 11aab07d88df..7e5a110cfa1f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -430,7 +430,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 3b6b0e92cf89..4111aa104256 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,7 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status, bool irq_hpd)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 39cc18f78eda..749d3d63216c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    bool irq_hpd)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -149,12 +150,12 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, irq_hpd);
 	}
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status, bool irq_hpd)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,24 +164,26 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, irq_hpd);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, irq_hpd);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   bool irq_hpd)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, irq_hpd);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, false);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d6f512b73389..9c44e9b6c638 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1444,7 +1444,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      bool irq_hpd),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1509,7 +1510,7 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, false);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5fdacbd84bd7..809ce38c4822 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3531,7 +3531,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, irq_hpd);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b8b6d62fb275..524d6c67ca54 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6784,7 +6784,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       bool irq_hpd)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 1abb0572bb5f..346c4d2e26e8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  bool irq_hpd)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d2124d625485..45e14a0010c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1785,7 +1785,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      bool irq_hpd)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 9eb3431dd93a..5a877655d56c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -41,6 +41,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      bool irq_hpd);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 29b2dfb90b5f..dae9e464889c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    bool irq_hpd)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a8d67bd9ee50..4eea124c7eb7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -615,7 +615,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   bool irq_hpd);
 
 	/**
 	 * @hpd_enable:
@@ -1260,7 +1261,7 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status, bool irq_hpd);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1550,7 +1551,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      bool irq_hpd),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e8e7e6c9eb5c..e164b0dbaa47 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1704,7 +1704,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  bool irq_hpd);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3


