Return-Path: <linux-arm-msm+bounces-76015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F565BBD657
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 10:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AD0F4E1596
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 08:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9AC262FEB;
	Mon,  6 Oct 2025 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyuYs5Nj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D41DC994
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759741004; cv=none; b=QLZOX1y9Xahj/2FcRhr2oHlUrTlaaQSIJauMiOKgAGsSVjZHQc97HPSi0LQifzk01N22x7O+aX30iO4sEjBvuUNxwDsFk7ZLqATgkkwMzS7M5NMEfelsOAAoSsr+7yE1xqiHZVVB5VnFEPP+6j8E+i0me0pRzKDNcypMFXdzhpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759741004; c=relaxed/simple;
	bh=C2omfl574gD2ono+lv2W/kKwtT21KCG21bqTSBm/BVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzcUacciC4DiOgeCkPqp7V7qyXUymuQlxrXTu4+0/NAj61deweGTGC2/LQISsq8NnwK8+m9Bx2otBxRwGAulZIWXfsyJndsLc8uw4gPZZMlHwlVltndbZSRqfQE0df/XM1s82nlCr0+Uhzytg9ERs6s3Hdx4s9V7GjzXpNvRxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyuYs5Nj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Lv5SF011725
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yjh2mJsH3wh8l1hz1Vv8zbtvWkAVhWXkLeApwLwy7zE=; b=NyuYs5NjvEepiQWm
	nZMOJJf2FCCimlJlK7Tm56vv4SJ7HeGblI2ANNaG3osV4ktVSFEjh4z7Vkg23vfQ
	1zJniOP7x6V8QhKbNbDRzVHl1ZRmTRpTEhlGBPhBcyrcfV1MZpUtJ8n6OHy79G++
	/hxwQVvehYMosbBQXX00Z+Z1GPl1bqAvOu3g0XKzklmYwBvjrsW0wZE9Fz+i0uyH
	nQWDXudsQLRiO+Mm3Ok4GPuZ57KkypDqtx15cClfvvJBdPStA06i8ReluFysriXL
	FgZVJAd8lQWN+NHJKes15aoJ+tcqijO0Qpu5p2uLsXxS+dwfB+PoSGGIfzTrg5h6
	BxFHXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkf6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:56:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-879826c55c8so9876036d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 01:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759741001; x=1760345801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yjh2mJsH3wh8l1hz1Vv8zbtvWkAVhWXkLeApwLwy7zE=;
        b=djGVWtoYpObdGNusR5UWcTzDQ3Wo44+j4Bwqrix67R72dxd93ci7Hv5uhyP6yJ9MQn
         hqACJ45nF/0s86eDX6zSj8aOx/Qxnlmt5h9/IvgIG6bHJal9+wdTw/caSvsneqTJ6EZw
         kMsNf4YMK8MPKl7RKib5HiiOpA+8/lziBtq45Uj3UaGuw9KhK0UMhQk6/7m8GI0JFZ9h
         WpYVzqLttFISkKAaD3IzRCQhp8+fQ/DzWQy3OPgWfwP7MjFetcd34gZbGoYli9vkZnHs
         uiLz8LJkfKRLgdPeRnHyZn/sx3mMhO1goYlpvw/7ypvx2+LPubrrKoHN5Z2Ed4qxG9Ob
         3KFw==
X-Forwarded-Encrypted: i=1; AJvYcCUWgY4DfS2+LbvJ4vZ+YPyhpUoaEY4OdTZiJsJyfMGzmgxGBldRMYr3xU2RMJtohbmq/eLcBU9ZS7+QnXyG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3t1Oc6aYgvM/6OwlJBd3Gm/LawtnQzpCC5u/m6U64ZM4K45Kh
	PbSRWbui4ML3D8jv4XSAv5UGNzArhOEGVrbS4kdC7/ctJ8l8VEc+B0uFDP5YZ+a3Y1X5TQSVBjG
	ZxDx4wu8kt+TbF0IqZwUFUuw/H7fxvSkLFsc79sITQTR9hcupiADx9FIWETdNRpd8iMZj
X-Gm-Gg: ASbGncstyf6gwQPZ4nXMwfFkSfLGENufk0W+YtB8OHnGXpbsbPNBsuQfkK3B7Ajw1xV
	5iQKUM8bYDugpu6KnRXm9YK7vZNo5m6V7Bix1MoA+pzmgEVZo/sCqEYPF0uBUe8mcbtrHsj8lbk
	Qa6fUfNLhKw6aWGcrQKfD08XYmtmmHMK78HdNIETlj/ZJxnDefXZzsPNRUoYKsZcRHzZg5+vcc+
	uzzuV+11nwvX7QSXJ5TepyQ2hgoMaOnsnFywz2bpWv1WJwygjMjP78p+40y6cPszb+YcoHY1HzW
	jqXs0WBJ+te5i7TuuNSlBiSJI45bpdd5PvVh3aF8yP0aGHfJS4zgGqcrF/4xaf0SMpOfvI8gADt
	aG6vLKhxmjQPSBEo7aLyMi05Meac=
X-Received: by 2002:ad4:5c47:0:b0:798:f061:66bb with SMTP id 6a1803df08f44-879dc797715mr100210346d6.1.1759741001418;
        Mon, 06 Oct 2025 01:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0OQKFczpahw2O8L9QZwt7i0MonSjf+thtwOfz9wrUrSWSLA9gRN1ddmOoMuJB4neL7R5W4g==
X-Received: by 2002:ad4:5c47:0:b0:798:f061:66bb with SMTP id 6a1803df08f44-879dc797715mr100210196d6.1.1759741000877;
        Mon, 06 Oct 2025 01:56:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3ad614sm9601450a12.1.2025.10.06.01.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:56:40 -0700 (PDT)
Message-ID: <72561ba0-88a8-479d-8f9c-767bb00c964d@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:56:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/24] arm64: boot: dts: glymur-crd: Add Volume down/up
 keys support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-16-24b601bbecc0@oss.qualcomm.com>
 <cd91e7f2-72bf-48f2-891e-4e6cd36b1e24@oss.qualcomm.com>
 <CADhhZXau4EPEvf6Ngo+p4Jv=NPF6TYxcWtt2tV+MyrmOxp7OOQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADhhZXau4EPEvf6Ngo+p4Jv=NPF6TYxcWtt2tV+MyrmOxp7OOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX6xv80FBkNMMw
 t5g4L0UsLZgAIjDU8CwU5qRC9sgg6pwpdw2XLGjUxpjhEH4nWagFdxLOO0VHCnONv4iwsKLH4HY
 3+kInHfBsHqWgaP+4QUOy/XAMxpbz6JfuQD05yTQOrlrAUmljUAYiQ7piiiuB7HmwC/yySZmbb8
 stfgvVsbEnupwwl6D3DPINuYYVkploUuxuNkXvQ5QVo/xJVNlLQKwwFhQzvpVHVePeDwagJH1i+
 fELUbENYAiO9iNL/MFJMmCTMVYXhKEdjrGFQUN4FdOczjM+Ns09HrINH/yL+wg4D7VwBqlDzEQl
 DfmExCwzq++P0FS5WP3mZ+E8Tua54M1s8KZHDwAx+96ARzvv0wYEVt2RdtAm2yzECZjHx1T1yUD
 cGJ8QCLD/JtdcmuwdHUfuUloHHdYeQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e3844a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=ldoIggxhy9b6zNnRIFQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: cPSJxNIJJCWL521Zl7sLGjiiY2MFEyef
X-Proofpoint-ORIG-GUID: cPSJxNIJJCWL521Zl7sLGjiiY2MFEyef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/1/25 3:48 PM, Kamal Wadhwa wrote:
> Hi Konrad,
> 
> On Thu, Sep 25, 2025 at 4:46 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>
>>> Add Volume Down/Up keys for Glymur CRD.
>>
>> Does the CRD have these physical keys, or are they routed to the
>> debug board?
> 
> Yes, it seems to be routed only over the debug board.
> The keyboard too has the vol+ key, but seems no direct key having
> vol+/gpio6 on CRD.
> (sorry should this patch be dropped then for this reason i guess?)

I think it's fine, but it would be nice to mention this

Konrad

