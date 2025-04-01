Return-Path: <linux-arm-msm+bounces-52942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83052A7767C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD39C1889DBA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC361EA7C9;
	Tue,  1 Apr 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CK/qyI2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF4B673;
	Tue,  1 Apr 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496396; cv=none; b=eZ7VOve9TpATL7f+rujdJyArGIiffoOz4c1ZAUSX3qUY8ubpjR7thqtuFHFpwSj67IbWc1MRsyNwnMPSYJgBfolfWCV2ZEJVfSvNK8oF0Y78OJ80Y/NJ0ZBBmlO1DZaDBhVpBREvqs9LG0sJsCMrkmIVqjFp4rFy+U2cb+W0iMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496396; c=relaxed/simple;
	bh=incx8YXt6LT5Xyx37376Dpv/QY1ZxEBASrAUYm6ZVCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W0DL/1W2iTzBX1FWAuuvtN1ZHwoVrtSNEA9juSEyJZ3gUQLw0AjLiGHTEFIBGvjoRuY1OBj4QpmNUbl0gw6I3VdKtiCSfso9sZzbn/S76MH5XFj33sqlR+hh/gJGcUT3UYQf/8MICFvWD7lMJCVBcBDKGRpy0zhqxXqEe6FfZow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CK/qyI2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5315fsSS032586;
	Tue, 1 Apr 2025 08:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzZtvraCQnXn6VHBW2LMAGZQxrrkrRkSHNCyWULzO7g=; b=CK/qyI2gIa8BpQb8
	lsNeDYUpk2ypN+GmiRowoj1efNHeIlYdty7tOToFw74tMECfrqeiSdm1XhPBNPT4
	PCtj++QLgEXJTi9TXCbeKKWU0z3dBoEDNLe4yZPLVemDFGAhK+KAOSSqtj4ty9j9
	E8zv1ErDvlGW+JOBAfNxHTRJl7bM+GDton/5/GqWHqtQssEqXgPmM/KXH9+J3XIQ
	tAKfWjLKD21w2b6c3VmcZWuU+mE77w3FhIBDO5ewaPPWGN3iJ318BI1ldbqm2O6U
	7F52r2pK1UR4uryR2vJSAR6IdSKICYMhWGYKIFJnUTjvZZoNcu6wldBN+3Uj4Peg
	pkOq9A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qfh1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 08:33:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5318X7hQ007939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 08:33:07 GMT
Received: from [10.216.27.117] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 01:33:03 -0700
Message-ID: <cbcf0265-1e62-4c5f-832d-68c15ff21d70@quicinc.com>
Date: Tue, 1 Apr 2025 14:03:00 +0530
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67eba4c4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=slvfVLusu6YaaKTZB2QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bmjCYU9-JNGiNldJIeMe-K0vtNvWNn-5
X-Proofpoint-GUID: bmjCYU9-JNGiNldJIeMe-K0vtNvWNn-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=883 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010054



On 3/28/2025 6:21 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 11:47:49PM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> TMEL(Trust Management Engine Lite) subsystem provides different kinds of
> 
> Trust whatever SubSystem (TMEL SS) ...
> 
> different to what?
> To the ARM TrustZone firmware(TZ). So these services (secureboot, image
authentication etc) were provided by the TZ in some SOCs. Here, TMEL
provides those. Can add those details here.

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

