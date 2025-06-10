Return-Path: <linux-arm-msm+bounces-60869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7313FAD4257
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07DB6176E48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EB1256C7C;
	Tue, 10 Jun 2025 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvZQfX6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C542566F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581874; cv=none; b=H4AaDZ/9SdFZ6Qr5zaSys5mrlFbKVShZ9dFTUkEAjXby4rjIbbnYlBwG+vlq+bupzaP7w7z0/VFeIupRpjondbd3DKadU3GB8+Jw229U0Jyg44PUHGBO4iw8ATYJMGb2egKWty1IL/rKIM8wShvx1btOrQRuAmWLdFHWXjKB7pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581874; c=relaxed/simple;
	bh=OHkRo8FvD4elBOPDQqurUw3uyz5hZ0e8dTn8vLmfrJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfdA4yxOgR4YAlx7O3thTgVOpoCyqBAQgzL4gTv9Z6cklLCsfJ/I+Z41Bv6KiraqFNFd3rhuwH+fN5g7Wa1zE9Btw011as3xK1heJ3L4kz0lLmpJ1ZB4ipFlmRUAYGCA+qZ2n8boH5tJvOaSmrHgCEbfHlbCGql0d3ogwOMcU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvZQfX6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPn2E016705
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrN1HUZD6Bynbfi5bC2hLc7uKiSyjY36xQNKue8CeUY=; b=UvZQfX6/cSgx18Dd
	lvTE6esc8Ims4sjnSW67RQsYweRHZRelc374HhxEwhyRhjSUL8cnNtwLbPo4sSPr
	6mKAO5mE4yN3xGDIq/seQxrc4zENSJLkW7Xz/lg+QYGc9unwisjXPDfpQTtHgkvf
	9JsybKdR9V68ijniYzNTG3zOxhnGbypOx38pgX5to0Evuh56LKtzIrSe5+dltFQk
	cLBq1jgc/vjOiRHEfBs4VQwnd8AkbukSZ7k9VOHs2V5CUW/aJR0dZt/eXYT7pQ3q
	AmkMciEr1Te2jpQ+eYmgX1D9LJNccY+8g/GZvGSMCS8GGXJlOc2zn4u3pEsaaVTH
	jusFRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmna5uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 18:57:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c76062c513so103197685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581870; x=1750186670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrN1HUZD6Bynbfi5bC2hLc7uKiSyjY36xQNKue8CeUY=;
        b=qWu1sswOVKVguixAATecs49OilqEYIxtCFFwC2M1yi31ot1r0OtdkInkRbFF5onAeM
         4Xon5Uj3Mg88Fj7gnv40tVqEGjb/opWNpE/lenxJHJ5590Bhk9DeC61yIi3nLWfcEiEB
         Fl5AtRB9uwiM6DUQG9Y4FkRW+qTaTIRCkIGI1z7p1P4tJI/aY/t0LIpJ9WAKU8y96+x9
         A+oiz49jYWCVyKojOBtLwzdL7a7aTFz4O8hxaRrYyMGOJMsECqXuGDzDc0oCAagL7LgF
         htXRbcdUrWef7QgLwF7Zcy9M7Jy4eiY8ha/FoOcadZJ4U1FjUT1HmS9NTG1sNA+KcGbI
         PZXw==
X-Gm-Message-State: AOJu0YwoEMdIbRuJEm5GbsQkjamsoeWcOIo0Og3/kQHM6FI34YiLe75k
	gCjNp9JRn6LFWgA0fmcrHkDRf07fa6WF7cuqIM/Jr50Zi/RJ4noyFqocKnkR+/U4/1STW0Q04sS
	U8rAy8LeNsaW5c3otAn5gkbX2IYfqOtEN2Bt3NyD+/cPyM2zQk8iBu/UtoNRegs0knsG9
X-Gm-Gg: ASbGnctA2hbbFPOJ19V8M0mewULLQvt32HKQtJyHB2aXK+u6G+DTh85HzutwwbkkyX9
	/UO7Aebn/fZQNaRTuyOvtsA7pZ6hYE20K2wd4x1d0Vci7IWA6JheDLNZxVHsc3hQz+9H6x6z1jv
	RstYqvpOf+pTXwAP7jEj74rDRA5l/ZWtzApZstOEM4NMijuQYGLCW6Gez61GkLWrQI7tDK6rM7a
	wxRTOTBh6a7Du5xBGs+bK4Fm8eG+1qagNW4/YeO06kcx6gixLZX1/t6SsRHuanb9qXKHo1r2PVp
	vA5F3Ep3zG9lvJMO2/dzc26SWs2IyrPsRcQxUwzCsgvvsXg/mxKayX51KIZnmVlM542L1H/UYHQ
	XmO0=
X-Received: by 2002:a05:620a:2a0a:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3a884427bmr28135885a.10.1749581870516;
        Tue, 10 Jun 2025 11:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL9+1OgozdcD0e49HSLFtrscbL8pflDN77oeih/OFQ2Al80bPXOe/82xvA4uxsalTvF4826A==
X-Received: by 2002:a05:620a:2a0a:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3a884427bmr28133985a.10.1749581870126;
        Tue, 10 Jun 2025 11:57:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3a4absm774105366b.143.2025.06.10.11.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 11:57:49 -0700 (PDT)
Message-ID: <38e161a2-2f93-4042-9db7-50559ad5f381@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 20:57:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
 <1e7afaab-e050-4376-8dde-07f09fb01e51@oss.qualcomm.com>
 <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wNlmrmD_kVcWg7EHP5zWAsKrXbhbt2xK
X-Proofpoint-GUID: wNlmrmD_kVcWg7EHP5zWAsKrXbhbt2xK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE1NCBTYWx0ZWRfXw3K3W1z/hyMW
 7oCbKmdv7T3sQPP6fPPi9LM90txrBB+P9XNe5CBov3haC93lAFI2zKPpPdkH0cRQJ3XExAxPV+K
 B4u/qlXPkGq/WcXCLAiBYjBqOcMVUTq74DM4BPflNNC4VM6esDvg5n7OruxR0D7HERAZWb/lGT1
 m+XfVMMVbcz0YrylAWdO/5Mwo0hVbotYXyz47FaH3u4bFtbrQML1ASe9XGuycjpWxHxccPb9tLE
 +PVjH2Jce0+P7d32PPIL+E7oIxI5DGwc+2RfUT/M1h7QrGxEQLzXDPMP85gtFLBLKTN1QEGKX4j
 Bl4XN6ejvHn+eXlzKsdWqaQ1h3bWomENkRmGFkl40CMTcoGFU1NerfOg493D+NRdvWGcun/hw0r
 IyaUtOov9yPP6Rwp264FO3I7TSU7aF4WvrqS21Ve1BYiG5sspMk/Y/27FiozsRAZN8InWb2U
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=6848802f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8
 a=QR4-IV6K3ZDuD3Off1kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100154

On 6/10/25 6:57 PM, Luca Weiss wrote:
> On 22-04-2025 9:43 p.m., Konrad Dybcio wrote:
>> On 4/19/25 11:08 AM, Luca Weiss wrote:
>>> From: Adam Honse <calcprogrammer1@gmail.com>
>>>
>>> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
>>>
>>> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
>>> ---
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

[...]

>>> @@ -332,6 +368,9 @@ pm8941_l24: l24 {
>>>               regulator-min-microvolt = <3075000>;
>>>               regulator-max-microvolt = <3075000>;
>>>           };
>>> +
>>> +        pm8941_lvs1: lvs1 {};
>>
>> LVS1 is unused by anything here - it's probably good to define it, so
>> that the driver picks it up and regulator_ignore_unused is aware of it
> 
> Yes, did you mean here to put the addition of lvs1 into a separate commit?

I guess I was just thinking out loud, it's okay

Konrad

