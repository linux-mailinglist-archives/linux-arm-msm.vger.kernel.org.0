Return-Path: <linux-arm-msm+bounces-83169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B788C838C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2D1D341BBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C4B2D73BC;
	Tue, 25 Nov 2025 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cz5ijLBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/t8/y2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04B2D060E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053337; cv=none; b=lYZoeiKNolzVR+YSFjPmg+4o3VroQQZ1DGtL26YT2dvAI9BeOQypFdM9C46LihX6opGrasMHmldGqfUNocpNB3mAKlFw0i0qiZSaCOzv9OElc1Jv4l10mtAMS2EB793vmVeH4pZZXH9YBuD4cgZ4CzAuO7Sz0W8zqFSUSBnvyUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053337; c=relaxed/simple;
	bh=JaD7mb6XfRdztIfNyhkMYYOnCv9vI/fjXzhflA1DBYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NW0nfA5cpeSXTkYtF6LcwHzJPi2d7WLFGnbn2Sot6o7vgkn5tZY0EjyqfD4/Ds3OqNOKF2cd4PfHRaljlyPwi9HOk11jmRvhIL4rI1Ai3Drp3mcQg5W0aBL3nPCF/LQ9LK/B45s9anGfs0/aBUdNDT0GkkW2D1MP+28Q5IKMtFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cz5ijLBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/t8/y2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2h2Vx1232564
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OqlJLDbVw4T
	n78JJhjxStsJzAZqGZdEBuegjg/h0GSI=; b=Cz5ijLBlzgvJwMtMyOD7NHXmfyX
	Hqgjs1vyo3visScVH+P7oI4AnXwJkUTFxeQqjhNSZA1tLLIF7fmQ7Hct0Iywdd3/
	7hUKvCmtiIX8IG2Heu7ltdBRubzoAkPvaZTrIIRGpnTm0kQWS4L3M7CzK0Jw13qA
	TZpyp4xNxAGS2K7iJ5xzKVr0xUObZ9HIQPoYzNMRgTa1J1ZuFq7nhQkbkUKb342r
	MzxfZMwhEgqC3YSKoxdpyRwm5X1CtiWLFeusJSBTVOWmvlSi8bR2p2JYZTG/LzG5
	AvigkOvgUnYDIXvDvPz4SFhbP6WXFvYuQI8dIOGDrfXmDMnOd0SOfvnQwxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyh32r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6e701d26so121938661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053334; x=1764658134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
        b=N/t8/y2vzAK+nDNrPw9md/aGzYUTymHCoE8RM6hFHR5lCfgQEE75DgAqVd66pLQ3eZ
         yzbi4ZYfk+HAM9Ne6M/fCPH5tLdNV5DzlueQpW8//OsTPgkOAPCIPEvooD1qZGRnSqv2
         0AbmTcKGPRDrDhir880Lb7XqdnqQussS04Qn2nxX/QNo0XOOCtwPG/loewSwfMaWaeKZ
         xS5aPYkQGfUC6dcReQjcLwRcGaSXCCZTf1/U+eVr0RNLlOmIOxBX/0BhMLcsQcrVYLAa
         fJflTmcbozxe7a1MVPBfCgiLuxj2L1x6CFql3jtMHm73aLWaycYfZNUw/QtGuX3SVmIo
         EX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053334; x=1764658134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
        b=rN3/t/ncJLcytUGobaXFfD4FBU/LjYCJllCj+hVwa2ueuECDIo3mfPcrTqroiMdQe8
         qTrWNh5oQs/nLwM5cM4YPtMZauzQRukEJoSGveengstyXdyVpuVy0GKfHgLZUWOo5kLB
         +8Mjq8jcIQoh+8vYmpmAi84MMu1KOo9na2evYFkYgFSwiphf0Yxurpv/HdBAHQhBQ2vO
         ePn7LEOjAelKo/GncDdpMlczc2Lwy8AhODoEnHMCkl+HrBC6SN8+Os7cS2bhzPw4+b/K
         5ZjalAG7HjV5T/2AxsfUjMkyAFiuMem9mmip5RasTZIPFYGV8JovqSOLxsXBv1MjRSiv
         nbwg==
X-Gm-Message-State: AOJu0Yyw+D6uhFyh9UrrmgqGcXePghxE+ipOLGPGwatNiOirVodOzbh5
	kPxHvSFDTq4KT4dReSy9GdLgLCQHMCAC5zNq6p/PttIz63h4dG06y+mtEfPHmgox5IRm1RNLF4x
	3YsRkEW7V0Aw0QyAvQKchZGve70tjywPtQ+yNfldDzsr9eAVjaMRD4LbB+hSDnkMZgHPa
X-Gm-Gg: ASbGncujdlt82iExiQhiv0ogLSz6Yj31VzwiLSOqalpGEyXjh5Lg1meKYkK9S+gaqQE
	BnlhHlnwhKP0q23QZPw18oS6+gGY3UpNnSrRgEm4H1mscUB3oXdGDExAzd+PspcfXPAz59BvrKB
	4JJTStfmp6feMqtD4dlB3X2B6v3viBA8386vBrcdzqyOa4qzT0CAWR28PJZSRVrZLbUcgzHLuE9
	T7fjhtaZnTOmp8dHoKi1OhTKRNSH3UMTFhK7m+nFsTYtUD7ziBS4SUhx2d+dKo1CzonlPa30q2c
	nDjJK4ZxnuO9XyrtSoMnUD+t2oAbG7cuuufzV1ausrVlee2ICN4XLAYwqEcjpKnyPTulTMTdmqL
	Ki5L6GKatw8CN2Ig42s9hP3Fxwc1LVsR8Kj6Js4mN37p/Q0W9RBdeDy0L842CyA9GkujuqBs=
X-Received: by 2002:a05:622a:1aa3:b0:4eb:a0aa:28e with SMTP id d75a77b69052e-4ee58936cb6mr191919481cf.64.1764053334586;
        Mon, 24 Nov 2025 22:48:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaU+K791QjFnobNp/KGKhqyUiww2Up4fYHtIc8c49z3Godcl3Fl5+c/+96X7shmR8C6UrmpA==
X-Received: by 2002:a05:622a:1aa3:b0:4eb:a0aa:28e with SMTP id d75a77b69052e-4ee58936cb6mr191919251cf.64.1764053334173;
        Mon, 24 Nov 2025 22:48:54 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:48:53 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2 03/10] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
Date: Tue, 25 Nov 2025 14:47:51 +0800
Message-Id: <20251125064758.7207-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69255157 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXxQ6I5ib9XReL
 PZUHIXW8v+0+967YlC39bafVWJy1V3po7fsc8EraBd8TJaKruYyqvdLQ6cUe3LTAdkAWSdH0AiC
 BLvjW+TBL4x8BRwMSaPNrBoyipjIrWo7YKKL+eBrxRUJyor3jzMFxeNYrkxfbwHbPrZIUjms40L
 dkPTkkiCH0/IRaFOM/nYd0nCVcqOra8F6W8GKZBeD/G/g0GUat7t6kxNGuvWbe3Zc6twpyvvA60
 P3gtrUJn+bMbmQ6RDR/WEM3ajwgUCA6khTuPozhZWxGT6ec+xAj/2H6ya6RMl1rFE5tgoq8z7cC
 5bHZYUZHVQY7J5c4AkvZ0dfqF5TfwcpWAww7bpZPp2o9sBbWi9rTWe5onfDg9u3/L2K2b+lLYPB
 8x5SeXqOu/rB0R9jwPrNVV4TTbYGqg==
X-Proofpoint-ORIG-GUID: _B0g-ZTAYsgt-x5rHOaf4ylqP2SW4kUW
X-Proofpoint-GUID: _B0g-ZTAYsgt-x5rHOaf4ylqP2SW4kUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1


