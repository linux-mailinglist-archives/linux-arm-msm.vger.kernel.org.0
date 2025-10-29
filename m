Return-Path: <linux-arm-msm+bounces-79383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AADC193B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BC7564059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738CC320CBB;
	Wed, 29 Oct 2025 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diyhMgSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqeS/cbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C89320CAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727163; cv=none; b=Un67YJhf1jN81FLH5SS3RyfOJ0XPfrQ/jn0o2w+wt7oVyNFmwtyjAqJWOKV0tbedsskR6qo2snfbAlzNnXj/jxRVvxSUgCM5qZunDTjaPnrK7LpBQwlNhSYD59VUQ9IrB9QR5QGCx2yE7sWfX354nqVY+GTknFph1zG/On7oBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727163; c=relaxed/simple;
	bh=YVxhcaXTQE2kdQCpafdkbntvUWAijtEj8SyutweUyP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HFEmtIcnyFh/GTDxQ7L4wHTRNfbGyGDP3YUb420ZMNFLmYOwfkJu6iAKjhk6yJPwaSGwGJ6atk9MFM6Tdk1LcD3FbUneakX4D/U/22TCKStvq7/MvV55TOvcAlJvZUQziHXgdkZwMLhft+gmtcrhqtDvj/1aO84Ii8zb1q65CNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diyhMgSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqeS/cbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uxek3663625
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sNBgwn67duVytbvZ+JF7p1
	ePAMjl/91R+GX2/HjwkOk=; b=diyhMgSDDKTuDXln6ISoVyeaD0nlo1B+v74NPv
	lJivOV5yWg1aFgAGCndA7X573gCJxnjixIy42zw5nM8ArRaWpv92iG1+xMQHjDfC
	MwTd4vxcJ6Fwec3I4b6t3AvHHomwoEogI5/zC61KarzQIj0DKK028IWQ2cL8RA0c
	YDCceU3eKlZdnJ8+W/NFe7no0GagINFv4N8Y0uJtnohJ36RXgUPVigO+DNpeG1ls
	2HW3JmTmL817GcDp4GATNeaqeIMHKwcKzEFJ7l4BUnLUtM+7jwSqigNUgQ91pRJW
	mDFYohT9Tj5r2nA462/kwnrxUxKvwXl5HnWALAgK0Z8WRwmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1stea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:39:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269880a7bd9so72345195ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761727160; x=1762331960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNBgwn67duVytbvZ+JF7p1ePAMjl/91R+GX2/HjwkOk=;
        b=kqeS/cbhbF0DJ8m4lh0MMewNF8TBU25n6txb1ZsLGn/7dOrbGMMu73hGuwEWnjuzhE
         Cf8hECU8b/gprzdVQWWW6OCn6ZX7S0N0ZuO14eorwyKzjUyaizzlseAC8nHdUVYfH3at
         8G8pjXEcu3JTvIvwXnQTumphqgPZ7fA+RxuG3lS5Gt+JhfJ4l5uQtQwJ88c79shn97rg
         JyfmkL1/7gWKfgW+M4QO5YToj4/HWDoBOSjDh3h+pmQh6i0EZ4F8xdGRnD1tbGcAIPih
         E5tT9r/biePsh9kq0q/ghUSlWwt1JTw15LbiFqRophoCBy9TIL1TXeE6LJl6xExXtsxD
         pIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727160; x=1762331960;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNBgwn67duVytbvZ+JF7p1ePAMjl/91R+GX2/HjwkOk=;
        b=IQ/jD8tePFim4L6UPF1g4SqPFBKk0KFKm5ZX33nLL/LFFwPXxvJemy3W+nrojNhh1l
         +++ox1+jKkdO7h7nlXEFU6fBDkiXOgxMWcpk7iM3KTU3rCLlIE3RTc4ymbfbDHTdbyBr
         NAhoc3PvI47LCXleWtU++btLqaJFFqSyQuONwmPdWYsn4Q1e/ytpy3x7HmHq6Hd6OlUL
         qP4E47G3TNVgDnqMBm1RCWqw+dClf5LkY779+v6KyO6YQKXENX+jvhA6ELG0S2TqOB1R
         pEZdvcXHKiQrlVlGPLm1vNm8bqIj7bOCVE2oHmt7YPeHBH2bbHwlwfRIw3DqCKII9JpX
         dLBg==
X-Forwarded-Encrypted: i=1; AJvYcCVhjM2bOqeC4x9trXZSxsOInE22COA98zy/A/AuFrhenxPz+I2y5NsVrVKhllbbcIn+ePLOFuJFILr6vYuw@vger.kernel.org
X-Gm-Message-State: AOJu0YwhERGJBdm3AsYcXiM6VzS+ipLvlm3fsdG5oBT7zuklZ2P/SFd8
	icTpRJJb4qhY2GHcSXhxMgXlkc9lE1KsI0oP+hk6Mk9KPVG+rCj/ndc6iJr/n03nZf7TwUMx0vj
	q06eeDNl6E0PXuOWjd/AK3p4BhwxLI7huBlKd6KRb9rOxeMvhHdGzoZR25Qr3rmFfcOCF
X-Gm-Gg: ASbGncspt3LcScnIBeLIS0Yr6I32kYdYNxQ6JyMuxtL38tAmDUU+p2aLKh6zMq1n2VF
	51VT6xQ5c55OfVDRqbbXA6YTfawSPHnYMMv3pwKPTWSEmyEUUt8csqP4yYJTmmv5tlAHhSJi1fD
	weJYWD/ggmPc8j9SnOtohi/DBKNNEg2vLckKmKMRxvhylp6enI9E+p+0YhdKvZWqdWhuQijV6gy
	G8O+X4Md0biOFUBKA3aN45qerfQlBLgFQ5B+Fm1B8v9wkxQB5o8gIoi3VVAu1Mh6P8oZ8PjeCbJ
	GpbLC4ybaFNOhAVzMm+ouwq6uyxTPttP40qbIkMvTDpeX3DtWAsFwtb4lHQ+oOvs7QMD9AtYXyh
	AamAxUZiBegNitI3vwNf+5qojhLYu2Y8N+URMHqWlUaQaL/FnGg==
X-Received: by 2002:a17:902:f610:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-294dee1d1e6mr22969555ad.24.1761727160307;
        Wed, 29 Oct 2025 01:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiC0ghxyCDMRkuDpRLriggn3jkQhIdfOtGlVs5hwNwmV1z5dFKTu/i0LL2ag+APQf+7gFtrg==
X-Received: by 2002:a17:902:f610:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-294dee1d1e6mr22969315ad.24.1761727159739;
        Wed, 29 Oct 2025 01:39:19 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4349fsm141948685ad.107.2025.10.29.01.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:39:19 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:39:17 -0700
Subject: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-usb-dwc3-v3-1-6d3a72783336@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALTSAWkC/z2Nyw6CMBREf4V07SVtkSiu/A/D4vYljdJir6CG8
 O8WEt1McpKZMzMjm7wldipmluzkyceQodoVTHcYrha8ycwkl7XgsoFbGGAkBealKxCK8700eOC
 1YXkyJOv8e9Nd2swKyYJKGHS3SrJArrXO0zOmz3Y6ibX884u/f5JQAcojb5xz2qE6R6LyMeJdx
 74vc7B2WZYvMuMcmMEAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727158; l=2009;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gZOzH0g70aJtkALwak5Bqgp+Oq+eYJFCuxGX681Vaj0=;
 b=pRlzO53OaO9KtMJH5Z07DZOgf+rhoicJmDAJMjfgp4QMHG+tkVU2/AFKb/2N4218HqY2u0VHE
 RRKgCUT7+KuBdBZObKlPPJN6l77VEFH1GxqsEC0lhzuFiJ5VmQTvJyA
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 55LEjUUw_80qaZXtZwGg0BF-ALd01Zjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MyBTYWx0ZWRfX5lh0id1dMMzV
 XAeIHsTby0IlAtXONzGFTzoo1xOTVFIZYPS9uSgVJnEYoZO5ba8kWnuFR4U48xhDEepgU2Ptj7y
 9PRek/un52ff8Q2/qvSKfFp/tV7mjEpkIuv40qob7XsOycguOEmyzhxXpnN0AkKm+dKJ0fwgo5W
 zOFHTmbCxovqujGMU9bJddmAKQLqf93qKIbvqoskh7qX+2hV0xIE9228Q5QQusuk9FHBvKLXq+p
 jooj3z62lXG0xxpv+oUlIWv++ZHae8WK2plv30mjyyuemVVzUWh0KeZjUowAh/5+rhCQ35rJqgJ
 5x8+Mj1rqDv3de56tx5hVFtosEqbyjpu/Y47GIF2zdv2CdkTP5NvritDWPR3V/5THUJPoG9sja/
 T784MJ0+jqtR2RsXwr1d4jgolOS74g==
X-Proofpoint-ORIG-GUID: 55LEjUUw_80qaZXtZwGg0BF-ALd01Zjs
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901d2b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=A8WZL8nXqXftsXHg7HYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290063

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Kaanapali uses a single-node USB controller architecture with the Synopsys
DWC3 controller. Add this to the compatibles list to utilize the DWC3 QCOM
and DWC3 core framework.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- splitted from original series.
- Link to v2: https://lore.kernel.org/r/20251021-knp-usb-v2-3-a2809fffcfab@oss.qualcomm.com

Changes in v2:
- fix author name typo
- Link to v1: https://lore.kernel.org/r/20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index d49a58d5478f..8d1ef81b3962 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,kaanapali-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -200,6 +201,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -479,6 +481,7 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251029-knp-usb-dwc3-1b0042da705d

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


