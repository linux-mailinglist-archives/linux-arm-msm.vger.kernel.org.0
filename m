Return-Path: <linux-arm-msm+bounces-63805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7766AF9FA2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99AD07A2281
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A95728D8D8;
	Sat,  5 Jul 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAB/CoFL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CB287272
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709768; cv=none; b=YEectoEZAAoxzit/UHAmuwCtyl1GW5molETZ7hNo34PmzLseMHPhpBDzH/D9DmDBhqL8L1cK9gfJjN0rkvYZZNNRo7dSIBfjSr1HJ5a/iGtNbDKv5D6A1w7hbPadzMcxMcic4TSJ58CwaRlqRqc0z2j14Z1h4kZQbY3EjFmNXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709768; c=relaxed/simple;
	bh=XIiXgEDZnL8PJ3eQttWZTHEBnVzzyPThCHHyJljuuT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXb714C4Uay2HDqwXDxcbG8jrBoXuoWaIYmsg1Iav+Don+FWgg/WkP0kzQMkb85Ucib+pvcIxioJCzm5NLrPZf0Ha+PGndRumc/i3n4K/u702vPI8DNdmhssBzBoS1Gupa6sUo31Hw+7SRlsVItnm5jwFYv+WKZrcVd4HJis+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAB/CoFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652Cgbf029572
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=; b=YAB/CoFLitVr91q9
	t8gW4MzUUZT3k2pRij3Lq9qx5UiYnbIj4UJaw6WIYyHXEDKzx6O3JLqaHMVkWRBU
	+HLzfsfy6dDeZ0nt06PdXXe/imvprwPusD+bFbmxog1fvjn+uizpU8lCOGalNxGV
	FsA0OA2hFZ/OSWSmliq4pYPc/hbx9trlGfcBTeBNySNI6jFmjLqLexVaIUHu8THm
	HyaDcpR11Y93Fm5TlXMW3CZOq+fqf83WvOC9i4DEH5MXfXBn70A7enUGWgt+1cRF
	ISZm5Ye3ICd0KTByhG1zr+OZ05x0w7d6/Id3BSvYNaR3OU1B5c0Im2jiBOUUfFr4
	h76Rrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2agnca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 10:02:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso235688585a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709764; x=1752314564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=;
        b=SR2FoROkFMxF+wk2uuPtQX/FGZ2Bco/5RCOx/hHWswtT0pyvO2j9G3eDrfyhiTwQ1C
         mLwT/VfvFIjE8yHHhMFj1E3+eZ7t3smOyg6XoNA0GigDw/fnRy5uf2QVRFXyH4cOUWJM
         UrSdqX6cRfVhJI72W2fdR2NGkEYjCR28OtGt1yjFHjBQu0OfF036QNBfYPKajMhjZnR6
         hwuojfrHJqA83KaAh8ky6dRNX+e7U9p1uXyJLrIfvej9Iilj/XJRpuWcxz5iU9M3vRNw
         oA3o2ciD0IRXOJt9xGwsT/aUNsWuGRIIJp3lDL9t4MV2a+8O7/UbWkSpYXo3nz2PHdSi
         KRPQ==
X-Gm-Message-State: AOJu0Yy69nW+VtLedBpUFKQVu4g3pHdTvTj+WfThxuDQjhXe1lSEK9fq
	JzpKxf+1tRLYjhZDP0eH5HSb9nRlJtBogElO7fJwVI6WDsVcQfajFnhvp2yAJ7cOrWJUHtcJkAP
	hSKbXmtmuaGhSoN5/J19SYiVUvVd/CMIenfO4bQ9OT0IhJJyhCkifb8oG+v3RpRvJp0oO
X-Gm-Gg: ASbGnct9FKGXaAXjO4Ns7STpoBPnWzlwHzZxhGbe9Oie/7cI2j3dnPzF5I534ZHE+1o
	t/n01cINuDR1wMfpMFaeICK1vsQmCenOUA/cNlIiAy95UDbXhgTtORhdNbpCkhd5txB6/jevn2c
	KCZ83fLtyeNYNbtmCRNUW9xvDLmM2XemoctcQhghzZaufe7BMWhOayRkwu+WN0AUvfDGZDQNcjr
	EfMd15nj5e5vRqZZ/F793MD3UW3S07K80eTRYwKZXyuGZVLf1qb2FKuCqAEyYcDxEpaxaobBiFX
	o6BcERDkvbszw1H3Cgj6tKdPYsW6zwyeyI3Hjv/9YmMNioZDuD1aonuMlVkYuaeJDmMFE3B3jls
	WwAFKwx1K0WoMxB0Zjpwoz18l8AYaIvARagE=
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d5dcc72969mr801361485a.1.1751709764295;
        Sat, 05 Jul 2025 03:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv0Eym8D05HjojYNYR4SygLziFGdpiDeTDYA8jw7CJMhriZM1hrprzTkNV+yf0mwfM/I4UwQ==
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d5dcc72969mr801356585a.1.1751709763744;
        Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:32 +0300
Subject: [PATCH v4 07/10] drm/msm: bail out late_init_minor() if it is not
 a GPU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-7-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XIiXgEDZnL8PJ3eQttWZTHEBnVzzyPThCHHyJljuuT4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0Q9gDCPMLzb/Xt1wh4VNbgJjfW1DZ11X0y
 N1t0bQ6E1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1fiyB/9iqfn2GwxswL1i2AFbwA1sytASAH/5JI9r6acY5FRRYHkGqbSjr2YzJKV/mPLm29gv/bl
 uTx93/t33uoXkKnJ52ekpBCJPFrtT/3I64V2ap2TxBjOil9Nz2yqdeBabjfUB0eYnr7dQNBe6Ob
 39/kUJGf/e8FSOMrJkvOZoO6AePWAO/WCvrz7cr4SdD8mik+rUhlIgLS490RWoJ9wgC2E/p0NI+
 aij9FSpws+I1VLJ6LKEF0V86w2oe6fOW35MoV8j1wgt+D+S+zAbLAvntJsG1vnPdD34F70wb2pf
 z3gC34rrLdTTe4cJPsTBC2ex5t6Z80ecF8l1TV+dWrAanc7H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXyxU+AJCmQPyy
 vLl3rjxjdn40Yftk3J9Rd+OmLYm6ie6WlPZKcfaNbjoFuGMvSx/GKdMbV6or4Y7E/bM2v4pWSVg
 /hRMkG/DwWhYolTLIlsFG3+ql9Z4E8W8UcFvn8dNmX8H7ke5/DZbhunyEJpQ+6GaqfnQH5AWWIb
 IExZoIWNFk+ByJ7z3w54W7S5eRQFcGzeErafexoHPZ9Dxh+jbg2yngYSuPAt9R/+8pNVsOrgLRv
 kgz7uL92IR60n9xfDI0u1mhX3eGTABkQCNzvyUyaf5bklNwSVF/wTaH78E5HzroYy6uLhi9cs+M
 6znn8c5mBtaxcpUX/g9L150FQ9WAbDIGuKXJL0O8SrnW5zMo4Xn/YjAhqV49jdXA6K54Yrhu03B
 GTS4Vnf6zscxzoigus4DvMh/7GYA0KgnvrS3lIGWNzB9+nCfu79BJnTPa3EgRpM2v2OPDIRK
X-Proofpoint-ORIG-GUID: o8EZd-Dr3enGoWYZMeESDox1dt9VBAoJ
X-Proofpoint-GUID: o8EZd-Dr3enGoWYZMeESDox1dt9VBAoJ
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6868f845 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DPw_qTI9PinaUm3vTuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050064

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 4680ccf3e72fa5c31afda5665defe71d1f238dac..bbda865addae2e0ef5bb175bec0ed219cd0d9988 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,11 +325,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
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


