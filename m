Return-Path: <linux-arm-msm+bounces-70703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 148CDB34387
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1FA217DBF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B7B30102A;
	Mon, 25 Aug 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Np8PC2BL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546882FCC01
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131524; cv=none; b=a1Cf4SBtogiuwmo/6P9o2I5Dcsnap5Cpd2jFmuMU4p6L0UUW/808PGiX8ULuPHbMJF4LO/ekPSvSCYwAmArk0szhW8qeTpR9EBj0svh2w9p7yd100T/LnQQLEJYRC1Lp1thUg4xlxuRzexCpTqGhDOAUVYxilzS7pNpm9OadKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131524; c=relaxed/simple;
	bh=SJd7zqzn9uJ8BDxi9ue2v5LFpDXj/HJUWad3ABllklk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkClIj6ICduYV1tqqhjb6Dyaqxs/fg1Z2NRMLXraIwV1nkPeVj6T0JwaJlpjv6nhjTeAdBoqDCopCqFEAJBxUq+ifJqDoWuiVxce6Kz0cuIpJxjtq+obDz9gaKIJvBxyWpMEz/2CVvHaJ+vJRKB6RNBERkmhsIA/L8/WGhwDCds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Np8PC2BL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8bTsC028657
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2yrIKVtSgCYOAK2wm3ompeqK3ltVqzQASfDY9soWxg=; b=Np8PC2BLCVYephNs
	qV4IlpbJc3c+dR2/fQEQZCPlWA7CaTOYoForXBC0Hu0I7Vzi/lgZ2vqplFic804N
	eFs/LLT8ziQLznkxnCTNGlv/6CWxSeVaJzbdULVet1ITrfSvAztzi6UZAlUyPnc/
	Nz5sckNlLn1cQ6lzH83QO11HLp9ifmuGhq8IjDk7lN5k4uN8ftbvEIx//GwUZCeT
	KuqgBdIz0jDCw2gg/HkzIK+JdRVrJm34AAVsvC6xTSZFHmjfQDaoLTSRYJc9Zihu
	hbbMGLce6rhyMW/O2qNgvKBHFDyCfuxLbKWVnoU86NXMCc4ZDsMSTyZLejUNvDsM
	SA3Y7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771b23c0a6bso1835372b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131522; x=1756736322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2yrIKVtSgCYOAK2wm3ompeqK3ltVqzQASfDY9soWxg=;
        b=khM2pINSkMEuV7EVOFI0VtTyRL2ZxlXm+QzP9caaTHvIPTFNf+11eiYiQVrBeJZVBU
         hVnOLeosKAoE80w//xQEJBo9gsBFoIhfPC7HW379J1AFcLHWBY1ilX8NCnKbxXa3eLXs
         u7YXyEKt2Bq8nIg9lGhBORLoa/HuqJc1melZz+uyEDoq5c45eR3UEOMmDdPDjJlR9ByV
         zCXaH0nNdv7fdYglxJTm8JHyp7WpMDDmIZSy88TgFNktsDpDzQeBkFDWJCsFMC3k8h50
         17fqOugNBW+/gZDFY71NXPi184PA03jxjzoj6G2qqQy+nEnTDZ+PUKJVLUpTOVVrkw96
         3qWw==
X-Gm-Message-State: AOJu0YxjyqHPr5y5RuViH42HVhwoo3OCvuGPZvIKQq/OSXfHdxVClPNS
	7uDH6IKjYM4IBHjF7UlSo0ui59xASjWE3Nh+uRZHjaWt72LuVGiwjbAtrNgOc54Re++K8op2cOo
	3pZA1XOV87KfFbK/hOt1/UgitZc+tDEDWLKxJ/CdqvzB7N3wy7bS8g5/a/6cZj8Ylvtl9
X-Gm-Gg: ASbGncuPxHAQ5y79KC2VtUv6uJQ6kF3ZtD4gwnKgvyl9d5C72Dfk5sA2ZsiGKECvVN5
	hN55HJiLwYARGOmlu6JD2VJqXZtZlUCLVV3hIr3EyovClnBOyyRu00qpAOeTmUEtAJnjFWS7wU1
	+kuzR1HqpmuPeDCTpRc6R1Q4cD2PKzHTkLAE3BEX/UQhgCYsv3NI6xdUqQIHESTD0JtPyURGMkh
	GLGxd3LdlIobn0yDHuSNj/WDi7VRz/cIFh3y5D1tGw1TH/pS7V8NkJC4/bkiuXSkqHCX0OZkBnr
	wyAqKW+wdymoBnhx0VaXBAklsvyQysjTJl8tj7ALuXvTxZ3cBulcHBreH/UrrMu0FPJ4k4k=
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7702fa09144mr15470404b3a.3.1756131521572;
        Mon, 25 Aug 2025 07:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdSOkRTXVNCTQDFfDc5W6vzuFdTII0EdHm/SKbunuThNTE+6ampSQ99nwTQsw8BnknCh8P9Q==
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7702fa09144mr15470371b3a.3.1756131521078;
        Mon, 25 Aug 2025 07:18:41 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:40 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:08 +0800
Subject: [PATCH v3 22/38] drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL
 for MST use cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=2648;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=PrNjVGA2xHmx5gJIf7BbEQxTGZtpIGlEvLtwzJXOzsM=;
 b=plNGlZvN1wDw5lAaf+a7NON7sJMcGsC0y4yvNqCKHVHUDe4MumXutSydFBwEx12wozakyGBj4
 y65jmFlRYDOCnF6o4Dv23+z8iPBH/fRA0xjNqtFZmKHCOqIzLx0IAKC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfXz5LVHUSdOaFT
 MSDOZ51n+EdljHIBlyF7C4P6LsDHfhbMiq0g/wei39hviPZzRx/AA7g+AawgTIZ59DvdW5U6XjV
 HWzE/85aWJsJCJ7U5hn9cZbHgd1jI4sn+bQaSN5QkziSfYrxs0EbwalsKHGtV7PXVD0NoAgk7gY
 bl4tCys3gd1lqRE3+BUwJSa0DO/XQwAlbHPX33M8USHkJorcIlmReCmmUex0+jNMpXwt2A8d6O0
 wY040oZfQJmEtZng4xma7jwqpDhtrQiCYJbeSmoIbmy6ag0dJuAVqNIjjWznEGfJlEzLMJzFLPv
 +2s59bxHMgUOOyJCXdb6cqgw1sqSG7qbamLCroGYvz351Fj+OaJuRNAaxP11UP4FrBlHuDyLZet
 2idUNcfT
X-Proofpoint-ORIG-GUID: xapXExg-etH_6gu9WEwEeVgEWdL5-sqz
X-Proofpoint-GUID: xapXExg-etH_6gu9WEwEeVgEWdL5-sqz
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HaeL3RsyjvW3zFWBFcMA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. This patch ensures
the register is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 58e8c526253f77f306c669d474bdb2d1751b49a5..9f8733da78cea20593b4fd4d4a07583fd17d316b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -693,6 +693,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
 	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(msm_dp_panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f792687c315a2c8203305a20b7290a93b0d791f4..f58cf38a47a119790f86b40ee86d45a3ffbd951f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -694,6 +694,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_display_mode *drm_mode;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index cb5bf6c99a6f7a68995f0f0ac48382dc90beca31..715ffc739ac4bec4d41bf4176a04d6651e81bbd4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -74,6 +74,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @lane_rate: link rate requested by the sink

-- 
2.34.1


