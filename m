Return-Path: <linux-arm-msm+bounces-99757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB/dLD4Uw2lCoAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:46:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E531D6DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED7303192C54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A534937EFE7;
	Tue, 24 Mar 2026 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QO70mq4u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7MFcoyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26A2336891
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392071; cv=none; b=uygtiyZhQOEdJZJ6hq84zwFUEd/qUzNvy9mWAM1G/iYGfdyxVdw2uAie1Kxo++JNvTXePd1p2GGRlOYXuicRGGHcGjHnWjfhK1PZKI44DcOhDmdZXZrZssCY5ZDuNnPpWTmjSF6BxwNZFihOTzyGCUzvCWh4owvWlZIk51SZFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392071; c=relaxed/simple;
	bh=gMr3GGNw8EYQelJs7WraPoeQYrUTHctUUmkDNOiOEnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+epZIC02jVrgnXFjYMBosvXSmDl6wVcxu0bRhwrFr2rMXUUO9Uf4seJVpdbGogyRKxBmJORRI8ILqZ/sbkFQ488SxiMnUiBpCEJFKM8ULjsHIOL14/0D6VKQzFJxWURfHTZ+EJwHu0C3fHXjX2N/VSqEBubfNtAuV0oRNryP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QO70mq4u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7MFcoyh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtv92807986
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RzG1x5GNPRTNAhxIAESsHFun
	AJA/m9ukZDrYjDKozTI=; b=QO70mq4uBsb62rJM5WrLRBSkKeKDz2nN/8AzSKdW
	Ad8ZpweBd4Ltb4MrJKZ+HEc31kBNJ3oDKX4WsSJ5DPy2N+iqjzzUEvjB67QEMZ9m
	7dyP65lKX5owc9Wv5Z3k9mav29F19GpGYv0QizcYcxgxzd/DKEwudo57OAMBwDRY
	nIlINHr7o3MZypu5TC/4Ih3yWk7Cw47AZM3KA/lZiMBHrT9areUOa6s4xp2TNV7X
	ZkF0MBdhIuu3xIr9m2WvSvJbeJZPYZdy0x0Im6pUWIeIjeDVFoEzvyhT4dQ8qoy/
	LgdlnDCf8GGfLUNKAw4OeZQ/I+oOVZoKXoVdtzPVo29lsA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ejc3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:41:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so12166241cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774392067; x=1774996867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzG1x5GNPRTNAhxIAESsHFunAJA/m9ukZDrYjDKozTI=;
        b=C7MFcoyhyUtUib9fbwjwQPdtLg1IEyBsGV/MaFPdYqELh3FHvBaHU/UhaDrvbWooA/
         klPfBxFq81CT/u/3Ki+bfn1TQunEPv34fSal3XYelhrAilNhi2qhITsSlnht6UvavCFi
         Yhy7yatpr/8JLoyEPVLZIsKaAJ3jHhcCPS8mgt/DDQJe19A+6VjeiYW5k0xj5mLvXIvg
         CgtPoVItFAtVI4vObxEdjMt3ZojnZ+wW0t0EvPZ0Mj/aea0FmUDrvOVXOJmWRihNvFBb
         VkBG+1lmKggKW26QKhdtvlLfGxiOo5HzHeBYbyuLKlb8T922Zm/p3qu0JJqMde5Pg26u
         zW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392067; x=1774996867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzG1x5GNPRTNAhxIAESsHFunAJA/m9ukZDrYjDKozTI=;
        b=k8ghxzm5YQzKaWA7Y/UFhI7pkX9ndIweBEPCGHCnEL2On5EQMEWGb1xr47zKCAOrQr
         BgCZu8cv5EQ3Y2WNnO7eTKj9bB3OwmnoXmzR1U38YDWbX8F0/lP5plu5+Q1hUnWYazWe
         yjEXnKa4iySA4TedJGWWNmKU8jFEUQaW0KsUUGeDZy/wddF0qI9+eylCg7vTdbp3OUJL
         jC3Q4WekyoojylZURtZ/wwQ4YJnmt4sxclaBJrsTO9MOxEN4595BhX5L1v4NHztdYZbN
         gR4bCWdcccyqdMQiRU2ZQVfkDHNTwq7tsnVZxozxRmXNu31V73WwTDliryhhv4uu8a+4
         BNdw==
X-Forwarded-Encrypted: i=1; AJvYcCVuc6g94KZHLXhlU5la0rSzr4f5N17sVkhyiQVyUkY5AXKVIBZkugkny2fpHsfeInT7Q9moaSCCE7eoyQwS@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAya5yBRmluhbyY0m954lD/3FN0I4x4qLtWOJjLyThsU3YUkO
	mfX7vAUiwvhRlaHi4Yq9OQEjbmOVB5Lh3Jb6GH5EzluscqtjaLAU934M7IOya0ghnvDkgiml0qZ
	HMEzqaEZ///BCNt3MLl3hdoEP9mBon5XqlTthge747PTl+VSJlGrn3I2XeChTwVv4J+Y/
X-Gm-Gg: ATEYQzxzBVpdJB0bg4pTC9K+rpQYM0NWAMzyFew/myXUJo30OCbAEVeDfxJWzPKs2/O
	gb8OKi9blN3j0TC8xuEGlw95uOI7ZvkQAHTQHGJfIJs0RfXNPbI2nsjclcFNQQMLZUjvMLRATOo
	RB1kYlJgaVb1VuTN2tbI4cWXBGyp8quoqgodjcy0hwXXuVQw+cYIdfi9+FJRBGGs+80vgYpFcNg
	ojsDlDEysdXIJiYjtDD12pRoyC9UrCSpshigxACAn94OfLaTcuu3Lxf00mny5EEVke0i7pOTwGw
	fr49s6gX4b9qjoUPjARlTxFRnhARMz+tzfsDLqnz/ZpahnefQ5jN4baXP2ZKUPAi7to6FRHOv3n
	0yORYBzu2Kd5/BmViWDO5malgSBZtoebC06ydEuGG9TghoAs9xfxJwwZRagvbiXjOJS1iPLMNZB
	EgIZOxTpCo9lHPVPyAgwDWUWiYV7PL5Ag2frY=
X-Received: by 2002:a05:622a:1791:b0:509:56e:1b5f with SMTP id d75a77b69052e-50b6ef16524mr72810381cf.40.1774392066950;
        Tue, 24 Mar 2026 15:41:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:509:56e:1b5f with SMTP id d75a77b69052e-50b6ef16524mr72810041cf.40.1774392066419;
        Tue, 24 Mar 2026 15:41:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851add10sm3433452e87.33.2026.03.24.15.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:41:05 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:41:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, konradybcio@kernel.org,
        thierry.escande@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: validate overlap-derived invoke buffer
 ranges
Message-ID: <74oe23odro7ykszj2ocfgetfr5f244ep6x2mcwcad3326phvlc@5g4tpqqhnlxy>
References: <20260324014459.93364-1-pengpeng@iscas.ac.cn>
 <20260324114514.79392-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324114514.79392-1-pengpeng@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: 6PoWKRrhnqqPZep5bc38ppUz1TK0FbQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3NCBTYWx0ZWRfX8dOYXRDYQBgs
 UazRs3yqfwiIWmK2g8wIX2FQHT50oFg0pBaATxIHvuQi0EqjECwOKPMaKEF+7ggTcmaooX2mNHn
 Y2NUAevHIsZ51e94YcBoMS1QeNK8OZdv9k6OkQ7IRe7g22nLq48LVFICc15/y+dhfVSrWa81AVY
 iu11souwr+7o32oLZ2cIU/ZGyT0dsiHgQmCguv/Cot9xBzUt9oAKbkX4F6JBs3CIgytbLCnk6xC
 GKF7HP2snpixMOjl+eSnvpyXiK48NpFfG6eiwmdcv1cQnh6mZRPB7XQEBdI1ONVPyQKD745EzCN
 k4LIZNz1NPs9VuMynJ3/s+cvByizxBMpmzjulfBcBIRgSi5h4N0M6nxp329y00yk/F1N4RYYeVX
 vhqASJwgdnHxvQUmLwnqsRpQ8YcyxFgJjRu9tCs5g5iFprRWDeOSlSI/Kr24R8+tm320cCCf9Ch
 vAX3TY0BbiSChWpvzRg==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c31304 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pMEd-TaGR0FbweYsBQUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6PoWKRrhnqqPZep5bc38ppUz1TK0FbQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240174
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99757-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 531E531D6DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 07:45:14PM +0800, Pengpeng Hou wrote:
> fastrpc_get_args() derives rpra[i].buf.pv from the overlap offset that
> was computed from user-controlled argument pointers and lengths. The
> resulting destination pointer is later passed to copy_from_user() or
> memcpy() without checking that the overlap-adjusted range still stays
> inside the allocated invoke buffer.
> 
> Reject overlap-derived destinations that would point before the start of
> the invoke buffer or that would extend past the end of the allocated
> packet before storing rpra[i].buf.pv and before copying inline
> arguments into the buffer.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Found by static code analysis.

Please don't mix tags with the free flow text. Also please don't send
next iterations as a response to your previous email. Always start a new
thread for the new revision.

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> v2:
> - add the missing Signed-off-by line
> - add a Fixes tag and note that the issue was found by static code analysis
> - run checkpatch and keep the patch checkpatch-clean
> 
>  drivers/misc/fastrpc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 47356a5d5804..7dfb5eb6dc92 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -993,6 +993,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	u64 len, rlen, pkt_size;
>  	u64 pg_start, pg_end;
>  	uintptr_t args;
> +	uintptr_t buf_start, buf_end;
>  	int metalen;
>  
>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> @@ -1016,6 +1017,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	rpra = ctx->buf->virt;
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> +	buf_start = (uintptr_t)ctx->buf->virt;
> +	buf_end = buf_start + pkt_size;
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1053,6 +1056,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
>  
>  		} else {
> +			uintptr_t dst;
>  
>  			if (ctx->olaps[oix].offset == 0) {
>  				rlen -= ALIGN(args, FASTRPC_ALIGN) - args;
> @@ -1064,7 +1068,18 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  			if (rlen < mlen)
>  				goto bail;
>  
> -			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
> +			if (ctx->olaps[oix].offset > args - buf_start) {
> +				err = -EINVAL;
> +				goto bail;
> +			}

if (buf_start + ctx->olaps[oix].offset > args)?

This needs some more explanation anyway...

> +
> +			dst = args - ctx->olaps[oix].offset;
> +			if (len > buf_end - dst) {

Can this overflow?

> +				err = -EINVAL;
> +				goto bail;
> +			}
> +
> +			rpra[i].buf.pv = dst;
>  			pages[i].addr = ctx->buf->dma_addr -
>  					ctx->olaps[oix].offset +
>  					(pkt_size - rlen);
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
With best wishes
Dmitry

