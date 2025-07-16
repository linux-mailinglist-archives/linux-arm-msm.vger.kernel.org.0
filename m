Return-Path: <linux-arm-msm+bounces-65283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21166B079A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 387B7189885C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FA12641F9;
	Wed, 16 Jul 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTPZGPzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFB199939
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679231; cv=none; b=G/cT1djsa3iJK/Sl4zWKcn47h4Xe5MVo86zsFcxvHc9A5r2omAl3I7qyDK9oEv/R9CH3L27Ftyn1upbH0aFTrt+UUKCJU/gqUmtVtyrpFBWwMFGCwXMf2kJscvpDwWR9xhHDAV2OBn+7B/7UrTmuJEdmni8T8995kgmnpnaMBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679231; c=relaxed/simple;
	bh=BI6qVlMF3xOeCX9WCFqLZh1Xpl2v5uGPz6zfIO0mzlA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jyzMGX7cygcpxE7XRA6ZMLNewj4NEqTsFFiElccK9Wj8Rb72boKSjXZL9Uoap+ORWJZnWAvUNF1e7l2FX0RWQp/ikTc7xUfbBlIl/SreqjG1D0dBFLQhdFBZKL+oFo/gBX/yj0R1tGwWtNAzV9S+lxyT62j+eHB8qyAedYBZsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTPZGPzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GChHxJ024266
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+zNBS1PmSdDbKE+Ml6xSeir27yoPaFDEr7o
	sJk1m7ps=; b=TTPZGPzJ2Uql7GDggLh+Hp9ps+qhB1w07cCZiRPLWhO+rZIU9pR
	20Gy7YRexSpfaRnr21+qKkjYcdQTJm3FdQJKUJmGPw+LiUgT9qeRP4ATg8zXrHVH
	62nP8BpRijb1m7YDaDLzWrHwYMiC+iKegA1bk0eNMwbkElM6NkoZdthWNIBqDLkP
	ufzu+nDyscZp4IsC9o7wtlIhNvqAm904l6TtRi5bHWM4Gl6KgKU8Ws8mdXLXnwb6
	6N/FGx1mD3ngoqgipXN8iSbntUmEcC95UDN1CVpxsDhpSMuoqO0F++YHrDa2g3gL
	jCDS0Y6Tehe0xEyQm5yb0lWJ5tfixY2ihlw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrun7jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ad608d60aso32515b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679229; x=1753284029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zNBS1PmSdDbKE+Ml6xSeir27yoPaFDEr7osJk1m7ps=;
        b=fl2kKUaHSNJgCauQRKgUhCOF4h7OSmD4SUKqIF8DHHWGBVK/WTdK4jfVYpV9W3wReO
         j9efff4+idGew9C9DDJLilSNotCMiDv9j0idFwCoy1/idD1leehN9nvyYJw/x1nhqonm
         7/pI/4hVc0/1qSxQWZiW+w7aHGY1Q04lxRWNJRteNR9lmdbWDpXbuhDLH31Jn8qOraMj
         6z7OQdVzVJQVeDJx0LiWWuKalSV2Qqxbj0rYyKGKZu3OYd1i+zUBw1luI1i+AyQIn0yw
         ntj5tkk+dvT53v4rVGkV/Ots3Rl3pMYmi6AAeqxfkGSbpSr1xkfkcBSGOdByPaEBaPij
         ApmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4sCk+SvyaNm61OIqzUPGmbaPHCFxwo75Q51Hp070WwcwVGXT2mwR2FNaYyIGJShK0wAiOaDh9UmgeePnb@vger.kernel.org
X-Gm-Message-State: AOJu0YxGI9f5TSaEOdOjtaJWx0A53tb3wDcVkltdvfVItIihAbTr1smO
	dWe5MacToZHzPXYTXJBXzQAx7DBP1cCZIptkcnbSPh4BFkXG6nc7UgjaIfXfk1U453UTMvkj38T
	S4zO1ujJGCC8FQq1RPHSHp0H5/AE1aolwq+0lsOsjm3KKKHQ/kqDNOEM9LXwA5O34Q+Zr
X-Gm-Gg: ASbGncsproraJg32Rxg30xiOFu2zMjvRmQRtts3l6PGtWJ4Q/kVmJMGa9KYD1DUKK8N
	0kPK9YSuA0ppv3q1lASfjxnJR94mWqAZioNmo1HEefZO+kpd2gSmYHioxcK7u9c+vtlDqt/vEfo
	YZ1y5ivhzZy/IU+nUcMI6u4uoSwGsIEM7ANhLZLyKTuJm/G6+Ex5YYbMMWtlFk1i+XMcFuj5vob
	F8IzieiRLRg51jUOPK+Tq8lB2dZ6Kkocm5+gxxJpvSJCs/+uxbescYuwaf06W4Oam41yMAxiYT6
	9nJv5X4AVWy+fHmgGXZBeTf5Es0vgLcRcbd1bqECUPRj95+o7L6qqP/RifP8bobme3S6vFauMwk
	0UGplzLhkTm+I1XDvy3HDcnubjg5drebBBdm595WmVZT4yFCCUjZL0EQs6Ocm
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr4639878637.36.1752679228823;
        Wed, 16 Jul 2025 08:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKwU6o+tpWlwEXgv5gzHLfLU5Ajgm6I1bD672WOsYEy26mbRK7YPdMqUcJVLXOeBXYIhuUrg==
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr4639840637.36.1752679228388;
        Wed, 16 Jul 2025 08:20:28 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:28 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Add support for Clock controllers for Glymur
Date: Wed, 16 Jul 2025 20:50:10 +0530
Message-Id: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UzO8OYjkngya_jA3ogRUN7A7zBrZQy3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX+uPRUUCzizEx
 qGVvA6WTYrnYpK/vvYoKBssEHIn9n24K6bXr9IzTWGlnOjwI9+Jp2atOu+FA5jDKLCuoWDjxoDj
 1IjQFBxsBbzhwc4qq+sNlzkXI4/JZfW0wJAMcOuUgcEDCcWzg5S6UcvU06k1+BtFGytiu6GmHlT
 yd8GCkKHRMAckQd3e3dfcmGJuC4XPIUEfUhlPOR6AEilyv7Pp6FoBWjzQ3SsSvsW6wWNaIBDRPU
 6C7VJDr/F8ybBqm6aLRf0m7SsqMv8tqlOUCxGmNl2gfVG6Pc1RxVS6yFMbYC39JuYSSheRom5Sp
 0XmfI/SZu3XHha3k7R/Z3YnXh2TtLUT6OBV9m1ucUhTmx/SAcChnyxKhijitFHNla4XaP16frvR
 jbKMppttRuac1xrew+8Er7DZAM1nRFH5Q8ZJ92iJnbKMGSMGDaWrPDo+3L4pFLU49ywfV6Zz
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6877c33d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ur2kyboyjIJ0vDSx390A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: UzO8OYjkngya_jA3ogRUN7A7zBrZQy3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=968 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
  dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
  dt-bindings: clock: qcom: Add bindings documentation for the Glymur
    TCSR
  clk: qcom: Add TCSR clock driver for Glymur
  clk: qcom: rpmh: Add support for Glymur rpmh clocks
  clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
  dt-bindings: clock: qcom: document the Glymur Global Clock Controller
  clk: qcom: gcc: Add support for Global Clock Controller

 .../bindings/clock/qcom,glymur-gcc.yaml       |  122 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |    3 +
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/clk-alpha-pll.h              |    6 +
 drivers/clk/qcom/clk-rpmh.c                   |   22 +
 drivers/clk/qcom/gcc-glymur.c                 | 8623 +++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c              |  263 +
 include/dt-bindings/clock/qcom,glymur-gcc.h   |  578 ++
 .../dt-bindings/clock/qcom,glymur-tcsrcc.h    |   24 +
 11 files changed, 9662 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-glymur.c
 create mode 100644 drivers/clk/qcom/tcsrcc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsrcc.h

-- 
2.34.1


