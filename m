Return-Path: <linux-arm-msm+bounces-94790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HmTJYhGpWkg7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:12:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF81D47C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2B863002F66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5631F2B88;
	Mon,  2 Mar 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcdf6M3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4ilGxuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AB379EE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439163; cv=none; b=CNyk80Fh3duSRT+pRmNqX4j9Kv5KFvFdMrXjpt2a6Xr4jZrlsl6YiBQYWvyHX4qCL+c+8kV4LBWh1ugQ26QIf4j/amfzjbHtOKsL2Y/QbtOgaCNDmaLSkcfOwPITTfLAujhJrn0JMnBT33BCl5Tbb4U8nz9hIHtSUll7vaKN4m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439163; c=relaxed/simple;
	bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6v9tuUXMYenKUOl53MtsiKm2/6wH0HULPpkqzsj715U3tvbi+aZJpw0IcI2w7Jw7/HLmU1YCMIYX3z3FdDJ7Nd4FQmha252menC1Yfs2K1q+HWAKeiOzBhYeAPsK7dPIFVMIQpSNumpascPkLpZuO9BFc4++yVy4hB5XFLpuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcdf6M3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4ilGxuI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62280X3B2729394
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=; b=Zcdf6M3TDZSqgLfi
	2fOACi2y03BjI9OAyOXRdu+xMXNoPtWdj6Ek1x0Qy/8C4fGtH76ZW/iXVF3mWHAA
	ztFRrpNZLG/8+C5HjF+ze1OXv5Y42H48tv31J8YAeKOdKDxcmE2vUM4XHdK1SH8N
	jqX0S6BVY+TTHOKa8leb4b0QIf0+mKpOvK/3mI1ThRJe9zUEqvEukp/XDr4nbxUA
	jTo+HvAOgYjTVPbYEgaxGiCkubU/Qs+Ysfngq2+QgLtFbQ/5LSG4vly1R6QsXvWS
	TMUF1Drizz87ppE9SsMzmlkgV+Ggb5Rd3yAQJTIXDHGPAD5hIZQufb/rTITsRA5J
	nkpwuA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbatdw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:12:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-827185c410dso16657284b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772439159; x=1773043959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
        b=D4ilGxuIfa3j3PfnGkcMNeqt4t782rLpSmgNoJ+y7q3rq3ToOsohHVtfIFy6xQ/HNy
         49UL9OQwxuMS7zH8zTd4S7gUSTJ0MHp1yG9mqg8PSCqaNFpL9Ae150VchoLUlBozgid/
         ecEwWDAP6iJZ5q632Ztgbd60RKeEn/12tMroIDGZwuMNMA7v2MxAvNddnUUxU8ucJrS0
         AMhEDh91Y9or+GfGxSMrpf7ZcYXU0n8V8qpyTJi2DuBM0Wn/kl+eDU/ar5zBRMqloZXn
         TLEoZVNs0V7oHpGHPO8+IkP+Ie8y98CHTgTCtkVR6LepHaJXvd1D+FaonrNBK7sbU7UH
         edGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439159; x=1773043959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
        b=L+rkVuP11vUkVf5fzlqsb+gohDuoDRmcAmTwVEBpLmol41ERSUrJq24wc3JXFx6fFx
         lCA/RZcx/IDTrSQeKQLeiz1NnjecmJi9VIxjHvNCNSUUsiBTOKpruzRvxoPtOTTDS70N
         5y3Wu1vQZdwjotAdz2sBCD2/gUnDeJkv9nyO6jjWX1mxXGYac9z2D9PtUCqwrq4RKYXF
         28QDtaJOxd5+cmLgDumdXBRZjYTa22nLdEoL/uh/dfMFNmNrtFMVNab0EDHl6l9COevg
         COjVoTOfwRLsqxW5hbHsQyepNLuMdXuBYh9HODHfgHKPxe/cl0Yt+fcFEGl+f1vF4anZ
         TsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQI/NmDr29kyxTlywfta5D/wiCzWGHrTtBfaBtUumw6aHYD5OpOaCqe1gRa0XYDAHEAV7AZlcsknThMDqo@vger.kernel.org
X-Gm-Message-State: AOJu0YwC94vzGnnVCcbM65R9/biPe/Jo2v6k5kEk6S8QmsNomnFJteSV
	x8PFi4MWwOokz/869bWuhlJyMt5vTa7aImEDfhAt0VWFd3LZZ8oGUyq6fX7xV4ftLB33PlgzKAB
	cgJTbv68P6xJwYLSdQzU4eaeL2fM2seKHhSKicte9ZIgjxvx6iUur/GdMQgfP0vHvTEuq
X-Gm-Gg: ATEYQzyKU2KGSVxpbFng5hMS6/qoWq7x8GHBgK0jpmxg3pzPXkxn2X1AELMCzvhYw1m
	maGaJmL+gMCjYYqBpyh6kthd2zuQwiQXvIywCga+V07CF9X9cw6LAysO8yqQgWQ08C5z7E9A1Lm
	WWLOcXc3YUwfWrl0bvZRrVLwO4BFErGQwdg/tQotCeAxf4/h/jxLKxcJcZD4PqbLqiyLWQEnzmr
	ko64m706Zo6t2THHYsoBIIKeSIUpGffqu0BzKZYBlf/+8y/EziwNuSILcrmGzLjpJApJ3WLlJWq
	b9dHRuM2m4kkSl5l4qxiIq6oUn32Hzgpvou0f252WOEGL4OICVeBx7fpPoR0mdpOf3E9IWea+/G
	V0zlgIaMLN9ywPFKfTbNt636OzMt2G9DEaPWcFF2Y+4tDAHq3GA==
X-Received: by 2002:a05:6a00:414a:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-8274d8090eemr11013982b3a.0.1772439158701;
        Mon, 02 Mar 2026 00:12:38 -0800 (PST)
X-Received: by 2002:a05:6a00:414a:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-8274d8090eemr11013957b3a.0.1772439158150;
        Mon, 02 Mar 2026 00:12:38 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a060071sm12915292b3a.63.2026.03.02.00.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:12:37 -0800 (PST)
Message-ID: <7c795b4b-3a3f-47fb-9ef9-0b13601f584c@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:42:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
 <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
 <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MSBTYWx0ZWRfXyVDeBBKa2sN3
 72UBadO+ozgOS+pIlcE/XhbHXQUOBJO3jA104PIoQbc3tLRFADi9XuRZ8sAFhBKHc2ZvUbZ75jX
 /N7c8nvjV7+b1a7UjOibNS4kVSJyhGC0F1LZjKLkViEsgyQrB2X+3RlXHEfWwd9J6jmmt1lKi0+
 f8KxSSlm1WWH02N1XbYDlGtyvQbQqsQut7GIwdEIfHI/gHovN0LhUBdBWEjgWySs4Kg8lyCWvHR
 lfVaGIYcbmTmoU9r5aHkpzp3+t3mOgPWLH4kpcqp0pg0NZFbomO5+J8UgUYGtKS5fgWTn+5r9jf
 Vgh5tVz68M1S9vcaqnY2+BXZPjGYCnnQkxTvqQhy7SJGjtgr+V47WqgiaLXeQAjx3Hzng5kOHTw
 ydazTCV8mlkZxLiCge17CtvYhTM5Ww2sm32qR2vRF8nEl2GxAkjWL/Qsw4CEyDYgsYpz74pdEwl
 xPnNiqqXSzYj0ZC3a9g==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a54677 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jwkSyuDCPDQl0KFoS7wA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: tbDsSq7lUk6HYzllZyvzDkazPlPEBdLN
X-Proofpoint-GUID: tbDsSq7lUk6HYzllZyvzDkazPlPEBdLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97AF81D47C2
X-Rspamd-Action: no action



On 2/26/2026 12:39 AM, Dmitry Baryshkov wrote:
> On Wed, Feb 25, 2026 at 11:26:52PM +0530, Ekansh Gupta wrote:
>>
>> On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
>>>> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
>>>> DSP accelerator (QDA) driver to represent DSP CB devices that require
>>>> IOMMU configuration. This separates the CB bus from the QDA driver and
>>>> allows QDA to remain a loadable module while the bus is always built-in.
>>> Why? What is the actual problem that you are trying to solve?
>> Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.
> It's an implementation detail. Start your commit message with the
> description of the issue or a problem that you are solving.
Ack.
>
>>>> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
>>> Don't describe the patch contents. Please.
>> Ack.
>>>> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
>>>> updated to descend into the QDA directory for both built-in and module
>>>> builds so that the CB bus is compiled into vmlinux while the driver
>>>> remains modular.
>>>>
>>>> The CB bus is registered at postcore_initcall() time and is exposed to
>>>> the IOMMU core through iommu_buses[] in the same way as the Tegra
>>>> host1x context-bus. This enables later patches to create CB devices on
>>>> this bus and obtain IOMMU domains for them.
>>> Note, there is nothing QDA-specific in this patch. Please explain, why
>>> the bus is QDA-specific? Can we generalize it?
>> I needed a custom bus here to use for the compute cb devices for iommu
>> configurations, I don't see any reason to keep it QDA-specific. The only requirement
>> is that this should be enabled built in whenever QDA is enabled.
> Why? FastRPC uses platform_bus. You need to explain, why it's not
> correct.
Ack.
>
>> But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?
> drivers/base? Or drivers/iommu? That would totally depend on the issue
> description. E.g. can we use the same code for host1x?
I'll evaluate and bring this change separately for fastrpc and host1x.
>
>


