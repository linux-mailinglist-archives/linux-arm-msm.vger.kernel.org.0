Return-Path: <linux-arm-msm+bounces-103321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLeJFZke4GkPcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:26:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1D408EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD04230FC8FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8D3394799;
	Wed, 15 Apr 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p39owSCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnHBxy44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0543939C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295374; cv=none; b=iIgwjhRIFdujB2wahvPhaTTE3SLnLr0OtbH3qAxpAMz4vf9KqXb33lD3Y30l35OFnHb5UbS0wzRkmKPiPFXrc+HdxcyDdxDELGZ1yDIxTKd1tsXDqeH0HWydffxV4wONBvO3oi3RZp+SME15dEwTke/AQoLY2wfQgDF4klnsd/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295374; c=relaxed/simple;
	bh=HBn2IVrDryFscwmmHLMRDSDtMBdYMWmMptzpyjE6O38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyGV1gZx4HI4UHczi8e3SA6cDxPx4VjpbUI0b9W3lhfLj2FPmlYdWeFZRLjViveeCocCVZeqYKcOMcW5sDWxtXBecDJvpl5EC7UQ1mcrtRaL293UvJ7rHai6I2/za6UpE43EKIFYzENM7Gs/QXTfyGP/d1fJXqHkUwWNWPF/Z8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p39owSCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnHBxy44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFbqup1565879
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=; b=p39owSCcXynLz3bQ
	0sXd2/RZo42YgF4RdkeoB5+bVJ3PHFhmYxYJYrmL6t2MRSnKCo/rGSlP6ZMFJ4Wq
	LsUAeJv6XqrXETI/QujxoW8J9kPmLgs5xoWCjQ+kO9IWKnLqTzPLEHd5TPZUd75I
	BXehNMtw98TF2e5SZcuHaSnRiXT2gq3zk9lWEDIZMPKJBY6R28qx73IYfjDKdA7K
	r8thAcaDUyAuVKzEQGsOP57jdvxX16et6Eyt8jhjGh3LwZcT6VCdewRMT3SUJfPi
	MofNygE6++CzV2U+8HRHdpJBjEABISEt1dZjkP0ATswnidAjP4dKQPUYontB1AOg
	PKlhQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv2qss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso323241385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295370; x=1776900170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=;
        b=KnHBxy44wVL1P/6d7V8xYM6cjejOekTqmml0ghWx9ziv85kZN7TnvqsGd3mZ83aub/
         01NLAHOcHNbRHm5v598JvuwDym/sOSqpTdLiC+8+swcLoL2XBdnLKlwKz2ShxBjPpBvG
         BW7S6zR9zaK/WqZYPb81/ZzKES66YljIQiIU4a0sfUUpnvAzNg4RI0FJy/znBm+M08Oo
         VCoqMYGWFR5+2gcDkfiPZg8iCeq1ohpvUvcfFC6JOQxVZTk3DjEBfDU9Fl7SLeZDbIbC
         yETz5fJsbRXmJLnqhEfZoJoiYm6BUS96E8ljfUy7qLbsxyeP72t/MVcdzJJAg1Mp2Psm
         OhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295370; x=1776900170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKmkX6HdG5E0XhMW9mQBc2MQ7gsubs6yKCHbbKdVCv0=;
        b=bGMkhtDIUYknxY77CpVHsBPyw/FpOw2iwqsfvL3C1Q6oSNeTooQR8HVj+HnVGZqHcD
         ajDNouLiPSsMGMr8stiaoSeZRuWWCIYhe6WtuEKmw9nLiu/tmfUKgjHhPOyV9tS6+cRS
         E94jLjVdYKNNcSQp0DbzEa37pbDyC59OlUxYwxqGc2ky1XmYHe7KEixxBqr9yuClEnjr
         eNxby9s/rO82147F6F3lZI6fPwptwZvQquLN3Mxc7X8Z8LImDJfu2NZ1ja1bYMjF37ST
         AWDBDoiFWgq3+PTc73X3z0x892TytUTYklWUZfED5eiXbPcLaKZ1oJGq400gURRjhlid
         Jb8g==
X-Forwarded-Encrypted: i=1; AFNElJ/g9ihP4d63FWG7iPHzp/TCplZtAG6vatBoztFXnsHZ7bLTqTSpnqBerrXMCedXDN6UJ1WCoFpOEYRoFwK1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdod6Hi3sPBVWi/uVFScrA0XUH1BwSIDbWJlD7+lekyZw+wsWl
	AV6cEVIOM24BXNWMUN15a2QdtAW2ARouUmaZlsABrvwyGbZ4Nytd4GBQOkgUshEUN8Kr95Zj56c
	jU8gXMgzd3mWLnOIZ6g0JqbJLd/4pivuyPK3ucBoJ57yqkoQEYdLlD9LgwU/GchLw4ztw
X-Gm-Gg: AeBDieuNyqb9sfcWrXvUec2zSfZztCmPAbjw/LhcPymvu4rofXFmeSdeWLORisL/vNE
	1pGvrCy7s3eUP15guqJ2dVoZWfMGmLxY14e+FuwyeAT/FGmTlLHgJgLZ+vzzUdwSDj/KM1H4CJg
	YQdK7S3dZA9PxvAWOZ5YH/K8pKbsOsCKMflzpGVCdjAByXbjGcQ4iekuOa4MjbqoCHV0duaK1KV
	zId3lzJEwsKs0Rys14jCBhA4IiQ9CziejU/O5HYXWXGgKnkgN9wpRo9sExDptlEkGCFMaCsvehU
	B2kcJfkX7tIQcuMuMSAa9TVrRyQ3hO6FlpRr2Daqpm7dqmbcKwogdG3v8j012PEfuH0jUMTQXbS
	X5O8U3LQC2bHFWgfloKqIHCLiVznHjf92M3at6HlcPEj2Xj2/D1qwiDG+nGu7DJTHBTwj/i57Ur
	ggGmO5hg2tKt75Q+HyUbnut9hmo6zLa3mRY0jnmVoSmFaUzw==
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr350845811cf.8.1776295370099;
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr350845381cf.8.1776295369619;
        Wed, 15 Apr 2026 16:22:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:35 +0300
Subject: [PATCH 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-4-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HBn2IVrDryFscwmmHLMRDSDtMBdYMWmMptzpyjE6O38=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B252fbaBj4KSv5jQsAVOrf3j/7BJx59z+n3I
 2IJBSzoVheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1WgwB/sEuMF29EEIY8rUMvncti+cVVAyI6rgeZiDtGdvlblf3XLLbOaC9cejNALy1z2TbL7VrWh
 96BGbQvXZrHw8bhWepW+KvH6Ejb7YLEoIpTanNPUNrpqbDTi81/xL+Ym7GTB92LnzaGwYKFozsl
 EGu3ok8Wfu3ICWI1jxGzO576N4RtHf6XrFxeyMxQkoAXIuzMFlfFN/yI7+5rs4bwUXRuhj3uBgI
 aJtwdV+Mh4sT4Xny0ZWfjQKfu2V8F2wrGSAvwLpTVcuT+LTQ2bmX19aFpZSE2qOVk1NtRId069g
 qbZxCfPnkPai+rrXVEEsa0rYtqISVnMD87C00uxhQTT6mlPP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gen_X9IQETgc-EsK5g60Cp2urf9RWyhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX+Q3ukDSX08Q8
 HrDoNR29van1OjC+/COmjpSIpge9+GtefS5RGmHKPtNJ17y9h+1IKxNhnct/fX1Ta+1sXLGd6sD
 0pZqhpFo6iFzZ1afkTRaP3TtEUhQkQPihTyIPocma8hfdEuavwQ3e9/Hz4dpXmFnOVy3D0g2XuY
 7h4queVFPifiBIntlETSaN8sWmB1qZ6qn57bu0SgKKi3IpXBdYBB8lHoPxREu983sEZvZlrp0+D
 P15CXU0oAZ3XxK8tXUtBTRLlcjLZa2aj5uqTMIPoJf19sPsn2S4hnmw5Ti7FgnSDF0KTEEFenuz
 Y30cX6EmA6AEYl3v7Kz/tcTLPNdAMj816cGcaYUHuWssVFk3zZrAGBNO1gf8yxysHsLEf18ndSd
 uJPWYRoUQ3J5tuqqI3EpUdQXzZFgODVfrL4FVh+YTLa4ZTCIFXpYbRzLp1vDNOpDYZBTwZCrcF3
 Ig48bbr0Y5/PK+YhV7Q==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69e01dca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gen_X9IQETgc-EsK5g60Cp2urf9RWyhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103321-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: E5A1D408EAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 45e14a0010c2..390a967a53f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (irq_hpd)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


