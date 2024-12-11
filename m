Return-Path: <linux-arm-msm+bounces-41551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E49ED4D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 19:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36659283E92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 18:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83562200BA9;
	Wed, 11 Dec 2024 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VMpaOa/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D1D1C3F27;
	Wed, 11 Dec 2024 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733942795; cv=none; b=ib29hTdK7OJjDVyKn0XCZ7quxD2fH2O9+irFwG8/IMOxqlrFsuTANBXy52pGFcrQSezKsAaJng7XE+tZ3DUqdNE+4X73+MyF9zzxahv1iC04tvOI6wLLccSTEJSLxfrbZULFrbVDBJOucNBN2rNrSFEjcBSCynL07ySAVZwaxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733942795; c=relaxed/simple;
	bh=8SEPiAG5/bZ3zubyts3IFkmbUAYRgHOi97EOjXc5kaI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=m3yVq9Q7QOATpkQ5Etx5f2yIzLdj7SZPiEBt8qo6iXeMpV651VUWWgq4f2kkuaY0VVq1g2yPDDrPbacEV3xpZbxnOKgj/kh01N/HoelAke4XazCT6wdy/eI9EPnwC7lEGNRj9L/AsZHbeVyPNCI2/d0qPYIspTq0WsUZsb7laOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VMpaOa/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHDGPu003065;
	Wed, 11 Dec 2024 18:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKBF9MwwWdxtyhM/vZBDK5wtGQUQme8Sdv89LX9q3k4=; b=VMpaOa/v9X6ACdwL
	WSIwXzqzOZAiz0No5IAwdkcsl/NUELLHv13Y+iDNo0DBlyRDlJ/d9b1D3WpBxz42
	3j/Ll/6n1K5RNXJ3dHUfvFQhkVbcTr+HZ0zzlZxk7sl3BzoN1bPZDZccosxldwd9
	XsUGXYIRPbw8wT4o3UmY2erS80vBspj7U7Nx/woMK3mypS3d0CeCyglgrYWGBlgc
	WpZ7vOB92Z4PHHejAZJo65k6EwFa27BLNI5KQspL+t9nqXJg0MJIWMtPXjkH5TZm
	CPPUkykdZi+uqtdCYwWQ1aL0NgvsgZTvnbwWld94Gwq80jkgwDpf+WseqiVKZv0T
	pFCpgg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9txqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 18:46:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBIk9WK017308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 18:46:10 GMT
Received: from [10.71.111.113] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 10:46:09 -0800
Message-ID: <f353a230-b9ab-4c25-846b-6e5f0e404ca0@quicinc.com>
Date: Wed, 11 Dec 2024 10:46:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: Add board dts files for SM8750
 MTP and QRD
From: Melody Olvera <quic_molvera@quicinc.com>
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
 <79e55e6e-e560-4f43-8d6e-bbaf7fcf157a@quicinc.com>
Content-Language: en-US
In-Reply-To: <79e55e6e-e560-4f43-8d6e-bbaf7fcf157a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fn3miiM-g8wIKGJTEFmkh3ST2ifxULdN
X-Proofpoint-GUID: Fn3miiM-g8wIKGJTEFmkh3ST2ifxULdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=889
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110134



On 12/5/2024 10:21 AM, Melody Olvera wrote:
>
>
> On 12/5/2024 8:45 AM, Konrad Dybcio wrote:
>> On 5.12.2024 12:18 AM, Melody Olvera wrote:
>>> Add MTP and QRD dts files for SM8750 describing board clocks, 
>>> regulators,
>>> gpio keys, etc.
>>>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>> [...]
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>>> +&tlmm {
>>> +    /* reserved for secure world */
>>> +    gpio-reserved-ranges = <36 4>, <74 1>;
>>> +};
>> Any chance you could describe what those specifically are?
>>
>
> I'm not too certain, and even if I was, I'm not certain I'd be at 
> liberty to say.

Spoke w some folks; looks like we're suing these for NFC eSE. I can add 
in next ps.

Thanks,
Melody

