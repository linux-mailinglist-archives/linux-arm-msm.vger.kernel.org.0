Return-Path: <linux-arm-msm+bounces-87054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E35CEB49D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 06:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 820DD300C2AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290422264D5;
	Wed, 31 Dec 2025 05:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFDB9Lg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dESFXPk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC831146588
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767158489; cv=none; b=sK+dYhil6Zm/Uyz+HBb6yYqv1wA7Q/sa8yc09tyAVcZ1WsAvXJCHY1/wYkp8X0C/Uq9UTipmRREoUBZCDaIV6aezMkad1Ik9Y4R9d9twQp/d5EUs1DMPkR4UOEVf2BbjQTUagutH3tM0l4lx89zuhoImfE6iJL6PtA186DeKjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767158489; c=relaxed/simple;
	bh=C59d0cHiQuyMYVgonbFwY2AQB+BF/A41SjVMjxWd0FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLaK8bplHB6p4ZXvrsxHhfnuhtR/PBGH2/H/UFAIt/YCSxLiDbxQI2b7Kbv+hfcMtkodDqBYUouJtnu1P9vpy2iU2WzQbCs7Fmw7B4DSx0l17TA34hcXZdeNc5VhL/J1C93t0Hm7nNUqxI/JEiB6PAqG9MvPrKNlAQwjtpln+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFDB9Lg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dESFXPk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUEieoj3540739
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTnk4yNxfLCslr/XEf61/nE4ardUvqgfaABMv6yI1xo=; b=RFDB9Lg3Coqj9X6w
	tVLwM79j6lFYjY++KrTkzupwNyDrm7SLtkt9/Y0QQFa39fXLq8Ov72E61y8xBt/C
	j7Py4STjHzKpIOIpvVRHXnbB+NMwFPGPi6WIyKHQ686CIhg1Nx4CjHA/OfIV7qJb
	ouCrGKmIcxSPM1oaYY+A8ssrH5ER8t4B/NTmPduTzf/QLtBcnfxXdG5745dwh+pw
	1n+3cUKIS6mt+m6drCoSonmyePMavHhFDzZgD1aEfsm2FcOmtmM/EXqaWG1p3Nz1
	w7vRMIQ05Rpun0eMeY84HkGrhakc91IuWUF/Oaa/2LumpWkfhpFr201it53o4Fo0
	Abtxgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yjtba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:21:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so116383735ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 21:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767158486; x=1767763286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTnk4yNxfLCslr/XEf61/nE4ardUvqgfaABMv6yI1xo=;
        b=dESFXPk9J3pFFXTMduSfxiWJl3zvpzmVueyT8dE5Inm/xMJ3r0Ro3UaE4U5esKNuii
         uqYnxma0yy7qDt26ennSmm1yDIw35lvuhKrBWNfTVEFuZSLpDgVY3BtfmeWxzKcAFS1h
         jLqnK0qtkutBEnVssSkxsGOiLpE/W9EE7KmQfvQhNsAb4fGu7n9MCIIRbzB7z5fDTzsT
         CuuIz+Xtc/VTv0EtVvPVs25Uk2Uf0911biBY6cYu9/4oByXzRBZJQVsKUttxjxGcbFoA
         5a/63veawJ6BL/hbeAfYVwxPjNA933NvmgXK61P8p1hX6hewnbPeYWpwIL9hF0+jxByU
         1fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767158486; x=1767763286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTnk4yNxfLCslr/XEf61/nE4ardUvqgfaABMv6yI1xo=;
        b=BuDNLTYorRjBpPUIrOd0+g90oa0gqW49x+p2cbRgGyhOhi6k1bi0MB4SScAxfX3Wsc
         q42OUqB+5t1mi7TpjIqQnP2QIp2J8jdBqv5bxpdGvFGruppM3PaKPA+MHvMe1lfAMK6J
         tYnUou6xWOxS+JjUEdfu9kKUZSPRRl2GA6WI7R3qAy13X3H16ZWWRrY32LyJxWK14R6j
         xiqfubYpYIDidyxVqaCaakUtOvcvaLHWN3/MLH19xioO76gtuM2oO05BK2O0ptfaMWS+
         o3Uj96p9wBRdrUV2Ql1OqG/hOe8KkqBtcJLe0+n+KoGLsu8I8CE80EJnN4B/Pbv9CzSe
         rJCg==
X-Forwarded-Encrypted: i=1; AJvYcCV9kj2Kn+N9Eoxq4ulMx7s+gc/CLVsur7fIA9C7ns1hDnAKEymvNneerIkg7CfxCCfFwRNfhs6+I5HghtAS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wb8M2Ixi4+FKhYHRAORl/ioPqxtsRR7+nbpBJkqdvt/1cV98
	7s3eX80Pi2sQ6GeMyjArnRp77GTQggerMhps4tGBQW9LhbvpQtc5Ci1WB24PVjTvJho3SwaxLfY
	Q9a8EAXLIo97f0ZrDx4mQPXNEvPs0A5c4+eGIQ2JinRTX8vU/CaNEUeOxwvI6jwPGzLzt
X-Gm-Gg: AY/fxX4NOg6GsqSQ0HuYQjLsjxiMrN4efDiJIkdYBzIJIHnVfaagN4Aagpe89Dy2+gh
	+giSWVPzwDBCofyLtlyA0t4m/JHmurqM/f+oDviYC8SrbrxRoZ1k1u7+NJqV28+E9LlmntvtaFg
	/cb+Uu+ecr8KfWe8ex7GlM5Vv6qaasD+dXGT51jGCYkh7/5edHQONDHVHtNBCZotYXYjeB5wSfN
	Cn2x4AzYc//6dQwVPDJAYKgK4xUEMO66kKFhyXKA4gyWw8dcqYZw4EQ31DRqVB/aFS6k/or2eGW
	yzx0KOF1HxFxOOV8OV8PYAoT1YuwMz9B+mlji00rO/Xng/IGg0OEV2bYSuHvIuCce6Nsd2N0MJI
	mkhjXfMUM4olnzEoAJd+/Gv9w5wPD04zaUIHUK98a3xHBa36g
X-Received: by 2002:a17:902:e785:b0:2a0:93e7:eba with SMTP id d9443c01a7336-2a2f0d5fea4mr367072645ad.30.1767158486123;
        Tue, 30 Dec 2025 21:21:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsNWLFpGmIh7xaj+7gGE2rbU1JiWJYY8msh+oAs8CRyrxa25KoW3F+q+se9o15kVuh8cxnSg==
X-Received: by 2002:a17:902:e785:b0:2a0:93e7:eba with SMTP id d9443c01a7336-2a2f0d5fea4mr367072465ad.30.1767158485671;
        Tue, 30 Dec 2025 21:21:25 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c828e6sm311409105ad.24.2025.12.30.21.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 21:21:25 -0800 (PST)
Message-ID: <321d7546-f4ed-42db-8ef5-143ed9bba0ec@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 10:51:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pd-mapper: Add support for SA8775P and
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <ner3vjn437b2vz6zd6qwymkudio2rvmwhjfqxwsp7jkrgv7ouh@fkihfk77tsvv>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ner3vjn437b2vz6zd6qwymkudio2rvmwhjfqxwsp7jkrgv7ouh@fkihfk77tsvv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6954b2d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s_8R-ICqFYl_el3g6jwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: i-Utfhlj9a3oKKxEJA6V0ts31zTeDgZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA0NCBTYWx0ZWRfX2lrVxbVTsjZk
 RTvHi8Vf+kC9ccdT7ZxFSm0ig3bJQkVdhwEUBEpOkPaXW2aFBLCQOmbBO3GH34NXUc69/ep1p1S
 3eTInPZ1aEMoSBktak/J0yDfau3gf+NqI9s8NvnhTL8BWI9FDpThF4syn/uSg12+07u/kGVpBW4
 a1Fel3vUH7hypkLmOGByNBfaA5qQGHC0OOqhv4Kimc1ctDYvjEGA6I+/a+byuuz7XjJTiBHnd3R
 zQGeMVZ8S7+eyYud5gbZJuujWv+H0qH5EgsTAigvc55QbGbgg5p5hItj4cuJObVn7px9c35+VxR
 i+KDz2r98TwhZQlGE25mK6wE35aPPFIVmGISV76+LiL64xThgsaH+Bpmion12JBRZySZLjGxS2u
 7s1iPOnKXiY34YcfRRow9/OCN0Ww89chWwDtYsztlwyBj1VR275s2bKJDjZOxuFpK5+wmd8XjHv
 m5ZiEdtFBaN2Ri2NwrA==
X-Proofpoint-GUID: i-Utfhlj9a3oKKxEJA6V0ts31zTeDgZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310044



On 12/30/2025 5:49 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 03:55:08PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for the Qualcomm SA8775P and QCS8300 SoC to the
>> protection domain mapper. SA8775P and QCS8300 shares the same
>> protection domain configuration as SM8550, except charger_pd and
>> mpss_pd.
>>
>> Add an entry to the kernel, to avoid the need for userspace to provide
>> this service.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>> index 1bcbe69688d2..82a923d41914 100644
>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>> @@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>   	NULL,
>>   };
>>   
>> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
>> +	&adsp_audio_pd,
>> +	&adsp_root_pd,
>> +	&adsp_sensor_pd,
>> +	&cdsp_root_pd,
> 
> Missing GPDSP domains
> 

ACK,

Thank you for highlighting this.

will make sure to address it in the next revision.

Best Regards,
Rafi.

>> +	NULL,
>> +};
>> +
>>   static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>>   	&adsp_audio_pd,
>>   	&adsp_root_pd_pdr,
>> @@ -572,6 +580,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>>   	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>>   	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
>> +	{ .compatible = "qcom,qcs8300", .data = sa8775p_domains, },
>> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>>   	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>>   	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
>> -- 
>> 2.34.1
>>
> 


