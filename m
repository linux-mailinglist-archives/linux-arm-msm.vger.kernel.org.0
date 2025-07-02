Return-Path: <linux-arm-msm+bounces-63376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D44AF1331
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 13:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED594E5A67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0315221F37;
	Wed,  2 Jul 2025 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOZImIpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E425E80B
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454198; cv=none; b=s/aoat0SHYk8ysXXq5fRwlFAX3DdpdFMh5k7SfigkrDrS+v7HCFEdmQkAe33LbuygbGeNk4Nxr+He6CsVQz7g9VZ1dfKH/IvOOXny2qjOP+sCkvCR3MFNj9ob/bqUnjW8GKGYNEU+tHelEUQa1lc+GIc6wZvSIYhOo4sK0yOqCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454198; c=relaxed/simple;
	bh=UqsOoiEtRgi2jrNVhPu8IraMKM1WqaHrnLwWkgQObBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+KkVYKw/K9jzqJdzc3hkM5BCtIgZ86wTjRRoPc++oRAuQWjK3nDzuTeZdmkMfVSmBfUh18boak9b9I5V5uDgK85EtSednIkL1kcIT0Xn+ppi7OSSQfmx/BkyCuYJC/159z+nsYRhjbf7fr97nDSPWmlZ4epHoaJNHGgBGJT70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOZImIpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626lMJF032128
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZ0+erNLxw7VuccyfYjtf67X1Uezd2e0x85nHdRkqBc=; b=oOZImIpDzQ5d4D30
	AfrRTjcIPEq3Z08qYVXJQF1qDlcB8O3CKRwR9qQaPLEDxWfdbu0d+XhbN3Fr4hXa
	pgqKNrLyujH20Kr+A5zoKjOnCohjAEXmdB9EG+gYDKg20N/p4JsMFedsljJVbH8N
	YdIeKwuELqtPJMplkT4/OkOoK6d6Y6Bs8UR/8siv5IBE7ftjs3Fkd1aXFrJ5cjwR
	oE/CtlvBTKmug+LTMvbPCjD7soNQ9xhUp3svfvBhiUAO5lv/QFDOj/+KJUqw8D09
	Lf1XtNEh1ZNorFHS8pzQxFg9iGDKQeUFwWHR8PExmXfsOX4fh3Z0yD0f5ODgl5ys
	UY9NzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kceex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 11:03:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ba561898so76992285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454195; x=1752058995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ0+erNLxw7VuccyfYjtf67X1Uezd2e0x85nHdRkqBc=;
        b=kVyfxQ5+KrmfJ5Al6Ndf+72B9atgieVCxc9/Q2mB8pbxrYeOeJ+Tg+b5E0gwEBsxC2
         /SLJ1+TysGq7nAz5z0eIvwn9iwAXAcVokO8Pwy2p9EqOdF+YelCjFbJVLNjnkd5RV3St
         F3GCsDg8t7ud2rFrVsKENqfLiYC24fyu9q6ol5BX3yVQI86SNKb1WsrNo2cW3ckKYPQ4
         uvO5xKIr9bKcwz15Dnh/e4kNdX+PHUiMrdZw2pnQ3a30I6/46pXc6Mr9ffbUczwt+++4
         Gc0FOXFOZOJNm5TCZ0yMaEgzt+tWiMSOyB3U/vCoTy71DbWoL/mbWgQgKBWXqG45MLkU
         4gxA==
X-Forwarded-Encrypted: i=1; AJvYcCWl3UJIX8CPCpZEibStLifZLxYLR5HphaFwjalfeZI9IC2yPaseJ7Br/De8pir4QyxvI4/U12TrMXLrugm0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SxFOMtAVYhR+q+GUX3miIAqW3QCGJO/mrCz/yHqapi+3uIu7
	vQ8ZKlgyARf+JWjWUkHudM5hSQUqcVOTMkLPQ21HA19SzLgwoCiOgn/lpqam0iDv09xBRe++ArB
	0rJUix08QB862y/+YqWuKDYThbCdvoqCrP+HHAXGL9esu7ptIwTuauisOMhtFuQg6paKs
X-Gm-Gg: ASbGncuQBXKqrVj/9uADCwtO31u7yJgd4vxOprqzOuxLMZTsGZb9JGRjacamCPTaP26
	NKUKdVwBKSKaoXx8Gk59ECvVwI3nT3swZJfZFZHNop6fvT4okKcP/UtZweidd2JGmjtHlU75s+k
	KH4fXJz9dclc8FQWDYKWgDJ027piWQGUtPjH541ep13nVIqzLrAGKWrwGrTRVkNWvlxmPkYbYoP
	d7Dse1CQk5PKdGNCS2QThlui3nTYoOOYqQLXU+XpdDeaFQ1rhTEE0mPgTbDmimjgCDYQ+NIxdUE
	qFEFDcso/67S5zerXqxwg3kZpSwnpSh74wFKbMlY++HeCc/Z3S0HcWwYlBqk8vzFWDpw+kPbjwS
	KCTI=
X-Received: by 2002:a05:620a:192a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d5c47175d2mr120700485a.4.1751454194973;
        Wed, 02 Jul 2025 04:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJmVaoky9zcbK8IX4+0F2FowsM3fLObjXG5U1FlDD2lNhegepSkRgmdrUwoNZH1FaJWrApHQ==
X-Received: by 2002:a05:620a:192a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d5c47175d2mr120698785a.4.1751454194496;
        Wed, 02 Jul 2025 04:03:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm8869551a12.34.2025.07.02.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 04:03:13 -0700 (PDT)
Message-ID: <5a58fb6d-8ddb-4835-9da9-4c449825367f@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 13:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686511f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=FT0SUlyUvFbnnB8yFIkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfX7oy61/xOd/9L
 I1jO9CtKhBXo7C5lcVQPM4rJ8wu4iv4jOOzoovGFxKx5wSLPeh03q2o+6Jnk3havjyf6IZcZsRF
 EOWkDM/uYAw9Ku6HjqZlfgvC/F9ZNB9meezjr0onBfOJc1+Cemk0hTuhwyfatp6EREDD9cI+xvs
 8LXpadHrH0KKA1RaTWNc8OSNfD8n/VmosymgxmDlOMuSgnuOAmpkMq3zB3ElOOCFr2kZm7sLOqq
 DPNZcctp1jxMtllTACiD3f2u2jNFlKmM78X7kOVRbn2jfTtKoLdebXY2y4gCWuPEdllZTU93dIX
 zF48tEBAil5y/mQy6zW3jdDdVvBpoZzf5B1VZG2ijsN3YFzc6fi/two884ix6qb6hryqcjYLnwf
 ozWYogFee/bNx3oIZL+hrIsAO2TEyAqrDTzEjKjzBDtmMBUpTo9n6c0bdVVwBTtAJ91xv8I0
X-Proofpoint-ORIG-GUID: RI5bGiw10W4k4LxD6OCmuMnXTjJrzmk5
X-Proofpoint-GUID: RI5bGiw10W4k4LxD6OCmuMnXTjJrzmk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=762 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020089

On 7/2/25 10:45 AM, Bartosz Golaszewski wrote:
> Note: this really is an RFC. Please don't spend too much time revieweing
> the code in detail. I'd like to figure out if that's a good approach at
> all first. Also: while I tested it on sm8650-qrd and sc8280xp-crd, the
> last patch cannot be applied until all Qualcomm platforms are converted.
> 
> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
> 
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

I can confirm the above no longer appears on the same SC8280XP CRD with
this series applied

Konrad

