Return-Path: <linux-arm-msm+bounces-73993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A239B81AEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 21:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3247622219
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 19:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0086527E1C8;
	Wed, 17 Sep 2025 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpD6o0Yw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520A81F5820
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758138494; cv=none; b=eJZ92TRinItYRG+iReFaLbPlCj9GpGzQlcwVrkYiQ8CjOVkVjgBheTehYpmEO3um0TYDY6YsyP2K9Y0XClonfNYN+UvspJDKXT2/IlYk1GaYZVbQyOFZSdmDg28F/Q5weBWn7EgPAuIAp2bKbdjgvRqDagpIWvn6GErHf5uB+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758138494; c=relaxed/simple;
	bh=gc4XDbpi/SHiw+dIuM7XRaag8prdni7GHABTYWIpL6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxN457VLRa7qM136m3PQ6bEhGIAkyUlJDQAatooEQojKC1lVM24PvBS/5RpV/RBvBJrOeKIm0O0UqGbA1PNrKZFFFQmgh7jnd0tVYtGaXSwUUtnuuFyzJBEg+6qwBqrC1RfYXIGZKBedD/voMN+q7Qz1RRFf8GWlavjpqzKBgKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpD6o0Yw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDG4tE003366
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGYCeRo2Nm2iHZbBrOloUMVIcfNZlQpAwgAkvYACT7Q=; b=GpD6o0YwTSxSy0Kp
	04CweAao7LR1ZHrx1wCp8sY5Upn/Pzu3m8eb59eHCO0wr16aN+J5Fzvw/1yJNn5z
	sttNHbvb8I39/pBW1nbVJ4ymqDFODZIhD7wL7Kq9WStjHIHYcNtU4fJRsKm+62Vs
	H9LVkhTmZc8JzRsMT5Hu1k+J/qjmQKsLfnSvKsflWug0TP7r8DFnYGKwQcK+Va8r
	TJtfNcm8wuNVEtlJuPzjj/wO+m7F2AUCaOFXHXmYogr36Mvpb7jlPMRIazSdFqM/
	jYNja76a7NWsTxxhO0cnlJ8iQMo6B65f3qFaWjQHxJZ4SrOK/Y9/5ijPTMmL39zi
	Uh/gmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgs6t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:48:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329b750757aso105275a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758138491; x=1758743291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGYCeRo2Nm2iHZbBrOloUMVIcfNZlQpAwgAkvYACT7Q=;
        b=kPA24IHU34dm4uY/xIOi5fkpJ0jWG0KAAU3wHSFOWdyNPoYWRCNtt0ENTXzOIigGtj
         R8YtwKHXtVgXOgmXtfwL73gt8YZK2dqSHG+dLrnfVy9fiFjaNb3Q2HvNhIC3sPvgZSdb
         /8OCbYGVMaR8zBdX/BhGoj53ivBLDi8/5Z8HgB3r6tHPEc/p41t+uXRcv+1vnVHfPV7O
         X9Q0dkTXFCA1ZGSAM8OFLO85tg78nW0/FBi0d1jFq8Gig69/9h01Sb1NnCUrcuLhcZmB
         kOhzy2YpqFiCJjryTBve7H+Jnq16O00a9SHuNiNsQjR8Ipk8T3jbEMCHT8REa++cZXg7
         Og2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVAmZ2o+oRq7A8SJsmyraBh9n/SAt+p7fJ8bhmE5R/r2QMTGC3IqtboRUMPUcL82xhh3PktGx/Ah4RTN+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uCISlWEzqpQpUslmRXiJT2AOXY7qaDGpcqCdgvpyinUe4Tkz
	dtJMA8dyWn/JtxsRcHjV25sqIo5NlSESqgDC0mKXiH++ob5jEFxidgL7Sqc7aMtLNXQvh+isoCv
	10AXa8V25Hb1jiphY6LvV6qnudWq8Y7XPcG+Vhr2PYzbQAgZj0oDSA/bNX102n9KE9/AG
X-Gm-Gg: ASbGncvoXHxoSrqAxWzmqMYQrWVVQjK+MGigauNdGKdk5J+44SJbVFMeP+ze2nb3P/8
	LaMPMUPQb0kJwRb86FfpkXVyqxHCOzIaOjCEOlcG00/WlMtbOiEh/m5HpB7meTZaFLmDX6alpW3
	JpDWllsQjhx4WmNbgKslv1+BPMM9HZN9/D+fOatd+xrh9mSf8o7aPIaJQTs5v9QCcaghIBhQz0L
	lU+9wVbmaLVBvOVJ6+lN+Wdj2Qz8kYRRJ8rVf3Pwiwur359iEUAOMdlflixuk+tuqnZsKsy0y5S
	rxLguQrdDOQy2LEUR029I/SPZcNbEyuQyWfRAYpS+mFCaoPDh7TKX3etd/TdZK6Zk5GB5Qk=
X-Received: by 2002:a17:90b:1f84:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-32ee3ef7071mr4546619a91.15.1758138490215;
        Wed, 17 Sep 2025 12:48:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNUj9iiTkIiBdyuwHV1qhUP3oLhWgJBvCsq76MF3fHoniGNQ6FCUfXLye/WwI6WYVKAKakdA==
X-Received: by 2002:a17:90b:1f84:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-32ee3ef7071mr4546578a91.15.1758138489768;
        Wed, 17 Sep 2025 12:48:09 -0700 (PDT)
Received: from [10.216.40.15] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3f454sm199284b3a.75.2025.09.17.12.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 12:48:09 -0700 (PDT)
Message-ID: <47f7a917-3bb6-4331-8813-49f6646333e5@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 01:17:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 5/5] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzysztof.kozlowski@linaro.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, agross@kernel.org, andersson@kernel.org,
        lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
References: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
 <20250826083657.4005727-6-jishnu.prakash@oss.qualcomm.com>
 <20250830185809.5bc010cb@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250830185809.5bc010cb@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3R6MatnYyMmdHOSY6bz5KfMHQ-76NeRM
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cb107c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-qQjPGFekNv0xv3-IhUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3R6MatnYyMmdHOSY6bz5KfMHQ-76NeRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfXzK0tetEsrl8m
 7U/4NjO33dWiVzCW1pAARiZyGPVyCVZt4f6hcHYYnDK6oluEUf52XxuKN6dA5qFy9hnWUpy44b3
 2E/Kp4pRuEjE4n1s7zkmeJvmyER/xvTpyXpJxlkJsKxQKB1NWHEQEHd5UBGyGXQVPEAxd03viIX
 VfhwiC3OC4NYyiIzcaeEXBZCnIDkpM446JTuZ3p0r5CperQn1kWja902t3xjwyk6B/IkM5K+cGH
 T9viGfMclKICFSpa+Va8uezSHrZRATAjmMebM4R2tpG5kcXt8u2nDbrzQ90CJNC5UnRvQCRGZey
 hj4yfO6w/1KaqQvh5gxpoUkHYcwl6KmMYCXiiKSPi0Dp9WKMmLWjs1ONmrcieCbR1R9jnGH6HiN
 xmoNVHrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

Hi Jonathan,

On 8/30/2025 11:28 PM, Jonathan Cameron wrote:
> On Tue, 26 Aug 2025 14:06:57 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> Add support for ADC_TM part of PMIC5 Gen3.
>>
>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>> drivers, used to support thermal trip points.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Hi Jishnu,
> 
> A few comment inline from a fresh read
> 
> Jonathan
> 
> 

...

>> +
>> +	adc_tm5->dev = dev;
>> +	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
>> +	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
>> +	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
>> +					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
>> +	if (!adc_tm5->chan_props)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < adc_tm5->nchannels; i++) {
>> +		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
>> +		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
>> +		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
>> +		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
>> +		adc_tm5->chan_props[i].chip = adc_tm5;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, adc5_gen3_disable, adc_tm5);
> 
> I'd normally expect a pairing of a devm action with whatever it is undoing.
> If not add a comment for why that isn't the case here.

This is meant to disable all ADC_TM channels in case of a probe failure.

But thinking more on it, ADC_TM channels could be enabled only by the thermal
framework calling the .set_trip function and that could happen only after
this line at the end of the probe, for thermal framework registration:

        return adc_tm5_register_tzd(adc_tm5);

So I think it makes more sense to move this call to near the end of the probe
and to make it devm_add_action() instead of devm_add_action_or_reset(). I'll
also add a comment mentioning what it does.

I'll also address all your other comments in the next patch series.

Thanks,
Jishnu

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	INIT_WORK(&adc_tm5->tm_handler_work, tm_handler_work);
> 
>> +}
>> +
>> +static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
>> +	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3", },
>> +	{}
> 
> For IIO drivers I'm trying to slowly standardize some formatting choices.
> For these I picked (for no particular reason)
> 	{ }
> 
>> +};


