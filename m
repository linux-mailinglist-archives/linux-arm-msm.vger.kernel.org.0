Return-Path: <linux-arm-msm+bounces-72652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39641B49A3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220011B21B06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29792D2386;
	Mon,  8 Sep 2025 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgqyV29G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C32BE65A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360442; cv=none; b=udKHeJBlNMfT9GqL3fRIJAJlzdAQR04/U9LNtrTQI6YQbNIn4SohSGhVsmDwNnF97TvEPcOyMsGkrnhHSxp7RUa3dOumvOy3cEiiJ4aQVHw91UOeAqBDH4q0+kceRZ3iq9VLJPSO9G5cdeV8vVORxpLWa2oBJqCbGarh6PXcX4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360442; c=relaxed/simple;
	bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YN6Lu71do7PoNlzoZxVbqaNm31xxTjfErw6LrNFDu4JfUyK0CJwVXMPGk+uqYt0jXVtL0ohOMKuOfnH3PV2A3z5t/l58N5m8wUjaNzSC9dVaPNYqn8HzZMHhibnxWyEQXVWs391wyPqx1v5lNo3NBxkzldMGX279svHheccgSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgqyV29G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GcfWp014776
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=; b=lgqyV29GjHtaOz98
	j31pX7LQOhqqQdK99hk8E+D3dUQ17/bU4U7DBBkykSmXIw0G717diPeebyFLTNUJ
	2Ees1UDXmGjwxpOJtGAWiznZmo0tel3Q7IJtSm8sGVi8eIfVet+rCH4o0bIgMlTo
	QqJaRYlL9vXSAdpRRCUIC1a/HE2e6QOze40i+lLfuxpMf3haMnRxKf2iPLf+fo5A
	kCy+DaMGf1HG+U+ZbGm3XAgcqxsflSH3XzRX5+yrpgw8gQjBvwgvdAInzq88wsp+
	4D17U+CPc6f4K0FGktx3sdGIveuEvn+KrRFSz5cD4RInW1udeKZdWbmyKRbeDaip
	uQbwXA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5wc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:40:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4fb25c2e56so3938518a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360440; x=1757965240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=;
        b=hM9y3oLKDuiuYG/fGpoWYSioc0t3iNs7OxzCmDbkTI2NwNa228pZ/Mrm6ofuws8DHl
         X+NiENme31SQaiksxHIv54FTzuFm9L1a4rzlotpXDxgokGjzg/i3/bwje2A16XLc2hdM
         VU/nimWWJ+QoCuzLz4OcnnRGMl0Yx5eVx7n4pi+UXqeYN0cnqO4ciWnOTp4ePghRMrji
         aVrjlyFJONP+AWtDMuS9vrMGxXgScuuFpuTQz4RBy6B3J5A6RlmoLgwE/u033gz7GhDu
         TCxNyCwKYluUca3KEwZR75AkBa5QUxeKM4gWOa6Uqi0WAodLEo6hX+LwPql5MIlbnVL/
         2Kqg==
X-Forwarded-Encrypted: i=1; AJvYcCV4pWOImscXxMk0bOiQu9d3MyURaCNQK2gDtJSRNnHxpN/9AiDQl6n7z8VwDf/Lhea1ryIZIwn0xC19amTB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1iQeiB160k0XL4N/97f/+lV7Vz+OOGUAybQzw3+RS91XI4prO
	7y+z+BpPxFC1xL3Mvh8F4W1Jg8Xz0q6joPafZ5qymsBvILRMxK1DEw2aC7V0RT913coFhE14Dsy
	cesFzy4nrZE04zNFPXVxqpHFRg6SChUEYUzykj1xidc/q8oO1NW4cXWlQWV9OxxDknVH9
X-Gm-Gg: ASbGncsPWdnWOo0B/O+RCK5LXmrrsC0bFztObiDvT5d4erFsOSeB6iXiqfXpVup4bZ+
	PpBAp9hLBrw1BTbGRXx2bd0Asn9y3uioh0P+/Lk26w6GPa++lDtLHaGXId8aX2bDDpHPge03n1j
	ROpkR7HcJ6+PPax9EVEypcUKYSXJqDlC5Q6s2NTq17b10MBHXA3UO/wx1oudPxeirTg16pohl6R
	OYvomr2uY/xbr2B4uegdJg05c22A3sTQdQ6HVlSVRCsYlLklM8yn3HlGHDXhZzIxYfPq6uuTu/p
	zGe0ELIZbR/R/JrxMShdlQQEbbR4JZfIoPVyxBYSelSI8taw7HuhrAE4y7/g7hX8
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id d9443c01a7336-2516c895cc2mr111481635ad.2.1757360439755;
        Mon, 08 Sep 2025 12:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MS/PGj46/9DijhTLrv8zPpQ7yn0ZAGwHCLanL16Jyq5ouQQYBZXugxHzfIk1x6pg9d969w==
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id d9443c01a7336-2516c895cc2mr111481185ad.2.1757360439166;
        Mon, 08 Sep 2025 12:40:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:40:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:40 +0530
Subject: [PATCH v5 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-5-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
 b=z27gs7lVGN1/JHmpToK7GI94Hpg3Rn7lWyfFRiOlLXXusxcWd+QIBI1E1Jw96DmemJ6yUs8id
 ewGQDr/ctEYBnUuG7WfVeLnHEXtf5X+Ajb+uW1zDO4nwuX68ThPjkkS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: f83Btnrb-C9HLAp0lVtsOqIJ2zV6br6T
X-Proofpoint-GUID: f83Btnrb-C9HLAp0lVtsOqIJ2zV6br6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX46Sc5wJI2L5v
 clZyPxxryPkOfUHToGcjsQFubellbQEyubTz3a0cpRvLxr/pxvER8fM4KUghYkqdal1ezFD3Gz9
 mLxprPNMtOjiMDpayM/h3SLMzLqavRTDjX3saxnPUPlxSObF8PgKsPai9+Nt6m8TY4tU9RjzhWy
 DwZXp5zQvkDwqfY0g08dmp9s3bp97IUOx6bT7JG3guxwkhLQXiWIQwoBuy9koHYj2IFE+l0+Hi5
 lrEO1NI8TBpmMWk/oZ+hnhKayy1e1lFdcIYFr+IlUZ2gyZBEEjY5UNt4DfII9thMdTBt/ZJgsPU
 Pw2X06NVktju3f3rVRYfIWCc58v0c4bAiHxCLb/0Awst5LnG9C4IKIVfnSRzHoFa5qct0k5zeX9
 37VToki1
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf3138 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1


