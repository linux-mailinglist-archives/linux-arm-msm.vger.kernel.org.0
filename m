Return-Path: <linux-arm-msm+bounces-98468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPruJ0StumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:48:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94E2BC508
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77A11300D720
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49863D7D6B;
	Wed, 18 Mar 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iG7y6ria";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuTwhcJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD53624B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841678; cv=none; b=HRvQ2MSOmwZszogVg3rwDKVVEgHlSO5B14SiFHdEA+LHYHngomUI+clNxabNCdsWmxTvId9ZPQ+jXX97TaJX1j5LPI3iCjhuBgcL6jkT233X9vSiudHSDJ5ckw0D7iHJVY9SnNX0UmW6K4JKpPmxjZ307WoD0+l0X22eX+oSpcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841678; c=relaxed/simple;
	bh=G90Eo2ef3hVHZjpLTcKIeXAIh3U3FO0XXhvK4tpm3io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgKEn4udlfOpshuZu6DYEa05wO4V/PZmY3ObEqmU0eeaEqiXLNKcs4x7ryM5HmtvXR8xjNlCZVaSgqpeEg/mlqNLuM60KWmtEO71kINTZ3q8Nck5uxn4JlKwryqRRiauc1zMkftP2LLcUdZ5+P/2QQejOA4oHVHxENSUyFb5J3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iG7y6ria; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuTwhcJ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MvMK3358513
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=; b=iG7y6riakr//kT3C
	ksVATukZIv/g3d9QOdxdvX+u/JVpI841Wl4RGu8pj+AU5bccIAYtODT6FTXS/VN7
	09vxi+8LqazLfxucg9Nk8zSdCtJgE5vrlz5Jcm03MDcsBGGuTm30xsIYj08jtq5m
	p3M4RIwifcv34qM/p8oBlpszwiml4/HiZpr4bN4w39ffqxAUwLLS6BZX7NLGZPi6
	kGv9HByXTTimFhqRRhX0ad6ALSoRRfngvfsN2uPoEb9K10DJ1fbSrp7yZpGmJCjl
	bOwtntofss5ObOMBLroHtNFe4Dlg5+WjpIex0aHxyAKfbthvhBueCsFvfHgx3HzF
	cMqMLw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0y23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:47:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c739120475fso4524738a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841675; x=1774446475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=;
        b=YuTwhcJ5suTfMiKdfTfuZKe8hcEEhWoK+nd4j5ZdNGVkWoRIyb8l7Mcxr9vi1s2fHW
         ezQ0Dz2d6rxDkQnzec9jistq4eZb7e0LSzT5NtbtnGO3hssFUh69jmu509h5tnRZ1dgO
         EVS5WfvvZDRRVVTyUK8ZPXHQU7kVao3V/Xq0DoW0Ujmn4BoWRth26bLOdmehIFHdMpL5
         MLxBAeeBXH+ETDazujVpbAinqFPFQmXNXD0kHiJEtCqTnHYCmA/tufEb8mEBQ1t0kQYU
         s8mXPEQRmTjpDSRw8Zb/IRl9BeK3RzMn7DyrZodkK3wIdcQoQAXRgv1xc2IdB2C11Dbn
         INCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841675; x=1774446475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stQl8kSgW1OgtxrwaRnPe7q/fue3covbszl4JlVIBiA=;
        b=hinrWSmUuNvy7zK6K7ra2iWAr23T7+z3VRoR/P5VWyiZKZsLgJQdx2VqFI9XuKWawf
         SJvRaznIPYs0IZVizhaAuUIVB39+c5z5L8ts/SNdgQVUV/X/7z8v2WjAjDHmKVGvvUq1
         nG86xUYwlnZOHnH0FduP+lq9PgwHwXndK3DibYQPsDKvowkbr4ggilNpgowM8iwoiuio
         8REaHpbqbuL2QkIBImixlNwmrPhKMZF6m73Aec/fMb8YIy2gInIJxttILwfttSn3xJL4
         Cn8ik0YOFgSnDebZ9E9ZMWEfaYegxyyIASW6aEmwKe5fV6lpuGR7HS71Ot3by1H8f5i3
         d61Q==
X-Forwarded-Encrypted: i=1; AJvYcCV82VBHvLCG4hnGrvT6pt0MrmT3LnlI4m1UPT7JNVjZLHHk86Kwcj6WhrKi4R4Qpl1vcfA1qDbxlb/37vi9@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfn7/k0va3SXCZZV2APIaJQpKk/u+Z/llzAH9+H6Cd2LAI0xF
	nnixS/BEEdFsJcsFSehazxechn6YJADfzv+hGl60McKNALZBvY03II6fWiuEiof/Hqfq1BAZurX
	CqhuNpGjELkh4duKmeQvAyVbjlKeanhKnT6t4MGZThMPILKmbXpv+x9PACwIiYzlqnNVg
X-Gm-Gg: ATEYQzzgu+W82EIpR6QYx1PZx/UMHNN229PnjwGXOZm/13zsP2D9YoZHmL7S6YBLwKs
	qjAs9o0vKO/tfvW53A+fav+Sq/LGzxH5r58kIiQgv9SGvvZPXHFVAOF9qBAnVE2vBDPXaJViFld
	VYH6FNJnjEdD2PDEmby6RXth0gS4RNjjUdESPUxrxU/eAsvouMjAtdiU8SF+vFot0wmaBQoXbz1
	JgEZO8nKGyoh6lU9mmljigIugb77rHyeMRQhQFeDpBuTbzx5tmOdKOODjR6v1Z06szA3bTgK3+I
	5HCLpvaUmSOcArPk/Xqd3zO77fXNvzh4M+rQB+ZWFQikz4pVJKso8e8NtE6iHas6vD8G1XPMWIL
	mFcMDi8XWiOobJPX0i7B34DuFzZsrW9btCPSddj9tJ/l4GqcUUiSkAVmXI0XvzdobRAcycYZ+lQ
	/kXR5mFlhiURA=
X-Received: by 2002:a05:6a21:7d0c:b0:398:72b7:ec82 with SMTP id adf61e73a8af0-39b99d736a5mr3078886637.20.1773841675247;
        Wed, 18 Mar 2026 06:47:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d0c:b0:398:72b7:ec82 with SMTP id adf61e73a8af0-39b99d736a5mr3078845637.20.1773841674652;
        Wed, 18 Mar 2026 06:47:54 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5663f6sm2793568a12.26.2026.03.18.06.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:47:54 -0700 (PDT)
Message-ID: <be46234d-0136-4632-9cd6-7e9b3f6a09a8@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:47:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TNaPNYukO6A2GlF75u4zuKnNIZ319hrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX/Z+Ac1bYCEnh
 NWe57gJthoQPEt/0lPgZcyoW2jtfljbC3AS+uidNGOrNY9QJDd9e2VtuL/e+Xf9bSq19ZmxH7Dm
 PTds6odAnIUNTO2JYUbFDsepwQ56qZgj6BWryNgUPweluVF4YXNmqFqo/new7enRuTxGWCfaDnd
 fcv3Tzni/1hmvh0yIEFav9A8Oqoknb+EpHk0q7/NAOTXOfABM4No5bYD5HJOzpZqZuIE0jAjEHb
 UukgsyADZqrhs6HTWW92ZUg0ntTvXwMgEo5IkLkMYXHC1evUFWT5pmrumwAipOaAfMSbD1ImHu0
 QU30MT8quXHL+m0UB2YUqImSbJS9QenBImE4oZ15kg3XGXNSlUqWdzlSvfBvmng4Mhma1KkhXGY
 wvxSfjOVtptYbym+ZuyYf/VJ9x8ES7g+01JWJwQYhVAaU8Kb3YLlLqmb8aYPQLcjOhEC0bKno7m
 PtFOPxN6pGtX+HyEJWg==
X-Proofpoint-GUID: TNaPNYukO6A2GlF75u4zuKnNIZ319hrV
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69baad0c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ex1FgqpvNLb1JEDmgOQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98468-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B94E2BC508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
>   drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 18930743c99f..d8431a82574a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -21,3 +21,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the decode mode with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the next action with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 85fe1140eab5..1d996b9e303a 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -29,6 +29,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   	case TGU_CONDITION_DECODE:
>   		return step_index * (drvdata->num_condition_decode) +
>   			reg_index;
> +	case TGU_CONDITION_SELECT:
> +		return step_index * (drvdata->num_condition_select) +
> +			reg_index;
>   	default:
>   		break;
>   	}
> @@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   	case TGU_CONDITION_DECODE:
>   		return sysfs_emit(buf, "0x%x\n",
>   				drvdata->value_table->condition_decode[index]);
> +	case TGU_CONDITION_SELECT:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_select[index]);
>   	default:
>   		break;
>   	}
> @@ -112,6 +118,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		tgu_drvdata->value_table->condition_decode[index] = val;
>   		ret = size;
>   		break;
> +	case TGU_CONDITION_SELECT:
> +		tgu_drvdata->value_table->condition_select[index] = val;
> +		ret = size;
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   		if (tgu_attr->reg_num < drvdata->num_condition_decode)
>   			return attr->mode;
>   		break;
> +	case TGU_CONDITION_SELECT:
> +		/* 'default' register is at the end of 'select' region */
> +		if (tgu_attr->reg_num == drvdata->num_condition_select - 1)
> +			attr->name = "default";
> +		if (tgu_attr->reg_num < drvdata->num_condition_select)
> +			return attr->mode;
> +		break;
>   	default:
>   		break;
>   	}
> @@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   				drvdata->base + CONDITION_DECODE_STEP(i, j));
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_select; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_SELECT, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_select[index],
> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   exit:
> @@ -223,6 +252,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>   
>   	devid = readl(drvdata->base + TGU_DEVID);
>   	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +	/* select region has an additional 'default' register */
> +	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>   }
>   
>   static int tgu_enable(struct device *dev)
> @@ -356,6 +387,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>   	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -363,8 +402,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority, *condition;
> -	size_t priority_size, condition_size;
> +	unsigned int *priority, *condition, *select;
> +	size_t priority_size, condition_size, select_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -415,6 +454,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->condition_decode = condition;
>   
> +	select_size = drvdata->num_condition_select * drvdata->num_step;
> +
> +	select = devm_kcalloc(dev, select_size,
> +			     sizeof(*(drvdata->value_table->condition_select)),
> +			     GFP_KERNEL);
> +	if (!select)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_select = select;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index 987ea07bd618..ac46a2875209 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -52,6 +52,7 @@
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
>   #define CONDITION_DECODE_OFFSET 0x0050
> +#define CONDITION_SELECT_OFFSET 0x0060
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -63,6 +64,9 @@
>   #define CONDITION_DECODE_STEP(step, decode) \
>   	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
>   
> +#define CONDITION_SELECT_STEP(step, select) \
> +	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -76,6 +80,8 @@
>   			reg_num)
>   #define STEP_DECODE(step_index, reg_num) \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
> +#define STEP_SELECT(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -107,6 +113,15 @@
>   	 NULL               \
>   	}
>   
> +#define STEP_SELECT_LIST(n) \
> +	{STEP_SELECT(n, 0), \
> +	 STEP_SELECT(n, 1), \
> +	 STEP_SELECT(n, 2), \
> +	 STEP_SELECT(n, 3), \
> +	 STEP_SELECT(n, 4), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -121,12 +136,21 @@
>   		.name = "step" #step "_condition_decode" \
>   	})
>   
> +#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_select" \
> +	})
> +
> +
>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
>   	TGU_CONDITION_DECODE,
> +	TGU_CONDITION_SELECT,
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -142,6 +166,7 @@ struct tgu_attribute {
>   struct value_table {
>   	unsigned int *priority;
>   	unsigned int *condition_decode;
> +	unsigned int *condition_select;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -172,6 +197,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
>    * @num_condition_decode: Maximum number of condition_decode
> + * @num_condition_select: Maximum number of condition_select
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -187,6 +213,7 @@ struct tgu_drvdata {
>   	int num_reg;
>   	int num_step;
>   	int num_condition_decode;
> +	int num_condition_select;
>   };
>   
>   #endif


