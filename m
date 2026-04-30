Return-Path: <linux-arm-msm+bounces-105279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHIINVLV8mnIugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 06:06:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9439049D2DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 06:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 237CC3009E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 04:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7A835C185;
	Thu, 30 Apr 2026 04:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsbmxPZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2hauQ/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54A3314C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521983; cv=none; b=S2mTM4DDJGkSNPytCbz6dCxIIkPcSlw7AqYmKyqN2oZKmaAL8VqdHJUPfzSA7+8RAaELZ9wlj4q74eKyo6t0doZkhdIaweDqkR+NgO+Ea7FTlqcAtbCrDx3LGScwHgR55qgG0X8U+ZwcEko0xnnowlRFYsuDptSkIips9/zCEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521983; c=relaxed/simple;
	bh=0e11Pnpm5SwV64UahB9uhHEjjeqUnHTUBKefyIGU/hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suLfqRyzX5k+YPLoM6vPlARC9m5wBNZNaAFXfQWT1HWL+NBtCSjFnQrrg8AXussFnSmnvD4GIGHhwXT5880jlPdyvdOsiIyK9b+Lx07lbDag/bj4I89dzfDAX448AK/HPFdvOTHfcfvISywJTYfoNdMBOkyMKC/8jb4MwXbUg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsbmxPZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2hauQ/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbUjm1809670
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7cR6oAIgrpllJiTWf2waXufOwKUulNvBm3kCTfp1rA=; b=CsbmxPZo1EVLNo1A
	thsUvYilu3ssBHzGEeCR/ajw0EXhO43ZaTXEClcYGJNepqaLqa9ECABOgp6PZ1FF
	3W7TohWB4KXID0AK59D8/PM2TasUW0hlFVnHbSXawexTXDDUzAFnnou1GXu+CKRU
	zsaJxKkTAjyp26KfAFO+y4ls2QsMKGLwkfKsR7O7x/iCUuMqvWOh5Xb9q7nkFwH0
	bmHNJQ5QafWIKZVLMosIC7vc2xfMz69T3+0+pnjZtzWXjCGwQDubnNxvJ9CKkilk
	T3CELDKSQCvVeaJmKEDaxUfZSh6ITy28UEMK1NuxfiWGWE9gZ99FmKVrkDVOisPZ
	D1cMoQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6tb11e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:06:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3648018e142so520749a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777521981; x=1778126781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7cR6oAIgrpllJiTWf2waXufOwKUulNvBm3kCTfp1rA=;
        b=F2hauQ/EZqysV08gOtDh83PQNrh1hq68Q/KZkmEqso6UD3mXYkCzBAg4a3KZ5cxsc+
         vy9/pF/31OUKIkH+X07PYfHn2s8CWaZ8FAQEBF4tsFIfdsSBdftGpkFhaYfnknMbSMgM
         47EqE1medeLBUe80M9D7rXJChPiaqN7XhNJ1pLChCQzzk9b3SBoLU7bc+gIYYSPO3uU0
         nvEQvExxHstcV81XBkwWMD9HpdBhA09QndPp9HQxhfU/qTW0qKu34yd3tRv02+kEdJW3
         7+XIX26N7fnOgTfIzR93Fnttij8jynmMX3bDeKcyRAOhUH/Rhv3uj3PmeWx8cZ4f0y2L
         6y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777521981; x=1778126781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7cR6oAIgrpllJiTWf2waXufOwKUulNvBm3kCTfp1rA=;
        b=OA8qJrYrYctZPX9uL04a3BAjdW3ynolNbNGhp/TO5raD3ys6zOnHa7y0t6g5sPzvKk
         KUX0QEnLY+zsqRgqnw9E2J/lwlibzOqrEWOf47GYCL/7UJB5wO1tDgLmddYJGBNSGHjE
         hsMjy52EyfVwawhfX8igoFvwKaFapEdTaEElntV0snTKSvZPF/5tdLbIktyF9Kn69MpZ
         W/Ot7NkS55epYP4yKuUc1+KieOJEeFgwTrAVRTkO0Ph3qMHGMUXXN0SDueglh3grVUDi
         MqWpDfp5tnM5582VHtVnLwqr12ZAhWCwWiN9lVOgfepM6QXLDBqNiGYgBYpmw+9uEDDC
         SxZw==
X-Gm-Message-State: AOJu0YySYrGqbxtZnfAZD4GwnnF/lipamTpJG8qzeC1uF8XapFf2go11
	s0+MwCYtzGTDxdDjanvir3hw5G0LbhhIzo4m8aI6/XWKqAXjHywK49J84Ha1D/11z2KbOyS+tOE
	HYsoLqOlJAAkualgommjojPzN0jQeYhiZ9iKPMRxKQ86ILE/a28+MJnh+cbOHA3VbzrFr
X-Gm-Gg: AeBDietJWKqhz0NC0wijafIv4kbxP8/vDZZntUnDmJXaf80XFZrTv3Un6z7SYF24I4h
	NsPPD7Xawiz9C6KKoI7Iy1B6sjN6A+Q3hykP+lVbywl9CO0KyqJ3onGJmfKVZ9WaWLMA87KQT3B
	Q1uhp9xUPNRaGqsIFaF+AgOihu8MfzHrdM1AwGKSA+VyhQGle5+FmZmnMLZaBMOm3CysvyY00jT
	vsuqsIkvWhrUJ/0ab34pevxsnMEcddNDrnGUEWlycOGtZ2jAwdbZMom6hNyod5o0RF9t/Ob661x
	eyu/++B0ll0GMGyGJuzFrgqcRFzcZw6R8lVR3cdtsiMvHWIVOaH407nLprYkieLaDszlK3Ag1m0
	Lhqmg/N4u8Z6xHhYFH+x22T5/lujRRJU4nLOMO4Sh1mikzKzO8ddb369bjIXlZA==
X-Received: by 2002:a17:90b:2d0c:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-364c3104209mr1142835a91.20.1777521980628;
        Wed, 29 Apr 2026 21:06:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0c:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-364c3104209mr1142801a91.20.1777521980161;
        Wed, 29 Apr 2026 21:06:20 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a2a30b09sm1778604a91.13.2026.04.29.21.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 21:06:19 -0700 (PDT)
Message-ID: <38bb1b79-67da-4a23-a0e8-3c3da77933d7@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:36:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WAaVznt-mNu7hxJzGlWS9jhn9COM3Xo-
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f2d53d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BREym-YhMsu58vtCbUAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WAaVznt-mNu7hxJzGlWS9jhn9COM3Xo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDAzOCBTYWx0ZWRfXz+S8ilPg6mKW
 3j/ZwxM+tXhvv+WXQYVWRJFYSBfZH5GwOlm5qL5JoPAqedaVrKfb+FYBGa3lTWsJgShY2llALlS
 3JF+BqBYmFXtIRNwgHIRUG6ABiRZ5csvgou06CdJZsfIO+jen1sfahWyFxC6o5ogS1d4PsdGeBK
 uL3oUhaPHZfTH2zNkuvSSWlN0P1TOaICO7EjT1Frc3lLOqAdxAh+V28IcxKe4uLr2FW3QLlYoMz
 EA0jSB2xZzNSO2I7Z3BVeCW3Th0JrmJCTGYIUUWnzkwjgspk3XAVbR1U9kxEsFbRI3zNCmjV7Iw
 1iT0VBGyDCoVDHGh0Ix6jtBw+sDO4cniyI1Vi7pT3eXs3oK6XhaBOPoLU34Jbt0tqel2+KxYlFr
 SHhJxqFSQBcQjZDdrn3cjgCpauhPnRbcewI3B9/Ws9VcJzatpVZYtgsGEdTu7YXjSVqiXvLD+pa
 bdQVb6ytiQTJQtrevcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300038
X-Rspamd-Queue-Id: 9439049D2DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105279-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 6:41 PM, Komal Bajaj wrote:
> Add pinctrl driver for TLMM block found in Shikra SoC.


[...]

> +#define UFS_RESET(pg_name, ctl, io)			\
> +	{						\
> +		.grp = PINCTRL_PINGROUP(#pg_name,	\
> +			pg_name##_pins,			\
> +			ARRAY_SIZE(pg_name##_pins)),	\
> +		.ctl_reg = ctl,				\
> +		.io_reg = io,				\
> +		.intr_cfg_reg = 0,			\
> +		.intr_status_reg = 0,			\
> +		.mux_bit = -1,				\
> +		.pull_bit = 3,				\
> +		.drv_bit = 0,				\
> +		.oe_bit = -1,				\
> +		.in_bit = -1,				\
> +		.out_bit = 0,				\
> +		.intr_enable_bit = -1,			\
> +		.intr_status_bit = -1,			\
> +		.intr_target_bit = -1,			\
> +		.intr_raw_status_bit = -1,		\
> +		.intr_polarity_bit = -1,		\
> +		.intr_detection_bit = -1,		\
> +		.intr_detection_width = -1,		\
> +	}

UFS_RESET macro is not used anywhere in the file, please remove it.

I assume the macro keeps getting added since the file pinctrl-<target> is
fully/partially auto generated. Would be good to fix auto generation to
avoid getting this added as default in future.

The unused ones were removed via [1].

[1] https://lore.kernel.org/all/4429f44e-f7e5-449c-824c-83daa339b383@oss.qualcomm.com/

[...]


> +static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
> +	{1, 9},    {2, 31},   {5, 49},   {6, 53},   {9, 72},   {10, 10},

It would be better to have spacing before/after brackets inline with other pinctrl drivers.
{1, 9}, should be { 1, 9 }.

> +	{12, 22},  {14, 26},  {17, 29},  {18, 24},  {20, 32},  {22, 33},
> +	{25, 34},  {27, 35},  {28, 36},  {29, 37},  {30, 38},  {31, 39},
> +	{32, 40},  {33, 41},  {38, 42},  {40, 43},  {43, 44},  {44, 45},
> +	{45, 46},  {46, 47},  {47, 48},  {48, 60},  {50, 50},  {51, 51},
> +	{52, 61},  {53, 62},  {57, 52},  {58, 63},  {60, 54},  {63, 64},
> +	{73, 55},  {74, 56},  {75, 57},  {77, 3},   {80, 4},   {84, 5},
> +	{85, 67},  {86, 69},  {88, 70},  {89, 71},  {90, 73},  {91, 74},
> +	{92, 75},  {93, 76},  {94, 77},  {95, 78},  {97, 79},  {99, 80},
> +	{100, 11}, {101, 13}, {102, 14}, {103, 15}, {106, 16}, {108, 17},
> +	{112, 18}, {116, 19}, {117, 20}, {119, 21}, {120, 23}, {136, 25},
> +	{159, 27}, {161, 28},
> +};
> +

Thanks,
Maulik


