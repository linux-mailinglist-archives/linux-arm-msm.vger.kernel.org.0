Return-Path: <linux-arm-msm+bounces-28017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC59497DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 20:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031221C2277F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 18:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8586413C90B;
	Tue,  6 Aug 2024 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gc7Z832/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868838F77;
	Tue,  6 Aug 2024 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722970692; cv=none; b=NZGA2rtQ1nSkx6/55ShtG225Gxiy6iffuKVN2CHJMaimz6dLHC39ioxNDP0qvzxTyCQwUkWEEuetpmEadFfslWIhrlCmM2OnfbxONMXUjwApRn3VsBnlMD+inigpNGpsTgLAWf2Dtw4R63uSMtSg50ERJUCmjyq0ZOdYcxibZj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722970692; c=relaxed/simple;
	bh=CxyhdiqFzs0KCYLIqZCch2rfpOd55xLPflf6rfNePOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MsXGh0jN2nVpqT77OY7z5Y37InpBBUehO+zj0eikb1yfSuSjWZGieOUHbX0SmieJbRdRBF9qhZdjsqoaR+ITXg+8/y2jtxKbc0g1XGJTFTsY1yVp1Mr9htfIe+ken20sae0oo8x/ktno/WGVyAfKEE7pV8l/UXtq7xBHWKdo4h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gc7Z832/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476H6Unw013589;
	Tue, 6 Aug 2024 18:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNhD6pIC+oLP/zfHBFA5xgjXKbH5MKc03edOBncHJOI=; b=Gc7Z832/QOIKaCIp
	y4kNKx5pRPhqRhfxeOjQyqgY55L9QM/SnJKD7xX3ymlV//pON+kai/qbCctEZMRL
	23DkD/80y+ovLhecS6piy97dXq7QsWzaEhdLtyu0qfqZc0zBZxmWjGcEVUS7WJSN
	h+hTtOi1YxELp6rwDe23tZ0UWpgED5xORreOvmm5xsD4nSogrwEygp7z1+9fKdzm
	16l4hZx94yaSviYL3q1yZ1kplndR7dOijSpuPabseKNIYZhOP+pR45s3F0Rhwpwg
	W9+vB6n790mfUPafs/3cLuLcNR5e9AYPF4uA/DaIbNLLRnd5Bq93m8s2UwG7uk9x
	MkvF3w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sa8f0j6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 18:58:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 476Iw4no011042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 18:58:04 GMT
Received: from [10.110.113.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 Aug 2024
 11:58:03 -0700
Message-ID: <622c0fd6-e4e2-6597-d0a2-ff449d7d2f59@quicinc.com>
Date: Tue, 6 Aug 2024 11:58:02 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] Enable EUD on Qualcomm sm8450 SoC
Content-Language: en-US
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Elson Roy Serrao
	<quic_eserrao@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <023d4ea8-635d-435f-bae2-87284f70123b@linaro.org>
 <2a17eaca-54af-d1fa-304d-c7e0afd85b33@quicinc.com>
 <32f23133-c494-46c1-a1f7-cabddb6331a8@linaro.org>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <32f23133-c494-46c1-a1f7-cabddb6331a8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D3ARgBR9vxUPoXwXnrhNoEDelUJZiaYf
X-Proofpoint-ORIG-GUID: D3ARgBR9vxUPoXwXnrhNoEDelUJZiaYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_15,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=792
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060133

On 8/1/2024 3:52 AM, Caleb Connolly wrote:
> Hi Trilok,
> 
> On 31/07/2024 21:58, Trilok Soni wrote:
>> On 7/31/2024 4:13 AM, Caleb Connolly wrote:
>>>>      2.) Proper routing of USB role switch notifications: EUD hub is physically
>>>>       present in between the USB connector and the USB controller. So the
>>>>       usb role switch notifications originating from the connector should
>>>>       route through EUD. EUD also relies on role switch notifications to
>>>>       communicate with the USB, regarding EUD attach/detach events.
>>>>
>>>> This series aims at implementing the above aspects to enable EUD on
>>>> Qualcomm sm8450 SoC.
>>>
>>> Are there any plans to make this feature available for folks outside of Qualcomm / an NDA?
>>>
>>> There is an openOCD fork on CodeLinaro but it still requires some proprietary library which is only available to folks with a quicinc email as I understand it.
>>>
>>
>> Which codelinaro link are you referring here?
> 
> That would be https://git.codelinaro.org/clo/la/openocd-org/openocd/-/blob/qcom_changes/README_QCOM?ref_type=heads
> 
> Which says:
> 
> Qualcomm specific tools:
> - Login to qpm.qualcomm.com
> - QUTS: 1.64.1.39 (version & above)
> - Qualcomm Host USB Product Suite - QUD QC only : 1.00.63 (supported version)
> - EUD QC : 2.1.1 (supported version)
> 
> I believe the specific versions of QUD and EUD are only available to Qualcomm engineers and not even to OEMs, though I might be mistaken.

Thanks. So are we okay w/ one of the following option? (trying to understand the need here properly before I relay it internally). 

Options:

(1) Provide EUD library and tools - proprietary w/o any login requirement. 
(2) Provide open-source EUD library and tools w/o any login requirement. 

Is Option (1) fine to begin with or option 2 is must? 


-- 
---Trilok Soni


