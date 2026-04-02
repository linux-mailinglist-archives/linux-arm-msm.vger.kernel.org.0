Return-Path: <linux-arm-msm+bounces-101527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGdyEChEzmlQmQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:25:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83831387B13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56BAE305D6FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 10:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA243D566E;
	Thu,  2 Apr 2026 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuXxaieH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edR3vvoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A1A37C107
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125427; cv=none; b=lrNeWfvbFiAN2QACMcjB3Jfviufg2PSB/+aL5sq+VWsbAbkycmu9GuRcQ0lYnIISWW7pnBfH/3X4TGL4XrdfhRtdbtJrjds2fNt8TcdO0Jk22UwaVDyL+2Ti5kfPJp0nFCgIZAlT5mkXejDUc1dBj1LR797nf7vPVfvfEC1kXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125427; c=relaxed/simple;
	bh=zGLyfWtVIBxTdFZ4r1jjVKZ9oTR2wKYvhxIM+U+beHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoaOJYLEIbKMpz6EA7zeiDQeUS0zFA97rFO1tP3BsA1tTjFiu3r1XbnfvedJGBtBB8yz2qsvAy2VR4mnewFNpcXixEVYtj0xP7yB6kdMfnFxW7vDmnhziUIut5v/3Ye1xUOjFRCDB8qhQfBsIL6RB9FVTjjISmiylpEWYBO86NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuXxaieH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edR3vvoG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326pjT43044386
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 10:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=; b=SuXxaieHPReMMqeq
	4LgpLYLr28H+Me5PK/qKX2i5qt+NAE2h3M6Uvo1yrIeol75RdYadHCVMEVQelgN+
	lJ5YE0vY3ulkp7So3ld9vtPzNrs/sohJQXcJjuC/adeBBWFXyR2s89n/DFXjxww2
	rHwHJhPssJzR2IZGPdAkM+TiT4YywSljDw1FAUMTBSSmt4uSM5B57uM3r1NYDCUA
	f88MLDCHd2xUFgaRY3n6/JLyq+FZvBM/82ZptD1o3P2rCUh3H5G+uDJXvGUfYNZ8
	ZKOqrYwFMphskNawWn2AAvz621pr1h41JwJwMPuRM5qx130Vueq/KGrxsHD8OpqB
	/Oft1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483vcav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 10:23:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce0c07d0cso537588b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125422; x=1775730222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=;
        b=edR3vvoG3iBdOflAcx0qtrc0zAE3Rxpp98RcGpb/18BWd988fjr6YNCcOkuZ9uBotY
         QbeQrar+Dvr0MVUP6bWETLLXr87GCuo9z03MDC9CnQLlFvRxZ8MP2uQPu34Pe/v70lLq
         sJ2R/evFuXEJ3IShLDhfHFnLThJVZ5LTnGqBbjweTyO0L47YaUNxi8jVJMIJtVeiw88n
         t1oNz7AAbGeEezb3LNDbbtqWi2aVERJKDg4T7KBSNDrYnxrQv4BHfWggFBkWvBwspFT6
         a7WkeZ6qdx1PIZtTVo+rQgovkfDhyjhAwwC6MO5hYFu1Mt8G4R1hpAw/f3LiH4RVhCif
         aL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125422; x=1775730222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=;
        b=Rz8AqDq1l8PU79FK3jj8pZC8EQz7r0CUCiuFdtwARCU5A3AjDFuqUG6y7oTf7lgdcj
         ZKrvi0mtFEEbPkR8UXDRco4sWSw1Zk8GCtfqIyi8oDDoxg8nJXlo/0rqBlXDx5mC4kz6
         SElumUSgp81zM1jLw5XBccbxtD1cT9zGrY/OqmlovPmLOP1om8d71OAdhPDzcVBDKVzF
         4Xri3u7yoSaiNfpSjcnpnGRt67yyVe5i5ReZR3uwcb5wKm9E44fLowlSG/7lxjrxENku
         c9kEIViwMxtEibDLIdq5dtP3O5lKwqYKW9Ms/RxQnUDrazuqptyfHqODhI0+NepsBHjl
         Eg2w==
X-Forwarded-Encrypted: i=1; AJvYcCX74Ej2tWVfOHozfno32HEXzkPCzA4/W40h14uTD99fbFGG+wyfp1BBFaZ2y+cQEunATyCqQFiwnqzOSg0I@vger.kernel.org
X-Gm-Message-State: AOJu0YwtKai1dWv0ublqAyeKbQB1658gvnqk576jsL0bghxdqkSYkOMV
	FZc31BeQ+1eOrywMR7W1m6wMVxhj0eqc2bWb5ZxBj/5BXoBoVXVn2+tY4hwxBgk+Sim4BSXLxM0
	YUJlZ8ZeXeR3YdGHiZvNJLdxZHGAONcYocHQz6rDtCI9tvpGH2JKrN9Ph6D6RY+y85OQb
X-Gm-Gg: ATEYQzy2/4oqLEDKY/Ix9sYU4+GyRaGmWKzC5nkpkggEAteSsn1xI36qjHVu3n+ISub
	ffc/2DnwTt8AJZtbPescIR6QAOVajeIdh+pqCqT0ctwtrdyj2UjiHmUE+PrtiDrC3dilxpMTYB/
	8ME10uVj2S5JEnuB5iaUe/NxiORZ9BaSvvl65pQU/ch8vItmxs5jYifVJP3IIiPoUFD1wesNlR7
	e1khMQRLwTa1IGFoVVJSJ/TwzV8LK5C9eFlLqkPhFFvz1ZgE+s+GSyYbVrVb+1A1wWf58iDLHW/
	Vbe9GDoXZYTPKPqABAYcl4/hQfUu5qPsjqGCFOVZcRJ1RxC/ebv80p2MVBNe33weCwvXQA7BF6u
	XzQAxmnog/O6Z5pHGHkXij7G+qQvDT5VfH7F5I5MRiTk2+hpAEuqIT5h2wx8+Uj7ZzUu2CWRz2e
	zAL0dqSJlY40g=
X-Received: by 2002:a05:6a00:1d86:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82ce89b8e11mr6553093b3a.36.1775125422337;
        Thu, 02 Apr 2026 03:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d86:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82ce89b8e11mr6553063b3a.36.1775125421710;
        Thu, 02 Apr 2026 03:23:41 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm3681586b3a.10.2026.04.02.03.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:23:41 -0700 (PDT)
Message-ID: <5ef0b9a0-9ce2-4d62-941e-13fbb5b5e04f@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:23:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-4-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce43af cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vWkLcuJU7nNpPdD76OYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXxR1s/roUTiXf
 Cp+B7+khc83U4vB1thQdQxMIt7doL6LBOotTM8txU+FBFD3CiX2zZpRxTLM3BLxE1ihiOH71pAv
 aZm9TgNVsIcQeZPy8wZwThkiXuzWDA1WPG9D27+PHrJFa778cfdXA7sBRvSYNCtlokt+vds8fVj
 wl43+UisOGcFLDUdiDlv7rPBdnKMkVuva0H4jpWc1NHW6FchxZvWsUls+lcKOP0PfDVKnhpwlV2
 qT0Jsykstlg7COT/PYgwSuCQY+pex7MY3Eey0yfzGxhD1TFCyd3sU82cGP5vrEcquLuQwuvuLdv
 845X+6V2uvzgh5I58NkUHmHROCEglepdziEzKTVzOY4iNytWmUXg4kz7ZjP/nkpPfNSQvQ4KQsA
 kzl21DdT0dKtkcJMD7fmovVeVJLhBNcPINHfCxa+xU5X1hwdks/pnKndpnXbn82n6/nNTxAivWT
 eL+OWySePOHLRycjCVQ==
X-Proofpoint-ORIG-GUID: h7N9huwccrrSxpV5KCZSoOd-0H4LVM9y
X-Proofpoint-GUID: h7N9huwccrrSxpV5KCZSoOd-0H4LVM9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101527-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83831387B13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 161 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 114 +++++++++++++
>   3 files changed, 282 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index f877a00fcaa5..223873789ca6 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -7,3 +7,10 @@ Description:
>   		Accepts only one of the 2 values -  0 or 1.
>   		0 : disable TGU.
>   		1 : enable TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 49c8f710b931..7d69986c3e3d 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -14,14 +14,123 @@
>   
>   #include "tgu.h"
>   
> +static int calculate_array_location(struct tgu_drvdata *drvdata,
> +				    int step_index, int operation_index,
> +				    int reg_index)
> +{
> +	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
> +		step_index * (drvdata->num_reg) + reg_index;
> +}
> +
> +static ssize_t tgu_dataset_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +			container_of(attr, struct tgu_attribute, attr);
> +	int index;
> +
> +	index = calculate_array_location(drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	return sysfs_emit(buf, "0x%x\n",
> +			  drvdata->value_table->priority[index]);
> +}
> +
> +static ssize_t tgu_dataset_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(attr, struct tgu_attribute, attr);
> +	unsigned long val;
> +	int index;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(spinlock)(&tgu_drvdata->lock);
> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	tgu_drvdata->value_table->priority[index] = val;
> +
> +	return size;
> +}
> +
> +static umode_t tgu_node_visible(struct kobject *kobject,
> +				struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = kobj_to_dev(kobject);
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(dev_attr, struct tgu_attribute, attr);
> +
> +	if (tgu_attr->step_index >= drvdata->num_step)
> +		return SYSFS_GROUP_INVISIBLE;
> +
> +	if (tgu_attr->reg_num >= drvdata->num_reg)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
> +	int i, j, k, index;
> +
>   	TGU_UNLOCK(drvdata->base);
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < MAX_PRIORITY; j++) {
> +			for (k = 0; k < drvdata->num_reg; k++) {
> +				index = calculate_array_location(
> +							drvdata, i, j, k);
> +
> +				writel(drvdata->value_table->priority[index],
> +					drvdata->base +
> +					PRIORITY_REG_STEP(i, j, k));
> +			}
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   	TGU_LOCK(drvdata->base);
>   }
>   
> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> +{
> +	int num_sense_input;
> +	int num_reg;
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
> +	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
> +
> +	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
> +		num_reg++;
> +
> +	drvdata->num_reg = num_reg;
> +}
> +
> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	drvdata->num_step = TGU_DEVID_STEPS(devid);
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> @@ -121,6 +230,38 @@ static const struct attribute_group tgu_common_grp = {
>   
>   static const struct attribute_group *tgu_attr_groups[] = {
>   	&tgu_common_grp,
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>   	NULL,
>   };
>   
> @@ -128,6 +269,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> +	unsigned int *priority;
> +	size_t priority_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -143,12 +286,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	spin_lock_init(&drvdata->lock);
>   
> +	tgu_set_reg_number(drvdata);
> +	tgu_set_steps(drvdata);
> +
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
>   		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>   		return ret;
>   	}
>   
> +	drvdata->value_table =
> +		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> +	if (!drvdata->value_table)
> +		return -ENOMEM;
> +
> +	priority_size = MAX_PRIORITY * drvdata->num_reg * drvdata->num_step;
> +
> +	priority = devm_kcalloc(dev, priority_size,
> +				sizeof(*drvdata->value_table->priority),
> +				GFP_KERNEL);
> +	if (!priority)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->priority = priority;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index dd7533b9d735..df570c89ffd7 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -10,6 +10,114 @@
>   #define TGU_CONTROL		0x0000
>   #define TGU_LAR		0xfb0
>   #define TGU_UNLOCK_OFFSET	0xc5acce55
> +#define TGU_DEVID		0xfc8
> +
> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
> +	((int)FIELD_GET(GENMASK(17, 10), devid_val))
> +#define TGU_DEVID_STEPS(devid_val) \
> +	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +#define TGU_BITS_PER_SIGNAL 4
> +#define LENGTH_REGISTER 32
> +
> +/*
> + *  TGU configuration space                              Step configuration
> + *  offset table                                         space layout
> + * x-------------------------x$                          x-------------x$
> + * |                         |$                          |             |$
> + * |                         |                           |   reserve   |$
> + * |                         |                           |             |$
> + * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
> + * |     registe             |                     |---> |prioroty[3]  |$

s/registe/registers
s/prioroty/priority

Thanks,
Jie

> + * |                         |                     |     |-------------|base+n*0x1D8+0x194$
> + * |                         |                     |     |prioroty[2]  |$
> + * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
> + * |                         |                     |     |prioroty[1]  |$
> + * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
> + * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
> + * |                         |                     |     |-------------|base+n*0x1D8+0x74$
> + * |         ...             |                     |     |  condition  |$
> + * |                         |                     |     |   select    |$
> + * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
> + * |                         |                     |     |  condition  |$
> + * |         step[0]         |-------------------->      |   decode    |$
> + * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
> + * |                         |                           |             |$
> + * | Control and status space|                           |Timer/Counter|$
> + * |        space            |                           |             |$
> + * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
> + *
> + */
> +#define STEP_OFFSET 0x1D8
> +#define PRIORITY_START_OFFSET 0x0074
> +#define PRIORITY_OFFSET 0x60
> +#define REG_OFFSET 0x4
> +
> +/* Calculate compare step addresses */
> +#define PRIORITY_REG_STEP(step, priority, reg)\
> +	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
> +	 REG_OFFSET * reg + STEP_OFFSET * step)
> +
> +#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
> +	(&((struct tgu_attribute[]){ {                                   \
> +		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> +		step_index,                                              \
> +		type,                                                    \
> +		reg_num,                                                 \
> +	} })[0].attr.attr)
> +
> +#define STEP_PRIORITY(step_index, reg_num, priority)                     \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
> +			reg_num)
> +
> +#define STEP_PRIORITY_LIST(step_index, priority) \
> +	{STEP_PRIORITY(step_index, 0, priority), \
> +	 STEP_PRIORITY(step_index, 1, priority),  \
> +	 STEP_PRIORITY(step_index, 2, priority),	 \
> +	 STEP_PRIORITY(step_index, 3, priority),  \
> +	 STEP_PRIORITY(step_index, 4, priority),  \
> +	 STEP_PRIORITY(step_index, 5, priority),  \
> +	 STEP_PRIORITY(step_index, 6, priority),  \
> +	 STEP_PRIORITY(step_index, 7, priority),  \
> +	 STEP_PRIORITY(step_index, 8, priority),  \
> +	 STEP_PRIORITY(step_index, 9, priority),  \
> +	 STEP_PRIORITY(step_index, 10, priority), \
> +	 STEP_PRIORITY(step_index, 11, priority), \
> +	 STEP_PRIORITY(step_index, 12, priority), \
> +	 STEP_PRIORITY(step_index, 13, priority), \
> +	 STEP_PRIORITY(step_index, 14, priority), \
> +	 STEP_PRIORITY(step_index, 15, priority), \
> +	 STEP_PRIORITY(step_index, 16, priority), \
> +	 STEP_PRIORITY(step_index, 17, priority), \
> +	 NULL                   \
> +	}
> +
> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_priority" #priority \
> +	})
> +
> +enum operation_index {
> +	TGU_PRIORITY0,
> +	TGU_PRIORITY1,
> +	TGU_PRIORITY2,
> +	TGU_PRIORITY3,
> +};
> +
> +/* Maximum priority that TGU supports */
> +#define MAX_PRIORITY 4
> +
> +struct tgu_attribute {
> +	struct device_attribute attr;
> +	u32 step_index;
> +	enum operation_index operation_index;
> +	u32 reg_num;
> +};
> +
> +struct value_table {
> +	unsigned int *priority;
> +};
>   
>   static inline void TGU_LOCK(void __iomem *addr)
>   {
> @@ -35,6 +143,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @dev: Pointer to the associated device structure
>    * @lock: Spinlock for handling concurrent access to private data
>    * @enabled: Flag indicating whether the TGU device is enabled
> + * @value_table: Store given value based on relevant parameters
> + * @num_reg: Maximum number of registers
> + * @num_step: Maximum step size
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -46,6 +157,9 @@ struct tgu_drvdata {
>   	struct device *dev;
>   	spinlock_t lock;
>   	bool enabled;
> +	struct value_table *value_table;
> +	int num_reg;
> +	int num_step;
>   };
>   
>   #endif


