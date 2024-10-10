Return-Path: <linux-arm-msm+bounces-33833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9649982CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DB711F22349
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A891C2320;
	Thu, 10 Oct 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FX9wII5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F301BDA84;
	Thu, 10 Oct 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553766; cv=none; b=f68nvrpAh28hAFC7rRIGOMqMf6hocMbn2jQlTuGelT10thXICr1fc1rbs4x+y1FR0YIHbmcu179Yu2yyZDQz4yp8zEi9mKzr59YGfBOwJjTeLpiBf96EoCokCNs4x7YoBb30yFBluw6923pHAOnU+OMgKE0sX8MeAXrYFhBDDHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553766; c=relaxed/simple;
	bh=Tyl00PbkL/ws7xZ1wCMqtutTUiJDn/3tjgm/2QQIBAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pa58jGcDwOqHUPj4iLOw/0pWHu9EMPcaEBWPJYgzjXchobwEvv5lRhfpMc045F3D9a4SBiWPf1S120kIMFycFnEKcWjYEbih4YR90F/5p3S+c2uYSrtVKBx0W834tVEr7YgHhuzmP3upF5eXwohcYr77Wsam9fehLm39GQiDsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FX9wII5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bWIj024265;
	Thu, 10 Oct 2024 09:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5S6BVALT7qXSFotZAPbtBOUp5KIHBelry/SMIeD57sk=; b=FX9wII5V1hCC2bpi
	cO42Usl78ed9C7jMpNZuj8INHdCD8tfMEtWphDbcS8LsInid/tQk3oKwY8W4Wyu1
	z7Jri/YQ99QkTmqUzRKMWTibqfX62goUtgzJHInbhXC/qOTzrtxcdyYDyneuCu64
	mJtLK9YaR2U4aPZSeimX2MrLWKzmsp3SibJmDYn9xkdHMCJ7vjXw9uLZJW8tqh67
	20THORRvjlTDuTg0B2G47y5wl0x8Nb7/e2sV7KrIsKpkAf7hNHmNldb0lulPLJZY
	Y0OAx/uOuiZfqwu+23hr2HjbVM5ZyLTOUNtor4nQO0PIntGlMOKOntzb2hjPw9Wa
	msB+Pg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wgs83e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:49:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A9n8FW031874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:49:08 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 02:49:04 -0700
Message-ID: <742d1cec-13ec-4f08-b7f3-611c6d602b3b@quicinc.com>
Date: Thu, 10 Oct 2024 17:49:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add Qualcomm extended CTI support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tvXki-f8ORmCsyLIHWqsu_8qQ73ff2Ra
X-Proofpoint-ORIG-GUID: tvXki-f8ORmCsyLIHWqsu_8qQ73ff2Ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100064



On 2024/9/3 20:18, Mao Jinlong wrote:
> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs on
> another processor on the same SoC, or even between SoCs.
> 
> QCOM extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
> 
> The commands to configure CTI triggers are the same as ARM's CTI.
> 

Hi Reviewers,

Could you please help to provide some comments from the design point of 
view for the changes ?

The main difference of extended CTI to the normal CTI is that the
address mapping is changed and it supports a max of 128 trigger signals.

On one soc, there will be both normal arm CTIs and QCOM extended CTIs.

As max trigger number becomes 128. So triger registers becomes 4.

Like CTITRIGINSTATUS  --- > CTITRIGINSTATUS_EXTENDED(n)     (0x040 + (4 
* n))  n is 0 to 4.

Thanks
Jinlong Mao

> Mao Jinlong (2):
>    dt-bindings: arm: Add Qualcomm extended CTI
>    coresight: cti: Add Qualcomm extended CTI support
> 
>   .../bindings/arm/arm,coresight-cti.yaml       |  14 ++
>   .../hwtracing/coresight/coresight-cti-core.c  |  75 +++++++----
>   .../coresight/coresight-cti-platform.c        |  16 ++-
>   .../hwtracing/coresight/coresight-cti-sysfs.c | 124 ++++++++++++++----
>   drivers/hwtracing/coresight/coresight-cti.h   | 123 +++++++++++------
>   5 files changed, 253 insertions(+), 99 deletions(-)
> 


