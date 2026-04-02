Return-Path: <linux-arm-msm+bounces-101529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNngJsREzmlQmQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:28:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A709387B8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D6353024518
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 10:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441823CEBA9;
	Thu,  2 Apr 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtEE2CB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVedCqqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC93CD8BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125696; cv=none; b=ALmSauLMWD3HrnK1jzwyjHSNr4/GEwC20KyQi54tLLII2o6U0mmpOIHrnmKRFYO7sSJDM5ekTR5JNRKQlOfESHHSRy7uSKTEyDQGbL6IXWLGxFAkpb3pZY1ZZjOPLYA8t2tpTCjbdjJ14F8YN/hheLHpS5lizio5lx35U1Mw/ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125696; c=relaxed/simple;
	bh=REcENdaosnAkFqqFzOgJyBHuHUx4hDLNOUZw3J7VwQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Py6CPxkt+3KSNSUJa8Oh8vGp7fAhRnu/kdGB3oruK78Lg/7J56S+wObadxn31J/spA53mZEWcQTvnt+hFtSLpSDJohkh0o5ruydG302vrtY3XBS1m/dAZuA4R0Re/weJ6Si38HoW07X6XAnbjPCqk+vLlhVU801JzQrjVXPf3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtEE2CB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVedCqqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325ViqC091717
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 10:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=; b=QtEE2CB/LG9Io4Go
	EGhJemTXECeThCcc/wBzfFu7oYLJTSD+Xjh5AElDvpqmEWXIlVlpD0Iixl/+nm5D
	KMkDQ6kNvHV3qraajIboWHlpMKVWW1c0I76IDVtT1fhmNlxf0NoIPozhtc/fRoyr
	wLnS4Wjc0pN+s5BgW/doG+xZhHQsUiLAKA0+KI5FrlSgztvBUMNnQYpNqlw6LAQT
	SX+AWvVmaBWYYSg48+qbTSRQuP8B6/u/nNN+6my7WhiMO4RkPnj3h/kMOO6CKy8m
	R8xMlkZ6onc7wmcWOaigKL0DSwHrDSB+3DGmKmNggJKgHmGtyHVr0bY5fFAjOWsM
	lhxz4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu96aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 10:28:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so17876325ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125692; x=1775730492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=;
        b=eVedCqqmjefnPpxVXco0mBCu/W1eLTSGcngPGZpQN9eC57LeQ5ZbRnWefvKTw7Qc0i
         igrkb9BYUclviYIeqAK0SspD642KSMUm9gzNeYh7JHRQMypealwRp+8e1pg0dVn51CY6
         09Y3J1wmBGz4mpr6GPJTwKAZCuDZ3uzmZ6AvpudXO3L7LK6KGzBz+EYCWQB9QBx+1dvP
         jys+1ZHO4cWcP7GpzkTEbEKDaQ0z2PpR1XDgNII4wwCnPJrJXyLVLxREDhm0IYvrqlka
         /xM/BOnNKrJRMFVSCybvW54CWumMZuUZrM146mzZXrkpqZ7APZE8RAS34Sxe6FgPhDff
         uC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125692; x=1775730492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQ7Zd5cgb0yk5pits+gN3wLhngPs3KzNIb6mGSmkcF0=;
        b=C4ygBIqJGpXp4l5PXV5IszY2YH8MdiMoUOT9XQdHYqxbXti/dmFjjxyWv1LUq6LJO3
         HFgR1kIbpKOHbJqWIuH6AFtClMTGHtnLCHqoigc3KKQTImqr589idPChzyDMk0aMP4B3
         uoHeiQP1M326s18ATzqbiKFAqbdvUh1ZThFLloZhHefJo1rBv1oXLoIecubXTTh6pUfc
         oz5QAx426e1Rsi6K4GCdXc/ouqQ1VV3DffktfGm8ZzVtFTvBLm2tO7PjcnRV+Prp/Syu
         hGFMT1usV01lX5u3DI/6c0fBzEi07GGCk4bERr792lpz5tY+/xX1b3lvEcULn6s2DqPH
         Z3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXkDufn8jEGmrSbIYIXvWaYWG6aprnfPUFn9RMo/07cpJANhMSjOEoEnCceC+NDBrcSYCYzjkfD5Bui32lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fcIJeGQepRIfUrKOM6gKBXvVBoJc7+MR6+y3HfDd1rS5m3Ea
	Iz9Kcqq8As02mjm+MFLNqePh3CR1raGIAn6Fw7G1LL87oZFGJJI/kKXKiAIefswSxtsr1X0LCOm
	3vLMqg7T/cZtRKHoux5/zoDtNjgUww9A18jD+6pO1RyVzASoA7/Kxabqf8+IAV7C8nGdX
X-Gm-Gg: AeBDietiSvh+nsBGxE1+jfTcHOHV2WVauXsiVo4WwiQvVftSjLIxpMYr4B3eZjViuWZ
	3jGZDUUVNB74zpgEqNGIWneMuxtdjV2q86b79S2CPjdUIzoBNN4IQscQw5YJ2tHt7+6OYbYOfxR
	Oylo5VriPiL2stK7XP6QUWFu/koYjyDTeyu/yVTvm4oMyTtXoRDRSPDILKDtLLAkOjMWN/BZrHZ
	Wl9vnipWXXQw1yha+DKrDSmIkvclHjQCUIVPi2IxZkSGp/Fdo5RYYOY5AEeaAyAs+W8iajyJF5f
	hTc1xOnvEk2VwfIRiCI+hsYpr/6qczrqcdi1ijTZoifnKKOjMtlu7t2/shjXHkCXcYKq/XIOx7y
	WYb+38frwViCE/xFtZb4OAtjWGV2JfKT2ChFj+eHJmDzlU6bgk3W1PzohLVRgR5wZBvmR5sgNxK
	YPxLj7BFC/ano=
X-Received: by 2002:a17:903:1a4e:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b269c3c5f6mr76030835ad.15.1775125692318;
        Thu, 02 Apr 2026 03:28:12 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b269c3c5f6mr76030445ad.15.1775125691854;
        Thu, 02 Apr 2026 03:28:11 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475ff56sm24425525ad.22.2026.04.02.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:28:11 -0700 (PDT)
Message-ID: <be011ef1-e938-44ab-80e8-fdbadf5feeb1@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:28:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXx7ik5qg87UYY
 ObrzeXRkh4S73pEoJKiaYL2sqncPwLxFGqOrjIGhZz8kW+YwoJnaBa9x9aIYpzICT3n4D6RquQb
 zMd4PDcAZyjbnVyA5ib9MQDrHMIjN3pflpk6EeHzoWZdGoRAkCyAn5cKQBcDLGTjhR00vZ6q9Xk
 Po39+oiC5A1FuBhChXanbbxoGwJbFwlkcpOm0iQkHLk3QUUtjKYW6auYsVfEZgNVi5Bf6fAMnwJ
 fPWnrSczBE2iQIVpYNhqcsZ28TQf4VghiAswvYVX8gmPb4VgIdBT7joAU7tZRnhOZCEqI63j41f
 WOZVVeV+mOl4F6gkYm5czHbHUDg7AAl+p2G6WzyfTF+LRl7OW4tURlGGO7nERdyEbBpaN30xp61
 J/E0+c4Ut17CB74AvkKSeQbu2EjDIGcZ7sfPXGjLEPqhh5GoDRqG9dABHjRCQlncI+AEBJNQC97
 q5oRkcZffG9WucjZJwQ==
X-Proofpoint-GUID: ZN6iFfmZps9A9PEno9cIFgeYbbhl26zK
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce44bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ex1FgqpvNLb1JEDmgOQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ZN6iFfmZps9A9PEno9cIFgeYbbhl26zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101529-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A709387B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
>   drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 4ef0d696d3d0..786cb852bbe5 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -21,3 +21,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the decode mode with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the next action with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 5b37eb10f863..4112e6a691d6 100644
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
> @@ -366,6 +397,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
> @@ -373,8 +412,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
> @@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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

remove extra blank line.

Thanks,
Jie


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


