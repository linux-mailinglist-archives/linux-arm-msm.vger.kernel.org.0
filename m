Return-Path: <linux-arm-msm+bounces-64896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC3B04D03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 02:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95F804A0F23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 00:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0631684B4;
	Tue, 15 Jul 2025 00:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg6YfY7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEC1552FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752539940; cv=none; b=C+0VrBP4SPATGpjvkwl35uPXpqSHsAt7nRJwKAy6nu5sxrsYMVu5MzQiPKZIle95mQ5mUHIlfll5JlZB7RQF/mMXQEqGAJjD4Sa7iZrLWRGgkE5NocLKu229OKrVqs/AvBW/ou+OzqYAUXhoR3L5uq4jitLjg1tjFNAZbjtrqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752539940; c=relaxed/simple;
	bh=c63CxCap64qcRtfZM2TY323KDbTANRLbCrd4PJ8AIN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCUZuMHvTFMXUoxB6hlbknysVep6VhLm25Sp6f9eBaqqink2K8WYSglcCx/19Tsa0InOQUl5DRMqOlV6DJnnbpW/Jp8r8TRGHv2nHum2yPM5TJXiG1iGJjVjhyEhEhmV/v6fnGUndymCCgHdFXtWS7PZawpJBDUZbQt79BL8/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg6YfY7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGKwll018610
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4J2fuae3WtqCQsD2Ch5uOcNOvcZ88vUrJULIKtoGLw=; b=Sg6YfY7cEcPwyjdY
	j7+HmzlNxRlH2VT+HNZGcOsEnDWajo425i72yFUI3zrbStmtdDAQ0BLpxfwSr/iV
	dbLxJeUOqYDL6JxjrUjeKHTjVobzSuZgDmWOS5xMqDwUC3e6NMaREdKpbdvf5RaP
	y53boJhuXuSKF6ZR8OJruUWD/n2KICnvyH9GiNjOqU1ll1f3EQKISmwFEMnG5sYT
	ezbLy8XHWKEAkNrWsKcf0de/Nzc5KPkuqLiOit4a66TOUt3Qwhx+dgOcXAfb2LOz
	tCIibojLKJPgcLgKQjs3jnoAy8GtG6vYx6LVCLqwMyxgmKGNMwOVpg9NlKWF5Uh2
	c95pew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu868cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:38:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138e671316so4236945a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 17:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752539937; x=1753144737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4J2fuae3WtqCQsD2Ch5uOcNOvcZ88vUrJULIKtoGLw=;
        b=YbsW5oa7YKyIlNMWFxPmPaIS6WnyFB5/BoJTtrlqZ7/33nOu3PBUKe4S7uRzvf4BG6
         ly4defBrgqehUlVGWCkxSVWOtJoWYr6wWf1qChXX/EoihTwOEvTOAyYUH9aNqa/UjzXG
         tZSVX6L2v1IUFjeZ0bgD12rfPeERi94kwnsplMwJM/vXfNw4YKpdRvsmlHKAF0Ydi3QS
         OeH2EQMiNtVMunRL9NljMqM7uFHEjpCSxSx3SMCvw2YyoCkHSgIEaTJqqgdqm2HtNrgO
         Sy1VkcY6A3oWjxxzT7xKZqGLDTakpc+2fjypcjZNMiV43yCJ12jjFCXIksHoXCayPdhB
         pt9A==
X-Forwarded-Encrypted: i=1; AJvYcCXtZCx34vgig6bo6qqsNqTMee/cZYQ9nH6nzj1CvQ5Rq1jiaND12dsMqjg2G9L4qcymD6vnE8pZkVAC/fOl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lVJep1hEKvm+KdlfygvMkdavuXk3r6qfqpHAV54OBmYjfUhH
	u8XReemQtczuoVyaEHuzoRqpcs4LE+Saey8HQMO7AMbbQNkfXr/8USIc0n7qz7L6PLoX5P2/UeA
	T5W+mQ8hvsvDjVQIGoBAYqKQgkN2ym2vPDHw8cKBPu5JC49f9usRm3H52CDVlStYryjLw
X-Gm-Gg: ASbGncto/s/r+NZkcIrmOYXqHLAqrDZo3DUTWxzRvZTejfb+rxb9RVxZnPOC/XL0oN5
	uHs2vsIZw+h03su5vPEz22fR+SVol87Cy0JpAiZqSPJSvgydQNqb0vh6DSOi1wChs49a/gkthCV
	floR1h4ccX7DiSSkFrZuQTbhrbkOHhj1T94MuLyU7sX2eLirV9EsYp497QoTfnUrbfxa0hHafk+
	5xiyyNbgL2A6HGTxYOdVgT3xm5yRyDJjP718vw7YohqkGLoJQIH6j22mg89+IFS9g4Q8tfuGPQN
	WUGkYx0tKz8CiKpmKU/FdTO9RhR5D+cL0H11sto8E3tdnJJK6xJHsHPWxlW366luGzFjKGtoR5y
	TmIaL9O7yrWhsMBBYH/Nw8Iuu
X-Received: by 2002:a17:90b:3c8f:b0:30e:9b31:9495 with SMTP id 98e67ed59e1d1-31c8f9bab10mr1778265a91.9.1752539936777;
        Mon, 14 Jul 2025 17:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDza662yRgiFSwwfp7ca/WsrZ50+RlnfoSXKRcgI8DgPoMrM2ZRqD6pgfsoivNJPe+/C8jWA==
X-Received: by 2002:a17:90b:3c8f:b0:30e:9b31:9495 with SMTP id 98e67ed59e1d1-31c8f9bab10mr1778237a91.9.1752539936298;
        Mon, 14 Jul 2025 17:38:56 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b22sm97642945ad.98.2025.07.14.17.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 17:38:55 -0700 (PDT)
Message-ID: <a2136746-a9fc-4bb2-a7af-7e7cde5068bc@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 08:38:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Jie Gan
 <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
 <3551dba1-0c5f-4000-8b95-6a04cd81a027@kernel.org>
 <2e8366b3-c060-4bb8-9704-0a8f41901706@quicinc.com>
 <9c11bd92-ff2e-493f-8e71-fd8d3f8b32e6@kernel.org>
 <cbfb9159-1c80-4db4-b5d7-036980a1a44a@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <cbfb9159-1c80-4db4-b5d7-036980a1a44a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwMyBTYWx0ZWRfX6431lUZSZcfB
 D2D/N87m7MtcGa9Jsx98A4E2JNDMvCDA8ryBzIzPYpXkxyjRlkVrfJK2+qRo/Bq4oLBsh0+HpwC
 v3UXYrWfapk6OAJz9S7EPmxzdJhtgSGtEWCQUnLlhL77TG3/yKtc8gue4oV+9ZWAr6w7rGQsOCW
 nzPu4XYf/VrMUGdjsQExuS9vGqVYein+VGQAmvHYP67ZeIn+1wbOiu/7MU/vr+C6UwbaLeS8UL/
 GdmFm2I/6EbW5BFsPxLLdEQ0mL+EsWLyLznjyws8UFJsUVEYt8u8XGeu2zNnFcSOeh+AXeTqrGN
 03yWYIbyAfyXqEYAeNuuHrPpVrTeAD6lznYExV517R3EbCQclg1cj8zVUTYVtk7Wr8o5HF3HH20
 gsYPpDBCiUzW4S3KDPiQifErOaEJPG1C+0iwrR0lXw/CSUx/CS1FJRRTpWhg1xbyGVcVMUt/
X-Proofpoint-ORIG-GUID: LnbF4p_O5NOaRhDzYC2RkGwbsJWyPHkq
X-Proofpoint-GUID: LnbF4p_O5NOaRhDzYC2RkGwbsJWyPHkq
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6875a322 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jiYdY7Ay7elLp-qxoG0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150003



On 7/4/2025 4:14 PM, Jie Gan wrote:
> 
> 
> On 7/4/2025 4:10 PM, Krzysztof Kozlowski wrote:
>> On 04/07/2025 10:07, Jie Gan wrote:
>>>
>>>>
>>>>> offsets for the ATID and IRQ registers, because they integrate the 
>>>>> same
>>>>> version of the CTCU hardware.
>>>>>
>>>>> So I propose introducing a common compatible string,
>>>>> "coresight-ctcu-v2", to simplify the device tree configuration for 
>>>>> these
>>>>> platforms.
>>>>
>>>> This is explained in writing bindings.
>>>
>>> Yeah, explained in the code lines..
>> I meant explained in writing bindings document. Please read writing
>> bindings first.
> 
> OK, will check, sorry for the misunderstanding.

Hi Krzysztof

I checked previous comments and document.
Can you plz help to confirm that we prefer a board specific compatible 
instead of a generic compatible, am right?

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>>
>> Best regards,
>> Krzysztof
> 
> 


