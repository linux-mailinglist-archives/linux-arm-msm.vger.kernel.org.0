Return-Path: <linux-arm-msm+bounces-40612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749369E5E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 19:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45E616D4C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA2222D4C6;
	Thu,  5 Dec 2024 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TFTT9GLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895F22B8DE;
	Thu,  5 Dec 2024 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422901; cv=none; b=aM15IOGN9Abi3Ia22gFbNVDithMNIoIz0oJ5mWNAZawhxF5vFCrH8AVGDEAcAf7NdBW2gFX2Lca3hkei3WiWNmDyL0ygohyXpY/u3DXq8W6lrz51oWbOEa6DIe61JGeJ1LRR+tS9DHCL6Kiyeo28l7JFNqtmQbsNUzorslUo+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422901; c=relaxed/simple;
	bh=XwR2cNJ9uBLrIjtNgqSrHPSpCb0eM4TauolHDDDSVFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C8eQ1Z+Cq1TFQoH+JUmk2NEL4LDOAqG3JNMw9CCsYUlBNsUiXY6CpqYH883URZLpvjX9MfNKq4N2ap6LRfFukLFqR2g7rQZOFdeS+L1X5fRH8wi/0dLPtQuRpz8GNvshgC0c2dfu+IEz24WmLicKRHZ2iPdryDYUsmUdCLNemgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TFTT9GLY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaVIu004765;
	Thu, 5 Dec 2024 18:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acODbYzobAE0Dphz+eIe7GNwKUbyyVbd5QQ9b93IuCo=; b=TFTT9GLYoYB8Q8zu
	SwsYwzmufsh74OYvxdkJb3YTTlm0ZcP0E5iy9gsMvlgXu34BtwI7ZF7gUSsdfjhW
	hpv+4cSfZH1DizSRxr4QX78TWBvAwQnZgw4bhtAhN1rjypqVWqbdkFmiHkffauks
	ef9TMz62pdeFMBQj0CPPGgOg6Gcd6B6Nr2DVgVVMiRMvis2OPbqjDh9rzxzGwVw7
	3r6rwXP/4CRdI3WihSjvodZF/2pSZJ5pIDABx+54mGgHEAxdJxDEcpXq+cl9WK/7
	ro5azyjEKoiiu6yVN9EnWwsPB9+hl1MYxUv4F0+yDgVxA+UbIKLWb1JHFkabalbD
	rBr6ng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3faye8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:21:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5ILV2P015058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 18:21:31 GMT
Received: from [10.71.111.113] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 10:21:31 -0800
Message-ID: <79e55e6e-e560-4f43-8d6e-bbaf7fcf157a@quicinc.com>
Date: Thu, 5 Dec 2024 10:21:31 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: Add board dts files for SM8750
 MTP and QRD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-6-4d5a8269950b@quicinc.com>
 <b9225284-7830-4aa4-aed2-7f58fb7320e8@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <b9225284-7830-4aa4-aed2-7f58fb7320e8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ra41wQQj1CLGgFRpQ-gtTLDBKbtBTp6f
X-Proofpoint-GUID: Ra41wQQj1CLGgFRpQ-gtTLDBKbtBTp6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=732
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050135



On 12/5/2024 8:45 AM, Konrad Dybcio wrote:
> On 5.12.2024 12:18 AM, Melody Olvera wrote:
>> Add MTP and QRD dts files for SM8750 describing board clocks, regulators,
>> gpio keys, etc.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
>> +&tlmm {
>> +	/* reserved for secure world */
>> +	gpio-reserved-ranges = <36 4>, <74 1>;
>> +};
> Any chance you could describe what those specifically are?
>

I'm not too certain, and even if I was, I'm not certain I'd be at 
liberty to say.

Thanks,
Melody

