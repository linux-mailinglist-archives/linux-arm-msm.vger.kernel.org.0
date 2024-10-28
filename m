Return-Path: <linux-arm-msm+bounces-36094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74F9B21E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 02:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE1B51C20869
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 01:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324BF335B5;
	Mon, 28 Oct 2024 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FUdmPhSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8768472;
	Mon, 28 Oct 2024 01:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730078431; cv=none; b=K80xQQN6dvq+SFryIADVbsQ7jgjDurnaiP41JdikR085xOxTMkzja+MQmH5auxBbpZFyxOqHNGamNQqsQK01vVwnktmA93486DZmrW/57978TML8YUcfB0MfoF2dJ7oTgHdvE7POzGFMYDUxlkD4hYyUrPyroBRuzNmsjdvK/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730078431; c=relaxed/simple;
	bh=S7jNH7zfyCZf0m4RwT/LouyXwbm/40/jo7JXee0GmFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hyMH/s4OuEN2XfuISJAVS75K0TaEsAXitHSex6DnFZNE2ZoaS6qe1WPOQsKMr4f0d9zzzQVaEpDJgvMcqU+sdU4T8z+1gkK+W+7VYQ+uxrL8JXBShoM13QGioFCS4KsvAbepXaZ7LHEsBSZZ55MSCB1TBPI7Tph+jkwJIuShStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FUdmPhSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RJnPS2027996;
	Mon, 28 Oct 2024 01:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLBYUSMmIdep5C2RU+3i20rl8sIBBQEAw/LrVj55sNw=; b=FUdmPhSsC1EFOJSJ
	vRWV38omBoHA9EOVf+Q61vX3r1umbgReAH2nEAeSJsTFJAxV1E/rpLWe6UL1q3WN
	0Yb02L5P204fEjF2s8IG13iWxSzfoqdYNYj/DzVVPAn6+/LjfY0UfvaMYroCloYA
	YuF7XwzLO21kEh2dgiITVnhV7KSbaPIuNcOOAFJLy/nbO3nlo2PyYRf28mwE2Nwe
	jAml4M7ErHZQsb5VdR0ZQRuY7OkB8mVdELrc3Z9uztvlkPxjYD5zslbQ7NRAOnLx
	hIxwgOXIvd2J5Js9Dmm/wYU85kDvHfJwIps64tleC+OQtsVYNVH5AJ0cIjC3hh/N
	scf7TQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4uanm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 01:20:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S1KOBd007176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 01:20:24 GMT
Received: from [10.253.11.110] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 18:20:19 -0700
Message-ID: <fee8f3fe-f5b7-4c07-bef0-edd58cb621ee@quicinc.com>
Date: Mon, 28 Oct 2024 09:20:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: move common parts for
 qcs8300-ride variants into a .dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
 <20241017102728.2844274-5-quic_yijiyang@quicinc.com>
 <d08b8dd0-18f9-42e2-b0ac-b4283df0af79@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <d08b8dd0-18f9-42e2-b0ac-b4283df0af79@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x8uGFd31argrYyxqhBL7CdVRKUBjMKFF
X-Proofpoint-ORIG-GUID: x8uGFd31argrYyxqhBL7CdVRKUBjMKFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280010



On 2024-10-26 01:55, Konrad Dybcio wrote:
> On 17.10.2024 12:27 PM, YijieYang wrote:
>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>
>> In order to support multiple revisions of the qcs8300-ride board, create
>> a .dtsi containing the common parts and split out the ethernet bits into
>> the actual board file as they will change in revision 2.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> [...]
> 
>>   	chosen {
>> -		stdout-path = "serial0:115200n8";
>> +		stdout-path = "serial0: 115200n8";
>>   	};
> 
> This looks unintended
> 
> The rest looks good, except I think you forgot to drop /dts-v1/
> from the dtsi

Thanks for reminding me. I will fix it.

> 
> Konrad

-- 
Best Regards,
Yijie


