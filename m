Return-Path: <linux-arm-msm+bounces-14324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6287E339
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 749421F20623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AF1210FF;
	Mon, 18 Mar 2024 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VHkdI/Pj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30C1E4AE;
	Mon, 18 Mar 2024 05:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740232; cv=none; b=QPQlaeTm5RtXN5jVPkiRH30FUkO6RK2Ytf6x5/4zGbrye1cZjvXQl6LNk1CrcS6ZEe4A24E+mAl/wrIQ1GbNytEBHoMjD6/ovNJWIeAFjinzxajWff3UXY+Xia1u7BOZ2Cad2ijUkqcfDzKq+FGR81MDTtRqAinKneR/2oXEHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740232; c=relaxed/simple;
	bh=hXbqlBFvBKe2Lo8c1gopIKsgmauNiiJVVkw96dp6E+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oE8usEB2Mz3Mvv+LHdI4QxfB/9JfCkF6DU4CXtNWJLG2OKvlVxUl3UtB0bReMXBEGHlyY7wOPUTero06LgluI6C8E1iU4QdHLdYl0j4XsyVDMOy+Rebbr4CFoxILWZFyob6R6z5iPORrnB77SedmCK3bs+Me8oQS8V0t8xr7XDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VHkdI/Pj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I5b5ql005805;
	Mon, 18 Mar 2024 05:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=TWsFONsfp33g20D6fr2F
	qEUadCKv7ybx+6BP7sNiCII=; b=VHkdI/PjXkKQWLm1nOfmYePYq4u3lmrVl/9D
	kVL3/3FIOv7ymJAO1Ohg6DnWugvw8fDWHRhXGLgq3o7js5UHduzJUlzn/PWGdCVY
	3wYpKPZQIDuCgQ1V7ARutAHnc82lTh/u3GME08dV4BE2GuaH+bECuC4OuAfENvn2
	wZDZyvns0DEM7fIMXjhVydEusDAFsLdOGPQUaJ5LK4eTQU/uQUD0MdrR+sk2WH2k
	10WToVbIRbYrCapPG1f8Zxeto9EDhioyX8HDUml5EqAHApPTylt8L3Z9B51PwsoV
	m/yFHdDC1BEEvPoVwUcLFML2aHgK12zYSrxNk8h0cTpewiboxg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtb14j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:37:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I5b5f5030656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:37:05 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 22:37:01 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 5/8] clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
Date: Mon, 18 Mar 2024 11:05:52 +0530
Message-ID: <20240318053555.20405-6-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240318053555.20405-1-quic_tdas@quicinc.com>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QusMKZEdWHqmFzXp5gooTS5p6mCpCxXt
X-Proofpoint-ORIG-GUID: QusMKZEdWHqmFzXp5gooTS5p6mCpCxXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=962
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403180040

Update the force mem core bit for UFS ICE clock to force the core on signal
to remain active during halt state of the clk.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index c622cd9a9d24..b937d513b814 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3473,6 +3473,9 @@ static int gcc_sc7280_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004);/* GCC_GPU_CFG_AHB_CLK */
 	regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));

+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 			ARRAY_SIZE(gcc_dfs_clocks));
 	if (ret)
--
2.17.1


