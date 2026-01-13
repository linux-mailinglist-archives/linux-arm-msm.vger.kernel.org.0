Return-Path: <linux-arm-msm+bounces-88677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43868D16FF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C0D7303B44E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F5936A017;
	Tue, 13 Jan 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvOjxq/j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDyV06L4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D436A010
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289124; cv=none; b=cVd7f3Q810u0eF5bXGve5g17tEV0BfrVdyxOya4jDhippy34NXuCjqNnTKeTvmd5HWQXhu1OVIkYiLlBEzfWrkKPAiOHGeWMN1eididjnmSrqKqWVz79dtelvkJvWQgvavGiX6lzts/6sgiFTEP/zZOxbotdyfw8clWrcSysk0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289124; c=relaxed/simple;
	bh=4y1z74I74wV5TZJd8+su8VM1Qrre5PePG/ChbohzSts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8U/ZJEkBVcUP3BsscYiyQ9yhqLgKDjrSMGRWCshNoLBpoiVA2lN3w5X43AaympfYzvYKJmOSG62tseZR+KefndV5UIO0SD5WRo+B98c6xSzh7s3+SH7Y5RzMJaUFKtvniAqLoaZBXSCvhA7ZB3J3TilK71KQHzUNf4IsNsUiG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvOjxq/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDyV06L4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1tcAU2751682
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3RtndY9JSNUGztbtAlxwWzM3wiP0gajRFvzRUA1daI=; b=hvOjxq/jR13VjAuh
	JgoIib671Mhe7pj877VHjtbeGTeYrTY9TN33z7WUDGtXDwzvZTTSsxn+rlZDHeRH
	/RoHY5tgY5W7WC+XIDGiCI2Qg9vhncYsemRBICy2zZ31ukCQ605n6FU90XtYWGW3
	EDyzpzGwsoyeJ7GHBDuIxVIyh0r1uqzoTm4c0QEnO9b5mFqB7aastqvG/Mi2szmQ
	jn7fS1LfAGVfR0abzMFmPj4PYVjfwccolup29V1VQxNsL7FjwGBtN1GkRIysPmBa
	Dh3cQ5DVJCn8YkB0EGa8/4DBaEGUc485CORrQSHcdrM9k1u+3mSihZsy64rs0Sky
	MLDPaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjrtkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:25:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f26fc6476so108797785ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 23:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768289121; x=1768893921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3RtndY9JSNUGztbtAlxwWzM3wiP0gajRFvzRUA1daI=;
        b=iDyV06L4+P8H3PlP03EPNQTZcaxENfsOd4dUgnhASlVPANMZd3vX5suPvGk+/6qx2m
         t4h1TF+faesmfPx+IoYcmtAytaVTn7wV7JEVMC2mNC+nc9Y4aIPEO8Q/s6wADkXTHnAa
         Bd12+5RX7kVdTiBrhbyhMNP5mZgIZR0/CWMGwE+Db0zfjW1I+1e8elNzLHjoT3TPTh31
         WVnGO+ja784FtTH30Orp8Gfx09W8gC/fqT5ZlgSmP5iXctHTIzuv9UpHAQirsDqgRz8k
         S8NK8DEzNzNDkEtteey6N8sSxCrrnubWMVW4+zmJjIbuG7SRbLmz7f7gxNy0dGjNwhjb
         ScOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768289121; x=1768893921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3RtndY9JSNUGztbtAlxwWzM3wiP0gajRFvzRUA1daI=;
        b=UGlVAd9oi5ICrBiqYTdvmfKukbrstI8pfk6gu7PvW1bm9vRrdUe5qxP3ybvcqmgxiu
         CPy0bZNAxsBaabqu4iWhSdIb9Upnu5eAPNe7ouHHr1nLGNWvwvfup3unu1AUA9C3z+e3
         n3cRKmTR9dcY+WMmfHgK6vyIRaLPwGGmR2iHfM0wdflUDllZnkW+pNn3xbFSlUPFAHk+
         1HJ9zGD22bV8iWhKT76yAXbSKX/3r29n+AUZq5zSO3hpfVF28OnrKePu8MsuOUbFBx4f
         J4gQSDVtAdbLdPjGi+KLSvywsH6mgO+wHCn3OtCKJq71f4M9obLYtsIeH5fx4JFgSTlW
         fSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI0eIj2g+weJgEugV+OKUWbJkoARv4KbVAFkHqeE97zI64pHsn+sBmjQuM1n4BwQBYtc2H0qbZ7IqhzHu8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ZmrUbbGO0W5SHPf8Z6KFJEyqP/K8y4KLf/dOUkF9Gxa65EON
	cru1W3/NQ302s1sFBT/+rVEGLnPx6R/F2a0rvFk0ki/eI7sAL04tUjLP9vWGElrc9A1eaFVj5Ru
	JXFM0eU97zm6NcRQWFTHZtwLx21saNhzIIunxxJXoZHmgHtl4xoy8AlF7WtlbleizrS+Y
X-Gm-Gg: AY/fxX48fjxM+pM5EtMd0F8WeWHxss70piwAKJC5WmkNb9EwqwsUMSpokENxXLncFuB
	VfbXG8EHTmOvK1HKEEAHs6aQGVF/vEE4eqeeN+DiktJF48kzpktEPUr6eJ7D7EVFccj8m0bJMod
	UU9c7T9Rc+MjFCKL/zrOhbmuj7mY0NdopxM/QMK8mewolbOjvw8Yi7aeWKOcNahV3z8EmG79iEk
	jyFumkv1os4MnhRzHdozf3XYGLyAq/IqO5AGTYBV1mZCn2xfS0MH29Z2BcZUdBmbOlX23uDLHnb
	l9J+R7d9YeKeGDK7GOjOo4dAcm2eEs0fD247Wisea9hbCcOVXnhO0qMOPBBAkmiLH+22Hueppjl
	gGqXFOsTPZrLpehfsaeHGufK3Y+3NyJDE6WO9
X-Received: by 2002:a17:903:3c27:b0:2a0:86cd:1e3a with SMTP id d9443c01a7336-2a3ee4b23a9mr205602375ad.44.1768289120615;
        Mon, 12 Jan 2026 23:25:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3GJrjsZ8zo3J1IHe1VcK1YQyjXx6yYH9W8Z/3BL+wybU4P8vSYvoJA+GVvS+OvySwrNF8aA==
X-Received: by 2002:a17:903:3c27:b0:2a0:86cd:1e3a with SMTP id d9443c01a7336-2a3ee4b23a9mr205602075ad.44.1768289120129;
        Mon, 12 Jan 2026 23:25:20 -0800 (PST)
Received: from [10.218.4.141] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2ac2sm193787905ad.90.2026.01.12.23.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:25:19 -0800 (PST)
Message-ID: <b50dc9ce-7fb1-46dd-8adf-e58778553934@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:55:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/4] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-3-ram.dwivedi@oss.qualcomm.com>
 <20260107-deft-mouflon-of-shopping-baaece@quoll>
Content-Language: en-US
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
In-Reply-To: <20260107-deft-mouflon-of-shopping-baaece@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2MSBTYWx0ZWRfX6y/EpYYdnE4p
 73i/o+NWYnQFyJSDbi71lEvyTbIOcu8SO7SfsUFqcUUMnAH98jx8rXFCzR//2LU8cXK9ZJCmxnX
 E/iBYEjXgbXWQb5H+WRsP7+PX8OVfQzMb9obkd5LrU3TNO/fLPY/1s22Kcgn57f1wBSNVtk71TU
 7T8tFcP5HbNswAqiAlJzpZZ14mcgs/3/rIN10o7HKCexCNmpy0nKV0VcJD7B7v9lWgtu8Xk7CC0
 BO0Tc8PuY8etL4zRuyXrdidfBeTW+9FEIkvGJaEaWM3PkC5IBQwrXsB+GDHrGzun9CEjHt348Q6
 AOGrc3XSvTkd8vy+BNTRzia7aR4cHmgrAGLs9vNU+2+pEnmUediyIfyC2UbRIWEH0fcGqpFimOi
 mWcKetC27pB68h2JM9E/aVqBnqf6qmEbn/I6igp3Rmmsz8fCYYYl0Zyj30STxvDDA3K58oSiekA
 TMyDnWJZ5/3RyTZ6oWg==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=6965f361 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zx1G0kDcZyo6BcUW-QAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: msWDLWBJiQ5QvJ1IzBXJUUwBnOjYpEND
X-Proofpoint-GUID: msWDLWBJiQ5QvJ1IzBXJUUwBnOjYpEND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130061



On 07-Jan-26 1:08 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 07:10:06PM +0530, Ram Kumar Dwivedi wrote:
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +        ufshc@1d84000 {
> 
> Completely messed indentation.
> 
> Why did we ask to drop the unnecessary soc node? To make it simpler.
> 
> Even if you do not believe that code should be simpler, you should
> immediately spot the odd indentation.
> 
> For such trivialities you cannot get this patch merged. It's third
> revision which you send carelessly.

Hi Krzysztof,

Apologies for the oversight. I missed correcting the indentation after removing the 'soc' node wrapper.
I will ensure the example is correctly indented in the next version.

Thanks,
Ram


> 
> Best regards,
> Krzysztof
> 


