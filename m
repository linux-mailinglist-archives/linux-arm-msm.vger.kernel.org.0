Return-Path: <linux-arm-msm+bounces-90632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AyvN84heGk/oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:24:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D88F00E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5F13019924
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4952D63E5;
	Tue, 27 Jan 2026 02:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMA3J8zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuNcNWnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA362C3242
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480644; cv=none; b=Hv1tSth/O7//rP9LRVCpUKxXQ+8oP6c5nGt64/qgEFBV7eT18V/yFLGRqOhAeax3V63SELyjWmpbhasgg3PXPVGOj0gh0esJvJ7REaX6zNE0YgipFctcGrNVGwxmY93G0DI6u4D9ue3mYRcutmPsOrZEcYwkOCSWfVks3LT8B8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480644; c=relaxed/simple;
	bh=9f3NFht7zeSv9a6jBvvOUsB+j3Nq6SROc+zUKnDAZzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpFBDK3I7WMhzo5p552ixps04JoxQPUp/49zkXkHUjRCPT/ZDX/p47W8lCXsoxRuUJchBgDmuWNVdsOw9/cnVEmTqMMgx0SKvaYCo0Bk/5f2Mr01x8b2pDFxXMxm5p2wZPdg1QVF8RFNIUmoi2b2QhkMryZ9/vvme7iScEDmoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMA3J8zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuNcNWnf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKggRX3481584
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=; b=NMA3J8zbHSUQq9rh
	HHGIg35QRr8DsMHoRKWv8S5XvoEntlCi4Y3iGb43si8HfY3GviwTR/a3a81zn1fA
	37ux5qoOuxkSbWFpjZvosdhRsMiNkRYTqZvnrQptE//fzDLnXHJoGH4DENPhIRo7
	YZwQCX3aeyiW6zXqnThlwWleQ0NG3T30Ub5RZWqeoRJqJ0/MluawtORGK7O5s0GX
	eBjj5KG9nBrK9oHYRRBcQgFr3+HSsZf1SN/JZraIxGzq7R/BiUuk3I9SH+PGMpKi
	3kJtvRhPK0ckSt5F0JgA/dW5xfUH6L5e3Kc+utWU/s7QBuTaVlF+zO2xQruOgxgq
	JHJMlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v33bse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:24:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2381ea85so108566575ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 18:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769480640; x=1770085440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=;
        b=EuNcNWnf5g7NRGNXN7cg8WhRvBVs5O3BZnoTjxO55qA3Jbf794PeNxh5C/r5XeKpk+
         XbyzfvnBTZ0djqTz4ZozNQIVP9DiI5fYwaTkhmusuc7S8DJb5q7crdVRDQVle0gQEF4K
         MIo/ag498CuQnwSorIQoKGzVJ0rCYgygTnBtEILdluKPkEb9HRf8Iv67fa4dYSPxLh4t
         s7CHFNTLU4gQwYOFyndxbhRDSE1Ps88lQqLTCzmC76QAqfzla8kLKM9ue7CysU2wPlUi
         eRa3XfsT4BAh2K6VQZ5QU2JS4+58weD2cTaYL/0Bm1/aoZBE9lv0U8ODN4RU/KNGb8ed
         Cjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480640; x=1770085440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xcj+7J3rCgzN/qZYc9vEg73R8vlK8fAALq3lkw0cpQ=;
        b=pEhZNfLPyXi/lGN3j9U+lk0ATPtro6+XHT+slsA6SBMNqcyIk41OOy4n3Wh3wLvZ5a
         1ilToqB/Hhhr5xEtTuI/qN7lYEpFHZWG+dsz/oFfRoz0X9Q6Cz7aidtV6lG/7skVZXQk
         KdBXeLxJEsIkS7lASl/LGKpqXQ09kaTLi4FWX2xvMrNNIHr+g3IGPAT4yHlr8GgiR+Uy
         hVei86WvItBuZJdsU42QkUNJI6uUl7Q8Zv5PJxCAVR3ohP6lGuwljJrV+v/5gYZFzcMq
         VmWg3jpcwQnYeqKsXTnlCZ/EBGPS62lmo8f8/+Zfpo58Y8jqkIxyoErN1k96Yz8UeI8A
         b4IA==
X-Forwarded-Encrypted: i=1; AJvYcCXLnseD2qm73yo00+SAB1eGr4/Rp+ozjfwe1hByjt1+PXuvQVkewM24emVc9CJmKoTlwhV7uY/jSQCPHTcv@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZuAsdZ1S4PqWNCrFKWpqngV0aN4zOqHT0ibKNLCnFWJN8HcQ
	mjD21oq5a9Xxn/XXq5wDUGY7OsCuRRwHInOMKAgApqOqTEfFU1dgCSylzE6V7rkIsSbLiJJkbZA
	hgvajFnhROnkPIZOUQQDsbo4FaERuVfLPckdrIU9ZzN0DZHOb8kWTgxMtkrq1ysmVLuG3
X-Gm-Gg: AZuq6aLGJzRRu1MVNkuJI8kiPhAuBztULyj4yLA0GtuXZGGhZ+iM/oF8GfUeIzSmEpm
	hYZk2dSGFPkPvWbWCH8IvxPzZMTBKwrVNfPp6QCdGkco4V9LOaCqZSmanLIQInZq9ScBMUA3IqO
	rXmTHZU9APbr0P5lSTrRoLy5J3RgmWGJ+Qenx5aUUc+MWsk/E4ja+YB9c7ec0IjhKvXG/RUHM7B
	M3ebBcIKZfhjrT012ZZlyrXgtJYf5EeJ47NA2NCmY61nGiHFiF+GUeyFJt6fkoLln1ZtqV8EHT5
	5aRxRkiG1G5h57CwVCPW9BfnG+SjhZOcDiLCDW4TxinhanaILcpTPT4Z8S0plHgQwvDjW/H1b6+
	KCUDeQo+LDnhUgaGUHI2bhvrhV7FBw90aDIk6RJg=
X-Received: by 2002:a17:903:2cf:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a870d7446cmr2559595ad.23.1769480639796;
        Mon, 26 Jan 2026 18:23:59 -0800 (PST)
X-Received: by 2002:a17:903:2cf:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a870d7446cmr2559345ad.23.1769480639302;
        Mon, 26 Jan 2026 18:23:59 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd96bsm101009885ad.33.2026.01.26.18.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:23:58 -0800 (PST)
Message-ID: <bcc3547c-b7d5-41a3-b291-4669c11d7f1c@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:23:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/7] qcom-tgu: Add signal priority support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
 <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxOCBTYWx0ZWRfX0Vx1xTxTdJAN
 L2MJPCLWmF6njEXODGmEHplU8gTkqm6+qoYMw+T5G8W2SUfzRXDUfSbAQoXWnaxG3XiMAnVj63E
 UjCeASDIlQwJunDUwdrg9RVBanLYgKksk0/XFEjcLQr5LqbmAqgatNoi8HQk+KDDfVVQClP4SOv
 TMY0MTXCNtTshzV1WfkkrOWQ5cFw674GQoCdQtdLsyrXjfeOihK5cZWzWL8x+44tQ0CBXv2F9Iy
 Wsgu/12FGa6EyJbSfIJBm+6Mtg2Z35jbyMyrwwuRmIoTQIxVTxO9tGWsg+cDHAUBMEGm1iJ9pQ2
 PVEK0IYz77rGRX0s2p+GSYAjmopJc98SyNuxdexgYbc7Ge4KEq7GuNlaPjHULAuSxSFoXH4SADp
 nINg0eVn+TQabaoYwO954tMiRRDPrMC08O7F/VMzXjLr6ORf5JrWJwVkR8SgaSeeJZDcw1v1VA2
 V18Qw21zTHDIxJQqFig==
X-Proofpoint-GUID: -VaNwBegeX7mSCYSOmxPXA_-XrXK05dg
X-Proofpoint-ORIG-GUID: -VaNwBegeX7mSCYSOmxPXA_-XrXK05dg
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=697821c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IIc-LL1DTgqZpWAsoswA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90632-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 803D88F00E
X-Rspamd-Action: no action



On 1/13/2026 7:09 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 const char *buf, size_t size)
>> +{
>> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +	struct tgu_attribute *tgu_attr =
>> +		container_of(attr, struct tgu_attribute, attr);
>> +	unsigned long val;
>> +	int index;
>> +
>> +	ret = kstrtoul(buf, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	guard(spinlock)(&tgu_drvdata->lock);
>> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +					 tgu_attr->operation_index,
>> +					 tgu_attr->reg_num);
>> +
>> +	tgu_drvdata->value_table->priority[index] = val;
>> +	return size;
> 
> Style: some functions have a \n before return, some don't. The former
> is preferred
Sure, Konrad.
I will update and pay more attention next time.
> 
>> +static umode_t tgu_node_visible(struct kobject *kobject,
>> +				struct attribute *attr,
>> +				int n)
>> +{
>> +	struct device *dev = kobj_to_dev(kobject);
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	struct device_attribute *dev_attr =
>> +		container_of(attr, struct device_attribute, attr);
>> +	struct tgu_attribute *tgu_attr =
>> +		container_of(dev_attr, struct tgu_attribute, attr);
>> +	int ret = SYSFS_GROUP_INVISIBLE;
>> +
>> +	if (tgu_attr->step_index < drvdata->max_step) {
>> +		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
>> +			attr->mode : 0;
>> +	}
>> +	return ret;
> 
> This is very convoluted
> 
> How about:
> 
> if (tgu_attr->step_index >= drvdata->max_step)
> 	return 0;
> 
> if (tgu_attr->reg_num >= drvdata->max_reg)
> 	return 0;
> 
> return attr->mode;
> 
> ?
> 
> [...]
> 
I agree that the expanded form is clearer step-by-step, but I 
intentionally kept the current version as it keeps the bounds checks 
localized and avoids multiple early returns in this simple case.

I find the conditional expression still reasonably readable here, but 
I’m happy to revisit this if you feel strongly about the style.
>> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>> +{
>> +	int num_sense_input;
>> +	int num_reg;
>> +	u32 devid;
>> +
>> +	devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>> +	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
>> +		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
>> +	else
>> +		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;
> 
> num_reg = base case
> 
> if (num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER)
> 	num_reg++;
> 
> ?
> 
Marked, will update.
> [...]
> 
>> @@ -112,6 +250,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   {
>>   	struct device *dev = &adev->dev;
>>   	struct tgu_drvdata *drvdata;
>> +	size_t priority_size;
>> +	unsigned int *priority;
> 
> reverse-Christmas-tree would be nice
> 
> 
Marked, will update.
>>   	int ret;
>>   
>>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -127,12 +267,32 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>   
>>   	spin_lock_init(&drvdata->lock);
>>   
>> +	tgu_set_reg_number(drvdata);
>> +	tgu_set_steps(drvdata);
>> +
>>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>   	if (ret) {
>>   		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>>   		return ret;
>>   	}
>>   
>> +	drvdata->value_table =
>> +		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>> +	if (!drvdata->value_table)
>> +		return -ENOMEM;
>> +
>> +	priority_size = MAX_PRIORITY * drvdata->max_reg *
>> +			drvdata->max_step *
>> +			sizeof(*(drvdata->value_table->priority));
>> +
>> +	priority = devm_kzalloc(dev, priority_size, GFP_KERNEL);
>> +
>> +	if (!priority)
> 
> stray \n above
Marked, will update.
> 
> [...]
> 
>> +#define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
>> +#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
>> +#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
>> +#define NUMBER_BITS_EACH_SIGNAL 4
> 
> "TGU_BITS_PER_SIGNAL"
Marked, will update.
> 
> Konrad


