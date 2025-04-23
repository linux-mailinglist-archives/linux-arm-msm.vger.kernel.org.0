Return-Path: <linux-arm-msm+bounces-55211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9EA99A6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A943BAF22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6993229C321;
	Wed, 23 Apr 2025 21:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnQfSZxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2029B787
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442664; cv=none; b=kmoB6iVGAxrrp8PIGqh/UKbzOjV0ZeZmTlJMyjnwJ+VS5xKf6xfbW8BXNpcra/6KeDNrLT+CtKnxRGWfXgyt7dmQdkoBqm6/iSNgqQGGRe35gTOhT/10ONxH/EiWMRSruDADNneueE9nKoGxjNsC+9qg5FZSYkalYhN4TC4xDsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442664; c=relaxed/simple;
	bh=+oBSBoPhXa+SI/fUdQS1BJUFNFFLkQ3btwtr0n2jg2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaLWQW5D/skoCgrT58imBSx1GfGJnfnXXqchHdRViT4q/HVnWgVmHt3ZiPjaRss7D5+XEsxv98pU0eestefaqGolx3Dh48yuOaOnfTRmefMRZ8Mou0P8j2tdqY29ZaQvVuML+KyMZwRXoXSlMUYB4JoRoPijWLwTFo1MRhiTy3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnQfSZxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAg9J3017343
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=; b=lnQfSZxgM/HXigxB
	xK9OuqSy4rU8tOJacd4Y7x8se/CPTsIkQoJ26PEaIr+UYvy9fgB4/hdkWclnNL/U
	ghsKS6KRascJcojTvJ+lOqZDfwacWVPfZz07yo0j8N+Cb8XxtRcx6sOb5e/OSQyh
	CKKp+2FZ6UsZsyHbN4Vf+BZL5+NqoOW1ndSflB0tz6InZZWNUReiTrLDnkc8UMcs
	GlBgGYdANvzBNqQiefnI+pnMkVURvrvdzqLLizvAgT16/2pGShwz+FiJThw9yULq
	+5pYYcMAedPR9nwlvaUKCxhUsrSXy5VChWztdQsO/RilBrHeRQQ9yX/D/OGuqpa+
	VXHM/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03dkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso43913885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442659; x=1746047459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=;
        b=ebX54zPvaRCPxPrXtkiJOYxkM/K36I4xDSEHs8qeWIPVH5qf05QIBOIrukpY1+txqa
         9qTwIxF3IFqoNYTwT8hqFnTxFhim8R9UzRR/pll5AsxMq2/aAjNY6M1aObKyGtHdbjvj
         xKQWT//PKZN27xndJvXFcUvIl3smWUCuX1mHIRZeOEbJVwbWQn4BJaeub2qimgOqnZWy
         X6SR8WvJkzqpZv5j5FZfFl/puH95xlLDBUX7bleGfmtzSB/O4aj53ZrqrptWbwYd9a1B
         lyVVi2Z+eVHp/T7np+SoiqrtGc+63wMrvAOcTic/FdboWrV576yxa/pJa/ybIffYgLhK
         6D5Q==
X-Gm-Message-State: AOJu0YxUkTsntyCvZsAOANtPDIvwze20wDDPZhyQpJwKcS9cHsl4N/IT
	HQqZeuzG+1U2S7AOKa4JizoivDlDDtnBoktDrW1ndgSuVzYsg8qNme0o9SskPwf/nHO4TmWeCyT
	7LHPRmgR6/7rkoJLJSgARaz7jmPjXUaHsk8hF+ZR3H5cMnmQ/QL/XlNzS2wSgNx8x
X-Gm-Gg: ASbGncuChLuBCbB4rOMOpKh3+T5rukN0ic52WJsW2M1os1/dPzcddjGlgKHvkWLg3Dd
	B4HVEy6777h+z7I7x4rPgW4sUyBYmdnIWD6PxEqIh/PnL5yTjQUwT8WW+uORfmjtNT+J3xY2nn/
	C8dM99HUNvdQH4BSc4fxO8Snr+tBelknOuN5HcfBj/zt7Z3UjL2bW23Wv0q2qdO2Jkf+HUs6Hwu
	nE5AvlnCDd3/eXTsbGovJ/Ey7xVpTsA60zN1zvB4ZfE5DfaZtww7T0/H52FNcCVgHrmYpMGjQdu
	1BLK0MDbZQlZpa0UmTv5Uxb0Va2CMBnWiU1ruaFzVhm6DDkwibE+FsyWXsDDBXlOHp57GQhBEoF
	0pSun4uod36idVgpO5IgT25NU
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id af79cd13be357-7c956f33756mr50591985a.35.1745442659348;
        Wed, 23 Apr 2025 14:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj6ywVyzz7LTrJkvHpxsr9G9arHXs/wv9WiLaahFB+vwKNB4aqPf3qOvnuTxPjxtgHKakUVw==
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id af79cd13be357-7c956f33756mr50588685a.35.1745442658998;
        Wed, 23 Apr 2025 14:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:16 +0300
Subject: [PATCH v2 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-20-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctv7pebZX8R6HIgsPPMTWV8ZnTuEFol68ym
 Gt9euCIW86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1QXYB/4g/IoeKLNQZJl+v4Uyd8xxAlDD+c+En9zi8L7yWLn0PTQJJxH9hbTxO5r9p5mn1eeeBHl
 hFPs6rM1ieQUr6qai6xrm/oQwPzIbcmG14ux2tH/E3V1L5R4Gz8GGDXfPQK9GmqlcBjqrLCtbLX
 OaiAHFoW5ZeelSZi80nsPKml+r2rmR0bO/dSm7ImeGNB0pvTbvPzUL39xBYLPl/MDz2zSWsYPCm
 dbBE5PY26a1q87tmtrrVfNk7/cDDwxXK8VaM1kmDlJ3KUqYfILg8HopWs0z66msUrLKCOzHriHa
 b7WbrevaWJ2RPORPz/5nPCheDPEJTDhvk9feainFErzV8xRJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX4yRZ3l0VVM/6 nmZ+PO8OqQNJB23qOpA4zhjH09wVjapa9kgx49aRtDiaAc72ZseqlwNcEQTKujGlnoDlBY4ds+i sa7FtcHqfjoGoLY1NJB/YnfSyi90X0e1vO8oGMgEJtfJI675kZ8Hz7PFsZGdotPMunA0X75rgNh
 S7RmI5IVrFxC2JYeL182gjM0jm/YudPGsrKRk09BO0udqvwc7Q/8cQok0ecAEaIUJVsZrm/qq5v 7fOhfzZ0VG0mOWU885Jrvc8EBUYD/YTnCC+DQR/d7rycenPfcSFdKSEQ/242s5O5ckGCMDsZh4w fg/0crYOpfaaH0ttW/o9WDuLDYGsv8wzof1AlTV0OjDyEPkWDlOwINwN3MGgBFbI6fEV5yedJQ4
 tPtizh4nh2ELTLL/mW5PJKSKAz9zVbTD9fWXbXdq7y2kSjKGUV9v+zxpqD1w6Zc1ZFOYBPiy
X-Proofpoint-GUID: dNDar8aksE9hmDQEc9SyHUwCi2gpqCTc
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68095764 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dNDar8aksE9hmDQEc9SyHUwCi2gpqCTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9f04c7cd5539c012a9490556a5736d09aa0a10c1..21264184566493ab4e356a4e0c032ee7780cabff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c93213682a5781bbd8ad137152c9be8bb1e6efbe..634b7dc452839f994c948601fe9a09581cb42a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 5da17c288f66f4b7b5fef1550fcc9793f524115e..59e280edcd508c14ee297857a19e9974970566de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index e388900623f0de4a1af10d22a6b9bdf4842e1f40..af0d789c47917e9b712282a542c3d0886313c049 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0f8c24ad346568464206eaaeeb199955788ed505..a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5


