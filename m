Return-Path: <linux-arm-msm+bounces-83424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023DC89094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2923B32A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32E431E0EF;
	Wed, 26 Nov 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MV1DKF7h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJZp45fZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24831D36B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150127; cv=none; b=iBlKSPPShqE8Zga3i+U8Y39LV+HVMveHVEs3mm1Jf7xJJqzTiKlLBjIOXkTL+H0+bVN9w64j3FqhLuzrRmGtvf9YvK1MTKVgp8AIfQairc+yzSU4dltjE7/jOHI0+5M0GKXVxBjJRmcbbxODkaR//t2nhKYk69lYg0fSNC7FbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150127; c=relaxed/simple;
	bh=uSNCR60mUAfhqc+JWZUJ2IwqPcnPja5G4zUDlK45vRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMRqp8pImHjDOx1EE01ZGVcYnJ53qOfsLcoXfi9efLdxpa2jOJkP4cu4zd8rPbVWvMl+TB1ICycgNYFcn1ATzgYt5xlbl5j4Q/WZyZtLpI+IvZJi+pIyUCF4A0l0ZGhcKeAO9cmayN/XJNSFiJcspUl9+GcWmqmILaEYYt33fj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MV1DKF7h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJZp45fZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ1Pskl3317316
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3j5o7XEKSZlIeCiZ5DKpqNZdvGJne19TQ44ufGC62k=; b=MV1DKF7hFo4+L6GQ
	KUUVV62nNGzVwnruQVTNGTm7PTOKgefibVcDz1irNUjYhPQhvIuLR6097F3p1TXL
	VYJx4CDYpPnX0JxO3lCJJma7Sv6TCOk9xjQAeSjfmdxuN+GhulZ53iqdQmP39h3G
	qDZAOVpBdZvRfwLFvoLfB6j9G+7k9AM8YP45L8ZcvUTB6CYWvoHjK+R8G00rVB9e
	7bqrbIQ16NY7jaUBEISuTFoBvsGQu4+u90yFpHQiOxbeCSlBAg9qb/RH5sXzye1c
	NtaMaNC08kl83m2i6Lop0nDaTtnWwk+Mcg87bYE71WJgCtOrFLUwsW4f8LVMUTam
	rLi45w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qk2gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1438840785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150123; x=1764754923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3j5o7XEKSZlIeCiZ5DKpqNZdvGJne19TQ44ufGC62k=;
        b=WJZp45fZYY84/FXLcmJqcFozGxSubNq3qgSOLcy7XdNMNBm5Xdsl5a5fcgridf5glV
         nSg0zEuhFLP1fxSp7KS/76OXFlqZSuj9rs7NauhOCWiwIS7kb3ij64+OUI4YB6QMmb+D
         usIBFZVCvJAN+Ud//uqRVpfj9ryske7JqMrCai5MS5E5BLqRRJeiXtbD2IXUE8ROAY6r
         YJsZDQCd7xwjN43gvnGR8CHRnuUPeyPNgBFRY9teA/jJEXK0QmB/LeH6xRUqrQYq7zqb
         QcLnRJZH/jTN0wkaDlXTL8+up3oOTBlZ757R6bRurYv2T0xHw4DfYYmWKfMVdnoEYNK5
         lUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150123; x=1764754923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M3j5o7XEKSZlIeCiZ5DKpqNZdvGJne19TQ44ufGC62k=;
        b=fmCPJLcvOJKj1pWZJECjLSlxrvbkvDXWWhSTUkgSvk0/N+vS+gIExa/t15ZVTWtPcv
         mZ2NmwueV2VUfB3UMQKgKA/XMPS2KlCl15k3CJP3jQWMWpULw4bxc5Lp/VBBP+ZchcbU
         afLfSk77psZ5eW1XLsyLhfCZ6z4hnzd3u4IT7K0K8L42T98tOHKhowWt928GBYmcPUXr
         rQWRSuyovUBAKHbLp03ODtY2MSJBQyunSRlQ7aonw9n7LT26uhtzAbkwshx4+ycVsmcg
         0LVeaIR6+mRU6G0nU5DXVV2WvD6fXPiJQRpNz80vuOhLyXOgiSaUWGnfQmMc5/0TtDnE
         yBDg==
X-Forwarded-Encrypted: i=1; AJvYcCV7hCtj6LwMQaxyETtD+TmiPmG4/9fEwWNzvNSR4KD/DTwqEZwSpTqhrh+P5c9bJkCCGGynwOXuToNvWt1D@vger.kernel.org
X-Gm-Message-State: AOJu0Yymhih+rjiGCC7aziY/vQX1xqnimEfHKOmZLn2/LmU3ZC07c+6L
	3+7MxDAYK3M5Bj/T2fAGuqlfCZ/TcJgBlgv4p/aY2KAVY1MSPKBBSLV+9n4lFUYE9ppY/QMc6bC
	D6/lRROa84ozkHmUedHx7AnsgtuO/smxkmcxsFGpxdrLXOkGgAuL9q2LvUFebSDNHm2Bx
X-Gm-Gg: ASbGncsDQu358OmWXFr0mLKvy3YTFVfb6Yac3fzX/RSpCC3nIQiGh/+Kj2lK6Zkh1qy
	0RK0E4sL1ZQknMauTpXtQcXoE18n2O+IULGCTL+ULTw031XPxcCRsKIsXVpFs9+L2JpAI8Lgag6
	tUdwHKmNgs3hwJUZX1X6/lhlh4jPL6XFEuNaYPbAgFeWx6V5iQJedr9PUe1Evnl2prjoLCbKjKC
	2GdLFro0ZON/yT4O53YgS3NW6seM89EL4IJUjry4adc0nFw+gyXIST8NIOg0QND17iJlrbEvhYO
	vvDoMncp5CT5h9xBunNswOUUwuC9cwOkoe9Z1A4PijTiz6dFgW9zmAHhSQXDaAsXlJCj1nO0F5Y
	RKmHAJyBcKptKxlIpWmCFJ156M+gP4cMOgF8O1C/kESPXoaD7Q48u3jBUbO9Kbrz9PtArL35WMu
	3BKBGZ0Z+P62tL7x0EWqzUB2c=
X-Received: by 2002:a05:620a:3196:b0:8b2:e7db:2540 with SMTP id af79cd13be357-8b33d1d0df6mr2355828385a.29.1764150122793;
        Wed, 26 Nov 2025 01:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgkri02+TGQbSc51Gh1Jm1pf9E+oAYwa67XcBA05lZ7ao8NgPAavaWYyv3ddD1aL22RunpLA==
X-Received: by 2002:a05:620a:3196:b0:8b2:e7db:2540 with SMTP id af79cd13be357-8b33d1d0df6mr2355822985a.29.1764150122145;
        Wed, 26 Nov 2025 01:42:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:42:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:41:57 +0200
Subject: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
In-Reply-To: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10623;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uSNCR60mUAfhqc+JWZUJ2IwqPcnPja5G4zUDlK45vRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpJstms2rN08MIfxLywFGOdozwLYpKB3z/IwBch
 F2SeQYvYrqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSbLZgAKCRCLPIo+Aiko
 1YZQCACpENCPZMA3oR+EFX3pSQmUwN6/fEmiMv3WDEyXDcOI46f0XMMUuGXbhYgkNGM9Db5Ot61
 hkSRyKbkrAgNpRieU3QfGFyNqQTqnwWfEYyVQV/eyACntEcUiH0ckVZeFDdHGio/VCf6cxeRXMF
 oiH8rnvPnyZMoHr6+VmCbHu2/1RWHdODV9kJt0UIcR72m4aovV++53HEmC9wqTqTIiaDY2KQqYb
 p92o8cshFjbe6dUKVKFxRfjQ5KkmA4BPEkM3P7oQNNhB/bhIMyYAQMpz+s0esHO6lUznfrdwX99
 cx/5tiMdVT/oXlRmHwRB7hJzCV/YBBTQyHtZyWnQKfeuYpqg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX/0a3cbNqws5a
 TFzcMUljnlwTgNsbJ/sY8Pz3kGxhX7k04JKH0F9aUtxY/Srg8Kr72fWh5nHTU4M7al806Hm5mxH
 vRuI6D9Qv1tbdZ9r+xH3cqPg5tox5cz2Z/w9kcsYCXsnTqA1UvptcSuj3Lolo/Y1FDfK+9mrqSI
 VTtsZpweJYYJsO8upAt60ELRyEmR67iC6D244abMnn1cqonG3LTLqqTvi53hSNqC46rxPPv0BCa
 ViyvALuEroUeLHX5sSxdPSuIZ+VJw09FZO40NaIMviUoLaIj/6J/FH3JbuscL24Je/T9z+cD3UD
 uepWtxt3bZHawx3NeBin0VZ6QksmdKfP3zNiG66EIBHbghWGC6XlJwU60zDWY4D7EhC2u5+fsXR
 94zXaFvYmLm7qlUpBpHHZeYLkiafDg==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6926cb6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SM6BNd7mGtu9OntbbzYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1rC1q1LVF1To_2kHftV-QB8L_-UlLlbC
X-Proofpoint-GUID: 1rC1q1LVF1To_2kHftV-QB8L_-UlLlbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079

ANX7625 can be used as a USB-C controller, handling USB and DP data
streams. Provide minimal Type-C support necessary for ANX7625 to
register the Type-C port device and properly respond to data / power
role events from the Type-C partner.

While ANX7625 provides TCPCI interface, using it would circumvent the
on-chip running firmware. Analogix recommended using the higher-level
interface instead of TCPCI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/Kconfig   |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c | 163 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  21 +++-
 3 files changed, 175 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c2a5da18f6a3cdec53ef5766455e0..f3448b0631fea42e7e7ab10368777a93ce33cee7 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -34,6 +34,7 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on OF
+	depends on TYPEC || !TYPEC
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6f3fdcb6afdb9d785bc4515300676cf3988c5807..a44405db739669dfd2907b0afd41293a7b173035 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -3,6 +3,7 @@
  * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
  *
  */
+#include <linux/cleanup.h>
 #include <linux/gcd.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -15,6 +16,9 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/role.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_graph.h>
@@ -1325,7 +1329,7 @@ static int anx7625_read_hpd_gpio_config_status(struct anx7625_data *ctx)
 static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
-	int ret, val;
+	int ret;
 
 	/* Reset main ocm */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40);
@@ -1339,6 +1343,11 @@ static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
+}
+
+static void anx7625_configure_hpd(struct anx7625_data *ctx)
+{
+	int val;
 
 	/*
 	 * Make sure the HPD GPIO already be configured after OCM release before
@@ -1369,7 +1378,9 @@ static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
 	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
 		return -ENODEV;
 
-	anx7625_disable_pd_protocol(ctx);
+	if (!ctx->typec_port)
+		anx7625_disable_pd_protocol(ctx);
+	anx7625_configure_hpd(ctx);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
 			     anx7625_reg_read(ctx,
@@ -1472,6 +1483,115 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
 }
 
+#if IS_REACHABLE(CONFIG_TYPEC)
+static void anx7625_typec_set_orientation(struct anx7625_data *ctx)
+{
+	u32 val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
+
+	if (val & (CC1_RP | CC1_RD))
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NORMAL);
+	else if (val & (CC2_RP | CC2_RD))
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_REVERSE);
+	else
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NONE);
+}
+
+static void anx7625_typec_isr(struct anx7625_data *ctx,
+			      unsigned int intr_vector,
+			      unsigned int intr_status)
+{
+	if (intr_vector & CC_STATUS)
+		anx7625_typec_set_orientation(ctx);
+	if (intr_vector & DATA_ROLE_STATUS) {
+		usb_role_switch_set_role(ctx->role_sw,
+					 (intr_status & DATA_ROLE_STATUS) ?
+					 USB_ROLE_HOST : USB_ROLE_DEVICE);
+		typec_set_data_role(ctx->typec_port,
+				    (intr_status & DATA_ROLE_STATUS) ?
+				    TYPEC_HOST : TYPEC_DEVICE);
+	}
+	if (intr_vector & VBUS_STATUS)
+		typec_set_pwr_role(ctx->typec_port,
+				   (intr_status & VBUS_STATUS) ?
+				   TYPEC_SOURCE : TYPEC_SINK);
+	if (intr_vector & VCONN_STATUS)
+		typec_set_vconn_role(ctx->typec_port,
+				     (intr_status & VCONN_STATUS) ?
+				     TYPEC_SOURCE : TYPEC_SINK);
+}
+
+static int anx7625_typec_register(struct anx7625_data *ctx)
+{
+	struct typec_capability typec_cap = { };
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+	u32 val;
+	int ret;
+
+	fwnode = device_get_named_child_node(ctx->dev, "connector");
+	if (!fwnode)
+		return 0;
+
+	ret = typec_get_fw_cap(&typec_cap, fwnode);
+	if (ret < 0)
+		return ret;
+
+	typec_cap.revision = 0x0120;
+	typec_cap.pd_revision = 0x0300;
+	typec_cap.usb_capability = USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
+	typec_cap.orientation_aware = true;
+
+	typec_cap.driver_data = ctx;
+
+	ctx->typec_port = typec_register_port(ctx->dev, &typec_cap);
+	if (IS_ERR(ctx->typec_port))
+		return PTR_ERR(ctx->typec_port);
+
+	ctx->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(ctx->role_sw)) {
+		typec_unregister_port(ctx->typec_port);
+		return PTR_ERR(ctx->role_sw);
+	}
+
+	val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
+	anx7625_typec_set_orientation(ctx);
+	usb_role_switch_set_role(ctx->role_sw,
+				 (val & DATA_ROLE_STATUS) ?
+				 USB_ROLE_HOST : USB_ROLE_DEVICE);
+	typec_set_data_role(ctx->typec_port,
+			    (val & DATA_ROLE_STATUS) ?
+			    TYPEC_HOST : TYPEC_DEVICE);
+	typec_set_pwr_role(ctx->typec_port,
+			    (val & VBUS_STATUS) ?
+			    TYPEC_SOURCE : TYPEC_SINK);
+	typec_set_vconn_role(ctx->typec_port,
+			     (val & VCONN_STATUS) ?
+			     TYPEC_SOURCE : TYPEC_SINK);
+
+	return 0;
+}
+
+static void anx7625_typec_unregister(struct anx7625_data *ctx)
+{
+	usb_role_switch_put(ctx->role_sw);
+	typec_unregister_port(ctx->typec_port);
+}
+#else
+static void anx7625_typec_isr(struct anx7625_data *ctx,
+			      unsigned int intr_vector,
+			      unsigned int intr_status)
+{
+}
+
+static int anx7625_typec_register(struct anx7625_data *ctx)
+{
+	return 0;
+}
+
+static void anx7625_typec_unregister(struct anx7625_data *ctx)
+{
+}
+#endif
+
 static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 {
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
@@ -1566,7 +1686,7 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	}
 }
 
-static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
+static int anx7625_intr_status(struct anx7625_data *ctx)
 {
 	int intr_vector, status;
 	struct device *dev = ctx->dev;
@@ -1593,9 +1713,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 		return status;
 	}
 
-	if (!(intr_vector & HPD_STATUS_CHANGE))
-		return -ENOENT;
-
 	status = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
 				  SYSTEM_STSTUS);
 	if (status < 0) {
@@ -1604,6 +1721,12 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x45=%x\n", status);
+
+	anx7625_typec_isr(ctx, intr_vector, status);
+
+	if (!(intr_vector & HPD_STATUS))
+		return -ENOENT;
+
 	dp_hpd_change_handler(ctx, status & HPD_STATUS);
 
 	return 0;
@@ -1622,7 +1745,7 @@ static void anx7625_work_func(struct work_struct *work)
 		return;
 	}
 
-	event = anx7625_hpd_change_detect(ctx);
+	event = anx7625_intr_status(ctx);
 
 	mutex_unlock(&ctx->lock);
 
@@ -2741,11 +2864,29 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	}
 
 	if (!platform->pdata.low_power_mode) {
-		anx7625_disable_pd_protocol(platform);
+		struct fwnode_handle *fwnode;
+
+		fwnode = device_get_named_child_node(dev, "connector");
+		if (fwnode)
+			fwnode_handle_put(fwnode);
+		else
+			anx7625_disable_pd_protocol(platform);
+
+		anx7625_configure_hpd(platform);
+
 		pm_runtime_get_sync(dev);
 		_anx7625_hpd_polling(platform, 5000 * 100);
 	}
 
+	if (platform->pdata.intp_irq)
+		anx7625_reg_write(platform, platform->i2c.rx_p0_client,
+				  INTERFACE_CHANGE_INT_MASK, 0);
+
+	/* After getting runtime handle */
+	ret = anx7625_typec_register(platform);
+	if (ret)
+		goto pm_suspend;
+
 	/* Add work function */
 	if (platform->pdata.intp_irq) {
 		enable_irq(platform->pdata.intp_irq);
@@ -2759,6 +2900,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	return 0;
 
+pm_suspend:
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
@@ -2774,6 +2919,8 @@ static void anx7625_i2c_remove(struct i2c_client *client)
 {
 	struct anx7625_data *platform = i2c_get_clientdata(client);
 
+	anx7625_typec_unregister(platform);
+
 	drm_bridge_remove(&platform->bridge);
 
 	if (platform->pdata.intp_irq)
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index eb5580f1ab2f86b48b6f2df4fa4d6c3be603ad48..f9570cd6d22e55fd70a12c15960714cbb783d059 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -51,9 +51,21 @@
 #define INTR_RECEIVED_MSG BIT(5)
 
 #define SYSTEM_STSTUS 0x45
+#define INTERFACE_CHANGE_INT_MASK 0x43
 #define INTERFACE_CHANGE_INT 0x44
-#define HPD_STATUS_CHANGE 0x80
-#define HPD_STATUS 0x80
+#define VCONN_STATUS	BIT(2)
+#define VBUS_STATUS	BIT(3)
+#define CC_STATUS	BIT(4)
+#define DATA_ROLE_STATUS	BIT(5)
+#define HPD_STATUS	BIT(7)
+
+#define NEW_CC_STATUS 0x46
+#define CC1_RD                  BIT(0)
+#define CC1_RA                  BIT(1)
+#define CC1_RP			(BIT(2) | BIT(3))
+#define CC2_RD                  BIT(4)
+#define CC2_RA                  BIT(5)
+#define CC2_RP			(BIT(6) | BIT(7))
 
 /******** END of I2C Address 0x58 ********/
 
@@ -447,9 +459,14 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct typec_port;
+struct usb_role_switch;
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
+	struct typec_port *typec_port;
+	struct usb_role_switch *role_sw;
 	int hpd_status;
 	int hpd_high_cnt;
 	int dp_en;

-- 
2.47.3


