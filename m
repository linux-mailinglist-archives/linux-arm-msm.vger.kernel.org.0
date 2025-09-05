Return-Path: <linux-arm-msm+bounces-72316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B36B45BE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BEB617CFDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0D6302151;
	Fri,  5 Sep 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7TAX/B8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924431B81E
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084736; cv=none; b=QqbnEMzLgJGBJBGMQN8xNabBlwRu2EwIF5Gt3eAlj7hy7USuS3KIK7Jc+wzsoY0MDDReWP6cZ1oC2216V72khqsBlMx6linNpyTrQQOvev2cU9p8+SfmU2CGlYSfv3xe022XcQM8J6v1rgnymC/i/yU5F9euynsalusmZnQqLlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084736; c=relaxed/simple;
	bh=u65y2jSDRLaSgr2s4XMiseR1rskbbKzZS6Ts4b/elFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mxlRaUvBy7RyyRcpWeiIMdn3N+3eiilA7gmYzn23l+WLRIkWAA/W9uOkgQ27bPhgWoj7TM26BrWbt3FfQljwZoHxT2OC5byBCPUqr1ba1f8stCkWBswdROEqzrRbD2NE3hAreBNVvITJCIVYRiK9r/0TRnJwlOSSnN+ivz0HAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7TAX/B8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856WgTd032203
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ln4QrHvRmvl
	Sj7VRoWV0fWCKQ+IjhQYN87ftM4Mr5ZQ=; b=f7TAX/B8rTXwsoc1S9Z/ygzk6Bs
	+XUSbGPFp6Ni3ax/u21rOusfDLgn66DM4elHq9EZj39wNzHzsudKmy/qLIFvfB8U
	5GpBbJuh/paJS9E2wE+G88FvdIY85UjwOIZFfx82oY1L8mmanN0f2Ok0BKvpnsPw
	eU8KtKKdIorvHZTc3m2ZkREnHcWJsQcbMOQTmY2HhJVGIY68Aw6FWdHbzg2GXRYZ
	WAk94UNBIlneT4dYQq8nNJJS3mZt3H1tsy1qSXhOCXw3xtoHl5bu/LtJAroBhaYD
	9SyW7h00x3vXtiUrF02ORanA2AycAEArrcMl3e7U/FeaY1M5xeFztDZNdOw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkn1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:05:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329b750757aso2005682a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084732; x=1757689532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln4QrHvRmvlSj7VRoWV0fWCKQ+IjhQYN87ftM4Mr5ZQ=;
        b=ofZRgG/QMaHP7sUfMq0fmqa4gNeqazvK1eme5g5QiJIGbaNyYndnqmL9fKCTyZtAYy
         zExOCCHEU/FoJZNLN5KJtVdzN+3hdYgn1ylgNSqtoMpYNEOEmzD4UJ8Vbk6Lbm8gqRZm
         J8qmcf7VCqm/saMSqqu05ClMFqR9vUkA7sd3MeERo8o9Zu49ia8WhJvqANs0e3zs4Flw
         ivXgIxQ2E9IEdqfdbMf7g25ChqDUbJDVhahq6TTAuhgfjGTmcKcFmwkffefB/50dXQbU
         Z2VnmJ68QIWOMCIeduOkuRoXDpX/FNGQuYIfSWzQFl/I0XHqSy0XG1ruIVk23sHY1znD
         s/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUkjXkTmzX18iIZvEnydga7+pcxwQN+9dQpFTuCn0ejiItL2wvVWi5urbSer/uYc41QkaOgh4nO9Fg7hgYi@vger.kernel.org
X-Gm-Message-State: AOJu0YzYbNaNp9RN5ZNfOyDbc/xFrmczFP3yraq0rIALPNOSV/eRosX0
	ps5o7IP0YF/tLqvH6nJz6ou9K5Vp5M6FL3VxTzJ4LcxSEPmLB4FVJtSwtQKcoFw8znG0BYYkMZX
	6KwmkhozAh7bwxZJgx/H+4bi+//AjSurUqDunKZOYOp7/vHLtBbcGFQcCXZ/UxIXb170Z
X-Gm-Gg: ASbGncuHZ8jEJYXWGT+7wzY/IJXhNYerBVcDgPrqlNep5URXrv1136DIBYrp+WRi3Hz
	WCVg1S49rXl2fcOvykob2Z1AszQq9SCJIs93pY0XYBsitX0ywDKpp13aw0maq2+GPWQiqsH6/P5
	Itjg+pw/NuHViZwUWicHtaHJgW+CfBdTJXGTEU2Is6bEDAE8mH8zupCRQ506H6UgzG/6wGhyZIu
	fXB2UAKWLg2eHQ6dkKmEqd5Wucsy0PtbVlPii7BW1nOaZK/tuFYHnbOOPYDT0p/+KpmJii94xCY
	FvNUrscF0x4/dkfZPVq9uVoHKI5y2NxUN04P7E6kSDrjPmvNUOys/j0l+V6rH1RiULuUbbiVjmc
	5
X-Received: by 2002:a17:90a:d40c:b0:32b:e42d:649f with SMTP id 98e67ed59e1d1-32be42d656emr1455910a91.4.1757084732311;
        Fri, 05 Sep 2025 08:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDmM3rGXxEcUOcvGJH9jngE6DgxXhxZQFlWg53KST+M+4unP4or4/YJLIttQc0R5ta/Pf+0Q==
X-Received: by 2002:a17:90a:d40c:b0:32b:e42d:649f with SMTP id 98e67ed59e1d1-32be42d656emr1455857a91.4.1757084731777;
        Fri, 05 Sep 2025 08:05:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/3] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Fri,  5 Sep 2025 20:34:43 +0530
Message-Id: <20250905150445.2596140-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E7UE4Mm4xuUdAy_WPehfyTfpIW_BafeF
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bafc3e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: E7UE4Mm4xuUdAy_WPehfyTfpIW_BafeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX8+tA1eKd9apH
 shcJn38MJjyiSDaXd1sBoBkMnDimpinKDUDRChX17P826whV8dfwhk7mxKaL9Yp4cuVdbCfEoj0
 z4IsoVv51Yo3g1kKMz30ipacf5oQnf2boi/9Rk6sptY7e13wDEAaTaz1qHuspruVM0PBjz+bra0
 zpGK9poWyFTEnafLDjzNLO25ah0rjRozUlnusV+wN3vBb3viIi9yEIu2tQwdOaCSK52NMMIAsQd
 Qa/Fwn6sDl5p9sucNLbAEcFBL0Ib0VNrnhkzguKhWwcTX/AQF6v/wBUxqzHjgUVlR0ALACLU2DX
 +PcCxnoXT87aW/SuNsjHnHwTA8NXhqZqE7BSMvzwf5GEt/MxwZ6nGoZx5P7HySuJMXwgnlirLyo
 HipnE7Wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Cc: <stable@vger.kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index bbfd51db8797..be21d5f6af8a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
 	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
 
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
-- 
2.34.1


