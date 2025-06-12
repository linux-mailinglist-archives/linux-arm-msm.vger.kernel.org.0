Return-Path: <linux-arm-msm+bounces-61037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19386AD65C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73561897AF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 02:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BD01C3C08;
	Thu, 12 Jun 2025 02:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlFIJB8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5991C1F02
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695986; cv=none; b=XrsYAcQjek8bxgS4SmbYHtxBPYGCKRLA97WkHsY7EokGhpekFyOHB73+5HfWp1zCgI1Nf1D5y3KVbO0X3Z77WyKiXz0m6YR52nY2fxUTSDaizbGzWsoVNokRdXaLpFQMvpwzYA3WbEBY9Yfp+z8oYOJlM3D/7Ghds1yIwJh0Wqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695986; c=relaxed/simple;
	bh=HCNZUH1IAUnt3ulSXSfTFoyY8CpAJheEw8eFgdB2A2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W7Bhn6pk65d4pG+hFk5RkuTgHDRLHEkXkPai+ekn13neMOp+WCtFRH63OXzspBCDcq3ZbtigmwMqezy93NnzFHCH4F7Av9j+KR2ZwH6950QKO/J1ZgCq2tOwdkqnX8DD/5xO0i+UV1wdW/YhKyBBMFL+xWvoWZ8MzmEW/Ur4q+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlFIJB8g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BK8304009100
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=37Kwgqn9frADxf9jqKF3ls
	RhO0wSNjzOR8UmDzT4s5A=; b=TlFIJB8g1bNcwzttKbCS244gK8po0jBBFlEtBK
	Sf+DOURH/i5f5WtSFALYkQ2x/SYzIMa4+8FHPVZikLBGdm0UNBaro62Z9nxZuHxQ
	0twsBp+GjshCouSUyW0tRP8KvaJ50YSvV0NOWgiEvvsWAg3b+n4sjTThe8qMqygp
	u8MJxz/DY8ybig5hWyk5Utv/IkG9jJsvnQg4ls1mRwSU5n8JrUo7nlyzE353+8GD
	Ec4eP5SSOgiBDSxTlr12ZUH3vqxKydzUJhBfNxhy2V+U8xD8+ghZSrKESsR5IQ3W
	394Pj6PgaJ3p427fVIcMexulWh3c88q+Z0zK/wZsF4T3Cu1Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753bty5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:39:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748764d84feso651566b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 19:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749695982; x=1750300782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37Kwgqn9frADxf9jqKF3lsRhO0wSNjzOR8UmDzT4s5A=;
        b=nS7fskbbW4tefbdh0ivzb/Yk1DY5GqmY3WJo2CQI9om0lSKJXlN9AT9RdKTRTgMprc
         4MCFUKJ/QGR7YB6+qr82XSeVqX2owIRh+gdOXb2TyDxIqrhSmdQlYWpL3caIrWj7Qhgd
         GV1t2uu49WjQRUAmCSiKxwMGIggsbOrjQdlN15lmYGy0r0b/zGNpcWGy4C1G7a03AcP8
         6sVkkn1pxK5Pih4J3Sjzs42J6VtGBZrReUfS3rZkYYeScugdR/xntDr9XXTDxpN9sAMz
         baISHTPS4hEmxC+YLeA3s6WMzWFlAW6faSJFlhw9Ybt8Nqr9JzJouepOwSS+z0vYRejx
         sbRw==
X-Forwarded-Encrypted: i=1; AJvYcCWdR8q2Ve9T0b8WwTmGOQIfLkm3NizeOS/2YM6VdniRgxyznnSrSYEVMRDyxvUgnMmEZH42SQROAonDYGng@vger.kernel.org
X-Gm-Message-State: AOJu0YyeNMjyLBa0yFMKkS0TKJXlr73pPGMzFvKEkKeL0FoT89S1o4vV
	X16CVoKZQvfp4SOn9GvGFEttNAweczb9D0FhHI12X5bzwJN5cVZ3p08iau9uWYPiCDTzRUPjlr/
	gyTNVBfWfWClXTlNL/pnucaZUCnWJQBxH0hlL9ay5QMLkOa5nS3gQZ1B5AlTfa/WcOUtFScoPcY
	RUKwpMGw==
X-Gm-Gg: ASbGncvzRpF+jmFcMa0Cwy5uaXXOAHB7r6OJ9Q1MUzlSp7pjUmbbj3arDjWPhtCB39N
	/H6qH0xrTEDNN9cImP0P+qZe5qSvX3lNjiZ5u9oVdoTBYD/qRsAM76q0dMhRlqaVJP6PrT1EtVA
	l0rjivNgxiEmxKjdbdmdEPVvFuTYoG4ZVUgwy8hMqdxpwH9ae1ewe3HNfTVItCO78rbz2eAIW+s
	l8JaaxgDynB1nNgczO+t5xpp8qhcJpX0iZ7gxmKzJmmpgavKoFdo35p7gaUir/OAXz99WZjqSms
	jiId31SUMQc7nU/xoh7+aRtjWWJ05WU0XpBBh3ZtBATJ9cobtTd2m3vNZ3iizunS67Uv4sWTtRg
	NDFY0rMywvDKonLUW
X-Received: by 2002:a05:6a00:999:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7487e2f6504mr2011245b3a.24.1749695982581;
        Wed, 11 Jun 2025 19:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+cjNHG1R9uaj3OBg4rjmsuHSMyNj3HTY+Ag2Wxhe+xd/5rSdTccqkaFHSysWPfWveqUu1xA==
X-Received: by 2002:a05:6a00:999:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7487e2f6504mr2011200b3a.24.1749695982053;
        Wed, 11 Jun 2025 19:39:42 -0700 (PDT)
Received: from lijuang3-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e640sm315835b3a.4.2025.06.11.19.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:39:41 -0700 (PDT)
From: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Subject: [PATCH 0/2] Correct the ready and handover interrupt number for
 sa8775p remoteproc
Date: Thu, 12 Jun 2025 10:39:31 +0800
Message-Id: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOM9SmgC/x3NQQrCMBBG4auUWRtICir1KiIhjhOdhZnwJxWh9
 O4Gl9/mvY2aQKXRZdoI8tGmVgbCYSJ+pfIUp49hmv189KcQHBsg3KOWLsBae8yGCHlblwpjtzC
 HlBef7vlMI1MhWb//xfW27z+WLWOKcgAAAA==
X-Change-ID: 20250611-correct_interrupt_for_remoteproc-9cc1af90abf7
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lijuan Gao <lijuan.gao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749695977; l=875;
 i=lijuan.gao@oss.qualcomm.com; s=20240827; h=from:subject:message-id;
 bh=HCNZUH1IAUnt3ulSXSfTFoyY8CpAJheEw8eFgdB2A2w=;
 b=YV/XoaWSZifa98T4aXdK1ntUQShLDBiXKzEGqLvcjgXM5oPl8x+5rVFcHrIjIBkG8up6fdRfR
 jaOidyRDM7pCbgtGp8p/1mNthZKo1qr7ixNCzFAm68Up5Hj4r0bJSu+
X-Developer-Key: i=lijuan.gao@oss.qualcomm.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAyMCBTYWx0ZWRfXwuhYwRQf0e7/
 418O2NONArd4BEVMRQe1nEWfHW9a3jmH3ghfrRo3GBS5I+C39mLEHokVZrWxNA+CNjWH9LX5rTw
 z0GOaliGMEu4E2j8qGNB66x2xPYdqSgVpxL24pbPCLkeSLYF4RclbnS8S+0lUdPbAZ0MUESyqV7
 RQfAToRrz2nn+LdSbwFRcFJgivKmlLLtr0WBGtFBMOAodII8w/gNM5I9FuFkJ3hd3ecguA/RXnI
 mva6RS8p92w74MQgQ4HVFoUgbM13uWEDHBNmcfdxbEoK8QAwUCBmBuKChBcprNPf+ciHc2e/0+9
 5VdY7D40WmIpoxMRApfwNeKpYZ7oV+4H8OvnwalwmDuMPubx1bdCz42ABe0VetAYSJxo2wzGexL
 Pdh99zvcBp/bjb2XpWQDGiWdfHkmvC88+HW12lfX8qmsuZGSrC4qSgOcKub7bKPtukbxgjMw
X-Proofpoint-GUID: jKxdOQ42jGPqUQhhr_Laxd9q6gK3uK9e
X-Proofpoint-ORIG-GUID: jKxdOQ42jGPqUQhhr_Laxd9q6gK3uK9e
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684a3df0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6xOPiwoKqXypAXGmrmYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=695 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120020

The Ready and Handover interrupt numbers for sa8775p are incorrect. The
correct interrupt numbers are as follows. So they need to be corrected.

Fatal interrupt - 0
Ready interrupt - 1
Handover interrupt - 2
Stop acknowledge interrupt - 3

Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
---
Lijuan Gao (2):
      dt-bindings: remoteproc: qcom,sa8775p-pas: Correct the interrupt number
      arm64: dts: qcom: sa8775p: Correct the interrupt for remoteproc

 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml       |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250611-correct_interrupt_for_remoteproc-9cc1af90abf7

Best regards,
-- 
Lijuan Gao <lijuan.gao@oss.qualcomm.com>


