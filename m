Return-Path: <linux-arm-msm+bounces-21059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD498D4701
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACCDD284900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 08:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9F214C5B3;
	Thu, 30 May 2024 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQqpTWCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D96947E;
	Thu, 30 May 2024 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717057579; cv=none; b=Fk7lli5AAjF+qwTdfLxXeJZ1k1vkz4/KH6xGHjp36+eXGD3KeJGMFr/27ZeSuQ3MiGZtixGJrJ40gJshVJz3DnNiOWcbCRDR349LZlN+JNA8g175frLR3yYV4so18HiFO5OmLtVvI4C7AyJYdpu2YKwa9N521Ecdg59+TU8oZ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717057579; c=relaxed/simple;
	bh=L4JOef+KsnJOdw/0mMnpYLcdi+fPSzEUt6OudrDuSY4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RiAcpqDyfo9Pckm8zgrbIuyQJO7BSWRNjulZPFsqwv9EYPBk9fGWUHC8LJSSiHePhll6T9cnuT9K8aPEoXfZfPzUR5DaE/NsUGY4DhCx6zA38L84CqDVpTkrqL+CM3VQkDPgM9twYfSIxrTg0JaxhP4ZVgJlgnhG7CIkDx4Wsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQqpTWCy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TNI9YG014843;
	Thu, 30 May 2024 08:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bHqlnlZlU5+qtfVeRbJ6/c
	gGF9GkPbDQ8TcNe96NLos=; b=SQqpTWCyqC3aSzF7x5xRDuCaYVKNpH360Xszn3
	gsajt+M1ec9m8JQsxNKMQHSeBDI7rH2GqEjmUxzlNZVbrjb5iFlr8vuYR5PVn73m
	6sGq/8mCg9bqENCwRYJOxoAt6pSFtIv7sl8CIhvCWyLxGa+yXbtc0HcFPJp6p/E5
	/G53PFbu0JsenY3ntKdpryD8hRc1g/AhNF4Jh8M2Tv/cvS1VNjV/hSeHKLoEaM1Q
	kPqnCLmioYi+gdPHXn4J9takJToek+ymrWIV8iZtQVoQIKVhb9UfaIUpunE6yIGo
	wvkBRE4k6jw5p3E5v326R+vFDuk0eEARF5dk0svi3wpOSUag==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2nkfed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 08:26:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U8QAO4030306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 08:26:10 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 01:26:05 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke
	<mka@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
Date: Thu, 30 May 2024 13:55:54 +0530
Message-ID: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KfxyBRyiI-cSdBWDALc66qE1JKU4OIUd
X-Proofpoint-GUID: KfxyBRyiI-cSdBWDALc66qE1JKU4OIUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_05,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=392 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405300062

When working in host mode, in certain conditions, when the USB
host controller is stressed, there is a HC died warning that comes up.
Fix this up by disabling SS instances in park mode for SC7280 and SC7180.

Krishna Kurapati (2):
  arm64: dts: qcom: sc7180: Disable SS instances in park mode
  arm64: dts: qcom: sc7280: Disable SS instances in park mode

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1


