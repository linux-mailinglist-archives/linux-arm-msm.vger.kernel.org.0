Return-Path: <linux-arm-msm+bounces-98463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJtpCaurumn9aQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:42:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D922BC395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46789301624D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04F83D8132;
	Wed, 18 Mar 2026 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYeCxVwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MU2gRjMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18436397688
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841318; cv=none; b=o5DUfgBAs46gfengDctpmAp1CD5000ApbcUVMrrurGkNA4C06nsKVIPXuaA+w15FYmNdhnJF+JLjfQ0uMOtAPXT4mVkP4GDcKQoOr6BdEjtHCgpxIEVmmT8z+4hN/gRfgErU6dTqoq/CWJf0JTs8fFe5W5yceG/5gnhI7J4QmoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841318; c=relaxed/simple;
	bh=+QbSQXmS9cVJa3ee9/rvAKsBIse/2axMAoVPN6MhoIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj3Hhcx5eQ6PFsajA7bzX0RPiHHygVUn2n+n2Zu2UKPDujKr1tYzbwBJMnJqWrOflwvfMN1o1ZpEUORUVzhlPMH8tynwTluU7cQ1B0vrAYtpNmlVwhvIBe4vtVewuAtCRheE0baqs/THoiRlxhr5G59BHD4Pj0onA9253TiARlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYeCxVwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MU2gRjMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I80cnS1049628
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfoCRTNpUnFauSN80wf65y7qTKNwSR4drCUs6Tp6j2s=; b=KYeCxVwPeDw+fLv/
	W6weo2e9OG0kmxU39uouDwcZ3FA7ocDlGfOwbbi4xuYJqzI1A1YqgpmEHmN4aXTy
	o/ay/uJPud3DeIAE4Ogbd5B/DanEBMaeCcTIniM3tgXqQmNjiSv43kAjBct2mKpi
	n7rfU10FLN+6E1dJyqbvhzLg2GDsEt8NwBrZdYOaGY5KGvliM7CoIh99xbptEQyD
	+8+iy8JGa5DvC3l/Bz6anZ6M+y2RflcZ3GQyx5HAFuhNGeqMT56vPv51LOJMRvnD
	N9KnRytffUfinxGCLcQiAbEnrKWNX7K1WDBBHjWARCM00w+qbBJ98YH4jrF8rqxh
	43fbVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ejqa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:41:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7385a1476aso4575670a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841316; x=1774446116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfoCRTNpUnFauSN80wf65y7qTKNwSR4drCUs6Tp6j2s=;
        b=MU2gRjMs2CYas9RPOpD3WxidS50+y3NV7ROHwgkuUYLGGgGcGqrIAY0fqlN7Stnil9
         NojIh2H0nMQ5GXe5Ibe6aKRrCrMRL3ojazuauy2B6+TdH1VWJd/jWPj89SgB5HUis+rn
         LN3FQhIji6wKtMMwtjheVyHefW9fZbiPcOhmVsCU3TVTcKe6mQ+jp8vv7Wb7UeMxqpSf
         wQh653AEQZkEbR7c8+mk+yRh1iR8OjAMDPy7nIhIohL896DIQ3wqpToCwjJ+FJBe06Uo
         soScdTeRTMSKC6TmL9L8PdrhFe1I+LN+c1Ie34uuU+18lcGlAhJqP+H2371Wap9Kfhu4
         H+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841316; x=1774446116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfoCRTNpUnFauSN80wf65y7qTKNwSR4drCUs6Tp6j2s=;
        b=SmvfrO5xA6I0FZhrrDafzteXFM01CJmtOmQwWqerKk/HBgLLeKdeEFFdiKETE+NISI
         d1IL2d/zGYXcrAd1j+v6975YjBxpH/kgf9Q3XH6BTFnosZwhYgC53VHZOdzTAj/g45Eh
         BZG0a+WFnczFL8vFweffbr64tM0DTWjlQbm1YIuBmjwYarm4h2/Ebq/qGjR6u3EgsdiB
         0GiH+QYavW7EgXCHoyt2O5TIJU37sn/0vwr6rtfoth4qVWCSDlGybDRk4G9+Lt9/86hy
         c4h51PqnFf4Xzy0FBcypiR8KxyjbLaD/QV8W+iq4mVbQeyOLtoPVU42QOobWuE9iM2Tz
         16FA==
X-Forwarded-Encrypted: i=1; AJvYcCUm5FthERPRdPq5mEyVs5VAf6K86GseFUBIWYuJhKBc+jcPeGzeIESWEixXxQgZJLgw0UZyQGSatl+FNauD@vger.kernel.org
X-Gm-Message-State: AOJu0YxWSm2Ew1so7h39m/G+wPJqRJ4G+EP/KNhwUKJTYf7r80F9444E
	fMD8yRFfELvu/3sGDd+mBJXhG50w2/CLFEFxTFBEy6VEVBsHOxwmfx99qfJz09zmCzxAfK7djSb
	4SFn02YzRc6J97wb+pJbZp7nY4VNOXFvxQ5FkdnXVI6hd5wXHbfxkNFhZLwXlaaOvKjxh
X-Gm-Gg: ATEYQzyLeSMwgjGyT895Y4zF5OvpyTKQ7Blnep2lLX3VMqpu8PuyouMpWy6+iqnNR0n
	xBqA5s6saxHXF/90sIGa9rdtnkMeHIf2LRhJIeSw7ZRTQk0D1V17E63T4LeAXGOkzyjbIUey2I1
	OajZ8UD9r3JE7lUi1PzE8FH4WzvgD5/tHwKdzOWMBABU0/Rn8ltHAd5gqCVMzzdg3IOwL9y2StZ
	QyDzzDcHdaAAUy7Z2VAACiOUgateo65J4WHN3YEWkTXlmFbUnFbR9DRrEGOHBFOzUl7OQBuxuIX
	dWqbGv8EGGXWwASgygODqgqKzfK94/GBp3jnbBGprffeC//2k5hRR71qNf5d5Do1wFAFcbv/Fue
	VJME0Cz+KX9K5lIRmqCMceQDa6GbapFtskDYG0Azm6PGW8Avv4IXEVnOXdY/HiXcqmVH3zY9fQu
	3lId09y2ff+0E=
X-Received: by 2002:a05:6a00:6d48:10b0:82a:6de8:fa51 with SMTP id d2e1a72fcca58-82a6de8fd24mr2003751b3a.17.1773841315475;
        Wed, 18 Mar 2026 06:41:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d48:10b0:82a:6de8:fa51 with SMTP id d2e1a72fcca58-82a6de8fd24mr2003712b3a.17.1773841314828;
        Wed, 18 Mar 2026 06:41:54 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56791csm2818720b3a.15.2026.03.18.06.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:41:54 -0700 (PDT)
Message-ID: <f21915f6-f5b9-46c3-817e-dc47d7d0cd7d@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:41:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-4-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69baaba4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LT1vS62KlavBGuHhILsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNiBTYWx0ZWRfX9PWSc5A+R++O
 Yvxc6GiUZz/IQkAU7AacWFImpTBtpcjhLNg9VfTZjwNyat3kMO5KaGn48JzyabbHSu25HqUwyoL
 uE1AmZFsZ2r7oZ4v2iaCREOkiQSB93KvU6sQJ7laOGl9W/7Kkcbja07Z4/7yPD5RSHs0P0srGiR
 SLilQLxFMnkO4wFDAAHU0bf4eCUvyBt3+feMRVJejdsgzRTtZWIXFeLZpTAuyuLMIdHhXtAkKY/
 x8Qg7/XXTkVAn1RzK5ABcL0q+untIX26B5C8Mk9a8+r7GrXAKYfuAT0Lbp2BzUGFP1FSLUcYPYt
 88lcvjnpoD2D2uZJD6SA6NaBYSzSrV2QH3qiw20ABQFdAr07Aq6ERZeosDIePXHRyjZL7b8t5Be
 T+lb3n3G7c3ecjpWLGQ2KcLWExqOBrFoV/FdVG9r5f0jrQCDbnAgWaONZJp0guAByEngygZwiGm
 PnaDNDwQaGoOYul9EkQ==
X-Proofpoint-GUID: DCLLa2DjXrW725jZV0WOBPBCg6w1JyaJ
X-Proofpoint-ORIG-GUID: DCLLa2DjXrW725jZV0WOBPBCg6w1JyaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98463-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61D922BC395
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 161 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 114 +++++++++++++
>   3 files changed, 282 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index ead237bb7d89..a1dfcd366d92 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -7,3 +7,10 @@ Description:
>   		Accepts only one of the 2 values -  0 or 1.
>   		0 : disable TGU.
>   		1 : enable TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 58c19f12f3d7..14d6ad410d89 100644
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
> @@ -111,6 +220,38 @@ static const struct attribute_group tgu_common_grp = {
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
> @@ -118,6 +259,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> +	unsigned int *priority;
> +	size_t priority_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -133,12 +276,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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


