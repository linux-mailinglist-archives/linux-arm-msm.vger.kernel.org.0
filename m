Return-Path: <linux-arm-msm+bounces-52962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE8A77986
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 13:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F26E93ACF56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77831F3B85;
	Tue,  1 Apr 2025 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U85ozjpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664B1F236E;
	Tue,  1 Apr 2025 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506781; cv=none; b=FPXJdpxD6QgNG3trlG4LrRRFUHfI3pZG1t0IDxd//ywbmiY5RKy0TpP1+BwejqnjnLkfaupd0IXmEO3N6Lb6FqbyPxnGhdgPIgkvtZUIwfgepkK4l1SfkkCTkH4yGULGXLZ8AQV6fK3YYSQcERVpuI6KE5WjJgpklxAVNzzsLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506781; c=relaxed/simple;
	bh=f68JuBxUjg21sdTzHNaVwuYt7penkBAyXAFpoiKmYhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dzaB0lJ3+Gl5x/zeeD8iKxd9U3YyImCTgSzSM6jsvBGqmK5KpNXB9I0LMqLI5nA9NICKQFnSAeM0UaOM83q92VG5yduNDOk1+SeHH+aBLJwVDC/FO/iNi3bnz/f4rXurAT+WyKXTlpEhw2HMNy4KtVdnegLsJ/CpjYh0+LxwE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U85ozjpo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5315c9ov014503;
	Tue, 1 Apr 2025 11:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kJA/rryAg2facRuiz/cTWNvt3Z6IK3AREIDAkgN9UI=; b=U85ozjpoyJEvHwv0
	Pak4LGbXSPITByODeg/9qJHqsEQ6uhIPdfIb7mzMNYfuH13zfFyBsH0U1uuX5Piv
	jA1YRSoKTQrPJXG3g1o1kgbp0LSMO06RH4LC+6Pl+X0wp6jDoZyRJWJ8nSQYPGbL
	H12YBUEkEQhBdxeCL3dRJX2/+W5bPJA/dEjuPCL/ORJR2SJDj7rAtVZ4FyDETGam
	XL1s61sYqUPVEa7nu6ZMH42eBv218rJPJBU/EYU0XkIStFeft6FdJo4lY2O3tfnE
	2q3rgC6gVxVvniLydwHd5wyUya0U8zrXT2U3pNOqhV+llJThx8RS18gGVV7X1OTX
	J3jkvw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvftx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 11:26:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 531BQDZE001130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 11:26:13 GMT
Received: from [10.216.27.117] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 04:26:10 -0700
Message-ID: <479b9613-8244-4a29-9735-cec47e473946@quicinc.com>
Date: Tue, 1 Apr 2025 16:56:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <ru37oebencfqbepop6ka5i2fc64ifk4nnwqmb4o52nwccpplkp@b7xxxpp5snip>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <ru37oebencfqbepop6ka5i2fc64ifk4nnwqmb4o52nwccpplkp@b7xxxpp5snip>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ebcd56 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=slvfVLusu6YaaKTZB2QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: eY3qeC920ZlIDZ2bA_Sv_9qPZZ74Gpwn
X-Proofpoint-GUID: eY3qeC920ZlIDZ2bA_Sv_9qPZZ74Gpwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=740 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010071


[Resending, since my previous response had some wrapping issue]

>> TMEL(Trust Management Engine Lite) subsystem provides different kinds of
> 
> Trust whatever SubSystem (TMEL SS) ...
> 
> different to what?


To the ARM TrustZone firmware(TZ). So these services (secureboot,
authentication etc) were provided by the TZ in some SOCs. Here,
TMEL provides those. Can add those details here.

> 
>> services like secureboot, remote image authentication, key management,
>> crypto, OEM provisioning etc.
>>
>> The QMP mailbox is the primary means of communication between TMEL SS and
> 
> What is QMP?
Qualcomm Messaging Protocol

> 
>> other subsystem on the SoC. A dedicated pair of inbound and outbound
>> mailboxes is implemented for each subsystem/external execution environment
> 
> Is it implemented in the driver? Is it provided by the hardware? By the
> firmware?
> 
TMEL firmware provides and processes the inbound requests and responds
back on the outbound channel. Can mention this explicitly in the above.

Regards,
  Sricharan

