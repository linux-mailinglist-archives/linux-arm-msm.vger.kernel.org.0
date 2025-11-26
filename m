Return-Path: <linux-arm-msm+bounces-83415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A4BC88FFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E73E348424
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4EE3064BC;
	Wed, 26 Nov 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ajk8ZMj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwLg+x0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B02E7F0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150009; cv=none; b=WVeK0qvCHfLGfj0gU5oHChG7IFfJdqeNUvPEhFmbxmSDNTwPxT0Q5Oty+g6lR8reHrONF3GGcu7hkmcXKUmO88MyfjYEO021J40MLypcyPYVI68f9kSn0NoeNBJh6ts496tYxqCZ+jIUm18mWiZWuFJEoE3YCsxl9MYv7Yf/1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150009; c=relaxed/simple;
	bh=ZI+70tmjzoI7wmLgTedB91cfS9K5LpTxwWfVizhjf8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xb+O6V1FEdZZiuQ5Izobedo/Cci5KtIAhEdLXs5/yX35aB7aukJ2WrsBuME9sV4821cyGlv2PqeES+pttnWIp4vNdmV6DwrUYcJ6ui5BLn90yO4BAUpOwvkkQUlNk+DKqzCV6CsDmjvjo4qrkq1SBiAWDc9rtK/XgWstNh4W5BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ajk8ZMj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwLg+x0l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6v3CS1457809
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykS43o/yABQo0bHJe1uANTAp3KJUCM6NxQEV+xrtv7M=; b=Ajk8ZMj0lGw93AHc
	1PTVnwUmb3JnGacHX2jx67FMn0CN23w4CvvXE3Eo5z1LSWWEfNCaclDjLJRL5acX
	D8mr2wbkoHbuHA0ji7co4v9sSbGhQROp8p+3k9xOqwAVd8MeKqJgxyxkot5sfIg/
	GB5f2T1b/0y5tcTvP6wLWQExoj8Iweq5T3MAWOuNllw2qj3Uaox72lQs9/UysavF
	0W0IgCCA9COfozY+utPydTS0yNAQULexvD8IIgdZQW8ytdrK/AR6IfddnHznTM9C
	35Iz8/v65RkXgxrelmHKrSQ+8zVhu3U3kpA5S8+6GWD5bwOaMXbFfWRkaT86+Iu7
	hCm30Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvgfps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:40:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29809acd049so127747895ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150006; x=1764754806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykS43o/yABQo0bHJe1uANTAp3KJUCM6NxQEV+xrtv7M=;
        b=iwLg+x0lbYWZPMCAyHv2iNkRvRzSBHPZUFZIUJKGnXSjEY9/wXhTVrwnW3W+Fvvyxv
         tEpImtZuKiMsWssl9qXIcialjrb7K2QzIMGSZOH2vnmPARzSFpBeYznr+T7k9JokyMwv
         wNtX0NloEH/XicbiZyEsHykA4cjtdORjazlpzL2C79MM8ovzc9m5IrT3azrvSpqbdxrH
         mG2d6gH4YrvjSFb4Wj36qsJbgMm4RyMK284KtcUNFbUNnMyj5LBZVbtP2C9ngILDCXx0
         kyqKZ5sB6t6JfJeIAdaf//33w7Sfop4rEdynWCXi9IR25y6YpK/gnWU6Jdg5fkh17l4G
         TH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150006; x=1764754806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykS43o/yABQo0bHJe1uANTAp3KJUCM6NxQEV+xrtv7M=;
        b=p40r/clwzwvZrowL2P3ncwXaCZdQ1w1uqB8NCggb3gYkM2yuVb5tItO+WhdhNMmS1C
         CT1Vt1tGHXefk4o+R5UfG+KzMqE1zuLgppiynDAXiZmXdkwZtP4MR3tD2SDXxH+E39eB
         zlOttQDSv7Kqf7P6DnImUa4A7Eem5EB6/HK1/JQUqHbwhGh73Tmgn9NfFyAMvI66dVjB
         9OIUPfH5ChqW/D4n26CuAiQLBbWj6csCZuf1/28d1nTXvvQnbhIykfd20jD3Sj7NCICt
         DfqCztd/SJYWBHyNNQ76OuOlAYZkTrN/5VtGFqgzIn+b+jhD9CHlGj4SVBGTrO6yqy/w
         Zd6w==
X-Forwarded-Encrypted: i=1; AJvYcCVEhu8M0vaX/VdTkioAxWunXFAYHuGTOQTzIHI7FvYypRHN7tEEGxz/OnwBcD0I0Mbcb2oUc77iHuwAs88G@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNf0h9T9dyCPowJ0582wHxe77cIPyV+iHecKccaQb0YkD7JUE
	hRzA9PjEVnRcN7490NFR/vG7qA78RE6k3O2Ri18vfjN96fOikngrC0+fXvaRMaSzJcowkWz1Fi0
	7EjVlY7QMzCJ5EBAt8pXT8FK7Cp5eLcnwE7qlf7rPiRRgMpAhlZZyetrHoZxSGG46K9za
X-Gm-Gg: ASbGncvjfLeeY84SBYbB2SyonnodOuiDXur9vA8C1dYi5WeUKhBRjAoDYXPxX4RKBCa
	XJUAWNvYN87qKCgWJ/TTuUzcfcu9f09dNGY5pyFb7TJ8yNyw4hEqcNkzSut1P+JP/khqJ/1mplu
	V7SGWUw3CZMw6Pjn+xnzY/aIiKP0D4DcIxDlKJAQNl5Yq7Wfxr4MgxdFIUAx1smnLCTNQfFTQgR
	jUc+Ta2DGy5YEHsnppfnC4/vkcmoj/59g2/DilDUWEFCvEIfuh/srXsyX7U8vWBSbkiC5wWjmBk
	Xtp3gP/YEwtcI7PWV/dqwJVyonDBWRYsXEUdul5E09WWdetJTmm4fEqzXTfdqs73Wp7aeV5+SGC
	Cikto3DcjOxeguDBO1xnV4pHHrHs0T0TMMQkIw6Yv1Wu7/Vz+2girT2NcOHtVbvYJ
X-Received: by 2002:a05:7022:1708:b0:11a:335d:80d3 with SMTP id a92af1059eb24-11c9d8504d3mr7701688c88.22.1764150005801;
        Wed, 26 Nov 2025 01:40:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsb2pHetCDV4cPwnq1rnH0CoXCmIvAGKHQAIXavQF/tKhITkfZp0ODnWeOFXFyCZDRVImedQ==
X-Received: by 2002:a05:7022:1708:b0:11a:335d:80d3 with SMTP id a92af1059eb24-11c9d8504d3mr7701663c88.22.1764150005195;
        Wed, 26 Nov 2025 01:40:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:34 -0800
Subject: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document SM8750 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfXwAF5BEC+w+j7
 1hiNKETKkrzXHFYGEd6tFKQMQfC/G5P5EWD8xI5mOjiBlCrd9tQv5yeFHSYBYvIp7u1Bg2Yf3R4
 5kzvzJWr4Lrj2eNqGFH+WCa49p09Le6e7GMAiG0855hySPTPiHMHIYWEiHEyyTKniY0SCBhK+d2
 e9YsMPHrhP3f6C2XsxncywzwyDnxqdbPjcYLPqZizRonWz+8fSzOmeNjP7+OLIvO/iPdzNIA9n5
 CMmDOgiikgGSji19hMakyRR3j+i96fUNpR9wwP0kXKYGwIGFjLc1IKT1xJZkHzJ1yYm6fYqeby0
 0M5/KeK6qDQEgYGh1iAtGEg3l5I6sfK+T2/KV0uvdC7323Y0GnBFiC/fPxBV7M5JjCogR7Zo8h6
 fWzBDTyVPyg04isIyCOndMXa+mEhgA==
X-Proofpoint-GUID: ZnUiu6d-B8qJZYmvJjfBvr2LBUfHDLuP
X-Proofpoint-ORIG-GUID: ZnUiu6d-B8qJZYmvJjfBvr2LBUfHDLuP
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6926caf6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j9zjN4cs5acD8dv8RPMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260078

Add SM8750 compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 33852a5ffca8..a3fe1eea6aec 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,sm8450-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,sm8750-cci
               - qcom,x1e80100-cci
           - const: qcom,msm8996-cci # CCI v2
 
@@ -132,6 +133,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,sm8750-cci
     then:
       properties:
         clocks:

-- 
2.34.1


