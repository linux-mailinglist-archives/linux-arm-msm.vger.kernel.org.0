Return-Path: <linux-arm-msm+bounces-103449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIihLRv/4GkSoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:24:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18922410A40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D6D30B5B9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463803E1CFA;
	Thu, 16 Apr 2026 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYCbXC2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgshXezz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A5282F32
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352896; cv=none; b=JcVAVUOSlz1IYrQa3eIlRhoKyHdPjqmuNRs6BCxfU7P6OU85CB1g4fATMsLDDBLNuHvqTXPKXGiXF3b7dJx3V/cuskmJMgkhch4ZpL7eiUDagNscuWky0rTHdM24UTiXF+cdXbjUBIwHSXDsuqjbc+Zgf548qyBAio+/2dBCzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352896; c=relaxed/simple;
	bh=YICVe7onyRZm1cIU0ABm6cP0eaJuEsK/X3wiAhTzNoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtrW4jcklj7M+AAn2/DYHdg5ovt1ysoqfg9aEanTXcXaMbQ7iJ0qKXN8b11+wcgCJ88zttcO0t0uJ3yKia8ptC7iy3Xc2IVdRacjrdDjenpW9PdC9W2lnhd06ScNBNgmYllEf4/CafCy+UK7zB+34wcsR1BBjN9r/8ypXe4DAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYCbXC2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgshXezz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCN3u82653581
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=; b=AYCbXC2mXQiuahsX
	Q7/stFtLHZjHs59or3bQVxEohitjkd6L1fjnTGb7RM4NLrTLiJzk3kW7TwUtP05h
	spk3InPE9WM/BqSV4IptViyyykNpVrdHrQHU0v5epM52rwMfPZjQZkBUF/k5hS7W
	/EyCEW12JRckofJtjT7W5uUSoAAU7jGlrKx/HO3qmmPjBm5PXatz/kvdBG0d0pYH
	6iPEDDghVrb7A5Pp46Ftrhk0Bn7PSYXRg1vhEi5rCRHLd7BWPYqcQkyrtFmUhLRl
	QlrZPOpbLiFe20gR52gaGbF8HXniSJSsEJU4YeQl1ohoJITdwUNVWGFRJJHvjBcJ
	V79Ziw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuhw40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so524809137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352893; x=1776957693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=fgshXezzmGPVyTyW4PE2kfYFg7Ua/iXV/1Ux8sN9tH+2eqlXzSoUV4SRhSMk5UPpIP
         XEccPHWftZYLoRitqYDlsELFo38f1cAJ8K5iqxMn/7V2fp0ov7RswinJ061+Q6xWuYyP
         zn8ndcio/AgUovF5COuymu0T5K+fNt0nckDTOTlbVTnwp7lizTRUjmsdnwKTkNiyTQ18
         R1C+5KrQbgdgeAIW9iRD3KqdfGWHkQS5U074G/5t+XjvQ+iaPC5lQVAwyVkn8xg8mqkW
         bxZ8C+siF7wLhToSuLyr/MZHNSYcXrQJ72Pv+sR5vPobUdF4qj6uExCxt4jdlulHkTX1
         5Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352893; x=1776957693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=TsdKUTgs2Uf1q51qaYiy/PVo/VE+iYcfNp1k+mfwg9F3pH/zRxNJMevhEVpWSZrKoc
         rFL5Avvl1FbdVg+jmfetKWipRBJhMCtmAeFUk8YdGDwAn+QlG5wNWWTP71BBKNcK/HdB
         cUH38lEwOPC3lGgFxhB2LpC1G18ZZBHQ7Nb4iA+dKBo83BqBU5o588Xv2HOcRXxhElJt
         wFUt0ndW/0CPjHVfg4pE4n1grXcWeP1sK6Da4hPlsCxroVGBwza5oE2O3I2paJ++P2y6
         z1tiLCDTc7GABZ5k5n8Gq1MYYjMUGOc9Ln8Tnzs7SfYxDJXKy92tSFpI8YH6AJSM2gTW
         rlhA==
X-Forwarded-Encrypted: i=1; AFNElJ/J7HZeDgsqcywveyy6/9eMNS99Ui1I47jS+u2o+EW5pLGwlZkTYyj7lOSnuy9Y28e6p3/5XMkBPd9LkLhK@vger.kernel.org
X-Gm-Message-State: AOJu0YzWX/MuehODO1GqfLXpudgTdwq6DBZ7aDamKtdF7vrcdbNdLr8n
	wZJmUf32I7UMPk+yjteb2qCpAIJj2LIJNv++Yr16xbew15SikL+mMDSBH4nNOz7YQ08r23NSVqK
	fVicw5KWjZaKCKLKqh6wFldqsihC2VTH1EvLpC1y6JcR87gqXj0es9k2Am7XZEeetlh33
X-Gm-Gg: AeBDievb1xNeIV+UcCK/Bjcb3g2IIFfy2Y8AQKSEh9oRwPbrw6RMFdtoUX8r0zt3fto
	tlVsb1pRBO18EDxP69e/7Ug7dbcfE6Bm2oajHoI7vJ4DKXVzcaxADxJYFAvuz2te4Fd/fGilIMn
	ii2G3Draw9y2mXMwmP6MZ01yf4BBxZTJ+Fk4uwAwbQMkxFnPWoNkqezjJ53IchG70lPAu2QheLu
	Zxj7NRKOERagQEAv6K3eBx4+6I552i/U9ntkAe9uWaikNn6k003fHvApDRId1jid/Ywh+W6MOWA
	2fiAHfcuCsXobc9zx8uLs87rWXIMQYKg9UQXxfWnEhsHi+AaRMRYPvAg9Iby0EIfnIyPkDTr0gh
	1FMkVllbQEJ5+v9sArgckSxQCf/qJ9z412kIqPGG1LqyK5pThwTEAnl2u7iUvwjNJ3JZsp5MQKk
	fNspals4E6eRU5VQ==
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490405137.8.1776352893492;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490377137.8.1776352893012;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d57fecsm181221066b.22.2026.04.16.08.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:31 -0700 (PDT)
Message-ID: <23574203-187e-4fd4-b143-e53ae17a7a00@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/10] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RvpBMJnOi57HB-e64Tc9qXvrAvDIOjm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX4vxQycsm+Vr8
 GcZ7V1KunU8ILuu5oGSG+EwC1qjGlsb3zyzkldgfAo1foQB9DGm178FoCag0aNoJs76wHtaR56J
 uSY6El9m6Rh9edB5F7ZcmTznV/SDxdLOHu3c+/w08dBpNcCV7LJgvpPqZdKLtj+/LvUtOmPst6B
 zNcaa8t0Z7AKv4VqaidhPRyeFNdM1ZZUByTt39Jv+IuLqjtBYhbV/avBIRThFCVZ2uIsxJEIR1p
 X67mGtl9h5pf6K7tXmStfkSlPLrtcuXSLUdUTPIhwX96LqN0x8p3oJ596wexREmTNOQSWB5t12k
 tveMMEQKU0HIWw9CBlxVMrbQmPEB9N+QSrnjr82Z9/tMurNhtW1c5oDpdsNQbmRtUW6XP4j7Pt+
 bROiwQQEr0kL6OCfX3uU/CcN8HCpx3VQauyj6iyhRnOSi5fCwVyQV87FQad4j2NKSYJk3OC8Hzd
 owxajP95SDIPdS5cQGw==
X-Proofpoint-GUID: RvpBMJnOi57HB-e64Tc9qXvrAvDIOjm6
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0fe7e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=d5ByKtP1W7CnrCxYHJUA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103449-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18922410A40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to indicate that they are hardware controlled.
> 
> Because they can be switched off at any moment, also skip voting for
> it so it can be enabled later.

The second paragraph bears no connection with what the effect of
the changes you made is, whatsoever

Konrad

