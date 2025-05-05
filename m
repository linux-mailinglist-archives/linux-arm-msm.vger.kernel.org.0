Return-Path: <linux-arm-msm+bounces-56734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFFAA8A71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D79E3B2D63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1C71C36;
	Mon,  5 May 2025 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9QjX2PV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC864A98
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746406558; cv=none; b=sztIXepF3bp+bItpIRDZ73Jndv6SB+6ulINegvvHvw5CG6P9qU4YcG93pcXQj68Pv5T7qhLkT7ntR964yMnVzyT0kd98fCryqHE/xDmErSXnJvhX7Jq51vzeUaHbWmdCIUYIzsZRYHt9Kjh/zELjlugDK234tkJYg0/tZcG5X0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746406558; c=relaxed/simple;
	bh=LTzdshEjjoz+1Q0aHVyGR35UqGnAioQQQ1+XdoWfeZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iamQFMF2RftmOi9vCYZ1tJW/2cYAFPFba2zVRwIOUgsO0/fypJ5UgH8yb2kgsWu4uYKijZDQ0ckVKR3LXsSbMh85ebA1BPCXXZQ/5h1lDS3DCFCvPUJLlKz2mkSiqe0t1vH5Di6PjmMnjvqeRUnV22ZYfnk4/CJmt2cc16Uizuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9QjX2PV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NU23E015874
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bScMRW/t/S7USpvl8/Meg4mWuCwC1biGFJfQYK3oMHw=; b=B9QjX2PV9v3su2oR
	Qz6Pmc11VsUlu7mHg3jkjzPPtZwgAk7MIeImGSDS7wmaIiaYk2aQcCNx+x+QrZxe
	eCld8VOJ3yVVzkQWnEmtObXhk8QntuDYyJX7yXHz5rS/yLiAv9hNicN0udVMWfBc
	6vmk0kCpZ5M1Z/IUrW6Wzs7ifqodPbeAsgvMaYsziRNoN3xvNUUpoqf1RWxOQ/9K
	VUgExHscnNKrsWKVPZfqHCojoYNAj8POUE6pnQ6EX13ZnZM1/fOH07NJ8NZxtkmX
	0GvhawBdYR0XIwa2kXDofsvBi69Fqe1gociwgldwt8qBrronl96Lli8blthvqgre
	zLFIFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg2pvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:55:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c791987cf6so810064685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746406550; x=1747011350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bScMRW/t/S7USpvl8/Meg4mWuCwC1biGFJfQYK3oMHw=;
        b=PnQku8lUJ1GDmYpKfP7xJbux+T12TkXGBdht1qwq3ihWoYd7u6KPHJbh4Fl9Fewfp5
         kQynH/yb3snePHwugXK5wzMrJXCgQfA8j+dltXL2s2O2evDeQcDj5Y79B4h7yiUQlV0n
         bIDZGqWLAelwKc8mxJ02Sa++ydZkXGChqOCLMx0GK2a2QD2lFg2rGc3AW9eHTFWhP0xu
         2/4F2aWIKQ2sgtvzmXTBIj2m1M71iPVjGGRGMwA5spmrwTyW/Tov6Bx8ShH8byuflpFD
         kJpKOL/Q87HzYj4+dgnwaMNs+ygscWMflVdMBjAPCiafZ4S9WZDJTAOJfQTvrF4+GSY1
         BSXQ==
X-Gm-Message-State: AOJu0Yx4tfHamfmEAi7+tfo9tyR+20S3In9qXzzwyoJhl6raSYmI9+IZ
	QzHb3L/tDuwmeSxBE5w31GLX2hUisE6+enwaiTJOyriHFGsU7Rw977Ove1xrLWiN8ahGw9JgF7T
	5YHyC2LLT38GtKk8IbpQX4p1CtxF0smWHl93yo82FqXHnuX2gM+69GD3WfrxCcSR7
X-Gm-Gg: ASbGncs9BQqINvhXfLPIOoZ1PxV/uo9p9hQ33Xj3otlMNo0ALlAKdnhlDkjWXVY00Jg
	8c501Woj/a4tWm+eTtT6OHMFy6TXWjlM+IuVw90fn5saT+n4AHTXNsTwz7/YRF3Erw6YMIumvNc
	B6aX1egusEQJazg0mt4TLagBEberNsVcY2m+GKX3YgDEnuYm+nDvDNhxeBaB15CwrLgkA4P83pr
	7Voa8aWA73jsgObpNmGI3MdZ8h6nlk89WDmVF3nL1oHOIIXTRiCnRqRtO+4S0i/FN6KQaQDIUyq
	cKzQFtIQPM8fr3Fm3SjhGbkARH+Ol6Y2gRqd5Ivq7xjJvhu4i1D4w6Furw1oM6hEqgjk+uj8wiH
	EbrY+GTIn9lwaRkwkjTukgsjN
X-Received: by 2002:a05:620a:288f:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7cae39e4d94mr562790885a.0.1746406549858;
        Sun, 04 May 2025 17:55:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR1BnB1bqJFNML5KMH4T4Sx/W6dCdj2CMTT7+fkvXjPRs+15OY5IAA/zDDkF5eHXUukTln3A==
X-Received: by 2002:a05:620a:288f:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7cae39e4d94mr562787485a.0.1746406549425;
        Sun, 04 May 2025 17:55:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee07asm1501118e87.118.2025.05.04.17.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:55:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v5 13/13] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
Date: Mon,  5 May 2025 03:55:47 +0300
Message-Id: <20250505-fd-hdmi-hpd-v5-13-48541f76318c@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4345;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SzYbiSJHs1yMPXj6OmRiDQC/Js3KF24ybXscune0PUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAuq8oeBoszbBJhsuHgaf/J9Vn91t4s2pFa0L
 KQP44Y9ZyeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgLqgAKCRCLPIo+Aiko
 1QeeCACVtDaCnd61a6+aWoQBYA37uOTTFipnJMx09Bimgk5R2wDPo3W5QQ9KQblYw/JuXRrS6NT
 3aI52WYS5+oANdWEfOynFa8FsoAVcef2bIl8BdPgY94UnlS8qrPjC8C6tgbFrnXOSJPGTY6KIIo
 +Zjizl/URZ6sL+KZaRISQ1ADm4DGNVZrqopTlz9P/zSWFEHT2UTb5hDS2ai8l+0qopAbDeS/vrz
 JJI8jqTUHbUwMJsI5B1n/XEgyuzvdgLm+5tZ7RBSK4tY0fZ35pYkpF508xGDG+L269aLDALkxmN
 OeVPWNQoA1xEI+khIRrkdkbqQmwpqUoXD9p2sM53CqDpTTQd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: t-g3B6L5Rlt-t_aZ2BQ3oV_ujdBZ-Aos
X-Proofpoint-ORIG-GUID: t-g3B6L5Rlt-t_aZ2BQ3oV_ujdBZ-Aos
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68180c9b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=6oMmD3cprD66TWOKKWcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwNyBTYWx0ZWRfX33Hx2L820yxb
 2G/B5pJgc39UHWnjkHRUAswxT2tyVBZXRsqQOHN+YbiI9SCi5jX4zHn3QIyeLtoPA2RHrDb4sr+
 WHU9uKHwdWYDA7ZPCNHgkMwYLXruiT48NuXNKoQ1zgXFuEdbECB9el9xvdBstbupjHLzovxVufw
 mT+AIjPPsWc1J6G8Q6p2CfCzZykegsN333bpINCxUyBAHhElJM/uX9FVP4bh1WJdtJUqEyYywcr
 O+LZiFUFF7zH5mwKB7dU03l+9hD4ibJd/jM/AYE08C5zenbnN9UCHa6J4u5IpTPXtVxmm/1VdZw
 XgYwYJth/89lc5v62z0+SWPvkMOlYIsL6S9sZAhYwtRZdtVlSkDUOs+8vZSyZWSyA5DCkN71KeG
 E/i9XBUSK86Cu4aVkA5g4ShaYRszM/IcV6sjjSm7KPBtEJWTaHpifAY6Pfj8a42QsvO5zeUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050007

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>=0D
=0D
The HDMI driver already has msm_hdmi_hpd_enable() and=0D
msm_hdmi_hpd_disable() functions. Wire them into the=0D
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled=0D
dynamically rather than always having HPD events generation enabled.=0D
=0D
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>=0D
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>=0D
---=0D
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------=0D
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--=0D
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++=0D
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------=0D
 4 files changed, 10 insertions(+), 17 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdm=
i.c=0D
index 5355cfd391c5cc3053f771dd03e24dfde16733bf..2fd388b892dcb3d83cf57b4616b=
7a65f9ff674d1 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c=0D
@@ -200,12 +200,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,=0D
 		goto fail;=0D
 	}=0D
 =0D
-	ret =3D msm_hdmi_hpd_enable(hdmi->bridge);=0D
-	if (ret < 0) {=0D
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);=0D
-		goto fail;=0D
-	}=0D
-=0D
 	return 0;=0D
 =0D
 fail:=0D
@@ -261,9 +255,6 @@ static void msm_hdmi_unbind(struct device *dev, struct =
device *master,=0D
 	struct msm_drm_private *priv =3D dev_get_drvdata(master);=0D
 =0D
 	if (priv->hdmi) {=0D
-		if (priv->hdmi->bridge)=0D
-			msm_hdmi_hpd_disable(priv->hdmi);=0D
-=0D
 		msm_hdmi_destroy(priv->hdmi);=0D
 		priv->hdmi =3D NULL;=0D
 	}=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdm=
i.h=0D
index e488ee31cc865b4eee9d486d978217c00f7816bf..d5e572d10d6a14b866f13c3a0d6=
63cc6ae435ef5 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h=0D
@@ -216,8 +216,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);=0D
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);=0D
 enum drm_connector_status msm_hdmi_bridge_detect(=0D
 		struct drm_bridge *bridge);=0D
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);=0D
-void msm_hdmi_hpd_disable(struct hdmi *hdmi);=0D
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);=0D
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);=0D
 =0D
 /*=0D
  * i2c adapter for ddc:=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/h=
dmi/hdmi_bridge.c=0D
index 8ff0079abc801448e96b73ebea4730edea55ea6c..53a7ce8cc7bc7b6278eae2cbc42=
c3fda8d697f6d 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c=0D
@@ -459,6 +459,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_fu=
ncs =3D {=0D
 	.atomic_post_disable =3D msm_hdmi_bridge_atomic_post_disable,=0D
 	.edid_read =3D msm_hdmi_bridge_edid_read,=0D
 	.detect =3D msm_hdmi_bridge_detect,=0D
+	.hpd_enable =3D msm_hdmi_hpd_enable,=0D
+	.hpd_disable =3D msm_hdmi_hpd_disable,=0D
 	.hdmi_tmds_char_rate_valid =3D msm_hdmi_bridge_tmds_char_rate_valid,=0D
 	.hdmi_clear_infoframe =3D msm_hdmi_bridge_clear_infoframe,=0D
 	.hdmi_write_infoframe =3D msm_hdmi_bridge_write_infoframe,=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi=
/hdmi_hpd.c=0D
index e03d0ca230e64d7675534074d6e14587815119b6..407e6c449ee0d84628e4cae9dd4=
3c1b1f2c0090f 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c=0D
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)=0D
 	}=0D
 }=0D
 =0D
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
 {=0D
 	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);=0D
 	struct hdmi *hdmi =3D hdmi_bridge->hdmi;=0D
@@ -73,8 +73,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);=0D
 =0D
 	ret =3D pm_runtime_resume_and_get(dev);=0D
-	if (ret)=0D
-		return ret;=0D
+	if (WARN_ON(ret))=0D
+		return;=0D
 =0D
 	mutex_lock(&hdmi->state_mutex);=0D
 	msm_hdmi_set_mode(hdmi, false);=0D
@@ -102,12 +102,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,=0D
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);=0D
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);=0D
-=0D
-	return 0;=0D
 }=0D
 =0D
-void msm_hdmi_hpd_disable(struct hdmi *hdmi)=0D
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)=0D
 {=0D
+	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);=0D
+	struct hdmi *hdmi =3D hdmi_bridge->hdmi;=0D
 	struct device *dev =3D &hdmi->pdev->dev;=0D
 =0D
 	/* Disable HPD interrupt */=0D
=0D
-- =0D
2.39.5=0D
=0D

