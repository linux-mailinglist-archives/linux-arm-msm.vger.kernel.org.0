Return-Path: <linux-arm-msm+bounces-78537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E17C0078C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F7034FCA74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5451F30DEB9;
	Thu, 23 Oct 2025 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKJBMT6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900630DD0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215173; cv=none; b=U5qcWdOoifpnCIdKpqCf/7WR06WzUuTsP8aVDus5p96hcdXpS7O0l4icWP3wBeg9AsJsS3M3SnlMwUuxCJ7FfbUd9YKykgLS1bWcYTN7yBVSY8LXjK3N7/OwnDz86dC1FzMyRAI6gI2k7XM6g5sliXERkNFN1z1J6gFL0u+/Ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215173; c=relaxed/simple;
	bh=a6vR3cZrsa8eEPprG6ADmXlyyk7ZVWqf4VY8FOiCsl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWuXISacFCNIH8yV8X+IyVw3xLIH32q5Rjk3oYr+kvXvFj/goZ2yX81Nd7LGtULjYKo2FMecAZFo62TeJAPQstuYxbDA8l/joVjbMrOKVUmgPv3TKLF7PPUZncRufgLQShMUDkhMJsEdui8o/rfd3dpF7oARaMkoq9lUgVRiXug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKJBMT6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6hMxD014644
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uJLxaLL+Ort
	xu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=; b=XKJBMT6xAo2uHS4evgZL5IbfNTj
	ezCvTOEwCWVCcTOV/Yr9JP6cVVz9eb4curSZ8cmZRD4jTr5Emi1zYfbgJS0zXGR2
	9EtlS8lXSkP43NABtWNPs1NXrlUSd1+eq9UtkE2TH5nniUcFo44tIrTXRQgaIBEb
	V2aAOFjpaE1EOq++HmyAC5e+FkPCbSLev1B2eXmzQfNOw72ZDydF19vzOGjifEOM
	0v4wz2fqqeUvbknVDZLeuuU8phOxtomf/enuKsGtgj3oPGhvmvTnu4QTDKOD+YT1
	COgmFuL1HPGRaxTsfamV42oZcElShEshYx81UyRqhnghO0jk+HVWfgRJfIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0nxm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eb7853480dso22152401cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215169; x=1761819969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJLxaLL+Ortxu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=;
        b=uM6ckrFZErM6O+gqzrKujRih16iRlW9Aj0qo6lNNbt9x+aMDiThv7AY9XAaJj1AAUD
         pj3JX1iq8E/tZWRr3wNQFxdG/pn834dVXSfCdnebfzm6R2dfojCcLvTSO3F39n5BAEP1
         C1Al6iiw4OxyambE8NwoW6uBnoGEjdoxAZonsTgCOA5fjei4WtWTcWbpe8aVvnCUkDH9
         CNAa+H4O8KNkMenDaIrVzLSLTdCj/y+hNAnj/hZoI+Pwdr9BltTlT6hxCttQpQgEg7D+
         yRseekuXGLDEmSwaIu9xx2STYqlsKmNt2Laqc5jS1W6svNSb/GPFHD0r9Fr6rrL4xHaI
         1iNA==
X-Forwarded-Encrypted: i=1; AJvYcCWnoeW8yRB+5mz2qtPlOU/e8o3ELRRJOVCiQYLBhQkuAyBPVLdZlPe9C+/PrdmgxaVv1A8fzCClRvVXXJ1Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXHt28BqVFouJm8SJVdrrUVT0napgk7bdysAI4iLsRBBgO1js
	KXDPldy+vwDgTpbN5PBkM8vyYaQ2jLyPxiiE7A5l+PwNSp1ikn+hLzR3DqNu3LYUeuIGOHykcr+
	FETBUF5OD+o/6unmtbK590JYDtS/ZcF/or7GQC/hcJTsKtTp/tvB6fZYkZR2dg+eVa+08
X-Gm-Gg: ASbGnctE4y5oP2enKIwguoZeyWqRortbz+dYdXTupXeHTIVyjJ/yUZDMvBxHbmhEPke
	SruX7QAx1IpqJEf7Uf1nRhzPpfvlmX2xRUEtAQ+unwhvyM/nkuV976CVsJEsp7sC8Ya5OD2NOV3
	l4t9OPs8rWFhgX4AhRWD8lr5hiVBGbCgSfxUbAqxFuNd82PM6tdDm3obZzShBeXf8vszi78C71C
	SIxjCDI44pffSYsNHFlLg0eooiDzWbXeovSTrC57UEz5gitr/EtYmv7MfdtpJQyoubT4BxaIILw
	UMuJSGHv706poCnTsHarKmGmbvmNarngEgLh3QLK3bdfZiIPaOFeEzkSEriBb8DZGoX4tY3rE/c
	KogKYLpRDbatm
X-Received: by 2002:ac8:5fd6:0:b0:4e8:b739:6b57 with SMTP id d75a77b69052e-4eb5e8f6ce7mr111670851cf.76.1761215168635;
        Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdQ2ceCXA38LuUnWoaDSYqjEa+OiAO91vDbKuaHtr2AOy23jk3nemYpPiGTiDjDGq73yaxw==
X-Received: by 2002:ac8:5fd6:0:b0:4e8:b739:6b57 with SMTP id d75a77b69052e-4eb5e8f6ce7mr111670511cf.76.1761215168116;
        Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 10/20] ASoc: qcom: audioreach: remove unused variables
Date: Thu, 23 Oct 2025 11:24:34 +0100
Message-ID: <20251023102444.88158-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX2bORDlPcMrs8
 YgITsMKin7zSI4BQAjI1Xn5yQPOiZTnI21w6BXTjrs0Rgw1IShTINt24FjPd7JlDYnywO/AhSbs
 0ifUlSFc9QQVgIL+jA9UmfawjNt1X9N0/sefNZ/Vj2crtaf5gBdo50/eRq149RNm18ZOFtvKyWa
 j5LSOk592O6IBucu1lBlT5UifUmo1gnEqe4BYS+g3vewxHfqGCsAyXeaADFkpBJnPWufvqcuFoV
 KJN8Yl/qDurkEMdH3SkOGPDjNr7M8qcIa+WFXtjL8bFgBIz3yQluF2mjTqwHk/exo4nxliVwPkN
 bPdQRubs+BpCkZF85GQvqM2d8JQFAU+Ul2gYVNWw0oEu6j115Laui9Zs+RgPmZWMmtIiSYLiz0X
 eb+dOGxzW0wYnM4sqm851jbzcG22Ww==
X-Proofpoint-ORIG-GUID: DFmLBY0hnYLZrlbhXpBF0ZL8wXqhuhLj
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fa02c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s8dh861zfECFqLDNse4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: DFmLBY0hnYLZrlbhXpBF0ZL8wXqhuhLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

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


