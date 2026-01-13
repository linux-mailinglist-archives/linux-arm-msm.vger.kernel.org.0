Return-Path: <linux-arm-msm+bounces-88765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF37D1870E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EA10300D4B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DC0387355;
	Tue, 13 Jan 2026 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTTjn3un";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjvuN1ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80C38B9B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303177; cv=none; b=QEausfdLxvre/YRcH3Luh13IzCQJYYQYLoevnTOz6kDuz4lI2taclo+ebKz+Q+OyTSJ2TYW4Xu+7Eu+TjMx0/Sk+0iUjWeQXFPWnW1uMsgZ7R/zQrsePwlkq2qtgehK2F0iethckNpCaPckwz0YF6n3oaStABuOkuvxVH7uAiNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303177; c=relaxed/simple;
	bh=iBteRzhuVjUKovQZsZr56W6Db3PAYl+XUdijpRoUdoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj3S9cA0q8K7jsQK2L6oQT0kad99yYcNYQLCmK5bfSiHFv6AuH4zCwFqvAIAB9NwQG9N+K8LlZaa97UvoL+Vro/OXcX/yaNBEwcBAJALgvp7dSukr9DwyNaLaXE6kOVXBJFviikr8JUSqfrNJu3lxnh4DlFrz986ao9LOy3KD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTTjn3un; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjvuN1ea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5gqUZ3810630
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=; b=TTTjn3unAgUSm7uy
	I0La02DOGqycxFT+QDE9RDk+ZOE82En4EOGET+SmfDPYtOmRN3G9ooW0N6pB26I/
	Mq7JCKU0t7tiowAUxfe+vQozciLtQyaSLeQFIL9xDNNr8dcKCzHv/7ChZ0S7gdAr
	HBezKGRz3CDBlsD35+mNoPYMxEaJM7phz+lPzbiHoTgjmmArgLnnqvYGWxdworLU
	js5DdNQ0BSOP7o8NsKFtu57Dd66VLeTJzIrvF6JgEJ4B1j7FIJB/SeSmmhVlvmKs
	bgTYyxkC1uBQHZ7cYIn3FqErO76eb/XxlHiZP0PvQcpA6tJA3HcMkCGUPHGWP3f9
	B8KfBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55s2t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:19:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso18807861cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303171; x=1768907971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=;
        b=IjvuN1eaDtngCBqSMYr5BHNYtNZ9D8bzcmJn46iGSLbqjMjo8Uqkb3YX7I+tKuXntv
         OG6Nqa26Ml+6Psvzl2LCrMH/tKgh/4ZgJEcJXtujTSy5m16zQmuzlIxpzjpaq/MIox/M
         Az5X4j9ywugfbg+dw0ITli9T+GjaD6Tf5dAF71zKzRFR5FzpVBVnLa4bhsvM3xB5PgIz
         f/bjHTAzEFxrqAoKbpbExCd0uOvLIX1E24mAbXEGCjS2gDQCnR7TtWLUwBHCz4waPa2G
         FHTo1EERreVjCFHo0IGoCYXDhR8Uj29/h7a66ABnkpB20jopYwu55XDfKB9pn+tNg6QA
         ZGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303171; x=1768907971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+067FJE1YSc9YVkN2T9ygwB7jd4RPMgD/BH7GSACzSI=;
        b=jPgSMdSjl+HZMeJrbutgkMLcb8x1B4Bn0ffnjGYKvFu+A23w/tchYNKJK/cF9UihTo
         uLYt3DqM+nuPbekmeAfPpWYd4BwbQxTzMnRadsXSbF5n1D8RD43Xt/2RPq90ujDNus8v
         owiyuRlI0yyX6xOVg8IPvpra56/I/p1UfO/DZOu+LoJEjownT4ohOwCeW4W2yRrLQIvq
         fqFR0NjztMfIuXVrwydXqvPlHvrBx8QUbsX8R+eHWEc/Go3Ie9iJBZBL3ux0qcx2rQhE
         LGhnbSWK3s7rPkLyVBgkd5P4pS6jP6KRT9+iJ5HZnit6BgIxaCib/GJAlQSMgUHRcFRs
         NfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIyNJW0/ffT4W1IsbG8Mptz9NRAkFA71CyN4ASM72BNEhBIgkHWURPuCkPKGxfRmTpau/Y2mQhrDsFHDGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIBv2Dpyc6gKKkpGx9HJI4PtH2Epc5GGG4ROnMkx2HEr2j2KQ
	NmxbGe1EZjf9p+WtrO4yCM9xCvjjkLorD4KO8X/vrpi4tuptL1EWctJ2cuNmVbVstbqFqG+liPC
	4L3exMIWl25X6+QT2UNiZJcE7FUu8BudKhiO/O5o3vEmz3KWpvJ+q/I5kINNrSltIDC7g
X-Gm-Gg: AY/fxX4qTm7a8pdAqd2nbhNoHP9iE9pk6k4yTOUBO5tFaz9c575t/CQwO6pinM68QaN
	RZ0yM5yww2vPeM7ee7bV4IcWXdxq1SEPI6Fgz7Xqodh9SrgMpM1F3lvc5EdmUoRXrPnITrjQr7f
	t1fIydGfTP6UW4DgvFcmjkFGa9AjkDb9jwyNfZN2p8bKVQph2EUVg5oRQyhMNCvgXpr4BBT5tu0
	+8IqTUHXWAgOkJm2e2d5hF4KW0E/FKfpDHsXcRYEplKKsQDfsw5GNm6XbZuLNLwd+6g072Uj5ME
	bEiErrQduJVA7UVscHgd6S4ouCKae2NTeAKxgZu3RvC5vD0ASe1Z6MQu6EOReXZ9oIqlnl9UUxD
	QZmJfP4lRL7uKeDw8sjiFeAnU10uFKWguRXuM1CvIjr9A2mdHpbqbupEKXPxjqWQuGNU=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr227003801cf.1.1768303170868;
        Tue, 13 Jan 2026 03:19:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBaIEoMj8LfHl/NgkrhjmaWz8P4907NXHKNWZFwZcaH7zOvWKqQ1r+uQU7MEguvL/cQrN4zA==
X-Received: by 2002:ac8:7c4b:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4ffb47e2d4bmr227003491cf.1.1768303170411;
        Tue, 13 Jan 2026 03:19:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d44bfsm20060625a12.8.2026.01.13.03.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:19:29 -0800 (PST)
Message-ID: <05637034-19f0-42cd-9352-3daf80ae4a1d@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:19:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eTxtPKsdeyrilzgFqTOxbrGW2ORimJhg
X-Proofpoint-ORIG-GUID: eTxtPKsdeyrilzgFqTOxbrGW2ORimJhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfX+FKWgXHVvYFe
 FBP3DUfE526brMxjxrBOLQPQJZ8zSogaWbCF4jAxBD+N6wHbg9u3wj9PyVDxEsL7XOZVpi26muN
 f6oIMKdqzJfwl2YU+s2xS2md7S+BjdwV7YD2MTSvr3t3h4NRFb3vxhfHcuNIq3HSFpR/2UnUhVy
 03gBTkL8tXZ4Og/tnbVETziFweHVv+o6/jdQ99FF55tTBiuTDEBjiSD5nTZj/u3aCOg9Yw8WkoP
 GrQzc3KX3fby+pdJa/XXoJX6HvVtN/u45eLJ9rGexG/C//VC+KoKkoL1XBaIT/4FaXfPhzZI6nY
 ZylghFMIoGGBIF7cgbSzlKer/c+j2eI7pJXfjG0LErJCC7xH1aER8hS+/CsqD4M3VvwcAhTynvk
 1N0Rsc9KEvI4Ru3XrBCC5Ibz2BGYYxvEYmWXAQ50YrSWJo7rUX+A0cc/eouNTQb7+D8vhNZsn1l
 s99kasJBWem72v+hZkA==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69662a43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CsthYWZRQT8_EciR9E4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130095

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add counter and timer node for each step which could be
> programed if they are to be utilized in trigger event/sequence.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
> +{
> +	int num_timers, num_counters;
> +	u32 devid2;
> +
> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
> +
> +	if (TGU_DEVID2_TIMER0(devid2) && TGU_DEVID2_TIMER1(devid2))
> +		num_timers = 2;
> +	else if (TGU_DEVID2_TIMER0(devid2) || TGU_DEVID2_TIMER1(devid2))
> +		num_timers = 1;
> +	else
> +		num_timers = 0;
> +
> +	if (TGU_DEVID2_COUNTER0(devid2) && TGU_DEVID2_COUNTER1(devid2))
> +		num_counters = 2;
> +	else if (TGU_DEVID2_COUNTER0(devid2) || TGU_DEVID2_COUNTER1(devid2))
> +		num_counters = 1;
> +	else
> +		num_counters = 0;
> +
> +	drvdata->max_timer = num_timers;
> +	drvdata->max_counter = num_counters;

int num_timers = 0, num_counters = 0

if (TGU_DEVID2_TIMER0(devid2))
	num_timers++

if (TGU_DEVID2_TIMER1(devid2))
	num_timers++

etc.

unless you want to guard against a case where TIMER0 reports as absent
and TIMER1 as present and you consider that invalid (I don't know)

[...]

> +	timer_size = drvdata->max_step * drvdata->max_timer *
> +		     sizeof(*(drvdata->value_table->timer));
> +
> +	timer = devm_kzalloc(dev, timer_size, GFP_KERNEL);
> +
> +	if (!timer)

stray \n

> +		return -ENOMEM;
> +
> +	drvdata->value_table->timer = timer;
> +
> +	counter_size = drvdata->max_step * drvdata->max_counter *
> +		       sizeof(*(drvdata->value_table->counter));
> +
> +	counter = devm_kzalloc(dev, counter_size, GFP_KERNEL);

devm_kcalloc, perhaps?

> +
> +	if (!counter)

stray \n

> +		return -ENOMEM;
> +
> +	drvdata->value_table->counter = counter;
> +
>  	drvdata->enable = false;
>  
>  	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index 8c92e88d7e2c..94708750b02d 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -11,11 +11,17 @@
>  #define TGU_LAR		0xfb0
>  #define TGU_UNLOCK_OFFSET	0xc5acce55
>  #define TGU_DEVID	0xfc8
> +#define CORESIGHT_DEVID2       0xfc0
>  
>  #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)

This is NIH FIELD_GET()

[...]

>  static inline void TGU_LOCK(void __iomem *addr)
> @@ -197,6 +247,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>   * @max_step: Maximum step size
>   * @max_condition_decode: Maximum number of condition_decode
>   * @max_condition_select: Maximum number of condition_select
> + * @max_timer: Maximum number of timers
> + * @max_counter: Maximum number of counters
>   *
>   * This structure defines the data associated with a TGU device,
>   * including its base address, device pointers, clock, spinlock for
> @@ -213,6 +265,8 @@ struct tgu_drvdata {
>  	int max_step;
>  	int max_condition_decode;
>  	int max_condition_select;
> +	int max_timer;
> +	int max_counter;

num_timers, num_counters definitely fits better here

Konrad

