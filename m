Return-Path: <linux-arm-msm+bounces-57259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73794AAFBF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BCD73BA6E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA9F19309C;
	Thu,  8 May 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRy8Io36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302918DB14
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712011; cv=none; b=SzkFDq6hWqcJM0wFU+TsKTgSbbcs+pXiBPkkt+sgfku33BBnh3umI+fpqIBBeEwC0uXgshcFPmrQ1mHySGFEpIrnuuyuFlD7+E4WS2M+/s0XuL4B3pmT5akYp2QvWltICl3Z3TaBv/cGprYq8rPH4aWRzwgSPbUStlEx6UxB7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712011; c=relaxed/simple;
	bh=yDYm68h1Bm2lJGUcg2lqsdhSxaWsAHDqK5SuFmjw2aM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SnAXBRaW5pqaHjDyUNIwY5T9ejPKOpptZsNAwjSK8QJjmPeD3k3Ju7kqq6Qqwx7UMCxXEAMczT12m3/2zBoXY/DLhd7RwJ7O9okxV2rCGFXCvVgXNANORaXlHwsK4adeAfV5Lp0Dh34wZhdIkXVPQRFm5FgiOTXqtjY+C8FXLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRy8Io36; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CinCv014355
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z+VPL5jaONVREsPq8WN451MgmFt5cHfrMq4
	6TFJpukc=; b=KRy8Io36QGhuDlS+WfH6ebBhki/2KmdVDto0B0Lla/3HF+TMBC4
	509bV0JjyN6F1/uF2Zi0NCkvMsKYMhRbnHIa0JSLYcUJefLdaPA4hovvsQ+eLPvj
	kDcyqtAqdc+1sXIKuS9LXjR74XtFRzr280XP75C9J/TmiaqS+ILrZz9y1rxgjWTb
	Qg2/MpRvFmG0C6iqN2H1oIcSKfEA5R4PPqfx4bYbLMNLewu96tz1KRR9OEBoH069
	YBn/ecimv2yn1USbiBKxdaQ0tDot1GieFkFFWekRH09gj/SgqJNHd8+Ksc6zPppR
	K9bFDURZg9e1IA7NN15FnZbOuKG6zwWZSFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hgse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:46:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30a91c0745bso1696195a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712007; x=1747316807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+VPL5jaONVREsPq8WN451MgmFt5cHfrMq46TFJpukc=;
        b=GOlIGTGaimbD4iaM790tiuCyzU6G6ugWI0IUUTF9VXU0YRb0+PWtHihxVkSfzag8IO
         7ILyMEB+HmxHsqo1KcOqN0ps2zcpvPavY/awrh4f/zSNzIsFtsEI8XgEyTjsIxZwNIMJ
         34TI9VE+T28ZTeuKc8d8XgboQUMyiwKvCT2ke+pe5MFOWHwVZo8gFBSxzIVN90Vpll4O
         1xjD+jFHOiL+6n/jlhUlZmMFLmIkNTkBJ4JFnqAV32IW2oPx5AdjfgnIK54iFcuHiuaN
         LvGPjINcnPk7W5NdnGMf9AcI6n+AY0AivwH9rKlyNgqXJj2r0uX08BHD0kjfJ1K5ShWb
         p81w==
X-Gm-Message-State: AOJu0YxLDChZZ3epDNnk3oKg0aslnsh44RDmPl6gzaqZvH1x8a1Mq3H+
	UEaHV5FR9ZYHOMh8x9yAIKwHcCu5zK/4QSQmtd+yKbHkcp+bwUj68INo5S35yEtbsY9CA+UQY2n
	j49Wzho+p/e3eX0tGo9+AbCMvMXoatq2mCylAYese0O/5NqlhEEX1QRRLr1s7kC0V
X-Gm-Gg: ASbGncsCpe9xUBEvfPItuMBUiAtxWmCdEz2H5pI1FYiCCkfKbotZvwit60tZRRFCXDR
	u2Pa6RVkkcjRDUEkA7ioOv5IzgL7CTc30EadwISDgViadgTrlktR8UpcgDL+eOJDrO4mIaBLPg2
	d2QCDD7dvvIzOQX1YMOgdC3LPBzMD8UADu2Qwwfkf7pYrPenVo6e6SzonuL/6Obpoau3wcQC/J4
	9a+asmPQG+wPPejjweBHQqlPN/ODVEn8WwWfNsPb7SfKpt3gGlCApuvV1n8YVsSx83rychmkX5d
	WPlrbgdbi00LxR4TT9nNQPqs8q8+Z8hUFbfnmkM=
X-Received: by 2002:a17:90b:3ecc:b0:30a:882f:3120 with SMTP id 98e67ed59e1d1-30adbf115ebmr4283636a91.5.1746712007230;
        Thu, 08 May 2025 06:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLHpIxclHSE6DjLVAKIRzd29Gr18qYY9O8ZT+x/Mg9QL9oz50P1jI84fERlXXPDILDciDVfw==
X-Received: by 2002:a17:90b:3ecc:b0:30a:882f:3120 with SMTP id 98e67ed59e1d1-30adbf115ebmr4283606a91.5.1746712006779;
        Thu, 08 May 2025 06:46:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eb56dsm112250715ad.23.2025.05.08.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:46:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Date: Thu,  8 May 2025 19:16:34 +0530
Message-Id: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ftPCfJbpgZ5B1MXuIoYlQUMwnoxUODZz
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cb5c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_M6AKFXzitIoBsXHyycA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExNyBTYWx0ZWRfX5Q0lcTYn+zq3
 3GpqDSoS9mKLhE6LldBGTbCu2frmC3KQGu34/S0sGNzg2D7wE42yTHeJNDlVjy4kOtYpK33DzHd
 o+BaWj0xdCjKW45VSyIQGBeacrOkoMCf18Ra3xEwHGPfj6RzjqkbCzwebubkJwvlis8JKILpoj/
 hkxoULg4InI4HlHl7UVtRk3+ldmaXsFDQwjSB+FTJdOLyB2b9pknxA1c4JUwl9KGkC2dYYPdI2z
 OWr7E84As+9TFvLcGlO9gDKeTlR6CYhCg1alcKBR4u6uCCs9SuOySQ2UNgpLGUACufAlQSLmX6I
 XEnHsZg4Nz/vv77BY/rw+CS4dgN17DhIREnCq27WDRvSX+Wzou4/DlaZQR2jPFaicyi/a+MSkin
 XBBh11fP+ferRzFv6LH6TL1UlsYt2NlqfHsW7qAUAqpx7WkB4qAmjVvaDcCnylcXQquuUi8b
X-Proofpoint-ORIG-GUID: ftPCfJbpgZ5B1MXuIoYlQUMwnoxUODZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080117

Update soc_id table for the Qualcomm SM8750 SoC to represent
SM8750 machine.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - corrected the order. 

 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..8c4147737c35 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -444,6 +444,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5302) },
 	{ qcom_board_id(QCS8550) },
 	{ qcom_board_id(QCM8550) },
+	{ qcom_board_id(SM8750)  },
 	{ qcom_board_id(IPQ5300) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
-- 
2.34.1


