Return-Path: <linux-arm-msm+bounces-30870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586A96D642
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5289B22CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 10:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28439198A32;
	Thu,  5 Sep 2024 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D3i9vcU7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C919415D;
	Thu,  5 Sep 2024 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725532733; cv=none; b=LcQxscpSMIkgE4nqjDAsno6+EEAe7TCpgGimNF5aCRmgK0YakxlcdyO/rHvN19w4AGOqU89Bd3L5V12nG//uw2JKClw8uA65IB+Ymuk7Y2t0K8hLUD9voRDIAiVQPJ5fzvDF/L6EmJGlKR9xLNHfMcgL5fahbmFg9CaXFpvcTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725532733; c=relaxed/simple;
	bh=2gYVnHjTSCGi/CPPbfn+kxr6R4rjLEzhWKTGwbZM3xc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=koSXt3/xE+mprbIPDLdVwoYL/fbUWVqC0od1Dxgj3Y/VEVZajbyfuyYjwbCNuW//yaRQnPhHVBPttOZRdpOrQdR1Zsr+LQGepeyAXmTwauNBIFrkPgqQN9bkmfJhRfuhd0NimsbV9Tl2Xt2Am9us8R2pW28xeh0ZAeoTkrRHJec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D3i9vcU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485976oQ016174;
	Thu, 5 Sep 2024 10:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jKuq1/6RTj27HryUL4nI48
	UGP5zr9AdPpWJQsV6pWw4=; b=D3i9vcU79A3aieXdSpPlZ346IHOYotY5JON4zK
	fj8NCggBjlSCucjKSQXVpavOLO2Llpjnf63WJlLYL41cd3iEhYbK/POoA9DstANF
	lRl0h4gKXzF4GptSF868Q8wrm+LZXPZ4j7Yu86Be5dy1AqljwxtejtPJSnEJfdLq
	+HOpRJ/WsAhyb1BHAT7Gr276Ngrtd9vd0XpX7I4Xtg/BhpqBzaygHEnNYqkr3u2u
	zJJQ83bemeAmNJ/8MiUEdas3xvzt5hRKF6gUr3zfyC3zZeBuHvAP8TfM9OCVFcws
	g8L7+jLujlTb3vP6frMhxX89q+7VdStr65PVLU+hLKIYtrHw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrm1nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 10:38:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485AclMK029814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 10:38:47 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 03:38:43 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: [PATCH v3 0/1] arm64: dts: qcom: Add coresight components for x1e80100
Date: Thu, 5 Sep 2024 18:38:23 +0800
Message-ID: <20240905103825.2154633-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: rJt1N-3ysWaz6cEy2dlvquNKt53NIp5r
X-Proofpoint-ORIG-GUID: rJt1N-3ysWaz6cEy2dlvquNKt53NIp5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=378 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050078

Add coresight components for x1e80100. This change includes CTI,
dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.

Change in V2:
Check the dtb with dtbs_check W=1, and fix the warnings for
the change.

https://lore.kernel.org/linux-arm-msm/20240827072724.2585859-1-quic_jiegan@quicinc.com/

Change in V3:
Disable two TPDM devices, that will break the booting of the secure device.
Tested with commercial product.

Jie Gan (1):
  arm64: dts: qcom: Add coresight nodes for x1e80100

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1516 ++++++++++++++++++++++++
 1 file changed, 1516 insertions(+)

-- 
2.34.1


