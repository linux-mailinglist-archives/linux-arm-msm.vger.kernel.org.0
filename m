Return-Path: <linux-arm-msm+bounces-73992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF59B81AD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 21:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2B8622159
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 19:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370F118D656;
	Wed, 17 Sep 2025 19:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDm0EghQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393022D781
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758138467; cv=none; b=njd9vgoDRUMsTskivwd12pp1JmIREOHNO9VX3vBFRKclJCjHCBxPy+6u5LOUi7mI4qG8phTj9UiBsQ1euHRYX/QqSZofkarGX0GqeBOACKRZOPhDtAdUsKc2UjGIQDjOBz0IAFutiQOmlPo5lANlmVABHZLilgsHOYg9vv4CEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758138467; c=relaxed/simple;
	bh=bxHb+mQJcEYN1HEXR5lcohnZkE2ushFT8WvhP2W65ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpvVIFG4mFjYtLRbGYsm+MNfls28Vioyw/U930hDzZNYbfOpgnxoN0hoGj1HwVXGyvvq1C37iyXkyiAODs7w0wzpAPwYAdkwI25UzWmYaeNzE+qW8cBNDtfep0nd9v4ajaa/GPALVys1j56Z2xU1R8cd5Zehfcxo3Z5PI/fLYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDm0EghQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HIa9Ct017663
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkWEcJwxNtLFoKpgzSr+cNSJHkqgJIHGuI7Rcw4gfLk=; b=NDm0EghQvQiYmlTM
	k/b1FwfJRVlSWfMYbcycE2uKZ3F9dh03cwQE1ZmabIhdORq0q/hG+4hUyreI6g0r
	I/CR/toOcGCHvp1vKZXwOY078kkerWWakzkVeQ2fcQF4eM/RBamr0D8NXfNbgSgf
	FH2n81TjuGMrIsoCSU6ChO3i4Pud4JWslXuS6bVPozAmRGYayE/ES7PxBPh0GXsP
	R2gBl0c7CI2OUhtj6Ybj1CR8h9v86gHkUV6mEjIeQrHtc2sRW9NmpGVCaI2Oh4s6
	xgu5gy+s0GpSpaV8gI1Ii56IAKy2ohSh8CZhn0HMCTUuAGN6QIi+4jEc7HNZT0+G
	t9rrWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982de85gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:47:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ec2211659so124815a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758138463; x=1758743263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkWEcJwxNtLFoKpgzSr+cNSJHkqgJIHGuI7Rcw4gfLk=;
        b=Z/SzVAuvFIbkiu4XdmnkcbPEaGceuS4oRdfLbC7xkQl0atZiKT/M6+w3Z3EkzuOenA
         /w5d4dEX0N/5I/iJU8UfDOHzd9WXOrLoJSXSrCtmC7dtWZrEW7AzLz/qPPnTjqkPmrBf
         7yqrc5498n14hGvFgs+pv8dZ+yU1lbv37TtDYQrmE0EXICTODJgAdFp04bZbsjkXcqHi
         0PbIXZ9pSHQ8aYg2ogBpeRnFoTUyl7SRLf5+u139G5KhA57Vg5EXaPd2jYl9yHSsdyI9
         XQ72ySMAw5sD+K5ZDtRGrY/3qWPcLSrj9QkcFAq/QbIZ66YNlDnGV09kqyTcsXc6+riq
         FD7w==
X-Forwarded-Encrypted: i=1; AJvYcCVvmaUse95din/IumFU1ROwD23ZuS5ETy7f6coYDSyZg0+ieHJQ9qLmvwHcV7sikVjayKZnqoDYa7wZWekw@vger.kernel.org
X-Gm-Message-State: AOJu0YygU13TIAYQe0aUQeS4SqAUfh4dz3dyx72cJ073S04LOyzmbF1G
	A5nHiph+cPOONxJ/QVVys372gzVUZ3OZlxwPMzrmiDD+S++DmlPI9C9ye4vF7KPgXzR6E/LM4sn
	2KiGP0EXK0EDYCkwxjOGG8HZZ6xYgtQVkY25jUapJ0Q98Vl7goDGhfdMEDJHzyV0cdYVX
X-Gm-Gg: ASbGnctd5N9vhKA2d6Xz3XSzMyecZFTSnmDlxr/waRRW7VL6B+llmjitkJg7KVZ9udK
	0qxxbRXrrxYJLqP8/faHB2kE060z7Kp/ME252FtlP+mMZwXhCFAbCdqtTKdY/pFBzvYZNELY5Nx
	aOakSib/9iK1n4eWsAGOjx+Gv12n4xuAxKMfht0HfBBnRXY7/GeDp+EZJNiM3FY/vR5JpDYXVaC
	COSNBbAfpn0tEiPH3hHKV/jsKlnU0vYJtSIWkJm4OBlbE455ddGCYHz4c9tVAvAQ/2ECUjWML5Z
	qCQwuvru0/XZrR+MwNsM3Skovkx3uZVXLc4MKrw0fl1o9kP/+wPeFHNY7cShPgFzuOf2O8c=
X-Received: by 2002:a17:90b:5788:b0:32d:dffc:7ad6 with SMTP id 98e67ed59e1d1-32ee3f8c588mr4286873a91.33.1758138463140;
        Wed, 17 Sep 2025 12:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjiteAoD9cK/bN/ETaRodNHrRIWIEDt3HvpK3XaXv5ZIiOHuqKosTaZcxNGnpqJN5t22Zbpg==
X-Received: by 2002:a17:90b:5788:b0:32d:dffc:7ad6 with SMTP id 98e67ed59e1d1-32ee3f8c588mr4286845a91.33.1758138462681;
        Wed, 17 Sep 2025 12:47:42 -0700 (PDT)
Received: from [10.216.40.15] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc24b4f6sm215021b3a.37.2025.09.17.12.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 12:47:42 -0700 (PDT)
Message-ID: <f420c40f-f2a5-4b64-8e89-dfc6db042edc@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 01:17:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 4/5] iio: adc: Add support for QCOM PMIC5 Gen3 ADC
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
 <20250826083657.4005727-5-jishnu.prakash@oss.qualcomm.com>
 <20250830184233.7ddf6ae8@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250830184233.7ddf6ae8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cb1060 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UEldCo81gXLG25mkEUsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vCqyMQeXjJFL9CPhnPfnsLEtVDIWRmSD
X-Proofpoint-ORIG-GUID: vCqyMQeXjJFL9CPhnPfnsLEtVDIWRmSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX3oUMqE6WX5BO
 A3KALrXunnbKX0pvNiHQR1ccM37j6zAEGU2JaDfpqpFZ0FH4Gj57JkhQ1kH624bDmRcOycg9APo
 TKPOpU+NP4dYThp5bsOTHjVauNg2/s4dnmp+BL2oYhYhhO03hKMi0W5cyVuRJ7CpMlzO/jBrX/a
 NE+VUgh9T3ovsuD4qG+EY/B0BncIomcWzkyexHjGmmZG0CzXxwwRu+fk+7B2WxoCuzl0kjAuVvc
 ah0wLRCEWe1r+UiiX4iTdO0zYqKdK8pmzDro/fOVo1nT3gP7739NFgEsu0sVacRRwmwEY5V2C52
 f/iTXB+wF1i0LrxgAACvnt6VCSqWs5MXVOdXQPejcNiJzqlMwdjUMGoN2FY87UYzqo/unU4oqw8
 vSLaBDx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

Hi Jonathan,

On 8/30/2025 11:12 PM, Jonathan Cameron wrote:
> On Tue, 26 Aug 2025 14:06:56 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> The ADC architecture on PMIC5 Gen3 is similar to that on PMIC5 Gen2,
>> with all SW communication to ADC going through PMK8550 which
>> communicates with other PMICs through PBS.
>>
>> One major difference is that the register interface used here is that
>> of an SDAM (Shared Direct Access Memory) peripheral present on PMK8550.
>> There may be more than one SDAM used for ADC5 Gen3 and each has eight
>> channels, which may be used for either immediate reads (same functionality
>> as previous PMIC5 and PMIC5 Gen2 ADC peripherals) or recurring measurements
>> (same as ADC_TM functionality).
>>
>> By convention, we reserve the first channel of the first SDAM for all
>> immediate reads and use the remaining channels across all SDAMs for
>> ADC_TM monitoring functionality.
>>
>> Add support for PMIC5 Gen3 ADC driver for immediate read functionality.
>> ADC_TM is implemented as an auxiliary thermal driver under this ADC
>> driver.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Hi Jishnu,
> 
> A few additional comments from a fresh read through.
> 
> Thanks,
> 
> Jonathan
> 

....

>> +
>> +static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
>> +					 struct adc5_channel_prop *prop,
>> +					 struct fwnode_handle *fwnode)
>> +{
>> +	const char *name = fwnode_get_name(fwnode);
>> +	const struct adc5_data *data = adc->data;
>> +	u32 chan, value, varr[2], sid = 0;
> 
> Why initialize sid?

I think this is not needed, I'll remove it.
I'll also address all your other comments in the next patch series.

Thanks,
Jishnu

> 
>> +	struct device *dev = adc->dev;
>> +	const char *channel_name;
>> +	int ret;
>> +
>> +	ret = fwnode_property_read_u32(fwnode, "reg", &chan);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "invalid channel number %s\n",
>> +				     name);
>> +
>> +	/*
>> +	 * Value read from "reg" is virtual channel number
>> +	 * virtual channel number = sid << 8 | channel number
>> +	 */
>> +	sid = FIELD_GET(ADC5_GEN3_VIRTUAL_SID_MASK, chan);
>> +	chan = FIELD_GET(ADC5_GEN3_CHANNEL_MASK, chan);
> 
>> +	return 0;
>> +}
> 


