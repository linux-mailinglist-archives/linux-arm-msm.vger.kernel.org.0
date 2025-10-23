Return-Path: <linux-arm-msm+bounces-78476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA2BFFC8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB8C41A02259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D532EC0AB;
	Thu, 23 Oct 2025 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRJs/DMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C732EA723
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206838; cv=none; b=r4vuZwb4dt8+JHprE4E0iTrEUAZlgqn8BeGo8Qb0ehgCZu78/BOfibMFYUvUWuISRc+9MzzlzsZ3YzVSOjHDSAAGcMDzSPs9RJG2h28RsunQmS6XT9Wdt+2mPCUm0thVFPlicOXVC4YGJhy1IBxI2xCNI70ug8fYAij25tJ4Cas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206838; c=relaxed/simple;
	bh=ClEao7QUrypc5h1ofIg8T8mt6ryQJd4aiFVEJim4yLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FuqyqZ8FHd8bGsGbPXuCuXq5vxpCZfwLklxdiw1SR8ooWRKQygQYksgW9wj31wZbvGFkRJ6XQfDJ1sgxQPSecc8rBwyn8K3BjaDeM0RLaCYbAzJtbh8C7UmCLAMXcKSiINOwVer5p5+t/pvUW3xgaP4HkBLRIoUx55BxDCJMO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRJs/DMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6aooj006818
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KgSVmbG0CXT
	s53n44YyJiTznjurS7MAlfi9QKa58wbE=; b=dRJs/DMe/B2FAT5FnYpZzC1r7CV
	aN0SffoHW5d32GcH4bIL/wb3J87BwN4UA50SLQR4H952UwreSlK6qgScQtXem4Ln
	yWWb3q/jRqVjmdUTTX1ecYy8u7AdW6sOxGt5JD60mYxC/acZTlFIr7mcLIdyCnPf
	sU5oy4jvBxDPPthLj5CtKdbHifxsRXxB9IsW3sXU7nRRuLXQLKRFB2HAAV+Qgss3
	YOSWWxjkSmj49jTSf9bmQRyXChS93sk7m6739DnFn0ylZnOXvpIRQSmvxCMlHccW
	WE61PieIatYguwZjLwJwdUzSvOeCMWET40SCpNcwKdQxlcClju6f8I8gk7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j7fxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78105c10afdso509838b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206834; x=1761811634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgSVmbG0CXTs53n44YyJiTznjurS7MAlfi9QKa58wbE=;
        b=b5sXBUE9KlXxxF1MPoYqzwM711qJvpDhk5r/ExnH7I19L1VGN6QEMXT3sdAfWvlpGL
         OH25hspHZFdAkdz8vjyJ/qs/gghzQJwxlBTola4lz3l4TxsTFenqgLxikUuy49RxzVCr
         4mTHUH0LeH0WydxX5AYomUUzD4x81MNF3yQ4sORuebntofRHRQZv/tAvRlsZ5IgeFxpp
         NiTwssy6GOKn5kKF+1z6Us87ZdHUwTRawxKyyulYdFI1GSAsTmbHo1hPwJDNKz8nlWOK
         82C57rbKXSDflS6czpY75POXyC4gIQ01bC3feG1nE5j55DLu6Il7i37fU+l6q9Ks+W57
         coxQ==
X-Gm-Message-State: AOJu0YwMODG9VqNekbUEfL5YERaJ/cKSXP9SHQsyQatUnvnR01T1vea+
	14DvAF9QD1FqCaeXYonLJiHmrNwZzOF9aJXPeRiuRpuIz2kSWdHCqiJaZQEJPprPMKWovlQ+7MX
	bLiM/EsbsNOWU4OWiZlORVenDiMGSEi9WfY/tQWBA9Y2IDc/m5OxgqadXxddzpQN/l8BN
X-Gm-Gg: ASbGncuAQ1N/vmFJCyV7MjxtPwMExvQYa0H4vrZIQl4I+v3mkzQ8YkUFAvDOl0T80Q9
	gIB3OVvnWkMwFGoBokFJkh5USmppzq+c+uiKJe1PRAptNSlGD9JYkqP+G065XVwFEFedw/XNuNu
	XjYwu0oul+JbYKWtKYP0npuDBsGObgryhWxpsIghqYgHYYXinpypePg2b2tXYuNPZK9snTCPARb
	f1mqq5d8aMMjcuFdfz9gN6PSKtyh3pPxbvBE+2uUJwpk45DuNT1Hor3F5egngdhfk3OThRPUQNT
	iFFEwtMf4T0y4YxL0/Um6EM+T/FXFuNCvfBaQ5BgpmfCLVaH+X3KXBijIzswFFZKLwqmmCyyVL4
	NaYCxH2HO1cPywm5ENXgVj9+Pt545sK9HCIFLZRMb7tws7BOuEA==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id d2e1a72fcca58-7a220ab550bmr33261067b3a.18.1761206834368;
        Thu, 23 Oct 2025 01:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQU6DsEGqLwTWykfWX9a0n5WaLRPXfiL2M9UpRfxSjYlgMKuoDnFRY1LaCZvZ8nIr2wQVy2w==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id d2e1a72fcca58-7a220ab550bmr33261043b3a.18.1761206833922;
        Thu, 23 Oct 2025 01:07:13 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:07:13 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Date: Thu, 23 Oct 2025 16:06:04 +0800
Message-Id: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX9Nd785iwMoAE
 578zIf6JU3p8Et/Hbq2vosSxbYW3oh5ZbRxy1mwo+2OCPncyLPgBIkLdxj+qLT0IhHsHMPn3B0k
 uAXVYHw2vJgCnMpYxjFiLSkfyqyEkTJmABkSakyFt2t9fbzFCD+8XYx/uSIckGhU/q6SRVqpmRB
 b9jnOUYMqsWF79RHqjCSTls1qYMzIl932YQ4PuenRADyi3Mol2Tm8L8LnDeIsChZoK6jjTo7WmM
 DyGBN6wuNSv3fZXseHzypdeQPpxwPXKLW/j2hKQrJ6dHKs40uAI9oai4eaLaPPqCm6pWvXikCtk
 2k8G9hhMkAmE7IeLw6+eSnoLn58FQjduWSZstk5M1q4+7QFOfXSyLEQmLzuys2x0FGAUmRiHBMz
 41MxOOli1LLeB/gahb6Q/M2FuaQwdg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9e233 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=L7xdKIvrZdzy1bmArRUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pSA8Xh6pzZ7y3njCH716rcNiT3fnxM3l
X-Proofpoint-ORIG-GUID: pSA8Xh6pzZ7y3njCH716rcNiT3fnxM3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index d6a37d7e0cc6..7eda16e0c1f9 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
+	ret = regulator_set_voltage(ctx->supplies[0].consumer,
+				    1650000, 1950000);
+	if (ret < 0)
+		return ret;
+
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
-- 
2.34.1


