Return-Path: <linux-arm-msm+bounces-406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45C7E798D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 07:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1323D281826
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 06:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4796AA5;
	Fri, 10 Nov 2023 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M139T2wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A963BC;
	Fri, 10 Nov 2023 06:50:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51CCE7DB2;
	Thu,  9 Nov 2023 22:50:50 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA63Q8r019061;
	Fri, 10 Nov 2023 06:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Kyw/QysJCLJ9MmCpTF1twWWP5gatSMuXvc6HMlD4JqA=;
 b=M139T2wZXu4sVhSB90G+5wzI/0vXVL6B/4TeWCpCvDk/bFKncVwjYHZ9/PDfgPRt2E54
 4arzIM4puuWrAlOH8xturlWjbbRNKm4BuEFxl8TiV0DRDvmL4MEfrQLWV2ms0of45Jex
 hI0Be9ijy/A9WRVUZep4QtNcg6zKTTQ+Xi/fPO38o3zVSzaYvp4hduSNvq9fxFGzwDtz
 7D6GcLBAeNai0pgAVp3Lm223rXv3bvZ7hNLz0qScEFv/HlXLUzr5j/f7KnjZzdhrci7l
 Yw/clMhEgYmKkXbDw0GlontRx/adMy05N54sAYoaiVhfM/SKkPKvLPngP8RjP2sWIeLN bA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93r0hcwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 06:50:46 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA6ojud010805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 06:50:45 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 9 Nov 2023 22:50:41 -0800
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
Subject: [PATCH 0/4] Add runtime PM support for videocc on SM8150
Date: Fri, 10 Nov 2023 12:20:25 +0530
Message-ID: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MN3-lwvAqmbs80AbmSYNQoCJntM-dBxo
X-Proofpoint-ORIG-GUID: MN3-lwvAqmbs80AbmSYNQoCJntM-dBxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_03,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=944 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100056

Add runtime support for videocc on SM8150 and update the resets
and video_pll0_config configuration.

Satya Priya Kakitapalli (4):
  dt-bindings: clock: Update the videocc resets for sm8150
  clk: qcom: videocc-sm8150: Update the videocc resets
  clk: qcom: videocc-sm8150: Update the pll0 config
  clk: qcom: videocc-sm8150: Add runtime PM support

 drivers/clk/qcom/videocc-sm8150.c             | 26 +++++++++++++++++--
 .../dt-bindings/clock/qcom,videocc-sm8150.h   |  4 +++
 2 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.25.1


