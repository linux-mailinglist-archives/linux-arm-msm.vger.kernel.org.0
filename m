Return-Path: <linux-arm-msm+bounces-96195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INkCIrKgrmm2GwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:28:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD0237093
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DDB63011D70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F60B7081F;
	Mon,  9 Mar 2026 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0vgh6UK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i83/Sp1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A84D27E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052051; cv=none; b=Plsp4OLvRl7IC3z3biCFlLokXd4E9kagrtL+uoUlYcayaJ9f9HZHvcJLDovHwkV8b7mHCDzbTPjIVZ1LDlXFQ8kt37ZYtrJs5Q/mynDf2bZPRV4qPwAUl67rh5wol+1vbL4LxaXIt6IRQzqAbVdiPdqCWXaGB1NZliskF+/GW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052051; c=relaxed/simple;
	bh=GVeeBPNLhV4bOAsknwuE9zDZvWEMxTX122Nt5ouRBm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yf3Ui4CRajn394GbyPe7UxbuGUP+Ppc3I4Gw51cWE0mWrcWTgRBBKmMjAQm1rmuZ8iqsuEftt1wPytgtE/8FI66Zy25egFskcwdlIGIz9psN1QxPB0YMNJGA70mb6noOtrXK+P8GmCnCbmt8W5ua6bFldMOSvnhL8PXgwJ7ZZmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0vgh6UK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i83/Sp1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6iwG2195565
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=; b=p0vgh6UKCspttP+x
	fPE+azhQMsW98g8r8SH3nMipXPUPrcn28Rv/wBFjWLXqSJ/rcbr9W8EwYCkuG/kx
	G8pYsArPnq2snDQJFbHwtWnykC5neyIUQGA37ezii/s7MPdetOmZeOmhoBX4ohJs
	pVS5vKT4nhY+0iynALJSLHwVVGjWge5gUCiuRJ2EgMGb+ZzzEJysH5iLxg0j95n3
	3juPO17mrYozXBmCEyFzQ73qDldgGbXQ+7Ze3CIzf+KOWlklezzK/AIaltmZkeFv
	WYTG47FAicqNdh2fnEhAetMSZZGySfdCNOEeQ62jdR68/P/FHT4QnSiB8q6Enf/H
	EHCzUQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u824k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:27:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598007eb74so42794154a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773052047; x=1773656847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=;
        b=i83/Sp1l+8jd2wINpTX+86EEWW/onFRuLZpyp9W1b0lSsspN4weGhdBfIo7q4L9XSj
         X01kbjU0vXdseJLGB0V50LfvMIMvihL0bNuRxGpW6nVIC26YKPgu2Vr9JbbBfrXBzpt5
         aqPMmoCyDvpvEkcEx0/5Ls895z6I/h+Pw4BsUE9U7bYiRISgmKfZJKHHS7PIwTsKG8yB
         8sKBzTkfe5t5fbuRBmJoNGX5kzOFsruam9MnG/3LuWYbYg+RC+a9xBvUHjvvlCxXeDUt
         rMfVacjedYEqbD1goWL1E1yctzG09olfdKa6ps2Yh4OgGPN3Q7frb2mks2x2kUiyrfyd
         RyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052047; x=1773656847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=;
        b=tjZD7Or7PsqEWCD4/LXG+tsqCbcnNKgBo24M6qINYUTVVPJ8CKcb3Q3bDei+pNkd7I
         RHeNryLdn9Qji2DQ4VESHeSFi5yHFScqhs9q7ymncQFoYxL7IoBb7RRov3nEMBlnam/a
         Ixd655Barb7FXuqia+iwqRlhG6aTFZRUbJwloBJnzMUG75P4Klz97Ak2Tp7Ndq0ufDpE
         4tkxyag6vsWt2hjYGotMY6EMqkA8DVddg+DbcLzB+tVvLUxtzsp7LvapJ1uJoiwwFxOa
         EGWh7nzkchvBgn/uoL3+/AZVqQ6LI5sUoLiQsdNmTsMvhvtZswFiVuxqi5ReREIcMTWp
         nBOA==
X-Forwarded-Encrypted: i=1; AJvYcCX8zEXkQ4slVXLnqlf1Mes5aKXDIY7DHLMB+Ui2WmRAmLt4PWXYB7ZHIvdS5k7BYKP9VeFluEw7F5/5Aif3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FJlTbWj6z2uTNUGaAPkyAUNvUzHnhgzbvOLTa4WcRduFAmfc
	ahcVg86uYixAe1R9rY4s+2IYUov5C22UwCHLhfLxB6aF5+HMPFVXPCJ0NhqEc6QsoUxNtHqYxlP
	Td31vNWIdb3VkvZvkq12XyLAsKTxnoeWtq/drsDkmowif06QGshhfbL2gs9Z22ZTzj5t1
X-Gm-Gg: ATEYQzyNaM0qO8AuZXQ9b3d/w3qvYvE74g3Svaph1rdo4SZSnpA7qIgfng1yCcaLUyq
	JlGVQQTJ4d2q1Fz2PYUvsNNdFIRll74FJi/B82aDettZAJ/hRLMpAyhRKCpKnr9iWyNqU3Ic3YB
	aWGZSncUSRbWu8Mp9smqV9RnQYEISDoZFvZQldXXinUQHfFMxdv3AtZSah0UKJEalS/WrBrnptd
	6rSlmAo7JsIDjrOpnBlfRuGyj+N2xH/EIfQ4+nsn4CaGjwf3wXwMih1rYSUPTzqvEwLPq74tU7k
	xL0WdVqgqhkZ708vYR3Tapl+nTfiz1yOCYik2ezuWlArV2M3CeCJep9XQtfKkzBbdss9+yQzhk6
	pH6Yyrrbu4FzNviB3nDW4Oo1Cl1/FwQloXsgfABY9M1XwlCRc2IaM+iKM3y7hGv/wEhzIfKq1Tb
	uYIE++BMJHjks=
X-Received: by 2002:a17:90b:4a8a:b0:359:8293:67f2 with SMTP id 98e67ed59e1d1-359be34419amr10117586a91.32.1773052046616;
        Mon, 09 Mar 2026 03:27:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8a:b0:359:8293:67f2 with SMTP id 98e67ed59e1d1-359be34419amr10117555a91.32.1773052046095;
        Mon, 09 Mar 2026 03:27:26 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm8652277a12.25.2026.03.09.03.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:27:25 -0700 (PDT)
Message-ID: <94da5711-7bd2-48fe-b1d4-8d8542b75843@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 18:27:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
 <20260309-enable-byte-cntr-for-ctcu-v14-2-c08823e5a8e6@oss.qualcomm.com>
 <03705fdb-e13d-4b5b-8ee4-af9348469b42@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <03705fdb-e13d-4b5b-8ee4-af9348469b42@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vI4DZAiX3E2_Euq_--S8Lal3HOW-raFS
X-Proofpoint-ORIG-GUID: vI4DZAiX3E2_Euq_--S8Lal3HOW-raFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5NiBTYWx0ZWRfX4iwAc8scBeaR
 nQ1Mpa+c0VSpJmvepBF/RPAOidyNW5CFS9f+zAJeNCptG6E8skIJHiW5oMbtaiAXGZmjbRNG07N
 j05OQckAsQl0x3zhqzxqoq6bJTRKOqzvz9DIXc95QalsVS6hoaWNgIxglf1vM6lb+9thYCQt+CM
 2VGzqGKPUROJy0SZSlib5N9AVDmVDRbGGAFc6Mf93SOumXVTBbwH6zW2qzRSYryEaGnJaTNwgHm
 75rCJE4+TGB+m5nSaoowh/L3AMPEx6KtkXRt5KY+MPiBL1kg1zoLDYx2BpQvfz8T7n0+EfQvS2S
 /3JEFKsqHIrbR+HTEyDiev0SGRjZBleUzV0NZBkLAbJUae1tRKC521oSv74kBrqdtLj1id/ZS5u
 GjpyxR9452RtqkKNR06Xu/QF/YzhmL/GLnCfAenpLVk/XkeLfbMJA5/cz6puvrmvkYBvHwdSfYT
 6yLu5WM5FvHuh504jTA==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aea08f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=b4jqt5UQwNLUUHEC-OMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090096
X-Rspamd-Queue-Id: 89BD0237093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96195-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/9/2026 6:02 PM, Suzuki K Poulose wrote:
> On 09/03/2026 09:47, Jie Gan wrote:
>> Introduce functions for creating and inserting or removing the
>> etr_buf_node to/from the etr_buf_list.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++
>>   3 files changed, 112 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index c89fe996af23..bac3278ef4dd 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           idr_init(&drvdata->idr);
>>           mutex_init(&drvdata->idr_mutex);
>>           dev_list = "tmc_etr";
>> +        INIT_LIST_HEAD(&drvdata->etr_buf_list);
>>           break;
>>       case TMC_CONFIG_TYPE_ETF:
>>           desc.groups = coresight_etf_groups;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 4dc1defe27a5..15c0874ff641 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1918,6 +1918,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
>>       .panic_ops    = &tmc_etr_sync_ops,
>>   };
>> +/**
>> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
>> + * @drvdata:    driver data of the TMC device.
>> + *
>> + * Remove the allocated node from the list and free the extra buffer.
>> + */
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
>> +{
> ...
> 
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
>> +
>> +/**
>> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
>> + * @drvdata:    driver data of the TMC device.
>> + * @num_nodes:    number of nodes want to create with the list.
>> + *
>> + * Return 0 upon success and return the error number if fail.
>> + */
>> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
>> +{
> 
> ...
> 
> 
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
> 
> Given the above functions are "EXPORTED" please could you make sure that
> the locking requirements are documented and asserted (lockdep_assert)
> in the functions ?
> 

Will checking the locking scenario here and asserted with 
lockdep_assert_held.

These two functions should be protected with tmc_drvdata->spinlock.

Thanks,
Jie

> 
> Suzuki
> 
> 
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>       int ret = 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..5ac07e8dd5ff 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>>       s64        len;
>>   };
>> +/**
>> + * @sysfs_buf:    Allocated sysfs_buf.
>> + * @is_free:    Indicates whether the buffer is free to choose.
>> + * @pos:    Position of the buffer.
>> + * @node:    Node in etr_buf_list.
>> + */
>> +struct etr_buf_node {
>> +    struct etr_buf        *sysfs_buf;
>> +    bool            is_free;
>> +    loff_t            pos;
>> +    struct list_head    node;
>> +};
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @atclk:    optional clock for the core parts of the TMC.
>> @@ -245,6 +258,7 @@ struct tmc_resrv_buf {
>>    *        (after crash) by default.
>>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>>    *         Used by ETR/ETF.
>> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -275,6 +289,7 @@ struct tmc_drvdata {
>>       struct etr_buf        *perf_buf;
>>       struct tmc_resrv_buf    resrv_buf;
>>       struct tmc_resrv_buf    crash_mdata;
>> +    struct list_head        etr_buf_list;
>>   };
>>   struct etr_buf_operations {
>> @@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>                      enum cs_mode mode,
>>                      struct coresight_path *path);
>>   extern const struct attribute_group coresight_etr_group;
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>>   #endif
>>
> 
> 


