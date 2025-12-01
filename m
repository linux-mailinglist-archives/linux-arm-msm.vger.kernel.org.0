Return-Path: <linux-arm-msm+bounces-84004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC9C987BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BCAA3A3C43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BF13370F5;
	Mon,  1 Dec 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZi7lk5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9qFWm5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC383370E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609538; cv=none; b=WHFk0oQW6JLiClYTsbZyuCqap0UbxR7Y3OEArdm6eXkkOzVwVvPxdbrG1aThYuGzmb+UYUFUKeLTuvCBllyVVu2c8bNb9EyqttOJUAcnliAo5Ink6b7i91elbAoXlefkUSG3bp/6LqV8UfnkQlBbB6tbsXHYdKY7yCYB/2TzLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609538; c=relaxed/simple;
	bh=jQu/0pfExuAoWyGvuNX/rwr2ryXUJjoXP+qbIAGb9PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5hkAHJ9ILXx92gTNoxowTfIenAXZZnDHC4l4y+RQizA1J+OTg1MgYLcqC3G6zc+ozuOu/+xd+TwVQgWmgxOm2ihyQqJRrF0Agy4d3qPGsYpnVl1G6kxhTK0nqcrcBGCoCD/XOJUvtnpJxPuFOtfGDRjD5Nawo6X3t+EERj7U7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZi7lk5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9qFWm5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1CGV4N061025
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBbaBOGe5klrtjBehaYCRT7sgkHLPQutgJ4o9PQvSYU=; b=XZi7lk5cbkLhJYrR
	kxy3Z7Edkxo1yd2StWZo6JMkbcyI6Cy7t1MmqbJC/PlsPLSdOvzlLcCl0Rh8YL2o
	8v24etn35hWQLRR9SRJo3DtZI6Kywio+J25GaIPhizY2lqxzE+fmWS9UBLkvjXYu
	APkbS0oAQ3/c1wX/LBTvPt5y1+cTj/gWcsSewUUIBd/IxUrAUPYqBMsg2RDd4XrJ
	MkEcOZVfEU0XDGlG7FqLeIproatHYNdK+CBJDRLwjS6Iisu/WhcyUaHaWVXTAdNw
	X2gb2K9+UCoNOHEACnMMNitlGOc7tYMiSI5labisuuESlZGK7AQ7JG6JNzAnD56W
	0E/R+Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asavh8wcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 17:18:56 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9371fb8589fso37141241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764609535; x=1765214335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBbaBOGe5klrtjBehaYCRT7sgkHLPQutgJ4o9PQvSYU=;
        b=R9qFWm5mxlSX7eOvmfAKsCiEpKS0hQIvq4Z5x07IQCiI00NNfogUhO+Nt+qg3i6kLy
         fwwg8vWJByVKG3DAIlZLCoDHIEawzW5i0YoNhYc9lf+pQXA0oECnM3XhhoKSaDMd93Ly
         KTYBWZCAU0/sm3XoSZ4eeB7xrk+F5v6e4mEeBX60LWJhKQIIo9GN73Q/yi+vDFQuaCDm
         nkNqpFNT03T7XlyGI7FuG+bcHHIvh96ihq5zuGbwRculBAlQih6qJprWlNbjYD3LamK3
         EL94Z64AKNy6Oanvv17IO3AnuOLkxiY1Tp+5TUXn2LqMmRRv/1CoSZ8+4/xyuMwGJijk
         3ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609535; x=1765214335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBbaBOGe5klrtjBehaYCRT7sgkHLPQutgJ4o9PQvSYU=;
        b=U7BypMBAFZiL/GLZvIgdf6kxbjB1u7xg875s5V7n1gw3iiHbHVfZofVUtjwt1WvZhz
         Tcq4M8ywr8zTrCZDsOzxHUL5+ABH1J+GvWiEfYD4r9Es1ibCLhN6nBigumnLYLS+n8oQ
         vH8u/qCGJAG7t/Cyq2u20etY3+IbuNh7c3VQIrm924CQV3Er3uHnsOaFaJb60Rarsphz
         p+ncWeNVedaSaPthtRO4C1jpzdbbyD+pbGtJgmOXVyg3/HR8yXCJA9oAcFxNvpGi0Ery
         wAQtK96giWWl5C8JbZzFKgHvTlUwkqxPJ35G6sUwwpt7nZL2ODCOUPoJJOiOAblZtxGy
         ivTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWigzAYrM7DWRlQelETxeVzPyHEYUFLS73XtyUP+lBWc5UpZpGqXAG7qbtF8OTr99JtC116rzWS47yhpG1d@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZf/daWdnTPXJGEzq8Fhm9R3ZqOzdLT0Fft7uZes8+Q0e4CRT
	ubbK3bIwZ6OzKNEKIA47/HUCIDShs4QvLnS2sXN8jSQHdqApIMOYBERfFRifvps9soM/yzzysWP
	wQleTYfD22cXra2ZLADPj56LFG0jJ1uyl32kZEpLEXTx53vP6XgaxeQRl6cyem0gNNjy9
X-Gm-Gg: ASbGncvaNX7CWeFlcjWFOjs55fbQZVfy6Tw4EukM3ZzuuG2ns6q3dDnztc28lNXWsju
	mNwOylxYl8V26EJOtO0zC0lH2c/L5eC3jOXqljLFkYZsaxUL4qgebEg2w+YM9JYJC8Ir0UPr/tz
	e6ofIOPD+2tvu1CFwB8kMCBtAm8rutPquizezFs6670jRoQ+1oLZ3ytf1I8QgqBiABIjaD22rYi
	AsYQdk6cECvIVFhg+bPIDrDU9MJwRy5mTfTxWm/vBWDdxqDrlqlBI4uY3r9VK1WmeRxJxEfGvF9
	pNU5YYK4/ZIpUIbfCO5NSlDjV4rA8Z9b9vYJaN/8Bh6j2apPE/rzYUGQT344kN/+26GGJ/E5UGH
	1gmg78ZbnzWo6ldwwaDExcztRx/tEa3cZrYAQGORu9i8bYS2NumhBQc8hlTZxodyKzEY=
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr7235630e0c.0.1764609535126;
        Mon, 01 Dec 2025 09:18:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYCJada/0RSlX4x+VUaXaxIlUA7b0rcGI56yLg/SM6B1iQRkieH8uQ3kyk9rp6imMAf4/iSQ==
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr7235602e0c.0.1764609534618;
        Mon, 01 Dec 2025 09:18:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510508e1sm13023041a12.27.2025.12.01.09.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:18:54 -0800 (PST)
Message-ID: <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 18:18:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
 <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VOA1a9Gdrrsi05fZ24JEjmbdXIbM7VX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0MSBTYWx0ZWRfX/eFuCW8QqEQR
 7XQiAne1+Eb8FwwBgNUS3M7hRM2QX0KJNsDHJDGFuwhIRfawFhdtMgD+1ewnm+9Kmhius5RUzy3
 KMrEgHbjtC70netxXwRVo9b0GPnfT+lhgmV+eOub4XL/sT7OqcsE5h0QEweWEif+SYFNDBurxkI
 JS1bwBlBrDO0PezDprcXtwKtFE/aecUgqBHJ29GoltCMXl9pFLinbrb+KwD9Qk7z2/GXF/Kk5F4
 kfdb37U3uKWwM1pEDpcJPurZKY0HxmwA0I6cNTiH+GqL4u7bvN4PLwD7wr5F9UxR9tkYi1kOhTt
 pyXHtNqvfim5aS6N+yVvTUegz8Dj2FCUoDL6wGeEHi6R1+e2GqfrFF/M3qayYLeHeECKXf/q0Y0
 BUgNEzrNfbfThMTggZQjpta6JcHBJQ==
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=692dce00 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OxG7tpPIUWXr36wslIUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: VOA1a9Gdrrsi05fZ24JEjmbdXIbM7VX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010141

On 12/1/25 3:48 PM, Vijay Kumar Tumati wrote:
> 
> On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
>> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
>>> The current value of '0xb0' that represents the offset to the status
>>> registers within the common registers of the CSIPHY has been changed on
>>> the newer SOCs and it requires generalizing the macro using a new
>>> variable 'common_status_offset'. This variable is initialized in the
>>> csiphy_init() function.
>> "offset" + "common_status_offset" is confusing
>>
>> Let's maybe add some platform data where we store the actual offset of
>> the registers in question and pass a csiphy ptr as an argument
>>
>> Konrad
> Hi Konrad, may be I didn't follow correctly. This is consistent with the way we maintain the other SOC specific reg offsets / data in the CSIPHY driver, in csiphy_device_regs, isn't it? I seem to think it's clearer this way for the reader to see all the offsets at one place. No? Thanks.

I thought this driver was a little more complex.. anyway, big
changes that will make this prettier are coming so this works too in
the meantime

Konrad

