Return-Path: <linux-arm-msm+bounces-63411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4AAF5825
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D4E165177
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 13:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C16325522B;
	Wed,  2 Jul 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZhvQyam"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF882242D6F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461893; cv=none; b=lFUrnSrm2gzs+GCoI6f8ropNYW8vVcyfh8gEPWBZZEvjO26JpzAbAgQcOurTxgDrN/dhj4JJg+2x3xZppqf2PpG+bgJYxyqTEU9T0Jf/JboDzEQLz6P+JeRTxnYAo7f9MK1K4B5lfZNmvH/MmxTQ286gp3oMJi0/Yzo66xjq5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461893; c=relaxed/simple;
	bh=2qnYYx6xwWMHatqOtbmA5fZZO68GJhtCXnEdgTR+uR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkeO7ph1HHlKnPEzoletPVcAYhKKpcZeQiLYX0cXIfS4qViHdBjDXaSkvWlDZjn75RXoZi/X8blzE0CCXcztVk2K/AR9mAwcUp9xrdXbL/j6voUHP2d6enhXGPjkuqjMlkCrsnIw/9RPY5HgSLe1jPOluA1g1yTdJjbXJQrB7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZhvQyam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Cow6B002651
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 13:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jay9izauXc/A0gdbOKQN9NpMjdCplbml2iUZTiy4bd8=; b=iZhvQyamk8dz9MfS
	UNokItTXOgeGBF083BrEcVIIhMMAfXDNJAjHfP/bbXe4j2qCqvaiG+Rp41kq5yHe
	cnhVgPEQUSlVOL5jFhFKDZlhcuJ9WZx8bl7iiow/OEyvH8ChfcKNzmyklnsaCsbC
	peP/VUt+IKdoPXHeiFr3BUDV91JT3gkcIkqi5SnsQyVrGuy6W8IUhCd+XY2SYHRH
	gL+V0MIEIuipWxwf7CYVjsjV7mUbG8rbqyep+KOoQWqpXd8XoyZlGiEnjKoTKTni
	Cte6NzLNkMBUY01SDrYRezE+WwMJKzp5z9TzPirnYc1bahDsrM0Kj1Dr81lu4Dly
	6QXjaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcvmgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 13:11:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so176780285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 06:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461890; x=1752066690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jay9izauXc/A0gdbOKQN9NpMjdCplbml2iUZTiy4bd8=;
        b=npVc+AXjnN82Vwj9ydcq104vgxoRBD3mUPRMWWKLLQuHgXD9Jup3PCetTfNbGowf+P
         VnM1PgPphcX3dA3Z/3qYK6rBDJpKOdNn/9akR/QPIreT5QxIZN89Cxln21fNg1VB/6oU
         sAeetpvLA81vGTXVuT7dEGHzXkm+LnJm43V/usd1nMFAJuSv1bnjIyglSDJeN8Kz0BPm
         PZctJQK6UrqrIQa2ucKF3NXyjWfVzcx0yCar+EHbgLJIShXNc02IsB3rtYaRrO21j9/d
         uljJaaF7TQUa2BG7Uf81QqY34uVdEHtS/UJsVYLxNOuzA+pzuwfmI03sbMvOLgqXDBw9
         8B5A==
X-Forwarded-Encrypted: i=1; AJvYcCU6OivjXQzbDWQkPkiCE0O06SwllTHfJ+zTxk1iSt9zi5RZVyi2UHXpBpnqkhxh8Np+r1cM2dn0711qLOfw@vger.kernel.org
X-Gm-Message-State: AOJu0YwPLb5ASo3Y3AD3g9UaIYYRw21dynnEYFHQV3nisQF8zotpDH6J
	v9sUhq2WA9Ot3Kf/pMC7AurecD1uJ8jOzLH3+rVD/T5FOG0igmJktzLDZy3Q3tsVPc0QG2ZRXq4
	3CRagiIrRo7MAmZyYeyEq8LXue1xB6e+mmIoL35KtDnUrKFDhh31QzxJhfdFRNkWCfBD4
X-Gm-Gg: ASbGncuoPk5OBql6pKDy4eVkYv6P8LddjA/zICN1EZVfTjOvjN/h0HoiPmHPAgQvHlY
	AnXU/UHVF9ltFuo6gpXqHy/PHZIdIHsVzEGSWy+2gvTLjbB4os8wEurq7Fgch9nZIywW/8SC2zM
	Fq82I9KueRHAdn+h6cxvpIvE8cSg5KzRCjSwDbEEOsU0ikYRGyb9RpikYIpakFHJLB/rUPfbt+a
	4Is3YSKvPSjCm0vG+yJe6Xz+LGsD56diUHOmppDTGWtBmVwnul4QTMN6L5XNfftEbCCWWrDqYSK
	NDNaY4UTjr02v2t0+2Iwm3kK8GkJSi7kbqvPZ7tuH9zzwCsLGHm3fMihahNRJp7sa2ww/PGSXgP
	Pev4=
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr168242485a.3.1751461889642;
        Wed, 02 Jul 2025 06:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTS+JCpkO+wdIex8GFBFpWIr+rL0zlZnGn08j7hpD5QH4DqCrlEVJJr/mrxA97KHZJKBH54A==
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr168240985a.3.1751461889141;
        Wed, 02 Jul 2025 06:11:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbfdsm1080255266b.115.2025.07.02.06.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:11:28 -0700 (PDT)
Message-ID: <9f5be122-302d-402f-91f2-675507612d32@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 15:11:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
 <08c8cdfd-099e-7b90-b163-23ecee3a5da4@quicinc.com>
 <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pe62Jm6_-otExlmvPggYmUGbnrRfgKrv
X-Proofpoint-ORIG-GUID: Pe62Jm6_-otExlmvPggYmUGbnrRfgKrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNyBTYWx0ZWRfXwriPYHORjKaM
 00cX3ewS0WLURdU9kMBX/grH3+aY9Qu5/He7imKqWrAkagUIOl8hX1YBQe/x9yBoIrykR9YJiqb
 to9tdPUQP0yy2LZQUq9qlZnRPkjt2pqX+NbvHjXQRNsb3zzVNE9/dB7mE//lw2DB5nWHPqsquIN
 HJH5v+bMT8ZETrudFvh1BrRtt3D5VTaMDvTDeL/k/5zznZY1Vtqr8lMTMPam6MbVD4z5VjfoluT
 vK9koTwY7XZ8B+kdxU1pfFh4KjG2jliWmuE7OzoiicxQDMU9/aKcqmtGZL8R5ra1AQGdlGIkDQF
 iQRwv5sDZsXlUJ2r66ahU++fLF4QrrZWw45seMUJ38sZzXsjSqjdwiVsWpbW8xiJkhfz0vt05Ix
 1oN1RjxkDY2GDMqEXs5xnV2d+8DXSf5pTD1hYzXgP3zJH1wXJ4ZtPQ2soXZSE1Q+3QRsYgKo
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68653003 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=wGamMhhJhDPYSn1yWlIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=846 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020107

On 7/2/25 1:46 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 13:32, Vikash Garodia wrote:
>>
>> On 7/2/2025 4:43 PM, Krzysztof Kozlowski wrote:
>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>>>> even within that range, some of the space is used by IO registers,
>>>> thereby limiting the available IOVA to even lesser. Video hardware is
>>>> designed to emit different stream-ID for pixel and non-pixel buffers,
>>>> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
>>>>
>>>> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
>>>> individually. Certain video usecases like higher video concurrency needs
>>>> IOVA higher than 4GiB.
>>>>
>>>> Add reference to the reserve-memory schema, which defines reserved IOVA

[...]

>>>>    dma-coherent: true
>>>>  
>>>> +  non-pixel:
>>>
>>> Why EXISTING hardware grows?
>> Same here, the commit describes the limitation of existing design and also
>> explains the need for having the non-pixel device. Its not that the hardware is
>> growing here, rather the hardware stream-IDs are utilized differently to get
>> higher device addressable range.
> 
> You are not doing this for a new device. There is no new device here at
> all. Nowhere here is a new device.
> 
> Changes for a new device COME TOGETHER with the new device.
> 
> What you are doing here is changing existing hardware without any
> explanation why.

This is bindings getting a reality check.. this goes as far back as Venus
existed (msm8974/2012)

We unfortunately have to expect a number of similar updates for all
multimedia peripherals (GPU/Camera/Display etc.), as certain mappings
must be done through certain SIDs (which are deemed 'secure') and some
hardware has general addressing limitations that may have been causing
silent issues all along

Konrad

