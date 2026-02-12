Return-Path: <linux-arm-msm+bounces-92705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFzuMr7fjWnE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:12:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF412E2B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D54930927DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29BC35BDC6;
	Thu, 12 Feb 2026 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCldyK3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRkFyxpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF4F35B65E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905439; cv=none; b=EVZhkW5NTthna1Ry0vCtdbTdTYxVKBEv+h9kn7IEP0lEfi2rYF1AvaB9Uj75gKKp81M41B8wVn39GTuGeRChUK1P3XshYIVtPC4fmaFWdrwpgVidfATcGTZmvHoy9GC1SKmnDeMq/ZUPp8Ia4Xt80M0kxbxU9S5XF72ODkhXkDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905439; c=relaxed/simple;
	bh=+ZFT5SSN2ILFuJzTHHHAp8/wqo+MvjOgY1kmQeZuIJE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GFpe7LvE5NbHfpt3OQoZhUY93Kx2/R/8xNaemkcUw5YINHpVN/sPTJdsKHjtl7EwgvcdR5qomcgg9UL1++uUVtNiO1F2YIiTLcybfzVE5kGKTAetinHvAbRfOLQ1BcTai9Rvr6Vs9TMQGgtdCGnY2n6/YrZyuYBWhrskVHIP5lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCldyK3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRkFyxpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDReHl3844089
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtH8W6t0dLa/UkFV99BTBUrbjY5jNv2j/zaSGgqB05I=; b=NCldyK3+PEjNl9tO
	6dbebXkRl/8TJ5HUNwv90D07p252OpLsD+mZbmVC8tMwET8GmgAGxcKbobeSEBCc
	aBGkD7ykG9aADBKlL2mIBDBZ1PdupQeGtH09+UWZJEiOWOmGuikk3gFRxngEs1p0
	jpn2eX5Rbk4rUYMsUH6MXUoz58iq68/4XIqVNjzZmpRvLUIc/LIp6YJZyUhJImC4
	x0GH8eAdNuVZTrVlFJ955qJBnkQ5I+ildlpMbH1udMAXVjMgch0ynH5BW6uKLNvX
	vYHstHnbkXMqZCcx3nWSdbV2HuJLHPmekQpLJS5kWE6KYnaL27G2sbGFrFGdKbPw
	JnMacA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpkj73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:10:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f89b415so875485685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770905436; x=1771510236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xtH8W6t0dLa/UkFV99BTBUrbjY5jNv2j/zaSGgqB05I=;
        b=aRkFyxplAK79atvWS2ZZSndHPxwfN4D/YuX46R42UUTqfrwqTZdbi1cfExQ9u6fSTy
         MPZEAOBw8+tceF3K1twx3HqlDQqW+yj4KtosPgdYGoafs+JnrAd8YSv15XmCn319ir15
         Jus3CZJ93j5yiERZQLzQV8fMLX6gADHYOpKeAg0g5emhE5ej9I0/eyK69qaS3fJgxcxp
         iSR5YEpmjFPBVoaBG0PuBiB40DvLmbLjcFLgeGqBW0wcZrWuWyqBwFIvYcEhqyWngEav
         V7r0212KykYbEVkysmC7g9Q4Bm8/SNX2AIMgaMceXjtzhhUaDfez93Y+z98Lg9ePEBY1
         1bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770905436; x=1771510236;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtH8W6t0dLa/UkFV99BTBUrbjY5jNv2j/zaSGgqB05I=;
        b=Umt8iA4A2EUE1wuW/qAA7gC8NAQmDl738NaPmJ+YsHi8K8Jsh/nOj/NGuHO6aqXCeF
         YNTejVlhg1vAlgQDvJW1lR9uXeIW+pZsVDYmsxGmNIUuZWB5npJwilVwa8Zmo1dXzTRP
         BjwVK4Psq01vbZ7Vkoi81WZXDKr6gaVy+wRLrgUx8UWIGf0uqbYLA4EYplCdlx0umdIe
         k6NvrbjZPDIku1q/Sw0jMFbI51HgwRdUdezyPZXv4SV3flOTNMmPsELT19djYITnEJqb
         y4nOIvgMihv6AATCEDskirNUTeOrT+/mEhhitGFg8u/UH2VhNDjk6Jw/tqkX9HwsAfPE
         Vc5A==
X-Gm-Message-State: AOJu0Yz1EodTZ4aOX1RGqhi5qI4DiVLsmdRudIqjcPduwbjqjm9f7wA5
	y9MVNyan3Fnn+FrqFAHJQDm0Fv8oBL3FE40/f3uHzBcXIJtG5Pqpe21iJfQlaxPTa0Fljlm/59t
	v1rEjfwuI+mQz0o6VKF9qUKo9cAC4P4LibObhnnMXaKmD2dtyqiK8xmOGONRLh92HTXh2
X-Gm-Gg: AZuq6aKryF/ez23Xfd7FMWTtGcLlxOc+zq54FxkP2CKqxa/HXtuNCXe73yvUinWkINT
	3wTwPbghZ+LV/KHFBSYM8EXsuxRMs1dpl12H9KV8CLQK8Q7N+ryLfKGmApQ/nzWWCUcCdon3LOi
	tofZxNuJ2LlFk3i0FCVLCFzXKlcIyqMKQcybfAdhb4MDA+/RHsgqECnjZxb1t84lOSEeRJRgID8
	4mbFyS8FprYp294mrKJiSxIvPbeyKCOgiNt/MNvKCV7Iz0/h8Qe7/nGz40u13JPj5UlXIcgL34W
	L4ZMMy8D2eun8EfmZY41bLRJoODLlcudmTNKIxOm+wDJ5LilIrVZwzO5CHpwcYzs8NKIc8IcKOs
	ePUcTbUkjtU4eCfsvavKncHstkEoz5oZCE6zQ9xuPunyiLkvzPaSkeenVfoejQh7VfUPdvByJWQ
	Lp1q+TaseTpuoO0PlZhLxdVFfcTJWIC1Z7xzQtVWme1Q6jngj8SyBr/VlyWmkLIcdJaCmowTfjR
	cixcpo5c4uRSpD0
X-Received: by 2002:a05:620a:46ab:b0:8be:6733:92ab with SMTP id af79cd13be357-8cb34d528b3mr235213985a.0.1770905436471;
        Thu, 12 Feb 2026 06:10:36 -0800 (PST)
X-Received: by 2002:a05:620a:46ab:b0:8be:6733:92ab with SMTP id af79cd13be357-8cb34d528b3mr235209485a.0.1770905435983;
        Thu, 12 Feb 2026 06:10:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f79c79e12sm146344366b.48.2026.02.12.06.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 06:10:35 -0800 (PST)
Message-ID: <76689c15-141f-4726-a169-2cd6220f3ffe@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 15:10:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] driver core: Make deferred_probe_timeout default a
 Kconfig option
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
References: <20260212134646.66433-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260212134646.66433-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698ddf5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=5dsQtxWV2Z4VfSVEakkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pdQYT0Fw9tvsPX_Kdj57VzYzW5lkCE7H
X-Proofpoint-ORIG-GUID: pdQYT0Fw9tvsPX_Kdj57VzYzW5lkCE7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEwNyBTYWx0ZWRfX5K9126MJdCsQ
 ejfemc5UJvZYJ6mYFXIuKX/HolwqBStZNl/mzPmImYbuwGXx4vFlNG41wl1Ygr1IAnxyY6BCHEs
 it7GJi7Wu41bs9qv1/JmyPgRHsrx0cEI6aPtER0KJGtToAywqc8wBkDnvRtbHwA+vp9/Ip8n0WY
 H2iTlXAWuA/LO49zQbtZtPxqws1ZNEGPncFsaCyWKIsYaZCUArr6f45pclF8nGQ4lIYJBWFidcr
 Hkq1aswtUbMJ2N8GUk20t5qq5ZB4sg1aBKAVVQp1c+koyaCG08BoRnJN/rjbXDacQeQjyO0/m+I
 EIxPbSXcZqd4hh8tyJzi5XAesst02xA1rgNhXApQyFg23RantckFdyXmbFQ/vqvRSrt3B8epM6G
 mVzgme+YVYiE9pw8yKBLl5QTmCD44n29ebfhjDD3TezFpshqyuGDRlEgFSIFA1++GL6FDEek5M8
 ugryiKKlldiMlOcWsOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92705-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25DF412E2B8
X-Rspamd-Action: no action

Hi,

On 12-Feb-26 14:46, Hans de Goede wrote:
> Code using driver_deferred_probe_check_state() differs from most
> EPROBE_DEFER handling in the kernel. Where other EPROBE_DEFER handling
> (e.g. clks, gpios and regulators) waits indefinitely for suppliers to
> show up, code using driver_deferred_probe_check_state() will fail
> after the deferred_probe_timeout.
> 
> This is a problem for generic distro kernels which want to support many
> boards using a single kernel build. These kernels want as much drivers to
> be modular as possible. The initrd also should be as small as possible,
> so the initrd will *not* have drivers not needing to get the rootfs.
> 
> Combine this with waiting for a full-disk encryption password in
> the initrd and it is pretty much guaranteed that the default 10s timeout
> will be hit, causing probe() failures when drivers on the rootfs happen
> to get modprobe-d before other rootfs modules providing their suppliers.
> 
> Make the default timeout configurable from Kconfig to allow distro kernel
> configs where many of the supplier drivers are modules to set the default
> through Kconfig and allow using a value of -1 to disable the timeout
> (wait indefinitely).
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

I made a mistake and accidentally resend this old patch instead
of the patches which I actually tried to send. Please ignore.

Sorry for the noise.

Regards,

Hans



> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  drivers/base/Kconfig                            | 9 +++++++++
>  drivers/base/dd.c                               | 9 ++++-----
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1058f2a6d6a8..80d300c4e16b 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1250,7 +1250,7 @@ Kernel parameters
>  			out hasn't expired, it'll be restarted by each
>  			successful driver registration. This option will also
>  			dump out devices still on the deferred probe list after
> -			retrying.
> +			retrying. Set to -1 to wait indefinitely.
>  
>  	delayacct	[KNL] Enable per-task delay accounting
>  
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 1786d87b29e2..f7d385cbd3ba 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -73,6 +73,15 @@ config DEVTMPFS_SAFE
>  	  with the PROT_EXEC flag. This can break, for example, non-KMS
>  	  video drivers.
>  
> +config DRIVER_DEFERRED_PROBE_TIMEOUT
> +	int "Default value for deferred_probe_timeout"
> +	default 0 if !MODULES
> +	default 10 if MODULES
> +	help
> +	  Set the default value for the deferred_probe_timeout kernel parameter.
> +	  See Documentation/admin-guide/kernel-parameters.txt for a description
> +	  of the deferred_probe_timeout kernel parameter.
> +
>  config STANDALONE
>  	bool "Select only drivers that don't need compile-time external firmware"
>  	default y
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index bea8da5f8a3a..e57144aa168d 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -257,11 +257,7 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(deferred_devs);
>  
> -#ifdef CONFIG_MODULES
> -static int driver_deferred_probe_timeout = 10;
> -#else
> -static int driver_deferred_probe_timeout;
> -#endif
> +static int driver_deferred_probe_timeout = CONFIG_DRIVER_DEFERRED_PROBE_TIMEOUT;
>  
>  static int __init deferred_probe_timeout_setup(char *str)
>  {
> @@ -323,6 +319,9 @@ static DECLARE_DELAYED_WORK(deferred_probe_timeout_work, deferred_probe_timeout_
>  
>  void deferred_probe_extend_timeout(void)
>  {
> +	if (driver_deferred_probe_timeout < 0)
> +		return;
> +
>  	/*
>  	 * If the work hasn't been queued yet or if the work expired, don't
>  	 * start a new one.


