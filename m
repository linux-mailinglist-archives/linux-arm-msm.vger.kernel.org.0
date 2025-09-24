Return-Path: <linux-arm-msm+bounces-74692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643FB9C661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C7BB1BC2CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 22:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B132D27FB3A;
	Wed, 24 Sep 2025 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmD2qSQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2782928851C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754745; cv=none; b=k0UqXPFQt4aIHPKslm59HRk+dKVWxuQeKIBVZTo/NjWv3MfSDy92vrJxH+/ORqdtNzQJ7xiIJ+eLXauGISzHrDhEjPcWEERSlPgVwpi8kyih2uAzKlqfhI+hkp5lY56g8Djk+wAm0GRAWO3gazzRHj0UP72lxZsq6F5CWWQmMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754745; c=relaxed/simple;
	bh=VRmdDNff981CuK71zFSzHByDaEn7tvZTiAzuPYt1F2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mtwW1NC9jiki6gLkyp13OYkKvevwgA52QDoo0N08vrQ2CO/uboyyzeljsKPVnBoXOmTVtex4483yAty+VDyZ8uMlMrqAoMTCOV9us5CaD1XYiQjV/IjFmVm6HZ8XSHilCP6aPfI9P0FhcHUiZOJLMgSL6DVKfYTFdjbo5C4xQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmD2qSQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD4123025283
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u3OjrzALKFkPVEklOHd20q
	VfJiYmmmJvJyvK6y9PLDQ=; b=BmD2qSQNB7TyyNVpgV4DEajkSDHsYDqDjqAXgn
	mJRhdbYLIEJYbbbiZ/bkGdMCm4H8p4xAUQti4ArDRPDDdw2yrQifgBmC6myQf3jX
	Ni3iNscferVjSdDpups8LREseSggsnegx88Stz+FihWspSOdGEF+lkmQt9Hxj2w9
	cxaP0r/dv3B4d+CEN1e0LPLTMLlv+Mb150JlWGZU61hhwyf94yM0MG/4/lZwVe4t
	ZAAk/YDWVyTAvQfBkrE2jweSE7tYeTDCGZWfN++3d9UViANvcHXqoRbOXmf0eK7x
	6yshb+m9OHM1VTxA0qpDWR564r0FalbS5C9TS7h/2xFFx77A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyex9mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f7238196so237030b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754742; x=1759359542;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3OjrzALKFkPVEklOHd20qVfJiYmmmJvJyvK6y9PLDQ=;
        b=lT7DVHU/BnN1lsq1Zz/rA1iXFUdFb8Paq4wdtRh8O/uGkYGFCAbSofMfpCeWdXUARb
         06rVx3SG02C2PxyW83xVnwDGal4OzPdx/eB/YsUbpVoDpL8NXF5d1CGG0m0TmBAwWL0A
         50lqN1Fw/eGs8hqSdiKMaimzTaqO0EbSXmbpyGu+4Be7gq5LiSdm/hSDjxGD8ABr/In0
         uBbm4QoXM0rRCgGezFRNI6tfFx8olNKJizqJse9SB2rbJBzNhOdTTxReWtYolBL8hOPo
         MuFVou43lO3+Fm0CaltIMc3xoRWnu1rNbYrqFtOpRGxpdvzJ4KueiquaN9geDGAa9wAj
         c9JA==
X-Gm-Message-State: AOJu0YwOl3pwnX/lPhXHSTgc0E9nSBNykPx/u+anEb7y0I7GZkRnhjq1
	R5kR+oI7P/N07JxXkWG1TW1B+k/RcBfjjI4vms7R2ErNsKkdd6CE10YiuLqerdPTeKq8w4J5blE
	ylx8OeLeERsJcRJOh/eEbrC2teDLO4SmL1Z5KVY/rv4aTTrp7KX9+T2H+qmcfvm16VP3f
X-Gm-Gg: ASbGncvQrgz2TQ56t7bu7fxCcjhGLmCJn68eQZzOIRZQRD5bDEmQE9nEnF4kmPpZE0r
	cLZTsAl7Hf5BwnIS2rUX/zH6eMFnl5PtN3Q+Hm9BltpRNFOzCeIGeaBBjJp7HBWanuFj8gB53bQ
	dcCCIkT3O3NgNjcvdZZfju3G0zXDOjf8nmfkt2xCtf8K149Ot11hDZue01DzbfSKungPJjK73Nq
	nBMOwc5mPBX2B3qhuCql1igde52K8BtqxB8L8I1aEM1fzGY937x+/OATqQHqR9cfOudSWgxWjG1
	9Cfu0psvtvGHcT7Xqh/2cqjDNaoHorwzB0yOvjneTQIaAR0DjqyIUIusXjliTZWC53MkkY9FZSd
	g88QGIc8KlXGJ3eY=
X-Received: by 2002:a05:6a00:9a5:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-780fcea2fb2mr1423385b3a.16.1758754742323;
        Wed, 24 Sep 2025 15:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwxTp3YIwwATUL1FlU2TnVWjJ1Wgh9OSG5lv6otWYOzXo4pxbLjK//2YLzHHF3GNSQe0Eogg==
X-Received: by 2002:a05:6a00:9a5:b0:780:f6db:b1af with SMTP id d2e1a72fcca58-780fcea2fb2mr1423368b3a.16.1758754741876;
        Wed, 24 Sep 2025 15:59:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/9] Add support for Clock controllers for Kaanapali
Date: Wed, 24 Sep 2025 15:58:52 -0700
Message-Id: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKx31GgC/x3MQQqDMBCF4avIrB2I0VrjVaSLGKd10KYyU0QQ7
 250+cH/3g5KwqTQZjsIraz8iwlFnkEYffwQ8pAM1tiHccUTp7hgmCcMtRlcVTnb1CWkehF683Y
 /da/k3ithLz6G8dp/vf5J4DhOjdg0anIAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=1775;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=VRmdDNff981CuK71zFSzHByDaEn7tvZTiAzuPYt1F2c=;
 b=40OtaH/1YUk1q+qTUL0VW2MAka9Q5DiyEGimgGbSG+IOuLZkbBeTh/1D81rVA+RTpSnv15QQG
 9OGNa2Q7XBfAX8RQDhmQBqne6B91X8C/qplVUaLAqYEtprbzfzs7KGd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: NtEuoAJDlSyv6QMpVHgTbcB9E2PFPZx6
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d477b7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NOZdjAmOODemH_SfJxUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+IR+LmyxMcP0
 FqG2uek1/R/oPIsVGYc4gmqHXno1n+Q3QB4Ez35tjCAjdBSXD4/c9bqMG3RFWNa+NO/5qRhBNbm
 zuM+lnM7AT/AYfAwsDzkKTJR2rAMTvX/3mZ+cwZkkEn9KdNssF5bMU+l7bSUsXY3WaMCxApnxzm
 zVifTH3GrJ7wsDHsTUaADu1KOUGATYik4u4RYO1LQWv0tkRhkNluSO29w8jBCy2/IjdZMqruhbG
 /bGCyYe0dj0W7D8F9oTnt1C3pWov/D2A4HMJLXiDXIT89l/leKkGhMoYTQAZIfYpLt1jI6QNoh/
 lkLblozzLkXyxMxoiK/vKZZ7gAYmccQEaK7GVmw8jeqAEVKb2CVCxdWbjQXhk3I9A297gb026HB
 cJbuhb9m
X-Proofpoint-ORIG-GUID: NtEuoAJDlSyv6QMpVHgTbcB9E2PFPZx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC. And update the PLL support.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Taniya Das (9):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
      dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
      dt-bindings: clock: qcom: Add Kaanapali Global clock controller
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Update TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rpmh.c                        |   39 +
 drivers/clk/qcom/gcc-kaanapali.c                   | 3541 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8750.c                   |   34 +-
 include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++
 11 files changed, 3897 insertions(+), 5 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-clk-c60d94492863

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


