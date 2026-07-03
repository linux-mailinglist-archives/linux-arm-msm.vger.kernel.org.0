Return-Path: <linux-arm-msm+bounces-116165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dV4GJaxFR2qKVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:16:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD16FEA03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:16:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JTDdPWCd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jJc9Ewfr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A19543019FDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB82353A97;
	Fri,  3 Jul 2026 05:16:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643D344DA2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:16:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055784; cv=none; b=heFSa4olg+B+4cIs7rJ3H3w+kLJ87zo0J2mlVpkkvbkBmdQOMDKN9GRigM2i0vl0zofxAOOLYv9zdKI2JjJxRofIby/OxfoZCKvgfmAMB50YBxfXoeT9QljYTIAXAMXplW+lsNRJpqs13nJguBJZUtbEML2AMg6mbSVVevBNQOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055784; c=relaxed/simple;
	bh=tWRuEZlL8nvpwQy3yh7T/zBn4uPsi4eon4phEwUfkMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Di+5xyTQAA2lB5Sm5yHQNVyi5c9d/+rt4nWSamWs7NHj9WxOc2shxfRPJTvSnGHKLfw1T0+X5s9wr4GSAREoQIkgQ0oOZdJtQbjDCtR7Qnj/tVMLyKo5sPd+K3DZ4HXmOphAWrPr3H4bCSuz0I0Im9rJWCFhSP68dQmpf1tUb4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTDdPWCd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJc9Ewfr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342vkH2838475
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7je18tu2quK+pqEUyIaDqokYfNsUVcOnejDyULff2vw=; b=JTDdPWCdAlBz8IDX
	6m3WlsRH+k11kXRRGIpBZtFmZAg54oxhxU65SplmVRd+9Ghbhx/9yaffw4DHTi5q
	pP1IKBlJ4oRdJ4l6AjkE7NtvdO04YsqwGcKTFA+YTMCBr6cORDZSa+VD6BhPe1Pv
	nz8qohOa+tmnJ8oupVyudx988edq/bprvsZK+qe/BiNKrEZYHBzmOyxbEvL2yyGO
	hQzpWm7NGk/LlvXWKrT3ldr16mX6xpgxZHEwDiSmVQNgqu8jLuEq2ZpUFgr+NRXA
	/g1ow6OqsnEWH6YqoaA5iautPNJYnfMCseibZVCR9fSNZ3kjY34eESPYAEKZ/vWf
	sG2B/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwvg8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:16:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so2512205ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055774; x=1783660574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7je18tu2quK+pqEUyIaDqokYfNsUVcOnejDyULff2vw=;
        b=jJc9EwfrIJZ7eppL7JNks4s6YRxtpAJL3/La+Mgte6/VzsZqVSjjnF6njr9s++ny4J
         2C4Smc+7Zr0mJ5qPjKXtBGRFR2GMTc78UE6PD2ahGnVazg6a6bpZj2I50n3dG5yXCarN
         mej9vYU8mJzIq1yGdT6dQBZ3GwZiS7zwIw4LE+iveSKOfO34oKl+N69rWYAixXncLW62
         DTjgqLtceWjEzJYRP6IgURcJq5lm4QvKtLmNmJK++Ebh7qd8XwF+nlqlxV/dtpKHB3+T
         i/MWb0ZgwGF8VKm+zDB+bVXJ82a/Jokprx/rJzXivuGZ1AwCjanH6Oi6u3i9JGfu8E0O
         KE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055774; x=1783660574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7je18tu2quK+pqEUyIaDqokYfNsUVcOnejDyULff2vw=;
        b=Hv3pLuGrOADHJFUQOWiKN11tZaTz4dKANx11KmVV4B+zvJZawAV05sKn9LVgLZU7qo
         pfNvbAvHhxAzKEJBImQ2TpYCCZ8WkTkLsZUduwVkbnkPwN2MUQsNdTCyKPybvQbyJlIX
         K4QXHCsImyBEDRCh3dxs+Ukc/AkjTBPFSuEDPnxqZv52LLfjDxYaxALClTbgb3/xRq+Y
         8A8mBhi/iOWFUWZHse/ffxhI4/XpVO8oGHZaJdNr+p33VVW+HPXRNpcVSlVJ4SvuNUP0
         lwUEQzqSDzdq4HQXrmTdXkKvnPjkT/YtDerXw1vACA1TtwhbD5H0uPn3OObusqeNNeXL
         nb3A==
X-Forwarded-Encrypted: i=1; AFNElJ+61rFF+tB7hm9crtUvuIOBVAEE1lguNHJtl6JNxMme+qO8yCnoZsidSSnODtWiR0kHMN6d4440jY36szhR@vger.kernel.org
X-Gm-Message-State: AOJu0YxshVTxygPl4y3KoMMfxJeMwxKnHUIMSCcssT6gAjcxPr6eLSGH
	yMSvp/1H2oeegf5ZmstBiQbvfQvMuKa7BpfTXAnNoWWxtZSkmrTSvN7XOvWv2jZ07IxZIXkMayM
	m++IR/e0rqmUdrZHYAVqbEv4SMji3oCcnRb5UbDRCQryQXsl1tIUUub/DGerlgQYHn3y3ISwT3f
	JN
X-Gm-Gg: AfdE7cmLxsO8W4qguFZN3nWv5GYrZTCrfnMF8M/z+KEFqNMmOkhXHpm6n7kURY18bCv
	kiRwcyG/DMwl02mDPMj4ycl61nfqJIm0k5FFJpQPI12xBcfJ+Tqa6rTVvOS2Jk8jJoYBl7CMPW8
	ABIGb04en+uM7UAXi7Bqxw5Y80hrXXtt4tnF1Li+NfePG8fzaeNTjCLMtTyV/orLmT0AOq2hvlS
	rZje+9wVAInn3xYlZVZNHr1Pjg2pDG0BWsWs1y5lFXZbcheCkgnQNQehwzbnelVNh9VYY3lXH7P
	5HrUaA5+XcL7RS1AN/STVPFEIc2t/mXociMjzYa1vKQk8IBcA3pthh1qFMHJAm3/pLCEMW5SGqw
	HF6mMY05qjKiBuY9xg7n17VNcpAHn2tYjs91orRiS
X-Received: by 2002:a05:6a21:7314:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3bfed237936mr11551302637.24.1783055773724;
        Thu, 02 Jul 2026 22:16:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:7314:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3bfed237936mr11551263637.24.1783055773170;
        Thu, 02 Jul 2026 22:16:13 -0700 (PDT)
Received: from [10.204.78.220] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813d37sm16467977eec.10.2026.07.02.22.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 22:16:12 -0700 (PDT)
Message-ID: <b907b6bd-ea6e-46fa-9546-b8b62e12bded@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ling Xu <quic_lxu5@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260625080832.17477-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260625080832.17477-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K7i2n_TiOOey59Tz7ddOa9MJK3XorF8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NiBTYWx0ZWRfX//IPQu1z20NZ
 2iVNbBe7fI4LXAar9itmbuV3bQqHW1VM7WYMVK7LBaj37ClVDSnbbVp+Jjgke8gkFpPOiC0BnBq
 fMrI3RuDnwuy89XIakr6ihEZlZ/2cdd63kda+1pIPX4bbeHeJDenDZRjCUwBKaDuRt3TTBwqD41
 JfPs+18mX0HJOyYY57/SFnjttwbHCOU+WytH/haQcRWvNRcfkKdOVsx1HYxAMDnFnlHncERlVg1
 JMuYvTbJVpBbnpOMaSg5Z+uTkv9hT6yJJO8HrOjJQpV/icWruW8+nvbZCXi0boQ1AU9v/iw6Frg
 n4zwETeMmbpuY5gzSTa6G2LyPmcNbqztQfiwnA4+ecR7pPOVv5qw2+Y+V/gW7hZVbys08Ppj09M
 hrZMkKbJ1SqXiCyl3JTCK/GynJubFnHyeTj6+pW/QYxYBj+WyBb3sr9ayzyvi/84ElT06j7SUHX
 rckUYSr+v/yfQYqatzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NiBTYWx0ZWRfXyfxyY5hYCLZF
 o5xPXPcPPVlAaa92I7dTf/OUMiviur05NYIsq/WRHq9+/PKUoN8jEqg4tAt2URVkQjIutWt5stc
 Veh2sdNaLx4KXn5SW9aVyPk1D7OIoaE=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a47459e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ywQd6nkPfMLC1FByFVQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: K7i2n_TiOOey59Tz7ddOa9MJK3XorF8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116165-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_lxu5@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3CD16FEA03

On 25-06-2026 13:38, Jianping Li wrote:
> fastrpc_create_maps() performs map lookup only for buffer
> arguments (i < ctx->nbufs) via fastrpc_map_create(). For
> arguments beyond this range, no lookup is performed, which
> can result in duplicate DMA mappings for the same file
> descriptor.
> 
> Additionally, if the same file descriptor is passed multiple
> times within a single invocation, performing lookups with
> reference counting would increment the reference multiple
> times, while fastrpc_put_args() would release it only once,
> leading to an imbalanced reference count.
> 
> Fix this by allowing fastrpc_map_create() to control whether
> the lookup should take a reference. For arguments beyond
> ctx->nbufs, the lookup is performed without taking a
> reference, ensuring that existing mappings are reused
> without introducing duplicate DMA mappings or reference
> count imbalance.
> 
> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a9b2ae44c06f..2622a1360a65 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -924,9 +924,9 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  }
>  
>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
> +			      u64 len, u32 attr, struct fastrpc_map **ppmap, bool take_ref)
>  {
> -	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
> +	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
>  		return 0;
>  
>  	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
> @@ -999,23 +999,23 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>  	int i, err;
>  
>  	for (i = 0; i < ctx->nscalars; ++i) {
> +		bool take_ref = true;
bool take_ref = i < ctx->nbufs, also add a comment stating why reference
should be skipped for DMA handles.>
>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>  		    ctx->args[i].length == 0)
>  			continue;
>  
> -		if (i < ctx->nbufs)
> -			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
> -		else
> -			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
> +		if (i >= ctx->nbufs)
> +			take_ref = false;
> +
> +		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
> +			 ctx->args[i].attr, &ctx->maps[i], take_ref);
>  		if (err) {
>  			dev_err(dev, "Error Creating map %d\n", err);
>  			return -EINVAL;
>  		}
> -
>  	}
> +
>  	return 0;
>  }
>  
> @@ -1508,7 +1508,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	fl->pd = USER_PD;
>  
>  	if (init.filelen && init.filefd) {
> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
> +		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true);
>  		if (err)
>  			goto err;
>  	}
> @@ -2100,7 +2100,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  		return -EFAULT;
>  
>  	/* create SMMU mapping */
> -	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
> +	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true);
>  	if (err) {
>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>  		return err;


