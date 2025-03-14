Return-Path: <linux-arm-msm+bounces-51349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0717A608B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 220DF16D9A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA0B154C04;
	Fri, 14 Mar 2025 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGho4CJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24AA14B976
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932004; cv=none; b=Fl1rUblW13jd94C8mGK8kdazg0NV03Qe49rcUzX45A5UxBwPsbdQdbOODJO7N6FEyMPq621NbzkWNzBmqPeJxBDEVM+ace6sT7kPuz0pKSdFJcC/dIzpvFXD2MpsANmWy1K1u6NrVZBFTizMmMpTqFpvANDeyS6XUPucOA2Iwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932004; c=relaxed/simple;
	bh=Dy7B9nXl0EbAUVXNcpgz5sajCgBRVXHbTi7mIRjd1+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYYNjErL7FKAutKcIBiCFLZAVj0/mEYMZrvJW0L5Yecgp/me9fNx+sPCh8ZNQvTwcD3OXUR1UOKUjqBAIoXJiZhi8IP+Ei8xKIrw6Jv4bo3zKRK02u4JG3Y+ZBLKPVA7jWCkDAHTiwqAOmiAqxqCT53Qvku2eAHGtAkZdhalVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGho4CJj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKDApd027573
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugx4av2Bblczqdq51yvv9QisQbSYAgbAPKVnJleCLeo=; b=hGho4CJjr/KOBibe
	eJ1Xw9kydGPqBDQKqEWeGaMLrdgMAKWz57lDF+cQ087DC1YI1y6ch+rNpxNEKTBw
	N2dVr197yQwvbtpTSwKMt5nTGs1h3QWtam42rPI8zG3JJtBI8lM1OaLGr6Z2Yr2C
	bsruOMXffOgob/t0ckIVuTjvA40zVJ5ovpfKvLUEYAkBPAMr7angMMd03pk3rqm2
	8XhzMuVyy64ByEiGrJjINXh2ZkaUTelosfd4TzDxn7gtPA/4kQC61pnbyJV0Nweg
	7/TQXTsN3plrDIGNhbyVA1H4V03T0qKndt0iTIpDhxqWOuAmFXurBtboQxGfs9s3
	cbYPZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67313va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:00:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so38233626d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932000; x=1742536800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugx4av2Bblczqdq51yvv9QisQbSYAgbAPKVnJleCLeo=;
        b=OgLFm2esPt4LVF5kQeKixGlihphp6Iko/dHLJn9B0p7ntvCKWnPiiKd5nxISOx6iOx
         w0S+FPRQ8LQ6zJApXR49z14/n93uMk6uPRB1uItnVrUuzxcIHDrr+IdOU88jr570n53D
         8N5wLMm/FoqxI4Vl8/t2jSDJ8/HTykS9QztpCM7bgyCpYJnVpT5jUoVKCZiKU/WAI3KF
         4FYAJstjy7tPwoOfsTWtuvXOAWeIaKwYz3+BEF9RtyHM0f0q/kBV51uV7MlyBt57hokW
         9PRwiHO8P+l565+WeR0JSqqf/4uxHx+H3Bs6gmmy89KtvIxuRAyTm+wdI1FKWOe+BgCJ
         CwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1hHPD4j+ZHlOh48gOwXxZx4N4kA2S5cuM8TJiP1ThJsmMHwJmDNrqYffIIAYHJtf7FqqTHrBcecUxyA4a@vger.kernel.org
X-Gm-Message-State: AOJu0YzzgNTaEFLVAcu7cJBDbsFhUIiiNyo4u3knEVadqme4S2UZCF6W
	RVBH/jU4H7ziJJCbuKlfsXm66gkbt7nFz2eoq2YcNJxK+jVTL92+vUtb7UtVPRwKejtZfF4ohij
	bIlTq4Pt+522tlxDBP6AoMiLd359WFL15ZggbZ3LwAKDLg/Uf2g0PW6QC8r5b5vdr
X-Gm-Gg: ASbGncscoCwVIjFKW5LXF08ylJQr+v7GCMugbUWQBKOr6v1wkHbyL4kBMTRD3WzgGUs
	Y25+meA2GVHMA1VUZwD7b4R952zCP6pB7eEIXkfIqeziNrfP0usIJrWd5EYa5VpcSjgzg1EqK+/
	YaySkF/BORGDn4xCUIV1iD4+PNtzrDmEgM+EovFj4doXksO7SZGPHygZxJrt+/fYK/2fO8LE3BL
	Tb69/Qtow7uijDq+EH8PLsjQRt5BsbAaVZmsQmFK2w72YTQQeI3G1aL+GAkx91u8HpMG+b7M7Jm
	kz/DySWEpxEK8lFCE+xafQEd4iXj78zFC2LvNj6ODgkW/GRwC3Gs35pOccyR55L1+XnqaliWeG/
	avno9yjd9WQxblwt+0kwxw4EzePXH
X-Received: by 2002:a05:6214:5097:b0:6e2:497f:1ec7 with SMTP id 6a1803df08f44-6eaeaafff86mr13945696d6.41.1741932000435;
        Thu, 13 Mar 2025 23:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzJ3grBfkPGn5evRNuPJKqK/SdPx0yO1Uibhzm1nNT/G7XrRBNiFV4aSukq9DzA4rYPS14pw==
X-Received: by 2002:a05:6214:5097:b0:6e2:497f:1ec7 with SMTP id 6a1803df08f44-6eaeaafff86mr13945486d6.41.1741932000055;
        Thu, 13 Mar 2025 23:00:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88332dsm416136e87.181.2025.03.13.22.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:59:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 07:59:42 +0200
Subject: [PATCH RFC v4 1/6] drm/display: dp: implement new access helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-rework-dpcd-access-v4-1-e86ef6fc6d76@oss.qualcomm.com>
References: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
In-Reply-To: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6708;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QM+eu1I8aF02p2Or2gRwLpTXBfv2/4RXGbOyoJVHkoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08XY76ngDwaa5WbbrdnBPCrij+LYZ6UJ9ScWI
 ZBKCV7VVm+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PF2AAKCRCLPIo+Aiko
 1XWCB/9wWGxU4kR6XthOtq7XncKAUuPSbsaARThdOcFHINweGF7C6Wa2lV6einYdmNCuwSdK+qm
 7fxF0f/No9p3981YbAVJBAW5JWJtkV9YuZUGz2y21/Sn74OKnQovmxFt8V+5SOmTFfpDUQH5xhB
 l+dSgrNXyy7lLq2MeB6Ncl7hsky4L3CnlC9SsU9dY+dMhXKP+6drMiOGNba7G9BVAkQm36yA+yJ
 rAeE4LStO6w/0SzJig17D8rJRhMBFnQYzopZJ2LEld/bI7gHzeLFukCPlCAgB+JpTAkB33rMPi6
 Df94J3JekD1yuiOAz9/B8JBFs/IJhJS6vcGKoxVpSYe2dFJL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c5e1 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=Mcyz43guUpAUgyxYx7EA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 13YrPzFkkfnMjp6CzUwQB-NRzruWeXgr
X-Proofpoint-ORIG-GUID: 13YrPzFkkfnMjp6CzUwQB-NRzruWeXgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140045

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

Implement new set of DPCD access helpers, which ignore partial access,
always return 0 or an error code.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  4 ++
 include/drm/display/drm_dp_helper.h     | 92 ++++++++++++++++++++++++++++++++-
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f49691fc687fee2404b723c73d533f23d..e43a8f4a252dae22eeaae1f4ca94da064303033d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -704,6 +704,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
+ *
+ * In most of the cases you want to use drm_dp_dpcd_read_data() instead.
  */
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size)
@@ -752,6 +754,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_read);
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
+ *
+ * In most of the cases you want to use drm_dp_dpcd_write_data() instead.
  */
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5ae4241959f24e2c1fb581d7c7d770485d603099..21e22289d1caebe616b57a304061b12592ad41ea 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -527,6 +527,64 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size);
 
+/**
+ * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to read
+ * @buffer: buffer to store the register values
+ * @size: number of bytes in @buffer
+ *
+ * Returns zero (0) on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+static inline int drm_dp_dpcd_read_data(struct drm_dp_aux *aux,
+					unsigned int offset,
+					void *buffer, size_t size)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux, offset, buffer, size);
+	if (ret < 0)
+		return ret;
+	if (ret < size)
+		return -EPROTO;
+
+	return 0;
+}
+
+/**
+ * drm_dp_dpcd_write_data() - write a series of bytes to the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to write
+ * @buffer: buffer containing the values to write
+ * @size: number of bytes in @buffer
+ *
+ * Returns zero (0) on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+static inline int drm_dp_dpcd_write_data(struct drm_dp_aux *aux,
+					 unsigned int offset,
+					 void *buffer, size_t size)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_write(aux, offset, buffer, size);
+	if (ret < 0)
+		return ret;
+	if (ret < size)
+		return -EPROTO;
+
+	return 0;
+}
+
 /**
  * drm_dp_dpcd_readb() - read a single byte from the DPCD
  * @aux: DisplayPort AUX channel
@@ -534,7 +592,8 @@ ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
  * @valuep: location where the value of the register will be stored
  *
  * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure.
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_read_byte() instead.
  */
 static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
 					unsigned int offset, u8 *valuep)
@@ -549,7 +608,8 @@ static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
  * @value: value to write to the register
  *
  * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure.
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_write_byte() instead.
  */
 static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 					 unsigned int offset, u8 value)
@@ -557,6 +617,34 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 	return drm_dp_dpcd_write(aux, offset, &value, 1);
 }
 
+/**
+ * drm_dp_dpcd_read_byte() - read a single byte from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to read
+ * @valuep: location where the value of the register will be stored
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_read_byte(struct drm_dp_aux *aux,
+					unsigned int offset, u8 *valuep)
+{
+	return drm_dp_dpcd_read_data(aux, offset, valuep, 1);
+}
+
+/**
+ * drm_dp_dpcd_write_byte() - write a single byte to the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to write
+ * @value: value to write to the register
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
+					 unsigned int offset, u8 value)
+{
+	return drm_dp_dpcd_write_data(aux, offset, &value, 1);
+}
+
 int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 

-- 
2.39.5


