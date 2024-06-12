Return-Path: <linux-arm-msm+bounces-22420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7D905115
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D341C21062
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920CB16EC1E;
	Wed, 12 Jun 2024 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RBBDQG3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A116D4C0;
	Wed, 12 Jun 2024 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190529; cv=none; b=HFx5Tr8y7hBNN1NMrzQ6rP5DByiKZzcfrnM6sKivn1I1hqirPxOJ9tXOubmJnZjPNVPNdbr4gcQIQhyw0bXLSsRJUAkKH6ZVvbP5PQcJahawS83fOwQgtL67BLsJhXczd/l45ciGfw0va01YhdAUCIYfiywPIZ/DooO6DZMay64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190529; c=relaxed/simple;
	bh=vY+cTHN2NsFnRhjuV3RjzB4VG0gkCLG7K7dwwRsL6IE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ZUZ1+s7nA8ObWtln/zHm10Mxc5edMcVdl2XnOeyVOlAeHZ52RPZ8PlJWkjk+pI8+gqP4Izki7s9Qpx2FpVcBNuKrTCkFxOUAarzHVDqg9aADFesFL5hwwKzPxzh8oE5+5/aXnc79w1JzRLWfTigDjnX2qPajCDV8XiC7d4NNhqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RBBDQG3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C4Z5CS002543;
	Wed, 12 Jun 2024 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xGDmpJU1uCnOHWH+WIGuJ
	trY0ErZVdyv5NatW7Uh5k=; b=RBBDQG3xgcHJoLUWybbuoufKIzYComUx/vj/Zk
	dsq6aGmg0b3+tOovQ6l7kSBc9xdUnCzvcEsMmEAFnZthy4BUKTdhIfA0GHQiesE1
	Un9+zzNO0dFumspX0qEDOyCz7ShYUlzMkFbSERFvDgQZSXuy7uNeZszh4tPePu0L
	iZmTLr7kE3LcRnczcNwR113dizljQ5v/neE82ErlsCDrcxuRUEscn6RlsbcBoNuN
	Z6Cazv7saglwEnI2z8lU7pS4RiYI49Ce5SmaWn6aL0nI+1Ng3JHCBAMvMq881fKW
	s6vm26gjRUmQBwSRTcakHnvJWHuUEnvSDHdXbCBJuV2++/Fg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s08vwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CB8fAJ005852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:41 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 04:08:37 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 0/6] Update GCC, GPUCC clock drivers on SA8775P
Date: Wed, 12 Jun 2024 16:38:20 +0530
Message-ID: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSBaWYC/0WMwQ6CMBBEf4X07JJ2ASme/A9jTLMssAcBWyAmh
 H939eJl8l4mM7tJHIWTuWS7ibxJkmlUwVNmaAhjzyCtukGLpT07hBR8XVczbAg9EfTzqtnJmxM
 wOfRt5cuavdGDOfKv0P3trt7F6QnLEDn8L6vC2UahyZ3FpgCE1yr0WNqQrl+SkXKanuY4PhdKx
 yyrAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hYHGUAWyqxhjQK3lTcUl-ECN-HRwXSRE
X-Proofpoint-ORIG-GUID: hYHGUAWyqxhjQK3lTcUl-ECN-HRwXSRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=600
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120081

Update GCC, GPUCC clock controller drivers on SA8775P platform.

Changes in V2:
 [PATCH 1/6]: Dropped fixes tag for removing ufs hw ctl clocks
 [PATCH 3/6]: Updated commit text on setting FORCE_MEM_CORE_ON
              bit for ufs phy ice core clk
 [PATCH 4/6]: Updated commit text on removing CLK_IS_CRITICAL
              for GPU clocks

Link to V1: https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/

Multimedia clock controller patches from above v1 series have
been split to a separate series:
https://lore.kernel.org/lkml/20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com/T/#t

---
Taniya Das (6):
      clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
      clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
      clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for gcc_ufs_phy_ice_core_clk
      clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON flags
      clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
      clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's

 drivers/clk/qcom/gcc-sa8775p.c   | 154 ++++++++++++---------------------------
 drivers/clk/qcom/gpucc-sa8775p.c |  41 ++++++-----
 2 files changed, 66 insertions(+), 129 deletions(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240612-sa8775p-v2-gcc-gpucc-fixes-ec128d5847e8

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


