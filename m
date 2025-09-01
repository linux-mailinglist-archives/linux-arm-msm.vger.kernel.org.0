Return-Path: <linux-arm-msm+bounces-71388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83330B3DF46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4987017D965
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBB630F937;
	Mon,  1 Sep 2025 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWAhe3A1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9F30F813
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720711; cv=none; b=NLROA+LAHpvKuIZRWMW1xplyB2B1oNGQuTypNG+/i19mJm0at0/6HDanknRhbs79LTwSTSm44mObl+zd49JmNCXeM0vS3vP76j42M11B4qoKZBaD+mQrSeh7yl7WzxH63+Wk6D+nLeITFv4Oo6pCrb8TEO6lFNt4/4ekm/imr68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720711; c=relaxed/simple;
	bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gj2+13ggeMIQF79rHBwRpVwAmGtB+SxEV8Asvnj2PQLMlLde3Ceh/4AKeasJgJgX5LOjoTD/sSjdOGlrV/LyYH+vlZc2Cv+2hT86PDV4E5tPRUBgX7smYP6fujdg1sF7vrHfZFVt/Cyy5IZ4D/OfqAxV3zcgagc2ntFFn8Y7qUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWAhe3A1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eWpO005092
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=JWAhe3A18RmjzDzZ
	Z0AsmrpBxizSatiAvThVXP2/Wmn3h8IfP14ej9OKyOd4uWbVwYKTGh5K71Gcxg5i
	AquS9r6CT/z5Xvpi8TucNSAOhQS4HOmXa4DUJM5GbQva1hIvLcUAgWBuIszMoZht
	78v8V1nrUwwIq638aGRMtOCjTGDpvcWTlLBZNdz+H2CRa8psa5dxMkivuI9a78sn
	GUs62Gz5jm3Cm4yQeqTUE+5EYEPWHxWlsFeZQK+tqwxwNpQVt97jAyHqh30q0sfn
	uP4PxMkeJ9ZqEX38uWAguaeJe6Bc1yLOlpgMGNuZ3xTsnhLrTIS+EF70mxtNYMTR
	L/1A5Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ecg51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 09:58:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4cf03610fdso4319283a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720708; x=1757325508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
        b=bkW+/yX2AFrHUpBj9rWMhDs1EZrLMGjHOanuFGZ30Ffz6aZAIEMzLDdX4+KAMwJiKw
         TH4cBIpikeUsu3vLDCKFbJ7MwZ3rsKqaCqD+jl7LLr9lCHVBxnka1PYN9B3vkvmJ6TEl
         gi6sEKkk85uVmz7+oDVmL3D7USr+Yo+IyFVYNVIt6r3c5Mw2TXIZ/TJC5HlZwBlSmB7f
         pQIJdzETmL1kM2q1uFiswyqlh64vnKXEXbc2kCAUQ1bFWsveuHGLWKXsQX94xCxJUSwB
         z5zV8mp9H92jwEG+gCC8bLoFNAkO9sRlNmfXGttADUzjYU9kKdiWgrHHlQIgaEWKhzic
         j5aQ==
X-Gm-Message-State: AOJu0YzHXua49WVo/OYwl+3qVbqwvmyuDdYWMd+oLg8A9PRDeLfTJvgn
	6pC5UnzxwE6sig/I31u9L4nr2E2xwHR+XaVL+gwQ/dJYb42l/0FhcmucMz+OKLSQCXvKlGGoq1B
	abYCytq03ybbv/+EBUNea/Z3T2ASa8UoL3kqfaotITU32D3TQm8JeBKxplttTcR8CQ1zj
X-Gm-Gg: ASbGncsBjz3x0d7iYhX2eblTauFr5ouB2BrwrwomxmBEsni0h5PYyVwtkiL7lDTL9zj
	uVVH68rAHVilSC52KsH1KxGTbF+75+sDNCXOmkhC3SfnX/HM77t72HnJ47KZJ1LWOSOLE2SiqGK
	EyQqsA9f9myTmj8OqN9/28PNNK6XNfUHJ6uL/rmYFwBl8P9AI1q6iXX4Lw8xJDfv2ZBkUjiOUV2
	BwGpuKfFM08l4H7cVmfnNe0ky7oMyGCRTYVRKCh3w14YuldJZOgv2JUpsqCDxRIJljjADDQpo/o
	DWYufyivnZuTxsJ3KDbTgfavMF44OQPzTG0hmBVgnM6HsZaSmX4MzKXmnRvZm+hj/Pl/WlM=
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id adf61e73a8af0-243d6dd56acmr9552555637.11.1756720707592;
        Mon, 01 Sep 2025 02:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0MoPFSikRmyDViMrlgzOfYeCyLjAV52qLyprlfZ2BtiAd4BuV9Kdl5fEac8p72y1J2WvtDw==
X-Received: by 2002:a05:6a20:12c7:b0:243:b411:ae53 with SMTP id adf61e73a8af0-243d6dd56acmr9552504637.11.1756720707109;
        Mon, 01 Sep 2025 02:58:27 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:58:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:32 +0800
Subject: [PATCH v10 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-4-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=nK6UeSTKXTGBlXsu+2YyHgK746mWAkfKz4qckJV50Abj9bxG53cDZdJiYOqMQxNf7O3dZGDFd
 9T377LelwR/AzsUUYDWRurQHcDtjXdMspfr4wjyZmrzODmxcjjtqknA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: Ba27SbepwYlO-5AE5Ro_z8NZJommhqSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX2mRBl3dVndqQ
 nX+IqpaTWeI88Z/wPrRXAqoWKSsRmZDGf4MndWIKZYwBs2fCMzrybwXSDBWFRdhBPwZIVHCIWQT
 j76gyWBXjgXJNH7ONy2v0TrA5IiwjqKvXME5XRHecZVlmDN4RyH1WCrCu89Ul+fUTMNpFaCvyfG
 Q7ebAvNHhSoCH1/d8yojLZJWGyeh6OB8MXfeb/1tSFtzmnrvEaNHiPgaeCdDWfEmEargiBrjeS3
 /+I2hDvzKDaSqIXZ8uMcGCT+M28lMIQBKLdwt23bPGWMAdjj4FIFYD4dyMJW3Mkm7AQaD6VyE2T
 6n6VoQm8NItpCESKGMGa4bPoIaMQvl7zbcG1+p5Ttmxmbr/CpzQszdTui2ms1kPSPm2QFDGVAHe
 FoHC3HgO
X-Proofpoint-ORIG-GUID: Ba27SbepwYlO-5AE5Ro_z8NZJommhqSS
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b56e44 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

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


