Return-Path: <linux-arm-msm+bounces-86838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B5CE6B80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 156623010291
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964C93101A9;
	Mon, 29 Dec 2025 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQikgAu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCBg+KUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD63101DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011871; cv=none; b=PKxirfHYHYyIvHih7eXuLysVOYTfVWOHW4deFbyvTK18Ek+47zbQkjPKD3hGa4vtilUpbMffPTQpuCZL9dnPSfDTD1m751PqaZFhWB2JFF7j+EKz88a0/TKbHA50TVkvLPon9MkW9M8wwhtNTUttG2KrWyE+mV0vA9X7eF16Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011871; c=relaxed/simple;
	bh=nT92qiQlJmJbd7SItIsGenMKubhtenI2TnajlR3nL9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+CT8UOAf3Q0qWm64TG29XTukhoZnYnAf/46zqvGB5ECilrDc5PQ26tfgUz/wePJN4fP3J+QQ4kytj8ycvlqOfmoyTqvE2DsCi1BNLpJJV0gcqylqIWI/w1OcnFt6q2RNKVUA2A6QARnG/IQ0GEr8GME6ZLpjZBU+Iok9N5chv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQikgAu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCBg+KUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9xiXX211639
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaZHnBGnmNXjwkhAyFHlaI3G1ZN1jGr7tnGr4jzkuTc=; b=KQikgAu9aJCkLTQ2
	HA8tdbIq1C588ai2r2NVmAsprKTJTR6iE97k3ILeJ5OhfHvXGZPy/A3FSGCAJ/3f
	oTlaUtNuR4vFSH9tREnzCwoWX6YKortVu+dis3bI+Fuq182dN1ELmRkRyvS1d16e
	KjKnGwsz7Smg1u3iEjakNSFZX34jIJpHdanD50feWJwqsTjrEIRue4MfLVTtx5uQ
	/nU3/3f+IyhTnhXZnTPDdpJlsEpSwxDFTcAXDrzg7qo/y/Re2Cva1QLI7w4uehgE
	Uu4TSPVESkEfbndYP6ols5Jh2ME87qzTP783OB35lSVVkgH6rvKccUdPzu0KA8hf
	XOwjIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v1k27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:37:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so386528385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767011868; x=1767616668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaZHnBGnmNXjwkhAyFHlaI3G1ZN1jGr7tnGr4jzkuTc=;
        b=FCBg+KUJWOzI6XuCKw//A5rD/2UGci95ngd0aHrvAY9victiHzQ13UHiGb3w52KVgl
         VI2o2FJWwUDCIPUHMqvy0dDl6haTTCxXjv3cl3o3wDc3UaT5M94uqN5eGk9sEKVK2H9H
         metOyesveWlKyrgKNb1hezq4inKtRlzCrLjO763rV2n02X68xNEEQLDX6O2itjRRH5Bb
         TEBh3q28qjFmYETV+twlJMQ/+MvkdpFvMXb8Z17J3Tdkn7RYCw2Z+nknJ/h0zHPNOsNY
         VhtRTcTSWnNrvQQS2DQJ7+KHio14e0B1mZvt9fapI5WYuFcYySNqV3gIY8ttsYTwRt+P
         YHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011868; x=1767616668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaZHnBGnmNXjwkhAyFHlaI3G1ZN1jGr7tnGr4jzkuTc=;
        b=UpZfgGr5Zib+ljVFIo1rKEXjXeo0fTksQvVVsb60ofeZpQd/PyQl1qIZlsGc82d2mR
         VUeliYJ6T24/FVqjCokqH8XdgNVFcyDJABkVJBOz9a7nyuWz0TzAvidZBeSKU/tduTIb
         031Subma8H3UO2d8a0Rwk6DgggQO1hG2C05ezPYLLzm9lUXOQCDT6KK9t3VFPJk5W0iG
         t2LtnrOx0E6XaqULMwj6Ann6lLio2pgM5KmPxr5o49ymnUbYA4Tk1Xwm2wGz+cSkdwgG
         +7cIdHIqNq4WOoxzQLREuyjDXCXfSXovcUUo84oB2BvkyCHtPPnP8ZRzHiP4A9/1ghmA
         oGAA==
X-Forwarded-Encrypted: i=1; AJvYcCUpCmSz8tiiywlnGuNJU3IqoAEklcqWh/atnOGB897OBqcZnG7EF/87wP9Yg2fLcSaejyR/4EOclCZfXZ5O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8lylS3133ozMgaKK/GnoNYkdJqw5kwFu4Zrj3kAxIaIM3Xx/g
	vSZvlOpasAZPbZ1fFV6lssuD8vN36A8eRaGdYndhVasDk8J+WwzgaNuGoFCodFdqMJoTslnoPml
	YrTnKo+UqM67lEALBa7o7hSJHxA48UAxQoFAtGTsq+VyVwMqQmV69apMJBcnJoXj9vDjW
X-Gm-Gg: AY/fxX7oQjoCXvuDs4XtlwwF95hi72AQfShrCrziV0uDLuqVdJ5wob1GENlHzooqXog
	BG9G8Gteqwum9jWpGYLww9eirahpt7tabWO+RbVlqpwNrojqt8QfPyJEMpViS47Y/3TN518hxsE
	zmEgbCrn6edtxKuwdNh66u3BktKYUmp3MKJr9Y6DKC9bh4WzCpZuKQRfWtRm0sci8qoZZQA3P7u
	bQaa2jIVcPsbMLu/hhua+rN87FSEiDGuGwAQGdQGznHVOC+VuYZ6AqVFT5TSamKuFFpSbj0T3cG
	FlbpfK6YM6TjqtkdjvujJCvSwvfkQkm0VL8FwwGIBh5jU+6Dd7Ix4QVrqRuRzTTEL6uIPtN5dp5
	7BDXk5pv7TWrslhzNB3OxAVXNMXOVfUjtNQH4owNPmDRJjJgiuAMLwwH45/TndRSn+g==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr342484681cf.0.1767011868224;
        Mon, 29 Dec 2025 04:37:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo00Bspo+dJ305XE3GhkwO64txDaV2RvGiGPAuWEJUOqnB9MRjGLEEumjHYKJoxgoT9LfHlw==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr342484371cf.0.1767011867710;
        Mon, 29 Dec 2025 04:37:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm3302470766b.67.2025.12.29.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:37:47 -0800 (PST)
Message-ID: <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
 <5116928.iIbC2pHGDl@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5116928.iIbC2pHGDl@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uBCHJxvrC3y7aSO39hp4vJoHRllg7p5Y
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=6952761c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=xfDH5INOwdilrQn0DfkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExNyBTYWx0ZWRfXxNWieAuGOPQZ
 EcyUC/W9LUC3Q+WSFQvQg6Aur3LuIITGFkeu0LO+kV6Qyjh8AKcevImkxvGhL8qarwqwTjHxhke
 suf/ueRc8KLM5tVvy4B7kbAaalH1XoTtwY3JFG3E/PYylfx2k0DMS54j3TWjsTWvJAHXoVRqKWU
 KKyy0WaM1KDbGfrfPNBbyKQx1RDFwNyUI0SmvM/owxht2eY3votxDx3oOVJFC8dDwMvc1/EITdC
 NoEyHzQ4rYiNdnY8Hnlb305ayiSRVey6F70r9pQOuoPYEBvYr88zk8tl4OdjKKQvSGGSCnLReI6
 UHDdL8Wt6+cl/Ceajs5iGiTKC/BFv5JNcn4wNL3u036SMQ0zeaCxKEBb5P6yc9jRBV00JIByaZ3
 D2JuBSdd2v9n9WZ31UK2gE8mFJenK2x6QjsGjeXlTHkQEDH5euy0gTevI1yRs7i3BM6Zb4gvdPq
 fFprPwE75WWgMhL4Itg==
X-Proofpoint-ORIG-GUID: uBCHJxvrC3y7aSO39hp4vJoHRllg7p5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290117

On 12/23/25 9:35 PM, Alex G. wrote:
> On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
>>> to the q6 firmware. The firmware releases from qcom provide both q6
>>> and m3 firmware for these SoCs. Support loading the m3 firmware image.
>>>
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>> ---

[...]

>>> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
>>> *fw_name)
>>> +{
>>> +	const struct firmware *extra_fw;
>>> +	int ret;
>>> +
>>> +	dev_info(wcss->dev, "loading additional firmware image %s\n", 
> fw_name);

Your email client is messing up the reply context - if it happens to
be Thunderbird, set:

mailnews.wraplength = 0
mailnews.send_plaintext_flowed = false

in the config

>>
>> I don't think this log line is useful beyond development
> 
> Remoteproc driver prints the main (q6) fimrware name, so I thought it would be 
> prudent to print the names of any additional firmwares:
> 
>     remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140
> 
>>> +
>>> +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
>>> +	if (ret)
>>> +		return 0;
>>
>> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
>> is missing, particularly not to impose any new requirements on existing
>> setups". But you haven't spelt that out explicitly.
> 
> I intended to not abort when aux firmware is missing. Maybe the better way to 
> handle this is to check for "-ENOENT" in the caller instead of return 0 here.
> 
>> You also haven't provided an explanation as to why the firmware should be
>> loaded. Is it necessary for some functionality? Is it that case on the
>> newly-supported IPQ9574?
> 
> I don't have a good answer. I reasoned that since the qcom provides it [1], 
> the M3 firmware would need to be loaded. I haven't done much testing without 
> it.

Well, could you please try?

IIRC it was strictly necessary for ATH1xk-on-PCIe so I'm assuming it's going
to be a necessity here as well 

Konrad

