Return-Path: <linux-arm-msm+bounces-47976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3B2A355B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 614D516BC03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 04:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E311632EF;
	Fri, 14 Feb 2025 04:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qy/llMJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42591519AC;
	Fri, 14 Feb 2025 04:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739507247; cv=none; b=hb+HMoFbzjA6boG5rU7+7kIg3TGH7bzVXY59m9AY6iWeCqh/q+WiKDxL9Vz+YwnTECS9d9FQi8CFi6jhCSNn7HxKk8p/XARNHkjPsNB4kowPKN8a2Wuur8YzwRF32tPiDZj77ujqneR7BU3AzP7CkSz1PleVMOJm2oN6+nx+sOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739507247; c=relaxed/simple;
	bh=Y2lVc1FFhnRBDB++1Ck19V8ROxGSH2KwaMiVNvqT63Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pac83Tw/tlqeapAFhrutVn87oYSWwl0IMTO94F3ADX3GKZjqSu8FW/mZsceQp5eME15v3RCR18DpFGGlaiolVn65MUnw/lxZR5nCpldIFvVS6FHfZ20NFj4jmDuRGMDpn5TiReyTXbmdS6itcTfimJ3R4Yww+UO1Fosr8DZcq60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qy/llMJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DMem6c011824;
	Fri, 14 Feb 2025 04:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXAsC3iaDw0dRF3eb9p7Tohup6ZQ9472XnLYvsD4uzU=; b=Qy/llMJ6MkXURtpG
	kVF3fC8pxf9nTCgjq3iJ58+CpO1eWoWPwivniIVdrBr/3/ctCoZHGywgAgAKoIP7
	pZPhNhPS6eIFpzpH1H7qOhcz1VTA/qcnRljZTYKm/4fuJVTVVY4WM8tB8hsdJPOb
	JGANSADBx6s4xYepJ05oHlM2kl5yy9HxtwKFvIBR10zyW8zhxA2OIVYzTpaj6dfJ
	Smjcw3vM1nmHSxM4YaM3qvVG1tMYOV9Olm/B8eYjUKRRO1PbsjHpHddrqsfQfe1F
	phliS2TA721OCUPAarOd+en/Hgn+FA0sepB8sjp/aHzslDRspT9uVOLJpn3yGz7F
	ToeYyQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sfxwa5x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 04:27:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E4RKCB013548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 04:27:20 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 20:27:17 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 14 Feb 2025 09:57:00 +0530
Subject: [PATCH 2/2] clk: qcom: gdsc: Update the status poll timeout for
 GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-gdsc_fixes-v1-2-73e56d68a80f@quicinc.com>
References: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
In-Reply-To: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A9CXIdCOAq_c23wiIx_EQM9Yl9PdS0nv
X-Proofpoint-GUID: A9CXIdCOAq_c23wiIx_EQM9Yl9PdS0nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=937 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140029

During the GDSC FSM state, the GDSC hardware waits for an ACK from the
respective subsystem core. In some scenarios, this ACK can be delayed.
To handle such delays, increase the GDSC status poll timeout from 1500us
to 2000us as per the design recommendation.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gdsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 1fd40b755082a4658cca581e920635e1bdfbc922..2e3128ed16c4d78f1bca799b4e716e9034b4a6b9 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -46,7 +46,7 @@
 #define RETAIN_MEM		BIT(14)
 #define RETAIN_PERIPH		BIT(13)
 
-#define STATUS_POLL_TIMEOUT_US	1500
+#define STATUS_POLL_TIMEOUT_US	2000
 #define TIMEOUT_US		500
 
 #define domain_to_gdsc(domain) container_of(domain, struct gdsc, pd)

-- 
2.48.1


