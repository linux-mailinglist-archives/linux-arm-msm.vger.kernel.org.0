Return-Path: <linux-arm-msm+bounces-56747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BDFAA8C78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 08:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E6E9171E62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 06:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0F31C6FF7;
	Mon,  5 May 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aQEdCUjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBD2AF12;
	Mon,  5 May 2025 06:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746427893; cv=none; b=gQDjtn+hxTftG9gvdCCQIZLXtLGy5i4l6MStjNPsmJC9w/ZbZjn2EWXXDBVDEkT63S4PGJKKdytG+TeG/Hsion9NOHhwMGm369kJOLSaHPEYi1gyiurusdGLtBHJTkHZnOdFzwpOLbHsg9JSGsTF92uGwtxiW/u2p4ce7Svn+2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746427893; c=relaxed/simple;
	bh=6TtALFn0MIoyb3vQ1EFwtcxuRpTJHNrPJ9HxGs1TwG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nqog839awBu6Jc3Or7IaQ5jFjWghxKKNktWQViMx7of5PgdOmCQ8GDwsT6gkcbXXZ+fnPe8FnBvqQgMPJZzKJa+4vrNu2qOGVjFG1GdpsapgM248D2kQVT8koCeqxfr43oZtRzZUqFOMxbWWnVL3qPuRGj9Ck1+nVUPTDd5+4sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aQEdCUjJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451HuJv010334;
	Mon, 5 May 2025 06:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5Q04H2g09Ybuz94LE/fHBYVpyjCiGeFOWfHqtV8a3U=; b=aQEdCUjJ/ii37BR3
	gdir0XhaoHZKa0z4Re4CRgOIV9l6eDDa/yXS5NLcWfejgf8uT8ZoNGLzy0iBiHBI
	3pyNaTo7W2ZJ+IEnYuSAEgaB962X7ji9wmi8GDTLXIk1iBPzMdxQLcyWHpd6Kxzj
	MVvsHxffW2W5c4n9gS/LifQx5DFkNGZey87zbgVYzBZco9Y68teddnSJApJMAtak
	8AdtCFlaXedaEdqkcbhj2FgbQbH1BRt894wo83Hd0tOZlc3v5k4Qwpo0WzHJJi8S
	je3xe82ROQYlUnLYTBD8l2Gd1eaH/UJiU6JlWBZOjNL+eP3AKWHTOuFyiFvEfBKp
	qbnlzQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9b2rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 06:51:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5456pQsH025290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 06:51:26 GMT
Received: from [10.216.4.22] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 May 2025
 23:51:20 -0700
Message-ID: <4ebe065e-9686-4e35-bb00-a9e816fb8926@quicinc.com>
Date: Mon, 5 May 2025 12:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
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
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
 <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
 <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>
 <20250505-ostrich-of-impossible-conversion-a0f8ac@kuoka>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <20250505-ostrich-of-impossible-conversion-a0f8ac@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA2MiBTYWx0ZWRfX6XW+Y0I5EM3a
 4GPAhDxlSWjYCiA7L2J2C9qIceP9eIdDMi75JNBqz15PctsJKHDQi2U7aJ+XCe0eJOY+LvZlHu/
 ic1gTIGF930fy2B3qHdR4xVdyCoGQvxaXhtzG52TKauPNO0PfmOb4m/Ld8rVe+1JQ/NM9+vlHrY
 EqzUmm3VkLuYYeMuK8tN0Unj2pGI1xnrx+lbJ8k/rt3nxysHCM+eqb0VD9F3NZ6ZtHjis8KTJzF
 LYwFs1P1iNi7VLBaziObEaKUPDExeqR1CDEWIiIZJEbVVdXwTy+9FNcylwbEuP3mqHs0jAcUE/J
 rJ8w6HblGYu/Q8WtK8Ae5/X+CX5X0dtkp/DIW/5/YWFnlZhDKrcxoGIMZOIRr9lfUlxXC6RmKvj
 c1ng+GV7JLSJRDWCaP3RuK3+AHIwjforxppam5789DbmtEBVvXYKkyNk/I/SGMyxXIuygVBp
X-Proofpoint-ORIG-GUID: OfJZi5H1Xw_EG-jWHgPqIiQYofQHV6nm
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68185fef cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=ghQGDFbB09k-6H9FCWUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: OfJZi5H1Xw_EG-jWHgPqIiQYofQHV6nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=881 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050062

Hi Krzysztof

On 5/5/2025 12:01 PM, Krzysztof Kozlowski wrote:
> On Mon, May 05, 2025 at 08:00:32AM GMT, Praveen Talari wrote:
>> Hi Krzysztof
>>
>> On 5/4/2025 10:39 PM, Krzysztof Kozlowski wrote:
>>> On Fri, May 02, 2025 at 10:44:10PM GMT, Praveen Talari wrote:
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +    serial@990000 {
>>>> +        compatible = "qcom,sa8255p-geni-uart";
>>>> +        reg = <0x990000 0x4000>;
>>>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>>> Why isn't here wakeup interrupt? Commit msg also does not help me to
>>> understand why number of interrupts varies.
>> Currently we are not using wake-irq because it is optional for our current
>> implementation.
> Great explanation. I asked why is it optional, answer because it is
> optional.
sorry.
>
> What does it mean optional? This is part of the SoC, so how given one,
> fixed SoC can have it routed or not routed in the same time?

the serial driver doesn't enter runtime suspend mode until the port is 
closed.

therefore, there is no need for a wake IRQ when the driver is in an 
active state


Thanks,

Praveen Talari

>
> Best regards,
> Krzysztof
>

