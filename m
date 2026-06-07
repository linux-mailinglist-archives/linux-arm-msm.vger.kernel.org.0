Return-Path: <linux-arm-msm+bounces-111604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e/NDCtvcJWqHMwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:04:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487A65195F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:04:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eCrSty12;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Ap/xsJsC";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8305130062F1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57597330D23;
	Sun,  7 Jun 2026 21:04:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BF2857EA
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:04:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780866264; cv=none; b=nUeGlElbbQf/FjZtoGAamKtDkIFdCJySZ9Ga/7GCBJE0h7pWwRO0RoZ383QtHtKzQ4LO2jii19krMDYG5qROOntbsFQzigpmSxBEmPsSY/SLqBUgaR+l5pPwBsh1s0SCCw5mwG9Ej74liWwKp/8Zu+13pJsgyEi4UWo5Cyvympk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780866264; c=relaxed/simple;
	bh=YFM8Rpcz67toyEPjtzr4xH0TJGazPRywTTpdTkonNU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laLluq5WpWSU05PnXRcfISJ/Hdn5YatYWGHA8jdtt0yk1qGRirrQoG4i9EMloK32cnmeXSoQp/3qvXC6TEM1P1ioLfr51GS9MCHCp5Zm0mxecNMx5KEZmhouBQ1g8YaBLA7fvOesdiF0bebnh9fmkwM0+nJkiy0hIcmqa183Wcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCrSty12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap/xsJsC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Eja2D373146
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BWZgigx0DvyxZq/E63C/bM6f
	vlHso1VIcFlYQNbtNAw=; b=eCrSty12+SQsC3xarRKCfXECCGpwZH5EsuuJcFml
	HKsDRVRODAmyqTpwzX5AywCWHyLS8ktUHCEA1h1JPudVQgX6P4Qmrl4/++E9YBZ1
	9wSY/A53ZMDNN49QJgo27x+ju9a2WCCjTBIqhKZrp58UJZKSlWu72e68Jdf/THkg
	wNN9FqmecSZfmYRmHLV5n4DG0t+LnFfhIt7prpEvOhw0I6YpszW32ZEAmoqRM2ch
	S+/kpoE9e1Z36CnsZwJj7JMLiWuFd286IlvEXyNIwdHR7fvAPoQN4/mllZqKvef0
	QQe1qwWqukcWi3YNBmCQpyk8NWrNorYg/DAZnJ+9ovzz3g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvg87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:04:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cff652cc58so6073254137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780866261; x=1781471061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWZgigx0DvyxZq/E63C/bM6fvlHso1VIcFlYQNbtNAw=;
        b=Ap/xsJsCOkVibOFZfDkvwO1lrnyE+G5LreWsHg32hAX3IXF+0b8eTqfWodOtCkOKxf
         ZTKsO+tJiq1fpyOsFbD5pT+j9tANZiScFcReBDDoOt6NTeWFArcvF749g56mrpc/chSA
         Z45WjBSsQR654A/98hJ6Fv45tm1LBQLaGXouf47LPMbVLdLuoLjrPJsQwbbjnNYrN1tQ
         OqaM8PvpW7SyYcifq8GWMeiIf3uTmp4xrAPA9+CUKMICn/9EPuAwEAllKhLwM28Sg7VN
         KK3wTkpBVwC4KHxkF1EhknhDj0XtwyFoVBn6FkQ4lfrpAutFaHsS8dcVmvvNaXDTfUac
         QM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866261; x=1781471061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWZgigx0DvyxZq/E63C/bM6fvlHso1VIcFlYQNbtNAw=;
        b=p1kKUlkJp6FkmnWQmyjp5KTRUFJdQNLroD/wu/OzeSZquJl+tMotwVpem4uEglLiAt
         EIMG6f7NpbYVn0Zy6aZcx2FOCpUp6yyeOuZSjme02Sn6XFUqf/VnfResOkvVKXDaQxKU
         BQ/9iIXzuAOgMbtRfNTwzEx2cWhun5xsfODZf6bBMDI6E4Mfu9oBSlB+yUm7fGjlA7Zj
         jRqvMeQP93tUH651NgjFwzPZ9QGEQPhskWcZiH5nlmhtsKNaPxwct6XpIXiSfO9Ux31N
         UF7rQmOl9PlB2Kz4H5whSsEEah8QNElnA3+JVCSHsyibEkWd3wR6YYUurFSmMVizijHl
         rmoA==
X-Forwarded-Encrypted: i=1; AFNElJ9r8Ut2c7na+PUlI1ul7ap8BP9dV+x06v3r14bYLgnQIvINkaQwryCjWFEgExHWIraF1pU6QuFrko3aRC+k@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm0tFqz6JOWlUuZBOAzLtIWElb26KzyvfVDVeFE9Dw8URwgaJR
	wrW+e++ZP5l87ppxEsqPQ/FbxnOLM3Jzu637b9OdUronO75mS06FOHXSDa30uTJzgPqR/KBwBi9
	zmVd9mtIqpKuSmWcY/comeqBjEhW2xy4BAm94AJahuqq/UDCT+5z4Ve/z0RX9MAPxpFsR
X-Gm-Gg: Acq92OEz89HB8XPVRpaVr+696uMXq31Vlk9bEUB2da9URmHhxX/v5FPmjMLPCXVx6WO
	LEkUi17bPoO9JvV6ibtNEKA3IZB6H4nHI3WPcZWr37B71DjgAzy8+tFlvacn4RwAlkOor4xD5t/
	vyZILM1AjgJvlV8Js/i0g71g1Axrwg1U8xyDkcxSEsA/1DHmuKoGICBTIuGeqbXyX6DWio+mYCJ
	47pIHJuzEIyXki1ZjbgVurv6YFNO4IsQpZVMuI2wTBQ9UH2OmvjRsaWmTDlnpmYwdcEYzeYGJyL
	flKCJo/h+ucCEgeD6NhWLpENH1M9Cjs2TviWjJe/syCPQ2jbEQ1c+p4qrHrxukmGNOHTksKN6ri
	HhUgWA9pDpkN8CCPwO7m1tKarCizKvsHNRe5Kh+kW5XYXkiaJkhAn5siEteEKR2rAYpJSDE17ub
	/FsNR2QaXJ2NpP1Xo63Tm6CckY2XfNy3vyP+eFWadwrWG2bA==
X-Received: by 2002:a05:6102:54a9:b0:604:f29d:84be with SMTP id ada2fe7eead31-6fefa60bafamr6097235137.3.1780866261356;
        Sun, 07 Jun 2026 14:04:21 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:604:f29d:84be with SMTP id ada2fe7eead31-6fefa60bafamr6097222137.3.1780866260951;
        Sun, 07 Jun 2026 14:04:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b992a66sm3238464e87.74.2026.06.07.14.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:04:19 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:04:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Om Prakash Singh <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH 3/4] crypto: qcom-rng - Remove crypto_rng interface
Message-ID: <sikqvtj7brxqbyh2k5qyzhvsibkdwhay27hrcdxlb32emkhes2@xbzpqnnek2xh>
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-4-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530020332.143058-4-ebiggers@kernel.org>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25dcd6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=3_uRt0xjAAAA:8
 a=VwQbUJbxAAAA:8 a=LubSIuSeZRPZGAbx3RQA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=z1SuboXgGPGzQ8_2mWib:22
X-Proofpoint-GUID: N2KHMURK6UAZCFhdFVEkfAalEIDCjK3t
X-Proofpoint-ORIG-GUID: N2KHMURK6UAZCFhdFVEkfAalEIDCjK3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxMiBTYWx0ZWRfX50NHV5horhTy
 p6HRZkZ0aHDwVGyk7pF6OXS6jarnLliPBbrsglgtyxnyTyIE2Ksc+x8fsWR+RHReBDiWKYW3ogK
 I0+F7BffWQTMY7edAZKJzH9tgjU7YI2quZ4vEhP2kT0icxa3xowiMXPRYDfOisWv5lR5wAVDbuN
 Z+cKuj6YP29ckf79prYX9WJP9epGSl8z2Otqktd6ix23HPYogC4EQaPCz0NWheZQj68WTUznfEb
 WARa97XaKd4HT7NV2VhaFBm3F/z8jqrEJZBSUPnf7mNdtTW2hkbszComuZ0CFS+fY4teRm06F0e
 oJEsLrg11o1I8SsLUiUOVQiejgJPQVKbPYvosv81NpUvia3qjlNHcxDxFVarhl6lq03UAisfzlc
 a/3qTpwTVLM2ogc3XGwY+Er/5t2lk4L40yQyu4ll3wBrVI45G/KuyZ0ST900XQ+360v1fg3AgUM
 LrtAQ/10P7il+LL0KGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7487A65195F

On Fri, May 29, 2026 at 07:03:31PM -0700, Eric Biggers wrote:
> qcom-rng.c exposes the same hardware through two completely separate
> interfaces, crypto_rng and hwrng.  However, the implementation of this
> is buggy because it permits generation operations from these interfaces
> to run concurrently with each other, accessing the same registers.  That
> is, qcom_rng_generate() synchronizes with itself but not with
> qcom_hwrng_read().  This results in potential repetition of output from
> the RNG, output of non-random values, etc.
> 
> Fortunately, there's actually no point in hardware RNG drivers
> implementing the crypto_rng interface.  It's not actually used by
> anything besides the "rng" algorithm type of AF_ALG, which in turn is
> not actually used in practice.  Other crypto_rng hardware drivers are
> likewise being phased out, leaving just the hwrng support.

It looks like Debian codebase knows about exactly two users of "rng":
kernel itself and stress-ng:

https://codesearch.debian.net/search?q=.salg_type.*%22rng%22&literal=0


> Thus, remove it to simplify the code and avoid conflict (and confusion)
> with the hwrng interface which is the one that actually matters.
> 
> Note that while this means the driver stops supporting "qcom,prng" and
> "qcom,prng-ee", it didn't do anything useful on SoCs with those anyway.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/crypto/Kconfig    |   1 -
>  drivers/crypto/qcom-rng.c | 175 ++------------------------------------
>  2 files changed, 9 insertions(+), 167 deletions(-)
> 
>  static const struct of_device_id __maybe_unused qcom_rng_of_match[] = {
> -	{ .compatible = "qcom,prng", .data = &qcom_prng_match_data },
> -	{ .compatible = "qcom,prng-ee", .data = &qcom_prng_ee_match_data },
> -	{ .compatible = "qcom,trng", .data = &qcom_trng_match_data },
> +	{ .compatible = "qcom,trng" },

This means that the devices won't be bound to the driver, which will
affect GCC state when we finally get the clk_sync_state() supported in
the kernel.

I'd ask to keep on binding to the qcom,prng / prng-ee devices and skip
hwrng registration (possibly with some dev_info message).

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_rng_of_match);
>  
>  static struct platform_driver qcom_rng_driver = {
>  	.probe = qcom_rng_probe,
> -	.remove =  qcom_rng_remove,
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qcom_rng_of_match,
> -		.acpi_match_table = ACPI_PTR(qcom_rng_acpi_match),
>  	}
>  };
>  module_platform_driver(qcom_rng_driver);
>  
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

