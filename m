Return-Path: <linux-arm-msm+bounces-65806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CDBB0B613
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB79116C6C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD50225A37;
	Sun, 20 Jul 2025 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj2VxrdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2521A458
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013883; cv=none; b=WPJ4+dyjQl/Qs+aLajc3jT3k/x6+0Zg9aU8ReZZYjf9ihmvFD7MKyc1k4M5WwaUy0tdDU+vuhxUQHvzK9ZPuaLaZwqcsd+Hfi7ufKQIpGBFCp2xv7A6VJ1HDEM0oY8VG5wE13GqurY5xlk7TT+V28vxnEF49bTNjb+nfQZdzRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013883; c=relaxed/simple;
	bh=yo//VXpe8iX48jIZ0sCMtloy5TgF3OidJukwu7tRn5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUINaS1IuxamIxpu+yfDGR27QVykzhWCHBXMUHSI9PuqKE97roque4eez4OQZ7fxabZn22WYuxA3r0BE0HXz9Nc5zfgWzfgbJe+EhDBJY7JPy0EeQ0l0FJ1wNMTxEpHAXX+oacJ2fSWHAS4wyjstej12vkaYfSthZauuR0lInLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj2VxrdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K7lPgZ007097
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/TScNC6zTNOCvvTMV/4I4HH4gXtKqdB6Thd+WQC9r2s=; b=Cj2VxrdFlmCcBmzi
	rs947vicwhDfLMZSTo9JAa9w+4MBd3BrFjZQTr4vmreMlaShC+zf70VYeqI0Cid5
	lwzdJ3Ab+x5GwT006RnWn+GpVAYysY3WunyD83VRJqNGsnfzUcJ6rQ7ANBFsXRYG
	OtV2GygEK2wd+VCjsCMB3++2IH8qn2y6AeX7KCs1kP+i9Tm9wu0Z1Rw5LF1JHK4v
	x0MN4BS6GWP+RC86A3gLG6RLqBXFxWclCCBqubyMY+a1dChQOFJRoh21r3VaAaK1
	9CjVbOrznBScdMPA1vVdew1uVXxQ6Gm97ehrtYGtQYL6DEu7ICfXUZd8uB5uLmaL
	nFhJ8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045ha5yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:18:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740774348f6so3328393b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013879; x=1753618679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TScNC6zTNOCvvTMV/4I4HH4gXtKqdB6Thd+WQC9r2s=;
        b=btCY6tv0ZW0s8Zt9/S7bAswgrzZ/f7BlO6FzlB48S4OO+jTbwnlHRKuLhvI6BbrI26
         udcO59nLtTc5d+asfeXGO1BAYvgq8I1vf9Kg0SIx4cHbWnp+k2amEbb6hhRjtH5EXef9
         MUUOTdz6jAqCIFVvOF8Mbkk4neXQndQApcrswu2qF2TMEOBxkjiDmc0fqsqnrtMzdbOp
         CiP2aaYhtXSSTvf8Fa4lFkRHh4xLB+YkShn0U7WxfT7O4/xVDlJNkzSWvLY5cXVrTJw7
         F8R0doDIiB6hFHtw6NLgZ7zHLv0NyzHcRcpXzr4b0NZnGJmAtWYmnmEsEOpS4k5qvS6r
         3dow==
X-Gm-Message-State: AOJu0YwgDXa2Qo/w6ITrb2I/6NHZGEofXQJs/jr8d+F0xGwMmV+rVri5
	Tb3ptBz6TmhZLuhwN+pLYm2sO0DEf5mlwjKuS+q5wThdaSsC4wlDamjXzAF9eo+2V1jrewgskN3
	pFs+9eVMyHQ7wFmRwfic9jzZcoNZL98FY0BCMNz7APbvvsPFskqng0V1L0LhzJNgY2S3woEAae3
	Sw
X-Gm-Gg: ASbGnctjUmpFYZoKO2hBJRp55h6Mz5S8mxOIG8EhgdWfR2bNRS0sTI9Ec2EJ45G2HB7
	oUG/DhT4PSOosoE/+i0c1DqVugI+WgxaWcTbwEA3FsTY8QwohWAyAQU0D14fCna43i05O6yq2wh
	nVZEaByaD6jv/fVK6T8i8wK39G2QEhJ3YSSLBMuwcPF2ashLSoh+dKvaZPnmYa6KcViUwPh3OSb
	YCEBu0hJf3eUEZskSP3AeiNPgQssc3Ec0JTNy5KIlaQr2D1A3xDEtlDlTDtGHi2tNsahZ+1cyeV
	toSsfkw1sBwhp+YRx2g7+OF8kVQ7wewdUjME6EG1SNEjrViGDdI4UANk86ope3bC
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-759adede58fmr12676485b3a.21.1753013879230;
        Sun, 20 Jul 2025 05:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7VV3dIbqLv0Bda7KAub7izD7dYBl2htnDCyzsK/RNWmk3X3ufAsjrIqpvrxS5nYqsh01IYQ==
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-759adede58fmr12676431b3a.21.1753013878679;
        Sun, 20 Jul 2025 05:17:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:18 +0530
Subject: [PATCH 17/17] drm/msm/adreno: Relax devfreq tunings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2469;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yo//VXpe8iX48jIZ0sCMtloy5TgF3OidJukwu7tRn5s=;
 b=fgzO+9t43IUEuMn8OKI3RpLpyTPjIfZFm2fuZ7JUwHO5rdQh18cOUA5e0P2EnAGfWjI731t+L
 30I15mVzH/SCXUskrPfsLIAz4Cbxjm7knH19i9nyCmqWi/Y180GA9j5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687cde78 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=A_RMCc231MWr08KmCZIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX01VVjOXoYsKe
 kWIse6qBwTyuWsiziIQ5grGIIpNzNh/EWMbs2eDdyRD22evYb0KLNY4/rewS+d1VFZXTfT7uWuJ
 c2XR6cShDd6/Mb6Whv2JnJRs2RhgMELeVThFvUSNxg9+Bhs1ds/KrYYnd1rXHBpcUR+p/u15Msu
 Hf2MvXryuCg8U16IEbE9bhGREcSUGgGKJrWRMGXoc0HkOJFQN8Owsnf2FKu1hHwVpft2Cw0Elwp
 TsjXEVWLc9/BBWJKoergm5JaNBTxUmbATy4VetrQmch9HV+Mrz0qlrzsKVZ3S3ae8OHzQ9Et/Vv
 kEvHwigqNDZivjCRGW81zKh6iYschGoeT94Ot/apEQ4yEbf4bU4gJr2seSLLUTXciRMQpyPAFZK
 LoSGz+4EaONoOEEKxJrw4T2X4FzaCOMS0z1ufs3pzgcB33q1y5iBUMgxjhQRaZnGZSimABah
X-Proofpoint-GUID: vTFPux6Id_9H0fRvzF5pcjNHDnPDbz1u
X-Proofpoint-ORIG-GUID: vTFPux6Id_9H0fRvzF5pcjNHDnPDbz1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118

Relax the devfreq tunings when IFPC feature is supported because there
is no wakeup latency that we have to hide with aggressive dcvs. This
helps to eliminate the very frequent gpu frequency spikes to FMAX even
with common lightweight workloads like UI scrolling. Some profiling
data from X1E which shows the improvement:

DUT: X1E CRD, 1.25Ghz GPU FMAX, 2880x1800@120Hz, Debian Trixie Gnome
Testcase: WebGL aquarium with Chromium

Current dcvs config:

  +--------+--------------+------------+------+
  | Fishes | GPU Load (%) | Freq (Mhz) | FPS  |
  +--------+--------------+------------+------+
  | 1      | 23           | 300        | 120  |
  | 100    | 29           | 300        | 120  |
  | 500    | 41           | 300        | 120  |
  | 1000   | 45           | 390/550    | 120  |
  | 5000   | 50           | 1250       | 120  |
  | 10000  | 93           | 1250       | 120  |
  | 15000  | 100          | 1250       | 87   |
  +--------+--------------+------------+------+

New dcvs config:

  +--------+--------------+------------+------+
  | Fishes | GPU Load (%) | Freq (Mhz) | FPS  |
  +--------+--------------+------------+------+
  | 1      | 23           | 300        | 120  |
  | 100    | 28           | 300        | 120  |
  | 500    | 42           | 300        | 120  |
  | 1000   | 62           | 300        | 120  |
  | 5000   | 84           | 744        | 120  |
  | 10000  | 93           | 1250       | 120  |
  | 15000  | 100          | 1250       | 87   |
  +--------+--------------+------------+------+

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 53ef2add5047e7d6b6371af949cab36ce8409372..212963a5b8b57597bf5b01ab90893b01fd9c6e76 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -156,6 +156,13 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	priv->gpu_devfreq_config.upthreshold = 50;
 	priv->gpu_devfreq_config.downdifferential = 10;
 
+	/*
+	 * Relax the tunings when IFPC is supported because there is negligible latency in
+	 * switching power state
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		priv->gpu_devfreq_config.upthreshold = 90;
+
 	mutex_init(&df->lock);
 	df->suspended = true;
 

-- 
2.50.1


