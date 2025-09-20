Return-Path: <linux-arm-msm+bounces-74277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7CB8C847
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 14:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68FEC620BA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 12:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B40B2EE61C;
	Sat, 20 Sep 2025 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJuF/4PD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3552D3A72
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758371814; cv=none; b=jduA6D0DPg8QJBaY69c4QyCOP83fSh/+qCqGmu/ui6Rbwn283vMZdouXPkPztLPoHXW/JwuspXenOGlrmMx7z0LRPf0JW9/5D+glb3PhA8W0myEvVTSYsplvzZYLhddiWlOFLfQP/pIv542c9xbkAerYWVzgpQxgKiaNq16m7Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758371814; c=relaxed/simple;
	bh=NlAyY6gwj3GgebzwwaWrY6Q6kn6D5Bsn1jK4HrmHOC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bDkrVGuoMZZQ/zhtCtB5fTfTZESwubtLTolNY75rAXi7sVH9Hj0M4asS3BoLS330m+CL/WVzcAhupuzdTncCyikLkeHXndy4xtjflP/0HRpaip0VwgtfCjaWHbas2EbffIlg19NaVIGEoLy1DvVAPfRHgHpOc8x5nx/n9eA1uGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJuF/4PD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K4eVGx001291
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kQEsxxv9s/GhWRr7hiHaTvJE9W1ROnl+URj
	6ByZUdys=; b=VJuF/4PD18F/7WIjaN88QgYYik45597UonMuLRqhx29D+ZdW5Xv
	9u2rMCS0bi/iJYIrBQftBA+DGrMYviAN/PgsASh6O041JQ7OlWDo00Z3QjjSjHqy
	dAL6xl4C6SHiMWDFdqeazvSEUkB/G8QqQ3CrCeKmxKA32Wn4MN9RWBLI3KjjyTmY
	jlrMHgkhiStxPwpguJbQ9oX65mi7noXHNt/6vskAbwMaSpAEnVAQ1NDw5OtUqfPK
	+njqbmzuEIS1caUVDDLhI0r+SjwxO5nv8oLPpTHHJ0mFJWr5hmR1fSf1T4u1Epc/
	s6OP1tvt/ksly1O6O7tgeAkqUKeU+nm76qg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nekrjex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:36:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so1291855b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 05:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758371810; x=1758976610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQEsxxv9s/GhWRr7hiHaTvJE9W1ROnl+URj6ByZUdys=;
        b=NORZn+anoZHCAk9j0nEqrvFXemxjGdaCVooi6Xuwy47B6aepEaaaNf0WMAQuDYtRck
         zWHI9TUqpxJmq+et0aAGKa8DvmB2w0fnvxlwrUTVZgKO1wlSi1hkjAma7XpMAPGcnP3x
         e4PBDh3j8cQPFCtcDDUf2tjhDzg9L7vn0rAK0+0wFvss+Aqfhj7lU7Y9MeH4zXET/TWC
         wDwDFAYajmo3ALSA1pSg0pFlJySChRtccg/oWpST+Wg4F7YyPkn+VfZd1pvCDzPh7uZA
         zMTj7bX7yKMKUMWLYGbYDekSoeaoSby8SPZ2UiKBV/O+79zrqKbHBF9l+hoKT+u49PK5
         gPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnnG6pKO+wfn3MHL7icfrAEV4lp3+dkLKqTSP2tIIavyufgHY+B+M1lRCXxbzc1breYvxzUAsezpVU0nwR@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqKGG6XTf9Srz0nox4RyjeCdGtBxoQlo0DP6Deq57NyoznoQB
	nzhzpFgBGd4EJSfBP3X5dlFEbYNFGN+TPmn8Bo0sW76mCppznS9XhUmW4Vorb81wgpK+N7EgLCT
	n2XpiPhq5vEJ/JI32MIH2AtvI9Ay1iomCVPukWBvfusONLiz1kkDi9ZQMYQy3C6on5YSu
X-Gm-Gg: ASbGncv+WTB5m5M4+ucmzDsa8ZHVUk+xzrASiMMTeTL0n6w6zB6x8rEteIyw3SqLO8L
	6Kas+19nzRbSqyz24s9pGTdh+Io65r7oFwF1wKtucKDodWiLPLui7UvSQl9zRHU/m1+01QnoLpR
	m/wFgrifmXDZaz6dNaYo1oGvLKCB4fbjeXx2NT9Q5AFsFcyV0uVgj+5KZA1oUbX81meO2kDOKqK
	oCgyc99iSVP3YltEMTc9Yz9qhup8Lp3fCB+wjzpQST8NgAZbTPyic7Ob8M9iRioK5WyrxJndwHc
	2h6A3pSPPro7IZGQuA3KJk613a9kDlEddefYKVPETF3EzgCmgJE335hftybT5Fyu/qmCmFnt2lB
	vryHiCXpGQCRwpwidfq+rhYs2xQH4VE3KCXKkWLZFZRvaWd07pgadxPW7gJIA
X-Received: by 2002:a05:6a00:1889:b0:77e:325b:f614 with SMTP id d2e1a72fcca58-77e4d21fd65mr8295118b3a.12.1758371810340;
        Sat, 20 Sep 2025 05:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgWzB5nkqqfDCZX9CuCLhkrbY8TKa9vwIXS5YrzuVH3x6awEHxf0i/Xsr/JFw/xJ+CoTCA+A==
X-Received: by 2002:a05:6a00:1889:b0:77e:325b:f614 with SMTP id d2e1a72fcca58-77e4d21fd65mr8295094b3a.12.1758371809932;
        Sat, 20 Sep 2025 05:36:49 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f1550f70asm2911274b3a.13.2025.09.20.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 05:36:49 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the Glymur temperature Sensor
Date: Sat, 20 Sep 2025 18:06:31 +0530
Message-Id: <20250920123631.281153-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f4aDVxmy0d57YWxuAFpVLAHotIGjMBOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfXzi0R7Kh8P+/l
 +NGIuz2QU7ZYD//eomk1UyioUhd9yj3Y5LIMOKy2kGXxlDWaniAi/7rJs9Aruyw9CPiQOdVEsdz
 jAdpcoR0oJy121cX6ap2ZV0nNwKL8ILG4MiHGMBLaYr3EAmAJoDEITihZvowEbA47nef1C50wXq
 BTH3I9DimltPjJcRLRgvuE+MS0tJR3UOGJ/kqTef5M0jRPyW5+uO6Lxlc76/95da1qAK9Y0tgMo
 cNp009E5u6kpKTPomERoKLdXtULLFYHXn8Jep0ErhRS4RCsM5TSg1geXCUz2A+WLf20DvgAeVZA
 NthLS/b7XJjIkui0VJgF54iiFyt5Sa9UwwmsK0gqsUxEa2A4amPK8NZHJO5tRnAKsZvPMJErm/r
 rkf26Rti
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68ce9fe3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8GdNKlHnjaA04NifdkAA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f4aDVxmy0d57YWxuAFpVLAHotIGjMBOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041

From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>

Document the Temperature Sensor (TSENS) on Glymur Platform.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v2:
Fixed to sort entry in alphabetical order.

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f65dc829574c..78e2f6573b96 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -49,6 +49,7 @@ properties:
       - description: v2 of TSENS
         items:
           - enum:
+              - qcom,glymur-tsens
               - qcom,milos-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
-- 
2.34.1


