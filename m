Return-Path: <linux-arm-msm+bounces-107927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPzYI50kB2oEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3042550C13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D76633035A98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745024279F4;
	Fri, 15 May 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdJn2sYn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIlEFG9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70E436375
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852268; cv=none; b=sqoT0E4XUDR4Tfyb/+tS/MaStXuuuq+LbAb2BA6EYK8gyNq0g/zWuhhs1ZgiYpnhyrUilpKLEaPcOvXauU3Lz/A4DwF9hBU80j3G4Up3o50UZKPoDkgRmfK4TVvnLpIlN991IiKv4nAsBoNM1/4w+HDYjSdpwQlfCNklr1rQwhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852268; c=relaxed/simple;
	bh=CpYVIcUZiCYySIwEcogVZHkI8hxZRzraargEgNLknkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU8NlpoSQegpNEHL/Om+yW5X08OAHXS1WdVWpRTpKGhHjTemvffSdXLn3JgjWSNSAwiieiSO8Ift3KdPX1oGCjaDmjjoQ3K+b4i0FnOO7LbeTflEArfQNWcc1+UbJ2husyQPt3bOjszyCKZHX1bkjf8MxyaY8Gf1BNsiFwgIX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdJn2sYn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIlEFG9f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB1qvb3670906
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O7epNKlvduCkj+W0ihTOhazY
	SpPpW52OLfX1S5ZV3nk=; b=WdJn2sYnpounX+J/LfuoizYUoNYAXs9k4gYf6i5+
	pArFKCykV0eve7A3robOqlzZjsRPHgKhZbAmQU6C0VcFuDZQQCTW+zD2kapcTPJD
	naBqzK0bhxk9TjedffBAgKfCu+jPCo6uJ0z/s2J0wEwsWz4UcX2zUrwCquurpn7Y
	rNbtnXAR9Dlw0/bw+NWHmPcAE06fASuYK5oRPyd1Ip9To1dLqDLVuwPygu/N3+bt
	AJ1YiUNvLAaz+CqVk9T/t3pSXCPFihwNeQFRA3FFY7tGQyscDqaySzIe/31iKgmx
	ueFIwBHj6E9ilqZ/292PcKIEBtVqSnrSXWyrNy1d2p8pOw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s3gad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:37:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63271d633b5so4545584137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778852261; x=1779457061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7epNKlvduCkj+W0ihTOhazYSpPpW52OLfX1S5ZV3nk=;
        b=fIlEFG9feGZOpBBMV7fNwrUd78F+DWDJ+6RjL+xB4Qj3eT5BwBFAwJgrxdMW0uZKJE
         xkxZs1AwJyAJjHiobX5LAOr1R9trAVyKW2LTC3wv6XRBzz6mM33QoM+OQmXqa7IGVrhO
         uDw5qY5DCy03RLlYhNwbuAolMWhGypSnz/P/M/B1I0qLesiML4M2JXtujMYbKKOg36VZ
         rNzu/o3LF0Hw39rwhqRk8lsWIy5jKVy3aTrJO1zGgfY/I3KJ77KsH/bNNU+YLU1WI65Q
         zjUtH9TrjTVL+S2KUNeN1cQuu6pqfgtnN/j2IZqKOmOruk4duBtZo+sSo8OnThmNlaSo
         3VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852261; x=1779457061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7epNKlvduCkj+W0ihTOhazYSpPpW52OLfX1S5ZV3nk=;
        b=lcRTARe25ssumdMYDjbQqjYANspJBLIJIm3GNebzT8PEwDeZQRFrFYegxtKBa1Irl9
         /ffDT9hakqn30fp8Hp4sRex677hFfa4FfKWZBV/aGfrM8JAxoC4VVfMMHbx9s03REzcA
         6PkRORGC7N7xtKR3QrG418q7UxfigW6aj8PDVpNA3chw6yCg2dHOrV2But5Ddj1fwSeV
         fVzDL9tHnnXL4s9FT+29/7BPyqXwtgXXyhNfFkqkVnlooqQ+IzztbQjlvPUEMfkUtR3j
         CC6u8Hsq0KK4dPzM1OBCj/DI3CGYNPKyNuoak/b1i23pVw0BdaoeTq7bKUWq2vxnGADk
         WtcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g9EBeEGAQz5xByaf624z5JF3IYH3bCZHmDqui/fXTgrWGE8kCwP7KXktXUcct6uPQqnhcq46fXEEzDF3N@vger.kernel.org
X-Gm-Message-State: AOJu0YyWApOIjxDNh88Jstd49I4UgbdqZM9h9GCry0ktqcqMuHDB995b
	Efs3aBqQrEIHMujcK+stFvY/5YCA2Zfdbzxh1yxS9+0OnuZPi4bBBEyhgxDzIJ5cXnbjPUMWmJu
	eSyhDr2BqS1bG+YDzORl5Clf0WkxGJZeqzN84GSgZYdPNfGtDkm7UqzojlXQSCR/uocN3
X-Gm-Gg: Acq92OEf9hllYNs/xrzkeC8z/g822K+8oaQtyBaW3mmnF8a+OS8OaL2JpYCL3w7Jd1o
	VlATNYg6MFBVU0I73XVf2wp+U+OXHxzTiB7j6yhPSd6eQwfL1uSi9Rr52CvA03N7iv+ZxfBxON3
	D4bY4dPgt3LPoYyBOScuVvr8i03aD9Ja7vS73ZKB0IXmyfT/IsX0miGKrv3FE2w2ufl0/M25djL
	5kQzbPZ2hJcsGRivL8vSudA9b5nMUT3U6fF6AX7aM+emsq2SHvp9DpioVWu3qoBPBQN4rzN2Mvy
	cC2CMmsgtHB59ntXmPiFV+a0g17oTYz4EIpMEyBrfAj2Xx8AYYRobA/FbI+KO5B4DJLgCLl3dBw
	P08GOJf/oNUq4YrUmGHcc8GUTiIA12XVl81x8qCJ/q2/TCO1r9w23X6iUsvYm7CJ/MqnhvP5+xw
	LwlkBT7mI7cn3ezneLICQLQfw7pZ8CTPVJDzG8fT2NG3PNOQ==
X-Received: by 2002:a05:6102:f85:b0:631:4d87:ba5f with SMTP id ada2fe7eead31-63a3d0182e9mr2173371137.3.1778852260614;
        Fri, 15 May 2026 06:37:40 -0700 (PDT)
X-Received: by 2002:a05:6102:f85:b0:631:4d87:ba5f with SMTP id ada2fe7eead31-63a3d0182e9mr2173348137.3.1778852260157;
        Fri, 15 May 2026 06:37:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab497esm15704201fa.25.2026.05.15.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:37:39 -0700 (PDT)
Date: Fri, 15 May 2026 16:37:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v5 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
Message-ID: <5rpyaoyx3dsf3c7llnt57uukeaef2qgget42itfc45tura5esy@b4cwvazm42uo>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfXw+Y8i8sqG+OM
 d2vMsJ9bv471QdmFaNtMbXMifFCWt2hRjdZKi8AYNwmD3S6/ma0qk2BWafV7dv+nKk4/crdWgLX
 S/pcjGMj1Cm2ElbADZHUqxPKllJyRtDd24oQBSldkGgYvzzkY4Fc9cxjmETWEkSt3TvLZ/UgCxL
 yK/TuTdNizuLUayshTW5rs0chvanHSXaBX5x6AwrwjBb4qwyIN1HDbGmNNOSgjhMPJWXR/RUZdk
 NBJFzQb0WUiXciXHso96pGIw+UUQaNxNYvegkPGYICt30s03Wa3rmOF/NunguwwNIflrbkzZ9vl
 Wqmr2SGeW92nDwvw4IioE1HN9uvRZq3Y+bb6ou4NGt17zvqeDvUHfpPH916RuHuJehXl8fBjGJh
 ndO31gAqUR2JQvq3/1rEkofWXLlu5DP79nnvfqOoMPQRgqyls4yxSiA2uO0EnyKU0TuEFvRm0rZ
 7my5LCOwn6RO2yLz4hw==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a0721a5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hhTr-yxhb_4ls8DXav4A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: nIorhG7EgUIPGQFGM4ykV2cQ3rZe23OC
X-Proofpoint-ORIG-GUID: nIorhG7EgUIPGQFGM4ykV2cQ3rZe23OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150137
X-Rspamd-Queue-Id: E3042550C13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107927-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:42:15PM +0800, Jianping Li wrote:
> Audio PD static process creation assumes that a reserved-memory
> region is defined in DT and exposed via cctx->remote_heap.
> 
> If reserved-memory is missing or incomplete, the driver may pass
> invalid address/size information to the DSP, leading to undefined
> behavior or crashes.
> 
> Add explicit validation for remote_heap presence and size before
> sending the memory to DSP, and fail early if the configuration is
> invalid.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 3c7c3b410d7d..a0337cce77f3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1363,6 +1363,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> +	if (!fl->cctx->remote_heap ||
> +	    !fl->cctx->remote_heap->dma_addr ||
> +	    !fl->cctx->remote_heap->size) {

I guess that !dma_addr || !size should fail much earlier than here.

> +		err = -ENOMEM;
> +		goto err;
> +	}
>  	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>  	pages[0].size = fl->cctx->remote_heap->size;
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

