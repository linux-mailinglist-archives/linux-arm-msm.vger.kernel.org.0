Return-Path: <linux-arm-msm+bounces-64746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C5B0362C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E4D162B48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 05:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A03217F35;
	Mon, 14 Jul 2025 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ArcB8d+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD74217F40;
	Mon, 14 Jul 2025 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471729; cv=none; b=f/8K9nRIEZumNggqQ/TjdRLGzl3h8lRESGdbTCWtJ4d9tNKHj3NB9kYEZdL0IIkZRN1k/M8iq1JGrO0oy4c+0DRvgwyEXs5PucX57IXDuCTegC1JAcbcZvIOLhs0Adr5wRpBtCMuxkdEuBqIHmx+a3EQd0BGQ5waP1S/5ZtBF84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471729; c=relaxed/simple;
	bh=m69eBpowmMuNvTB6Apw+JQZp8W3Cx09oDdHKlO4Ttzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrzPZpPeMYOg84k6hb2gQwT8xzMytTM66SneLJ2smD18XaGy79PX1iua54BaCf7M+KV5tOrUtEMzZqOITFKO74+CGXfpcGrKivc3TSvC7ZtkY8y3nu7Frifj1X5Aqq2wIN07o/CAbO6YFTZCV+eM3CP1r4vMel/Y85/umpPpzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ArcB8d+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E1Clhx020865;
	Mon, 14 Jul 2025 05:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AliyRKzkx1UpYngLzabBdK8VVN1l5cX3s5tZAsft8Y=; b=ArcB8d+z+aRvucaa
	iQWJi7fijJ+1HbYTIff4/g691ie13zfbyzjhObxU5yvrF4flezlWaqqCTFLbEImT
	+m5VaLma62OnH/UZstoutpVsbRm/XQIrw/QtQNnb57MyT0DG+HTHydQNY1335M0c
	4U68uqcLuOliRwf10TxI/pyyRjBRg+5cS3FIi5skAoJIkX08RbqaRFGt3/ZdidX9
	GXV6r2B+9GmftZTqVeW9zbmIl0rGqPiRrQUk2XfJmtVwRO0ObsXuo/dNwrn7y2Se
	wN+9xcqKDYTwTZtflh+WSm7d1d8p9uUdEnpFV4LkEvCBb1xyrb4bVlu/wpv8JzA5
	6DRK+w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaucqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 05:42:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56E5fxWe017693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 05:41:59 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 13 Jul 2025 22:41:55 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Date: Mon, 14 Jul 2025 11:11:30 +0530
Message-ID: <20250714054133.3769967-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ftYehLUReAtDW8BMzlcP3eusaJXZ3zRT
X-Proofpoint-ORIG-GUID: ftYehLUReAtDW8BMzlcP3eusaJXZ3zRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzMSBTYWx0ZWRfX+ZKIgyDuO4Eg
 /0wfFj5p5RiowLnuMiVGAUnEQlgt02mQgu/cmC4HrO2eQ4NGKb5eB9z5aCy/Bu0LbMetrlloP2/
 FcbBHMlsIMVRIQZOKtGhHlt9b+vY94pMEasUO43eRofreCp/goXj32rF93NiCko1rA5U+UFqmzJ
 gypi6ZlduutSxZyB7nuMYINQ8CGsu0id3O2qdg7x7FnseeYFgtnhYUc3YtpIqyzXOVzE0GN16K6
 ExawGxKJipQbZyfwdz0x+YZvoxokRHhp700Nstaup8axmOj73eVgAdnz8f/ppYnRKP6V0PCiHGA
 QToO4Ekq2amtUscRFqJGsb185AnThpO3dKCUlz44fdIlNOusqNVWaBl/EfjPg8Ne2aDx6NEQZak
 lkg6AerHsy/O8x3anhB+lgSzsz4syrGQEUy/CdsSBoLouhpMSc7x5q0nqdPMNhXp6GKzZvtc
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687498a8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=y9j2seIhk4up1NT0-iEA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140031

There are some products which support GDSP remoteprocs. GDSP is General
Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
fastrpc domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 0840a3d92513..3f6199fc9ae6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -27,6 +27,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - gdsp0
+      - gdsp1
 
   memory-region:
     maxItems: 1
-- 
2.34.1


