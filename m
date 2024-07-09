Return-Path: <linux-arm-msm+bounces-25671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E792BD1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4459C1C23ACC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC83419DFB9;
	Tue,  9 Jul 2024 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KvM8Muqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50819DF95;
	Tue,  9 Jul 2024 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535756; cv=none; b=fHOb9Xfa8jVJLoE+t7HmQKrJD0keZGXd1WbbtZB7ELNa4lI6Q4JhGZfS3xPPDXuowN2JZOD5Jusb8Dki1B9pZaLL4G8cR7hTk/CO4mkk4+wVoRjOBFV6vPk3TpqcqvvOkPXm/JFBHOjW71EtLqyvE2Yy75EA+d9UulNl1BgLXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535756; c=relaxed/simple;
	bh=/7V0EJxNZ4cEHLfTToLfwG5Wl7+cvEDF+WpH3vQtF7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q1x9XpFUXqIC4jucECv5COUGy1BhPkM1MeN+V4/QAa2bcEm9ht1NtCRPuNvHF4JfeG6/E7obknBkHVS9V2GswgQRerQP+EYOKmWsytcwf/io1yR8AHjg902k49o1+fe+AxvXQL4qdNPs4AdcAbbdoohg+e6LaGV8+VlZo8M6u/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KvM8Muqj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AnSba004577;
	Tue, 9 Jul 2024 14:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k0srZcHoiWjDGghk0/Pm9qidtO9mjix4a5MwTnpiZZY=; b=KvM8MuqjWSyTOivi
	nT94+it1he54P5muVnSyOrrEhHxhBJfCc2aJeCFAqk0fLxmBAxFW6UPEUma58dwf
	QhhtRgItOPZrvDuEY0lKhyeDIBf4u5fZLnIddToJ8EFpqSRAL8ijxYx5Q+/Co01i
	oWCrEtTC6XDxyJYMjWh2C4s9jaSteGggxvbfSFFpoD2Y3GwwkW+gatQPA2ROqggp
	z4vAdXwJ79XgWi6aTK8Kd7uHvssLUqdBj5WmLbM2RGd4ivjz+ZyuYlmaoMz04erP
	QTtpXRTgOVXEtAGmC80dEX2x+orKGb1rC/tcXkgGecEYGH5xq8RTPdrT5oPuBDVN
	FQm55g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66n1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:35:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EZorF030812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:35:50 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:35:45 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:35:30 +0800
Subject: [PATCH v2 2/2] clk: qcom: rpmh: Add support for QCS9100 rpmh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_rpmh_clk_compatible-v2-2-b6f516c36818@quicinc.com>
References: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720535739; l=1122;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=/7V0EJxNZ4cEHLfTToLfwG5Wl7+cvEDF+WpH3vQtF7w=;
 b=VpBE2NUBCpPrPTAvozBOwJ3ZD1QF/Tk8aXbOOt6tGJckq6t95+fFXeHuaWuKvracxK5BktQji
 3OEMb2MT2E6ABkmXMI36czryXAJ/MNOLudcHMXrk6CeXacppkKGUg2H
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Izs8vD4YGjESvH9WrxZXJaupdSjquVGc
X-Proofpoint-ORIG-GUID: Izs8vD4YGjESvH9WrxZXJaupdSjquVGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=915
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090095

Adds the RPMH clocks present in QCS9100 SoC.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-rpmh-clk" to the rpmh clock
device match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/clk/qcom/clk-rpmh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index bb82abeed88f..8131afba85d6 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -876,6 +876,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,qcs9100-rpmh-clk", .data = &clk_rpmh_sa8775p},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},

-- 
2.25.1


