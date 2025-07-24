Return-Path: <linux-arm-msm+bounces-66437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59EB1033B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1E61C21DBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD432750E8;
	Thu, 24 Jul 2025 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJsp9JNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A3274B45
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344966; cv=none; b=D9/hId3gS+Cyy1R1h3ki3VPfpDueZxQncusHpS8+SPtdhm6UkHzZi9gmv2ztEDOic5q3hIGslGLR+yG9KoIHv+BXCuGBSOECj9HDwebpRcmxQAVNgM0C5kG3cYpoHjJ6djastwDNZ3mMHv95Wps9dkWzcQnexcZISyKVXbCJ/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344966; c=relaxed/simple;
	bh=dpxW8aShh2RYLX9CjF0k/XEH2duG8LnixEBwdfov9eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBE4zc5yd6jwW+YuhbZIaNcmedkjawgXQFJKXsl9NoK+SShL6Ur+54lU9SkQ8xEVLb/q+A6nYO20PsR4EKqbBlOQOA0lTeqFB86KpCaltGXSofLMGoujvlSHyAE5D0TqvZasZONmUJEqPVgsQPMKUHfgMAqOt6SCAUf17szOvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJsp9JNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXPxh012727
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WbtO0JaeN1fhr4oYLduWJfFLHLQ9helHJAYmSQJKos=; b=AJsp9JNOghXwSaYH
	uiwHwJ1hy14x98G2UyGqqhgdhBXYglreHOk1qrXs/5ihnGUcunI5DlFWuHip/+48
	MPewf5csXW4R9pUZJie+Ig7VODNpXvPmH179TEwdCb2V5Hoicwh/O3WHqTNddVUe
	SRbuV50IzOQi6h5z2uOeOLenAkdnbXL2xTJu64yAY+mkDtDREIkSS0fwWKMhloKF
	reigUOloGt1ZVLadAHt0DBQPM90JfW0ye4hnjSmVj/y9hbdRTzpwVJPNLht+4bEH
	fKlm2M1pu5dvt1IPDJz1lmBcsfLI45xz0BlB9FbMalwdIXG+oQwigFRlvHcxKFXC
	6gLcJA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hwymc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:16:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23638e1605dso6106185ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753344962; x=1753949762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WbtO0JaeN1fhr4oYLduWJfFLHLQ9helHJAYmSQJKos=;
        b=XblupY30zUWEpQLuU1BB76HC0agfjiifFsp/YU8e2LXX5cVmvdeBzGOUQ4ZYelzBQJ
         XkT1EiMEHFyJUHetmNOyn3Tkr1ZkCNCtpuv/z5AVylHQGsq38l04g8eXBWRB85Ei1Y8x
         DZrw2Zv4CLZkeXKhKfeS67bwgiS2B+F0Cd8gbOyTbLvHhux3+xBlV6dxvRFKHucc1uGQ
         pb/DvWobS0Gt1snjhXIS9KDmCryU4ez1UUoUn2LY0VEr4CAaBsJsNtgj+n25k+hWXzHZ
         5NuXfgwpEvcKwo9SshworrNDCXmi2jKnS5Frv7wtvbWD3IGML9vict9ALoGImHS1q/+R
         IC1A==
X-Forwarded-Encrypted: i=1; AJvYcCVdj2jgyhuJvbcWeph7lEUN6fWgqdlWYS+Aq0fRc1s+OsxdJkiszMQzKF6jakUGsqiqsTc64v3OsizTlcFs@vger.kernel.org
X-Gm-Message-State: AOJu0YxJmllqcQaueEgthkdV9PFOcgHlLOf29PPgrv+fCUbSYMkvw58E
	bMi7+89/pMmnz+Icbf4Jq9/WqPBrJlogtlNc8b0DpSnZwgk2Lu5AFh7m538+DFf1D+cEL91vE18
	Ihz1DHTENPMqE7ZvAfqXXocpMBHHCqNenTbr8Jgw3L3CujwB16Y02SLayNKkXEHL1ft05UkAPcN
	mhZIQ=
X-Gm-Gg: ASbGncssqV2p7+M7EQW+dfOqCnAiXQkDymAZ1MNzDGbyehGKRzN5pF0LyOpumoskJy5
	X80kTdjvhB+j/ex7QXjZCRXCDxXF8+mUmgx/6tY74cuKHM2Y/s2reSeOY0LNa+3sLe7YNW5i+4Z
	FVDce4leUFdbdHzQM7KWdWfyILnulrW9EBaQLaWcnM31tFMI/ZYlVKjbQxma1VG9CtVx7xJZWBs
	gt0fOKYyz0QuUZraAI4BRO9XFtXMKZu2Vxmqox0tS4jEGpEjB44r6BN2x/3oH3mbNZIQu+v+G5b
	hG02CH91D0JDfzcPY4cShW5Jmr6zHen7Qf9Dbx76dXoEBVrOzdnAlUSZjZX5RdfX4YRAsnxDHf2
	Oj9PYt3bLprmpn1T07g0uc24/q/L9MJpTig==
X-Received: by 2002:a17:903:2444:b0:23f:8d6a:8e45 with SMTP id d9443c01a7336-23f98140a01mr95820365ad.4.1753344962223;
        Thu, 24 Jul 2025 01:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkr91/pw4vNNaIUOBKuk9Uuu5PH41arn7hoJ9vxyrcC/rkoCGcnGUaqdCIG0nlSwdowIBEpg==
X-Received: by 2002:a17:903:2444:b0:23f:8d6a:8e45 with SMTP id d9443c01a7336-23f98140a01mr95819995ad.4.1753344961803;
        Thu, 24 Jul 2025 01:16:01 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476eb07sm9770595ad.65.2025.07.24.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:16:01 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 16:15:24 +0800
Subject: [PATCH v2 2/4] firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-hamoa_initial-v2-2-91b00c882d11@oss.qualcomm.com>
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
In-Reply-To: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753344953; l=902;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=dpxW8aShh2RYLX9CjF0k/XEH2duG8LnixEBwdfov9eo=;
 b=+I3p08M5AzxBFw1WlgrLsUDXm3vOpWV5Qoo9a4Jpf4d6ErbbLKiNBW3hdCzKo5eyxU67bTfk9
 6F4CKEtqLhRAx4DQqxEDhcXx7+pWzfFHbhxIEEzar7mHBYs8IngrpLt
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6881ebc3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=h7II6S6JRGbW-U2bcKQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1OSBTYWx0ZWRfX4CP9/26Q0Mzw
 lDI79EVpMxBgQ9h0hNXxaYaafOBtn4nLRHKz2oz0pfjUOgYkGABT89TJIHczg7IsnLlaOgj66qs
 8Gmkgv9i/DFvmFIOYavAJ9o3H9HCZ5jOf/+1NXSxCeGgbJJBvwX82s4CrSwaS3JFITga0sPD0K8
 R9m5ocfbMnYoMbyn49ZoXJR9ynV4TPozZkfDYjj/NkX0euaLSV74rzadzEniAvO8AKwTtY0Q/H6
 yrEVrk4IS/33SyNeSeS0dTtVmXb0t+a1Cb32rKm/UCuNgGaO5p6NNdG5DFmomPHzjjj5CjNQz90
 iG8siKrZzM1zcxdkbGm4ZDEVZn6m4xhKT8OSij9V159I8l3w6pmHL1TCc/jdaEZvtxBZX7W2PIa
 GWwN18hQTUR7TgYMC5ae4ekvlPOJDtQgg6yu+S/BceH3hndXZQXveBlZwTPmbUyC0qiiiSy0
X-Proofpoint-GUID: 2ecWsHSv9GWDwYAXoqCNDz9PQM9ChDKp
X-Proofpoint-ORIG-GUID: 2ecWsHSv9GWDwYAXoqCNDz9PQM9ChDKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240059

Add the Hamoa-IoT-EVK board to the list to enable access to EFI variables.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26cd0458aacd67dcd36f065675e969cea97eb465..27c9d4a0912646415efac2df089ddedaf971fcb1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2006,6 +2006,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },

-- 
2.34.1


