Return-Path: <linux-arm-msm+bounces-71416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81259B3EBAA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5933A55D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8582D5958;
	Mon,  1 Sep 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h19sd/AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6242D5922;
	Mon,  1 Sep 2025 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742316; cv=none; b=N7u3RCEAwzVG1q8jYo5yN0aNSP8ldHC9PDgQKPPpYJoC+a47/jaUlUW9MeIGs1xMFTIIAfoEUnXkGEX+ACBmMP8kK+lE076pPMT1AVyUtq6+7A5eIOLNN45prehMcKKjCYZRlITRAj28G6ktFg5zZWvoFARFLojaX/R/kZ/5d8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742316; c=relaxed/simple;
	bh=SGqjlb/QEUrMxL9e5oJam4MnZEbfkfWhNjJ7HhvkO4A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAMgnEtapVxJDTLcR1IrYtE6HuAhFRyTVGOVCfD161pKwDEgemPrksIPH5Pt5LHgcLfqLKd592ExbccuQULnf0uCgovwy43ZpguSKHqRsUysOoqo93AqMapn8jAv157Ee2cly/Aw1RXX4jZqpnZ5kS4OyH9RndenJVhK7Ys+IzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h19sd/AI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B47Wi007309;
	Mon, 1 Sep 2025 15:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiIau0k39yONCrFdBTuRaepfgRM/f9Ux3i+6YIDfxss=; b=h19sd/AIB8ev9kOs
	/6vTlq2DJ5bOeugeM85e7kCpXETEOF85Euw25Ufsw/gc1OSlykxM6W0EWzs/ShUG
	Pj51lu110Q6Sh+9aCgPksjxUUPQmozlt8CCD5RZSA0Qigx2nvZ4B3wgoLst8THqP
	nFFoR8hoth5lk7xG+OP+CwEjCVoal1kvRhBD84ML5QDxRLN6/+tNeDQkNFyS48NY
	Y5TPpLS4V/UJfIiabGw6ji1UHRPm6LduFcPmCDqg0UxRNF/pL5/qkruV0CjWgYrK
	tA80ZSJRgEe4iX0LyWpPB8lzieN4fx0UhX46JIeJHXrKTfGY/aCApVbA6YlI3ZEs
	lC4rqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp5dgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 15:58:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581FwJRQ003039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 15:58:19 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 1 Sep 2025 08:58:15 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V4 1/4] ufs: dt-bindings: Document gear and rate limit properties
Date: Mon, 1 Sep 2025 21:27:57 +0530
Message-ID: <20250901155801.26988-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
References: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -AheyndoPJBy7vLY7HNCKYY_7JEFu1qI
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b5c29c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=Umu3u8L3Ayb6iz0Wi2cA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -AheyndoPJBy7vLY7HNCKYY_7JEFu1qI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4XQyZqZ1GigQ
 CbOA/KUvLcoB6rhdIF2DTcApJw/I2lqzrO+rZyvZn+jOvXhS+ufUm3XvUyI8E0oY0fkAZWmQel0
 rztHS80kKTEy1HARHKUQlS6RP3/xSW9f2KlZsboAMyugZjKS/oyZyyaSYkvk1Z02I0j4TLsyRMx
 Uode4R+V8e3foHjENiUhoWcKsRBpjujpwLgzlCKbTO9rf2rGFjGpEY7tNypVo1fj5IU8d5JH9XX
 YkvMpf1gy+UnHkLPrB54BB94KzrI8vWlpSp0+UcwXqAHwb+yUyNKkEtT1wcP7+BxKxdFWIPy7Qy
 f92MnL95Tb9GSXAxMyx0XPQCDb4Ue+hev+ByfmBsLpJ8HGqIO5+6u7b92JwMddU5jnAV6GnilfU
 PtqFbllQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Add optional "limit-hs-gear" and "limit-rate" properties to the
UFS controller common binding. These properties allow limiting
the maximum HS gear and rate.

This is useful in cases where the customer board may have signal
integrity, clock configuration or layout issues that prevent reliable
operation at higher gears. Such limitations are especially critical in
those platforms, where stability is prioritized over peak performance.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 31fe7f30ff5b..b4c99fee552f 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,22 @@ properties:
 
   msi-parent: true
 
+  limit-hs-gear:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 5
+    default: 5
+    description:
+      Restricts the maximum HS gear used in both TX and RX directions.
+
+  limit-rate:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [Rate-A, Rate-B]
+    default: Rate-B
+    description:
+      Restricts the UFS controller to Rate A or Rate B for both TX and
+      RX directions.
+
 dependencies:
   freq-table-hz: [ clocks ]
   operating-points-v2: [ clocks, clock-names ]
-- 
2.50.1


