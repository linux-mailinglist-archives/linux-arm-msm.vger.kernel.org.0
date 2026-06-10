Return-Path: <linux-arm-msm+bounces-112541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2cpyDvGpKWqSbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E166C332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TgN5ToA9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HvAFx/Rw";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112541-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112541-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B01023239236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD7356762;
	Wed, 10 Jun 2026 18:11:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049434B1B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:11:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115083; cv=none; b=IIhJI/RAJVQB7uepGjM05u18G4U/B0G6Qib0Ir0czsrhFiC2yF88rCfezVGPDcq3MaDVHsKnrq86Lp005sv/NiLjqQC0NBz0V2ou/QYDK9U9wRFyv0RTh0p6Qaitzij8QhdUEa3TXLwH6GP0Zhe6Kq5ZA/4Oggvqkke2189+JSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115083; c=relaxed/simple;
	bh=rARHZonBLtdal4S9wNNeqesAoKQdJzVMfUxStkKkW58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pULF2Kw42KvqHI/vezY6xxCyBRP3RamGDebDf78Qif66LYKnISXgBvHYjKBGO2RVDeVZg+aCPZEFEwF7DOOucnhtVy5zgWKBXcHpht2yHnCXf9tds4+0IfXlXK5RJZIt9RfeV1wllMCB1FuDitCaa82j1Jek3Ks2vUQCVVEp7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgN5ToA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvAFx/Rw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFx3l82082830
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XBtQGM/dbzn9KbgmF/PPmQm4UuVJGjL0pdntzgTrVw=; b=TgN5ToA96vt0SBTD
	dPtV6Mqty5gmVWOxy2S8Gpu4TWbl+Bp2b4+Xr3iOfBVGoyUr8/md+VngDFr5896/
	gzZ8k/BAgnC8xg2umQoxooQh6pT2MKjuiLaPTh83AnbVFUVjMmCH33giqjiWrdWU
	wH4QLG/rVgKYZdl5JMuwXii5MDjBGroZXmwK5wzyuXrSIhRNiE+Dm6Y/2ONXMcsT
	dvNB6xD6NR59OqlIQOVKToOBNh/HaVqaWALIWdhKeHDTdohKxmDhF0MIiptKO1f6
	QZT0lxA/9OBQRzyGdka9Dt1ZZQ2Yg+wh7RDIiIYzs4ZzQfz7qDk1I5RlzT3cfIKC
	c3dkTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnv14c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:11:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240b58211so4938236b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781115081; x=1781719881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XBtQGM/dbzn9KbgmF/PPmQm4UuVJGjL0pdntzgTrVw=;
        b=HvAFx/RwAvJxxp/AyIJQidpad4UCsWe/u98XtA2kVq2/JcSRBh1e+aijAQ2dMOtQy2
         nzgsRlbJMdHyfoUokDdn4FQbRlie4pmr2wwZP5A/XgnT0OVTvK95nMti9a4Zzt9Mj2Ud
         2l5ib54XxvjAOKkniLrS4fX4RpeIX/rCmLXRRh4iXj93ZyMs707glZEhCrPYxYdH+fJS
         vn9z55nDuVP46dhSAe0/Q7DKdaYMWetOCo6lDG8N6ucXH/txZf07CUBBArjZPWgwW4kC
         ulFdQ1R0R59aq1XsNppd86nihkWCrAHcCjES5t2Tqy5WADMAiy9GzQy0lVKcOyxKtSOd
         vjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781115081; x=1781719881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XBtQGM/dbzn9KbgmF/PPmQm4UuVJGjL0pdntzgTrVw=;
        b=MFemjK7Rvmy7ThpJbkFlyrJgLnZKW4PkcrBelOcRcp4nW/0dFykfU0nzZctDPaoxL7
         XBwkk/T6yQigNvpg/uyTdwRSU2NzqykV0tHfECQrr36QXzHFa4qnrPRGJiejsxaAG+wh
         o4rAQO5qxx+Wo5pkB8aX/jtmJd0wigYQQu0ORChH2ltEawQnAqHEC9z1GSo1Cmrh9qWG
         Wvb2TX7793tVTJBin2zlKXr8HNO64uby1e4hd5Pzir2slEprvSZHEeAIZ8CfPVqEWsU4
         oMwCQFSlV9rvZhEeowbX3hplcKMDCuX9W2Fe0pBi42+Liiju5uJAUYEYbZwzykrQzHdY
         du2A==
X-Gm-Message-State: AOJu0YwW4oSNM1sK0/yj+O0LYeqNAUntZFfQ5b5URTeklpqu5rWPFL5u
	JaQ6dBsQYXw6zhHtrAxrQbUAAboKvjykvaPDXlNzj22Cv1cZV42ZTxpg60SpZuetXRkSkn9QH4b
	JK3QC44pBun/YTg8EXJWeC5ZDLRibewgITa9usEJyxw8YBhwVQeAx2HqqvA1TPHThuJl0
X-Gm-Gg: Acq92OEcVSSPI+Cq02ihBxUzfbo01N/pzoOtJsarT7fqMlT7Yeh8nfSdiblbhuAvBOo
	ESNkARXK4dF/d72ErupmHV59RszA7Mj9hVkUvP/qQ2DJ/nChYOe0DDY4ZTep6UDF6bBCU69X3bU
	ZdhDFp9L4StBzzKBQb9mjX8VO07L4NjcEmBPBuCVVRY0+Cf/5hLVfahgUYDEOkakm9eDTjB5UNI
	8+Z2CLMihvywR08Pvmwd8FyZvyzzAYw1cxI4ZQdXdHYfH6uoesMG7jD56QiE+FOMpx6tJ2FucUU
	763sM5AgYZ0daRvvntJaIkYJsv1e6Gyqae3NjK9Mr1r4kclW6il2tXdV9Iq1n/q3dgv3ERO3Drq
	1RTEbvdAyR6hJNs3IO1O/y4lJGnQXwdsMN1W1Rb56U9DP9lMfG82xMt0UNeWY
X-Received: by 2002:a05:6a00:1496:b0:83a:b344:826a with SMTP id d2e1a72fcca58-842b0f4eda9mr27861694b3a.26.1781115080674;
        Wed, 10 Jun 2026 11:11:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1496:b0:83a:b344:826a with SMTP id d2e1a72fcca58-842b0f4eda9mr27861654b3a.26.1781115080189;
        Wed, 10 Jun 2026 11:11:20 -0700 (PDT)
Received: from [192.168.1.8] ([122.174.150.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm31077738b3a.61.2026.06.10.11.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 11:11:19 -0700 (PDT)
Message-ID: <3aa529a2-b4e0-4188-bd8c-a6b3c5e2f1d7@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:41:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write
 helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
 <f03850f6-186d-4988-a450-e6e95f24a551@kernel.org>
 <0fc4d9d4-2943-4ed8-a8ea-014e83c74e5c@oss.qualcomm.com>
 <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pMeF3nkNjxhDbkDOHNgBov6XT7iwtJoZ
X-Proofpoint-ORIG-GUID: pMeF3nkNjxhDbkDOHNgBov6XT7iwtJoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3MSBTYWx0ZWRfX5mCbhZk+sOKH
 7H5GzwEl9n8FYrXb6AVwW6jkeh86BQFOW1oLv+kqqelDeSpmA+at9Y1/4udWqC1/eJCekAaNAa2
 XyNCb1Lo8AAkMROZcAjm4wiNqcl9djJxENLXhQHAInAGaVFRCxPaA3VIGW7kSKrIK455xFPCUsO
 F9vvHDmT8LpnAfxqaFt/QBE41Z/PDxSQjSN19w/7zSfb6shbKYReUF8sdTdZUfBgMQGKV5FIuuh
 BCMlIR9R8pZLoVySDbfcvhW41DkcOoT4iPx3eDxXL8fRRfEkL8YywI4ymZ85WcsqgEUpG+pgfRb
 dcmUbYaFO3MpkTzF6WkEnEt8AaEo44QFePYNpA+Wfg2/7ZehgKkcleyXxrrpdvFTK7Cw9Eqmty2
 D4C3WaSSBOe4QFsfUOss+mQyIVeNdfSb5zcTVELF5BlwtR0VS3ru1elItOTSaLTM5ekx3Gc92dt
 J3ZPmxJtQru5L5YMN8g==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29a8c9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ph9GlEvSy1Vz2RjkXBjw8g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wZmLNYNR7iDTIedOvHwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112541-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B4E166C332



On 6/10/2026 2:30 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 10:57, Ajay Kumar Nandam wrote:
>>> So why do we need __lpi_gpio_write()?
>>
>> Hi Krzysztof,
>>
>> Thanks, good point.
>>
>> I will respin with:
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
> 
> 
> And checkpatch.
> 
>>
>> About __lpi_gpio_write(): it is still needed for the in-callers path
>> where runtime PM is already held and we only need the raw MMIO helper.
>> The unused wrapper is lpi_gpio_write(), so this fix removes only that
>> dead function.
> 
> No. Why did you have to add __ prefix? Why do we need function named
> with such style?

I’ve posted v2 addressing this:
https://lore.kernel.org/all/20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com/

In v2 I removed the unused wrapper, renamed the internal helpers from 
__lpi_gpio_* to lpi_gpio_*_reg (no functional change)

Thanks
Ajay kumar Nandam

> 
> Best regards,
> Krzysztof


