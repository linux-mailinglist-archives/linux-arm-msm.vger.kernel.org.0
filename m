Return-Path: <linux-arm-msm+bounces-56723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7EAA8A33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97E2B1893BCC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627A0154423;
	Mon,  5 May 2025 00:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vra3753X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86141420DD
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404106; cv=none; b=R3zOqZmwRUR2FIdGAhkf1DtFLW8iYuS0M/zB5+OXtKefxCJcZBUFy0GrC9Wd62Sm7RWIZwtEuCV4LYMiAai6RC8nsLXtd2E/OxDFKftjM987mKgZG0xyVIB8cS5PjH21xSZW2BTsY43Pt9nu1wxwreEnvuDJRHP5G67z3PB832E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404106; c=relaxed/simple;
	bh=R3CBP0ibrNJqJlrYI1pzB1aKGKkjPkzW2OV8SkVH8ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ia/UP1rgmTlNBetK+PBA4uft9jH/kF95RDfJDSpiwcTRgrQpxi5goCLFlA2tfXA1RoIM+dkHDVaE7HWVqgikf7DYtWUPX2CknjuievcIRDfEgera0NTYAIl2uF2ty2IrUJLUqOxuH7OrS2OvTDQFB8GB24C1exRWxbJwr+fpSEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vra3753X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544L0dvD022930
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWQo4Z5PDmysZkCoY6xDQm8GNhU23pomDWkcqd41CLs=; b=Vra3753XLpzj9XhG
	rLOCnw+ZFpvaLCo9PQmpjqii9BLcl4fPJP6eJIkYRm4Qd6O7pBeIAeRHfQkmnX2K
	239xwd0UcID43in+N5PcRWnA+4gYf8hyFLeWpC2XLYsg/ftQjk/udiPeyVyqRGh9
	UyIHVXBgRSUoa59ZSXNAWdTiDBQVIc3a8ie+43Xr0TOazFJgnCGKRsYH6mQJVKun
	OEtJx6Lx48Qq0T0GHbmT0M82kW9a5DNN37EZAsTBHKUb3va6vVsbM3Q00PK5xwy4
	1aU+1BQDorWitpwVEsf9cX7cY8weDartyI44uADGL0tteX4PyJbGd9bW5Z9wcib8
	LBw0yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:15:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so445473985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404102; x=1747008902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWQo4Z5PDmysZkCoY6xDQm8GNhU23pomDWkcqd41CLs=;
        b=f8TqSi26FTLeWcO8UjE7Tkc2SRn/4ap0+zzx88MNzov7JlmqFoGoPk3BHFKmTDUIUj
         MGkmXDmpfdiln9BxGiVgTl3Au2Uh6D++VkVHgeKTJG4KuRViZeE9A9faKleZNN/apJmO
         ffnkX6TUw1mRRoV3y3vaw+Hi/mOM3KNO7ejGpE3TqNxL9dZ+olcmcghufp2c1Y34FMJ2
         aA2zoieDGF0CyhYLlgF4tW5ovppiMgNbcU1e9/+5E1ZLQFiN2nYuPutN0Wsd3Z5fECaq
         yPLFJ36EMmnki0baAi2AFRYzOOeDoKbL1bUzVsS8PP8Ikn76kQw8vccYQ2mvN8hi4r4E
         kZvA==
X-Gm-Message-State: AOJu0YzGTG4yhPCRPqjJjAv9mqYig8ZRcjoyQm19wUBDLAc6SXGI3AJi
	kAWaKARmQPO6onrhKw6hB05DTB6RI371eR+669gVn8PZTcsPmFM4RAdefpHaVRrrVKIAig+/RVC
	mUEX9xsy+yZPk6BxbwGKitr17+ZZIIcf3ZQBr1IVp2i/lM+Aos2uwhkZWP9uPau22
X-Gm-Gg: ASbGnctgM5yL5kiC/0ubOb3bQLkUCio6FyJVD+2xZGZXJ3z5dDmk4Ajol99W+xvYbCv
	AQeAZjNS9BPOYNGK5C6BWTiUfiw97/LA3CBv/jIo31cFyELu9IAKr2HcsPiEPyazArgodQp+5Ec
	tI6U7G2Fw4OPo51t3M98ftPSjIDF4b18O7BPu0yYhmmKIhZMvXsOeVAyn6N6PFi1IHDLWrpgTYR
	0YXhG5c7NxgEYxAVUTRbkJ+53zBjGrctqmh3OPbHw67OaMQvOol1A32Ehr6ecODlswWIEE88LFf
	rFU+pESkPKbSLMndKQlK6F8yHmDAzXpEVBiBW9/SI5n8hr1hdHqCgNN32HIvziUYhPONzPbpN+Y
	JASn4YtZAC6LuBw1v0kQ8vPGP
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cae3aa3a7cmr896858485a.27.1746404102523;
        Sun, 04 May 2025 17:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdrC3ycJxwH2BFRg4EiyOh6BromHc5ZkAaskVVGgI4h6Va9/YdT+row9ABNiVdh8lkwLCRUA==
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cae3aa3a7cmr896855485a.27.1746404102179;
        Sun, 04 May 2025 17:15:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:46 +0300
Subject: [PATCH v5 02/13] drm/msm/hdmi: convert clock and regulator arrays
 to const arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-2-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7lUrs50zxWBMH2nsFJkOQKE5+V0if7+ZVLc7E3wO528=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7jjBvGfEJeiKcCCLimLWwORrs1iML3cwOS
 v/PWWa5PVaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1cgSCACoTdcO9lLaa/U2BZvy7Z0dCUC8lk/IbILad1+ifw9OHX/97i8usZKH82EYAQIhmtN/8xZ
 r7N2D2jMw3qQD8XiC6JXCjURIVn2GMhFPrln2fHBzkqGM0YsvPlUG8GjspEtpokQudAAqxGQKiX
 E/tUoubpyVWIZH9XrXMPjzBthY5I7eDgLc7gBPcmf2JF1FSKZ1LQSkd5SmQN7xwyQ4oMmZFJSod
 nZPasXJcwNAqBBoKCNJSvwoW15Odj6hNSGbsrnQlXq5SkKJd7gdZyJZM0mIgfEEs36X8uxvMamz
 B/0kp9bpsiAhwUDA1RD7uzFikxbGam8B4Eo6RfrgQXyXCfil
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX71f+l05at95T
 hy7xYfa5mOxIXti3hvGYdhtOibwnxJ6E3bRMwBs23g2eCVR9tLMOHyzyys9iHH/bW1Ul8dlwO9u
 eL4rj3zNh2nCsnosBl1EBUkV75VUquNhLRxTlaSM5G1nCd9X/ehqJY9tVftrtqHIC1qrp5XoBfz
 V4UfguzyvPS0gcFkfPri1JuAeaQzzsy8LBiImtCtXSIk3ANLgIdN/5lENxHv62DqY/sJSIyhtMY
 umE4htQfwm5d4+0WTrW3/czHStpdNsUeL3OYptOUYHtdRsSrBqYr7tNnhxZ9ZokxONVVHM4YItS
 2OGToLGuKlI27rF3oNX4o7DsYahDsSxP8cZIANiIMvwivM+Z3Pc4vn6fMV38w+lEyAsfI8xhNfQ
 bnXPXQyuxCGmB6wVjy+SXVMF6Gpicx5LH7FSrOE5KTBD3UHOp4xiJGqmxGPAObpsUotST553
X-Proofpoint-ORIG-GUID: -dsPUPC5q8tkxcSlZaLTRc4G2lwiA617
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68180307 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=cMmCfeQhgp6qDJoOuqgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -dsPUPC5q8tkxcSlZaLTRc4G2lwiA617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to the next patches convert 'static const char *'
arrays to 'static const char * const', as required by the checkpatch.pl

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 10 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 248541ff449204c72cd444458dadb9ae4a0a53d1..9e9900882687fa2ae4a734d5cf10b5bae5af2f87 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -224,17 +224,17 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *hpd_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
-static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
+static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
+static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a5f481c39277631b7a19d294b086d6208be26511..381f957b34305494cb4da0b7dccb73b6ac3a1377 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -84,20 +84,20 @@ struct hdmi {
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
 	/* regulators that need to be on for hpd: */
-	const char **hpd_reg_names;
+	const char * const *hpd_reg_names;
 	int hpd_reg_cnt;
 
 	/* regulators that need to be on for screen pwr: */
-	const char **pwr_reg_names;
+	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
+	const char * const *hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 
 	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char **pwr_clk_names;
+	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };
 

-- 
2.39.5


