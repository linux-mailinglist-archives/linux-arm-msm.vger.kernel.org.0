Return-Path: <linux-arm-msm+bounces-38619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBFD9D4826
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC56B1F21C0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8611552EB;
	Thu, 21 Nov 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z/yrxeQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E568F230986;
	Thu, 21 Nov 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732173622; cv=none; b=VOA416aewDiYA0FKlXrel+x5/fw7ocm3N+VRdGj/KYA4DVUOy92KU6wxRAL+WH2HaDhbYgaj8MFyxZ0hNeDDA7zKKqWpg3f0DaVM5Ibc/hBaCZ1NzxMajV02MFQrb4jMth9N7OyQtCsn8O2sdz4T5PdlEBZbkQ747ABsJCDHhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732173622; c=relaxed/simple;
	bh=BuYPQEv51JDUOQNDPxYBvQEdQ5jrzUoHWcbbpCSkLbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g5zFGx36nKDZuljMttdnP4Biip/f62G14+zBw50nzW5fiDEnew1bLJ+oXh5Mrp7WD0kCq0nxZRlkl9J3zIIhgehUB8t7+Q4X7aFXr4FKRMYCloROVsZvnKmqSGPNO/91tUDDljQvXGMFfNlcMxbenHFGe2zSPOIUAhQGj5FhdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z/yrxeQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKL74Cu019249;
	Thu, 21 Nov 2024 07:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuYPQEv51JDUOQNDPxYBvQEdQ5jrzUoHWcbbpCSkLbk=; b=Z/yrxeQGufWnNnx7
	8TBHdPZlUgoy1q3WEudqSt3rdp2yDowMRCWo8Vgc9YrU/6/tXCEHxALrltvMO8Cy
	yJlp07xuIfqPVHsgEq5FENDgnQB0As7UdBOgMTOsbp9JCtBuUu83filoGERQr06B
	Cffn0fPS3dJE7HScfRdQ5jsFYtwx6fyuSc3FNbjezv4G+ZdmpbBUH9cqOZGM6B/E
	H9Z2Uv1iaWo840wW9Jq0Vtnm/klbAQTssZBea49GdjDkxKyib5x5p4p1o1pOIe42
	t68mSd+LOEPLRhhDTvO+IFR2EfuM1ZBWxP82daLOVNYL+6EhMoFnCD00UNuHRplQ
	M6SBJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hk4yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:20:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL7KAja030496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:20:10 GMT
Received: from [10.64.68.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 23:19:59 -0800
Message-ID: <70217bcb-c8ce-485c-b106-13b2f69c71b9@quicinc.com>
Date: Thu, 21 Nov 2024 15:19:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the QCS615 QMP PCIe PHY Gen3 x1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <robh+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <kw@linux.com>, <lpieralisi@kernel.org>, <quic_qianyu@quicinc.com>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        "Krishna
 chaitanya chundru" <quic_krichai@quicinc.com>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-2-quic_ziyuzhan@quicinc.com>
 <b4srulghkbgrx65n64tsyhbdhn6xqv6gjhmovtozc5hjzmq2nm@aq5onb5fv3ks>
Content-Language: en-US
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <b4srulghkbgrx65n64tsyhbdhn6xqv6gjhmovtozc5hjzmq2nm@aq5onb5fv3ks>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qgEzwvwovuzBQvSmCPOPFQuf2BpHC9Vj
X-Proofpoint-GUID: qgEzwvwovuzBQvSmCPOPFQuf2BpHC9Vj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=669 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210055

The commit message has some problems, I will update
On 11/18/2024 7:00 PM, Dmitry Baryshkov wrote:
> In which sense using qcom,sc8280xp-qmp-pcie-phy.yaml is considered to be
> a dedicated schema?

