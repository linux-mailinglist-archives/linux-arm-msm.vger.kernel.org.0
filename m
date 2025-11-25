Return-Path: <linux-arm-msm+bounces-83151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73062C8317B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 03:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FC4B4E6F77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 02:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771911D618A;
	Tue, 25 Nov 2025 02:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lg7CLLda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAgX9GQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA741C3C1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764037704; cv=none; b=iBs3OLnK+Gu9w8y/QLTSRBkavnCw4362TzR0DqzL/DVY2pBIQbDgib7m25SiI/To80jdbyQjgkmRQFpDJgHCdr7H9U9EyqOVwLC0AzMyb6PKtx6LepvptgaEw7yZjFinAUh56gO0tQYJAdPgdbs3mal1f5xzydx1+RdoKmMc8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764037704; c=relaxed/simple;
	bh=+6BeB9AecFg1ONQikvBvjirwj4xDOnz8ib/bbpDaxRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kChviymSenqT2bKpvFWZeXS2JJrmks4bd3ACn4ol2xlNQetPq6Qj1Hfa4NNDOUIKDHKm901FQFGoVYusdRqR22DEFBqlmyg2HRA7sx7UEOIGCEu1Auz2Aa5XHblgmj16z0On/ynYuKkUfDTXd6evkU5ZAdEqa5FdkZFeLzNhxas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lg7CLLda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAgX9GQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOJrvZJ543319
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+pq6qRKxCnhKAyPN6KlZHH0m2NrWbAeB1YZCoEFrnU=; b=Lg7CLLdaXGPTau6U
	p4kn7DWh2IytCUkEQac1fWPUe6lk+ntKc0hI/ch58t0n641DJQZQcyqDz8qMUvz9
	ZQVo1BS2kDQ6Mm4zH571vpbAgG1WAkuvPVevqkCVa/MPsA/kFO3UypqpKiRWNJgj
	uAdH+V/oP8yw/sQy1eLelmB5VkPQbYMR4uRPMQwfi2DShLDTYwqZNokvuaakBJoi
	W8rFofmDoxyvOuRcdwTB+jL6+DnXBYYLBOeyM60VSEvEOmYcpjaEGHSXbXXvM8v3
	JOK2izdlAM8xhdg6vNsFP7kvXNMELEd0QxUax1rs5cBdSrnft//p7ZFtLmRg+ZiW
	m3l8cg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amk10k0ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:28:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a4c4eeeef2so12152686b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 18:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764037700; x=1764642500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+pq6qRKxCnhKAyPN6KlZHH0m2NrWbAeB1YZCoEFrnU=;
        b=UAgX9GQY7CMGY5nMcAZF2B5gBmzfmIAv51pseWQbEPcKtZV6n7G7xDLmIm/MrmR/Hz
         hLduZk6jbgsfmjP4je1DjhcyleQs/kbbe6w86e7DLoIYk9mXXeycAFREZfMGaxurz861
         Fk6+zQh5mih455NOs7tpYZgMvzDQv6IZiMY4SQasbXLd/6DdTa1ya8tPoiTCq91pbgLw
         JUqcFedjDVJbhuDR2PdCWtYuRbVsT8vQVT7CoE3L6lWdd3uuJuhAzqwgZ6qiZq+FcZXh
         tlH1LeIuF7r0RWZNBtgL404sngKBsms9oZ2uiqPwqsWwtWvdtJPZeVu1lGG6/pQzqRvC
         6CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764037700; x=1764642500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+pq6qRKxCnhKAyPN6KlZHH0m2NrWbAeB1YZCoEFrnU=;
        b=KBGewxbh82uv8OcQmEVe9lcxDGbrzjk5YZsA9XcVQYBBZuBcxC7KA+vL4eMfyPGeLy
         UWu1XNvto5LJffEDdqMbAKAjgP6je7Nu8r9K9nCm0zrLWXTgAAPq6sIiGwhx7HhC1p0m
         kZ5EuXK0yUYAXxGPLXLDKP0rE2D8RfnxAQbKDs3BqRyQZW6rJsJ4RURhJCsoG+rtANKp
         mu0QFHkRCby9hc15dxWvtKI/eIXltb05n9gUwkN4SjjEcR7xR+jyckICK7iAoVY3E29n
         9H2x97piJQMJo/5xxpUfAlHxvdjBTIp0FZPcMRCEzGmFkCDFtIHzA0yqLA29OHAKCYTh
         qHZQ==
X-Gm-Message-State: AOJu0Yyz12OEA/PUrEfsfih3oHqcxc/ySfIJ0v/nay78Q/rAovaX2D7p
	KWPE1shn2mHY53U2o125QGQ/xqJ+GTLq/s4FBYrKJnWbkjPXkJEPPqQSDT0rNbBcUKJr1eK0TUf
	WJ9fLhNrJr3Hn76LGUGLGK+THlYo9FbFYSOj96UUSJs1gOnXZLisQ7+6AkDn/F8M+dhXO
X-Gm-Gg: ASbGncsRePPGvwiB0AW/sVVbVhX7CAvfSCM8QUooSZJKoF7/Q4wGnpMaDrGU8MwBKWF
	Di9qN6ctIv4GhY4mwiWQdFSbs3LrwmyyOZgNehdVdA2kgW5Uo0tZS5seUV+L7uSC42EJFlqkrmR
	ijs1Qob5WM8YljYvbJBLXlgk6f2RMdBrRXR4axgcf4Y4npHePl0Lays5u2xXMMTPy74nbGDA+fk
	rOhv4YJUWdJi0fmpbsaaM/9Kp9iceOSPiZEWyONvJ24RRZDgzdJiZIt2azYsCEC1JUFxM3yrz98
	ikLFZTv2GHCWeJD/se62n5gD9+7fRGHpYaTSUmj3hH2GGy3RJvxoKk+F8LAbPy6on4gGzAq+Mbq
	ml9nFwrgdCi+g+K1Mm5kXdRQu6YOhh6pLLraFc2wYQYtcBqE6/5aeEp4kGwzFE6IIvvcAPg==
X-Received: by 2002:a05:6a00:2d9a:b0:7b6:363b:c678 with SMTP id d2e1a72fcca58-7ca8760d166mr1611671b3a.6.1764037700162;
        Mon, 24 Nov 2025 18:28:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi/pnSULoYKIgEeiFvUOw8d9iALk40PhUIbzwODQvglUZ7csFadOXzwG4mNU6XwNDDr2fncQ==
X-Received: by 2002:a05:6a00:2d9a:b0:7b6:363b:c678 with SMTP id d2e1a72fcca58-7ca8760d166mr1611622b3a.6.1764037699605;
        Mon, 24 Nov 2025 18:28:19 -0800 (PST)
Received: from [10.133.33.118] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f095c237sm16291985b3a.45.2025.11.24.18.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 18:28:19 -0800 (PST)
Message-ID: <6eb20ecc-6319-4a5a-bbd5-29e02555dc79@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 10:28:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-1-de27f9a67ce6@oss.qualcomm.com>
 <0b2b8352-4ac1-4a5e-be73-67b5cffdb934@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <0b2b8352-4ac1-4a5e-be73-67b5cffdb934@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yb6tG70SEXvk0P1a2pdo0IZPvG6FqlYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxOSBTYWx0ZWRfXxyVbbphQRTiy
 y+yYbFOU2Kl0H24ajRCR2Pz6N5MMugSoJTO1F20RazTINT9xpEuyjoQMcXTjvTy0EFefYV53RMe
 DVasBgpzIJTmiFStgP1TyKUbgxARfuKWpS7G284Fz7wfc3yGDtg7qmRw6r6WM6grO1i4Q0E/1Pv
 zhEscZp13kUbYxXqa8ppGfiV4+SiXkMPegTM4NjZDmQR7RMwLMNkswfMY24d47jl1T9WUOJyjFQ
 cHTTluOJtmuBbxhwLIjLY6lDZcbG23IKTy2eA85xFlbCmrtTHrUyzECUXka4xCxb1mHg54z71I1
 824ji5rQtZDIDrgkDQSV75YVSGrryLQC7XDiYN9rys9O/Ut83shfrtYa7IdfcZmrA87ETnquYJx
 33Zd0LI7rpTgPSPBOCV74A/dWsP+cg==
X-Proofpoint-ORIG-GUID: Yb6tG70SEXvk0P1a2pdo0IZPvG6FqlYj
X-Authority-Analysis: v=2.4 cv=SP9PlevH c=1 sm=1 tr=0 ts=69251444 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DPOBve1R3aP56xOrS2QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250019

On 11/24/2025 7:47 AM, Bryan O'Donoghue wrote:
> On 21/11/2025 04:43, Hangxiang Ma wrote:
>> The Kaanapali platform provides:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
> 
> Another nit-pick which you don't have to fix, I can do this in the 
> commit log - but, you've not detailed the new regs added below.
> 
> ---
> bod
Ack, thanks Bryan. Will pay attention to it next time.

Best regards,
Hangxiang

