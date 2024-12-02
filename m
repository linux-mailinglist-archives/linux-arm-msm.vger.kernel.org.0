Return-Path: <linux-arm-msm+bounces-39888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C49E0765
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0347B64B44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05242036E9;
	Mon,  2 Dec 2024 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mswMmFWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2385C202F86;
	Mon,  2 Dec 2024 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148448; cv=none; b=ifXOYJzOZY2oom80YxjE9vkUq3Sq5ye7zRHDDTc6nTBgb3Y0SXMRBIHSHHXnqJZ7MFcCuN5WQP7MuBOktssGSZ8pTVFCYzbjqLPLNIcIPQieR018ly+q5P0HdXDy3vtql/6T+qvtxTq7BxZa84DTJgxSTOGjEza0jMkH/Wa+uCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148448; c=relaxed/simple;
	bh=finh4zIrmB/B6vTx4hHBDo6hqNjGs4DUogj01fxBl9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TwhaxLJzI7+CVpvK8N2ZvPQLRt3U5Xes5tAjkGHmBzcOxodYKa8mQivdUrXHAv9pW3FHp90VPt+BztlnQ32vD36Ja5wXzQH2PKEtYR2UPSTnKrBbblO1jNTtO0TaJN9KIwYix8P1+StgNKpQc6k9bY30CSfxPCERQR0dsoP3GiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mswMmFWm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28FvZJ019971;
	Mon, 2 Dec 2024 14:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vt74bQlK2rg8iXRO+La37nuO9AD5ByusHr3+bvoPIkI=; b=mswMmFWmeSCWmk9+
	/voQ5BxL96E5M53PbY7FsT2oLi5BJglXVhvFk+lEvzIXvqlmwBjcyvXclZOgpAGl
	pKU2etUtrsYZXvQGUTWyYB0PL5gbrZ7V6CvXbjekGuy5C+et3u8DYRbjo3NE1o3t
	NFEtPzQn3i5o6FCCs/EhCIEk/ntTbeJaefm5/o6n6VVM78pIa85stj5P/tpqIusb
	zTdAqkeJXYqF29QV/n7bCuE8wzNCQona9b+LR8Qi0wNKPdHh6XD91DtjKtX8/PzO
	/UEQ6BtO5lBINcY2CAMMYxbo2cKza/2s0ZetJnA5J51qJma7mPWlb/5160KfwyQf
	0LmSjw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36d1pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 14:07:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2E7Lem020645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 14:07:21 GMT
Received: from [10.216.19.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 06:07:16 -0800
Message-ID: <555d8793-320b-4f16-88a2-9d5bd40599ed@quicinc.com>
Date: Mon, 2 Dec 2024 19:37:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_msavaliy@quicinc.com>
References: <20241022104600.3228-1-quic_janathot@quicinc.com>
 <dd008ff5-ee2a-47be-8a5b-d4f3a1e2bac3@kernel.org>
 <75dc7814-a55e-4a6f-9df9-39b7c875dee9@quicinc.com>
 <6a40b442-6c4e-4abb-aeba-54ff9e86dfde@kernel.org>
 <3f0b67f7-32ca-4b5a-a655-df6f92258cce@oss.qualcomm.com>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <3f0b67f7-32ca-4b5a-a655-df6f92258cce@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BryXGnVL6HfFLnPHrs64F_Sz1OPVfQyc
X-Proofpoint-ORIG-GUID: BryXGnVL6HfFLnPHrs64F_Sz1OPVfQyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=499 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020122



On 12/2/2024 4:56 PM, Konrad Dybcio wrote:
> On 2.12.2024 10:36 AM, Krzysztof Kozlowski wrote:
>> On 02/12/2024 10:32, Janaki Ramaiah Thota wrote:
>>>>
>>>>> +	pinctrl-names = "default", "sleep";
>>>>> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
>>>>> +			<&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>>>>
>>>> This could be just one phandle to state node with multiple pins subnode.
>>>>
>>>
>>> Since we have different configuration for 3 GPIOs, it’s not good to
>>> combine all 4 GPIOs into one common sleep configuration. Each GPIO
>>> configuration is having separate requirements based on the Bluetooth SOC.
>>
>> I did not propose that. Please read bindings and other existing DTS sources.
> 
> Janaki,
> 
> you can refer to my older patch (attached)
> 
> Konrad

Thank you very much for the information Konrad.

Thanks,
Janakiram

