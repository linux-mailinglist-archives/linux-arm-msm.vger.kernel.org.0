Return-Path: <linux-arm-msm+bounces-117534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tr2TC7v+TWp5BQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:39:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3BE722B84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="C/M4JIKG";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eqW0kbCw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD01B30CA2F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C0A3F4848;
	Wed,  8 Jul 2026 07:31:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221113DEAC2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495900; cv=none; b=WLj/ILNiTgZtzXv1KpUHim176/Q6cvnXLDC+eggXPxRYNCLYCJo598HipHPb0uLeD3LsfbrgpqngLBjVddSb1ELKLx3jbavqtzuf4tVg1jSmQZHIoZnDhejE+lvRwvFqFXgNXbrw6rRnVjsCRYPAdEvue/4qTOtnZyKE9g3T5ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495900; c=relaxed/simple;
	bh=bRHwrAZC93czbdFOntiYykQyXzYF6wbZB3hH3rMeWVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwWaAyD621ei/krrIiFFgeZ9WRrUB5BRePb6Qq/W8NbeD3CNj8B3ZIgPnECaEUQBKRrrRi3YlLTjC2J0l3Fc+/WCMiYR71ooUOm8+PZ2cuMtbyGiTnfSAcoE9SJHA8tN/wfk6oIcPdBiO0pxEQQipKzCxoaPIW37CKrsK/T0jAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/M4JIKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqW0kbCw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Wcj1638178
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=; b=C/M4JIKGO2NdUVBX
	Yyc2Ob+dgO752sXwa9lwqIS3Xpd8DWTGhiBfoWgFP9kiC+yspWQGcIvtcGMkcr4u
	cXhlXn2J+Hp5DSM7ocJvD60KZbv6y4qhmzlj3QlOvN+9nOwx9mOlWlKDXp3aN8VV
	EWNLQKw7VJ6DPkWTcWS1HZQM5xOuLYdPSqnpSJW8fg6uh0972TBWt7JDhR3ebwA5
	Js/00Is0Lscvy4qRTMDXIWNymISI04g4OJ8s1hFfyvS+FR4Eu9wZoAwZkKOTjwpB
	qGF57FXByGddRp5/qWJU1AMxxz1+s7WU7Jb6kIPalQzsVBJDahr+ae7DCXDbsnOo
	e3pOTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a9dd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:31:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so8097191cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783495883; x=1784100683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=eqW0kbCw4AlzE1n4nDuDs4U0F0ECD52EmpCQiIl9we8Kvfo7dg6gXFPztsoBOTc67Z
         Gd+QF3xdZ1oyyKTk3VRI32dGBwLM4XwJcHBsgyjIrXfngsP8M0U9GZ0fpGxt9FR4vkE5
         B+eDq/rRqHLI6jQSI936IJa+zsTLLijGf/HnAJGIgfvY3ZSm2GIisXPztFIttFINqnvg
         Gpc0OARvy7acUezP0J1r6lZ1F8rvSRiEIy9umB0ZWHZqXIBjEbytmBWwwc8eiGpx0/T6
         ArZILivBNui60myBIrPR9ctmlvwoRRUI1UBCYpHEo5JgqILVJXH71ol7Kw1g/PcRZWv7
         SruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495883; x=1784100683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=YgpCahW1TbIpBsinT6wNTjsNQLtJ1/vJpXX8R6hkPttyC32VsgWs+TOGgcpaVUy8iO
         S8KX3sqoMI+g8TbJjfuoGs9N6f/ksUWc4a2Xlx9wa9iv5oRVo0Hrbg4Syi3XL4KG6nOp
         n1SB63Y53xFZnbO00YHfNq82/ho61KgHoomHeXIAoJ5wQLHEtMd3F+AJsLooSjpU/YTm
         VPZkReQKvf3UQsfcfm7d04l6113pGIgA4ZsovA/Cu1J9ftNwJMX3w+hRCCkxnOm45czk
         TjdwCf2TPSSCqCNe1CMu0Q2N8wCy4EhUKU3F1Voo+VrVEnQxyV92gJZQ/q3nsiQwAzpN
         mqjA==
X-Forwarded-Encrypted: i=1; AHgh+RqEIv6qikQDyW7m74HTQJKQ3YRsj+Ny6OAQgOzVEh5/LgbhM/KsF0pCd2MvOuMgqT7QVylK9jAzyvsEUiqa@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfZtIm3puIn+fXhcOoCWgpiMPvqt75q1mZl8M+77/RkRKsXM2
	J6xVJSj6vR4+r9gJtcNK2LjB+EX9neBNbK5DtuoPxffvJbZLFtM1KRCkaRHyV83vDio8iMNzKum
	EnMZUqd0fS2VpMP4Ek60A+LlTC/5Bk8q6HB8VqPfvEZhshYv0pWRF7da5rRrvaco1Q9GG
X-Gm-Gg: AfdE7ckNMX1ZPJfTIoBx3Zl6sN3s3NTR5P1dhlRI7iMBeqwboo77dnnTTfCzkyRmI4Z
	pxxtWai4X8ZS0+P9IX4FtbSNSmiTVq/iJGdImrJvmGpr/CdhCatzTgL13cWTXTEW6Je7bmx1V69
	GPORn6QEXhdVj+b7Z0VxonZHrmfQCfh9PAuHEihQe/Lx+ISTG4ehVU2S3wBSEWHsNwoiR3RpPeX
	8Escyj84y7KEFQGIImj7QU9fLEbUZB6WkbNbbzoWx5NQM7NC1PvQYKagc4IYOmVI/tsRSv0ho2F
	iRSvwkqQ25cJBCbAQgrvn31kEXEQN0QM4ZRfU8p1tc/+BBdicyu3rQs4X8/xpKgKWaiDxcQO+oP
	8kDwsrl5M2hLuQo8lsvL216MWvQagI5YXeDb7oPpyXCkGJBykmeQVC1IVQ9mZtPhUrPKulAq2VA
	==
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996291cf.71.1783495882745;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996001cf.71.1783495882167;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm43480075e9.1.2026.07.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:31:21 -0700 (PDT)
Message-ID: <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260708-wakeful-cyan-caribou-35fd09@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX6kDzogtHhvtF
 hef4qnKHzEuhfFJ6HDPBYb1gEO+rCLLz2QAY3bdgaEsk0AyIk0jql4WN8HjVQCJzpnNMCp+WQy3
 MO6G8jDWMTRZnCAU0W0z2gsYEyva0A9HlPYY2FHWuWjE5sTI7gpmq1RPGBb/aAzAtNsS/XT2O+K
 2HusJZjlMGNbIc92TvNnoNlQRodpifkw4GUrvOD+sxcjz6TAZ4gPm7BcgUdYIj+J63M+/Le6lsc
 saZOgfV8Z39yr14xoqmQvQNKczQ+o3tVTMxa3Duj5dfoeVNCdYJgTaymBiaIQZUD2JN3/KLxm07
 rl2Kr8KP0JOzemrLfQDJ1me0yXqMuitffX7YWKzkYPT6dO74YjwN4iM39Y3+1X1YEcaGuhCrJRL
 qN/7kP9Mduw64tznsU1R4htaxaDg6illcwZtb5lp261kpHxn4+O8VfcZnEgk4YgQ4gTP+qOGX9l
 ++xvntZLpJxioPQmGaw==
X-Proofpoint-ORIG-GUID: 2Lc6LAuJZfALZLjCoEUxI9o0NmbsQ0g1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX05/tucYDKs5r
 xiDOg+st3SJcGA4CVO1PiyajCIBI/tX+0n7rXx00aF5rXVobumcQ2E7ymLXxp+52mw3QB29i9nE
 bjFAEniR33uR1S8YxpyVCszT7BxPWEU=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4dfccb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=PiMqHjl-x4LjNog7iuwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2Lc6LAuJZfALZLjCoEUxI9o0NmbsQ0g1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117534-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E3BE722B84

On 7/8/26 08:30, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>> +	.is_visible = t14s_ec_hwmon_is_visible,
>> +	.read = t14s_ec_hwmon_read,
>> +	.read_string = t14s_ec_hwmon_read_string,
>> +};
>> +
>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>> +	.ops = &t14s_ec_hwmon_ops,
>> +	.info = t14s_ec_hwmon_info,
>> +};
>> +
>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>> +{
>> +	struct device *dev;
>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>> +	};
>> +
>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>> +						     ARRAY_SIZE(sys_thermx),
>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>> +	if (!ec->ec_hwmon.sys_thermx)
>> +		return -ENOMEM;
>> +
>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>> +						   &t14s_ec_chip_info, NULL);
> 
> Last time I commented this looks like actual ABI break. You did not respond to
> that, so I assume my finding was right, thus:
> 1. binding is not correct (although driver should be fixed, not binding)
> 2. the code still breaks users

Sorry I misunderstood it was a question expecting an answer but an 
affirmation.

By ABI break do you mean:

  * new driver with old DT will fail ?
  * new DT with old driver will break ?

* If no thermal-cells is specified, new code will fail with -EINVAL
   -> is that one a problem ?

* If thermal-cells is specified, but no thermal zone, new code does not fail

* If thermal-cells is specified, old code does not fail

* If thermal-cells is not specified, but a thermal zone is specified, 
schema is not respected

Can you clarify ?

Thanks




