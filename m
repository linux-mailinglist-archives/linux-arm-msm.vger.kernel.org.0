Return-Path: <linux-arm-msm+bounces-37100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA69BDE61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 06:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1B41F23E8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 05:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A825190696;
	Wed,  6 Nov 2024 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KWH8KeX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D722C80;
	Wed,  6 Nov 2024 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730872530; cv=none; b=hfBYpBcokD76fHzpgCRVhHs03Z5lCWfjXJu6TpzRzA8WFwgPJwKcO7mrACjHdjQ/EZMHMiEB2X6JsXEunaC5JQeSpgZEtvnoaZetb8x6XbF12SBxz/VvVNey9PZsQ81JhSklHvKMNeyTsWXrYNHgdqN72hLWfzoNR2DqQXQekgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730872530; c=relaxed/simple;
	bh=NYez0m/jimO5JejBvOByvS6zoER5SI6TqON3EfoumcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=droA9cMhamMrRbFfSKUlXZDwjMeWnuKudq56Hj2IagdPYosiV++5xKgTHjaWKoiB/xXrfQGQbkh8IWfrHH3hqatiK6mor9Vhz34MNKkC4LBtbk0IGJsfkHvUGDK5sAnPsrtF2DqrilS4uCL6tjVIIVtoNXbb0REm5R9OHKXgwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KWH8KeX/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5FUqK9013189;
	Wed, 6 Nov 2024 05:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSpgCxbiGI8nQRDnE4BM/8pmdlSFVSya8qnxpAcJhvY=; b=KWH8KeX/yclXfCvq
	H7AhudhVslXpa7FBUghMJzMqPywRNH256SWtPWGCJqfhske+pGnP/6jMQ+HWn3+5
	akUpm3/fUuBftFWiseT8msIIw5G+RslT98boTom5+Pb1Z+T0XElMtJlXTLgI4Cg3
	KH8ugps52Rb3APv2Z2eJMFvBQse02+Vo1j2Fr6LBpdH3B/WZnUcRj0B3+x6UO09X
	np1DK6JexXk5Qrpugbn+euVd0x0ZWJUNDWFuHNuXDDGDbcvzIROQFn+KtTYOwzpD
	8hKmtC5bnuLF+tj1bqtQiiTT4WtlKaITuNhl5l0MSdn47qh4jzFuKtaFrrGduxgK
	Eg3p5A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rsvq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 05:55:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A65tNne009243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 05:55:23 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 21:55:18 -0800
Message-ID: <919bf75f-890c-41e7-b096-5804ac9bd3ec@quicinc.com>
Date: Wed, 6 Nov 2024 13:55:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: Add coresight nodes for x1e80100
To: Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20241016063113.673179-1-quic_jiegan@quicinc.com>
 <fc2f0bf9-7afa-4db8-a234-26c01749b070@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <fc2f0bf9-7afa-4db8-a234-26c01749b070@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sLcLEfXyGTPmH_gTC9nfJQ7p4N9g7BXC
X-Proofpoint-ORIG-GUID: sLcLEfXyGTPmH_gTC9nfJQ7p4N9g7BXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=579 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060045



On 10/26/2024 3:37 AM, Konrad Dybcio wrote:
> On 16.10.2024 8:31 AM, Jie Gan wrote:
>> Add following coresight components for x1e80100 platform.
>> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
>> TPDM, TPDA and TMC ETF.
>>
>> Tested-by: Yushan Li <quic_yushli@quicinc.com>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Hi, Bjorn

Just a gentle ping.

Any further comments before apply this patch?

Thanks
Jie

