Return-Path: <linux-arm-msm+bounces-37504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99349C4AF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 256E2B2BC8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596601EE021;
	Tue, 12 Nov 2024 00:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="plR2gcuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1E1EABB1;
	Tue, 12 Nov 2024 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371304; cv=none; b=DucLBcKmK0Jw0H1xMKGFzIr2Sm9RW+DjCUY+xPpWeHqN04mYSK/RaJ1Bm//WNkeGc4c1cEY0qU4eBY3/OOM1kQWYZ9d7LHQj+hGYxkFN3Ewmn7OsqUb1XME5nt+r0Z/UI+iW3U8qC8rT76L0qRC1OpgDGYpl3iKJDPSbd+WNMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371304; c=relaxed/simple;
	bh=IDMmvK/9Q5SFghxZ4+Iaqv2550Ibk9SuPeE+5eJnU6U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNGnWXDn2MWmLKSX1f7y8hFGNoNV6+0MynRa3G62QYasGjBaQSmGRoGHNVnuLNowVzrIjKa1oGdJ0rHJxMLzWIvF6wKoAfuksxUtTPfGHvcIDRyQGDmt9hD/2D5oHN6WtpgAVskfBHMAnamduNVdzrmUYA9jXJuwEwXo2+M/fwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=plR2gcuu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBxgt9012798;
	Tue, 12 Nov 2024 00:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awL8YEJDLkmofytObKzPyNvZYr6gzTF42BCtu4jmYVk=; b=plR2gcuurxWnK79W
	NdD5abN3V7B/l+oYoFfhNMGwGyzngPu9OW0m4I7Jz/QLWI5OL6H7P0l1FIgMd8y8
	TfOKGeyKhu76g07mSYBU94lq/6chE8o6KqBD67Q6hjw2Oshv55BPR7jS5j8ujvNF
	xcWWW5PC/9jFCqDA+D9k50NJj//v6vTDUF5UhfUvhRIcw0uL5C9Wba8I5s0z5Bup
	oNI8pKAT2vtdkmLgsjmSFEVBHrbHQ5SeKz4qBEskQSKdUjcpzJ11DOO2rV8HhGli
	UxHNTFn6vG7fociP0mqmdPgfAEQueZuOayAu5Aobz+hjzppFGNml6rS5AM7zAj0m
	HSnP3w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sw3m5uds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0SINi032449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:18 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:28:17 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for SM8750
Date: Mon, 11 Nov 2024 16:28:01 -0800
Message-ID: <20241112002807.2804021-2-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241112002807.2804021-1-quic_molvera@quicinc.com>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j-fHK9t8s1Fi_X7mnv_gVboODBxdcpnq
X-Proofpoint-ORIG-GUID: j-fHK9t8s1Fi_X7mnv_gVboODBxdcpnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxlogscore=811 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120002

From: Taniya Das <quic_tdas@quicinc.com>

Update the documentation for clock rpmh driver on SM8750 SoCs.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a561a306b947..f39c4e0922cf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -37,6 +37,7 @@ properties:
       - qcom,sm8450-rpmh-clk
       - qcom,sm8550-rpmh-clk
       - qcom,sm8650-rpmh-clk
+      - qcom,sm8750-rpmh-clk
       - qcom,x1e80100-rpmh-clk
 
   clocks:
-- 
2.46.1


