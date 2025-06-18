Return-Path: <linux-arm-msm+bounces-61755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A60ADF50E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 19:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D25B03ACBC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 17:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A06B2F949B;
	Wed, 18 Jun 2025 17:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5LjZ62h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AED52F549E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268998; cv=none; b=U/LJ5Zsj+3Uo07Jrb3q+y6cryNjsN0eN06smIZB+PFXFYpTjIpQAXkSD00za+U8Kt89JQewu1HFb9KcmHEdkDXO5i8ey1zlitz5Vco/61bEyGs3P1t+w+ZcysgvRnoGJnZvnGGwffqPFc1LJOYwwARFItE29cF9A/YTDEe5CehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268998; c=relaxed/simple;
	bh=9QXEDoI19mWFxCahL1UdCvEjFuKYp7fQOj2r6nsOxEg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/TTtRyihFTBapZyZGnDliREpvax26ACTjLEAbEHLqO/TGa2IApm78Gz3+3GugmH29eFbCFIokve9cdjnvuKHdq1Cdjau788WzTgiTVotdf0u1nKu9twUaisXV3IE+O9w9acibOYCren/rKpsw5uWiZVsQjJ0JZ1ZW0oW2PRI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5LjZ62h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAjEvi027539
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6KcFqDLk13hgOnopRV7cxf
	ycwpTo2vObGPCFt9jCm+k=; b=M5LjZ62hOrvH3AGLMj+grgRbIuMyMFdvCFQAy8
	ezw78V8b4sUBlJ2kWZ1l4mIB406pxpWsKKSTpDVryZr4OUU/aXC6mVa3mCa0mMXi
	vmm7wouJsLxhQV04IByXH49tEQzgat/LecLj+hnZ4LIhckMKaqRhzgKUrxHHupT3
	kp/TwohqnGcb/S/P/2RCj04K4BpiF8xRX7B42BAFMwVUYo/w7aqPvFyXNs3jCGem
	S++a1JJU7bCT5wiv1weWSeXo8O88jMWmIYxQ9Gx2QOE4tGeeeUEUXjiOy1U5ShDf
	NxcSEhZsFnigxFlX48dr+jmRYuzUoHlJu4u/7BciDX/gcYPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd57pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so1751313585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268994; x=1750873794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KcFqDLk13hgOnopRV7cxfycwpTo2vObGPCFt9jCm+k=;
        b=bO2v96VFgff/KVIsW+MXIfv1Gee/cpuusC+JeRZKj90nihNQWGuakKYjxp7pDlbDrx
         tyJJWRWSeM06XlfXnD75rQf9OyGt01NNpsFQuXAIy2rWbnNOETYAxqGYI7Szy1i0pw2V
         kHf0QWWN95ECevp0qtDwQ/JcUU6EKR0vfS2mKQ1Jp5TfZzxvnpS62naBPIbuYHxFIHII
         R+/XVMEUpQmvoCKjVoDXXSYXpFZOjIdtFlE57psA6+5VN8vkiY7JjErlQEl0879gBkTy
         rOdc6Q/CYx920JjBM0/DYZGptnCSTxche+QO9k99I+ylXj2sf505Sl6NxbjI9OkNLCS2
         Vaug==
X-Gm-Message-State: AOJu0YyMs6Kt6H5iYypDobu8NPcX8QfPt7R51gw4bHVm87P3v6rp1IqG
	s5ABwVHevzQZOcgRs69vNBNQ8w3Sg8791ScdYXtHHWRQJkRkfvfJXBN0s4tfGZVIoGeLXD/uc7Y
	wZOnnIJQCkovqhpUUkAkRC0TtE+TCXZMK8iKYOT3QxhcBQl0OaQGYvd0StFxKD5ucSpef
X-Gm-Gg: ASbGncu8F9/EtMGmfo55hBVVG4a6l/VYnUnNOUEFuvwPz8zo1ZRs/YcGUMyAFocZa3c
	WSkjSbERD830r/Kds1P5iR2ZcLtya/ud8fceV+IYomkoDF+wPVmsehhLObSf59T8kUehB91rOEQ
	7GXrZ4o76ed9p0pOESiTKPUMC1JT6ezpOZvfibfnVDo/QYvbBsPhYHbUojoLwF45A3MlzcYtp8C
	3Voyd8nhiR1mB4JJL0GwaYbMPWBd+B2nWIRZK4Z1j3sIcG1TJdXZV/qFSrjwbFcWBsqyhepdV58
	+Ux3cv8Ulr3Z531A+eH7GuWk+kWMtK4jNXOGwdGaXriZ2m2Jkay/zq8J92dXbC1nfZ+z4HHAgNQ
	+LJX98kCNfAWOio7Fnexyx22d5Oqe8Xf1FDk=
X-Received: by 2002:a05:620a:f10:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7d3c6d03284mr2687715085a.53.1750268994456;
        Wed, 18 Jun 2025 10:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF60X/jqz7yMGtPiVnJDZu6KGocoOhdfxhEdsn4Ftu0Gh//3WaeGd+GFWfujYMkVHyzNfeH4g==
X-Received: by 2002:a05:620a:f10:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7d3c6d03284mr2687711185a.53.1750268993986;
        Wed, 18 Jun 2025 10:49:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sar2130p: correct display controller
 device
Date: Wed, 18 Jun 2025 20:49:50 +0300
Message-Id: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD78UmgC/x2MSQqAMAwAv1JyNtDFDb8iHqpGzUEtDYgg/t3gc
 RhmHhDKTAKdeSDTxcLnoeAKA9MWj5WQZ2Xw1le2di1KzN4Fm3DhG/dZBKMrx7JZbF1RAO1SJnX
 /sx/e9wPG9sdDYwAAAA==
X-Change-ID: 20250618-sar2130p-fix-mdss-a14b47f065e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=757;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9QXEDoI19mWFxCahL1UdCvEjFuKYp7fQOj2r6nsOxEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAAgHHcqI9vhl70FRO/ughoHUAI/1rwy0OW
 iHqdb2wGIqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1W2SCACmp9viLbwYyYfaNMpbIJPaDcO+att9+XDvgEFTXnFnXAWl9aPY58yrojqqv4NonwMI8AI
 EBeYewKedPxKkHKw07i37NNwK58TKV1gv8VWYSpE2EOAAE1Qw307LlHF8Vyux6WTz3mVqHpoSQf
 UzfHBnZtqhSWw6XM4EWJx26B+zTIwf198tcLSfPJa2FG+lkQezk5GGfLQV/tcK5PAKtV9Odlawq
 Bf4rT8rY9oJkE0+C3sdz+dCNsRyOoChsHoL/pAlH+TFD6zUGFppMAe9jXGi1bOdwZW1Ph/fde4T
 65mKmvzJjuRc3embXCQd0Gd5T54lT4WrM9DUkJmJEThHRwEV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MSBTYWx0ZWRfX5R1puZOVD7/Z
 TWS/R8BP3cNOvfm0E4qCkN+7witG0W/+48njDkMvnqVUuB8WpFlOQlXIs9HOHWpEmgn1NxYoW9d
 5h7yXIeqVWTHo3RuNYaYha24yrZssy5X5tlOUVGf7n3zMGZLwN2N/jLQ3Ne2QhPvVZZCMX3SIo/
 KbTKDlJYKphlFZjQ/OvzsCAOh/tUJ+2VXzzet0Sanwi2QMAVdeBSmRWQosyUksZCmxSwGVPr7Il
 c4CLuhIRRHYwyQzXtalMY/hhD579cUUuw2GGv+TfF4iDSMaeFiZ6y0NlbIhNj3OLkIOzJ0l2O6M
 vEmnQGbFTv7Yzidp6Dwep35h94vuhk4PBBdcAkxSNpqGHv0Qx2SrxjbidFMr+5fC/cygVLtqGH0
 j+QNcJ1JNccenGP+UYUWsMzLS2eDwWxczGwyIlKkdIZR40ytNs9gAlr0JMBtVh3DvBENb7YV
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6852fc43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=A6ng92C9FvdBp_T1eIAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IdWhIOgrRGNmGngfWYQSAyA3nlHfr48H
X-Proofpoint-GUID: IdWhIOgrRGNmGngfWYQSAyA3nlHfr48H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=887 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180151

I didn't notice that Bjorn has picked up v1 of the SAR2130P display
patchset instead of v5. Correct several mistakes that were fixed between
those two versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's mdp0-mem path
      arm64: dts: qcom: sar2130p: correct VBIF region size for MDSS
      arm64: dts: qcom: sar2130p: use defines for DSI PHY clocks

 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)
---
base-commit: 6e5ab6fee68df8c40b338baeae6e269fa25a7e25
change-id: 20250618-sar2130p-fix-mdss-a14b47f065e3

Best regards,
-- 
With best wishes
Dmitry


