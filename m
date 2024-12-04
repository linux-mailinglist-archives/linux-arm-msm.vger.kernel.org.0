Return-Path: <linux-arm-msm+bounces-40356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E279E4586
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89AC4B2C3FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DDC1C3C15;
	Wed,  4 Dec 2024 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BZZm83m9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EB1A8F70;
	Wed,  4 Dec 2024 19:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341065; cv=none; b=JMp/JzJi8czfNX4+6XMUwzAgupKmEpIqQ+1j8q25vEkGEm4tm1xWjChC8F4arZk7qzRqLRe7HLAq4XyZY7TPJDDYKEn5YMX2SWT+a972CsPQiiVFqPBbCS1fmEqpRd7UDDP+XiphDmkB4wZ4Ra6HH2gFIqiwxikxcIlg54TuNFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341065; c=relaxed/simple;
	bh=T/L3XHh7XkfaV9/eKOqIYN1c850iHFdd3pTxfYePqCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SOBFRcDTkzRSwSIY+DWJ6OXswPCIOuD/ry4o9rH3QSDVt3i78YyeOGQ/TmU0kF930ZcPsak7T7ATrL1psf0MBGqlydm9JwdZ04F8rOc1xeaLOiXt+gffSRj8S25HScJlsjq+lQ+pc+4fnv1eak+22qolGWIG3sUSnsK4y9ZprRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BZZm83m9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4DPxxG031997;
	Wed, 4 Dec 2024 19:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FX2fxB132Y0nVOZsSralzVssGO3Xx2iqgAjcbXjueFk=; b=BZZm83m9HbmNcrXQ
	+85TmAnv38fWMriXJFjryji8P1SqwmdOxEKTmY9gHiBpNO8s8jcwVlvkIHLSPokm
	OVbWNYmfjwg0VU61jzx8xxta7nPyOL+fXSI2HzuRIvhYSs1oDzmmCPXcNpsyfAAl
	RjR2ceURDmXol/X8iPx1aXb02/Zafe8rfYbbdqA14eTmxL5+ll0hHI7UBGK4wbc0
	/L2ZqwefuTsDVOduSvNilFgJ4GX8NSEDTXquOlgo+GJ8H9ia2/klsKzO6J0jR5or
	r/Ji94fvcruryhPukOfQgJ+GL94ZvQ8YGdfmsARX3MJqGa2pCfN6qclkZZ7ZYnDl
	L3QWUw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fav78m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 19:37:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4Jbdut031065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 19:37:39 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 11:37:38 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 11:37:14 -0800
Subject: [PATCH v3 2/8] clk: qcom: rpmh: Sort the match table
 alphabetically
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_clks-v3-2-1a8f31a53a86@quicinc.com>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
In-Reply-To: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733341058; l=1555;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=lQ0poWDoC7mT4MMS5CcvruZaXk8EehP0HEyQJZ4c6Ms=;
 b=UehSsa7sHFktKfmPGrfvk+10RWMi7S1zbw8L+yxFXsh08rJN/RBIl9hUgbdenEuWSYhMFu1SV
 utGiBxHDtHCAVPmlSLh1YmCFq981DtxLRDK1qi4UjR7xr0Z4gTYVOWr
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UzPrY9mhE8s4SpToGKe2B2gNq-VHzODk
X-Proofpoint-GUID: UzPrY9mhE8s4SpToGKe2B2gNq-VHzODk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=899
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040150

From: Taniya Das <quic_tdas@quicinc.com>

Update the match table for SC7280 to sort it in alphabetical order.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/clk/qcom/clk-rpmh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index eefc322ce367989f625f1285dcccddbdd8341a12..9d38b667a445f3acebcd04bac212b7adcfb001da 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -894,6 +894,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
 	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
+	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
@@ -909,7 +910,6 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
 	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
 	{ .compatible = "qcom,sm8650-rpmh-clk", .data = &clk_rpmh_sm8650},
-	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
 	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
 	{ }
 };

-- 
2.46.1


