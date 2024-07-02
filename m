Return-Path: <linux-arm-msm+bounces-24892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD139242CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 17:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9C11F25C87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894C1BBBF7;
	Tue,  2 Jul 2024 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZdhqjKT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098115D5B3;
	Tue,  2 Jul 2024 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935487; cv=none; b=H0vbxqr0RTU9axetCtnUoDbKtfw2slK/0JDi1usm4BeEYEmShtiZVCBzHtneD1ls0H1nyJ4dxIoAoA8INGrezLJ0WFD9SxgVmjkBVmzwQTwtg1HJRO30VncR7pXmnJ+3GBZqYHVQUIRJSzF549Q7XInrVuvz+IyLPDp3r4SQdOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935487; c=relaxed/simple;
	bh=D6uGys9FhxRx9YIGIpBKfl1RcN+x5hM+PnbFemNoneo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ppqqT6fBTHkxmNSmqAgPySP8+Av38mUzuHE4teKAP46lwKCSc9ThMcEJP/iHtIcJj3eZ35Gd/Bv7bNILjxHkXE856P9cATqXHC45bKn2zhez22wjhnlrJaJUdu21wupQj/ZCWQECBakidop+isdHgWmrsCQDt07cLiirtLegCmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZdhqjKT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462EV7kP028755;
	Tue, 2 Jul 2024 15:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U0TT+FTeWvZbKfMhpqhO8i
	mLQ1ceB6cKaD2FZ2ipbx0=; b=ZdhqjKT/N4ldyUxGQmif4ZYGBhIE62mjlRHmDs
	kIlZwQgEGbPS/RnENhQ6iRqVFH7jgyexyM3JwG/D2c3fNjjYB2l+a1lekhpwlkMH
	ScAmUaHsFXWF0MbVzDNwpLF/HAhDmDXf+T05+zpwuD0JiJE31NWPjaCDj/3YRB4i
	0mOEHuAB8mvBzuf93bG6WigpjEtsOFM5e0UEiRDfnqfd8EraCUkoyfcNrmADmcbT
	ZVOlm0FKni8qIf69TRuBr1rxnR30p9LsB8uMdnGoOMfWdi9FEjRStBCB31BXfnfy
	Tj5LcJnk9JWOSbK6xEs2embj3Bc8XTFpKo4CfsX+f63To1fw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kctgeg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 15:50:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462ForRt008840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 15:50:53 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 08:50:47 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v2 0/6] clk: qcom: sm8150: Add camera clock controller
 support for SM8150
Date: Tue, 2 Jul 2024 21:20:38 +0530
Message-ID: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4hhGYC/4WNQQ6CMBBFr0Jm7Zh2RCmuvIdhUYcis4DWFoiGc
 HcrF3D5XvLfXyG5KC7BtVghukWS+DEDHQrg3o5Ph9JmBlJUKqIa2Q7MmOYQfJwwDUafFbanriJ
 bWm3pAXkaouvkvWfvTeZe0uTjZ39Z9M/+CS4aFRomwxc2VV2r22sWlpGP7Adotm37AlTNfuC6A
 AAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uO_wj_DIpogF7GLf1pl90PGR1HYSZ8YM
X-Proofpoint-ORIG-GUID: uO_wj_DIpogF7GLf1pl90PGR1HYSZ8YM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_11,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=982 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020117

Add camcc support and Regera PLL ops. Also, fix the pll post div mask.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v2:
- As per Konrad's comments, re-use the zonda pll code for regera, as
  both are mostly same.
- Fix the zonda_set_rate API and also the pll_post_div shift used in
  trion pll post div set rate API
- Link to v1: https://lore.kernel.org/r/20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com

---
Satya Priya Kakitapalli (5):
      clk: qcom: alpha-pll: Fix the pll post div mask and shift
      clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL
      dt-bindings: clock: qcom: Add SM8150 camera clock controller
      clk: qcom: Add camera clock controller driver for SM8150
      arm64: dts: qcom: Add camera clock controller for sm8150

Taniya Das (1):
      clk: qcom: clk-alpha-pll: Add support for Regera PLL ops

 .../bindings/clock/qcom,sm8150-camcc.yaml          |   77 +
 arch/arm64/boot/dts/qcom/sa8155p.dtsi              |    4 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   13 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sm8150.c                    | 2159 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   56 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    5 +
 include/dt-bindings/clock/qcom,sm8150-camcc.h      |  135 ++
 9 files changed, 2455 insertions(+), 4 deletions(-)
---
base-commit: 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
change-id: 20240229-camcc-support-sm8150-d3f72a4a1a2b

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


