Return-Path: <linux-arm-msm+bounces-89979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPy1MBGscGkgZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:36:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4F554DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFA865E8D8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61426480343;
	Wed, 21 Jan 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1D+LO0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVuYWQfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707E844A716
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990551; cv=none; b=mXc4V/zzV15vOxCAHUz5xWhY8gJtoqOY99F/cuMezCuk35gxJZy4fYXiMTmTdXQqqzdb8zYjwi1e6/5epzBtGGwFMj3IXgpsK/ep5U6LTmuJTMvn4FL9MAy8TCP/YwyBXqOeqsWsUXA9P4rG5EJ3gBOYSeXHtSjU6Od7WSerSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990551; c=relaxed/simple;
	bh=DVyVjd3DA+M4ICG8nrdapPYCwKc6tga3+HUezhcNR48=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SSoOMZe5trrEYdScAFNVOQCD/waoybT05SSvk05D9W29NNl5HMUHjVVCxIGzG6ZJz84vnhTMl8+qv24Ypsqpo621hrDYkKq6KLossq2lDGUCGlWJw35VhY74M4OiI3GRaUgAaYtNrugk6oIIP3W898MNo+Mjl+hlrNdR30m2OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1D+LO0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVuYWQfW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6DOPn1530350
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ITPm88aV4JzH5fq9gpUXrg
	BaZryXscNZaMU+0OHF2aU=; b=a1D+LO0yd/Akq8L07j6M1Z/vYl4qDsent+EzmF
	yBbTveZ5E2Z55IQSfAA/gJvU5R+v2u3LFN2gXb0aZJlEe8C/UP4LTQLUu8fDBjh3
	6ePlMrUWgAdtPOmpLl/jd726q/2fUyw9AAGzck5c7v2QEooZbiNOg2sI7TVfzpqN
	F09nAzmvYtxXsOqO6ooFL9tOQpE/9zNwvTSWAhXj4z2KOLeC5A85u08kjeE8pUBP
	SYmLWJ+98huAzARtLS/wVztzXODS7un4DV9+SVgsjyA1RR19GNuA3WosHmybiUpL
	eTJuMsQlHwKa3jw2SWk/h/nYK1timqLJK//nQqMOB4/NWoPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83juq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:15:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a4c50fe5so446328685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990548; x=1769595348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITPm88aV4JzH5fq9gpUXrgBaZryXscNZaMU+0OHF2aU=;
        b=GVuYWQfWV13ZApEvS6IB0vrwGWcQjhDzsciV+gxc+Z5ETZIRvF+AUCLl7xBWKULZzQ
         bQYXIiIG4NR4/NZg5hLiEcM+eZ6tP9ltCAzpRElYppU0UdsLJXX94OWfaZbNhOlrUDB8
         DZ0/PAlMWH2W8GIFzFybgC09vKm7u6hZWdClUMA3IAmDTn1B/u8aR2Iki2C5jGcnV5mb
         V/Rs+BSZgELHkek7+mYD8qEW2DLetJH4KGWLvhbPgI11keEwxwQn7I6yQUZy3AH7nMc7
         9HOVGoFKGM2n/jYISRykP1NPEtwzWjFyNK/uFupJCNzZ7W3OUtPq3AoZdFIIb/g0JiXj
         D89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990548; x=1769595348;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITPm88aV4JzH5fq9gpUXrgBaZryXscNZaMU+0OHF2aU=;
        b=Q+fdZN1tIGfciKV//BgcICFSe64I7O52RJKuZyT7hv3geDE0NETuaACH+kgFru9rEc
         FCijiBxaFHdY3q/wHdz3GZ9cSUnvxNTcfHQj2yas0n247HJjowUubQjoJ44+a6JIT8IM
         R5ga06xEgHTY+Is/MhYXwA/shwC2W9rrJdus7V+Q+QYns6Dsgrc8moRbgKIgIOUf4l8R
         YS6jIyMxAD8PA/ViZ4VSSmhEKozG1LVzKWESX8yrFKzd3w3riwSGnnCjjCqShss8L0C+
         TtcP7g1xb9FxinNUg5w+/jNXbWKiqD8+Q+PtV9KTPjSv2Q+6mUtzeA2XJfpJvHpl3Kig
         njOg==
X-Forwarded-Encrypted: i=1; AJvYcCXOS/i5uTrZHvQF6s19+eQAlXb5AH1axuBilfv4R/9GiPoMRIVpBE92j76vWYRU2Dh3K4FxKFuIhX/UinR5@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVBrS2Ygzzkqb2OviCkKhwr9UCjTYACOA6fPh4umcqD503LcK
	rpoSDJ37CtfyMCf7qAgbxQAmaMI4IhYDtR+r6evjIPpJNG8vk8l1kPOrJo43lhG2hm7/Q+weqt1
	MD9vxD1oBGPGF7qFv8SZcPKjkZhCtIylj3FlL0TbPhw5v0eDgNw5H61VS/vZpO1K8hXEo
X-Gm-Gg: AZuq6aJn/+J4pVRmDudbL1kwlnb7iET7tMr5549KpjJC/42t9W5mE0paUFHBufDvq2o
	FjDjbt4Xrqof3+Et79kbaEn2psl7MxAYPA45UdRM27qtZocUzPLn1eSKqcula7xRSMSr95DGgce
	Z7Ik7ZyzqNcWFNPHW7+QopqXwDFBlmF/v2R1iUaT3NN68SqLfBCvhWskQxsMeExniKFNROAT898
	cq6DvpBQYjQ4H6CldjECAAJSWZbNHCBEro1+9itwmIFv9Ge3QeMqPA+UXXNMoDwwFdGw1kzrrRQ
	8XacneqnNeVc06mC42JhC8+Rd2YJibEGgWoBE11lSdKhoZi3A4GeAy5fiYpxoDCxis+7Hnc9UKz
	ZTfpITvi3z0JMFje4YgfYfWw+a5GUJIkOIUPAVfrPzdO56CudE/zjay5TCzJqPDpJOmDF3q5eAe
	CiZbMo9UE+2sdyc5OZS+r8lv4=
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id af79cd13be357-8c6a6956064mr2425032185a.71.1768990547606;
        Wed, 21 Jan 2026 02:15:47 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id af79cd13be357-8c6a6956064mr2425028385a.71.1768990547185;
        Wed, 21 Jan 2026 02:15:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:15:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm: bridge: anx7625: implement Type-C support
Date: Wed, 21 Jan 2026 12:15:44 +0200
Message-Id: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCncGkC/3WMwQ6DIBAFf8XsuRhYQU1P/Y/GA8W1klSxYInG8
 O+l3nt5ybxk5oBA3lKAa3GAp2iDdXMGvBRgRj0/idk+MyBHJQTWTM9bU6Ni676QYbzppVKDxKr
 XkJ3F02C3s3fvMo82rM7vZz6K3/uvFAXjDPFR8aGVtW7bmwuhfH/0y7hpKvNAl1L6AmLhvAixA
 AAA
X-Change-ID: 20251126-anx7625-typec-07d455f423da
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DVyVjd3DA+M4ICG8nrdapPYCwKc6tga3+HUezhcNR48=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdRp0cS6dFURXtA2XjAcTajk63y7k5PHALqf
 1EUbOGTAISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1WUECACeTYP0kN9b5t/Hxm/8RwzOLSt2MO2b+j9m9KynWmWKgqwluN11nvOGBeI9EQj4W+Siy9j
 4KrsaAHUizKE0PC3krv/pYuWAVqK9jueBUfuRqs4SAvhBisZuN+YJPdVByd3S8PqAK5L752pWXH
 +qnITFRiQDkFRwJ/T0Xou/ETFl8YtgPfV/rScDGBg6E2tA6qv44GEl0LbKK7nCBDJX5FkvMrb5i
 xG2yGbUu3ZTsEc3gwtE4AwAzpO1QFr7oK8v1PdWS0EudfUWBM7KJOgj003BHnGDPhkV1MUiRxaX
 b9pvxSbnOwtz5SdbsQJQNx9EgDr7gd8ALJkQ9Sdgqr6YpRiP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ezvvykihLw9lUs4do4uIXu7RPpCSRcOA
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=6970a754 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lTOfhhQ1OH7yEsO6ukYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX2pH8sf4mhxlF
 bs+KcRyhM9bn9OXZCiSJ2KIwa39y/OHGkivfgf95+arVWGwPFowuOBOj/AoQZ5Sl0gTt3p5Zep6
 jQRS5/4cO/aKnrp6LD23dOkjyOXf/yBsq52yJj+fq+5y9Xpn7fQYPV4GXUqiS/8J3VQlGw7MJmQ
 FHU3kXtkFzK5PzfjlRYQj/RtKA0/HYmubCjgkrOK4vHr39YfYNeK5l2a/jbZCcSUgXuaZKK2HRq
 OB3/C7MUGKVJARQ7J1ScYkY7+kdt4+dTWq0wp3FyCRcOsDXb6jDsdEuO25aqQSDjcvK88jRuOHK
 aFrdU2uzV0+SKJ/JKJPPqwVh3WJ01qeR3ND1MYsE8o1f8hyx1AbU8Oi4Z6aeUM01hOqhbU7zqQK
 P9Ewuxx5c3RC0RIaHS8cld+FK7T8i4jdnquvDpBOfTnzelqdD8RQf5bfc8QsF40yEixtgjBr8os
 AYJe32wu7Du5zZWtIpw==
X-Proofpoint-ORIG-GUID: ezvvykihLw9lUs4do4uIXu7RPpCSRcOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-89979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AA4F554DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Provide minimal Type-C support necessary for
ANX7625 to register the Type-C port device and properly respond to data
/ power role events from the Type-C partner.

Notes:
- I'm not 100% happy having Type-C code in the DRM subtree. Should I use
  AUX device and to move Type-C-related code to drivers/usb/typec?

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reworked handling of status bits, removing code duplication.
- Enabled setting data role through the ANX7625 messages.
- Link to v1: https://lore.kernel.org/r/20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      dt-bindings: drm/bridge: anx7625: describe Type-C connector
      drm: bridge: anx7625: implement minimal Type-C support
      drm: bridge: anx7625: implement message sending

 .../bindings/display/bridge/analogix,anx7625.yaml  |  98 ++++++++-
 drivers/gpu/drm/bridge/analogix/Kconfig            |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 223 ++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  34 +++-
 4 files changed, 345 insertions(+), 11 deletions(-)
---
base-commit: 873e63546ef0e4c612f57a097e4fbcd5b2f4abb6
change-id: 20251126-anx7625-typec-07d455f423da

Best regards,
-- 
With best wishes
Dmitry


