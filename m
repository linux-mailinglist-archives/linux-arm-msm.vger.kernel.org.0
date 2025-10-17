Return-Path: <linux-arm-msm+bounces-77716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A4BE74F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C8C06220A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C142D46DA;
	Fri, 17 Oct 2025 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcFTw8Sg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CD2D2488
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691389; cv=none; b=kb453pKASTW2zZxUQbrJSJyQRN1vUuzc5uZPl/ldhPCurd0/v+D9ddXSjmc89aDUlgfgQ/bp1uCKkf5Cr3g+EM4O1yT2YiUNmjlN+EKdJ3is5o0+wPULnEBtuuS+9HfojsD7fBvbOf6n6dX8r9BuQCD5QeasqFzYnLCRCP8MY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691389; c=relaxed/simple;
	bh=a6vR3cZrsa8eEPprG6ADmXlyyk7ZVWqf4VY8FOiCsl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDV+VzTvzxpGSMALXooheCDik/swLiZhLqZBHAzNzS90nhaGbk8dnT5ATr+eyeOHGC+x/wEbhSTo22AjXcoSYcgr3fAZSw1KsXukKe46JJ8jrc7h2ebocVtWWrx9nGLavUOWWg9Can9mlabQq+B054SwJ0mk+olWek+5t8vNjWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcFTw8Sg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7s0WH009578
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uJLxaLL+Ort
	xu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=; b=mcFTw8SgbydUEAP+OHcucuJo7S8
	gfzn+ouQ2X9GjeKbGSbsZ0Xalt1lrEhKkLbqxYcfu8IXkRKeycXKdLdcnHB0MhIv
	4WGCZbgdoCokMuOx4Xzyycu3Qh9wb82XFe8PvDWoIuGFO/9yk38KyTpj9EqmN5yM
	4P90jlY+XLwQOMhW7d6+1ADr2R/7Gp7dlvO4wsUmsQoUI8zYE4QsEtbyphs+vpwR
	mjTsuKhBO4jnecvMDjWj4zCDNSoarpYRtttLcRp+Gi5o/9LGGO3dGdYMwL2SYbk/
	NKUX069vyZu4ZFTeGyaduldMBQwPgjeXbDvmQTot0sW6HfL2jbwSnqOqDXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbedy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-84a3a7ac082so552269185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691384; x=1761296184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJLxaLL+Ortxu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=;
        b=B0SyVTso0gmWMURgRi4cHH2mXrCdPvRrzXH0KKuvKGhlPC9BSthaowtIzjTegl2ZHp
         wut92A25+o+9NNyVw7XGUfh+fIhiJv0j6YAEnnssFX1lp+jV5kp68QgpH2D4+c1kK94E
         TvhVp8MFZ+ex1FoSWIyd3OcHwK2mqMTZhls/xp72ryQdwWRcG4VImkjtmvPWb7m5AVaM
         IuRLC+Voq6ibchxvZZ19iv/ndREi2ES8pSWmgjgxBLildZtK/KMMubaSbEiKHkxUOsQD
         HtnR0miAd36Vgt9EEJBs8/X0QdS+trv0mj+ygvwuhfZBhgQrb78XhIaaCV10mnHZZmVS
         OAlg==
X-Forwarded-Encrypted: i=1; AJvYcCV5uGGYtZe075KraKHG61neU/L9xCPvfqqd3mDQm4rQr/m9ETRPktOEY7G2m9iS87dIP72yUl363xNZsqaD@vger.kernel.org
X-Gm-Message-State: AOJu0YyaMdXWJbG9B84HEq6yXj4ID0gtWEVIyYEtkoj7SOR0EWoI9gLV
	kabFL/Vx8USeoWQIqcFuNI0XvRp3YKf6EwWe7ae+1mfe/w+8MLurHdfJla2UBTJFxKeLiCJLA96
	hOR0Dd6AxY71Q2RZ34t0nMDQSMDu533052eXNHRkzzyl6ZH8ucpjpPA+UiZqrFBoAEod1qcK69g
	Dw
X-Gm-Gg: ASbGnct+1bizpNp8rb0vMIi8mOUwTAs1AMWLUXovndRDh4V7UvbguqwwfoMyPimwfZm
	QhDokt19+4VLz+IH/KjAVvS1Rcr548S+NtroFRJ+IOl8Zm0/KswsX5hz2Op26/qhDwiN17n+duA
	rIum1FMHiLtPqqHlzClafiS8WHfbb62PSr58BiGpZefZ4nkG4PVCuxIaNysHi4x01BLcqHuixBx
	/gfXevNVHX+DjR+CPN+L8AUyS373qs3UyRfFqVHb4q1MzuAfxH+fQ4dEuJPOWVSbWHTOhF4fsI9
	y9D1sKKshNpUfFUoQV4Cb6+QP45FjTjzqB1HoT3BnlOTlNjAFGVVmXtIt/jWGYKwNGJVNUPWITn
	7MvZoHnc4ZlBW
X-Received: by 2002:a05:622a:244:b0:4e8:846d:a980 with SMTP id d75a77b69052e-4e89d2a387cmr37124601cf.33.1760691383674;
        Fri, 17 Oct 2025 01:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3eUE2elVtUpnZhtWXHz+4MlB+o7mcQ28YYahGYwUYCKw2V2KCoMwky9rkXFdFcShMWPjcVQ==
X-Received: by 2002:a05:622a:244:b0:4e8:846d:a980 with SMTP id d75a77b69052e-4e89d2a387cmr37124471cf.33.1760691383258;
        Fri, 17 Oct 2025 01:56:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 02/12] ASoc: qcom: audioreach: remove unused variables
Date: Fri, 17 Oct 2025 09:52:57 +0100
Message-ID: <20251017085307.4325-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ukug70l1eo1HxFOzBRjXhzqmLVDX2l-L
X-Proofpoint-ORIG-GUID: ukug70l1eo1HxFOzBRjXhzqmLVDX2l-L
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f204b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s8dh861zfECFqLDNse4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX4vHfe/i/jVmP
 9KsxrCR8KWdTPneNITjo4kDnISvHGAlSnaV/SojBNvnDd6KBb4Giq+f7Okxp+x2+xJxlm2V2mVz
 y0sxfqgX5Efed9I3oLkF8r9y8Zb8fT7a3tkqUYZjTCRg6HI+Xmj48XLvFBCIAneQfIoXXTiYYmf
 zM+52SFYf6ZyPG6nJBKvHO408hgK5iaci6W8xNh0vzGO70Qrid2s71uqPI1aSbm96CjJlXZ2dZd
 57omZ3IqgnnGIOGmjFik6RnTl4uq3e4Zonytt6mZhtHvMwGTL0I8Xbvm5KDvkydp2hLubxfXZNw
 jrdp6rvb4kiEI9l/DtSxoxEGSsBoV9lLGoomy15Y0DNX/Bn4rV1I+CL+MGUS1OC5p/V+LtcqSdU
 lmAdLU0qtcAAB8EHghIglIXKlBPAXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

remove unused variables in some of the audioreach functions.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2365424a9b42..0456d4689034 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -612,7 +612,7 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, dl_sz;
+	int ic_sz, ep_sz, fs_sz;
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 	void *p;
@@ -620,9 +620,8 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	ic_sz = APM_DP_INTF_CFG_PSIZE;
 	ep_sz = APM_HW_EP_CFG_PSIZE;
 	fs_sz = APM_FS_CFG_PSIZE;
-	dl_sz = 0;
 
-	payload_size = ic_sz + ep_sz + fs_sz + dl_sz;
+	payload_size = ic_sz + ep_sz + fs_sz;
 
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
@@ -680,7 +679,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, pm_sz, dl_sz;
+	int ic_sz, ep_sz, fs_sz, pm_sz;
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 	void *p;
@@ -689,9 +688,8 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	ep_sz = APM_HW_EP_CFG_PSIZE;
 	fs_sz = APM_FS_CFG_PSIZE;
 	pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
-	dl_sz = 0;
 
-	payload_size = ic_sz + ep_sz + fs_sz + pm_sz + dl_sz;
+	payload_size = ic_sz + ep_sz + fs_sz + pm_sz;
 
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
-- 
2.51.0


