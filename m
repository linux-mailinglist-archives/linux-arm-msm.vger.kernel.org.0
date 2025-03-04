Return-Path: <linux-arm-msm+bounces-50142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B9A4D8DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC513B38BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC241FECC1;
	Tue,  4 Mar 2025 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mXmQ0X2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E21FE461;
	Tue,  4 Mar 2025 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080830; cv=none; b=u7Q12Bo0B60/bQ6oc4Pbk82G3vPf+zbVIctSMYQ8k6LxgY5OVbHHAzyaCJgJK7e3Q9p4Bk+Fw/uZbZr0ugAR3fC9EiPXwr9gSFV/xMTnFFZARwGVyoSKwIteG6yj/4ImmHnZPsf6nnSYsr6b55S+IslJwZ3n1TA6Qw9XFR8HpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080830; c=relaxed/simple;
	bh=sCMxdWqWBgT7wcDnVU1vXE/zXMg835gttAWrQN4HdMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T0TXh7YNFD4a0Rp/O0jFBi4D0XPe+hrBYpu1/1PCAtd2/tHBDud5tUlftu90KVL5XbmUOcTgmut402ro6v3meeAAr40+BGIrvWFzO7NYTqU8HGFjRhwB/swLo55FG+sl/hGCg8HjMBgJghvPnoTV42CTIu06mGcw/9pJsxJq0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mXmQ0X2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX1QJ006039;
	Tue, 4 Mar 2025 09:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRWCWD7/cNz1+Wdyv1WgxPLPyPdC5uDrIIUSEyacE4w=; b=mXmQ0X2NzaxIpTjW
	T7fExqCw6dklMz6rbZrVL0mJnKBa8tSHMLVOgsqpDrS4wsydT5VoN24vIn4AR8oc
	sbPZnlGBQbVrLnKNqSyhhgN80EveKlKJBeJV10FlKB1be3F9nYEVX4HW1NKO+XAh
	NOpcIH4c2X10IrqP93pkH9TwMDkLVXkYEexY3MYIXKTTwYY/nAm9DGNSLricXMeH
	KPk9uqQFyodv/i/Y0ELZhb+6+ymHXTc3Le0rECGGvDgGWcwWyNSOGFV7OI0U/K8/
	8OCdF7rDRTOZQ874B5InKxBC7q4UAwFcaaSgVhk7cnsbpZXapMiNHvCh7mqSogtT
	ctlBng==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6thcbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 09:33:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5249Xhqh019872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 09:33:43 GMT
Received: from [10.216.44.43] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 01:33:39 -0800
Message-ID: <3e326578-ab46-4d7e-ad1e-3d572613498b@quicinc.com>
Date: Tue, 4 Mar 2025 15:03:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com>
 <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
 <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c6c8f8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=YG1pY_6daD2ShUQ-MVQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qVg67mCIES3UR4jTgMAQyGDR6K4_NGmO
X-Proofpoint-ORIG-GUID: qVg67mCIES3UR4jTgMAQyGDR6K4_NGmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=642 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040081



On 3/3/2025 6:34 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 03, 2025 at 03:58:42PM +0530, Sricharan Ramabadhran wrote:
>>
>>
>> On 2/28/2025 12:03 PM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 28, 2025 at 10:23:56AM +0530, Sricharan R wrote:
> 
>>>> +		dev_err(dev, "Failed with status: %d\n", msg.resp.status);
>>>> +		ret = msg.resp.status;
>>>
>>> return msg.resp.status (is it really errno?)
>>>
>> ok, yes error.
> 
> The question was if it is an errno, not if it is an error.
status != 0 is an error always.

Regards,
  Sricharan

