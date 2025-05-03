Return-Path: <linux-arm-msm+bounces-56634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EAAA7F30
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E16289A4171
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFEF1CBEAA;
	Sat,  3 May 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PII76OMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE11C861B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256647; cv=none; b=RT67/IH/R4vLqh+7OjVYW1zyj8F7SwXwGpKY9sWbt93hS4RIBge2KOWQG5py3Q4J0wH06bTp9y1+UYDX+o8Uw5dQSQtXXtsEaGhV3QXI1Lah09QFhrF/CRZsioFs6wbOhTs3GllexTU3k3KgdVFt844bkas2klsGWNhw9jgQCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256647; c=relaxed/simple;
	bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjrjPL3oxU9QIxGSF8uZB4Z+mnxIAfZbVMXFmAOCfPk7rPn1vLBZ2UiRwjCx4iDWxkC+nz8tCy6cydiPZBmSAvSkbAmGVSu/H18lafTeXu5T2JCn96rgr+A15FmHBP2iXLBdQpWaLAxAUnK1dC3lpPn1pxOusU/ivZC5DgdFj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PII76OMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5435H6vd003185
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=PII76OMpfzqp+kNR
	H1KCeXBRHPA+5TinzPfiVnrhHhVIaOZxxdGpww+VpB+smBUJAOAJzR0aDepNjm9D
	mceJ78WSGCONbVNybI0A+tpIkIKWJiNCfhA8Eyxl+lYLl1Hj0w898qgXjJWna90O
	Ei7E6If7gtlrLPgQ6P3NAIFrKH9PBLtp+mJMnNBK8KCDGGWAWr4kyHe1Uq+cogdC
	aVBOEPgXIvvezKFADjdwUmzdufd56K0MvrgshBBqEEqH+KQC/ogXdRympKuOBnyS
	l5yCVm1VkqBElnQV9E61Iw2yZ9YkKJ6Jzf9VORkMtPDgG8ND1fE/6DH97YTGel25
	YmIDag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg5fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so329880385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256644; x=1746861444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
        b=RmRj+Esj6V/fsw5Ens+yCBweNM7ELmlm1UfY1FKscHbFdKh1DApOkO0lljr7+Z0bZv
         tgFydF+7CFHiYfpXXsmhvUb5TYOhVOYloWwwDEHByi4aukltjOgCwGTmgVlJQ61ys+r+
         MjxcxmvSaEg/vRNf7mqx361EVb1KPEZhuXhJZNxAKazkCJrKdOqgMVvcI21EhNx5o7/h
         Br/D1BeFrBYUUQv+V7EuVjQxXQ8kHl1GVNExvYZ+MF+5D5qgUhgNdSNwxNspKJtReJTd
         tz+HtS0eDhC0V5T03OgIFts4cI0GfrcNZNxBw2ATDTRWdIAfOd3MPW7iaisqZLJHB3Uz
         06og==
X-Gm-Message-State: AOJu0YxMWctd/8Ncj09rVDwqJfE2Z8xtPF0oj+8MXiDwInF/xzusLstk
	FQo+cmv/nLpxKecmVCYagzTgHPEl6WLX4ZnkepyAnvXDiHPmX+9M4N7lgRulDObnkWoYM1rp3FF
	puIP4Ln5f40TvaZDsPkhVsp3Jw1nij2fHTzZPfqiLZIdChetW1k+kFoAMwIw/7stF
X-Gm-Gg: ASbGncsh3qcDYLqjCXypqr/qixiU4RS8ob+BUUTM4pzorgYDGELmzv9HGxesKl+Z8LD
	nOXeHARwbm6V3BvcENE5y6m1i2FHQhTz6QESk+ylVLwBB+E0Zb2tpW3d9WOmr8bRDJnCaK/B6C8
	DQf/2TMxb9KzRCDEgGLOql7ndUG9pJTt2zA9DjIy10NG8Iw3DdZMvth4f6lFqP9hbn00meX5BnO
	okdVjX5Kq2pTXUbja+DmyawusXF2XS4rzZj1WWFk1UvpMaVy63UWLLhaK6JaPT4IDLfu4I/8Wud
	Xx/EEJpsz8CeJl57Hjbp5M7u3nHcMo3HXRQJgtvcaHp35l3fvCl3318JMazYe59FmqVSP/38wyV
	XIXrjkCFmhV8bdi92OHni0Vex
X-Received: by 2002:a05:620a:2719:b0:7c5:602f:51fc with SMTP id af79cd13be357-7cae3aeaa91mr21906885a.44.1746256644100;
        Sat, 03 May 2025 00:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEluwg04CbYU6xEoatU5Dt5hvy8rinaHZ4poa8Dn2JpfGWo75ed5T3J4f8eCxRx49nLXCiU0A==
X-Received: by 2002:a05:620a:2719:b0:7c5:602f:51fc with SMTP id af79cd13be357-7cae3aeaa91mr21905085a.44.1746256643689;
        Sat, 03 May 2025 00:17:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:06 +0300
Subject: [PATCH v2 07/11] drm/msm: bail out late_init_minor() if it is not
 a GPU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-7-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLu+17Rco3a06pKI7BQn1ru6TMWWZFqYNazM
 T8uCPw9PJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1Xr5B/kBNDSPeA14VAunste4r6LXFySKrVVlICap/DDhs5VZiXls4VX/FDXWmtBca/BKnyBJRUz
 1w6s7lDSrMLpCY0xMDqEYvtjK/qPBbVqnyKeeKg6KvhKkSxgQ54woLxjwT6KSL06ljTeg4Y5+Nl
 Woj3Gag4JoT9tgaF191rS0idfRiYZ11FwKkZRp9VBKcQr/XEjn+WzSj/DR7+qYlawYV05qUlarX
 /y01lNGpXGDBeOHF+V/dOr1A85LfyVUjpMue+/y8aocy1qpgy4bOAJtsOn0tZth3Kwc2w2KG/yS
 j0GcRhUnIyptOLxXRDH1FHNEu1/WJtLy8b20IEJI36dBRRvb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX4QORBcDCc1LU
 GcVMgrfPIo+TpS6q2SoMByoaMalk1JZBs61vq+9LEco1naukWGR+IpyhDAFU4wjthqAKJ+4eOpR
 C7jToGZDof1txW+CmZ2iuP8JsOHmgkcbIPwjt4NA1EyASF54VOZdzBq1uqMpUy0Zr5HVwgr1VQ8
 qVhyVQrF1dI/JBk/aWf3BArCW929hrwL8lwsZBi6kjQHOkwZdzRWhrtYCjMi/4SAqZDj8LDCJ5G
 C9bDUUcjGU99s4wdVl+8GI6520Yw6bTkrgkgTwHT5pbzwoUYjK1vCiREf6HB0fk2/VXgz6V0ygf
 OZUtgyl9i2Aah2gBgDg4RKgxNRJT73CWQRylwIBsm8PxVSOk9depyFsZaE9ZJr3zTwrtxKv2Cz1
 axRTr2f/sBHZzNQENl1ZS+kq4n/3F59Tn2p+UMSCFcBzSm9gkrLb9lnQT9qdTeihVNX4tRm1
X-Proofpoint-ORIG-GUID: OEKs6_r1bKUa7tE3lW7qKDES7hU5j-w_
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815c305 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: OEKs6_r1bKUa7tE3lW7qKDES7hU5j-w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030061

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5


