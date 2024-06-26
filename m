Return-Path: <linux-arm-msm+bounces-24188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631F917622
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C228468D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 02:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AE81D699;
	Wed, 26 Jun 2024 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RAGqc0U4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4C3C463;
	Wed, 26 Jun 2024 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719368788; cv=none; b=ose8Hj33BScpR0z1xDoEZe0DIEeryhQrhfnB95pB0Br2s6AFPLKkq1UcoItJZICJMGlWp9ihItLjSDzAnIADvYJjmZ4mtYql7LfjQg1ckX+Z9TlGldjCLj7/8lldmm+6mxF2IAQE3aBOsh/UdgDNQKj/ygCWx4e1dYxkmJLyvo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719368788; c=relaxed/simple;
	bh=2IH3vs5vfdoTfuI7fwaFWDiJ6u84pkj3MfXxTxsoavU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XbZ1xNrPsrp1MNXnoY8dxiah4CTYp/dib2balmZl5gInGADPw0fX9yCeNwlVGS2s9FkTUQGUSB4VzU71d8/kdSYrbi7Pr7bh7xnMU1JdzrMkINmOkDG009LcrCWHPyw1/4KWreHIAz3Yr3n9JC0udCsq3oH3VGWwUZHpWKMof2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RAGqc0U4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PGUkCw007960;
	Wed, 26 Jun 2024 02:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98ObzfEly/d4Nr2Nilamu/lbiOrA4bHdu/SU/01hHw4=; b=RAGqc0U4SNcmuUfm
	pR8JODtTYZv/kCMsnv1Mgw+NqFZoiy+xcusAT5xNvsFxjMeOOm5HAtid9qWvV2wV
	dl3acqFCK56hVqRt620bOW/TTZBL3d+hxbJ+OJ637vkH/SSsIdI/weyAZDxAy2Jc
	qU35DUvk6lE2quobb3I5M2OmMeQvcHXZHmsJM4EQ/ceOUJZ4Tdi2qPA1QC7iKaHu
	A6r5Z8qWyFwmsyPC25yFup6tUuPBWW13CYFqWPfGE7MyCls4dzsDbyigb9bfdyRn
	ppkHf9YRHpPAYEZSJvllL19qUnkWd0jHyftAIPBxC7jYCRfEETgwul/2sNdR/RPg
	qabCSQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjs048e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 02:26:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q2Q8Ta016764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 02:26:08 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 19:26:02 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: [PATCH 2/2] Coresight: Set correct cs_mode for dummy source to fix disable issue
Date: Wed, 26 Jun 2024 10:25:37 +0800
Message-ID: <20240626022537.1887219-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626022537.1887219-1-quic_jiegan@quicinc.com>
References: <20240626022537.1887219-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bkU8TDUeP1c1lm08F-ipyxkpp4QL5PSm
X-Proofpoint-ORIG-GUID: bkU8TDUeP1c1lm08F-ipyxkpp4QL5PSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260018

The coresight_disable_source_sysfs function should verify the
mode of the coresight device before disabling the source.
However, the mode for the dummy source device is always set to
CS_MODE_DISABLED, resulting in the check consistently failing.
As a result, dummy source cannot be properly disabled.

Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement.
Configure CS_MODE_DISABLED during the disablement.

Fixes: 9d3ba0b6c056 ("Coresight: Add coresight dummy driver")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-dummy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index ac70c0b491be..dab389a5507c 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -23,6 +23,9 @@ DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
 static int dummy_source_enable(struct coresight_device *csdev,
 			       struct perf_event *event, enum cs_mode mode)
 {
+	if (!coresight_take_mode(csdev, mode))
+		return -EBUSY;
+
 	dev_dbg(csdev->dev.parent, "Dummy source enabled\n");
 
 	return 0;
@@ -31,6 +34,7 @@ static int dummy_source_enable(struct coresight_device *csdev,
 static void dummy_source_disable(struct coresight_device *csdev,
 				 struct perf_event *event)
 {
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
 }
 
-- 
2.34.1


