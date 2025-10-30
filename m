Return-Path: <linux-arm-msm+bounces-79746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A84C21BB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DF133B7442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5CF25B31C;
	Thu, 30 Oct 2025 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKK26kqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AXtjIDlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B442E2F05
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761848421; cv=none; b=IHrb87O0/7ealoS0kav1qdsd2XJcsilsaf/gdP1BA5+KlhJIvR3tRt8ymBu6/xZwcHgN6w1QN6OWJ5ujNWuiNvbdU+5IZC/3iueXG3PtU++IZXqB2uJErYc/3kjx8SPJnBv8nIsVIbIIdV9sQswMIe9uFmYSiDKgs4Md/T/8wkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761848421; c=relaxed/simple;
	bh=5xP8+4rP7ynBZz/qPycqSQTi5O2NlQ7OMGayAdVqr6E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FAbDxknczhorZRBk2ZFqFtw9aNTvqLOhqbmJ4ZLwiGGXKrt0lqMGAo60vUbe4rZJKSDfEeN0YyrgN9h8ESwqBqNJjszMlOyxB2dOqMsqK96+R4gF9sz5sgVVNfkbLxVRCvVlqhM3w4ew4qAzcO4ZqzGuZQbgLOxmBv8mziTDVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKK26kqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXtjIDlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UI2GGo3117016
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VrqIbmGtF7SrQK/qdTNg8W
	lvealR4T3AYcoZMnwJb8U=; b=OKK26kqkLDvWfhVdvZbcipmSaFSFQ2W+WNLNpA
	duE1WTbhmBH/sGo61YhdfUXKAVvkmGey0qcny5VIzZO9VnEKqKJ74kxfz2P6wv0n
	vSeMQJINgE5cvNMXbapGTwRqXQvAo4QKzEqzPYs6fdnDo96FcvluIX4uT18ZZks+
	2GmPCFp7GYzXt7dZC+Mso16d4v+FyD4zSlYz1iW6+mAu5IGir8D1k1JlNQziDGlB
	E9PdsFRnUJ9bns4Sf5ljH5z/Ee1V/MID2R2TMPWCGvwjorjeMtFxmsFm8d+gg3jk
	VTe6/hmqr540YQ8OAlpjJOYohtQkXSt43+fCBDSZxUxt6+Yg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frhgkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88a5e70a7so42792821cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848417; x=1762453217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrqIbmGtF7SrQK/qdTNg8WlvealR4T3AYcoZMnwJb8U=;
        b=AXtjIDlV8UVwpVn04SjTCckw9qZvuYDmn9Kw0sgp1wauy8VALIyQ0QHHtu9xT/bZUW
         bBrDN0tqKyTjwGTg/3hhQH/VEKjbcm4Jerig6NghQd2hiDRONo2+1U71zOgLUFgKqgmj
         D4jQwI6UlaZT/jGAr1FY1KRowLENS4HOIFF13Fhciun4AcybMD8ywBPKk8T0MGfeRbsW
         M1IV93++jwoybX+bojLL/Xx1oypQzG5hvEMNjH5/T2Lf2bhJb8ikpmhCTUKyjckN1V7z
         T2QT3zBeyghLdc7xdJWbbdpbfnQekpz39dQxgLGJPBlh4naJW211WD5/q3dv8VwHjypB
         07ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848417; x=1762453217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrqIbmGtF7SrQK/qdTNg8WlvealR4T3AYcoZMnwJb8U=;
        b=JMqURN8Znx3VclqVG2shIC4+akFTDrd1p6wvaz179txzOh97aD+br7JMhQ3fH8l4P3
         NEiZgEuSDruKvxR0YB2LB4lAmBOJeLT/GwBdi4t6Fu9hfktsYQaCUkJoVFdSeST/YyCY
         L3rF9+DHETDUD7YABh8sC3aKYryhczb71S0hhdCtwiwU58mbSCVrBPewCprZQghaz26S
         SXOEjJyb5e3cYjpNKCmk0G2HwZu4oVamoxu7U5EmhOOYwovh28b1mynGWEmvtxsVkFx2
         CXNq4C1AFpNVZ//NzSEJAyhxRmOxM3Im3x7EyK8Bh4YC8H+YLdEUV/7gBSbtydV2e14L
         gr+Q==
X-Gm-Message-State: AOJu0Ywan/GlIu97+rPflhPp26NlH/vv4wcxWKcS4a2cIitj/1LYg5YG
	nOMd4BLiDUL/bJDklhO7f/JBnyyUAiA8WcmpOE8dkkqKH2WiUI99f6BK18l8tBdE57H8xJHmAoz
	hwvIRdUHsDYm2bSHjhVKRZEoSpNRej4ovYGbGX6VjY01HGzTI1AA7t4tEQZEEyXDSwXYP
X-Gm-Gg: ASbGncvrrtdU2hlgPY/A7QheVDqAKZkYFM8AMuF8JftroDUSgw12hS4WyrdDQW3rD5n
	Vbk1poTs3XOTb5ywvMcA/9pujLhiuwdM3H/UCyonLI03pm4daK/YiAQfzSln8atG0i/eBUYZB9d
	0JKXpZ+ISNsVF+SCjqL2PSOCRJbw53DEx8TQjTe9ez0qzEYwZUjs6nPqMYTdQwBj0klEjKeb76t
	qmgD7NYpfHlvbCQcorRH9im1+gqGIV8Z14T0jy3hoSzCzsyLID0bEanXGee+bMaSxbC53WKgADi
	OVvvjw2n0MqRDjAkMKw/q8sEbzNQ9tYU1kOZZDGxnpv2gVhLLIWIA95Cikx1yhs+K8xVhLNlCIF
	yfSMaPWC/yat78ipEVFRN3lnq2e0AuP4oMmLbfhMiIozVKGKxfC0iTan0AFAdpGBWXhZEOTbi/t
	/mwcdmekdhP7Rc
X-Received: by 2002:a05:622a:1793:b0:4eb:a6c5:f6c4 with SMTP id d75a77b69052e-4ed218b299bmr52393181cf.24.1761848416772;
        Thu, 30 Oct 2025 11:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoxZiLZSCojQg5w58LesDccbxK5rdGeSMtWV+HOmxw12ucoPv1euhGuvqr4mgLUoXvIx/8FA==
X-Received: by 2002:a05:622a:1793:b0:4eb:a6c5:f6c4 with SMTP id d75a77b69052e-4ed218b299bmr52392891cf.24.1761848416315;
        Thu, 30 Oct 2025 11:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a15c5436dsm3843171fa.33.2025.10.30.11.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:20:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for qcm2290,
 sc7280 and x1p42100
Date: Thu, 30 Oct 2025 20:20:12 +0200
Message-Id: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFysA2kC/x3MMQ6AIAxA0auQzjYBlMWrGAeEqh1EU4wxIdxd4
 viG/wtkEqYMoyog9HDmMzWYTkHYfdoIOTaD1dYZ3WsUSv4gjHdGi2agxQYfo3YBWnIJrfz+u2m
 u9QOX27KDXgAAAA==
X-Change-ID: 20251030-rename-dts-2-14eb2cadd05c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5xP8+4rP7ynBZz/qPycqSQTi5O2NlQ7OMGayAdVqr6E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpA6xeKC5fWF/bFE5Lau8y7qphYnMImPnJucSBq
 Eg6nTiaPyiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQOsXgAKCRCLPIo+Aiko
 1egyB/4vFPnu3JuHoOvl0vqIGRUQwrnuJ/uJch/ssaEQQ1lpv/yPhXCURjbp8wJQOpoBqLp27Hi
 KOIK4CWfmy/GrCUARlMfwIMWZz1+x1FOLoXzt6hdECV/SMnAShMDdQJ/LTRZhg5ApKzbBlZaNcp
 PZ5EkbyxGRS29eJFqz6eV0MGv70SqutqTCONcjCR2xRSLu1Jrj4StyR6MjrUQDziUILKrgCAITN
 G752yOnxplAFzFiMwBGrPgkeVOUd0t0T+3sX+f1lv2i4KflkYGIy47bjj+TsLP2BNnnPRCWJDcf
 XqLDdvhsbv8mU70/xBKzKd452f1mDbmRkw6xNX4ySAx8Mj7h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=6903ac61 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WSwQQHQvUKblJ0kXEVsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5wSRSUaf0X2YSvwXXXFPX4UDiqdMXirs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MiBTYWx0ZWRfX8p07LJpuqS3q
 FYKO7BLqKH6yCJ4tIYoL7cG4AFgn4kNGIxwcT2GFc8orS2fTmnvGPMw7Nm0gbcwtujPTWNXv4c9
 0FRpiPSwu8JdLY6D8EdriX4BDy3IHr5oXeK3HB7GvhjqAmKlTAufdUiLj86QzE8wCKZvcTa1nyF
 pKP6jnuQ3DD6PxMMXamz+KcxSgSuXlnRLmyJwiE7CbPujHqMQK3UKpH+0gttAjwbnxYmEDyPyXi
 P30D6A6hzup6vxDNsGGuKrDulriPj0NIOmJbnt5NtQ8GuEf1B1sIsul7/achQWj35MjiXD/hjIO
 JYanTfvWrshYz54w3dMruuPiV530RQC36TjqDGsHQerN7OeuWW5kup93YV9PnLCRxMEhkNAUhZz
 BjnZw5SWAIGKxBYjaOxPQmlH3W0MPw==
X-Proofpoint-GUID: 5wSRSUaf0X2YSvwXXXFPX4UDiqdMXirs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300152

Follow the earlier example and rename several more base DTSI files for
the platforms where we have (or expect) several SKU ids for a single
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      arm64: dts: qcom: rename qcm2290 to agatti
      arm64: dts: qcom: rename sc7280 to kodiak
      arm64: dts: qcom: rename x1p42100 to purwa

 arch/arm64/boot/dts/qcom/{qcm2290.dtsi => agatti.dtsi}    | 0
 arch/arm64/boot/dts/qcom/{sc7280.dtsi => kodiak.dtsi}     | 0
 arch/arm64/boot/dts/qcom/{x1p42100.dtsi => purwa.dtsi}    | 0
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts        | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                  | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts          | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts              | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                  | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sm7325.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 2 +-
 17 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251030-rename-dts-2-14eb2cadd05c

Best regards,
-- 
With best wishes
Dmitry


