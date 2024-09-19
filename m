Return-Path: <linux-arm-msm+bounces-31993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8497C4DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 09:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21564B20A8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 07:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31A4194AEE;
	Thu, 19 Sep 2024 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RhmFJiRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E6193432;
	Thu, 19 Sep 2024 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726731155; cv=none; b=CKTeEjRPZx7/6eERoC0gG8Ygg5h42oE08xwqntpnqCzMjxi1bnRvqxlLHK7qxGUAlePd14wVRSc7pkAVUtBrPcdH09w7BE8fUv3vHWF0bUMQ6IUg7rjagMTuRRlbPjtNYPNfQJu5yXtXiDDQWWmwkmSHp0FUeg7GZU2CN4IFeqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726731155; c=relaxed/simple;
	bh=HRAq9jmun7D/f1py3GbT6NMJl7TzmREqogE+g6hNHIU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=h6zOVJBAf2evfrgU4LpaeATyJYVp/2uJvckDS347NVlxOA+xKrasOlcDyZBS0/DKBcIFETq5KAi5tz5yO5VatJ34xZRNyXNpu7CDK2V1/7wVbhQ4lk12WtI01dYU7eHoorM5BTwHvwtodj0KUrELOhrns+2YB0ll1QQXXdPuuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RhmFJiRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48INkZLn024086;
	Thu, 19 Sep 2024 07:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hwNlIGIYn7Nc7JjupJX5Wv
	efJhrAF30J9FqX/caPdwU=; b=RhmFJiRYryLBpklNVL9fFxuBLnPj8dXvKETYA9
	ChkkVRWeVHuhE7uqP00RaD3hszhKYfRwkA58XQQl7QgFYSM4E/sSE/zs7VPEzSlI
	NvMrU4T1Sm2IefVjKUaENl0lw4adKRyo8waTLi/tUbTYiLXfSDBnr0WSdp+9h5I1
	DlTo36aTPKGsa+UHCjG0+8F2VU5OrnX61l/dOuLyuEeYw0bktY3mEnMnyX4q0Til
	PeRlWLjhwg5fSxP89TKn223eGVHmd757kTE9S0jX45keO9CDvnBrlpNNGy7HAtIe
	p2yxkmnI7xB5EnnC5DhvYFvFJ1kBQhpMuk7DdH5m0oVqx4lw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gecckf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 07:32:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J7WODM011935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 07:32:24 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 00:32:20 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Date: Thu, 19 Sep 2024 13:02:14 +0530
Message-ID: <20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH7T62YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0NL3cLkYjNDU93knPzkbN2Uosyy1CLdFHOTxKTUFDNLC1MTJaDOgqL
 UtMwKsKnRsRB+UWphKdDwEqhgbS0AbFP6uXoAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VfZ-xfAWxM8jYPWo7ASl_GzE5UDmkKMM
X-Proofpoint-ORIG-GUID: VfZ-xfAWxM8jYPWo7ASl_GzE5UDmkKMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=831 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190046

Add support for Global clock controller(GCC) and the RPMH clock
controller for the Qualcomm QCS615 SoC.

The QCS615 SoC is added as part of the below series.
https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
      clk: qcom: rpmhcc: Add support for QCS615 Clocks
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      clk: qcom: gcc: Add support for QCS615 GCC clocks

 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |    7 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   19 +
 drivers/clk/qcom/gcc-qcs615.c                      | 3026 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
 7 files changed, 3324 insertions(+)
---
base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
change-id: 20240919-qcs615-clock-driver-d74abed69854

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


