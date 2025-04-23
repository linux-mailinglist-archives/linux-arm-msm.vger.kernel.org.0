Return-Path: <linux-arm-msm+bounces-55195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A128A99A0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C48F25A429E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A682128468B;
	Wed, 23 Apr 2025 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNDHNM6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3050327FD75
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442621; cv=none; b=pcNlD0Nu8QWLzhN0KzHEn0NeJYP+A4Zo3ch+hZdC8l0bRDIe2NucwrH0fNZuSuPq8hSPwAixQGo7JoIxth1cEP6NVn2E1yNutz9hBVALby9rdxLj5yHCmpFvl8vW3b7NkvT5JFwbRDs2LLfLkb8VjVP+v0W5Ozi8s6QLwr6U9Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442621; c=relaxed/simple;
	bh=e5RFSzWCSGoqvoTAM8ZdpnqVn8jIYnUbmNjrRPWxMFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fE4joKhGOBCAtSMVM+urkwtt+mLUF00fTNtpaLfkypQ1Y3PgZa+W8kxv0Zqb3EBUF+76L2joKUqq4CBrO/OSDxwS7KXQ0xdXNOByvgc0RPdiU8qhP+PeKR4CnP6iHIsHsNhTVIljTCZgdEZXnVowuSO+TFywbicjt9rTidZyw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNDHNM6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApPZb020408
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=; b=eNDHNM6+9WJEUQLL
	P2DTjnamaO8f7mcaoiVLnGovumC8hrx5b0+VcGyZMZwNVqgFL589EyDEmm/aL6pt
	hFvPfKrxO/fzmLIwR9Wv1a87CZiqO10Z/ogWM5n/2v1RSFPEOpp5dnx4YNaIr8VI
	FPNfyc4Bfny5653P6Ee9YFkp5fPZSbnKJZbh1l0lCWMB3q1eBBCZC0QkZbUYc/4h
	90EJcO41wJt2fQgb1hYNZF1dAawwUPvk2SyBJ9kmoasb0fUbJIIsFvljnPoWmAWf
	OmmzvHsxd/zUuxUwPlpuU+5LuZsW0NiCHtRgOoidhEWn5I7nvYkyzq3vEysNsaEI
	w/jaBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh23dwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f99a9524so8308676d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442618; x=1746047418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=;
        b=MZbAHZG1Kyk8P8xGRK2LfD7iIfkFRKySMMnh5mSodvn3uTiKTVdT9zUTGWXrjSMgh5
         2BPW8uIxt0dvx2Q3QlumG1o1MnJfKUndXT71Zu4LcrYJkxwEAKj/4iNgzP/EOEZXrqOa
         oeSpGRMYdeUZvKp5gV0A3qmIzqBizmbapbKndeU2CYMYIAkMmF/tZRTqfl6fbHVUPu3l
         LfXG9dcXi9XU9HLIy+NiAf6EsvHFI6QQxpO9/L3psGFy5uFmebZVc0usu6s+Iw09v0k0
         VBDUMcYoZ8m+iddSHYR7pbsYLwhavs3482zDY17fbB91jJDqS1jFBIpwx/oq/Y5fNhP4
         y/ag==
X-Gm-Message-State: AOJu0Yz853xpDtxsRsF903jiGdUegsWs/FIDN5+D3IkWD14E4/lBo2mG
	cA3DyPDtpd1eZ7QAhUxSkP4HkkzApXM8eVl3QkQf5Bwx0pzK/oYFhdnK77mgSTaKiFftAAx/dHm
	tyKk60g/SO2Oxr6uECibKaGpkMxrEw5hn89BdAxGCpBgZSG2Tsbst4E2gTIxqGWXZ
X-Gm-Gg: ASbGnctJejHfrfHf4kx/jkOcCe8y5IvR8zHnp/pciMsk10r6Gb9MMY6om/GwwDZkPtp
	tOK7g+Y07VeIxe7fDgIn9M/4JUmuyfP0tVY7scneakIvd9IqtbW5x7Uij6AQ9UEzLZkriaf2ZoM
	YukA6iLXjllRgR0krRTNK4ssX5mV2qIrN19iXZ/e4ySVTvBuef7Ii3+/mi4dUtRpztgZEVEFS2z
	WlI9lMiw8V4WPv878IQnbzNvSKJr3vy3f1oJnjG18LBj0cNxenWneWKdSc01s/CN9rkv77wi2Pz
	yg7LvjG4Hx4GNm5nFMgbVsC3cwuNo/5V6Qny8t8Z1UidBmF2Obr/uAeBDnHWh+xdWfbMtmh0QOH
	/3OnOcLBb8mdO0KoHYopcokP7
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id 6a1803df08f44-6f4bfc9677emr2898606d6.41.1745442617990;
        Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdN8j3WxVtC4umEdxXTXJ5CwdHR5VLabTb7DZpOIhVSxnxjki9ZdAxSPM6E0yzlSTACN9uGA==
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id 6a1803df08f44-6f4bfc9677emr2898126d6.41.1745442617513;
        Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:00 +0300
Subject: [PATCH v2 04/33] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-4-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuNb5wrJr2VbZ3pd+aopnix4TOpr1KLyK1dm40YaLo
 TjxYH0nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbC68/+V1bWfIVXc9pcFg+L
 DTGGD1+m+nowevZq3BG/rC/IsLS48/BzL7V+afY2xgXJ6l/Eqx8HX9nG4Tttgu7h5teiAbXHZyT
 H9XJIZi6O5+CTk89dvcjUMbTmid6K7xOMFq/U2PGgpMW8cWZWRajNKweWTqHfsy/qHFBxUvz5gF
 122px79fff+FlM0cor/fxhW/Oxa6sVzebOtuEx+6vWLJgntcFpXZ43b8qc7X8lnkw74naxoXB9n
 laH98IN75Z9PMrqVntY/Tzrzyf/IhdoG138tORHz5/qaCXPU8eOBwftvqIuLPBb7de6nNSXrzd3
 mtbPbJYyrW++JcXGmhcmX+7pvWqF6uSmmrsaSorP334CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6809573b cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZWE-uveMqgElGuoec8ctOvQIy1VIPu-x
X-Proofpoint-ORIG-GUID: ZWE-uveMqgElGuoec8ctOvQIy1VIPu-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfX3QB7/WRUayuj ZgmIkVSPYNNDkCfE23tG2wGPx86VBz21d7osPvoKX4N+9qMIJzXn2NPBi3RTpeu/EgFIRRz2MB4 R0PSXI/tBL9S10tFwte+OEZ8ijgZYwYfO5cN3DmyeQc8HrZeyvxO85qfc1v9KIlVXejovLm1nw2
 tmADGPdoK15aSlCUZ5pT71poSQc9JyT388oQCiANYPHi3CxrvDZt0UZ2HqJk+ytKRU1gwMEmAvZ eMfa6ia6GsTbivD495C0hYrv7U6lfDU6xzgvKRWYOsLE6SX9wVBlctHaQjLyuDXDSrXvolZmfl5 IIDH+Pts3+SODvaBAhhap2lt6G4Q8hKpjwiBdEKwrT7sMMUSJROf59rs82d2/lgBMdfae+lBFJH
 Pds/Pd8I4sYPqHXzIm4WCacJEkewCBrr0R0KMYtpGunMqto29fp32OiX/HcSwPs/BuD/mo1/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5


