Return-Path: <linux-arm-msm+bounces-67111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 354ABB15E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B55D3B4A88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C2B276058;
	Wed, 30 Jul 2025 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjFWxtb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887B272E7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753870870; cv=none; b=NsPoH8uhyrWnKrrf1f4AIOSVcqsn/PCPFAxqPBKIo9bx3wQYYgepw/jiU8FdtbXB4O0aD+HNwG2vU7/BrdppbeZLQyUeaZbi+aj2zaaaeYeo3BvrCZZlMTcdbwRwzGgNbWVTDuh1HUpf/aMZ06b0QbWDF1Xzcb7uCu1jiiCKvhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753870870; c=relaxed/simple;
	bh=j+9hz4E+vsPZjdDrRd0sik2x2f8tzkAgQtvmJSLMoTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJoPc5x3moXusQMex2kq+dQoFpMXHRF15nyJ807WT0eCblbZfMHaEPOQY+rQNlgstcRUNpJjm0dG6VNJpdKElbpVnjDruZsmdAwMqSHZnong5D6MYO3Jp47N2++rXJYFxoh0IChSXuq1EcpqprzKYaSl6jiT74eTMBbll6q3T68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjFWxtb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6oojL031280
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+9hz4E+vsPZjdDrRd0sik2x2f8tzkAgQtvmJSLMoTo=; b=gjFWxtb75Y4ca+Pm
	hr+/9aMcZL3+9Rehg/l2Oo/STEYeqKjwwL4bMFNtBWU/lcMoHNuSIYtHSFQwqwFW
	SQ9QnRLg359/kpOH05QewnxLi78qgfBVsK0QmPKmn3gPEQHJG3fHLuNIV50A5wwR
	0eBhNyzx67ZQLYqpjJbzXguJRZ+xm0eWAaBKMiAkAQt0mBsevuwMl8vn2/ajsTbe
	hmEZ6E8mpBR3w7D0O7AAlEHBVZVAIOXt83e8l1APvnj2XvI/LLa1rfZwEf0HLtSf
	qmb8f9W58H/u3hNxZYDQAPlX90iyx2/ShRitSc1oD5d0Fc+ajTAP5KHULLtV/jzg
	obcPPw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xgs9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:21:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bb73b63d2so44704b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 03:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753870867; x=1754475667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+9hz4E+vsPZjdDrRd0sik2x2f8tzkAgQtvmJSLMoTo=;
        b=fU3Z5/RR7EcFeSWXJdbvFWUvlJidaKIe184NpsubIajzU/QkqaHqRVdQRl97iDMr+5
         C9AT/U0sLhzMEI75XA9sAIl3OOIN69WzQ7SQqjCpuLrEsatc31N0ZhVypl/++8LQrcKp
         qOgQHA9egftRQiu6FRh1xEuobP97sfY+qGSKd57rbSyORgLrSB9s4DNzLXSm7jOP8mtI
         /U7IcMRFVBtLOZGt4ACWN5YGo5Q3WqDfsz1b8nUMfxGkqdOV014oaLRP+bmvNqc1tQsR
         VrHqD/1IGHwEvMVifIgcUUQKZJwzvbdxFJqpWpqi6TJTUwrN4KAJh4kMIFUcBVEulvrQ
         P4pg==
X-Forwarded-Encrypted: i=1; AJvYcCUJr3R1uPuDYTynxei6lUQpLgrYaFy62l1ccBpYS77CL2eZncMkO83aIXpLEOSQinw/RwG3BoB4Stly+f1C@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUv3ytxQZdUrJ9eRK0hR9czpFJiw3+AnlNnXeCSt+2zHJ+/pN
	n60LJFQ/vqc2ctZLY3OTsJnSPthK1v2F3pDGlWROMNS1B0cLtG9qM4j7HtWsUtURaT8NBbLww/q
	EgIGLKb526cHM+EnAAm6SKiYzvNLy9ntLFgzt5llHvcB/kAKyahsq8gXyCO1zAl+mpvAr
X-Gm-Gg: ASbGnctSMssEeJqaUSbnoFvFg599cbdHfAKtP/ie6Gj5Ww0Z3zt53+rFCVHMfnnLg5i
	j4nNHhNIEFCGTO9J+v3NMg6DWBut6AW3pnkL0TNDAQPy8S1yc/axulLQcGwxs4g//xUV0Jwp/26
	naPxRXINQJkHJ1JVVEHE/34qmiKXP3xiDfHSvliTgXv4RY+/qgKh0C1SiVg5VxkYA6uptznG5/O
	e1G2ZR0MJVFIGPh9VMC3Tr8fCVghQq+W8ajS4CZIv+2mzvPVXxOWG5kJdA0TzYeNBZN0jySVjgg
	2YZ39D8d8dDtqyXB0PsFIFmdA02alGjfdC5Dub+KYl/ao1lddpYCskoFFVfqEEj0Zzpe7qt32H7
	OQHy4z9P6
X-Received: by 2002:a05:6a20:7d8b:b0:220:2a64:bce1 with SMTP id adf61e73a8af0-23dc105d19dmr4848591637.35.1753870866948;
        Wed, 30 Jul 2025 03:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHikeRjft5Kl0sNlMQ4iyepVjoUKBt1kzPNi1m1KyVzj+vIRXPgqn0nhGvehtzp5/D9BIPtRQ==
X-Received: by 2002:a05:6a20:7d8b:b0:220:2a64:bce1 with SMTP id adf61e73a8af0-23dc105d19dmr4848538637.35.1753870866416;
        Wed, 30 Jul 2025 03:21:06 -0700 (PDT)
Received: from [10.152.207.84] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f58f15esm8958739a12.20.2025.07.30.03.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 03:21:05 -0700 (PDT)
Message-ID: <91100136-bb4d-47e0-b910-b9c940775747@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 15:51:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
References: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
 <kt372ehgwt3kjaxkdk47rri4s525pr4a6fvtjxy5c7rsf2ad6s@ebeaygqihe5k>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <kt372ehgwt3kjaxkdk47rri4s525pr4a6fvtjxy5c7rsf2ad6s@ebeaygqihe5k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MiBTYWx0ZWRfX4K20PoDoR2Fs
 jbLpvT9vfXpxVGZxIHAA4+SuuOHfkCInQb/v542MJmrNAMd5hRrKXQAA+nfTMYqxObBN9StDfap
 JLJfrBfiMQHSKsjM5NX5bJdmn1gP5FGTJ/M//uDKPasOCbb1Y+ju+QUlOeJFL1HHENYMO4w97DV
 VLe7hh0oaySD1qGiSEXe83/KJfS5bTk5Vr6kVBq93ucrQB9JPrIztOQ2CE+OoV91htzI6pgE7CV
 y2vXn/OWEvePN8F9o69Do/vea9lYszDFoA9aYgFhF7G7A4qmTr0658X8d3/4rcFeHf47bx81L0c
 kxqt2Tt3EsX446XyqrnMaogEJxnyDa6FYNcyfaQZeeeFE4U385G4UkSgzASvn/PJdYGZHIvplxY
 JM7YEK1oMudJpDwnuakKLaAHr9ZOOV4FWrDQPeikhoxOu1vVHjlMH7xjUxwy0EvpYCbHgLXy
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6889f213 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Q61XbrR-VouMIcKfwD4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 4dFWXDRQhPmdxogFLWtmZfw21VwA9_oM
X-Proofpoint-GUID: 4dFWXDRQhPmdxogFLWtmZfw21VwA9_oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300072


On 7/30/2025 4:12 AM, Andi Shyti wrote:
> Hi Kathiravan,
>
> On Tue, May 13, 2025 at 04:38:33PM +0530, Kathiravan Thirumoorthy wrote:
>> Update the I2C frequency table to match the recommended values
>> specified in the I2C hardware programming guide. In the current IPQ5424
>> configuration where 32MHz is the source clock, the I2C bus frequencies do
>> not meet expectations—for instance, 363KHz is achieved instead of the
>> expected 400KHz.
>>
>> Cc: stable@kernel.org
>> Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> I was sure I did apply this patch, but for some reason it has
> completely slipped from my sight.


Thanks Andi! I was about to remind you on this today :)


>
> Now it's applied in i2c/i2c-host.


Hope it will be part of 6.17 PR.


>
> Thanks,
> Andi

