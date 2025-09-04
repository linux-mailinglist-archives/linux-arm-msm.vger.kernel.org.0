Return-Path: <linux-arm-msm+bounces-71956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD37B42E5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 02:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CC845E82F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 00:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DAF1411DE;
	Thu,  4 Sep 2025 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LM9zTdKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4303D3BBF2
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 00:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756946887; cv=none; b=dr+0kIR7fvJcU8KEXqTY2hECeB4cvhLX9t77zYLQv/8awE+yLSeeTL+qmnhUuhWUZepFlpT8Njt7kbHhRUqDI7oHc9+mJfwwTTe3mmygK4pdPOzWud8IMcGEotkhFHvOOilcgHKUrCuOMseOmtd0Y281CRU9GJJsECana6ou1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756946887; c=relaxed/simple;
	bh=BZFnYqIYnYRUuOmS6pUYWVjxM+pjh2uog5aaF9XntgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxD3uIMdwvAqxIQzjpZYqOfUDWNu/WUlPdacc9RtJo5eMs3Bo2sc35wxJAnAxddkFs3NXwFjRdmL/kZIWFstJ6V49H8cBkukSZPigqgxkRHdwMydUnfW5SqpqyMQ4V7kR4VcJdLmweng5imW0/9Ytc3aNOsB5iQaFRbbw39N/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LM9zTdKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840WCj2032507
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 00:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17s2MHhHmT5kNo+75PHQcfHsB0zgEcKrR7cg9CRVNlE=; b=LM9zTdKbue5Z6EDq
	tG/ztLKWWIwSlbttSMR8hW1e9f/LH2aBDqhmoXhV/T3Qtjb3PyXZNCHBmb50Wh6Y
	+4wwqerrTc/ReU701qKExxk+W90R4P+R6pKAOahRJObsmGsAKj+4XO6caspCKKB0
	7E2/rMltGZMcIlfTMYO/bijQfj/WfWIffKHGwt/kPBWLvuaQCYA4siZapL2B+ena
	eUnTUL2g+WtYLrwggiA0ER4sOHWVOreWXuho87UqELBqdZyvg7FKFxuZMHT3Uc7b
	BY1P61lAChDTd6C23/9Q6aZRpER5nuSecO5s4rtDdzxagdXzKREra1wNDr+a7o4X
	dPSuAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush35hrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:48:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ca417fb41so5691215ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 17:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946884; x=1757551684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17s2MHhHmT5kNo+75PHQcfHsB0zgEcKrR7cg9CRVNlE=;
        b=pzPDnvmy+Gomr+fK8VwVIlTOcWooILfu3AGd2RdEv2yAcs81XHxs9I5Y+1XEj4Xwfs
         +YDcvJerTpl4IaKgocgS/zfiLBQYv2n8ZF1NxecyyvI3xzY8CatE83zVvesspx/HFq0e
         BSk7iQKJR3vPyBR7vHlEUrhQljBjLRKbMJUEFSbcVVMpMfhWdDTZzgvLQMA1umsAgwpF
         QE7ZXuoG1mTBCLsNv5ujJtXTPe12vV9D51trRx6GqQqp/77V5JcfUKPXvSqrbfQXX2Ff
         cjinaxT40G9Ld0Rbzkz2HF+hKqRdxgHRcC2yMV4FSgfkvkWJjWHecEiROkqPr5ViPKVb
         Kh5Q==
X-Gm-Message-State: AOJu0YziPcaWpMRM403spt6YSgp6q16hP7SM1o6MaguX/RLL5pVBZBYN
	kuRX8DUklgQM1P186MpWNnCB2KvoYObXFbVqf45oHCQzBUzD/iI5wv0IOvkh36N622pMXx3kYiz
	1SNDj43nXPw98uGyamO9c9aFkJpWjBRwMAzrodAdJvebItoFuetdqJIC9AFAbNRV5nC1w
X-Gm-Gg: ASbGncvzOlZJtnvYwSYC8O3m5T451nGz/G99jBKhuj0cc0vxwc2uNPbm+MFxCuqAF1G
	U1UyxixPBZetA/3KPHmMeehI0JwMgDa9YsnyhC0fT7sJq2l/s4feDNMjk7ufRc7wmCdcvXgZ5XK
	5QUjJGj47gvagiqia/cuS5bF/pweybsx7uFo+uRb9zgtksqiUMxVFYkrKMu4xvfXpEWYAkT6KYY
	T010AHbZPmsd5Dfak6RVBzMhf6BudSuwbeT7y5QW5KIV0ZC9wjVw1f+uM/xZXzvRsfS3ZIp7Nj2
	sOdruzVD6qMx0NjGh4LLSeB9rUU44bfrutOYX03Go22A35LERSXmvpV7bUGWh9JY1ICYsBALMdr
	ILfAmBjiflaGlc2m//jGh+EOo4pbG
X-Received: by 2002:a17:903:388c:b0:249:33db:34b with SMTP id d9443c01a7336-24944b3fa5amr207542365ad.42.1756946884316;
        Wed, 03 Sep 2025 17:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxb9Q6ymf/7LlpnATnajz4oPJxLQ/auiRISza8RTn4ZuddVk1oudIFgSFwT0ws67aSUTyLJg==
X-Received: by 2002:a17:903:388c:b0:249:33db:34b with SMTP id d9443c01a7336-24944b3fa5amr207541965ad.42.1756946883807;
        Wed, 03 Sep 2025 17:48:03 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9304b790sm29195915ad.67.2025.09.03.17.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 17:48:03 -0700 (PDT)
Message-ID: <2b36c742-f517-4685-950c-696a34bc9c1e@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 08:47:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
 <4a28c9ea-fe71-44de-ada9-eda3111eff9e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <4a28c9ea-fe71-44de-ada9-eda3111eff9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX11ex47KBweXu
 4X7ZM4i7XcZx08MBzINR7Pe6bJgPiutOit0WkSVs1gmxycUtdmqulDHUSixnFcrhrpho0VN8Hkq
 96bgMfe9yKr5cNnPpqRcNxcp4eKnfuJnQVDlOhcL5ro8dcR5Y2+vZmsvz5hNUcGtDZe47iz+gz3
 V6/nA653ryH5rJdEiSFblQJsM0ERCbRDdZteUPRpj3FfXb0u997A+cSs5qbVwfz6MxtZIZzdqno
 zd/MjuNPU6iOoge/z78kc+VM9WF66FpaSGVm3XnZkRSOStsOx/TQBhG0XyeJemmlpL2CDM1SadV
 arSmDA32cc2r/8jGvG+wma45pMLhHpF3fFy/65ADnoPSx6XEjFNql0djLHePJF5zywGLESuTyJc
 P/z+JqLe
X-Proofpoint-ORIG-GUID: 4UTPqIH1vTZcFPSRFpxnsqdrb7vkeFI8
X-Proofpoint-GUID: 4UTPqIH1vTZcFPSRFpxnsqdrb7vkeFI8
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b8e1c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uvk-ifDgNjwOAWHDOfAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 9/3/2025 7:06 PM, Konrad Dybcio wrote:
> On 8/22/25 12:30 PM, Jie Gan wrote:
>> The static TPDM function as a dummy source, however, it is essential
>> to enable the port connected to the TPDA and configure the element size.
>> Without this, the TPDA cannot correctly receive trace data from the
>> static TPDM. Since the static TPDM does not require MMIO mapping to
>> access its registers, a clock controller is not mandatory for its
>> operation.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 148 ++++++++++++++-----
>>   drivers/hwtracing/coresight/coresight-tpdm.h |   8 +
>>   3 files changed, 131 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..4e93fa5bace4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>>   	int rc = -EINVAL;
>>   	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>>   
>> +	if (coresight_is_static_tpdm(csdev)) {
>> +		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +					      "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> +		rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +					       "qcom,cmb-element-bits", &drvdata->cmb_esize);
> 
> This allows either pass/pass or fail/pass combinations to succeed
> - is this intended?

Yes. For static TPDM, we cannot read related registers to confirm which 
types it supported, just depend on the element-bits property which 
defined in DT.

So we treat either pass/pass or fail/pass(pass/fail) as succeed.

Thanks,
Jie

> 
> Konrad


