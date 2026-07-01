Return-Path: <linux-arm-msm+bounces-115691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TspVKIj8RGpd4goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:39:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43736ECE77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:39:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XvcifFMp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ViZcgnsK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115691-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115691-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87FD1305BF83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21BA480942;
	Wed,  1 Jul 2026 11:35:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FC47F2E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:35:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905749; cv=none; b=fiyury/misEUf5koOO4IvWH0LnXzaYXMoacQoHSPSHZlL5E6vQvZv10mlFU7BuYrXA9yWgnUxlJP35kjel6MRxk8ynjGGfiPT3Zs5rhPunitJsTGHzLfm+XKQg5kLe/UaCeYLKaDmCcj9aIWmWw9fnbDSOJkIcpXaHRnbh1lxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905749; c=relaxed/simple;
	bh=hOpFGYO9HkGSh9BXqulckeQAdS16sxy8NIMsp1FlW+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPCk8WT34UXhd/Jx3mBEpAba4CFbrEayO3j3dJvFkemyFr2pI3reN2NVQaq4nI7PgFGkm66wj2DN4jr42M4ERRyTAo9uo+Gb/5sVQFlI4ARJzvge3NfUFswat5Mb7NyFBbqW+OwroeNqEDt112vuiNQqIpPOFHjJWTGS9dNh4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvcifFMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViZcgnsK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8U6g672924
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkuArwX3HTlRI2MmPQcqM4DBytZZqydkRSJiGkAnDt4=; b=XvcifFMp5onnzU5V
	d/UFBCw4gg/lpJKmlaAWt8cRkCWPdPpcngQnhYgYzWqxvbXW4J+SNMjLb+MsmDJy
	djnlC9mQXbuxA0uat5oo983eh4zoW442GfzvSn5BwT54oxWxUbbad0HLmoisdzKL
	R1Tn/5y5uo5cd9nhl/UHueQdGW4r+f7vMoz95ChIKoH7BjjmjzDAM3Gmb0lpvziK
	cWhKO21LoVoSf5pLoOp0aBGScaxVwFaeJF4u8qyiYBtSUZ7Fb7R/sMShYO7gKeDo
	9zkkvn2NOVeKKYo+e64XUG/+jJlsF8wyb+WCc3U9a+4KMSme3Tbo+wZSdRsVF2OL
	cml/wg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502urk7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:35:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38096521198so968094a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905746; x=1783510546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkuArwX3HTlRI2MmPQcqM4DBytZZqydkRSJiGkAnDt4=;
        b=ViZcgnsKxDcOucq5jTQCaHQ4I6CwOsPIOmb5NApL77qmezrqPGwFNBxJfs9SymU51K
         dsMoU6yba7PZ6BIR1XEKuRAslU2wJTn8hCOw4+kG/6XixUrejA2f1LGyxlzDD1DIKz41
         kPknIOsu1Ra63ofZalARiAXXbG3VNJs+8bDmubXQThU9jLfEcouKv4g9WM7EH0b46Llk
         /dq5zxztyu+IapK8dlPZ6N1r/vi8DGRz3g/2cM/+esxv7qZguizGJGbjHLgPd6pqoVLe
         fjUtGSNj82/OBM33a8qAaBAyqp8GReKqXZcaxajc9cGVHgRIGxgnTVsygo/zLDR221bd
         repQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905746; x=1783510546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkuArwX3HTlRI2MmPQcqM4DBytZZqydkRSJiGkAnDt4=;
        b=JEG6U4dbrC1zx8W3W9lek/VZxf54yKvWpDoBlq45OqNxVOasONfiQhi+gCGqjuj3Lf
         tyjsNyaBttiNgVPgNRFYogIzXLygt6Yj2e+eHX40qoSGOZXPupMaGDRDxAKfJjObvbOo
         +hsfTFTTDcFVf2ZT0cod299nOXwnJesO3nicmIjwoLaauAeZs/F45q6GUEfWBBN6T+yr
         BNZjF3Qlr9L01R2znX0n/vVnjrdGPBFUzWePZRxI0mZlTvzp3hh4zzSzjrlRCuZjZeGC
         nPh/JpDdd9wbj14Mn2VHALe5vnWIXhHtk5Z5vkJv9ma7WFCLntv/2Y34zN2CoEABEC8O
         CRoQ==
X-Gm-Message-State: AOJu0YxVSVnXdkRjrBB+B4hw0EVvGw+ECILJ97xctA1MvGfkH3XMKT/R
	B7ylfF2PTVPGipBjHTpvaDS8neAUGYpxHh/AMpnxhHt9nRNvfoWTzMWLfS+jnpzr4bUJ5yQ5cnN
	8LMr1G42RIXHHUoe6hsRjM9uEht5SjevO7NKng+SsehJSVYFJxZiG6/id40Ag7oxD5v9WYFNXJV
	Wv
X-Gm-Gg: AfdE7cketKkTMY7zZqHcyIEIFV1+QiOqAwiHj3Vbnqufeqnn6NduiiouDSYK5kBXv+8
	ABxR2h7z4EUJJPOHU2qy/Xwo1tvemWnVyuAqCxHjvquW5jwRxbwLS8MmXqcbuPr5RvGPD8SmLwl
	V/vB2XYTrocmWcubhfkoX7+ZzAqhlLOh5t/uFmUFY+vFRHjXNnGiF8uYR+FHAOR0+tMivNH5J17
	ackoW7wYnmcWiy+iQIw7Mwhf/zNFuTXem5BwzPdyoK4VzvtA3QVEZkfD0iBrRKNkhd234HhImEU
	nIYfeBORiBLw4F+kRORBnKtgVna2v/O4esry7t2jrrc3ObFu2CAW1BLIRuEPnqy2U/KASF7jwrQ
	k7hxJotKHhxRSTtYs7Q+hYl0zA7L5rtcDFGvK5uDDiQ==
X-Received: by 2002:a17:90b:4ace:b0:37f:9ce1:cdad with SMTP id 98e67ed59e1d1-380aa1d944fmr1315966a91.27.1782905746502;
        Wed, 01 Jul 2026 04:35:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4ace:b0:37f:9ce1:cdad with SMTP id 98e67ed59e1d1-380aa1d944fmr1315941a91.27.1782905746045;
        Wed, 01 Jul 2026 04:35:46 -0700 (PDT)
Received: from [10.206.103.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d47dd4sm1725623a91.1.2026.07.01.04.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:35:45 -0700 (PDT)
Message-ID: <8798249b-631f-410e-8b1a-fb1c35545134@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 17:05:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
To: Eddie Lin <eddie.lin@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260617-fastrpc-cctx-cleanup-v2-1-be87c021114a@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260617-fastrpc-cctx-cleanup-v2-1-be87c021114a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX+M3X1rK5RfcG
 Y3niXyIIPcAdkVRirDcW6AXUlvrZvq91YtqZb5eejUEYq6f1uniwS1Z+B0A/NdRh0AZ2UhwJxkZ
 C1v7M1y4DsWvt3N/HuCxdXsrJJy/FEs=
X-Proofpoint-GUID: tb5bJT2cUv0GD34RBasHjDRUZaqSMaLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMiBTYWx0ZWRfX2KmXLhRgr/v2
 CINNOvmLW6NenYbt8JfIuI8jeA+767cJ02J+7aCbp0pXCIDg52oKaOvqC2UWfhaqYHt7Qsgu34V
 GUu7L1DSjBBK1aeAV/LwMoSzaN+G92pwRrK9dl094Fe8mCC0ixUN6LSymip/yEHe37R47UdbCjd
 ZC2/jzsRSSvGH2Tl/KJ3E5oiGL7FSYA9dTxUlSEfKlV1Bgt8L6r9jEzuOpdCmmjwmSdNsko3mrg
 oqvEXCzUDxKjRXLiu5/RoNomP5pTSluj+1YY4QDsRNDs2xxHlBY19aiEegLMQlFP0uF9z/0Bhke
 zIuLViK/iHLJ+3BiiIb3g7LcRjAKzcuB8UE0Q8lBlUvGMyS9A86r3ki/t5UJFB12hzuP9vMozLo
 AMgAjXHWXCB5tLMyQ/hk6wYbqvC+4SdaxwcQpXnIy2PZB8UQR/z1F8ftxH94qLyvuFHN8a+fNuq
 XC1XmJSQVjD48kImzog==
X-Proofpoint-ORIG-GUID: tb5bJT2cUv0GD34RBasHjDRUZaqSMaLD
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a44fb93 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-sgLQT9tILotkD796yYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:eddie.lin@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E43736ECE77

On 17-06-2026 16:39, Eddie Lin wrote:
> The 'ctx_idr' is initialized but never destroyed when
> the channel context is freed, leading to a memory leak.
> Add idr_destroy() to properly clean up the IDR resources.
> 
> Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
> ---
> This patch fixes a memory leak in the FastRPC driver by destroying the
> IDR associated with the channel context during cleanup.
Looks to be duplicate information. Please remove this.> ---
> Changes in v2:
> - Added Fixes tag.
> - Added Cc: stable@vger.kernel.org.
> - Removed duplicate description from cover letter.
> - Link to v1: https://patch.msgid.link/20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a9b2ae44c06f..7727850e9240 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
>  
>  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
>  
> +	idr_destroy(&cctx->ctx_idr);
>  	kfree(cctx);
>  }
>  
> 
> ---
> base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
> change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
> 
> Best regards,
> --  
> Eddie Lin <eddie.lin@oss.qualcomm.com>
> 


