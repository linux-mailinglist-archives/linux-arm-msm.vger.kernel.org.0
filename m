Return-Path: <linux-arm-msm+bounces-83204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6449C83F49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5ED244E238C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325702D73A9;
	Tue, 25 Nov 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8SXRchO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQNdBXzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F981214A8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058948; cv=none; b=RwlELqGO/N5kb2sXuky/SzI/SQSBNJFCUWQ+h0Wik5XQC1+TmT+yKgoEfk9+OHUkxS+8gm08juP/h5GDzDjbX8vn9P6TRnikRUp1ZtDk8qJK8dPpXRMH2oWrBU/EwEDVWYQ1CQiWLgATlxEQxxgQmlJTQwMlrhmXQYuYMWeeTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058948; c=relaxed/simple;
	bh=WB24QFNmXXWomGiUjxHlvGtx4Nh8ZCf8Vo0oBbEPwS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hk8Qsro1VOzIZjyqZYrt/iOoIi2CmVCPZRcrodooXktSSeDi2TwsW375LkaDAj6aa8SUWqsI2+5+Jkiluz0Ds/R7QHPUu5ZbxaSwuhOTAQXKzo6RN7udUOQom3QeHGWsAHsbvI+eL8lO+XPjJv+7vPPlkhSrd+sI9CFC5o5ECQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8SXRchO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQNdBXzE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2geQ22216814
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YRjpKsqoY99+JF5M3oGMFE
	Bu2vsC0vfO0ibxsB+T3/Q=; b=l8SXRchOnF7TCQ9kqERONX+G5/lFAuL0hV2Zql
	thJufKpP9ueAgi1A7JMVX21KIe7GyPlYdQgAzA81R8wzNk4sks/IYV+3JEu2M+sp
	JVxJfMVEsjQK96f93f5517OmFNr4Uii91jwVhbM+IllVQ5+xaJsITLRnwxZ5hTdY
	iUmu5IQsK7gHXRhBSdHmKs9kDsig5p77z0BRNovGm5Md8MccPyWqk3Wn/wZ+jrJc
	UHTh75Nlnq4z03INALaN37cQVgAlVACKkh/JQt+U7swZi3OAwWT93KD6peaWRDFf
	nzZu/EniSdwOIJ8FpJOYNFV5WwU3zyxUpm4uA5keTNJdrdGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsk6ap9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:22:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-89eb8ee2a79so2570697585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 00:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764058945; x=1764663745; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRjpKsqoY99+JF5M3oGMFEBu2vsC0vfO0ibxsB+T3/Q=;
        b=aQNdBXzESguWZbE/mhryLeSYDGNfTGxNOdQ63QRZ92vyNddTBCsIC5/rUD/TByYOBo
         PgT0IZ+3FEGG45f9B4ZTP+ZWKktja0UALl4bN+kB+yFm3xCmb7aGjXUXv3zhRgbmg3XB
         buCvLkx40GwQxTp0NcDlQiocnDVT+UeYHjQSQ/MiXU5IRK1mrJtoYXltYXFR+29O/5FB
         jHjiIwVeSvKEYBHQOimD9fF+cKLblYNt9RIvCMPV6MZT8cagP0G9x3piO1RPfPywvtjW
         YWKift5J8zCV5I66Gl6Xkd1lr9AbSBie0w8X0Heyy6fWqHP/M8Ui6gL0PiDHZuVIhIrv
         9jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764058945; x=1764663745;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRjpKsqoY99+JF5M3oGMFEBu2vsC0vfO0ibxsB+T3/Q=;
        b=K8pKGbKB+oN0XXfyHibxQjy7oSE6ATAFjps4wl/vqs5Afse8url1EhXg8sMcObL8OY
         FB2FEzfPp1pHB5NykLboTizUg+bu1t8fc3kt2hrreOqZ+dTs7gkBDjQn6saGdanq0F3v
         qs/BDHzx5HslB87cDrf/5RfGXWjQK7aosuCLDArLt78ObbWlY6a+utISB+NZGQ2c+YaS
         OMn+ncH3gkazqZ9381Jp5IV+/lDtS6kJ48Hw7L0Vywe3/XJu+bmX2eAsitdr1l7evAT3
         Z44PVXAvtvU2arUr+1MdGV8U2+Rj1hc5pkTFoi4VQi7pbO0Bc3eaLFoMP1m1Bzg5rYIv
         7NuA==
X-Gm-Message-State: AOJu0YwJJuKUe5THMNEtPYQCsbKMecvCALuuEdMftywh6b4+HFVQpRX2
	6OsoOmdVRu0ZR10AQmyHKhEgN/yPai2X5flYoqm/pJQUw6plR4cZheyYAmEzE0pGpwIbVGNJZAN
	GAVqZNHep+9KTwbZXgUC2bJwn+5QoYTy28uca647TwTyBbhAVXIE1gLatVVIUm1tRbTLa
X-Gm-Gg: ASbGncsNYLhZcjxeAJ/DvLrCh1r+I3bigzS5ZufhGIlJIsDHBslUTkpNitEtqXHP7x8
	wEONvK4usycVemGQn0AlnNZ9D6Bu2EttUH7cVKJRAWAzTUGp5k32YUYtOZJbG1Es+gSJ+te5iuK
	qZH6fUOTX4t2nUio2bIsIleZYD3SX7iVw692cKtp/Lr40R+xGPfROoW+zDyR+n5xTyr/ci6Bf9S
	5u3+EwrHqQSp2MAvhhmrVGCSZQVqO/3r25IrxcFykld10TStyeYubVjshOs12M/XcRII0bKIdO7
	rRV+axdrsWWMP9oT8e2beJwxrEO4bPLc6RvqqYkMZ82qKLTjdxXxLZ8hFUCnKS6aDw4qop4EbS2
	/ak5xxVlLzIKp/QfyKfe9G5lJnfDwZdl+7pTDbVXqjdAX3xxDlU1rC7wXSx/pya6NlIR8Vfgou/
	0=
X-Received: by 2002:a05:620a:44ca:b0:8b2:e4f0:74d2 with SMTP id af79cd13be357-8b33d5e0708mr2088684285a.88.1764058944614;
        Tue, 25 Nov 2025 00:22:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgbw5+t2RFxd5vwgHS2/xP58ds7tCi3xfgDuWhOL9/5kLj/9xSxrzjaWShPdduWP/LVNaZPg==
X-Received: by 2002:a05:620a:44ca:b0:8b2:e4f0:74d2 with SMTP id af79cd13be357-8b33d5e0708mr2088681185a.88.1764058944092;
        Tue, 25 Nov 2025 00:22:24 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d6aab4sm103530771cf.15.2025.11.25.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 00:22:23 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 16:22:12 +0800
Subject: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADNnJWkC/yXM2QrCMBCF4Vcpc20gmS6JfRUpkmWmBuxiUkUof
 XeDvfwPnG+HTClShr7aIdEn5rjMJZpLBf5h55FEDKUBJbZKYSumkPPd280+l1HUlo027Dr2Dsp
 lTcTx++duw9mJXu+ibucIzmYSfpmmuPVVFzTp4gZZ89UwdoxEMnBA5Zy0sjHSotIGhuP4AQ+Z2
 RuqAAAA
X-Change-ID: 20251125-mdss_catalog-3af878fb6fcb
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058938; l=5994;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=T4+veceh43Iz1HC9uB499V8TtofoUBw/GEaYL11J+pk=;
 b=gJUYv20WEI5ukHHHm1d/Hca0uVR3M5CdBme19aSpBo0+vWXjKk2qdxhhWSGVE1YlGSQEUNfa7
 Leti51tE9+XDypwOYKNC0lxZzQfg/JyqJA4B59QQLLKLiFeZRAHXaDz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: M9SG9imaXZTOZqeXKit5sY1Sdug1ikBm
X-Proofpoint-ORIG-GUID: M9SG9imaXZTOZqeXKit5sY1Sdug1ikBm
X-Authority-Analysis: v=2.4 cv=WL5yn3sR c=1 sm=1 tr=0 ts=69256741 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=3SrrOXIG8BVLCHsxiMcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OCBTYWx0ZWRfX4mG61o3o+pyT
 /Lc1uAlrtEaYgo2ogHSbRCYKb+RDI8NSQa5QVdOFjo8/rpO1z7bcVZxMRxCKKFrJhJGzJp2DJZO
 szbBvIRM2+9C+A5w3cSs/hBzUITydr41EGjpAVYvX42IVMkHTLV97scxzpQXM+VGxwgAk47FNef
 H/38gX0DtCxU99c3yMrxK4FycQSakN0F9wz8JyAVf9ukmr1NfkIhoWzbqJ7lIY8k6sqXOffjyr0
 aeTfEVtBFGpAi7LlQk4BYSVXFY607iIC/1TWRCcXQ6kTmbXHtgeWhqHVVSPI6TqXfb3kFAfSwK/
 HBg02MB6CZsIilr9FWSvWuHVYw5DVuJ3+/HTyAp1ErfaJwillNHeL9Gyl9s0sjHd2NpALqk9wR4
 rz3hYXHrslwHA8M6gVruh+5wLTmqyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250068

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Interface type of MST interfaces is currently INTF_NONE. Update this to
INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
dpu_8_4_sa8775p.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This patch was split out from the MST V3 patch series:
https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
---
Changes in v4:
- Splite chagne out from the MST V3 series.
- Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/

Changes in v3:
- Fix through the whole catalog
- Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/

Changes in v2:
- Change the patch order in the series.
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..ea2329f0b5e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -351,7 +351,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c..00fd0c8cc115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -347,7 +347,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -379,7 +379,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..826f65adb18b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -367,7 +367,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251125-mdss_catalog-3af878fb6fcb

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


