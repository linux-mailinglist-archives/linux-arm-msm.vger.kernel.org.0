Return-Path: <linux-arm-msm+bounces-60991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774CAD583F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603CB3A5925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 14:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2EA2BD038;
	Wed, 11 Jun 2025 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X5oJtr8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B64295502;
	Wed, 11 Jun 2025 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651181; cv=none; b=ridoR01HZk9yyqNKaIGZEvGAFrWKZP2cvUbn3iEnt0wxbAMIy9CkoXX9/8SFqK4Nt3kQFXFefb9/18fMb3P1elmyxmQi/1/ruF4aZTVzWst4jZUQnxybQCE265XtUA7KTMvamCWT8vFIbij1n0sm5/IobiDtOpaOnIsg6IF0mzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651181; c=relaxed/simple;
	bh=atmhHy6QpcP64ofmiEEwUrG4vMaYmZXjgF3h18/VPdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jY6FXdZbmUQzr3f5mTXTKeOqkq7NhYhc/4nVvXeFTAgavR8ocfun4A1hYFqXrRmm2xLnvz1UvSjYlWPpNl7XnhP3ZyVsyRNajfH0ecsaSWFlhPRtOEEjEsWO34Fcwehz4KLmzjUmz/uEr/hkEHO8yoClUuzcqlyR8PILfVkZKQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X5oJtr8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGt8026057;
	Wed, 11 Jun 2025 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZWGVsTR3YY/nyjtsNCnhYm+76PbrRj0mIU9l49BmHs=; b=X5oJtr8J6xLfPVEt
	TObmZGGXWyPq3X3Q2rB+HIHwBK594Zv3kQnxo5Hn8BNbmsIHeL2iOvyxD0EALq4V
	+iEtobY6F3P/Fv8xKbcZR+hDUM9U0L5GA2OAV930vEjZForjvrVW6BadLzlU+pXc
	9XkJbY/icluo3nsIxXI1O9MWyD2YhoXMLgwcMBeIHoy7rQ7R/jlq6OB+eV0BXN2n
	Bo6TuSS1ur8pbrAhuGghWqMrXlo/MUcKWKoT9s7Xt4bZhbWzCZfVLj9R9HcWryO9
	GdtlCQIWDgKbd8963ehUlKvlJhrDLUfQyIPbFeG7xxJaqbsDx/ii42gU3ERDNEEf
	DsGiXA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y81w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 14:12:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BECp7b021265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 14:12:52 GMT
Received: from [10.216.3.123] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 07:12:46 -0700
Message-ID: <ee2affe2-7d9e-4ced-bbe7-c7decf8bf336@quicinc.com>
Date: Wed, 11 Jun 2025 19:42:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: serial: describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-2-quic_ptalari@quicinc.com>
 <20250610-tested-lilac-raccoon-6c59c4@kuoka>
 <d744b518-2ae9-4ca0-86ce-11cf74c945e6@quicinc.com>
 <b137e6bb-7380-4f4c-8469-422587d08c60@kernel.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <b137e6bb-7380-4f4c-8469-422587d08c60@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOCBTYWx0ZWRfX5R5K13Jr6jbB
 lfUsjdPmEPzDBt0OtaSr60rfl/sCAenoNLyBXMGXfYHFYHtB9sZU9W8DpUg2ynpHYF+zPN+8a2r
 Snlu4gRtESE8rPV6GPK6hjkVL+wC1kcPo/Unbbl/9kXK+clirlOrncq+jWjlcokNPibkYJfovi/
 oZbW3jqOw1qn3uNwpS6uv7wmeS0qTwkywFLzJOB5OB3ETZfN7gaTCHK0cf9y1WcEEdSaP554X8q
 U5/QrfTGcVf2k02oXrAIQLdJwVDanKSQpAZTMXXROA6wS1b/chhBRp7UzkpTy5ukXbniY2Ai0VB
 oojDVOEOzO5LEQYmTPQ6qXg/ujyMcTWM2/kHNToCOIyM0hsJmxE+1r0K7qCaST64dRIZuDH1Pp1
 PezApOakaG2uMcmT9k+S8UDatL3ba90pfi8E8GuH17PfxtaxoPkZI4FNqdmqYxPgfxJmP+ey
X-Proofpoint-GUID: ZOCsCpc2dl9pviTiiGwzO_XevpbnGGRG
X-Proofpoint-ORIG-GUID: ZOCsCpc2dl9pviTiiGwzO_XevpbnGGRG
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68498ee4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=o5fqufYwVcAoi6U72LcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=717 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110118

Hi Krzysztof,

Thank you for review.

On 6/11/2025 12:47 PM, Krzysztof Kozlowski wrote:
> On 10/06/2025 10:10, Praveen Talari wrote:
>>>> +
>>>> +  interrupts:
>>>> +    minItems: 1
>>>
>>> Drop, this is not in sync with interrupt-names. You already received
>>> comments on this. We talk about this since v4!
>> I hope you have reviewed the commit message and the description under
>> interrupt-name regarding the optional wakeup IRQ. I believe that address
>> your query.
>>
>> I can include minItems:1 in the interrupt-name property in the next
>> patch set to align/sync with interrupts property.
> Yes, then the interrupt-names needs minItems.
Sure, will update in next patch-set.

Thanks,
Praveen Talari
> 
> Best regards,
> Krzysztof

