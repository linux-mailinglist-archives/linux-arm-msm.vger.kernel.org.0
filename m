Return-Path: <linux-arm-msm+bounces-98470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBt0CASuumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:52:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 998852BC5F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D7813052474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170D23DA5A6;
	Wed, 18 Mar 2026 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7VF3BRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Olf+Pq45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3A13D9DDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841759; cv=none; b=aPDO0M6zQGrvW4yBFi0JRUquPDRYDZzCLUky8oM9LTYcSCyJ9JolGDDNLhr1vVKIkunvwm4PP2/QgZ18HlNusikNBf1aC0fVuz6+KsIZqYLFIRCl7cXA0qEH5RJOUfaG3rMk/wm3OHde8SaK6X3G/HvLsMnADenLwdPcY3QxHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841759; c=relaxed/simple;
	bh=fv05PAV17hkQFUqNEulX/CC9noOBQhH5EQS+A4uA6Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sybln5zVdPAANlZRT9UQiovDAea5cD9jFOGfypArsfmxBF6BPnYIpLja95pZHrkvcVrAGozyD4bUAJtJShumuA292j0Eb5IcMc95rd0DUQckyYs44t/JBT43enwOpVeEUD/n8b3wdOUc/7BB+xzD2jJ7xpNdKQtNzjq/aCUiwUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7VF3BRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Olf+Pq45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8JuHn1049602
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=; b=O7VF3BRWrG/KQdFQ
	E6cLNat3VbaSpuAvj0HJq2QIarYnzfbrci/C1MQ/NRDVEkzzLeJ/NnMuSWBLNszT
	UQTQFvdWJMsJtPG+oEPcSF1QvcZlRHY7ITzhvWn//meNpPqaPu8vMBdYd/gtJgAY
	czDD4tJgZrAI+2eC7xZvwY+UjzKIByKvzDnpU5K2gOJvo4YT5jkv63hm+4kFYVsy
	G0xiS4LpIyWRBNz8pCLLaTJno8lQAA0AEBjEJ12Ie32h+VKjgrXf6gzdlsnlVM2Y
	LmYVaVcenFusdqaRB4YRaODI8zDWpAe8qIUHYm+kkWIBvlrtuH5PqpZ7MDohhXtk
	b7hQkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ejr34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:49:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so1280381a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841753; x=1774446553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=;
        b=Olf+Pq45iFAGXO/h4WM3gmJJO5rMTKq1rgRR7MdE+O2wIah3Id/XRZpHosLW23v59+
         UbvxXyPw/6zbtmAPHlJ3kHa5CN1p3ZSUA0FaVeGfOqtAf7rc9hY6O/+aswkMa1AJuejh
         wXbF/alACvYX0u0Xm3VoWaIVuax8C16gw6m/qTu+Hll34jyW0gJhfwz/r7fFVTGSnc9L
         hnrn3DBI77WGJy2zNie0twQLzzbOtFmtbn7R2Znv2TcAqJbhgAWcA4z/mtsRassI4QWp
         9Hok0v17Ij6c/VvNxAx2AnDEvGqRrResNPM2GJnZrzO5PA2jNwT+mkx1r+ZIJUNJ8MXB
         EFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841753; x=1774446553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs3adY8XZxdJZ63cmDfT1emW51/t4hrCf8SyLtSagyQ=;
        b=ODwWFRoVPCmy0qjdElgBJZQdzlejAz4+ldeAmqOpU6XdOpTB6RbAKRnzCxk0zi/gqc
         NE6IzfA10pdq01PgkXzssJJzyqKLfeQFyEOad6YejR/ufzhjxDLBAgb6RB7nym2qiD0m
         D8E0bm5MHUTL8tjnRReRuu57FzHSRWyIj2vApM/neOi1Blr7TFILr+eyjmS8vBHWCM/B
         9knab/J0Fqy/0hIOTEYIUiEdJ/U57rvIg7ffatzh9pgIqOWTmcC8xd7ljmBhKagwfaEk
         eyqa8RF+KyEjJxDZt1o97b/Ohi5v9trkLNEmSYpr38xb18PCEOlxAGIPKEojnKLYtsHI
         VHZw==
X-Forwarded-Encrypted: i=1; AJvYcCUDp+mWDmZWed4czamcJKDiAHWH0aQLWVwfU9uDz+iUiWpYR3yDmxinT4UKhSCQiEtRO6OhP5kclfcmu19c@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMN1XZ01KpRC+nWlBFoyO0GgkX4mU12D9qtXlSGi8Z/8m6DMl
	JBw37kBwUlAfcwxCRMRcm41jk9uCKm3d7qkbIK5yW9kt5o3fO88jKLHAl+n8oL6+XAF71yStpL7
	2YDb/6fkqHVIEt/F6RlkmBix/p5d3aYCyDyZDO5DAFJDghOvmx9ZiVS3k1zsct+GkWFTD
X-Gm-Gg: ATEYQzyr/5oe9CJdRo71WJUwlgaEGU47TstticyBeRjN/9zbdWS3P2sfHBe3NR2jI6n
	MPhyhITyOjJtTLxJFxIY+jrmk1qGP6m85hOR0N2OdNuFIrjjtN5+URW/u9sa+4ie+KR42OWDPkb
	PTbCwS/z4NoqaumeeKGlVyiLAtQi+FSlzFTm3daheuy0jbim1fI79sWK9mVg9oNumY8s63PR+7e
	sQqdUTGf2am29OiUmwGNlXbQS7K028RBVRGfCGxkC0z9mC1MZR4JYF8voyYIUQVP5KV60JswkAu
	XF3yjSu3lWT2yj+FqQZrw8zzOINx5IRdW/NeruDwzlT1UUShfMPH0QYSEpe0GKoSk95rsq2tiV8
	9zf+Xw8/PUPwvJH/ayDAR/KD1XsXYUE03TPOVg9LtLRDN0PAKaTGepP44RMlOLHczcdZbZK/Rx3
	0rZe4uravKVRU=
X-Received: by 2002:a17:90b:2b50:b0:35b:a656:a614 with SMTP id 98e67ed59e1d1-35bb9f34357mr2884253a91.21.1773841753145;
        Wed, 18 Mar 2026 06:49:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2b50:b0:35b:a656:a614 with SMTP id 98e67ed59e1d1-35bb9f34357mr2884212a91.21.1773841752605;
        Wed, 18 Mar 2026 06:49:12 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b3c43sm2698912a12.4.2026.03.18.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:49:12 -0700 (PDT)
Message-ID: <2bb28022-e77c-4459-8b03-6ee7713798e7@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 21:49:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-7-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69baad5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x5Cro-eQjQa3ufzbw04A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX8U3KxGjn5/On
 xSjtrcRz/yTfKR1bB45O2AnSVFCmpNrNB+/xAhjOVc6pm6zwedlr3qPNeru443fEzVSxg2Fin70
 YPE+ZRjVCsb15+lwzJiTPg1BBBbThO6OJenJGS1iabb+BpuKkYGr2n9llftNljtXClTFkviHeR3
 vs58to/ZBAz8hqzwSkMtNFa1KYAIEujnXqcWzfRryTfPOPvHiLOi/S/a9edA9gkmsTonXXanV/S
 6qL1QJgeM46RWYDmH7PjtqpszEEngicj1+bx0NgVfhaqMa0gb0i2MEpdgUwZ5laQZNsBgO2KDTU
 WtecaGKtzaWYAiQ3mrq+5CNSbe6NRpRpP09kz166HS9azSEQisbY/4hF6IjrwUK0RUd1kwyCtLD
 Qt1Isxufd4Qih8uan3bxZUy6RD6aIgTnBkavbLQQH9BYARYvQHcP4hj1Er1ZhCSekpBgTgwqyOV
 UU6Uc5eHVNl3X3THl5w==
X-Proofpoint-GUID: 67twZxTrfeucd4TrnItvHoXGLFLrlDs1
X-Proofpoint-ORIG-GUID: 67twZxTrfeucd4TrnItvHoXGLFLrlDs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-98470-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 998852BC5F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Add counter and timer node for each step which could be
> programed if they are to be utilized in trigger event/sequence.
> 

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
>   drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  |  56 +++++++++
>   3 files changed, 184 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index d8431a82574a..5370882333bc 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -28,3 +28,17 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the next action with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the timer value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the counter value with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 1d996b9e303a..4539415571f6 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -32,6 +32,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   	case TGU_CONDITION_SELECT:
>   		return step_index * (drvdata->num_condition_select) +
>   			reg_index;
> +	case TGU_COUNTER:
> +		return step_index * (drvdata->num_counter) + reg_index;
> +	case TGU_TIMER:
> +		return step_index * (drvdata->num_timer) + reg_index;
>   	default:
>   		break;
>   	}
> @@ -77,6 +81,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   	case TGU_CONDITION_SELECT:
>   		return sysfs_emit(buf, "0x%x\n",
>   				drvdata->value_table->condition_select[index]);
> +	case TGU_TIMER:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->timer[index]);
> +	case TGU_COUNTER:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->counter[index]);
>   	default:
>   		break;
>   	}
> @@ -122,6 +132,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		tgu_drvdata->value_table->condition_select[index] = val;
>   		ret = size;
>   		break;
> +	case TGU_TIMER:
> +		tgu_drvdata->value_table->timer[index] = val;
> +		ret = size;
> +		break;
> +	case TGU_COUNTER:
> +		tgu_drvdata->value_table->counter[index] = val;
> +		ret = size;
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -163,6 +181,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   		if (tgu_attr->reg_num < drvdata->num_condition_select)
>   			return attr->mode;
>   		break;
> +	case TGU_COUNTER:
> +		if (!drvdata->num_counter)
> +			break;
> +		if (tgu_attr->reg_num < drvdata->num_counter)
> +			return attr->mode;
> +		break;
> +	case TGU_TIMER:
> +		if (!drvdata->num_timer)
> +			break;
> +		if (tgu_attr->reg_num < drvdata->num_timer)
> +			return attr->mode;
> +		break;
>   	default:
>   		break;
>   	}
> @@ -213,6 +243,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   				drvdata->base + CONDITION_SELECT_STEP(i, j));
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_timer; j++) {
> +			index = check_array_location(drvdata, i, TGU_TIMER, j);
> +
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->timer[index],
> +				drvdata->base + TIMER_COMPARE_STEP(i, j));
> +		}
> +	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_counter; j++) {
> +			index = check_array_location(drvdata, i, TGU_COUNTER, j);
> +
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->counter[index],
> +				drvdata->base + COUNTER_COMPARE_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   exit:
> @@ -256,6 +310,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>   	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>   }
>   
> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
> +{
> +	int num_timers = 0, num_counters = 0;
> +	u32 devid2;
> +
> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
> +
> +	if (TGU_DEVID2_TIMER0(devid2))
> +		num_timers++;
> +	if (TGU_DEVID2_TIMER1(devid2))
> +		num_timers++;
> +
> +	if (TGU_DEVID2_COUNTER0(devid2))
> +		num_counters++;
> +	if (TGU_DEVID2_COUNTER1(devid2))
> +		num_counters++;
> +
> +	drvdata->num_timer = num_timers;
> +	drvdata->num_counter = num_counters;
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> @@ -395,6 +470,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
>   	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
>   	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
> +	TIMER_ATTRIBUTE_GROUP_INIT(0),
> +	TIMER_ATTRIBUTE_GROUP_INIT(1),
> +	TIMER_ATTRIBUTE_GROUP_INIT(2),
> +	TIMER_ATTRIBUTE_GROUP_INIT(3),
> +	TIMER_ATTRIBUTE_GROUP_INIT(4),
> +	TIMER_ATTRIBUTE_GROUP_INIT(5),
> +	TIMER_ATTRIBUTE_GROUP_INIT(6),
> +	TIMER_ATTRIBUTE_GROUP_INIT(7),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(0),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(1),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(2),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(3),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(4),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(5),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(6),
> +	COUNTER_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -402,8 +493,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority, *condition, *select;
> -	size_t priority_size, condition_size, select_size;
> +	unsigned int *priority, *condition, *select, *timer, *counter;
> +	size_t priority_size, condition_size, select_size, timer_size, counter_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -422,6 +513,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
>   	tgu_set_conditions(drvdata);
> +	tgu_set_timer_counter(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -464,6 +556,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->condition_select = select;
>   
> +	timer_size = drvdata->num_step * drvdata->num_timer;
> +
> +	timer = devm_kcalloc(dev, timer_size,
> +			    sizeof(*(drvdata->value_table->timer)),
> +			    GFP_KERNEL);
> +	if (!timer)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->timer = timer;
> +
> +	counter_size = drvdata->num_step * drvdata->num_counter;
> +
> +	counter = devm_kcalloc(dev, counter_size,
> +			      sizeof(*(drvdata->value_table->counter)),
> +			      GFP_KERNEL);
> +	if (!counter)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->counter = counter;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index ac46a2875209..5dfef0afbad6 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -11,6 +11,7 @@
>   #define TGU_LAR		0xfb0
>   #define TGU_UNLOCK_OFFSET	0xc5acce55
>   #define TGU_DEVID		0xfc8
> +#define CORESIGHT_DEVID2	0xfc0
>   
>   #define TGU_DEVID_SENSE_INPUT(devid_val) \
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
> @@ -18,6 +19,16 @@
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
>   #define TGU_DEVID_CONDITIONS(devid_val) \
>   	((int)FIELD_GET(GENMASK(2, 0), devid_val))
> +#define TGU_DEVID2_TIMER0(devid_val)	\
> +	((int)FIELD_GET(GENMASK(23, 18), devid_val))
> +#define TGU_DEVID2_TIMER1(devid_val)	\
> +	((int)FIELD_GET(GENMASK(17, 13), devid_val))
> +#define TGU_DEVID2_COUNTER0(devid_val)	\
> +	((int)FIELD_GET(GENMASK(11, 6), devid_val))
> +#define TGU_DEVID2_COUNTER1(devid_val)	\
> +	((int)FIELD_GET(GENMASK(5, 0), devid_val))
> +
> +
>   #define TGU_BITS_PER_SIGNAL 4
>   #define LENGTH_REGISTER 32
>   
> @@ -53,6 +64,8 @@
>   #define PRIORITY_START_OFFSET 0x0074
>   #define CONDITION_DECODE_OFFSET 0x0050
>   #define CONDITION_SELECT_OFFSET 0x0060
> +#define TIMER_START_OFFSET 0x0040
> +#define COUNTER_START_OFFSET 0x0048
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -67,6 +80,12 @@
>   #define CONDITION_SELECT_STEP(step, select) \
>   	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
>   
> +#define TIMER_COMPARE_STEP(step, timer) \
> +	(TIMER_START_OFFSET + REG_OFFSET * timer + STEP_OFFSET * step)
> +
> +#define COUNTER_COMPARE_STEP(step, counter) \
> +	(COUNTER_START_OFFSET + REG_OFFSET * counter + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -82,6 +101,10 @@
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
>   #define STEP_SELECT(step_index, reg_num) \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
> +#define STEP_TIMER(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
> +#define STEP_COUNTER(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -122,6 +145,18 @@
>   	 NULL               \
>   	}
>   
> +#define STEP_TIMER_LIST(n) \
> +	{STEP_TIMER(n, 0), \
> +	 STEP_TIMER(n, 1), \
> +	 NULL              \
> +	}
> +
> +#define STEP_COUNTER_LIST(n) \
> +	{STEP_COUNTER(n, 0), \
> +	 STEP_COUNTER(n, 1), \
> +	 NULL                \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -143,6 +178,19 @@
>   		.name = "step" #step "_condition_select" \
>   	})
>   
> +#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_timer" \
> +	})
> +
> +#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_counter" \
> +	})
>   
>   enum operation_index {
>   	TGU_PRIORITY0,
> @@ -151,6 +199,8 @@ enum operation_index {
>   	TGU_PRIORITY3,
>   	TGU_CONDITION_DECODE,
>   	TGU_CONDITION_SELECT,
> +	TGU_TIMER,
> +	TGU_COUNTER
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -167,6 +217,8 @@ struct value_table {
>   	unsigned int *priority;
>   	unsigned int *condition_decode;
>   	unsigned int *condition_select;
> +	unsigned int *timer;
> +	unsigned int *counter;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -198,6 +250,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @num_step: Maximum step size
>    * @num_condition_decode: Maximum number of condition_decode
>    * @num_condition_select: Maximum number of condition_select
> + * @num_timer: Maximum number of timers
> + * @num_counter: Maximum number of counters
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -214,6 +268,8 @@ struct tgu_drvdata {
>   	int num_step;
>   	int num_condition_decode;
>   	int num_condition_select;
> +	int num_timer;
> +	int num_counter;
>   };
>   
>   #endif


