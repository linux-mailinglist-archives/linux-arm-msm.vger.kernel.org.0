Return-Path: <linux-arm-msm+bounces-115814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bt8yLBLPRWpeFgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 04:38:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D66F3101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 04:38:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l27H+qwL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J8bT5/fX";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115814-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115814-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96633008761
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 02:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A222737E3;
	Thu,  2 Jul 2026 02:38:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C27262E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 02:38:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959888; cv=none; b=LP1yzY+8a2Y6pb0pP0q2JtxEOHJXeDaj6GVnMbsiJnjj8e+C4huAhUi/v2BY3wwlq26aS90FLNFFPZLz838Hhvb05fizcz0qXlnsjrtInL9dBXXn/NUBX9425IuzL4KAEgDMKE3v+BCId9lp4jQ7wGB8Z1onRKCN+KyP1KdJK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959888; c=relaxed/simple;
	bh=D9zcpEo2BTnjHoDwntn2qm/V1fY3IMNo7NTHG8pKzKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgLGpADnZOqn1fCm+YlDjBX2XgWI1IFDL5bGp0iEavo5sYLOhQlpO3S3O3F4B9rGJDrhbZyU7I6/sE4JuuHlECVO6n0BMo8VBN23IPzvJ/uHCV+3LW3XPe3gv79k5QR6yrqRRoqgPEHw5s5YRFKMo9PWEYXAvPGNdMdRa76CSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l27H+qwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8bT5/fX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Ke8k2960505
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 02:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aAocksvrvPiuDLZfb8BX1Ap+
	0GdsKT9KorXLJ830nKw=; b=l27H+qwLr0JagE3CWYagpwkMQQFOAO5shE+X50T3
	8FZ6qoFlq5MvKzsnmKa4vRr0+GHJMGZpNDk4rx2O8KdqUeHLMaJrabCHk3nUMkS+
	+y2XutBQfw+51/3ZnAWZ5IU9g3DyxGE8DyFcjNxBig2b9vtOPgpgLQ4ISATWh9nr
	79596mtWdj82JC6vpQXgpc+6qJhphdQH3pdWkYslF1uznoWM9URigPjz3twe/YDG
	eyKgVJmUeu91cjrK7P8crnyc41rygd8osv5+1mFe/Wt2agUWRv5nA6xMC1c3+ikX
	ak/cty4vrCpTBvMfhTNoQKEROxrYMSR6uYmqP6IhO1VDjA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mj3ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:38:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c98136ceff4so1918832a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 19:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782959885; x=1783564685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aAocksvrvPiuDLZfb8BX1Ap+0GdsKT9KorXLJ830nKw=;
        b=J8bT5/fXctBNvfpe6tt4+G7WqhQNUKYgKQbc/4/pW4+feY71K84wWf5bAbdQ11/ETk
         K+iHMnrA9h0E22e1O/zlbIBpgopHpcMPs+rQx4C8divFscF17IMJ1y+xT0hVszBLn45y
         tj9/kPt0y2pStXdTXPflx0oe1peUWeMpj1v7C05rFTHCNNuZRuVneA5Pl5HdCVBu0lmI
         bwGo8QlNG0EDxEfhKwHgmUEOUpiNxWO5RRNwTrpzSXQJ8rt246oddTBpUcor5B5RrZdF
         gCwsyyQPvEeCpCgMioyeBJSIVwGsNpAJ3YcYazaHNO3IQQZrCWRdfYjDnEegThNTkURk
         mvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782959885; x=1783564685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAocksvrvPiuDLZfb8BX1Ap+0GdsKT9KorXLJ830nKw=;
        b=MwGkbLXQwZIWExCtDa9/gU2OYHjqQUKxWoTT5SV0UwRsblXIfw7i0ZQMzuajeyyCXo
         3ofAOZJsDZoKwaY/FRLYT/UBjyrCdWVSxG44uenB1y2Ji5QHRBPC5PfKnoz1Nf1JAroz
         vZ4W0+FeOY9EayrZhI7P+c+5RRbl66ajm98boCGeui0DL77sNSO/H9Lph1Y0q61eFo80
         rQCGHTUK7LIlRXowUTtE+ifnjLqdXFOJw3Okm1csAYtlLeZ0hR6wn3vYLwkLK/qt/kbv
         mMVo7wn2giwGVOA+XNbh9vyvwGmZ4m1FH9yclVwYtvIiTLw8DJxtQRnMkhmm/LW1zXOR
         LQ8g==
X-Forwarded-Encrypted: i=1; AFNElJ80U8dw+6YSPnio5VP/G9o40y+S1O4KoDL2vYTt4w8bpC7ojBDmK+hVnbVPHCqhnzpX2O3CpGyPQNpfOEDy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx965EOewNCRU4I+OsdOpOCRq/gme/Blt39Q/47NkgM7TXYJutR
	4gHvCaFyH4pN2kEdskpeufubMeC4uk0EQABhZqh9+z6cN0D0d8R8vX+YXotMeVlsKdKY28bf8n/
	/H0zC5dbfeKsjVR5JxhCrvhpDvEmWDAB8p0+K63N9jzLnRDN6Xs1/cK/dlRis5lVmI7C7
X-Gm-Gg: AfdE7clcUXoeY7bB4I+n8K1L/YM+232NuNVpAU4qQ25661JCYssYMssNTTOIC93hWpT
	c9+m6zLuXl4AV9aD9DdIJxL/jyBqMKwsw6xyvcfh5AQK23NDSjIMJvNBcW2PQiYvfwIcftHf/Od
	B6UW2ZlQi+3KwtsqFjswBoVqyLjZduMFsOZEnwhmhsrmKVVDgV1bgSTnUQixtF5HKEbDp7vaX7h
	pqPpkMjoVaYbJE94jQqrHzrt2evGYXbByv5q0NYMrFV95BlRzfQqRkfl7pYwbw7fO+DGVLPsobD
	FG8f848MN1j/JsRDfUcs2eJ3AoQfvgEQSlT9es6DZZAD7Fwu1myxTU/d3Yhc0jVg3zNtFBhMSW6
	B5ix9NgONoyOcMz/437YJbwMECVpRYVUIz2C+hI7lkTAsJMy7PrYO1VfF1dw=
X-Received: by 2002:a05:6a21:398f:b0:3bf:e449:332a with SMTP id adf61e73a8af0-3bff3ffd7bfmr4105591637.3.1782959885042;
        Wed, 01 Jul 2026 19:38:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:398f:b0:3bf:e449:332a with SMTP id adf61e73a8af0-3bff3ffd7bfmr4105560637.3.1782959884515;
        Wed, 01 Jul 2026 19:38:04 -0700 (PDT)
Received: from hu-yutlin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm4458728c88.10.2026.07.01.19.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 19:38:04 -0700 (PDT)
Date: Wed, 1 Jul 2026 19:38:02 -0700
From: Eddie Lin <eddie.lin@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
Message-ID: <20260702023802.vsma2ler3idkj7ru@hu-yutlin-lv.qualcomm.com>
References: <20260617-fastrpc-cctx-cleanup-v2-1-be87c021114a@oss.qualcomm.com>
 <8798249b-631f-410e-8b1a-fb1c35545134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8798249b-631f-410e-8b1a-fb1c35545134@oss.qualcomm.com>
X-Proofpoint-GUID: feUlMFMSy7lMSUpENt9v1ZDY3Ct50MtX
X-Proofpoint-ORIG-GUID: feUlMFMSy7lMSUpENt9v1ZDY3Ct50MtX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAyNCBTYWx0ZWRfX5uzeJ4dGgLst
 Ph+0JnVdhzsYGdit/uirAxZs0sSsaussJbsZkI6ioOgMuoVp9LCWk7mK5q9MyPK96BhhcocdZlC
 wuAyaupG3nORonBV28b8C1VhKNRp7AYMRf5Ag/wHWwRv0apKGxU9NOn6WV6j8h/kfryr05bhw04
 uTJQD4GkvsHZQoLaqq3XQx5uA2h2eA8DyLNae39LfrNrUNqN8HzOhHZsBsV/dXKP1kBY8S6R/KZ
 h38XNJzwm0V+jmbPnQt+elFC8UjBgPDel5I0zyjGsgKpq/HqsGvkStSddaNVun+p9GjRr6wLKOw
 /nLi1ziIUje/rYoycfJzdM3pTL0eDLIWTZodX9fmdd0fCr9IzAMFZSO0LNaajIlVFB+5sBG+H1n
 UsRjIFbWHl3IdjeK2q2NXnMYD/EcuNrWEUj4XUzU8x8Ot5XBkmD7KEC3czbyQ7v3Ed6RyRSzDMP
 xmApe5+wZKfD3+mJ/DQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAyNCBTYWx0ZWRfX2pvtSpsFa2Ft
 9KhjVqny86lUwNEB94MBk0V1vFdTSDApXxPHJKc7juzftLCWpYPraTE7w2YozoVxLr2kQ9NB3xI
 iBXek3rY4wlQC5iIZE7ZLpH9VpKeJ28=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a45cf0d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ADK-pmORIISXle8dMtUA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115814-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-yutlin-lv.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D3D66F3101

Thanks for the review! 
I've addressed the comment and sent out v3.

On Wed, Jul 01, 2026 at 05:05:40PM +0530, Ekansh Gupta wrote:
> On 17-06-2026 16:39, Eddie Lin wrote:
> > The 'ctx_idr' is initialized but never destroyed when
> > the channel context is freed, leading to a memory leak.
> > Add idr_destroy() to properly clean up the IDR resources.
> > 
> > Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
> > ---
> > This patch fixes a memory leak in the FastRPC driver by destroying the
> > IDR associated with the channel context during cleanup.
> Looks to be duplicate information. Please remove this.> ---
> > Changes in v2:
> > - Added Fixes tag.
> > - Added Cc: stable@vger.kernel.org.
> > - Removed duplicate description from cover letter.
> > - Link to v1: https://patch.msgid.link/20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com
> > ---
> >  drivers/misc/fastrpc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index a9b2ae44c06f..7727850e9240 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
> >  
> >  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
> >  
> > +	idr_destroy(&cctx->ctx_idr);
> >  	kfree(cctx);
> >  }
> >  
> > 
> > ---
> > base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
> > change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
> > 
> > Best regards,
> > --  
> > Eddie Lin <eddie.lin@oss.qualcomm.com>
> > 
> 

