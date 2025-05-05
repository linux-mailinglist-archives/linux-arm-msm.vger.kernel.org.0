Return-Path: <linux-arm-msm+bounces-56793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E751AAA9417
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7B8B188B6EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 13:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AC52441A7;
	Mon,  5 May 2025 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hARKPk25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D215F2561A8
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450763; cv=none; b=ibuuLK5YvoTV2rLmwcEl+TYx9ZPN9oS1vwsXk4W16bLNkIAtAJy5G/f8xs3Uqy3pgXHDA1avpfoMwDenALM9REUOwY+s1abuyK4IvRvhOevLVOFFWrAix6/DPb4NgPQaiYOkW78idlEbONIKa7pF8GuoaaJfCJNkBCCWADoBQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450763; c=relaxed/simple;
	bh=USF+sNnBEJKQ1y96l81A26s3nnhS4sYU9mA8l6FJcj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nox7YUjNGaUOAS4Y1YPbq+9C/VntQDp4ZgMCV8mfhluIbvMhl8ZwHzqf5p8FG0wZv+m9QalnpLGeiOz0ARN2CKgTuOy7mrKB6nGNtBvF+50cW05oRFNYS1r16W/xSfPRDNXiq7+DwqrYcf0nwMUdEKN9A+mlo30k6sODjuIY6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hARKPk25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BxZU4002441
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 13:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgGrNXXTksvJen/Mk1Biwc5pmi1abVHe5nBBkizEdEs=; b=hARKPk25iTRhLQcq
	qHqQ5jtR3CdTqLJbkVMvIw0kMJLSjSe3/dhPm7EhV9jlSKfKtudd7vNFaivEjLmn
	idqPezgr77PjKfV+cnYZQrEj+Y6/2z30kmGU5lQkmNzQMpVTCEO7c0rDTO4tO8Cr
	aQfEbdetzu2PHdE48NcLW7VdIy6c+dhGjtuW2lBaiv3KD4aj5iglni8WZSdea76X
	0YJEPCYxYbA3tO9vDg+Xa9o+Sc/iymxrsSS48IRHsu62JO/wUOzOvATtf2LeYn8v
	qOLhl0AXunRrN44jbV9v+G6WWHL6V9A5M1kXykMOBUvKTq5f5I5z2lB2ZbA1u9dQ
	vRIgEQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xstncx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 13:12:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739515de999so3481229b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 06:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450759; x=1747055559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgGrNXXTksvJen/Mk1Biwc5pmi1abVHe5nBBkizEdEs=;
        b=DZinNVGIQHV7BdzXEbHu0+/SfQK8+HJjaWhHd8mJWO7s3H2Oy5pwAAJBlgO0YJGzCi
         iZSEI2SL2HXHg2923RTdOo00KEeOvqJOFsoF5fBJJdaIg2jtzKVihFzZehC0oEt/YiMI
         Fa7GD+ee5B0pmF5TZUjlNlkqeaT8mBa3bZ7EhGk2qEIz1v9pf4V51IVawjzwAsFaCoKd
         MXd+xdBeMWncWQ4nDZz5xLq/9CSSgnaMPqRvvVMO8aNMRN8Z5y/qKd0KxMaqPjCjMArl
         1sw6a4K+fpQAOt4VfBJItHnFpkmXqys6RWIpMUsnQvNED4Yw3XzbTF6qeNIHdcwLeKvG
         fh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzWyf8X7jCYYYEpqIce1tnjkQEIfkX/yQ9/ySd9edt5X3aASzOBzNy06PWVK5H2GKiGdzmmBzUrfqClzww@vger.kernel.org
X-Gm-Message-State: AOJu0Yyspcud1gr8ZpfZszctoIFk6+YsICeuUINEAddroaFUt680ygFB
	3FFR9MPn+QHr5no9UvXzaUtrM8nCxPWwNG6Bm+3N3WqwQE5uGwEgO4+gB6Y4f++2vZhq0a8SJy7
	0C2C9QUYlFVrIMsHfU6oI8kZUtyIn52FOQBwW4lDzPrA1HqUROPiKr2gX1Wl6P1ab
X-Gm-Gg: ASbGnctB4vqX6nW8a8dEWC4ghFxrSog2ZPBv775VerO/2jjFLgVdsXHnyj6dsWLRLTi
	vMYWkR9qlQMPtBnqXQtX+7kHV/2Y7B2cVcsx6zO743nNWh3X2owMwnVcS7zqyPk3IOmBqS8p9v7
	LU9eJ8IMfXGJQJRvcss70+pRt0yjDQ/fyxJJy1zLY41Xwfm+Ntc4cSWnYDtTkps7hm6tYKdHV9d
	InuIL5nHdvbFjRAu7LTzaN0jIsFJcTIGD7bv0XO7ee8hhObzq06AdVSxSntY75ALx7bQDuPnxpu
	Pmm97gizUk7iRsizYVA0ZJWZefnKPuq4VQgHG/3a
X-Received: by 2002:a05:6a00:8d96:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7406f08d250mr9121700b3a.1.1746450759025;
        Mon, 05 May 2025 06:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqUfiCSwWdQe5qpNIiS7x7TI6ViUuKuy6cSCxgbpddLVSOvpIaIj/adAo66kYzDkz5Sxxs6Q==
X-Received: by 2002:a05:6a00:8d96:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7406f08d250mr9121657b3a.1.1746450758599;
        Mon, 05 May 2025 06:12:38 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fbc81a1cdsm4192894a12.60.2025.05.05.06.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:12:38 -0700 (PDT)
Message-ID: <b2fa60fb-3312-435c-a216-f217428ca683@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:42:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
 <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
 <538b32d1-c7b7-41b5-aa93-d285604d1f05@oss.qualcomm.com>
 <9e8c9de6-19a9-44bc-83b7-5947bb626962@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <9e8c9de6-19a9-44bc-83b7-5947bb626962@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oUH26HrKAvjW07dUqYM4c5sxXcxUiuvh
X-Proofpoint-ORIG-GUID: oUH26HrKAvjW07dUqYM4c5sxXcxUiuvh
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6818b948 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=HF60lDfbR_BPLWgDsHYA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyNSBTYWx0ZWRfX9gya347Hy7A6
 snxo6Ocqb63PlxjCoHt5BL8FtS4NwxICXfx1/CWLDlGZYMqf8/p/EmZu33zveTheNG981oxWVgy
 dBFNsW88kRqrlt/xiaUJy4waze6QotE6x+1sV/d/SrZQVRnde5wUISm+XD6FskaLAold+Djph37
 wC3kX5YYj+k3deZaAw5M+ADBqQ3knLHx2Oa8sDEjLKzt8dIXeoVDrNlcHDQJSg6E/bJtjQ7JjiU
 R+q+xSDnIHQw3wzSlFekgr9cT5V1NSmcnrteql4e6GTbiTJcMtstqA42q7VqlVJfjyhFD6SdsnW
 jGn6oLv8pXwwyL/tixsve2mnP/wKjcqOE+888Q55jSuhFLXJifaGL4gcy5y4znLv7c8RyEiR6f3
 qy0yHm+tE4EHqjwu0X6itTc4FC0X0qH3Rf/taYGdVvs6XKg2zRWmWQ2+rBKbc/WqEXunt5U6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=556 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050125


On 5/5/2025 6:37 PM, Konrad Dybcio wrote:
> On 5/5/25 2:30 PM, Gokul Sriram P wrote:
>> On 4/25/2025 5:17 PM, Konrad Dybcio wrote:
>>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>>>
>>>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>>>> SoCs support secure Peripheral Image Loading (PIL).
>>>>
>>>> Secure PIL image is signed firmware image which only trusted software such
>>>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>>>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>>>> load the PIL images. This change also introduces secure firmware
>>>> authentication using Trusted Management Engine-Lite (TME-L) which is
>>>> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
>>>> TME-L for image authentication if supported, else it will fallback to use
>>>> SCM call based PAS request to TZ.
>>>>
>>>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>>>> came up with this new PAS based IPQ WCSS driver.
>>>>
>>>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +static int wcss_sec_start(struct rproc *rproc)
>>>> +{
>>>> +	struct wcss_sec *wcss = rproc->priv;
>>>> +	struct device *dev = wcss->dev;
>>>> +	int ret;
>>>> +
>>>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
>>> You abort probe if wcss->mbox_chan returns an errno, please rework
>>> this to use if (use_tmelcom) or something
>> Hi Konrad,
>>
>> do you mean to use 'use_tmelcom' variable from driver descriptor? If
>> yes, what if mbox_request_channel( ) failed?
>>
>> or based on wcss->mbox_chan, should I set 'use_tmeeiihcckgddglcom' to
>> true or false and use it?
> Add 'use_tmelcom' in match data and then make decisions based on it
> if the mailbox channel get fails and use_tmelcom is true, fail probing
> etc.

Got it. Will update.

Regards,

Gokul


