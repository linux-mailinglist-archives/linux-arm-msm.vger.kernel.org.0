Return-Path: <linux-arm-msm+bounces-42901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3E9F8C01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CD7D7A3F84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723A713D8A4;
	Fri, 20 Dec 2024 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F3aOkKoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95793259487;
	Fri, 20 Dec 2024 05:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734673896; cv=none; b=RJQZ8clb0r0JdoEiOQ/solWZclGjNLJWChniudQ6ovzENLV0Jo9GOOIaNQyrLFKGPgig29zsghewXtqHV80DGq++sdcmh5ouwHKyk41kfpHV0htoAGTR5dzTEjLZPsMooR/JZAzjUiwF5s0VPbFGwkxFXgYyFiwaorCVx+5qnvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734673896; c=relaxed/simple;
	bh=YgMqTjyDSEgMrokUdiDXbuor2wCx7vOLBZiqsoRKfgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sAFehWvsXl9Gxawfztd3RkVVZ7gG63/YZfcWV7wvy5kqZTB2ozovpPJdCyfm9gQYirGnAFHRUWKC+ZHD3H3ru2i8w2XMgx4S+oMAQ+A5/9ThxSYhThB/bR501+nfwuLILnLcDj3djEUESZtCB6mxyPEbwIJvjrWc6BPBjf6Mu2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F3aOkKoS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK47Z9e007358;
	Fri, 20 Dec 2024 05:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qAAUTlNjLkzkeQi+I5004MD/s1Twq7DehlXUUKAYiV4=; b=F3aOkKoSdZN6b1kS
	2o2kLJd7K0kIY4auq8guZ1sNEAwsVEZtpfcYPNX13E9zLPug5joxBSUnijb5VY2x
	OEWYXUiYtK/98qGTx4+5hqTp/0aDpJdFmG1OHNdJsiOoTrWMKJE8Axlg5/NqkjK9
	hnFhFtsGul7KnXks0Am5Jesel8d7DuKwKwfxOyYsJYFRM9JTrdwtfQYjbZZ6wAPE
	9kQvaQxsQRqBH07iULm4jcIYogGqVnWW5blWLCKe/8AhFLxfr7+dVyFdNq8msSlG
	oeFPxjKS1uSsEviIoged2CXX5hM/ESlwQoMc9Pyrom9d46YQS+ZVvEpiAHWKbyrk
	MBoWTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n19gr632-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 05:51:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK5pTQ6008364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 05:51:29 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 21:51:26 -0800
Message-ID: <6d91567b-0cbc-4d85-be38-2467e873e91c@quicinc.com>
Date: Fri, 20 Dec 2024 13:51:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: fix the secure device bootup
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>
References: <20241219025216.3463527-1-quic_jiegan@quicinc.com>
 <2b4adb2d-29f5-459b-bd85-d5d12876f7eb@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <2b4adb2d-29f5-459b-bd85-d5d12876f7eb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0E8jCB2TuRa5ANwl6YuxCmAK2oYAB8iQ
X-Proofpoint-ORIG-GUID: 0E8jCB2TuRa5ANwl6YuxCmAK2oYAB8iQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=754 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200048



On 12/20/2024 5:25 AM, Konrad Dybcio wrote:
> On 19.12.2024 3:52 AM, Jie Gan wrote:
>> The secure device(fused) cannot bootup with TPDM_DCC device. So
>> disable it in DT.
>>
>> Fixes: 6596118ccdcd ("arm64: dts: qcom: Add coresight nodes for SA8775p")
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
> 
> I was thinking, is there a QFPROM fuse we could read on both
> secure and non-secure devices to determine whether all coresight
> components will be accessible, and enable them based on that
> information?
> 
There are two known TPDM devices had been disabled on secure device. One 
of these devices is TPDM_DCC. In downstream code, we have an API to 
check the secure status of the device in TPDM's probe function, to avoid 
unintentional enable. The downstream API will check the register that 
controls crash dump functionality in TZ and the crash dump functionality 
is disabled by default on secure devices.

We need to verify if the downstream API is supported by the upstream 
kernel. We plan to upstream a patch to implement this functionality in 
the TPDM driver or any other device's driver that needed the functionality.

For the time being, we need to disable this TPDM device in DT because 
the TPDM_DCC will break the bootup process on secure devices.

> Konrad

Thanks,
Jie


