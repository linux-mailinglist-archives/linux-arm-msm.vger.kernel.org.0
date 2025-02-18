Return-Path: <linux-arm-msm+bounces-48380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29112A39FE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE6A176393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF0E26E143;
	Tue, 18 Feb 2025 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YylOXd4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C3E26D5C9;
	Tue, 18 Feb 2025 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888868; cv=none; b=PbbSBsBraB8QfjFWMRQTrlYhfg1rbew4/ZZoxD6lBPTzrHmL0301m3tJuGx6NS1ABQ650qnvoCH23iKER2K0tHn1AnY+Zweo/wSg6BrmvSEcPPZUKh8TY4+khSrCR/4IzjWq59/5/zbeRbrwNlZyyBnQP9KKCnPqRhvhR4Ucukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888868; c=relaxed/simple;
	bh=E1sLj3nSLKbyA5X3l1PNaCQPrVHOz5WY0J7BiPFStR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HBGAhf1UuXkfrfxqPUgJv6iFG0r+yII1btO6bWv51Ad8EL5ogNHX+M11b/zv0NR+WNTTDNLYK7fplqAVDkYSq1mSpcRLondezsU5fCyUHD4rUFLyRXs2nKa8NV5juUrFSyMkywmEnrbx3zrs7XSjLyOMp7g+QRm5h5A2S8FaXuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YylOXd4l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IBh34s026366;
	Tue, 18 Feb 2025 14:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Afrx0VHj98Va41ypMszwR6MhY3suuQ3MzWBXy/7D3/g=; b=YylOXd4lt0rRIBwA
	Oo0K9QpNBU56BlE1yO80NpDzFy1TP8AoHFQUy3ZXJ4Z74Wq1WEvutuEntW+nWeEu
	Ig2uvX90rYS/l7wPlr5yVYJo/af9Ar5pZj7lyUH1yGXF5UrKcpsT5ptfA4G854Z8
	xQkGeTJwK+styU12L/SrLZe/oYgnr18cNJwwy+WgzsavzCB7cy00xJ41GM0OwYv9
	smYilqeyaTZuW2hGKwnEcSAWy+ebeOewvDJCYx19JFhSkKC18nqfDddn2BgoUDD/
	40J1V8ZegDwL7T04viiITuW69rvNOWCx5tuWxhpkepMHnrerAJw5YAkkxmPM+fvz
	ZPQ9uA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vw3yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IERSOO024347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:27:28 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 06:27:23 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Tue, 18 Feb 2025 19:56:48 +0530
Subject: [PATCH 3/5] clk: qcom: common: Attach clock power domains
 conditionally
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DycCh1apGGd1tqABucSum8qh3rxhdbis
X-Proofpoint-ORIG-GUID: DycCh1apGGd1tqABucSum8qh3rxhdbis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=614
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502180109

Attach clock power domains in qcom_cc_really_probe() only
if the clock controller has not already attached to them.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0..eb7e2a56d1d135f839fd9bd470ba6231ce775a8c 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -300,9 +300,12 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
-	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
-	if (ret < 0 && ret != -EEXIST)
-		return ret;
+	cc->pd_list = desc->pd_list;
+	if (!cc->pd_list) {
+		ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
+		if (ret < 0 && ret != -EEXIST)
+			return ret;
+	}
 
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;

-- 
2.34.1


