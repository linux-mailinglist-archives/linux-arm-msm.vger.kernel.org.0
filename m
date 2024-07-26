Return-Path: <linux-arm-msm+bounces-27102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09293D60E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 17:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB8A5286A61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 15:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0865717B4FF;
	Fri, 26 Jul 2024 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="afkN4mU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F496168C7;
	Fri, 26 Jul 2024 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007606; cv=none; b=izpgob1aDYWEWSWsL2LXHkDVyRSJ1m1PwJdlJDOkvRADnX3UYKqUv9paZXMJYKpa3uRD/VjM6dUqbN6l+cSElKmiXXlEtAXHd7CJKwdhJ8V0mwd+hHbYdR4kUnefTfUr2sKutDbdF3Nwccl1CGnhsWHU/yGe9NJt5Z02eTrGPt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007606; c=relaxed/simple;
	bh=TVmLI1FzU19Gx/05GmHuiemnFRT2SG+84OzQo+aqK44=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YnWbI54qB+FdckngZhBPWHnlfd/ZbsKGJRG1QGwd9Dx0xkTLJuOZktWGG9kDyp45nR0F/dJ2e3e8MzGbDIePYUPay6VwLvWSHrq4D9CwhLlVFCgB6ilO+P6tTS+or495nbpLdtic3zw7CmkduH7rkYx4y1GNPIWbSX4Eggxn9WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=afkN4mU0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QC958H010206;
	Fri, 26 Jul 2024 15:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJqeYw5ghiRxZzInAhN4EHsGauIEswvablSmZO8fyxs=; b=afkN4mU02hfFLh8I
	i7QyDbFMhKjG2/YNIBF7di6tQKMe03QJU/X51iRNClpqlZDsBtR6oVQLheS7WzQy
	j01/qUojrIH92uz4oKQ72f9wvwUTVI5FhcbVMbdTMtwNnUsYSY5PL40ftzdh1axH
	sSV37DWrFEP/ZfrPezyIeEdg6P53rPtwDVvT2nsyIauW3UHxYTcIjCAP3kaeEzsr
	e/YI1XNlNIUJ3z35u6Q2OeMqR03a8v5LlCsdw/pF/eki4u4JRl1yXWyARw0JWYK2
	K4o7HY1UchySYRUEcUxm61Is4qSBjiwtJsqXSn5CweH3lauoV9KqTZkE6AxsLcqE
	mc0f7g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m2191sda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:26:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QFQfM2018218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:26:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 08:26:40 -0700
Message-ID: <a4b39d39-703c-3ea3-4523-58fa65865c0d@quicinc.com>
Date: Fri, 26 Jul 2024 09:26:40 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: msm8998-clamshell: enable
 resin/VolDown
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
 <20240723-miix630-support-v2-4-7d98f6047a17@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240723-miix630-support-v2-4-7d98f6047a17@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UZ0MoTsmhuKiNgjcorwonV826ZodcC6C
X-Proofpoint-GUID: UZ0MoTsmhuKiNgjcorwonV826ZodcC6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=536 bulkscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260104

On 7/23/2024 5:28 AM, Dmitry Baryshkov wrote:
> Let resin device generate the VolumeDown key.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

