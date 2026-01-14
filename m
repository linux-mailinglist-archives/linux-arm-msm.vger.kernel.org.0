Return-Path: <linux-arm-msm+bounces-89000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B28D1E071
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9D2B3041F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2222B38737C;
	Wed, 14 Jan 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDt2rwrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TN8ls7qD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3875357A45
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386402; cv=none; b=I7+kQeDgG4pvgykxSUTLetxm8hQCctHb8aedKFAj7iXX4ilp+uCzUI7QqI+UlsVpEXZtinwVAShZqIuFoIz+uPrZKEXnW9LBiLPXTEKrdTg18vA+9kboZaC+mTbAiox3cvIAeDDSUU9+4WENhv1WYCBNbiKVx9W3XPc18FvBA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386402; c=relaxed/simple;
	bh=Fu8MtgpqCxZ9sGmx8hkJ/VocCQe/lZv5XoRHvC6Yeb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeukjRgG2JZY2b/Ng3nCu4k5rpw4SF45kl7ogCxxY6F/pd4G16FaYo4BfZNgjLga6MfTUPcq1aCG2cmGFc0sgtwcpr4LsG2IKwna3hkP6vcbEHMpslIM+8aC/snUQTlJpGeoiY+xVXG/EYznq1A7mur7jXEpdfjOg7Ogpi2sPos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDt2rwrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TN8ls7qD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jCKG2081592
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=; b=WDt2rwrK9qwcNcxN
	PCA5eli9kwn0fjmAmwsHjzCBb+34sd4HbPxF7BWP5vXSP8K5EkZGAfL37cJo4ebL
	9ZX/ieJPUd2B+sWQvjwpTjWcnU6FSYOKqmpevHg9wIKOG+EpTIC5ZKEa52lo1vtR
	Kv3N4YUMK/Ju2sWbAWEzINeUf936RT0ZzbbWKRN4XjObUTL9T8iyYDEKYZ1BO9yX
	gcM+UJZnB9cYIdUu5vqH2sRpUH9Qhq467OAWsU0fjQrbMing9XG8qhd9Og0CXQJy
	ZIAtelGIBKx5VYOm4jM43nRDGc6Mkgb9kBtFhPWm4WjnUbHLJbOlGu48KsacyXPg
	3M/0FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58txrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:26:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b25c5dc2c3so176379085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768386400; x=1768991200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=;
        b=TN8ls7qD65k5AjZpG582nbJjLFlz8elNbcPfps+n+hLGpFLLzPAE3WE9NfNr2GBcFt
         aDwyrjnfEiE8Fcsw02119/AAAIk1L7C7bbnMyFr7NGoXoP4qqpjWXcYQ912td6byGwlO
         z+N5nTaiBltJQW8b88DV+FXfIx0kahO0+PFZ3zhSrJdwVeDYBGW7syOo7R0WN+EbzaKG
         2nvUkmVNF8UOFW/x6UgD8i+xO+6pRx2apEBHAqnnGTFK49cNmiEcbGbvliQjvVjvL7k6
         L8qjQQ46tOo4JGVaiwQzYty7lPkbppMob+4RBSQIWcKJjNM32rxNnowufcmUS0df0W3r
         Nn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386400; x=1768991200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=;
        b=vgRFQuNQ6p191FjiFVNJI0Biihlg2za8ZXctbyFtSZnvwpLU/hWwp6H8L9cP+Rr7Ad
         Ula7vWigrTpFcwnlgIa1RxkAvm8q+68JXLRU+eefPq+Ox8Mh66RBolumJU46e7qqGS94
         xglarPIanDJgKUxc5KclOKXzxZYJb9OFlpmuHXxTKzq32MJ9fsSIJO75nyK/OD6u3iOI
         RShTG0HCZGSeGYPRE9t2AtIm9dPM6dTIwxnAiUz6StHeDBNVGsISr1/L7PHYTDH3e8oQ
         JGqTD3W46hjmxjHeRw0lUj8iR/NS++tAql7P8GGcTFLtkriiF8ed75vKQIWDT6BpJXxU
         Ermg==
X-Forwarded-Encrypted: i=1; AJvYcCUmq+wg/tLv7d/P1gw+qpPLXUCY4fy2xd7zKHefHJvsWp8IlIlaGO72mjH6IOYiqH4sUu14EiHqZVgMvPfP@vger.kernel.org
X-Gm-Message-State: AOJu0YwY1LLdFPShWXFoWQInSUVoEUjGshSlCAiJ5RGwCeKQhzpUlEyg
	78ENvY7vsF+41pAUc0w35JD+F5oYM3hi8mg8MflMQ9Vr7VJ1weZJWqVM1zF4Vc6qU7UTRi+DcrT
	LvgfRp+EOrFHH1Q/IRNOsLOht/mSZK/n6bne5GFzyLmIRtwRhckoOn/WglpkZOThIVl1y
X-Gm-Gg: AY/fxX5JLTkg+bqHDbbKI0Ax0P8E29pC0kHWp0tKqmi4grk8wLJ3g1t1l7UWBREN+xy
	dUnizdielPCRJiw13Ixm6NHhrtIflbMh8Nphg25dLW74Gu5uJfarNg10mhTOkeTIk26LeP/lb9P
	ptUKMC9/sPL4IGVi+nkLkTekaqGDJFc6VGOR/69SDKz3Y21oVSzBzs4t0I0fbQ59Ri1xwmoxv+K
	17vQSw3toF/aIkomGLcS85Qi0Fntu2dZApr2on5QANNgkr9Qk993FE/vpxn5vgVC1rK6c6gBV43
	MlqnGCSdD1bSWd6Yq0LjStRwoOLFn0yR4ktbIjZmkEWkjCVRlLWgxn033Zr0XXc0A1pQHlipkCP
	8JPjVWZUyhqkEFAzuOEBJmeBeZ23WYosPsN+T8xFDdDx7NJzW1XDzdGiDlIFVdagQejU=
X-Received: by 2002:a05:622a:520e:b0:501:4ba0:e06a with SMTP id d75a77b69052e-5014ba0e3a8mr6840451cf.8.1768386399687;
        Wed, 14 Jan 2026 02:26:39 -0800 (PST)
X-Received: by 2002:a05:622a:520e:b0:501:4ba0:e06a with SMTP id d75a77b69052e-5014ba0e3a8mr6840271cf.8.1768386399212;
        Wed, 14 Jan 2026 02:26:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9eb402sm22427982a12.15.2026.01.14.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:26:38 -0800 (PST)
Message-ID: <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:26:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4814455.tdWV9SEqCh@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NSBTYWx0ZWRfX8QuAjDQ3V1es
 8HV9AIR1O9LksSaKE4yGf73uYojbiYxUOjqqaWzZceoSCgeA6h1U5A3sgCR+seLqpAJjwstJktV
 UslZPMqsvvjJazTiyvd+nDBhIKja0syEmZyD9DpoZM+bsvsg4KVLKvVk9I56tGitpUrHdv9RHzq
 VA4nDjWtcpaY/3YOrRxu3Pt/b8llT31kwN4M/nraltQ3Z3+svSlV0MQ5vzQIfzi9CAE72Ig8WYB
 OW3/AlUfEdHNkDAo/uO/dZK+bXTa0f+RDeg5BwohdXnHDWZJmYD5m8J8ogEtTl5XI1iOb4j6uUc
 p3uf10QGx6ABI/p+fbf4h98uq/rcDYYIT1Ebr96f/upoggj96TLu1sjxt778kLVl4e7apjTeMPV
 ySDuP2eHrsS6P8KWu1Nt9cqkRgHTiw7FqeBeAX72oJgrrcaQrFOBhLMkzf/4DyOgs+mFTiatne6
 DEtQvZ3/UcCJRPSB3kQ==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=69676f60 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MOnJJczUH92I72-_oswA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: N8LwAFKr92I0oPFVunPSMBJHf-0lrHrr
X-Proofpoint-GUID: N8LwAFKr92I0oPFVunPSMBJHf-0lrHrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140085

On 1/14/26 4:54 AM, Alex G. wrote:
> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
>>> driver. This firmware is usually used to run ath11k firmware and enable
>>> wifi with chips such as QCN5024.
>>>
>>> When submitting v1, I learned that the firmware can also be loaded by
>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
>>> makes sense to have the option of a native init sequence, as not all
>>> devices come with the latest TZ firmware.
>>>
>>> Qualcomm tries to assure us that the TZ firmware will always do the
>>> right thing (TM), but I am not fully convinced
>>
>> Why else do you think it's there in the firmware? :(
> 
> A more relevant question is, why do some contributors sincerely believe that 
> the TZ initialization of Q6 firmware is not a good idea for their use case?
> 
> To answer your question, I think the TZ initialization is an afterthought of 
> the SoC design. I think it was only after ther the design stage that it was 
> brought up that a remoteproc on AHB has out-of-band access to system memory, 
> which poses security concerns to some customers. I think authentication was 
> implemented in TZ to address that. I also think that in order to prevent clock 
> glitching from bypassing such verification, they had to move the initialization 
> sequence in TZ as well.

I wouldn't exactly call it an afterthought.. Image authentication (as in,
verifying the signature of the ELF) has always been part of TZ, because
doing so in a user-modifiable context would be absolutely nonsensical

qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
has been there for a really long time too (at least since the 2012 SoCs
like MSM8974) and I would guesstimate it's been there for a reason - not
all clocks can or should be accessible from the OS (from a SW standpoint
it would be convenient to have a separate SECURE_CC block where all the
clocks we shouldn't care about are moved, but the HW design makes more
sense as-is, for the most part), plus there is additional access control
hardware on the platform that must be configured from a secure context
(by design) which I assume could be part of this sequence, based on
the specifics of a given SoC

Konrad

