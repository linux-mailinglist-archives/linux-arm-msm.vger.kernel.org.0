Return-Path: <linux-arm-msm+bounces-79390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8706C1954C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82A6258501B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F129320CAC;
	Wed, 29 Oct 2025 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBqySYDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSPJ3MIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B850328618
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727945; cv=none; b=E2brkF9QXOx+uddqM1jUox2TAqHE7QILJdR30slDrjYVEmawjdrxCwKFMEtOaT4Vg/bWfuapuweACwocs96ZCMaQ5E7W2xt6uWZEMIrhb3QbVTMl9bDjZN9TDRIwPrMEZ6l1JHaIwUIVRHg2tynlA5Tz+4blgUm6ofYdyfKQykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727945; c=relaxed/simple;
	bh=kT0nNkqfwLX+XjzaS7EK/w+Lq2GKCF3A4szZDCXzJMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1qdEYniqVDERiR+t+F7/v63h7cvaloyqDhFUhAryrucfidMyCNX+Hq+lM+F09LPqfpq4NDO1dfsM9+A6yVCQETGuHBhKD9q34NqCT1A5T6xm426+k6edJ+WlOjy8FvvuWiHMSJtufLJAwREzdNVL540EQH/JDeMe4WC9n7bCtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBqySYDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSPJ3MIn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4urQk3764247
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1e9oSMS+d/VCq+PGqeKk2Zb2CCfTMlkGDkQXezm1vKw=; b=CBqySYDJhaZvDH0A
	lrZF9p0C/7Cr/7S4+hc6UIbj1u0GG6AvawcvDdMRddTfj6H9rS58aOFjRjIbPjB3
	ZMWM4eEueHhYvReXdjbWQNXCKBPw5gmBuqwFXua5DS7UX0cKp3G+ugCsgLNtAeX+
	aLhysyHOl2huQMXG2zeTDOk9EE8ZQjk4I/ePAuroUouJA5wlMWNNFVY4iX/dHk3L
	9djCFxdAjULaSIa/m7UDX3unvzDEHlneTMWn/PRj/8pW3oYLw6JbocDEKogK6JvU
	iz3TjFMnsHCQ6UAv1o+rUYEB1mlohYEheeKM2VX7PD/KvILU+9FUTUDkQVp/bWEj
	ootbFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11v6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:52:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a4c63182so206348331cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761727942; x=1762332742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1e9oSMS+d/VCq+PGqeKk2Zb2CCfTMlkGDkQXezm1vKw=;
        b=SSPJ3MInr5gcRgavQC45suagnhTj1ZUOJf96BBSQp97FTk6mfdEX9auPWGREqjAFQw
         /CRNHSYXj+Xtkiw1vo9PP6Omlxjoa2nzb9MpsdkXoMrLVNqAYmVNbUC59o77vJHNhz9e
         4FLJb/uEpPQVqlaE4g7otBCKfi/VkcKhzgoOgb5z1w/+UMctVck3KvtDS6XgwKBH1GfR
         wf0KuUo+OpwppSEZAdr6EK60SOUS31hTvWq7mtUv5tIqWeqw/ttUrVWHpQe+8FzJYFMk
         AP7g7ZCKg37UZ/qNR1Y8/SKcAjGCvZDtE5kudZwVpok1VpfoBphFIIVgsP60hcd2mkuE
         PTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727942; x=1762332742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1e9oSMS+d/VCq+PGqeKk2Zb2CCfTMlkGDkQXezm1vKw=;
        b=uN7aMxFVtHhWvtVgyuH1Hm1qdZ0EEtaTtqfnG5scQs5cLbqgosDH+B80GyzsL3G/pN
         hWyIKxm/k+NWcuCRn5ST8rH8HPSHEdwYbxOsBBkCWvAi7zzr6ssFGiig3bMxp1DH2SRF
         V8ZLXwjisYPxu5IzuAjAalFrlvX633aJT5lHpUmUJieONdp3F2ZiS9sqgcO64iiYvsh0
         iaLGF6OKnPY7qbtKlVJiSDRB/gsUo0FJopz6d3Vm/viBJwQRMOCKve2JjqV1bxILIU1Y
         imK/MDVlmE9W2LmF9JqkZlSk9Z0QM0eYyK0ACTknKBQ2Z7HfeXsjVgsoP8+cHNpd8w/F
         CMoQ==
X-Gm-Message-State: AOJu0Yy1akUP2vUiQA9Kt8hAoMNG25H9uTsmVcOzrr2nu9NOOXgOKXR4
	giRvEta/FV93rVSjpXa6XzRw8CuXpS9AgIhtSQiWrkwXCJ8sTyy0stIK8hQPjVPWLzw82+Nlj22
	zFauQqBEl6xprW7NcHPaM0nl+x/QLOZMvv3mwndW7/Iijku4ujjk+Odcd1NIcM9s9ruLs
X-Gm-Gg: ASbGncsviEmf9p2gPr6pxloTwyPfnE2E3ksvdLpuxVNm+7qpzzDIIuGuuQvPvNSsmPx
	Ft/sZL3xYvI5rgsLYSyEhqVdjMfFHmWvIoRKgsDyJZOsEaNoE3LHCfIJy/9smhZDeY55cz2quVd
	N2KsszXVeJq971moPO/Jyl8k5mghzw9dKl7bsVOexyek8VZN1Sqq86k5qYrxARcVIJQvEcaJUkM
	aCYchthEfGpa4SNvPBnyETIACEE+/OnctdlHHnAvqYYYRMAMtaZDRmRmwOy0xR1SJFOFJg6Vmts
	5Oacnyn5aOu+DYFu+xzE10hEepSNHk+IJm406sbHU4HssOQqbPmZ1voQgPiMKhN60d2kMphLBAZ
	E8WG3mnhuqcz1RJjTXOE844s=
X-Received: by 2002:a05:622a:260d:b0:4ed:1ccb:e617 with SMTP id d75a77b69052e-4ed1ccbe7d2mr2855501cf.6.1761727942305;
        Wed, 29 Oct 2025 01:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhx7ax4/RlPT+IUaI3UXmPttDiy0gzUvlqhRIcryDt0sdvPy/2AnJ4i3HDDVRg6uQM7MD3xQ==
X-Received: by 2002:a05:622a:260d:b0:4ed:1ccb:e617 with SMTP id d75a77b69052e-4ed1ccbe7d2mr2855141cf.6.1761727941812;
        Wed, 29 Oct 2025 01:52:21 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:52:21 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:37 +0800
Subject: [PATCH v13 4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-4-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1133;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kT0nNkqfwLX+XjzaS7EK/w+Lq2GKCF3A4szZDCXzJMM=;
 b=z7KgsgL6QAqNhspcyEXiISLQx3yK4dMx/rLPpvzTlBHiZhv7tB4FcIzHldIVlGllvk5/X+Ibn
 7wQqJO/f0kqBH3aLICgSJ4J+ZrJZHN5Q9FIij8s0r7NDf2uFfNvEmCp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: B1rHTDvDDIEpluwHJN4IL5rYiREo7F8C
X-Proofpoint-ORIG-GUID: B1rHTDvDDIEpluwHJN4IL5rYiREo7F8C
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901d5c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfXwiqrIcxxfqoK
 gV3HXCNvmVTM4EorHWZqIUODHdQ3m6OO3B9FYYr3TvUgVF/wkYEd4kqlPC9xp3zBZGai2bIi8gt
 eiuBVVYImtYpdxgznMt11ZmEzzrxPJMHLwG1/4NcjEWnS3XXR8Kxw3arlEhp3lsmV5v70HNKpmv
 cRnrQ0cEQ1FGiCnYIfuQ80vezd8dG1TIhdieZhFeFuiNbVw6iRJEXtqiFmVeuBVwBwwOYoVujRJ
 jlDULtl4/TELIlwbCqVtZDsejA/ZljwDDNwjWq68SUnj8hvbf08EabRrUrxw3fnCeWwiL3wcECy
 gehm5T4LIYTA0RNBpaK9YVEN6X8DXY4KbnrGy193n26ArrHDF9ArJMRmzhuBX9wrsoUWOvdwbir
 IFa391l93Fa/arkjiIzQF8hChoNXUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 7cca2afb68e3..942fe6c17612 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -249,6 +249,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.43.0


