Return-Path: <linux-arm-msm+bounces-65276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B9B07946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3743A1C23B95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C68627510F;
	Wed, 16 Jul 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShQTeKNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73A233148
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678523; cv=none; b=UFRv0FoiYRqp7hiy10f7kypgLSts2/dkaRi1G5dtnRnLONYvKx46Q9J8MLrd4QUK9LrPDgtq4aeFh1lD2T9hu32UAfL226CmfJvGWwVozBHGAt5nRaLa1x7A3rmkDK/g5SUJscqV6Cjg5+Y4hjIBvYE0hBtvzRo0tzoWhXHwpNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678523; c=relaxed/simple;
	bh=G1nVliCnmzaZKVIsXaaQHYG47ZKX9UcjtGfXLbv0qb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QxhU7hYzfIIhfl0O3qknX3UH3qtUjFtluEJHwVoVYGlAysJbFqtCVxGixxPvceMHJvNnDZo9hLVs9mjM4/Bvw81dmQ8zDltETCjD5yXqhf4BJ4T00GOFSOkyTTv506LBeC94GJVZZjFDW9S0camFomtFMcxWc3RD83unQ8ncRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShQTeKNX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD7Gc8024588
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jF7y2iBjbtWTZClVXRgp0WACQ35CdQwsZ8I
	Ng6WcoeY=; b=ShQTeKNXcaiKrLYYTo3KDSqtHT1xLOqi9m/UGbMuOxg6h+w8D3D
	XIwL6+rS3SB+sHZyd8DJPp+lFtd38kkCqkcWFQOfF/wfxmFYjPqKYV2f1JILmBaV
	4kaqvB9FI0OxUjqSYtgz3/wikS5QjaDKTkCChTBGbORv2mpQ11JzkLckoOJtoobc
	DKbxW01W0BbccrGQvUUW085wITmjCMhnhXWW5mBN4eNjNNAtGWMX9h8kUJIR/KYH
	0F72iOsseBbVHIe2rLS7g6CVkF9pPvMOcxxNh2cgQz1iRwZ40srW84q+R4XxZTr2
	tWiRiskxjccoWL9VZIZIS5GdafeUM8ST+XQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpfch3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:08:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ea83a6c1bso13783b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678520; x=1753283320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF7y2iBjbtWTZClVXRgp0WACQ35CdQwsZ8INg6WcoeY=;
        b=t3Q7/cMjkxHbdI0g36gL5TKOOQzKkeZk98eJAC2hZanUGD4KXctD0fnjLDhL9B43PE
         z34Q4X5mcLRU2TvXtNTtd4LWr/7J8tn7g9h0R42GQmlYJg13BUOd2pGkDx8vENnqIeKk
         yNGrqL6hgeF1s31z85V0wc7K4cbG+/ilDRxSOZQChPM9YnH1qd4THLBWG+8il/VwDKZR
         7RwFH6obI6WE5g+BrG6KeENXTcnnES5ygJgIKpR3sGun6ArM0xXDNl/lnK1U6N6JJskO
         W4aJ5S+cDyUbz+3l7E6VclO26B9bCjDhqIFFbeym8QTJAyJMBQBTvyxCz3xzqG7+AMmg
         Gkcg==
X-Gm-Message-State: AOJu0YwfN6JPGvhXsvwQNqStbjQ3r7WVTP4RwULDtFRL0ScNDzR6f1gL
	sC8/73bWONtQfaKbsU6c/+sJT7OyvpbX33wOaHhpHO8BNPIPUhOwlp9YhAny/wfu45dkNc2z/J0
	lhrUX0ZH7C9TolyZ0ZraEJz2GAUwaZ/I53uof+mkRTTYct2xGnBUEfC99P8sefrdknr/LvvV0Kz
	W3
X-Gm-Gg: ASbGncvgzAHc5Svuz38dedAIUsseiKMYQsjsh4bqgc4JRS2rI6EOp6sBxy0txlk34Qe
	wFa0X0fOKvB3P6uhAm2RCnLPpnQS41GryLFMYbe5ct24zO2EvO6JMaF5ijMebLBJTS9o+JkjaTh
	YG+qzbyfliRQgvlWnBUqooqKE9mV4zoqxwsYpsYiW2PJOPEO5+YBYaO9L7hHuYglE6RfZpg0np4
	HDL7kN+zl5eRq3EfWKFJUzS1qR8LDdhJVzflSNW/DBfrvMeh2V695WYg9Vd9lhlIM68kk7PU8jp
	bUDTWjSgDq1cXzt12Zo/PXoNiH5pgVHlehG/0wU2yjgjB6Z+bUAjhb4LlYmrez/fJwgdj55QRLL
	vgdzU9BKwHKfdeS6KYdaG3LoF4NK2Gw3sE3K5jmTCPsRJ9BuXyYA5vBqfL4/K
X-Received: by 2002:a05:6a21:a49:b0:231:acae:1964 with SMTP id adf61e73a8af0-237d6619ce6mr5935023637.14.1752678519789;
        Wed, 16 Jul 2025 08:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTljLIiwrNjfitBK7JN+xDDjLzDEY+wWl8eWMhJi5ZOmlYuSdStPElcKVWfC4/fzhmq/TqVQ==
X-Received: by 2002:a05:6a21:a49:b0:231:acae:1964 with SMTP id adf61e73a8af0-237d6619ce6mr5934984637.14.1752678519318;
        Wed, 16 Jul 2025 08:08:39 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6f56a9sm13713112a12.59.2025.07.16.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:08:38 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Wed, 16 Jul 2025 20:38:20 +0530
Message-Id: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNiBTYWx0ZWRfX+BnyZVodVHb+
 YQjBU86yHeqZYerJeUAUATU5pQdl+7I91TallaXa2Wq0aJxbs9BatCfvFd1SVvO3ObqMM+ci/y7
 +kpYd56dCqgm6M1obc+cf1NDJDxgZQTJsT9W0/k1OACIhqrSaqTojSZ0XpFTIkCLsdmo9sdvXVg
 pO+m+JZmPOryQNUe8fyOgpDygZ7wnL47daudovWKRNCXj/A81TUJM26rs80tWdIKP7CWtgVbRhj
 mKf/4mdb2uHJ2EZV3oCTRN+LlOcFo9kfIF771hQmsfGx/gm3dvnE/+v/2STJJz134TbZ1jkp85J
 3UT9/NCQec7KU4cotBJQVQioX0pb9X2/jomxS02DYeIeNJqYRts/iDjmZUgKLZLYvbeARgFjG2L
 hTnVBYxBH/gV2x05EU1xVqqhxwLw5jnAnXlmDafljtOORn2f4S2MXhIWMB+z7q4U7cJvzI0J
X-Proofpoint-GUID: 10gnnOunhstZMet_DcXNxH6E-asxXL54
X-Proofpoint-ORIG-GUID: 10gnnOunhstZMet_DcXNxH6E-asxXL54
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6877c078 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=5822FIV8dQAKtubfUrIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=801 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160136

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
Glymur SoC.

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  167 +
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 3201 +++++++++++++++++
 4 files changed, 3379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


