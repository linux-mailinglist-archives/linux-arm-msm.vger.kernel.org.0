Return-Path: <linux-arm-msm+bounces-60299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A776ACEE48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 13:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5F383AAEA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 11:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E771DF96F;
	Thu,  5 Jun 2025 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdcGu/CB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31C20E031
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121516; cv=none; b=NIvZ6QFJ8be3jEqq0ZPSKNNrW/Z9TgchGUjK3dOhmfelWwT42Eia9GG+lviLQUCLZwhu1NY2gBilqTLC51OS+g0i5EAk55Cdq+NF0S9MfH2qq24RwHnbml9FhGzw6f2TSVp8LdnL/Co/0fxQyLtAxYiJquKPC6ZIz+lM9d5BPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121516; c=relaxed/simple;
	bh=QGcy4PCf14iO8z68kY2G5xylAlXiWoJ3PDxA6mUbSO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbIG+/DMNO4HGoo/iki6Z7L5vbUP+qsJpC9D5MZAWO5vFngIERZ4OV1lVsOinQCYio7aTuUT6ttYxu3eDazDXI2ld9S5rkMKvFtHc4VKkTwh+mLCL2D1aTOR/Q6i9NjiMwzgrVkwr2QifDY1v8Fr7reNbxnJGbytx0p9Hl7Rzbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdcGu/CB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55583MxE027554
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 11:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/Kn3I5vLaecKL1dyLCBIandYIQuLUSy6rng4HjLNWA=; b=pdcGu/CBJR6OVUOu
	XcwC4/akaQ6iCXHxKJdrCh1eKWbLWu9Bdp4aTO8YKrEL46Y9I30JmSiXSyP9TQ6r
	LJ7qMUanjh6z576Jjmh+n3eqeBp4Yyd0TcLFRHmNw0wQ1MpXjp2wrZoSpRh10EnN
	PXpwOBkTnYkJSUpmEAwnVNgiMRJNqed+Nm5xDLK8aEZfff2wLlDLdqIcbsFp4Chl
	SR1ojTXsOS5JWCqnylCGb9NRWzSH5CtyJDbbA3gDbr2fFriR6URudAT6Gq15MHTY
	dQqQC7d49je9bDo726C0LxQcWBLeBilYsFM6+GOZwAUdomQfwKUI37WerfmLV4BL
	BwuWMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t9128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:05:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-312436c2224so1299701a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 04:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749121512; x=1749726312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Kn3I5vLaecKL1dyLCBIandYIQuLUSy6rng4HjLNWA=;
        b=UCLEvCt4l3z4qAFti4lCyXu7w4et0LsS+NvgemEHLnp+JjTUjBHcOzFwx9d+PG1l/1
         aXZPM3WyEfYF/T1qvtf+DySYbnxHS+5hEAH8N3CM79/QTjHnX/LzNwDeRDqZzIUio8/t
         PhrINsX6yPwJZr20DIXs8RkNmmwg3eYIa42M6wsIzWLm62Htjooiq89iID+EPdteX1dd
         7alHvvdrXfoBlsjkVD+lNMPd2zcM9wzVHvzfr/y34aEBtIRcrVxBKft1l256RqKvlpZ2
         EjPjv+EOpYm8L/c83gpU/a+7F1WVPIAx+bG9onzdLelXHE1jzNwhcm5vnyGYqo4IPlYf
         pzHg==
X-Forwarded-Encrypted: i=1; AJvYcCXHFM6H3MyHuz/2cT6rj9E9T0IvXaaeCX8vvKPoX/MlO17KbR1Y0PXQjaPupkWXIBDvnO1KXiuA46HRhC64@vger.kernel.org
X-Gm-Message-State: AOJu0YwD74x10G0RO4WYHCWs9Xugit4a7MRNbtze3XBbYLkhcv/sDYRM
	QLsnk+G8nJAzSiwILcOVjs8LKzwCdX5ogcHkOV4jOn+8wMvloMzuvOQ3jN85JpY9+uVL+D5UBGv
	0ubJxjZUt34U6S8O7Vu+es2rAQAma8XY8NQuTzOdzkVklHNb7f3crYag878TUwEi/XQRh
X-Gm-Gg: ASbGncsULmu5SlrygpGp1eltfyMXf3n0r22vMQYv1i4oTWkcgRI+nnZ1cQ3LrjwxHJ6
	s3EiABIvW9EpYhu9dWjJi+UVH6eR4UOkBk+DWAcyxU00gQOFCgknv6JWiUmjcYPrwwCgCTE+WaX
	SJ8Gqu85qVhuvsBVzPcpO8AfWofHIXs5B5H4ziv90ulHQcM62OfWRNlx0AJSWDYBy6lXCybyy7Z
	PJBWm5fDInVfPxBjqz/4sgbv9EF3SyeTejCT/iXXeXhpEBfBUEhqsM1rAK7WHGG40BTvQHkuSZW
	ZjDFgOm0LVmvCC0vRPyeFHsBOxWVJemSqMb8
X-Received: by 2002:a17:90b:274b:b0:312:e90b:419c with SMTP id 98e67ed59e1d1-3130cdad77amr8515209a91.26.1749121512164;
        Thu, 05 Jun 2025 04:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9ZdFHjU4JKAnM/tS4qmA1xTR8K+XgsL9Ex/2U/2L3STdnOSXDIbVh/uVxZTjZjTNU4fEbUA==
X-Received: by 2002:a17:90b:274b:b0:312:e90b:419c with SMTP id 98e67ed59e1d1-3130cdad77amr8515174a91.26.1749121511749;
        Thu, 05 Jun 2025 04:05:11 -0700 (PDT)
Received: from [10.218.34.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313319020e0sm1048255a91.12.2025.06.05.04.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 04:05:11 -0700 (PDT)
Message-ID: <9f2895b8-0a02-44f7-baa6-2afc7e29c1d6@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 16:35:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-2-b4b7dae072dc@oss.qualcomm.com>
 <6ldwvqqhk4lndesk7oac4ly2vhdxyd57f5hhijvutik5gm2czu@vmkasgeg2tmm>
 <4f7168d9-8d8e-4fdf-8917-47c1cc71cf82@oss.qualcomm.com>
 <tqmugtxmauwo5o3lqilb3q5czpyl6uvs4wjcmq6pthni6eq7ky@ndzn6ovhnzdq>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <tqmugtxmauwo5o3lqilb3q5czpyl6uvs4wjcmq6pthni6eq7ky@ndzn6ovhnzdq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=684179e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yF8Cob9C1mgRsRXKOc8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: pSxUdtMUYai8-vIW6KpjHYBBFQD5gLBA
X-Proofpoint-GUID: pSxUdtMUYai8-vIW6KpjHYBBFQD5gLBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA5NiBTYWx0ZWRfX3cvv4GmI4Dpc
 fUx5VXHDUB4MKWAFcnJb8CKbdInpS7hcFDoxr+VeLznHnuMMvbEza2EFFkNIZyLOxlqJSXjMwa8
 iue2MjS3dvFOIszV2hgRavQs7ZyxYeqV2TvipwPrWQmxJYrQZIi+MlPhtppz7vuTemu6OW4wsxo
 QYoMNVEpA/8d3iNGvf2M4LdhaealiHnlZpbr+jhi6iVvf1j9ElnhaqAIXMSApY2CjFGYRbp7ejN
 96F/bGaTlzWH7D9MBBiC85qAIiXTpadxSoh7qVz958DzJog/SDHX1mz62noQ1dL29VnHLxyYxYM
 z3HYX3HRAVDlqAML99pDQPxLOvKBYRWHs0U8pmoIKaQZbvUmesR9MlLLJTw+SN0qQ/C3M80C+i6
 5e6tdx2h2uVIqfxxhEA8Gp1+RuIlQSGtKa809LPuWUBiLfGbuI2eiOx0cDej6u5bbiRqRmGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050096



On 5/31/2025 2:19 AM, Dmitry Baryshkov wrote:
> On Thu, May 29, 2025 at 09:07:49PM +0200, Konrad Dybcio wrote:
>> On 5/28/25 1:02 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 28, 2025 at 02:51:32PM +0530, Maulik Shah wrote:
>>>> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
>>>> ddr stats. The duration field of ddr stats will get populated only if QMP
>>>> command is sent.
>>>>
>>>> Add support to send ddr stats freqsync QMP command.
>>>>
>>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>> ---
>>>>  drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 33 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>>>> index 33fd2a1574464768bd07289e743fbb79ba415e84..0545c8cbefb8f18758d4eb51638e4ecb94e05422 100644
>>>> --- a/drivers/soc/qcom/qcom_stats.c
>>>> +++ b/drivers/soc/qcom/qcom_stats.c
>>>> @@ -13,6 +13,7 @@
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/seq_file.h>
>>>>  
>>>> +#include <linux/soc/qcom/qcom_aoss.h>
>>>>  #include <linux/soc/qcom/smem.h>
>>>>  #include <clocksource/arm_arch_timer.h>
>>>>  
>>>> @@ -37,6 +38,8 @@
>>>>  #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
>>>>  #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
>>>>  
>>>> +static struct qmp *qcom_stats_qmp;
>>>> +
>>>>  struct subsystem_data {
>>>>  	const char *name;
>>>>  	u32 smem_item;
>>>> @@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>>>>  	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>>>>  	void __iomem *reg = (void __iomem *)s->private;
>>>>  	u32 entry_count;
>>>> -	int i;
>>>> +	int i, ret;
>>>>  
>>>>  	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>>>>  	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>>>>  		return -EINVAL;
>>>>  
>>>> +	if (qcom_stats_qmp) {
>>>> +		/*
>>>> +		 * Recent SoCs (SM8450 onwards) do not have duration field
>>>> +		 * populated from boot up onwards for both DDR LPM Stats
>>>> +		 * and DDR Frequency Stats.
>>>> +		 *
>>>> +		 * Send QMP message to Always on processor which will
>>>> +		 * populate duration field into MSG RAM area.
>>>> +		 *
>>>> +		 * Sent every time to read latest data.
>>>> +		 */
>>>> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>>  	reg += DDR_STATS_ENTRY_START_ADDR;
>>>>  	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
>>>>  
>>>> @@ -304,6 +323,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>>>  
>>>>  	for (i = 0; i < config->num_records; i++)
>>>>  		d[i].appended_stats_avail = config->appended_stats_avail;
>>>> +	/*
>>>> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
>>>> +	 * The prior SoCs do not need QMP handle as the required stats are already present
>>>> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
>>>> +	 */
>>>> +	qcom_stats_qmp = qmp_get(&pdev->dev);
>>>> +	if (IS_ERR(qcom_stats_qmp)) {
>>>> +		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
>>>> +			return -EPROBE_DEFER;
>>>> +
>>>> +		/* We assume any other error means it's not defined/needed */
>>>> +		qcom_stats_qmp = NULL;
>>>
>>> I still think that we shouldn't be ignoring actual errors here. I'd say,
>>> check for of_property_present(dev->of_node, "qcom,qmp") before.
>>
>> /**
>>  * qmp_get() - get a qmp handle from a device
>>  * @dev: client device pointer
>>  *
>>  * Return: handle to qmp device on success, ERR_PTR() on failure
>>  */
>> struct qmp *qmp_get(struct device *dev)
>> {
>>         struct platform_device *pdev;
>>         struct device_node *np;
>>         struct qmp *qmp;
>>
>>         if (!dev || !dev->of_node)
>>                 return ERR_PTR(-EINVAL);
>>
>>         np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
>>         if (!np)
>>                 return ERR_PTR(-ENODEV);
> 
> So, I'd say, we need to identify whether it is this caluse or another
> error. It should be enough to ignore ENODEV and return an error in all
> other cases.
> 

I will update in v5 to check of_property_present(dev->of_node, "qcom,qmp") and then
return error accordingly.

Thanks,
Maulik

>>
>>         pdev = of_find_device_by_node(np);
>>         of_node_put(np);
>>         if (!pdev)
>>                 return ERR_PTR(-EINVAL);
>>
>>         qmp = platform_get_drvdata(pdev);
>>
>>         if (!qmp) {
>>                 put_device(&pdev->dev);
>>                 return ERR_PTR(-EPROBE_DEFER);
>>         }
>>         return qmp;
>> }
>> EXPORT_SYMBOL_GPL(qmp_get);
>>
>>
>> Konrad
> 

