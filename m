Return-Path: <linux-arm-msm+bounces-100184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAkeMWDwxWkkEgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:50:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FA33E81E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE5C8314052E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 02:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F78F82899;
	Fri, 27 Mar 2026 02:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijogxYkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0dUz7fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28B246BCD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578408; cv=none; b=IYE3NARRhTJT4dEGfS8WHfzhTF+bqtVictBH4Wyucl4nAPbv78Kyy2tDfrNMFR8jbS+jhRQRCJZrzmPvgARN9Jja9n+LpXrnujFLcwVH87Ot2w1y2L/6v3WZF2h7pzHr+eFLEcAYYQ7ZaM77ml8MN2s+cdfvdGsnErmQGkKCyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578408; c=relaxed/simple;
	bh=gRsfR88L961MVdN0pn3ZB8R3CPNZOcWVnUe2rgHqP2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvVH4sMCkfOFyUG6jC3HGaGbBxwx5MpMDha/SoZ0/XGNFivftbJoYtlC+ZPBorEeosPHRYV7JMYmv8Wj+q8afWAeeFIuaO1o2qGMYVu5FFk5u4WChqzL1QIk6bo92A3SJ/FElkarpD/B/yth/oiJRznIUUiLclsEgOP48ZMWqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijogxYkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0dUz7fj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R1L2LL639673
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=; b=ijogxYkhf6qwDB5+
	/7dSdUigh31q/DPbluTSlsNhWatnX+ngR7VuOJCykV8ZKzwZU0PRpdw4/bkyFA5d
	Cl30M4iUrEiCiuRXXlL0HAJp9TdHIC71gcKU6n0KKuAUHxs0sytMSQxZR9+wxpop
	wgr3rFZEOunWKbJ5TxQ5wJmIJuc1cR4Fpg0ofjWJfG/l5jpuVWs/23673zJeHzI/
	gEIYGKEkxjovsXeeqPuvQXilzLNm4qAQTEC6yl9b5+4aExUMPStvSdTJvMHHHbKa
	UYCSPJCTxcsaZpg3Fk977KgeMssTx4jjnf7TsQQ/IZ3MuDGnIYqWgi5PAo/P29In
	qlXWmQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883hthn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:26:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a782029b7so1271862b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774578405; x=1775183205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=;
        b=F0dUz7fjGnmMNUmo/SwMvRXdOgXGAojSy8SOa0mzewbcEcE/58X+7qKg84yJvwwvyz
         A9BC7NdbupvrG1xcT4328mjZUSHLUjjs4DQ3e/u18tbXpeoDwxrW9rReHJz3WRuKXeQS
         VB69hK9Zn761o3gqR8T3Cgmg31ETlewnRIAj+BTSJ3p4WsAXZKAmVGBUhgwXONshwWzP
         7ZzPNPVpaVyhpJDWW4Wx3FGG9CVAjG6apUHOJ/iQe3Ad6HBBvyxGBpEWyYVG0lTuQlqF
         nxyMN6HrEj33E/EsuEZ4KbtHTt0+19pcojDYYQY+l6HOnM9BJaJaUiWiR7Lq/s3cf7cn
         4+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578405; x=1775183205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=;
        b=F0cWhtsjnXmA5rnySOlEc7ambq7mL7CpCWYoBUmXapXz81G+L43eM8I/J4jEk35c+1
         D1VpWrAwZfaXkOODIFMkhhZSRoOsPDudazlCAYv+7k6VyHnPKqmVmNGB1Qg5uAR7WQfR
         uHU/yoeyZjp4NlaVdf1kIGJEACNQh0jWIDWqQ+0hhZG5YROReS6QN2ARo9l7NUIZ4nT4
         sze7yY2RXX8ahyOPJb76Fa12X1d4d0IQgT6Rap3O33JgmU5BRwsdROLJiFxyz8U/1dOu
         kJ0P5nV67oAv1Hh4KPcNPQ+svQbKu5K9PxX2Zi535xFGX/80VWIJxcLMU3giVMN/bEMU
         f4QA==
X-Forwarded-Encrypted: i=1; AJvYcCX0eB6fyOdgAc1WtrTtyMR5A6JMMMsDJ12ixG/O52T6ICv3y8A0Q7FqMkc/Zmpg3xBjrZLM7vc6ErXacqwq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20SMLezXBrvKsQzcou9+HTZ3gphfXUBMxAoaPNalyjBQf+7uN
	GNSCcuvWGIaXiLnXOQx4UDr76JepdFmZaD+I0MVWVfN/nPedLy2ADeVT2+047OIv3vOcV6vBv6p
	xuGsRso3tl1A2TLuaWSvcPQlawn1JkceO5rl8GZqdggDi/42EMaios9kWUCgxDVvL7VIw
X-Gm-Gg: ATEYQzw7NwlSWibzJN4VdHfS4NJEjQM97iFV5YU9tiSM0EWIO19/bmfpunW2G5hDg4h
	e7LjtAuMXnl+f6vCbf+pNaqpqb5twQSC+agTN+m+w11Zvkg2NfEb7d0tLbgTnsIOD5cqgqbZaOs
	5NQ9yXhkzqFT2ffsn1KtKKzXzENuycDl7o3yN3E/z6aZOyd370diI45+SJZcmI8WZ6FH4F+XqHU
	YUtxnNWCzok6u5nKJmgTmCE6QKXcjiRbFt+WzC2e67EZ+uaXQdSBcayW64ZgevFkzTTxXV1cB+I
	qKiyTTF4toSavFqz4GS4sctgDxZ0FBPUIMSDGWbfcJ3jf9lqJDSiI/334YbXtVxQ2zZxergr4Sa
	OECW/XyoV4EyCdE6eJiZ1PxKVcXXB6Lh77JOdmiJw6a+wdLl+kygUVrOi9EYcSH9ryWv6KnLZdi
	b8agY3vU1baQ==
X-Received: by 2002:a05:6a00:2282:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-82c9607f0a8mr688657b3a.49.1774578405305;
        Thu, 26 Mar 2026 19:26:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2282:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-82c9607f0a8mr688629b3a.49.1774578404805;
        Thu, 26 Mar 2026 19:26:44 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e6a15sm4696446b3a.1.2026.03.26.19.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:26:44 -0700 (PDT)
Message-ID: <65611581-97c6-41ae-8b20-42c194c31915@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:26:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4WD3gj-yWdUqbK88_iquH1bBd8GCQzon
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c5eae5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BNsjwqSjcop3XK1me6cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 4WD3gj-yWdUqbK88_iquH1bBd8GCQzon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxNyBTYWx0ZWRfX6aSOlLdbiRjs
 I+GtQfHm0hxEiuZXmYHVIE6Mop/cnlA9DrbnP4gGtOGC5OJxr+HrYbQDHgpVXY9Eze8BsNLeiSa
 8BVYpsQ7XT1pDIYbzL90Nv2ZiwOBAwhE0T0iMWStd7cvrxQHirOMdXIKHIs7L1KGrYO07shINNZ
 ZQZHD6pETx03pnlYZkKj2nwiFQHG+L2SHkBL4Xgy52cNqxxvnkn+jZygJSMqF5bYzKe4pbRBZM+
 9oOzO/IUH9qZebdd9yTWvhBIDvWMl8Acd+Z3RXsPmwqnQNkqyKi7ePd6sLg+njjKjGi1pP3DLeM
 YY+c8wJiTARnb6cMDZw7Sa9IZf2P3ctzAqiZCGCOFZRpE67eLQScav/fdDNAgM6+FqtKhZeMuVr
 xESQe9Ffcpjx269o4ThYczQJIoGcErZHJiXdMV4+nue4Jyj8YA5SHM6g6A3r2vr/97C9/a24AkU
 VYgKcXGE6xTfCQ6B6Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270017
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100184-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB0FA33E81E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 5370882333bc..1dcb8fb71cd9 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 4539415571f6..e28e6d27cf56 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	bool need_pm_put = false;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		need_pm_put = true;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);

need_pm_put flag is not set when reset a enabled device. I think we also 
need do pm_runtime_put after we did tgu_do_disable for an enabled device 
because we have pm_runtime_resume_and_get while enabling it.

Thanks,
Jie

> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	if (need_pm_put)
> +		pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   


