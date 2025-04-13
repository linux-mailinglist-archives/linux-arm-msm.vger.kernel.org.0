Return-Path: <linux-arm-msm+bounces-54132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D69A87297
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 18:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441EB188F894
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 16:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141C11F03C8;
	Sun, 13 Apr 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiR5Iqnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C91EF38B
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561998; cv=none; b=shPPq1IUvtpf0L8MjyI43bYKzbbLpxF2yCbdMXG9lTmAM5a+Qc5uyfoNLN2MRHd+8VWZiUfN8OdLvbqax5Fu8C7p9HRtDNMBSZ3iCGMvbWZh5w5Lb4bi/LpmAG3st7t4JQToNrgValeGwVHDXqfzeTloM2fVb38jz7NdzxSFe9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561998; c=relaxed/simple;
	bh=UxZvo7l110r3KAnUQgRno9j/OlNY5H8wua2pwV5trbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHQzDMjX5VncWHSAAPzXsc+LJG7Mw9mPPS+4JVXZ4FVu3ZKRtv6TiiynEL/tLTk/XZ61NPDt/1iKk+dLUpvmxyhOhqT0wrMlr+YxeSnOa0myCOzorEqxXILEE6Ua709EUk9JnRr+gw+XE4RDJtsx33C9xstzMV60ALYr3sn4Nmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiR5Iqnr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DEo2FB014727
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuPtyiVA/6cDpd/3zUk6BEemR8NUNNneHIkaqSQq2J0=; b=PiR5IqnrLE8GkzVh
	leLIWJOVWAMj9xbBptdAgpAeoDjGe/RY/gbCXlakS6o6Q79/3nkz+MRJL8CJ8zGU
	K9h+RRJwGEYJmIahZkDiu1b8i6bDpfixCfxNrM6MMn/ceTNAGq5p5R63AuUcXsuM
	4O0WKPOkTdnXO0lyzIj9zSvzhoH05iZtcYPEQJlkeJWh77X2EQ3pxuMr0yBhIXYK
	Cp9HtWDK/8GNHuhGUyriDbfStyyphUSJQZSJEJTCp2yne0tGVhTBQZyiuO/Bws02
	5dWphJa3JZ5y9JNLUC1XzJL/xWMsrOJ+luUQ/0FPto7NFSIhgd5o/4WxLlmo+nj9
	StHs9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6acyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so631450985a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 09:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561993; x=1745166793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuPtyiVA/6cDpd/3zUk6BEemR8NUNNneHIkaqSQq2J0=;
        b=Qz39B1Be/bpioPtOwrhs4/NfAfqO/dLU7yo3dDZmsxMNP8zoQNThMt4hRqK2H3Pr0E
         koKNTwROPwm+bbtBgdc8FK25XIF2gPr1bhDAgbTGsRN4Gb+Yo6SIciNZpk1hN1S6I0A6
         NTc7rjL0mUUZVzw7baHvIloRfyyjWatHlUn2aP+jrJh/c5W+jWh6zuWjhCfZIo+ArVr0
         YboSYS7kbsMPe/XdMH6Zvec9lDU7oWwCYT/Qf8hB2sBh1xwe9W7qevccvAly2QBhK8SU
         /xtSNmeiQv7cA8TPwvymAH24Vq3ccWqTW+l7dXIe6JFFCqvmXlFJjsU2cJ3SOeAHmpXM
         7BUQ==
X-Gm-Message-State: AOJu0Yx+tTz0sIuAx7srpUYrMd8RxEzuzEXGd4qxC5IasL8HJgaIvJPN
	a2d+54EFtxipsaVZdzIcqHj31Dqup9qIWY6qqguEfIxDNzIzcU9GouCe6asgGkMSSZFe7mIfLtC
	ky/Lng+1WbOPQXhGpGXGCqhbssgz/V8p5M5LSemYI2t6Y7iFtYCe2zyx9TK7dYv4o
X-Gm-Gg: ASbGncsbtcj3NYlrTIheeqz7lkT4jn3PzTh9siA/rnEMOv2p9N9NlWH07tJzgRrYiQ9
	DvEq/G16LuXX5w7cCmoa5kTT2OL/XipGZV7zmvQJ3DsHAz4XHqoHO1vQjAZhSaL2cYeq4TkQR1j
	8kNPfKzrK6oxePwzYL7txZ9tpaXIEQwFIG2eqXPmnX4e1Cp+qgQxhlBdXvkEcJU09lzbuYO0Rgy
	TbNne5DaMngdCdsPgrdcvq8cozIXRbcnXhkMAefpKuHmjZoli3/l4067i2TCEIt1V+gN92I6FvW
	1Vs/4XO9fsmlstskbzIybrClK1TBmHI1ZJ6NyHQNUtHMxERgfBrzX9jTw0DKAJxi1VrFbXwabAI
	gS4g5ooz1sk7pZMweeLZ3EWZB
X-Received: by 2002:a05:620a:d95:b0:7c7:bb7d:f67e with SMTP id af79cd13be357-7c7bb7df6aemr452649785a.47.1744561993002;
        Sun, 13 Apr 2025 09:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNR98aAElfqPa6OLOXpEvJVnVaQhTH6M3IfGzuZCausW3DOq5IxfSdRHR7UVjslmBN9V5SZg==
X-Received: by 2002:a05:620a:d95:b0:7c7:bb7d:f67e with SMTP id af79cd13be357-7c7bb7df6aemr452645385a.47.1744561992502;
        Sun, 13 Apr 2025 09:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:33:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:33:01 +0300
Subject: [PATCH 7/7] drm/msm: enable separate binding of GPU and display
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-7-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5275;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UxZvo7l110r3KAnUQgRno9j/OlNY5H8wua2pwV5trbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c6xk595/qU6lqR7+MBkfXinWGfnTdtvf7QO
 3tAT79FMAOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOgAKCRCLPIo+Aiko
 1aq3B/4gWDn1BXiVN2x3dkE3F5IM9H0YEoSpl84TFh02x2sgfiV8VNcKO29VxJMloosHzJbbvP/
 WWoZozD7+u9t0wAiqHodnse1EjYNEWoBEikmgL8yL9GBw/YQtPNEvPQwWWC7HXx2LNanoz6AIiY
 YbgaYJd/SE/8zAoMUZHNpvnU+WwG/U70ervTpqTO60q6ak+P+KYwRO0BVR+tZUpYLlKQlpqYfBv
 bvyCueCeCPIO7vr500Jytr6lpeqkusGM2+1uk4rTn+eqEV0RtWPne4a/8ldct0y3dbT4YX+W6yi
 sAATZrCx4ZAPtf8WExh7bR26I08rfRjfUK3cxQ2xHPLPJS4F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: D2io1CDpMfmtiHkfGh5cREVkDTTA5Kwg
X-Proofpoint-GUID: D2io1CDpMfmtiHkfGh5cREVkDTTA5Kwg
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fbe74a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=d3EbUlffPpwbv2rupc8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130126

There are cases when we want to have separate DRM devices for GPU and
display pipelines.
One example is development, when it is beneficial to be able to bind the
GPU driver separately, without the display pipeline (and without the
hacks adding "amd,imageon" to the compatible string).
Another example is some of Qualcomm platforms, which have two MDSS
units, but only one GPU. With current approach it is next to impossible
to support this usecase properly, while separate binding allows users to
have three DRM devices: two for MDSS units and a single headless GPU.

Add kernel param msm.separate_gpu_drm, which if set to true forces
creation of separate display and GPU DRM devices. Mesa supports this
setup by using the kmsro wrapper.

The param is disabled by default, in order to be able to test userspace
for the compatibility issues. Simple clients are able to handle this
setup automatically.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c              | 49 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  2 ++
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 325cb710ea08ac8e5c3d9c80c8d8e18e1946e994..2322a3301a5226c4e2590344e4744934addeea33 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -243,7 +243,8 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e5c1124d45fa146c91caaad39a39fb9d21e5f5f3..4502425d0a62e1efaca5b987fa5b657dc0a4e927 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,9 +59,18 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+static bool separate_gpu_drm;
+MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+module_param(separate_gpu_drm, bool, 0400);
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+bool msm_gpu_no_components(void)
+{
+	return separate_gpu_drm;
+}
+
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -898,6 +907,32 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_ATOMIC |
+				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
+				DRIVER_SYNCOBJ,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.dumb_create        = msm_gem_dumb_create,
+	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	MSM_FBDEV_DRIVER_OPS,
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm-kms",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 static const struct drm_driver msm_gpu_driver = {
 	.driver_features    = DRIVER_GEM |
 				DRIVER_RENDER |
@@ -1044,7 +1079,11 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver, NULL);
+	return msm_drm_init(dev,
+			    msm_gpu_no_components() ?
+				    &msm_kms_driver :
+				    &msm_driver,
+			    NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
@@ -1080,9 +1119,11 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	ret = add_gpu_components(master_dev, &match);
-	if (ret)
-		return ret;
+	if (!msm_gpu_no_components()) {
+		ret = add_gpu_components(master_dev, &match);
+		if (ret)
+			return ret;
+	}
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 78c4f0ca689cc93b8dba3fae061a92923e3115a5..73dd90cf4f17ae1b9e29d4309eed74393a99d6db 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -569,4 +569,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
+bool msm_gpu_no_components(void);
+
 #endif /* __MSM_DRV_H__ */

-- 
2.39.5


