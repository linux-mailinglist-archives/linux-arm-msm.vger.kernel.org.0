Return-Path: <linux-arm-msm+bounces-70044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40482B2EC20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF3601CC272A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 03:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A392E8DF2;
	Thu, 21 Aug 2025 03:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNhEtQwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182C2E7F13
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747442; cv=none; b=dq3mgd5X7XMP4G5nZfGaiXUMgz3i6X/zj9C+xGCw2FXDBiTum0yP1obqLgINx4xJgrnCF+zZ+wiExsc9TjZC7figPvKnCiJZOqmwkSKTrNK5YJoZcVB/A3i/NBg3YD2JWYTzlFFaVny+6Ejw0OFInI/xQbbcsg79coAseA319vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747442; c=relaxed/simple;
	bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgrFEhdAJAj0nIvRJm2q0r/MiBI5satB9xaUfcXX4gMhKZOUPDeKA8mznJ4GybAy7o6m6KO8WmV2kSWOkbRn1Tl7Q08mA69OMaYoRusZsvZZrN9CZwKe3mXVCvbjmiOG0rL+f5AurMyggd4+ALa8HCw0deejgT8ELkHGl80gWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNhEtQwz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIbtI3025326
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=WNhEtQwzj9cmkG9C
	gKNtR9kKQRmkFRkYW3g5clgGxOYtVJ6MlNpwsM4lCNOtY+s9HUZvCNiC8YXe+LQw
	hulL1XttHEsXP/TEU3oZYBKyXnMNo0eUpikA3Bw47iHS1f0TByHPVjQihfKOXUyy
	7fv+ELIt+zI7eTW870Pfhp5G1ah5l7s7i9G5ekOwahBD7hcGZf4nsKsxHgNMkh4g
	kAs63c7LAD8tT4EvcWvesZc3GXEQzZfJzvIxGHF6j+XoReS9Ix06y/GTVk/knFrn
	hzM0F2XYN8E8YohUPDI3QaB2q/oLYq2FY883gPq9s9Oyb5qzncu1DrTiu/Y+792h
	Hu8R0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52abvbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47173ae6easo974444a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 20:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755747440; x=1756352240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
        b=KcF/Boj0kB+bkNKY8TKMUaO5R7R4F23wtuFTFp62Wt+p69RvGx9rmRaFPJCfxhULBp
         6vh1txD87YWkFnI8YLULv7JxjhocyiiimywlMXxwPoeG46IlJzUTqFywNAkC4lq15UXG
         XuYcwm4lpdOkNnsBTSnSf3eW0Clj6JznwfXbyx9jbfNbdFG+6j/uY4TGNayr/CX2MrR0
         GDc4wNk6PI590BSZuY5oUHgcDsOvIemOteqFXuulEYaFrg5tlOb9TrDwhbcNq4iSS8TD
         FFdi4C1b5GfH/02QSO426GV7/nIerFAs/UsD3rbj52ew/D2MclKvDsubpfD7ijBjp81Y
         k4lA==
X-Gm-Message-State: AOJu0Yzgls1N6ZVeLg3vtX4pJR3xjZXYY5UFpt7lwzIUP7rIwrBHr7aL
	KRP05r8kHNqZr0Mf+6C+rMkIINUD/f+ZTdfD5hsc3lxU45pcjfN3hV0jEyDekRU2PKp5u+jo2mU
	CwGOYGcZykBuhLPZuIikk9KYKiiUxZLEL6hZoGuA8DeLD7YYnVdztjzBhKyX9IeBZDOwT
X-Gm-Gg: ASbGncsZU+RJN7lSmtyaIfHGIdL9E8Tf1q2gnJOpj35LszjSepaVyqbQ9PfJRNMrA+o
	cBX54uZ4Hu60UB5pYlQrWNbpHv+UlQeLOiuut1mRZ5E/2vzDQpAr8RpjQ0P7XdaEGnGByT1Cv2k
	Z+67InkZ1ESLDBSGj+soczd1qDKS2yq51CntJx4bEEoIEwxm/3Y7WPzp1dkegbXwSxWphSGVig2
	Iu0LAJzFcHrJThBR2wNTx9p5sUCAntFLshM5+nBVPYrUXCfkQnE/D46Kkii5XZGHaaZKtgM1KU6
	Sf+fCcJSxBytWf2wgIhzBwZ5od2BEx/Fk7c5hUx8/lB9L05Svr22vN2pmwdi8iE3Wci4fQ8=
X-Received: by 2002:a05:6a20:430b:b0:23d:d5c3:c92f with SMTP id adf61e73a8af0-2433084ab09mr1143138637.7.1755747439750;
        Wed, 20 Aug 2025 20:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tAEO6RQ7A4Yif9M5PGwG6tBqJ9xmZEWW8ipYZf3ykfyR3Cl22ZimZ2XbB0j+wgWpjjPh8g==
X-Received: by 2002:a05:6a20:430b:b0:23d:d5c3:c92f with SMTP id adf61e73a8af0-2433084ab09mr1143101637.7.1755747439294;
        Wed, 20 Aug 2025 20:37:19 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:37:18 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:59 +0800
Subject: [PATCH v8 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-4-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747402; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=PAchjJlEg6YULryzF2qUBVRmkx6B5muCm7v1gdEvjkVwjtgrvuc9yDJpeJiZirjS7AjHchmY/
 XBkDPxjkAr+CIuWlqlw0wdqfS7TFHq6xnd2Ix6GRqyFNzToACWb0cCX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: iKhE76yoLJuxBq_DS-WCsJ8xaS7-Cnmr
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a69470 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: iKhE76yoLJuxBq_DS-WCsJ8xaS7-Cnmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4smLC60G17GT
 p0Ia5iAXXNIqx2YCEsUHwX7+ijUFxJn/gi6n1bGz+Wz0j6mIB1HaQoO078emm9I99T2Ms3dWcSo
 jh9ekVfG5lFE9EVDboRyJnJiGckNGHburGVQSfmbxuEyzeJpPZgPdUh703eYgUIplOx7WalxnXf
 xGn9uHpukchLBFDz3ISp/rWWDkdOg9xzj63opPhVWTXp/k4kjAXzJOFMaNTE0ax9qhtaqgN1aoQ
 NN6p2uvkXZKfwd5Gdo37hsEMmw85+uJOndRYjEhHxJMj0aBx7kVWMZhKavz+K+T8W2YdATBEuP/
 ezZa1d2Q0igo1pLRTzwsZBflPiLtqCTufXV9pez715h303bds1niZ6anSKeOOlVaNxGW7C0Bh6Q
 jl7P27f4cE16RZTdRHKuGENbniV+zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1


