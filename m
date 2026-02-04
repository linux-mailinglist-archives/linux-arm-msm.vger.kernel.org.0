Return-Path: <linux-arm-msm+bounces-91824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBjdJkB3g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:43:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E922EEA695
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E00300A8E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7E830FC0E;
	Wed,  4 Feb 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQK+SFru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiVh19d7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BC930FC23
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223121; cv=none; b=u0BwXdvoBZiNGEWhDyRmmYu2SQTgPYeggrvDTyOibT8zwzD3czunMRBhc0Eqngm1dMXIm+odWyaO89ne5Za7m5jtnLh0fCmYrNyX/lZCWdzXM+iUh2q6h5r3/oZ2gzRcL1UK0T40UGRFNaPUkZFmATpTWEUagbyUjkzUxjv/Q0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223121; c=relaxed/simple;
	bh=vzkmU/xUbgH8k9umSTYH1lGGxteiG1ygk3kWIhODUKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJAQhOIz1EOTd8hgLhGPDkBG9vRhqM2xRHgc/DG2gnxDtF2azS8T6HXa85KFbvgjHOcjRCgR1R0CSMdygSJE8q0Rk9UAYppE6WVpHw1JwIEpAFtVMGBv7SIENXvbn1Vo5FZ/ms9xO2itr2aLzDzBXwktZXzqO5NsC7NG65psGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQK+SFru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiVh19d7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIOEV2159347
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsCZryUoKWz/GFMWTjKZofaphaorw+gC2G7jmNnM19w=; b=DQK+SFruy/Ai18Sc
	koriq1TCz9tBsTm3DTH70Yuhm2nGvJ3g+mM1cQHasFg6+Mgn7WA7d6WbMjc3tYLx
	/PLGYhWCsMuVZU+gTviO95uM9zoqwXaTDdHBG3X6U9C+UANAg3NT/yn17AK6HusP
	v+68Vcd7v9ks9OOVf+bemnHPoIJJluZDsHlIhh0vDb7pPrGLVv2N6oDi6pXey5x4
	JW2Yj5IgamAEJjo8nMJsPOU3GmpMv1jRiq4jPWke7G7lnbdXal7GbPnAGKgAZ17E
	UpK7DfHckY7owZqco2Yh9Ip8ryF0DCqqC1tLoJCIPB1uIPzPA0MVdh7Jjz/hpnJn
	lj+1CA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvgw3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:38:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946c23cf90so81836d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770223120; x=1770827920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsCZryUoKWz/GFMWTjKZofaphaorw+gC2G7jmNnM19w=;
        b=BiVh19d7rLeTa01Qyb6cgNRjGaiMAh+wKj1yM6petq3Juip7P39lgX5hhePwQBIIe5
         0/ubkz8Wu4gyVRhDzS9H1c2C593erdnv1Bn7oXqKYZFTWyk9LaEQcGdRho0ElHe3QpIH
         z8c27IMIXEcdWHg0RzIHjOGN3pzvkvFv2/TRB7OjkNIXkbgKgvYl8RM5PAAPbSmjFoQI
         oocOiAa+xIBCM+d30tkV6yKmuFt3Snvex610jsYbnH0ym0XO30jZcHfCcyhrBjasw34t
         xV/0yHtICdmyaaTLqV0w2GRTDFkkts55++4Lm+cVJpXtDuNmuJ9jlGdQzUqYWUjyPaxm
         Yxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223120; x=1770827920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsCZryUoKWz/GFMWTjKZofaphaorw+gC2G7jmNnM19w=;
        b=n8OyaVyYGBOg3i5V3MwcF4qvm2hzmkcgJVzsxj/UWtXUNwtSQLmQcCyY+xMF6eIvIN
         BjKgZMwOCYeHlNBTTWmIISfM43sLF3yznEkOUFiVyZsA8eE63oVL3wXqHi2/3hVs66q/
         x8IA/ICvCR/EajZ0ungBTkDec7YQ7jBgyA7CrC/RIUgehF1oLGq716y3n4YcWdLQPIyq
         VOIj6tOWI80wmXrHTklY8HkrLHXZVDW1qD4XLVvnl8LZmJ1tDEmnIEn6vXflPraxkiab
         pXPh3ZqpKqxGSvqc4FK605/1Oy87Aa5WowItzLi5g3nlxaRoAaP/wEeskSbhvK/BWlXH
         jJzA==
X-Forwarded-Encrypted: i=1; AJvYcCV/k79A/jULT6m/dk2BdNcJ3RFBX5JGmciH7CZozEmRJ67C1ts8oidk0pysNAqsO+223e0XoUT3wZA3zxXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YF35c1DArkWx62ghEWvyHu1BMedxXcWnAhETS5i9bUBJLraO
	D8keAxfTdfRH2/R5tSDF1DHIpANCxUhYt9B2dW1ZShLKpsRSrzY9votlcfFVD3KgQWY113wJVkI
	qpUDK3wp/OcSKJs1opilRdnugWUwz0V+5vsMXxL/4DBEOeTzYzEL7l90zZEvbVSOEExLr
X-Gm-Gg: AZuq6aLWobRcnrPHkquQWTUfXMtk7hjMziYfUhLjZ/OrhYl9UmRVgTtpbVIKnELgIuP
	sddYESlEn69wue41mVjiVJfrLbUdkrO2tpGxjTvv1dBy6Zz9jirGunXOtrcpATT90gQVmGHLMTC
	6swiM2m7mdm8GMn6UVkptw9XekSt9/CzSnMupugTk3q5zOK3vVgLOWe+XppYwBRn3NnWg5apkXV
	7NzZm7qhexsYt13hSZU9XxzaAa/IlAoCSguPZIhEZAzqrw5VTqa09h0ccUc/XIC+PKwULarQqmI
	tqw8a2/vSNEUTa9GpnMoElhOHWb7ENtc/H6SU5+LyFf4unk5j0mUFVzxnxIArh68OMshpDnjsbS
	bZwEGEZ7/4G2jZGjJpAals/Hf2ICXQbGpq4KSfdSavho9L2WlzGe/ZFACC8dGHHAbSHI=
X-Received: by 2002:a05:620a:468a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8ca3303d992mr262612785a.1.1770223119755;
        Wed, 04 Feb 2026 08:38:39 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8ca3303d992mr262608685a.1.1770223119258;
        Wed, 04 Feb 2026 08:38:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fd4a85asm138314366b.31.2026.02.04.08.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:38:38 -0800 (PST)
Message-ID: <8119913b-c7bf-4de3-b731-dec128e65a7d@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 17:38:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] spi: geni-qcom: Improve target mode allocation by
 using proper allocation functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
 <20260204162854.1206323-2-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204162854.1206323-2-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfXxmaZCK8h2ecn
 Fk5qH9C80Xhppv40vhCeuPAYelLZL8U517EuerVpxgFwtXo2k08btgbSnNY0Unp988c6mQdwp9Z
 so8oXzhbgev15dst1qIzcbuuFlPCN/pAcFw2uBkQy8Myo8NSeA8eAnpsjydCAgPRGr+9dTDaUuw
 Mi0TUl0uYJEo80fZgJzDKhW4OmVXqcmBlWU7YbPtG3aaI/NKlh+gZvnKBwQiBZviycc02ChLQ3M
 NhGrUfNDlNyQ2B/e7Y/S0Vw3rRJ8Or937jHQmCxfBKFfelAvyiHsXRnuqVK4JsJFNE3Wggv+Meq
 0P9ERjVvo6wbhI/vhPMlwQmAZAEblbWyCUm+pxWjzI8CuoP5UFRSnvOL+znsLYD1LprhwAW2GFs
 P4uizkeMy23vpvX6HB9FUyj6Jw59UcUdKPxTzBwkZJDjgLYBV7oJiJgmJDGJsp7kp2cb602UPx2
 9LDcQdDZbkqXw44ILfw==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=69837610 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zEteQ-CndN1-B6i79MQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: IzX5g_-r0fM1ZzZV7nXcX2rGyFZznoyJ
X-Proofpoint-ORIG-GUID: IzX5g_-r0fM1ZzZV7nXcX2rGyFZznoyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91824-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E922EEA695
X-Rspamd-Action: no action

On 2/4/26 5:28 PM, Praveen Talari wrote:
> The current implementation always allocates a host controller and sets the
> target flag later when the "spi-slave" device tree property is present.
> This approach is suboptimal as it doesn't utilize the dedicated allocation
> functions designed for target mode.
> 
> Use devm_spi_alloc_target() when "spi-slave" device tree property is
> present, otherwise use devm_spi_alloc_host(). This replaces the previous
> approach of always allocating a host controller and setting target flag
> later.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

