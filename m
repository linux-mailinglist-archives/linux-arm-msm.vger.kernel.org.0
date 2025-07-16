Return-Path: <linux-arm-msm+bounces-65185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AAB0714C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A032581D7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558092F2C67;
	Wed, 16 Jul 2025 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfIhBuBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB62F2723
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656973; cv=none; b=QYVsVs/K/woQX8Tfsof79QBOEyck16k6r+/OyQo2RKsRmZMhnvbOrnwicSsZE6BzlAbHT4e+WeWn+2uoo3NIzIQNwg6PC9b3jLqybp9Aj6OoFmv6A6O2gIcw57gMPf/0DMCCXRY63EmUA+ll5J9Y+OkwawLHnrQWf8XGglULveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656973; c=relaxed/simple;
	bh=meDbdQ8jfv6MzJ5QqjKeDn98P5b+BWThT05OUsC+Mpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3742/EpnIeX5rkGBaHQ5oTKCYUFHLPJNQQgH4ar1OJNeBHf4uQG6onnwXHOYX9Ltamym8c4rwhnFyspZp5ie6FjNtwnVpV/OF9AXPnV8WivoGWO0Nb0bGcW72MxTCQckskfSbfl3YkfUpROIh2nmopxtA5/kKltUeWbwIAKgpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfIhBuBP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5x7CM024479
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9sBDUWVBLweXSo5nrw26qvUJlKDueBdo3VuMvvD44M=; b=IfIhBuBPHQ4n+KsV
	gePm3ASakyphVJwcncRLHtz3OgUsaaBmv5uZO6Yqt2ovcfEMl98efwGA4amBnTPC
	xnZJbm6CaJUnLxuXOiCY8aEGa1jb+ouXZXRFikbVlQiZ/Gb0T5L6iiyCBxUvsoTl
	DN9g1m/q7DsDv0r+YKAOEIwtRxm4XaGR2VcqijrOU+qnL/gPJ3Cgk3aNPifzYiDh
	SzCDHr1b15RhsmPZSwP0+U4AIX7GqIx4aKHXSTb6qUI/OqO75LyPj4mrmj9VZ5jh
	7Z5IvSMieyr5wG40OF0HQVPL6cn6UdTwWoLnAQnUu9UM6EaIFEnMRHrEzc+prAQ6
	b8/b9Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpe63e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b38ec062983so4654181a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 02:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656964; x=1753261764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9sBDUWVBLweXSo5nrw26qvUJlKDueBdo3VuMvvD44M=;
        b=LOfYcyEW6oiGb/6Z4aLw0jqzZCP+e/fe/8jxjMNGihDMAI7KScKOBnBexegrUpA8PM
         jflIajpsq/walXHt1PUr+bJ6MQvYhTvFjVYb0k9zytj3Npfek6W3LrEgDTmHkZV4tLPR
         G2IhS11HFRT3Yar0RbnV+ROOzAlGcahm4vk2L8q3Sv8gorA7awtsdhp4/5vkuk9IiUki
         XtfzHn0sD+2Z0vlVr8FS57uvq6om1i5PgSVoMPgptgcdPO5G/A7X1QsQeC77CpVtV3OM
         dkwivdS3vOX7/WXH7Pin51kl9Por7hk5Ebl/BLUIWTXcv4T7YW4tCkmRnuntekCXKDXx
         UUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBVl1UmFsPRdM5bpw92Ci0uBbX+JV/p3xJS31mBQMlzhYRFbEtNPJLdOUgBULapdbD0NaNdqz87IlIFlGa@vger.kernel.org
X-Gm-Message-State: AOJu0YxaIZsfg6fcHFr0xMZDc4+hM2HxYs0smkNYZ9JbxYNEegWI6ZxM
	OQokNeYMBfSySPNpcuX4HoOjklWxyXlrJQGabuj3bFhMG+Yf/tmwDZgxRCiYmznc/ZBCYocSrSc
	WIpy2JKFtcrhV7MCN8l4pHU6BOIboZNtklRhHPq/v/AP12QVRh0NHavSs8aFJBa4qJaju
X-Gm-Gg: ASbGncsn3Dy1+kv6HuAamG78QYtXu4lLoL3w797iAG5tS5ZsEBmXZT0oxThP7E7S2AJ
	RpXacCUnsxr0TW3X8o01YVJzW24h6go090TMqfRsJqwTEE2YAocmjvvDZ7MYn0VFAa3IuIYnmvU
	V3u6hVjX8W1f2WUsQBPlXaGPbHgHXonUEJ1FxAonAUSJpIoxcOPdZzvfm1s+67ztex+EgYiG94M
	w9pO4pHl8dj3IIGyxtB6GACSE7pP6MejHsdMq7VhcPdZydsCFDtmNq8h44UQRZMGNow/YP14jh2
	9/4j2hD+fPZ2b4gkuxqXiwQblOTAYGZIcvz+WFkoyEh6BBihSDEk4sa5NbW7fGXZx1srGJG63mP
	DcB8MaqBr4tgrPTIPNhyZZv6aL9RHQnpfTw==
X-Received: by 2002:a05:6a21:3299:b0:222:c8c4:efae with SMTP id adf61e73a8af0-237d702180amr4519944637.27.1752656964307;
        Wed, 16 Jul 2025 02:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7t6+L98+hLfQDY+8IWtibwBKpLYwiTzbTLrDEk0AhFbJAbikqrvlc+LNPuZ89eLrBW2tn0A==
X-Received: by 2002:a05:6a21:3299:b0:222:c8c4:efae with SMTP id adf61e73a8af0-237d702180amr4519906637.27.1752656963914;
        Wed, 16 Jul 2025 02:09:23 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd6022sm13926375b3a.8.2025.07.16.02.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:09:23 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 17:08:40 +0800
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-hamoa_initial-v1-2-f6f5d0f9a163@oss.qualcomm.com>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
In-Reply-To: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656953; l=902;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=meDbdQ8jfv6MzJ5QqjKeDn98P5b+BWThT05OUsC+Mpo=;
 b=mmItxzJfygAR0embjO+9OO2+VLpXVON1rV/DlAQgefJHWCDXgXIQNH5sEzYDVTkN674lVm2mD
 3GDRARPv0NoAdfsS1/zT8Bc/Ef0asCSdcRTgMorpfRlqAoxwaFKCOQv
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4MSBTYWx0ZWRfX8NiU50evRMAc
 R3QtB9IhoRir6bgu+4Q4kwFfYfDxC1Digd6uQOPRfm6TgyNWMAIMu2UuDMUrhkOxr6KzP7fLkTN
 VguY/TbFvQGfNu4BO2mdzigFybV5e3KT5dWZ23cVU+0PWO+tKQ2/y4k+XNQYtKdZrc1w5BM679y
 c0p8kxZL+iC0jC49s5mXDsPTbjFflp0Ec8W87zWHLIS6oFof1xYRZN/jOdPF7SJ8uViFunQC4lt
 fy9RZgCbAXbUCMsIF+INo4PyvPLt8I+2drm10xmVWmsYMw8ydJSHjWY8CRrqgjGfUF0RfNa4EVM
 +Sz+LTOAhxGkiY4kDGDFSheIk+ninKr/4r2VnWGSrPEVfxxjIGqk61y3+o4i6O5dk2VwEOXNWNC
 kvbs9CG4GfrKEVFJ/8PAw8LGlp+yauH4sPsBth5HD292+DSmOHW+P+0VceRHLg516084537f
X-Proofpoint-GUID: RW_uxdmp7ci_8w3oF6JMryE3W5YMbOzA
X-Proofpoint-ORIG-GUID: RW_uxdmp7ci_8w3oF6JMryE3W5YMbOzA
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68776c45 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=h7II6S6JRGbW-U2bcKQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160081

Add the Hamoa-IoT-EVK board to the list to enable access to EFI variables.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..0473f563700db72333495dabeec59cc482b717f6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2000,6 +2000,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },

-- 
2.34.1


