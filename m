Return-Path: <linux-arm-msm+bounces-62222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB1AE667A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BE637B255E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8977F2D1926;
	Tue, 24 Jun 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpYPKUN3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2602D027F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771742; cv=none; b=rjhjrQLs0DUT4wcbbzb1DCIcq5NYWp9Z8WPsZN0N+mbm44cbr1sPfX8+yXDpALgRuPj9SrXRuH6YULcFaMh/fEwU2UnUWGRGxGbJMRmk3taH4OFzluLIwMFtDveKYUMBsc8PMtlf9eI3d896wltMkV3JsGTwcDk2fWHuimDU/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771742; c=relaxed/simple;
	bh=Kq2queKYiWK77xeA7BlasqdaXnXERjuMkIMarM++d/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5KAlfCFRdbfqnNONjCtAWx8/9RLT7C90uXx9I4ixZVeLq+ggtJd4I9dplsd2BfxzrXoZ5ikOFJFVHaKTiRCPkF8YiK+f5pYeh57sjmDHVDHbBzJWBc6fPZUAm06n7ozd7FklDItsC6dK4LQ9X0SIAmdI13I/hOwCPBRu5Ey9ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpYPKUN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7Ucxb026740
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPEA4wWOBi3YOtgcaFrbSGcrL6j9MPJBC/grGvjBzWA=; b=kpYPKUN3znQtt8K9
	z1hmTSKeR/6a4fmLW8ZxbnVJlYM9gjSq0k/3shIZ/0s4iE9EX5R5BmLUVyk+sePk
	Jafd3n6sbLkzKt8Nkpw7bg1R97E2gUaJuynxU4vEUYZfaM32yPbhj4lAxKu2L0Tq
	7//1HAaGx/IHTf+OkttAr++DQt6VZ+5YCbh+cDt9y+OqGyG1YxAf2eJc6YaIhIh0
	klG9FD9tMt4bwtTQUt7MlY1cG0zQ7xDNquyHa/72MgqGOfdNPUb8h92BZa5J9YNi
	CgNXV+wRfhUuE3LZAnOYEAEmFnpd+y7mVdb3yEjj5LMplwfQz1UFTg5hTSWI72JX
	6YH0xg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqjqnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:28:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2354ba59eb6so82952085ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771737; x=1751376537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPEA4wWOBi3YOtgcaFrbSGcrL6j9MPJBC/grGvjBzWA=;
        b=ZKOpSujoqA58/CN4550dwGFUUtGpeT426Dr/LGNxSlRmCzXHHKDbRrKeJYyXZjAsrA
         cJQPoW2XI+H7D1n4lTnTFYxxDAKXoIeEANJmqD7YPoLRyynxnTzVlXq0LisgHuSnbgv1
         0Q3PZWDW3KDnBTqZHB2YDbLzv6XJXkmE2Qv65nnNW7TKSdGNW4wLAMCLta6BkhVQAzfz
         en3tiJGj8SJU/6fgnQYqWEF3eiiLYpvg2CDLPkxCODd8tU5kYu3yus4Z9ZIJFUPED3Zv
         eWzFUwZYtYeFmo+bfkYt3L1EZsOEGrTO7Y/CM2Ht7l5vIDl5chzMax+4Qw148ItE8MWN
         uquw==
X-Forwarded-Encrypted: i=1; AJvYcCWwAho+0zFDPU8IQeKZ+/E3Pxk0BM+n465EFfU1qhHY9t/CTNO8U2/AEz7MuIswwkcaWqnLZHm+nb6cNwE2@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSmDtJlJHY7euQZv8MLoTN93Q2dQCTtcB9PLfz9YKLlz44h4e
	fiAELgmFOdJDjFH75eU+NuYLnd91HIUhh0BRMqos5Sjfv03kBwpA/aLTCk7rCJI5olhBxsnZrEu
	3NYEqotfw2mMf7vokl4ratDLQueiqq5Ui124Kq4WzsBvcMqO1KxKT6y9uIIBZnd1z1zSD
X-Gm-Gg: ASbGncs+aZW9Uw92IlzNaIVylQfVrRlGLSsfRMdmn1mY5Mk/XeEI16kpthiB35P96Kp
	yoZ55vJZW73b6VzFa04Vkqk39q1rPWBxEOWugc0Rs8bd89iVO5Got103esJWdMTTwaNWLeshfZ2
	Id0dv7lnjcAFRDAdEPg8hKqEnqw1KLTSnCZfkmdP11D1IdNQajLx39Ncthenx/GEwuOwPov/0Jj
	pMJpNyinVl1rlLmACxLQ9RW/GhUYpb1T16l1NeKB3U9CvgnVL9LB6MdeTYU79ZqO8LXB8kW6ZYP
	UGx/TW0m6SaVeUqSsyKWLdrsU7mlOU1GEWgVpc7duyR3EVJjwFU=
X-Received: by 2002:a17:90a:d888:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-3159d8c41a8mr22338322a91.22.1750771737058;
        Tue, 24 Jun 2025 06:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBuLhxpe1LePkqlXex3v+gwLfmUkPle+4L0M+QPnAqLvByeLjot0QMO16fa1+0SFfLZT8AbA==
X-Received: by 2002:a17:90a:d888:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-3159d8c41a8mr22338273a91.22.1750771736450;
        Tue, 24 Jun 2025 06:28:56 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e0483desm10686245a91.32.2025.06.24.06.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:28:56 -0700 (PDT)
Message-ID: <b453e9c1-c87d-457b-8ee8-4b82a6417385@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 18:58:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzysztof.kozlowski@linaro.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, agross@kernel.org, andersson@kernel.org,
        lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        quic_kamalw@quicinc.com, rui.zhang@intel.com, lukasz.luba@arm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        quic_skakitap@quicinc.com, neil.armstrong@linaro.org,
        stephan.gerhold@linaro.org
References: <20250509110959.3384306-1-jishnu.prakash@oss.qualcomm.com>
 <20250509110959.3384306-6-jishnu.prakash@oss.qualcomm.com>
 <20250511141120.58941a45@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250511141120.58941a45@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tjutDmEms5hnZMvi6Xx_gIqGFPkTzM9s
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685aa81a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f4knV5qyKpdAkpOjOqoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tjutDmEms5hnZMvi6Xx_gIqGFPkTzM9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX5JzaBwpx1x93
 SZ3g7wL/3LH1V8w4d1raSPMCkHw/XdgAagkqG/De06CpmGKzc8PakJalbsUXPyyF3YiatVf/18d
 ac6PljOPkfWEnR18qBraBv15FybPNLBsTrPChbzeSJ/PQQIV50IgSa7WimW927/yazGAL/fSCqN
 GDW0+A+ILwipcdhc6tVKWbDZvOST7DoD39nmzWMN6b+IntlvWCGqJomYSBYlmywnDEGSW9r+Zkf
 kbHpvTTgsT/VVpRO5VwKf1FL7F6RBwtGCcZP+PMtcyGP+CeSBeUzXzEoBz6AxYTiZCs+Axq7Mg+
 Q5PNNytRdUcg6akdHEhcKNnNN8+jqV4X/hx751fdkY/ShMrSWfepCBRcz7xCvNR7W4m3apknx4W
 dV14scAiCE8jUC9ctUhhc3xlFJETAZWwvjCw6XfoXDrcnZT/j4qbGO30oCeaBXQcSwJza9A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=864 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240113

Hi Jonathan,

On 5/11/2025 6:41 PM, Jonathan Cameron wrote:
> On Fri,  9 May 2025 16:39:59 +0530
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
> A few minor things inline.
> 
> Jonathan
> 
>> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
>> new file mode 100644
>> index 000000000000..c63822635f10
>> --- /dev/null
>> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> 
>> +static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
>> +{
>> +	unsigned int i, channel;
>> +	struct thermal_zone_device *tzd;
>> +
>> +	for (i = 0; i < adc_tm5->nchannels; i++) {
>> +		channel = V_CHAN(adc_tm5->chan_props[i].common_props);
>> +		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
>> +						    &adc_tm5->chan_props[i],
>> +						    &adc_tm_ops);
>> +
>> +		if (IS_ERR(tzd)) {
>> +			if (PTR_ERR(tzd) == -ENODEV) {
>> +				dev_warn(adc_tm5->dev,
>> +					 "thermal sensor on channel %d is not used\n",
>> +					 channel);
>> +				continue;
>> +			}
>> +			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
>> +					     "Error registering TZ zone:%ld for channel:%d\n",
>> +					     PTR_ERR(tzd), channel);
>> +		}
>> +		adc_tm5->chan_props[i].tzd = tzd;
>> +		devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
> 
> Can fail so unusual not to see an error check.  Add a comment if intended.
>

I just added it this way initially as I saw it was called without an error check
following it in other places in the kernel. I'll add an error check. 
 
>> +	}
>> +	return 0;
>> +}
> 
>> +
>> +static int adc_tm5_probe(struct auxiliary_device *aux_dev,
>> +			 const struct auxiliary_device_id *id)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5;
>> +	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
>> +	struct device *dev = &aux_dev->dev;
>> +	int i, ret;
>> +
>> +	adc_tm5 = devm_kzalloc(&aux_dev->dev, sizeof(*adc_tm5), GFP_KERNEL);
> 

...

>> +	/*
>> +	 * This drvdata is only used in the function (adctm_event_handler)
>> +	 * called by parent ADC driver in case of TM violation on the first SDAM.
>> +	 */
>> +	auxiliary_set_drvdata(aux_dev, adc_tm5);
>> +
>> +	ret = devm_add_action(adc_tm5->dev, adc5_gen3_clear_work, adc_tm5);
> 
> I'd add a comment on what this is undoing as normally devm clean up matches
> something being started and there is no obvious sign of what that is here.

This is meant to cancel any existing instances of tm_handler_work scheduled
by a TM interrupt, at the time of module removal. I'll add a comment for it.

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = adc_tm5_register_tzd(adc_tm5);
> 
> return adc_tm5...
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
> 
>> +static int __init adctm5_init_module(void)
>> +{
>> +	return auxiliary_driver_register(&adctm5gen3_auxiliary_drv.adrv);
>> +}
>> +
>> +static void __exit adctm5_exit_module(void)
>> +{
>> +	auxiliary_driver_unregister(&adctm5gen3_auxiliary_drv.adrv);
>> +}
>> +
>> +module_init(adctm5_init_module);
>> +module_exit(adctm5_exit_module);
> 
> module_auxiliary_driver() not work for some reason?

Yes, it's because module_auxiliary_driver() relies on its input parameter
to create variable names for some of the function calls it does internally
and this goes wrong leading to compilation errors, if the input parameter
is more complex than a simple variable name.

I had described this issue earlier and you had agreed with me too, in this mail:
https://lore.kernel.org/all/20250301032901.7b38fed4@jic23-huawei/

I'll address your other comments in the next patch series.

Thanks,
Jishnu


> 
>> +
>> +MODULE_DESCRIPTION("SPMI PMIC Thermal Monitor ADC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("QCOM_SPMI_ADC5_GEN3");
> 


