Return-Path: <linux-arm-msm+bounces-109397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OudNUusEGrKcAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:19:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69F5B95DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB3513016ED5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7CC372058;
	Fri, 22 May 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhOWlhPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiPkKyLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F18370D58
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477509; cv=none; b=k11GXPt9ks0Bfos4kzf2rn9JqXg2HQ2m5zv4z/HJ2hATBwsCqRYEZUMA0nzKupYyQYfICKOZ4wMIsMq7rW1/uxQh+xGEHn7+H9cbBgxEGhIXaMc4S+YXVsycsgAQ15QadrzJAbml265s8TXMSGT6zzVNkJKBbWHj+zyVXwZiWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477509; c=relaxed/simple;
	bh=+M7nz02sQlaSb9wXgPlogCaUPVFoVHtTVt/irwnSluM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xk+8Mll8KUYBJTk8zYTIdPDWELVCcgeO41WdFLv/EA8zYLCZgA1NmQPwuVEBE7bh2YsHJEEl1CJ1QSMUtdaGvDje/6OIMQT0RDkVSF2moDxgeHTwJfNSLtp9LMeFKqkeH3O/sExn5btvsdxAgNDIoKDs4KB/L039JVRbotI8CfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhOWlhPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiPkKyLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIDwmV3343039
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yfeBdn9I839cIzTOxhmlrtqQXwdT6JRrFiSz3uU8HCA=; b=YhOWlhPz7Tiwrvzq
	Ws7v2hJZsA6WcU+1/L0HmDmpH45ppQdfXCkqhHQR1BO1pJXIsAMtma9wtzIqQsXx
	MuwxhI/NSQSuiSri+fb+vZXLNIsHBp0jFtQL93KK4bEF6XV6kVI2vgsMcUgEVeVW
	3EiU9sFdfF7U3H46r3PiCvi7kmqyotp6QytdKLg8m1dA4A5F5nCJyd7T2TXKYBZh
	aqUUlbozT4njPvtjj4IjSU9CsMLQ29aPfWujyYVLFFsHnextvVMb3qVpmx14hDoM
	5RmHkfLsJvM1HgvO0o5EGaEakyFcZ9FCFHBufImvUg+WB7QkcAU0HGJUcQGlZT81
	jga1xg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eav87r686-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:18:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso13754699a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779477506; x=1780082306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfeBdn9I839cIzTOxhmlrtqQXwdT6JRrFiSz3uU8HCA=;
        b=MiPkKyLEo1eZlDvAX/cPPlAH2LCLwUzWZTlDXPWikXUpIUa3m7VQvaRu17nGrPfBtY
         464yQczsGt39fe9Bwzvo4SjiZ4SJ7WCs8TmDciPCyjOztzPrFa5/0fuYazTzLNqIqp1+
         cEZhMy6eVf0gvb8I5z0fozBKb1vm+oLZtOvAYihmPurxUJyur9yS8cLvEKB2Y6S6I9Fg
         PwJOJJ0+TBEuc7m9Wl1MsTkAEmRVNfi+1XweOzNTDdvDAMoWCmBXsWGaCHZOfhmCkSD0
         BssHqLYJqB7N8LaX0zvbZOYHsw06N38KfUzNwO2ifF5cWlHzqbgIPqAUvBVRF0STDIo/
         MqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477506; x=1780082306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfeBdn9I839cIzTOxhmlrtqQXwdT6JRrFiSz3uU8HCA=;
        b=itsEgHsca67ErY2287rk/rf29Mxi8Tzfixh68bBjxniUEJEfuId2lmf2/mOafST9Li
         XFqb5+2jcF6YqxE2wurLFFHbRCQJTZYTUHngknMBXJnEtC5fXOLLTUVbGbNKxUZ5lbzn
         9gbu4lNjOJyKmG5Ddxt2FjGJ6O0mzt1N5jNsdupzcKO90/MDTxZzsHnbJDW4YISwDqAu
         WFIEnvRiOtzPodsovIIJvCv4TqRoOrYHOcnhXR3U7Q0+1HXzJCGLu86mAVLysNIq5PSC
         odcF9TtQUeMGp/naEpGWOtiez8LsOJa0GleLi58PlhuDRq+4p/E76Xozb3Qyh5mRGMHe
         SF5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Sbdko8pWzzv3wfVF9gEq8ZA+EkDLZF+FpH8KZF5kRZBLJmnj+uDqwRbnOsFkY6JBOupj1PfawQKeSVyQg@vger.kernel.org
X-Gm-Message-State: AOJu0YxXmqnRmfgqqJVXBZfK4XzFplVlFw/X65Iybtb191TbX1nyEuQV
	4z7z2Eeskx8u/uVtORTrS4OkjgBI8QPV+JCngHgtCLAM4twHei7aAAN09772CVXSDfoeYtVfJfT
	ANZcBCdCwtNh92cbJFUCGOJnwPQRnBoqZYHK/E5h3D1JGuFP8SLZTuus1BHf69RWysrAFypOB2r
	og
X-Gm-Gg: Acq92OGdb+SHHmf1Fz2Lf6ztdpiifgUFWK3Rq87e2anGoyAjY4n33b1ieUtjyLA9Vqn
	n7kqqyMSQ4p0wiPNpo67Y3Uii4el6Ggf2cQkLbKcO4G6YBwdFa5f/mD0SAz5Nx0oXW1zh1Vo6bP
	s7WSu33kMm3vMzHjYnt0IUVY5xG8AHbeNSi+5mdnEt+qNfF7AKGZD97EwKXhkD/BC0LOSGhdYs2
	HwlvgNf++O+JHKH+Mdml4TvAXwaImsC3mfHEu+V9Jg/C09RlNLH9qa7TKyxEBznhLS27yjOXdB8
	taWko1XVPi0ykLLk5gQE2Q0AKD2xCJ2puytE9uBvpnGajuPY8Wi82ELm1Ye4IQB5TxXiWXoFXSF
	iMAvibsZdovZPQWXSGLvuAZLACT5Cj5IgdUpcKyU5zwfeRUSxDag/GD5HMW8P
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr5065164a91.24.1779477506098;
        Fri, 22 May 2026 12:18:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr5065109a91.24.1779477505007;
        Fri, 22 May 2026 12:18:25 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.21.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8520560ff8sm2218068a12.24.2026.05.22.12.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:18:24 -0700 (PDT)
Message-ID: <ab1a5b2a-416f-4c0e-9384-ed0ca536d1c0@oss.qualcomm.com>
Date: Sat, 23 May 2026 00:48:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5MiBTYWx0ZWRfX4T1Fy5+dCQgR
 y7EP/Mz38jappAzksNBlZyS17OPCdgv4hxWtkLGNbeA1dASG9949bvVxAKWOFXdS+ytiq7oJRPt
 wZuCGDQWttFOH1/myANaRR/00gd8iHlgwDduwMEwfuIlIEP2nJdtExY3tg+eDTB1QrL1ayBzse2
 UTw9hwo8A9fdPsksktnaLKTM+VKcbd24gF2S8MQwPe8BFFHqI5aPaUtUCDvZaVZRZgNZ4ctRRVy
 sQnt7Keo+H3vjadsQcQzPQYJafl+T7oTvn0gezCsdyrPMvoes+ShvXgC9UkqnIi8kSzHfMsrjFQ
 /HQ8E0GoIhdz0pQ4Qd9TSYJqRPRVhss47UHdi24Q7hzvGUwaKCnrz0lUtQoz+6WVExrYICAYOw0
 yzEhwnUcgGwjShDXvGI/+vNHvJzSL+sAlvOtQ2Ec1pECW4wm44UBamMw8S/o1o9M3TaYXCbhcxq
 3qyrFPzqfF0o4y1dKKg==
X-Authority-Analysis: v=2.4 cv=dbiwG3Xe c=1 sm=1 tr=0 ts=6a10ac03 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=dyxLLOf8pC0bdfPLpLFr6A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DtaqQatus7ZMBstIhNjDynYmw-zzgNGY
X-Proofpoint-ORIG-GUID: DtaqQatus7ZMBstIhNjDynYmw-zzgNGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220192
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109397-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F69F5B95DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 6:47 PM, Mark Brown wrote:
> On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>>   config SND_SOC_LPASS_WSA_MACRO
>>   	depends on COMMON_CLK
>> +	depends on PM
>>   	select REGMAP_MMIO
>>   	select SND_SOC_LPASS_MACRO_COMMON
>>   	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
> 
> Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
> on, currently this will work out since PM_CLK depends on PM and HAVE_CLK
> but the indirection leaves a window for things to break in future.

ACK, agreed with your statement will update in V6

Thanks
Ajay Kumar


