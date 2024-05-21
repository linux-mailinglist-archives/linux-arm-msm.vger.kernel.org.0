Return-Path: <linux-arm-msm+bounces-20090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC48CA5AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 03:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3081C21088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 01:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3564A09;
	Tue, 21 May 2024 01:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E8Jo3dHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8553923B1;
	Tue, 21 May 2024 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716254434; cv=none; b=sEpqIP7SSQvCQuz2JFwil7NxVeq1eEMqesJId53Gex1DmFM/mU0eXbbrw1p2ZkC/p1IQM/uiK9Gd1a6dvG/d2gOleo0O04x+y5XiDG/VMIriOC2WasFb1JSUlf1JPA7c3Z4+rfvFKH6rCXVQXonFuGhP6iClz9OvicEoII9Rt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716254434; c=relaxed/simple;
	bh=yQyoyioQqfnUOYTDzIp/o6BejE0U2tKRePUbRXKt40k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fAMtHVdCAOdzplMt0hFtHFIUjWTgx2/rcCTmiyw4tfHY88gmf1Pcd/y1PkdjAY3MAL6bItQX+Eqwmj5QbW7nCEo6gA91phw5SnepOs0PxHI94jcZIaUpEJuz0dCt9puN0PbW7zzSfLQWTXRFbgnRZUinPkmGxG52bsdkEaOShjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E8Jo3dHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KMXeYu031481;
	Tue, 21 May 2024 01:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=IIWyZZn
	QKXDcReMVwQee80TtKPRMfXZ4Ggeht99WAz0=; b=E8Jo3dHtSX75BEBul28Y9lc
	lpzBMPkxe/kNdcgz1Uc/siN6fhCQoIV9tKxPv0q/cq6mTrvXtmviZIF2A5KLZ/XO
	q4Ts/kniiCp0BRGcH0R6pL+zcotG+6hg46JmPuUwaZvx7e0qrwS1EJv8nfF7SFR2
	2UKAk+gQo1hVb6NXri7/8x9I7qK5xpAJ1JOYMBsphjY6luGSEi48+UgcoEFGW5QY
	vQ+f8ecdVKER5qKvJMGTD6Im0HghESQldrloTaxFqV/tTZ0VeeH4Vp4GnxP0JWH5
	VvSmL/kcBMun14M2qwEBFHQ0Ilyz6fkU3cziVVfNZkeht8KxeZoOMs0NxAaOYXg=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3w5581-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:20:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44L1K76Y013806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 01:20:07 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 May 2024 18:20:01 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao
 Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song
 Chai <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>
Subject: [PATCH v1 0/1] arm64: dts: qcom: Add coresight nodes for SA8775p
Date: Tue, 21 May 2024 09:19:45 +0800
Message-ID: <20240521011946.3148712-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hrTO-5BkPuDDcwlBbupm-evwRgTSEdCC
X-Proofpoint-GUID: hrTO-5BkPuDDcwlBbupm-evwRgTSEdCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1011 mlxlogscore=667 suspectscore=0
 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210009

Add coresight components for SA8775p.
The device tree change is checked by dtbs_check command and these components
all tested with SA8775p device.

Jie Gan (1):
  arm64: dts: qcom: Add coresight nodes for SA8775p

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 926 ++++++++++++++++++++++++++
 1 file changed, 926 insertions(+)

-- 
2.34.1


