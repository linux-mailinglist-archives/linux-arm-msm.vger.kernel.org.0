Return-Path: <linux-arm-msm+bounces-72642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA0FB499FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173F9446665
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7E329BDBD;
	Mon,  8 Sep 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGDFtKpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0928D8D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359838; cv=none; b=cslsVz+AWAHfFx3qVSNtKsRhBGF9dxvEce758zMXnpCg/UkmftsZysP6f05jqmKTt2Om3KKBbb1IJ3mo2+uugBzQcdTVT++dWcpvqtHV2DtINeb637ygXK7x8MCX552e6yMBlK+YsE3een+Z/OBvNxmH5gsXnFC8BHywxmqbOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359838; c=relaxed/simple;
	bh=8szRE5QCdGMQt09vtMN6WBC0pwSEbtJLad4EnhizIfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPZuA8SPPTr605WXTmppCWBx0W+IZ/B4tLKzSqb6f+5PWYxh7GShE4TrBx8aXnkQjQv2sCJpXS3zgHtkyb8XAMsUpE6vnauA8UwGL3KoNH4ENGopW5RQcUNGrhgfPzAGZ1pzm2IDocQRPzVkFkEo0WPxpfgGbRtFJbJyXaxXlSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGDFtKpv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GKXg6023900
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V9UZtlyyn5h
	KtDyVI3Ro3LMaxycsPRVDyyu4mClJs1Y=; b=QGDFtKpv6a0HoUFcg9gqeuvyZJW
	cyS8PMsj3PXDDusPcXUsanRpU3zy0PxOr85suw73Xa0VXL4TBHAMOOAB45EKtpkJ
	l2mfUhF7ghzr61G6EWsBDyFrOOBdhKelZq84X6gYGBpRJWM/liWW8tWuC+9Axodp
	xUzEzzyfNqapkP3Ye+wjan0aZsiRG8rzGHiMUTg8MCNbLmNi0Xchdbf3KHry5hLz
	33toAxnLcOmE+amDBnlG7+oXtHHtWspWORlX8T+VHK0vqr8pITPIh4Jvoq2Ve+1A
	knwb78y7xBXj4s8Y/W7PogAFFTk4JK3cfslJK6B0YHFCsHmm5XNd6zCVM5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a5n2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:30:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24caf28cce0so116829525ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757359835; x=1757964635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9UZtlyyn5hKtDyVI3Ro3LMaxycsPRVDyyu4mClJs1Y=;
        b=n5r7yUfwZgrFnx5rY9wGlaF9LvF6G3rX3S6PB9AjinBCG24UuyM+yedkWJ/Zc4oknX
         h7GpMPkGIvIkAsbj9DMd+QHbPs8fhS4/X4RyZH3lLWxc/+SbXRl/oMJMVNSA/WBIvId0
         4WwCC2/GX2UBjFaevIsP8rlVqPMs3DDUT4lTYPfGoGSG71vVu7vXq7C/o5HASCBDJjKs
         jk9icKLnbWFjWlLFgJi/OWwYNB5/e2LBv5fekkMgS0aKce0PDJd22k+e5Hw+EP5X78VM
         YmQhF27i5jY7B6RewTC7HmZJ8UheQHFQFqEFZv66aR9P2jybBOFLfV6MTzDctZbVMRpi
         Xa3w==
X-Forwarded-Encrypted: i=1; AJvYcCW9sBBCeGTLSsSdU0FNYQZH5UpXHm+fTiL2LHh26Yt8+sMcPtArkdboa3AtnoezxK/Qh0CXsyMXJwt9+Mzu@vger.kernel.org
X-Gm-Message-State: AOJu0YxCo25CwMFCBas8inwOb2Ro3prKLiwP9LAhRcGRPe623EAV1jkh
	OuHYW4mkTD4YXYnbbpsZz1KLrRZgVMNMOXr3kp+k980hdxhcSf6Ipf+Oo2Bikk+jAxch3OVxwLh
	VFP6NRpoEqJocXBL8iaZzxc83BmSJpX4eHZHcIk4A2m5HVDGi5oUEUlx6JRP/WRRqg5k2
X-Gm-Gg: ASbGncvGOg69aVFzauCNn7N454B+4IVBcTWrA8QaqzPFPDkn5tEKOx7WXt2wO51ajpO
	oF8gW8Q7vE75eHPAK7Kt1SoyqF8t/lDsZ2jSmGQZIIJneR5UDOibaVH2Kqqqv1Zvnde9iXi0l1z
	T3HWnxyzUix0YneyP81+241j6MYeGMp6DZ/N67QDtoXgxhp5gHcfZBahD2NMs3ZCw+19RGQJk10
	80HzjoBQsfQkWMGuQxE4xQu2qmaEPXPvtnscFHwYlT8+U9gV0C1wnJsUae5nEgt9jU75PwArIZj
	9zLMzSdah5eTCixO7pt2LwRa7eVKczScoIflFiKkTaReBvu63V8=
X-Received: by 2002:a17:902:f68a:b0:24c:be1f:c1f3 with SMTP id d9443c01a7336-251736ded57mr130795905ad.35.1757359835079;
        Mon, 08 Sep 2025 12:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp6yo1Uy7RBj42hLfgm+tadYfLbQIubWtzG/4AK1CsZzs6I6GYEqVGCGj4HBQRVCJizgZa2Q==
X-Received: by 2002:a17:902:f68a:b0:24c:be1f:c1f3 with SMTP id d9443c01a7336-251736ded57mr130795565ad.35.1757359834632;
        Mon, 08 Sep 2025 12:30:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c829d9114sm156524285ad.57.2025.09.08.12.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:30:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE an array
Date: Mon,  8 Sep 2025 12:30:06 -0700
Message-ID: <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bf2edc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=TOpUcsStXtwAwhZrRvYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0BNoHUsU0SKOp_yhNYJ9WyR2hf5d9bFk
X-Proofpoint-ORIG-GUID: 0BNoHUsU0SKOp_yhNYJ9WyR2hf5d9bFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxeaHn789g2fd
 G/5IuByg3uw3plJ5RkCi4vBnOjoZ/bEbs25r3g56JjSBI39yc3L4VaA9QdeLZfOBXa0KCLdhvxr
 kjSjNK/HSdlhfHJz2bQfrDjsniyoTAMEOFOuSoGI/bQ/VXS4PBt+GpBmZ/hYR84gAn5aENfcFT9
 6R08KqRwIAOV4kwDz7Z5gRGg1OqTEPIHbWF55Hub9ENQAbPIskUfUnH6QRpgMNaQTxjWTgSg2NK
 4VmeAxmtYQGHlGqEhvEVpOLoHeDoL70r3fSlIpCGNUhpBGrEimahZMMwZ41vufGe7DfSi/rYbQU
 Sd63acwR0eHKe/m08ioFFTfm238Gsppm6qr3vm62JTnEjFxF3wWdn7cBaFt/h+44xwPiceL8YVI
 qIynipd+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

Synced from mesa commit 77c42c1a5752 ("freedreno/registers: Make
TPL1_BICUBIC_WEIGHTS_TABLE an array").

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 10 +++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 10 +++++-----
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 18 +++++++-----------
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index a2d587e1a4f5..44df6410bce1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1355,11 +1355,11 @@ DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
 
 /* Applicable for X185, A750 */
 static const u32 a750_ifpc_reglist_regs[] = {
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2f68394d6c3b..a45c3917ae9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1337,14 +1337,14 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Set weights for bicubic filtering */
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
 			0x3fe05ff4);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 			0x3fa0ebee);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 			0x3f5193ed);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
 			0x3f0243f0);
 	}
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 86fab2750ba7..28d4e7149a5c 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -3296,17 +3296,13 @@ by a particular renderpass/blit.
 	</reg32>
 	<reg32 offset="0xb605" name="TPL1_UNKNOWN_B605" low="0" high="7" type="uint" variants="A6XX" usage="cmd"/> <!-- always 0x0 or 0x44 ? -->
 
-	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A6XX"/>
-
-	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<array offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="5" variants="A6XX">
+		<reg32 offset="0" name="REG" low="0" high="29"/>
+	</array>
+
+	<array offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="5" variants="A7XX">
+		<reg32 offset="0" name="REG" low="0" high="29" usage="cmd"/>
+	</array>
 
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12" variants="A6XX"/>
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="18" variants="A7XX"/>
-- 
2.51.0


