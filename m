Return-Path: <linux-arm-msm+bounces-67875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E946BB1C3E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A085518C0131
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BC9288CAC;
	Wed,  6 Aug 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsJ6d9NW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F4257AD3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474257; cv=none; b=LIkBPnQsLYvsK1gnFxUW+ISZg0/OsC6UKag8c9Bs/ixE5scXdlGCbkGG+8nZZZRut6XV7kGkxyDB+qpe03MTIucnSDtCsNXyc5LbLsIq3eyh4UTB7yj2nNB6hKmHMe7bxbGV/p6F0OmpBXKGkBCvgWvuzhg456bOdmK7eLBnSeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474257; c=relaxed/simple;
	bh=lsYFOYME95FfYHQgxD2fXes4j/sNpClVL4HShdy3UpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bz8PJAkbg4EPQxsBkSmU6ec7pw2GZ2Uca0BY/DkJiRnfkA8hSky0cgV7kuyR/1CDxPh/y1FsOlFCyJ3BjF7cEAjryn8WTN6ZBwXRjP4ZjiUn+lFkyXtuWBVAiraEpRXUM5xj60NVOAUxhzwGSrcay7cjztey/JdvzovetqxM7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsJ6d9NW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FZm2011040
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 09:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqxXBbq7cPgkYcO7MMpR2qxt2qS4qD02969cwFn8hIk=; b=OsJ6d9NWKHJkMZoa
	hswbPYW7K9UASdz9PiijZCTgAMlVGh6jlG1/CShuLCAd3YwCCmKUoXO4qtn7bJ9L
	M/N4wGTswbUQzraUQD25IqWF0JAIUIaE9zCy/VFuL3x9C8WKNOeQXjm8L92UV/5G
	QBSdlA30mx9SiuY3mdQYnlNDIExNRl2YasdrSG12Hluh3BtlXwwjPdd2yfpjCQv9
	T+TgBjbHSVOmsFPXmp81Yv1MRqVxjem/jt2wJfH9g4XZUScn4DAIe0aq7lOT7BFq
	BkgSm+MjcqfEmCXlxcwvbFwtl26XSn1k7McNKHkdp8YC5HyxfeHREY7RctRd1GI3
	QPtZEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw32be1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 09:57:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31f112c90aso693542a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474253; x=1755079053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqxXBbq7cPgkYcO7MMpR2qxt2qS4qD02969cwFn8hIk=;
        b=R58ipL4Vqxd8+cQ0GgCuVZ+qoEmTRKv/doupJYuxBJK2c8aaHttCM5iBczh+x1ii2X
         g01D67/9RCQNGfW5e9d3uHv/l4YGlDteaDAOk/4Ol6lLyYrGXUr93NKGohIPk6maWtjg
         c06pMAAPDQNphTu36IIaiUi57Qc/pdeL5fpQyY95u7VqQf4MzxTb/chzAbU1dJV2nbTa
         1LL9Un1TtgNYoeiLPFb95ie+oUcQqq0begDlMsHm4vDgD2YfGenfZL/oaS6Rjr2fjzvm
         PKG/Nw2Kbx60xEl4G+hpHGoMzeUlpINC+A8opgo1oafBDN/HPsWS9Lw1Jx1dwYZ47Y3A
         I9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjNqCm/iZY9VaEd4Y6eKnrUg6ghxF0G1Ne73o0252Vha57ZWIksdXFZpTlf4iKytiVVOSVBr91BlMHLMMl@vger.kernel.org
X-Gm-Message-State: AOJu0YxVe9E9RY79FpnR4ZxNvz3MGaquXc2GV/hcrQJCOlvlpWLyptaR
	6GNYhwfO4xy4nsgToZV6nkmHjNWXvaw0d9O3NMEwm7OecLv1co/ufaaG7n0rgHRnmIAz84OP2eL
	QmQqBFbZ4JCZQQkVr6gmAQK7nVisk1r2CANHhXZJnKU+fWNY8oz4WHGiFhV+Ar27WyY13
X-Gm-Gg: ASbGnctQoqMH9J6PZpRP3LC2UrLVuRB3zGeRYOtuP3lg/P5jLJb51h2zXPxwIWhL6uV
	oPQDj6zTXF1CZ3P/SMky1xNAqIn2lbD3LgnZxMTh9bVg/yxGzvZP7RbD8Dob2Y2qQU0VcopweHA
	zE3yN31GzpQ2jo56jlFm9Nmh9JxVswlV8wLVcY6tbq/fNDfCbG8RNjZVb5gKIDPEddLRKY27b2z
	fnn9BGd1sCx38dJz0xt42OmLanvTnEzaEZGxxpDOTtlfbdY5X+/hUdrVjIkryl9Uttx0cyN5g8W
	T8f5QsIsHRP/ZA5J/f3jXI1PsRdhHzWmGQtwetCU+6wAy+Z2lCtDLXiIZdp4mCoahFI=
X-Received: by 2002:a05:6a21:9989:b0:240:1132:6ff with SMTP id adf61e73a8af0-2403193f793mr4134203637.7.1754474253329;
        Wed, 06 Aug 2025 02:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvOm29N4CcerImZ0VqJXj8dtUuBPdLJmLmcso/logCxwkr3fV34DG4P2Oi7ic0GJV//FM8EA==
X-Received: by 2002:a05:6a21:9989:b0:240:1132:6ff with SMTP id adf61e73a8af0-2403193f793mr4134150637.7.1754474252843;
        Wed, 06 Aug 2025 02:57:32 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0b57sm13036378a12.31.2025.08.06.02.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:57:32 -0700 (PDT)
Message-ID: <5d75904a-05f5-4cee-9ff3-821b692f6a6f@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 15:27:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
 <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
 <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX5lJSmYSnWWSP
 mK8q/IfJ7ptZPCnzRRMxW1Duhvrp6iw2CnkRyCIYLst1q1/Q9U2dTzUgOCQGAg1WHrrCQXr+S0O
 x+XLe6b6S/wq1Jp1nTfjfB087xK34vWCBvTReEHYwxUUfjDs2IbML0+pOSGZ/VAEVfgm8dYhVyQ
 u9b71HB6vocTPL7Z8gZj91DcCtfli9cNlKU4UNeLS66g/WMvkZSTWYzJpKzJDq9ktp2ghB7K5EE
 reoj/TihsXtvtxyI8tv8NpEjlq3eOdd62IQeFtt+X1P5u8AjVyxFy2ltsq/4RzsHbTNX+ThCdv0
 ZDJWk0KQBhAT24cFEc8CAegLT1teq4TdKoix0n1YAiphnTa1/ObDc3kFdBuIlkSET5NG67TLTNA
 0EdOiBfn
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6893270e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=xJKRXGaZASgMo-ZfVxMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: wLRIMOEaZu6b2eaKShwn9qXUn3uuIQGC
X-Proofpoint-ORIG-GUID: wLRIMOEaZu6b2eaKShwn9qXUn3uuIQGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008



On 8/1/2025 2:40 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 06:14, Taniya Das wrote:
>>
>>
>> On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
>>>> Add bindings documentation for the Glymur TCSR Clock Controller.
>>>
>>> Same question as for v1, what is Glymur?
>>
>> Glymur is the Qualcomm's next gen compute SoC.
> 
> Explain it in at least one commit msg, not in reply to me.
> 

Yes, I will explain it in my next patchset.

>>
>>>
>>> Where is any DTS using this (or explanation of lack of DTS)?
>>>
>>
>> Krzysztof, the DTS will be posted separately once the driver and
>> bindings are reviewed.
> 
> Hm? That's not what I was told thus I ask. I am sure that above is not
> true, but if you insist and put it that way it is incorrect. You cannot
> send DTS because you wait with drivers to be reviewed. We want to see
> entire picture.
> 

Sorry for the confusion, Krzysztof. What I meant to convey is that we
plan to post the DTS after the public announcement of the SoC, which is
expected to happen within the next couple of months. In the meantime,
we’re hoping to get the code reviewed.

-- 
Thanks,
Taniya Das


