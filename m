Return-Path: <linux-arm-msm+bounces-58478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E46ABC3A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A4D16A12E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBFE286D5B;
	Mon, 19 May 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jInHb0HT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191C286D4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670661; cv=none; b=hf2ef6U1qUy8yYhjNlYArizE+7vr+XcrrCkRe4Nh3pUNRYUm3fy90SGISZSe1EakmUESZjM/kihYmedvSW6bZ/8mVGKdLWPlFHBSLRIeawgq0PoDmtdg06O+8q1/0eFZaqXJfjdaYuxeqRsPoFSlkb/BbJgX/tjOBsfqrhgWc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670661; c=relaxed/simple;
	bh=90b5t9G9pFXVJuP5uOK0GL39NWpHYmCtIt4INqXgFi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmKTkgqZw2HEWch9mCif+s0MlU6Q6zVqTrplDEsadTySJFJoX/I8ISb7++Bo301zaiVV/Kq8CdScnpFGrBXnrXzk86RMw2Ct8nqFKnYGj3KIEJTkL9ECf5aby1b3iwqQKNUX6a9xR/xUONHWpTVbTi0Ntv7cfqp2e5wqDLwccJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jInHb0HT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9WqfJ014464
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZL6pOdAVZeGnzG7NNpx0LbhlTqFZLDNnGh7FAtqiAww=; b=jInHb0HTZMjx8/Zl
	4UHKKxYSjXtpKz+UYJcbWPKjk5S54cOD5gX3EDx/Fu5N377loqwThmzZEbHTyX1q
	CREW9euyHpoJ9JpIJ4htHKsJqkfZOB4TejYc/JFdBZfhZAZa+N5/EDtJuirus+mZ
	oOnpjj0rKXRAD6WUOL1hnQWoS3mjkZ2Kb2p/T8QOWc8pCKBpLZvOMOqJ5LjRUiIi
	PcZy1hYSw2iaSLmfm8oNmcQjducsNVkMaqGMV/tLFjde3Yfn56osHYqoldElEqTQ
	tpQ8+eVoah5ysX/bfj03rPQ3w4FiDvju6BgwRFjVhjdoltZagy+fWBDgC7CLOt8l
	+IUPgw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:04:18 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72bc82106cbso5166540a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670658; x=1748275458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL6pOdAVZeGnzG7NNpx0LbhlTqFZLDNnGh7FAtqiAww=;
        b=vY+G+egSYWrMAMYz5USoFhCDP/E7JuB6UVj7aGP0JCXwjimHo/WCn01CMJ/0Oa9IdP
         vDmxXhpwff46eB0TRDca94Mtv+MWXY/4QPB2KDPkYxspCdEAUqZpr4Ocfh/TieJ0aFiM
         H282NfoJrZRS3yX/IPizIvdZl/s56se5zod4UgRYhLBpkZXkTads/jM4iotRdhaW1h41
         o0x+92SMy70GjYQl2tiv/RUjTyXjRdEXy8IQlbfL/C6OFrc+W1BwkZB2nvIVQQw9sBtu
         m9XnqXOV/C2bFqBZNJXk9G8C0NG9JWNt/sWWTd+YsyPN5ABSt0FYR3H1xU4CSPmGwwB3
         bIQw==
X-Gm-Message-State: AOJu0YwNcYxhIgoUP+jV3be5lbe7gEUrIapU+UoXk0PotWdwsXzE/SiW
	MO71BkVluRAAaoivd8Le1pcHKqerIJIFkKQM9j6XI0WI651MXBBgqpfw+exju90v0RBD3kH48vZ
	+u9zqZBynKn4paI4FwcCg8r628EYwOn0+MTJjq1hQ/JWvjIf4mDHYaoij2okVpzKsEy5H
X-Gm-Gg: ASbGncuvzr6DAY+RM/cNc6zAwrlouOZfSw0XUQLvyB9F8MzcmSs7MAxxlodErlnbESn
	JTzwLDkgIil3kLyuELwUg2n4RWoLp7FoSapu9OdYm3XzASvoit4ewQmLXwikXB4HGvong2Nxa+y
	Vh1MboHNRGhn3kWmit6uZsQtV5d7dpMF8+q2S96rZdV9jtc48t6mtssSzojjV6yaYGNrDfbncvi
	UhdJuJrFihWlYymATfrgiOvUhs3rXW5+OOdcnbhXAu+MU9jYuPaCqFXtr3IBP5pMFmyB4KvQFou
	F+dty7D8bakhItlStc9/mTX2UPxg3GjY2JFDbfwDrRlMmxaQ/ewSRGCOqvmk1PgUxvY7qWNPP/q
	p6ijU0rYwxobbSTcWXhGF3SRH
X-Received: by 2002:a05:6808:320e:b0:3f9:c0f6:2163 with SMTP id 5614622812f47-404d86c16c6mr7913473b6e.12.1747670657750;
        Mon, 19 May 2025 09:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa1ZWnT3cVS6hT4TKbEGhN2g/VFNk/7QQ9n5aitrhO9g5kpK7EA/YMf56SoMj8UgFO/O7mOg==
X-Received: by 2002:a05:6808:320e:b0:3f9:c0f6:2163 with SMTP id 5614622812f47-404d86c16c6mr7913447b6e.12.1747670657433;
        Mon, 19 May 2025 09:04:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:03 +0300
Subject: [PATCH v4 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tqlj8LXxDL0ZIrdpMe/CdigZeONJBV+bmLiEA3WJ1VM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z5L3L1i/g8Zfwi4G3+Ez9id9XN6cZNezATw
 J1xPzUBb5OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1SOIB/wOsSbv4nod5wFIVx0MYuyh4+YD73mzWHesXEYz6EJ0waDOX8+0K2nRxE0eqAXKf49vRD7
 MxviScWEIDjyh5+gvn7TWbi/IaYK2BkRj0cLYjKC7D67Bixzv2wjcSPZJU7rrJdxZPeyFeeZ3WX
 AHdCJWQMAHDewwY09GueCWofkbxe5TRNjwLYZ4zQi46qbrnNB8mBvRdCxazSSF6R5+bktr7XiFH
 VJikbMiJLPeReJ2QYHXtJyRxhbnkPZWzCI8nQwUicSxX9ORzf8hoWYERluH+MAy/byylnXqWrWn
 aEnuJlidq6bVFx9QcF1VyTEkIg3ZJcP0cmOy5mkylxhix6qd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b5682 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dnkIiX5BO51rIsNzpWi3P7lf7f-SSCW5
X-Proofpoint-GUID: dnkIiX5BO51rIsNzpWi3P7lf7f-SSCW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX8oeW/rM+tm5x
 4Fl6vakeF2WYUe/dLUhOJtr2Ij3Vb9ETVPdvPn+5ghsr0TLuHSLjy9z8m/8dvb5uacyUn2h99d8
 NvdpdF5kRRWBkWJI+Dmfj03LZg6P03H03JOOR7MATJthVZ9jorD6i/B2nCDm8Bobgdqs+qbZFl9
 YJ7MTdMSNa5+cJfisPx5b3O0015C1L1gsNQY57Pb2kKeRZsyMHMV3wgOGLJpcwUdCSjB93iwQjH
 U0Y11+OBacaANjryQ2DABdMMN3ycFfNRmSlP1VErg5L+SRYCp5hi9jn8cza1VkX6jI3Yvkhu8D4
 GgMVmLuJ1ldTL07i5Dt1mFJmIklw7kdmMhXhrKq1a+fhTAOI0OjusZKDtv5Ns2pnb8T2qLSe+qM
 pgeddsfufSXSdcSVO8q2VxRDLSm45p6NG/o0QL7H5ZjnuxjB4p/SCkMWiPCP9t05Hy2i1TyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 8a618841e3ea89acfe4a42d48319a6c54a1b3495..d35d15b60260037c5c0c369cb061e7759243b6fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -309,8 +309,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5


