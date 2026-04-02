Return-Path: <linux-arm-msm+bounces-101528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MUYEFtEzmlQmQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:26:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D8387B34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D0293024D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12493A1CE6;
	Thu,  2 Apr 2026 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSS/ZwUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAn0kDk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628CE37C91C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125590; cv=none; b=Xr8LAF8iZUtWaPI0scRTO36HdZyZs3FAV1ihINdgENCfdNg6vwmxV8UTiJQxbce2I+R6GHgWKgXw+ibfPG99Yf+nA1lzYp3xg5czhSIOisDIQ/iwTaDnrprAjqh+ao1UZrPAEosr/Lqlx31Lq97/EoqOvDJD/PG0lACP7fKgHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125590; c=relaxed/simple;
	bh=KF+dxSMt2/CfBMAymZOSzRXIJygz/hPUZI8hgcCPsa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFMEwNUKlUog0UzqULlbYwOr9/NsfnD7oLqFIzmoD9XeZ/QAx7J2gTRz5mnee5D7GhuIwggVh5ETfPshApGFCoy1rzn1qdGYjHqP8yyatAJAbXQi6PolYzD4reiPt7nubd11kXm1kANW8S/l7aFFl6XonZuLOSMvy2cpc2OzOgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSS/ZwUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAn0kDk+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63271hHe3045540
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 10:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=; b=JSS/ZwUcPQEZ8vNg
	vvc8t4n+WX+pZGIG6KB17FAWrac/Y24+80Y26vpDgjZXdfBYZyAoZ/iKJaRKH0tv
	ywJl99iT4N+oVforPggJlNx+/ygniX6PBE+PD/CyJNyrkHBpyTWVCbIJR3vaFhup
	3n52M8usjC6QlmwN6kcPyj8CBhrsr0s+/Vm5qSP/hFzRRGTuz2R5A9lXxcXYzdtL
	FluVWwd8pcgiB7dynQ2EwgbZh9sm6FEH+7RomUeQ1qVuW5BkUl1XmRHpgygMoZ/u
	Vb+gGhR166CcKrfNadfBQSdtXsqRMb+Cdx2SJPdPP0MncbtNTUrZTJEe6djJRTRD
	WExIFg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483vcn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 10:26:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23c909256so10668535ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125588; x=1775730388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=;
        b=RAn0kDk+Nb3alg296EZ63BmoD/f2VwFGjpP3/46goYX4z82/Y4Aw/yxV/5Il2KckTw
         Tgp67W7Wd21GOEev5mdRlD+xszlz4eYq+sTnbs6RlyGkFUZXC8htGdznWzM/y337HnoE
         tJ4btJvRUT1qz6YnRJQk0Ke6g52uNluof/Hg1h8IbDwT4d9SyJDzL2A8zFmxHvXVM/+F
         eyVgZQSPBHBEXJ++uFfZl7zt24sr1xIVVvS92XDVdJuVbfUPphJbaYCLAtaK3pPxw9X/
         S3pVhiKvUHoD/CM5AbVXTEao5BwHiDS66ffz53cWnDYhIqxyUY6kIXbDU77+qEHe4DSU
         CQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125588; x=1775730388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gcyN/GpR/dCMQqrSmqyH79BAE988FzRe8i1TntIPok=;
        b=Qso+tsTCDiNJt8BWjM9jxnpM8hU/8nMcUwo8sCNm+4YNFSJt9SIM1FiDFdBqizi7gd
         YNiqpvgctoBzltywwxmkWr9m0hHrgzFo9vkQRh7k9kJyjK9w3w6lvfyi6PWMJmwvbzJI
         T1rTmBDlrPBxvGnLK5l/oreknVdpYdcj9CCmKagaVwOatq8d9V+IkhA4+YRosfIZaLi4
         cSkKPmbwSGb5/NacTTKsKoelJ+tq2tmYQwKVckMYzt/7pcf6w44g7xC1nk6hisFRyecq
         PeZwbISNBfpffjaQwAs0jmORPSr0vZ28jure+ypneg0EpmR5c3UcxA3/yu8NbDaE2Coz
         cm0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSHNvbig9ZkG7Z+r/li8g1b57g9AvokBkywEz3PMlrr9JqHQYr3M2/4d6NDwXZkkt3m/QnKIGScrQ808/F@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqDKvx1SMnHnp6cDyYpv3IXhM+8MmZyy/Jj+79UpvKUgTIwns
	pug5nZNTK33jc9qwGLVbtnD/BgHfQ+VyDY9wyBO94mes+4xJjjuwNfKnThnEM8lAxS+MUezxo3i
	8/AxKF3dvEVVKnEwxChnhe9YhfeyOKgRqPzmDYpZZQQInFTiKzgv3gyiim15FukUC29Rj
X-Gm-Gg: AeBDieuAXrzCWJ0CEis45UBFXvtolnB2z1yvGnuvbbXDwlUFtsBFwL3NDFp5IfbtV8z
	0SwMtSHYhV9u6G3AFMRkK29QEEsFOxNz/EK8Q/qUXR74S2Gpi16elwt+qT8GwW5KnQy8Px3Yiat
	AP1klcoU5KPETavWe6UD61cZ7P3aT+DN66qT5LWFkkVtQa0+jeUjB3b1PcI3zvEjut6JTChH2Dt
	WPUcPhpjN1dn+8yta7xG+tEid68CRU8JC5Oiv+QHzKSOdJrraJFwz9nDmL//66i3xuQspToUmHT
	gBBYtNza+m+z1weU++aZZsMdfPz/llszpb9Sesnt+coiQQbe1gAet/tAx5J7DL11dpVCCE1ay4R
	XH+F/6ZDpzLmc8yHFBnSNhxRql4699VcUIn0Ob5WjRXMVC59jVGwI7uQVO72WtNeEy2rGtdTBG0
	gfExJYRzAlsX0=
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr72100115ad.18.1775125587786;
        Thu, 02 Apr 2026 03:26:27 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr72099855ad.18.1775125587207;
        Thu, 02 Apr 2026 03:26:27 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472ddd0sm25232485ad.4.2026.04.02.03.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:26:26 -0700 (PDT)
Message-ID: <93ac3f1f-830b-4c74-9c3f-30f6c06f7d35@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:26:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-7-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce4454 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=x5Cro-eQjQa3ufzbw04A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfX+8i/EIIcNmO3
 PzxvcYlqyvYVgP/efrGjDuATh5Zmet+3dD4glC47McGyBv07ixx8EIqQXeHci17VpOkVtL9tm86
 25yLb1OqUKh4w69qKtlE6pkALPON5hyt9KXm4lIPkq+dguoi3dFoerfj7+Bhi5X9D0d11pFJ04R
 gNaEAAhlra5DmEnIPZZvsvnZWOjH3nsOO963Vbic2+hpu2vPzCTteptyaRq1zjbxpitpDl2SuwZ
 nX0LaBVJR5q0AwvDHN4379nud5xsInjM/4nL1U3tsAU43YWqM2qLPcyekrp5Rs4K5Ba9b9nlOPe
 HNXjAdB/bW/iY4HT2tW5QVJ7/cZWLqvg8r4WwCpbrU/7oILMn/We5LCBuZ1s3ysg9XlDSVxo9wh
 VcAK6HzIGW2oOxd6gKMn9qVNVUx2cJ2SHWEB5OM9h5lYBHcModg5D8vMWxLAT5EMBgOGIa7KIsF
 mGMWRUz4UJ0gvy86KPw==
X-Proofpoint-ORIG-GUID: hiwTYhpe6Z1D5WmsEPjL6DZtQs1kbbFe
X-Proofpoint-GUID: hiwTYhpe6Z1D5WmsEPjL6DZtQs1kbbFe
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101528-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D55D8387B34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Add counter and timer node for each step which could be
> programed if they are to be utilized in trigger event/sequence.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
>   drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
>   drivers/hwtracing/qcom/tgu.h                  |  56 +++++++++
>   3 files changed, 184 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 786cb852bbe5..7a3573e03e27 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -28,3 +28,17 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the next action with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the timer value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the counter value with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 4112e6a691d6..4a529520b428 100644
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
> @@ -405,6 +480,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
> @@ -412,8 +503,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
> @@ -432,6 +523,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
>   	tgu_set_conditions(drvdata);
> +	tgu_set_timer_counter(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -474,6 +566,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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

[Nit] TGU_COUNTER,

Thanks,
Jie

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


