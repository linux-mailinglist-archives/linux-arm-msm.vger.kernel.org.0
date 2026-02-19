Return-Path: <linux-arm-msm+bounces-93343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPTOKoK9lmntlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 08:36:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C815CBFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 08:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B24E43004F36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E42279355;
	Thu, 19 Feb 2026 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVya0mlO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmyGlFIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0058429BDAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771486591; cv=none; b=nKK5AFLq5Z6CUqVQxUeHpD1M8AbtcvWbOsyHmgH2gGTTS4rPTCOfTXG8zZTjJ75Xc/c76ob36fjFPhteOI9/JJxbJhf2uKppdA6Euw0JuurgVLcV/BrG8ZfbgiHUi8tihW9DlAQBwdc9DpSSh6p4qGCnaq9Fjz8Gksfo3eSH3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771486591; c=relaxed/simple;
	bh=7D8oeBcTTbhODcbGS3ytT9SdRji0Kcym9sxkbxepz/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kk1jdnPxsqvZoc+3Vp65xRfpbJwJ4ewiX1A+qkR3w8tHmHnk9GW9Ix2zqPI2nn5tK7Iy8yo7j3vSkXBy9/IwstjoPdYSORU6gSmOdwEzi19CA36MwMorCWdrEFBW3VDC8yfkDBUwTsCrNgQ0ZGB6holIeIixsdkh+jJ6LVb1rWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVya0mlO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmyGlFIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IL5cYt2004670
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MCZpjhj4wsYnVOHuQmF3nIly
	abkBsaiwAgzaIrzQF2M=; b=BVya0mlO2jBDhGlPa9Zpqyunsx8FuXsHKwBoeohH
	DjVUBe9P0GM/pJB7euJt+j2J4WuxoSe9oScPAXz28V3OND6BmxDhyobKGIPow7/X
	l88UmYqSBgQZEeBqZZmU2NiDkeQViO48LLmxfyByLY+HRvz2FjBRvoGQ1Awyk7RK
	aYK7klo0g7HWqCSoRR9CeR4gmri89Yq3We+PtT6Oe1LWI8ebkk+BYTKE5V2B8Faf
	qWRDCl3HstfVlWhPN3BGmQO6kLfK/LCLZi7C6tOVfGaUbR9OXbawcCIzgLN9RFXN
	SG2ZHiE1JrkpD1VMp+yl58FC5+fD7plfXNfcd/V508e2mA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qh5c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:36:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so494001585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 23:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771486588; x=1772091388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCZpjhj4wsYnVOHuQmF3nIlyabkBsaiwAgzaIrzQF2M=;
        b=YmyGlFIy+LDOPNzHsB0zuh3ZJeJlgrhkQk1VwpeZqg3z7xWwZTUNfHjLQB4DOzIf6S
         wffm+WX/mcP373EoKdxSDC0Jed660bsb6ZR+k428pH5uLvY1N26g7mT3mFYS2K5fDbnF
         pA6XnBKHxZWN0u281HQ7c6gFFHzLXZM9J/GjZ0B7/YBUGscZKTAgvvP9Dm3zVL3Xo3pe
         hLJJVFOieLzI1BOppXGugXtrCm/8Br7+vq6RXuJGGKF2qOsLlS56qRemxAYFlRT5lTqf
         7nE4fCoOdxeIdoq4/pAhsJf3O/OrEe7MFeD1Bv/fFgw05lmmPE28x+0hf8ifOYnLUr53
         AtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771486588; x=1772091388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCZpjhj4wsYnVOHuQmF3nIlyabkBsaiwAgzaIrzQF2M=;
        b=rjoAjDBWcbdliCiwd7l0p1zRaKeT4D51/WSLU73s0e6dfJtmyJnAi4gkaSJl0chSu2
         ca232+6V4mnXICkZ2t8XFelYcgtBj+XdhjuGbt7qT5in3aItw9HcrcdmIpaF89JMGpdZ
         5FbjjIQiXNsOzwZvamcEDGh7Wk1A/k9fP4F3XY+1U8ektm3CgIveVEuBTwiB30xIiSMB
         T5n/VGM5p/jzH2JYjisTguSNrjvVmXD5DBi2t9mfqT9B72q1PlHk8pMi4+iQfaqmux4f
         6VHLEX9XBZZ91azk0zqg91F2L9LDskM/wuq5t8/39G1Z8b5gZEtFiweXJSZu0kdr7OLl
         qC4g==
X-Forwarded-Encrypted: i=1; AJvYcCUjkIQsnKsrELTx0zFzaqylzB5/AO5RPvPH3/A5mYm0H8ukNKUxjntTby5xUD7NJNw7LFEEfRQrE6EGDBD1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9UKfotQfT6xtg9jfuU0JF2BV3slxT8BNd478w2yFV1FiK8PbC
	zATqFoAt9Ow5HaS+/bj3SjiB+t0cYx9LN6NpAxPMuJDr43iRHDXTouzMvL2IxYTprADtz3Ep3Ef
	wIOHToFjmASXJ5e1TAriNT3nq8aNDaMdmANkR6ZwR/YXja5VszqeBRcuv3rHe3qO5sngJgIikxy
	54
X-Gm-Gg: AZuq6aIU/5ZQZ9bk1o8IT1SkQEOwTiDURwVF2t9vZvDuXCu6DqqQrYsnlbQ1AGf9aBC
	ji83g0vlqmlMKP9mkDcyzh3vUmLtqCMIcmKhtQaGPYbA4qnbEGTuE17votOd8AbINQ5UHOIFxXn
	hgd3FVp+H3Odcj3Aiub02YAe6cYFVez/S/9MmUU/ZPdXgHI9XEKWVmXlLtv38xzwJG/9XhqoHi6
	zfuRgDiGv8pvCmS9BPXi6PGylZXJw4bTgxIIh4prswumPuHpptok/huSQLHrbLjsXDdaUHHcvp3
	vDNqYxLLkMy/0twQNXlZTSL8mbGSErtr8OHkuI0mZY7HqxYwJ/atrompmr6S8wqXFNk4Jq2Pxc1
	kco/7GAnM3cAgDICUCC8SFbEaOV4ow/G0S3Qs6Zq9Zp32MiAsg7mi9PnAH5kbMlPAV2yMADY=
X-Received: by 2002:a05:620a:4586:b0:8c6:e0c5:7b9f with SMTP id af79cd13be357-8cb4c00d509mr2168827385a.44.1771486588110;
        Wed, 18 Feb 2026 23:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:e0c5:7b9f with SMTP id af79cd13be357-8cb4c00d509mr2168825885a.44.1771486587619;
        Wed, 18 Feb 2026 23:36:27 -0800 (PST)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2e35sm5073903e87.82.2026.02.18.23.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:36:26 -0800 (PST)
Date: Thu, 19 Feb 2026 09:36:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <gz57juqrntvqfjm6zwikrs5arfba5q5x5nuiqfbpccjodmrnri@nt5jnryy6i5i>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xtJWYQwg2VJPzI6o_NpXIPKuXCkgFMYv
X-Proofpoint-GUID: xtJWYQwg2VJPzI6o_NpXIPKuXCkgFMYv
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=6996bd7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=tArtvQTw_6Z0F1H7qHYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2OCBTYWx0ZWRfX/R8DOviBkHgN
 ScVfadba59r3t9lxNx4g6e0bjrISE9HfGeKMBCeBeBPWSGV0f+n9258cOyEvIeJw7/dJX/ZgU0O
 F0P94SK6zY1ECcZnXS+coZyNr2kvJIDGEJjqKACOXBbLbMI4DNFF61pyYiaxKiOUGmp+y1S0HQ+
 VO+j2dGi0m86ptgK3az13yRZM/oxHtdxnFa39VY/8tVaIImi4OPRzPNrHu30D4t/2Ztmu7t/17B
 enApnLLKb+nIpQMAcGGRLjIb9vaPKiEseHrOGAHjSygRrJk1zn9nFFUZ6/NbkDwIyyErQOSSZq5
 JSZlWo/Wht8Wae+rHfAsbOde6dQ8f1cz3NK3XkwqMurnbC6N87xjohClDQNxPUidzRhiGta82P/
 SpgTdKBviO2wIllVTfQMYjquOJlPW0jYaDT28/gRddMxSHLpkX0VJzjcDSL+f51rG9KjEpQDkZ9
 7DamlHoXAQZutQylLqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93343-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 506C815CBFD
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 142 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |  10 +++
>  2 files changed, 145 insertions(+), 7 deletions(-)
> 
> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	return 0;
>  }
>  
> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ioctl_set_option opt = {0};
> +	int i;
> +
> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> +		if (opt.reserved[i] != 0)
> +			return -EINVAL;
> +	}
> +
> +	if (opt.req != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.value)
> +		fl->poll_mode = true;
> +	else
> +		fl->poll_mode = false;

I think I've raised this question beforehand. This implementation will
return success to the userspace even on the platforms where polling is
not supported. This is not correct.

> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};

-- 
With best wishes
Dmitry

