Return-Path: <linux-arm-msm+bounces-75503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C754BA90AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 13:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C06F11897138
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B76730103D;
	Mon, 29 Sep 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NPBT+2MP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76973009D8;
	Mon, 29 Sep 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145757; cv=none; b=p3buz13XrxclGe1LHad6hZYnjmYSSlOSl/QciR2WEnNlJttEFJI3SWCY05Aaap6zP+jIZ64KB5JDd/FQSYVjqKXmmB34zMmo/uxYoU25oSEwHzPnKbgBr8Oj/VoZEFi4naGH8u7x5vmQ4TsFFU8O8kFYd5XH8xi/U3QYLtK05Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145757; c=relaxed/simple;
	bh=327zmynQmiAe5yGogIbzoJlLnp/bLD6Ty1yzzxd4ri8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rkAEalbEUJXl4PK4EsdwaA2xMWYMnzStKQFjKwc2xDJI6UbQ4Bwr7kSwgmghEKChgUN/a4k7sMpAR3hoJRXwCYgmJqb174dd3Rtzebdk9Gvdz9RnSWZjo3RgQ8toXBit9GxPXQpqRieEBQ9YbcZxi5GB9Gb/ogMcYShOUTb4eSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NPBT+2MP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9wl3D011761;
	Mon, 29 Sep 2025 11:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4nIj7JKS6Ea
	ASn0WEyhcVf7wbZWKo697N90mS3LvXM0=; b=NPBT+2MP5E4m0cngYObebr8/7dy
	JU2+q3kj9X+Uk6nxe/czfCJ0y8bVZ9joyKgTN7cLOGxDt+R9RDhw4Z2bEcXGyAP7
	N1Iec3KXM8xJ7zCaWTI00GdsmRa8vj4HxoIhJRnsHy1GQO9yiA1PWM5PEmcIaP25
	I5Z877No0ZA7q3Rmvb5L1LXTDT+BCcGJWloZYzAUjQACGSq7Ga/KomXgvmNAY2Ze
	Rq9TymqePQhXLub3GFVDpjDujRw4qPqFoEShUOuyQzz/yjy9q891iH2+jejTL/80
	bk2LKAZ4/0AnwvNqpAspYx+zjlYs47ia8gGZb2KJ2Ll8PtH1Z4GofiQdtqg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqw0wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TBZm9P008915;
	Mon, 29 Sep 2025 11:35:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49e90kvy69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58TBZl9U008909;
	Mon, 29 Sep 2025 11:35:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58TBZlNF008906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 7BDE05C6; Mon, 29 Sep 2025 17:05:46 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v4 2/4] mmc: sdhci-msm: Add core_major, minor to msm_host structure
Date: Mon, 29 Sep 2025 17:05:13 +0530
Message-Id: <20250929113515.26752-3-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929113515.26752-1-quic_rampraka@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 93ImZCb_IMp8AsXkaqs9bhFxAS8P_J_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXyO9ijaIjUw8d
 Se/ITK7lDeqq1wctbkEIskNDHLV6Y68Un3ZYJHUGs1fisV9CM4HQbTA4tvq6bCRrakC1+EsKga0
 84OmJsP6HOcgMtqPDx8a3oFjlgzlbNJj9J7vRJEvj1PKR2zHvQ2jIZYtheF7Rjx05CKXNBWS8Wp
 tEFHpG+jeOjS+orI3da0zDcdedpKbhDe9bzrapzPmoNAJHU+JMnxAUbK7l9vs/Uy7nW/0WIpfnb
 mqu4nFxlMPj6mmkYC5XyJ1CTQ/jN0OOtQXXKZ+EJ15Ab+Of+AVWjEsgibwQkK7C3AtoZIwJsgcM
 aS/SI6Gkuw5iu5tCGyv2wsX2EnVf0RIwaOnY5OCBRIzgoh6YTCkY+TmgB81oVLrhQGeccB4GFiG
 pVxt1VJ85DqXbLJFn8pmYowy5PbopQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da6f17 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=PK7NwhktG5IhTMEw4kUA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 93ImZCb_IMp8AsXkaqs9bhFxAS8P_J_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Add the core_major and core_minor variables to
the msm_host structure, allowing these variables to be
accessed more easily throughout the msm_host context.
This update is necessary for an upcoming follow-up patch.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 9d8e20dc8ca1..36700735aa3e 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -282,6 +282,8 @@ struct sdhci_msm_host {
 	bool tuning_done;
 	bool calibration_done;
 	u8 saved_tuning_phase;
+	u8 core_major;
+	u16 core_minor;
 	bool use_cdclp533;
 	u32 curr_pwr_state;
 	u32 curr_io_level;
@@ -2673,6 +2675,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	core_major = (core_version & CORE_VERSION_MAJOR_MASK) >>
 		      CORE_VERSION_MAJOR_SHIFT;
 	core_minor = core_version & CORE_VERSION_MINOR_MASK;
+
+	msm_host->core_major = core_major;
+	msm_host->core_minor = core_minor;
+
 	dev_dbg(&pdev->dev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
 		core_version, core_major, core_minor);
 
-- 
2.34.1


