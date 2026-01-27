Return-Path: <linux-arm-msm+bounces-90640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AVOEQcseGl7oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:07:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B38F649
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F5D3067A0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881DA2EC563;
	Tue, 27 Jan 2026 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP80O4ut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmoSDQnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9AB2D6E4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483013; cv=none; b=SLX6ESwHHflTJJ098a/HHxJ+nnrPNetjUgzzYbf692Hd+vYVIq9WEwIiTq5SgAGwdKdGx0+7crS8T8NmKHCF+8O9fmOHZl4b+nDChrjOQbKxDOtdasbK5w+TA62HPOnqw01xhVjn3dJFpPBHtVOPHIkeqo94Z4D2riP3OpRm/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483013; c=relaxed/simple;
	bh=GmNqDG50C5kjAf+rA5TEiGCcffG33TrUgVO4YyDdmSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXp8pxM+UfgkfLBE86Qq3l9vbx6UXTT0dsGz2ZQcgPh8mVaI3mbAAZuwy1AQ0nZBKbjYLLXDO6ZvtXShJN6naAzsnwXIRObttMC/ilQ/9OIxHaAg6tVDAlCFPgBRpaSrgz3ki7FDhE8Yep4fmVMXM5LBWB6wmElC+rxr/9fVK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP80O4ut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmoSDQnP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgE7j2733093
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=; b=hP80O4utmL7254mA
	D9x4+vXrJ0TYoP5rgBv7lO4xDPt3MrB9lML2F27eyjGIC9zyLD9K06Eob8zT1/yG
	sj2P6uhHe0PIr3U4yqWF0Dm5rmluIt9sWf5heQGP0hETp7rWqtNs97iqFFFtUs5j
	g0b/dbjwfPTRypwWCc2+Da+efV00ms5RDI+FBjb+Lu8nQ86fX5cWtTS16QBYdVso
	mvWDOmGWmtbKWJ+gAt+OH9UDcAcsAHfgaHUaHz04DGxqSed2rdsJxY9+ak09u3G4
	NeJOGyKofd7lKyV9vlEtVRNPH877f5LHMhf6Hl5u99/nmGV2+ci+GpA1xz+3bWcO
	w1ElOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv096te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:03:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac814f308so400213a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769483010; x=1770087810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=;
        b=QmoSDQnPdgD7eDCxumHRzhtmV6V2ZYNuAn80odsc0S/K1RORKvwXw00sB/HzAZLBn4
         fsBom74r1l+RvFCbRIRzEl3JCt9JgYaWgD2aaPUx81vxDbv9xCF/ubCJqjm42OLebZ9y
         GEXe9oqTP0p/cxU3LeQK+7DZMsUeQ8N8rnJI+Ni6NOyN0VVQRwZYm0BeAoc7aePkDit1
         K9q8HgJtIdx/lNkHdnGQ24daeIXOnNcokri+j6GsXFuSX6TnFLrq2CnNSa9iCjFVJbAm
         wxuYNrHuj/MtHu0WsRqSQ9F0hQftr/Bf1BCH7RL2bprktvFuq+YklcjIMdey65fmqmhv
         et6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483010; x=1770087810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnAwXWL3GpUOqmGUJiuTdNi//qtxXIIbE2DSDpIS5lU=;
        b=hkGNRLMGihXUQyrNJDoqKPhTLnlomNfmVmQCQPv2fbWObtDfGpZGQdECfUY/88y/P5
         h+xQ+W4/MwKZNOWWhHvO5nNXC10hOI9vlWefUM35rjUna0E1GeO7N0HKwNhHiDL2xujw
         vjcEucers9zbZmdOLUQbDPUpYKmVuLmxfM/uaZsWEdN6bT+lmTiP6F/ihGLqIzk8LNap
         cE8n31N4/mlOQ1JphR5X7q0S1sAUokI0mtiPtmea174ZG4+VKKf22JzkieBfyf7H0zWu
         qj0sbbhP5U5JQj1r6wxYnt3ns3tytiWDHH1q7vfu4nxSU/fWYobapnzySe3EeymvRyOT
         dk7g==
X-Forwarded-Encrypted: i=1; AJvYcCU/atPcavdH+E9AzrmbxRmu9NR9OHJzfGgYsbQcIepw64YgHjoVGpdBN5f31ARKOkW53ROIpGKrhlQ+GhqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxBctp3EVinaKs5tvQUFMf1Pl9hL5bZuCLjfD7rxR5VAHm0hk8n
	4qTdDc+eLQcjCrQNjEaq64O6Hol2xBUEFp97ycu8S5oYcLDvbZFUJ7V0mPTS8/MQjOVdv9FwVEi
	6/Yafdf0MZFcvBO6sL2+EdW2WxcICghva8UzousfnP0j6MMe/ikQnDoPY71v+L7g4fl5D
X-Gm-Gg: AZuq6aKPILOLL00CFbKkDH0i/L1j1v7hQk4eNLHW2hAziVAiTkF8p/rFzVUwyg5jr3S
	DqL9qWwsiYoUg1LiXao8zIqyQRPKeb5JSsGQr1hvroHfVWK5X28lQh0pPknKPva2aKB5Z6qKPZl
	gU+PRHJaS1VxMk4TJDXaot5HkhOCfXSPCyOk8AaGPYILf9UiAuNyDjTMlRxWh6X4Iy9yF2GIiTh
	Ieqdcy3pu2GB3yyS2h7xELSY2X/EIKBQ4gRgEsXzsB372CJ4u5+TPWofhN3Ekxvb5q2XAwImvQQ
	x72rzMaRYVVNYwjqekmfxhf/NalBej44IdfQq8dDWGTSBPp/fGQbUKOnF6AfYAPJtwshyLVaiDh
	49QiKAFIf3DHnCJ9ZxQV9H/SKgt+uZQ2LyOSD5I0=
X-Received: by 2002:a05:6a20:3d84:b0:34f:ec32:6a3c with SMTP id adf61e73a8af0-38ec62de194mr146413637.28.1769483009932;
        Mon, 26 Jan 2026 19:03:29 -0800 (PST)
X-Received: by 2002:a05:6a20:3d84:b0:34f:ec32:6a3c with SMTP id adf61e73a8af0-38ec62de194mr146380637.28.1769483009319;
        Mon, 26 Jan 2026 19:03:29 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a425254sm9558200a12.29.2026.01.26.19.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:03:28 -0800 (PST)
Message-ID: <e693d33a-5852-451d-b08c-6e822cd1543f@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:50:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/7] qcom-tgu: Add reset node to initialize
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-8-songwei.chai@oss.qualcomm.com>
 <7dd40fb6-38a7-4e29-823b-5c0b2c66e3df@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <7dd40fb6-38a7-4e29-823b-5c0b2c66e3df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5ofCNHEmMEnQ9CLEk9b0Fsq4IsquP3ve
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69782b02 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aDFzzllK5DXHcxDTN8AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 5ofCNHEmMEnQ9CLEk9b0Fsq4IsquP3ve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNCBTYWx0ZWRfX4fpPR5lWMDHc
 Nd7YD0diidvUgLXc+JF4ZugK4BnFddqHvGnQnT/g3YKzf7JXFNikkhfUC8XbjmNGYZd0q/2Jwqb
 8kFoWsSksAOVpULWt7AwsGbZ3KCRK3ma0IHOnbylD64lIL3n7pwM6wIa7adrwqqF2Rd3PKokGvr
 i6wSNZ4TsiuF0zy4sscGutAC7jYeYZ0UYo6ZMdTvwjvs2F2XfSNT/+gFmdV42qRmtHWSi4mnsQE
 sK8F44w+WTcb0XuNtMmNgyzhWt1rHxM6mhxqyOd7lO7z/eNSUxn2q/w5RurmHfChuhykA3YPyqb
 Abi2RBblhjEmj0x+WIsieLCuTHdZgPWUMv6xOqXI32mX/zubZGsh/4lR0q/pk1Xsi5JWCbpkQRM
 WM4Xzk4mvDDVQT2JKS79mGrVcDwG3NI5yLcukCzQyirlXtO+j5q78QqlXjOWBoqHEQpcNz4pLV7
 htdgkJeX3rkMlbHaoiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90640-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB1B38F649
X-Rspamd-Action: no action



On 1/13/2026 7:22 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add reset node to initialize the value of
>> priority/condition_decode/condition_select/timer/counter nodes.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
>> +static ssize_t reset_tgu_store(struct device *dev,
>> +			       struct device_attribute *attr, const char *buf,
>> +			       size_t size)
>> +{
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	unsigned long value;
>> +	int i, j, ret;
>> +
>> +	if (kstrtoul(buf, 0, &value) || value == 0)
>> +		return -EINVAL;
> 
> Your documentation blurb promises that only 1 is accepted, but this is not
> the case. I think the previous additions had a similar flaw

I’ll fix this to only accept 1 and review the previous additions
for similar issues.

> 
>> +
>> +	if (!drvdata->enable) {
> 
> I think this check needs to be made under a lock, otherwise something else
> may pull the plug inbetween
Will move "guard(spinlock)(&drvdata->lock);" before "drvdata->enable" check.
> 
>> +		ret = pm_runtime_get_sync(drvdata->dev);
>> +		if (ret < 0) {
>> +			pm_runtime_put(drvdata->dev);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	guard(spinlock)(&drvdata->lock);
>> +	TGU_UNLOCK(drvdata->base);
>> +
>> +	writel(0, drvdata->base + TGU_CONTROL);
>> +
>> +	TGU_LOCK(drvdata->base);
> 
> This is tgu_disable()
will use tgu_disable instead.
> 
>> +
>> +	if (drvdata->value_table->priority)
>> +		memset(drvdata->value_table->priority, 0,
>> +			    MAX_PRIORITY * drvdata->max_step *
>> +				drvdata->max_reg * sizeof(unsigned int));
>> +
>> +	if (drvdata->value_table->condition_decode)
>> +		memset(drvdata->value_table->condition_decode, 0,
>> +			    drvdata->max_condition_decode * drvdata->max_step *
>> +				sizeof(unsigned int));
>> +
>> +		/* Initialize all condition registers to NOT(value=0x1000000) */
> 
> One \t too much
will update.
> 
>> +	for (i = 0; i < drvdata->max_step; i++) {
>> +		for (j = 0; j < drvdata->max_condition_decode; j++) {
>> +			drvdata->value_table
>> +			->condition_decode[calculate_array_location(
>> +			drvdata, i, TGU_CONDITION_DECODE, j)] =
>> +			0x1000000;
> 
> This is unreadable, take a pointer to condition_decode[]
sure.
> 
>> +		}
>> +	}
>> +
>> +	if (drvdata->value_table->condition_select)
>> +		memset(drvdata->value_table->condition_select, 0,
>> +				drvdata->max_condition_select * drvdata->max_step *
>> +				sizeof(unsigned int));
>> +
>> +	if (drvdata->value_table->timer)
>> +		memset(drvdata->value_table->timer, 0,
>> +			    (drvdata->max_step) *
>> +				(drvdata->max_timer) *
>> +				sizeof(unsigned int));
>> +
>> +	if (drvdata->value_table->counter)
>> +		memset(drvdata->value_table->counter, 0,
>> +			    (drvdata->max_step) *
>> +				(drvdata->max_counter) *
>> +				sizeof(unsigned int));
> 
> This is similarly difficult to read with almost random indentation
> 

I agree, the indentation hurts readability. I’ll rework this to make the
expression clearer.

> Konrad


