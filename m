Return-Path: <linux-arm-msm+bounces-26868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA112939E42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C752825E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDDB14D2AB;
	Tue, 23 Jul 2024 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IYgcetja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6823A1DA;
	Tue, 23 Jul 2024 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728325; cv=none; b=dFbaDKakmuOa0u55G8M062fN0kq7PHaf+YS9CFrVojr5GRp3Q88cj8M+n0qjYEthPm/rOSe2ePe3sbiFA/CQ4Lfpk3ZjbzEJlMI1UU57uFw1AkXVyHzu9BWGajGPmnXFKj4gkVQTRoIpYsfOK6pqU15OfYn/KfgptESeLGBh7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728325; c=relaxed/simple;
	bh=BoVzqOahAI5n/xzeJxrPJfuBTg0gYpbQqOeu09Mn6QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c9h8j/hs4Kw2bMISpK6UCYjMvyYOXw5pMrhsdVg5FdVirysg9pANV8rmIvQJRCzwdkANAU7CZirqmdTXjTlGhteIXSoyoIOHG6BQGUoKq8WVDFmQ/++pUSs1diZuzd9tTecpTw++/0bVa7Jv9RiV5PaPiIR72hQqXSUFK/JKEmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IYgcetja; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MNWpQc007911;
	Tue, 23 Jul 2024 09:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HPApwh4hYIJa6LIyq9TqnANMP7AhD8peQkTtE4B40AQ=; b=IYgcetjadABTldl7
	BppSdlhEnlzNkrDooxCm/x7VZ3GO2CD6LkPSZX5g8aDkO6wIgkibrcOvC/2cmHmR
	hCT1wayCz94uyI6CdSgI+k2ib4/rNiDb6mrgNSGheblNspgEmfeZdlFd8q34XYgW
	tDa9o0/SCDBq1+rUMb/7ur3ugSDLMZjW3hUV8KZpcnyPLFKSIawbdCMN2nrbk0P2
	fU49fsv+7hOMGjpiEJb8dSKjr8GdsgA2BgPdV76wnxhUnO5RrTYhurytDlAgfZQx
	D6rjDQTm8liTujIUesUrlTflW7zhlRdDTsw+nSYQHE8aNrQ7P1dK3EkWvLd8NuRR
	9UcNVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgxb71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 09:51:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N9psti013273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 09:51:55 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Jul
 2024 02:51:51 -0700
Message-ID: <490c28cb-b3c9-4150-a5c2-c2ffb099018c@quicinc.com>
Date: Tue, 23 Jul 2024 17:51:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as
 DMA coherent
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <ahalaney@redhat.com>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20240723075948.9545-1-quic_qqzhou@quicinc.com>
 <7ae04ef2-bbd2-4e62-bf66-e61f64b12579@gmail.com>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <7ae04ef2-bbd2-4e62-bf66-e61f64b12579@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5g3N_B58YF0gmcrUAfWjRwt3PhFNU7_s
X-Proofpoint-GUID: 5g3N_B58YF0gmcrUAfWjRwt3PhFNU7_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=821
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230073



在 7/23/2024 4:12 PM, Krzysztof Kozlowski 写道:
> On 23/07/2024 09:59, Qingqing Zhou wrote:
>> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
>> mark the APPS and PCIe ones as well.
>>
>> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
>> Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")
>>
> 
> For the future: there is never, never a line break between tags.
OK, thanks for reviewing and sorry for this, will update in next version.
> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Best regards,
> Krzysztof
> 

