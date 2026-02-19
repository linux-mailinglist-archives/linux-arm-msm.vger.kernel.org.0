Return-Path: <linux-arm-msm+bounces-93341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JmuIpS0lmkxkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:58:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F015C8DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE92E3013724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AD2325729;
	Thu, 19 Feb 2026 06:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3h8FSmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOyekluk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413827B4F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484306; cv=none; b=kXKTx7tE4iSn3MTbK3pM+Di79NI8Y5d3NP8LymywR8jZp69Z8Hsq1/9xtbvPw3buQi7PBFzZJLDiOF/rR0Pltvxegv6mTaSHW2bMylwnJyg7VCDnNRfXhg3E66hRmNSZvxVXPeOs7F7/Phfx9/P2n9nArgJm/Mch697jlpjULeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484306; c=relaxed/simple;
	bh=Jd/iVGZrI5LCZy3rIH9NI7sKGXsgL7BqsTw09ud7sLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3aV/oMXqMkt2QKz2zCUt1SIhjaCUzJ6l3iG7uXD8T3C6rXSXnrVgnMV0JiiPGVqDgwEWRqEFGSETWTL1YL0hQanFAlqAlqq8+Gol2mbGKNZW3r6ciS1UkccFVNenB0ZaaV/eo6J5gKK9ufJdhXL/Mnz82TZXQUIchcR8Tg8VLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3h8FSmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOyekluk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IKxXlb3132987
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lqplant/6FSykouNMq6DvQkb
	3IcKO75fKGnpTGwWpfI=; b=c3h8FSmP3lrJgmTfq2UOsj2h7OQ8YrTY3t8ac5Sh
	OTux7ORSaLk+FQ/346ymHsJLCYDh4hifW3of7cmrzsDtqO0WKmxBoI1IUUetb7f7
	2fdvzBFpy0772xK0fETTjdRAI8NcJvufkQg7qFlwQjRw0iGsXoiqrCMCNkGG/XyQ
	fBgtCMpWiATeRfwElBTh3xMM97Tyrwtg/iTQtvdNj5lKBDpUoYV1ERp/3/zuo+Nl
	5/XdEkm5XDWcpOE5Om4zc3efOjPlZjl3AXgmfrTnqlWFL3GTF3Gh1oQ8I+G2EraB
	hfc+JIx+6Bg/Sw48da5KodOIzI8yEMpMjdjb069iCjUSzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvs4vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:58:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f96458f3so129305686d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 22:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771484304; x=1772089104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lqplant/6FSykouNMq6DvQkb3IcKO75fKGnpTGwWpfI=;
        b=WOyeklukAQuqpdU8o0v8NFroXmBjhiEhT2e8I2BnykDxIMHMys1U2RvRJcpLHfFj52
         GezSqDqO6B935kk58SKj6h7YVUGWfZcuTjFdXJDz3aFpnxioWZ5f43IFumJWqkCsPpm6
         GmYE5TFBRJnuDU5yG0g3ws4HbyJeOrIpkcJ9mgtgtLrMDDq/A/utWxU7bEtE9is2gfjI
         KgsEfj+jfTMtgJGshTBs5H+C8rvxsdJvl9l5rp7ZjH4JZMuB+qhmmDQodsJk3taaE+1v
         Ij3jaPAt/PNZUmoqoD74yTDKI7TqvC6M13ZCMeUbyU4sBxZnVkTnkVnnsuaw4sFQX+Ea
         sTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771484304; x=1772089104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqplant/6FSykouNMq6DvQkb3IcKO75fKGnpTGwWpfI=;
        b=uPBa9rfE291Xj+4AVtvQ1ZtoWWArAM8l8kFmEMDPRdKgij3+6IGBR3heABHSSz7Qrp
         NuDfh/stqqitfWtjeexTSobXn/zj0RgcYubRM+oSDdfakYnvzprO5Xws9i2s8MEWCH+X
         lTPaewtLxCvdOaSi5oHull0s9AYRAX9PnG1v0Sj28KSw813A+Hw38HLT6yaW2pKyhVCO
         46i2NOwX4ugUnA2E07uJJhnFXJKH9XfDb+4UNb57SPIzfYVfPcbsfxGP0dfxc9EOFfGx
         GflgYoe3al5ZfuW9Fac1A0ad2Mllm/1YEUOMqok+CjInsQ2jCHFd0vMc+AfM1RopCF9T
         0sAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFrTYZzPtWtxb0/1vYwU3N6HAx9dX+ZEHYab/+6eTrf0s0vk6Bf5TVjImCooRCdBfJlbCipTyenjCU4+5r@vger.kernel.org
X-Gm-Message-State: AOJu0YyS103H26F31b7N7h7TXuXQ5uOCz8Pbmful7k2hWj8hnuOXhzNz
	H0jS7iioIWhXYymofb4FKB/c3aJhgYPzGLQUL91h/mYJPZdSs3vIde/7C+g4Csqu/6IX34j4MEk
	QlmP5A+bIfaGIzz3TShS4NG5RQ7E0a5+iJHKwwHhU+JVnA3dXsFwOdHqXASFd3SUjqXAA
X-Gm-Gg: AZuq6aLG7nUvaC9QTLhrMyNFWMyC9ANhlsF5JQOLF1GHBuKpB0f6nQ/x4qvmcswEoM6
	JrJ+Mz32jvaFUkCIDFMkDQGNE4slht6ISbAr7UlzFQ7xW2Ep4oVrYTQVUOzw7RHsQ8rrBo+fx43
	HRqEswg8VmQjP8wMj5LJZhbLG+t/sroZ2ZrfXefL5N0TIFLnU/ei+upmga9cVpprp6Xmjp2lZsk
	3PM6HydwPYSFTouYWgp4Ko/sE9Erc/pSnh/VmjNvUMNGJRPgS8PejDuXUU2MDVU9mLoXKm0ZL9W
	kzdtqyS5YZdmwqQIXR5+g6gAQs/oeJ762vUkBveoUfDLUV6afAcB7+2mFkcP5XQDojRJ2ZdMlSQ
	IWoLvSoKqB5n12B3vbTWrn8IyqE+tnt+DvLVKBzAkXnmEfFy9hH0ehhQVezKeVtfD3Uy7EZ5tsV
	8OvteKuhffaYdOEmwibULW5LpejR9Sgm7rzO4=
X-Received: by 2002:a05:620a:4487:b0:8ca:f268:c6ec with SMTP id af79cd13be357-8cb4c0143cdmr1972027285a.56.1771484303596;
        Wed, 18 Feb 2026 22:58:23 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:8ca:f268:c6ec with SMTP id af79cd13be357-8cb4c0143cdmr1972026085a.56.1771484303212;
        Wed, 18 Feb 2026 22:58:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706892623sm43616171fa.6.2026.02.18.22.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:58:21 -0800 (PST)
Date: Thu, 19 Feb 2026 08:58:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650: Drop redundant VSYNC pin
 state
Message-ID: <kozkers3bckgntmfyeknczrhwtvkgsfae4s4q4cyvtyurtpnl6@73ygmou7plnp>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-5-2799b8a4184e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-5-2799b8a4184e@oss.qualcomm.com>
X-Proofpoint-GUID: Y6f9wTv-9n0QH_9uExNXdAGDMu7ETNw8
X-Proofpoint-ORIG-GUID: Y6f9wTv-9n0QH_9uExNXdAGDMu7ETNw8
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=6996b490 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NMe5sQuIffPLTvoV0ecA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MiBTYWx0ZWRfX/nPo2zuQlXOL
 vu52RI3BchlZ4qUQ69V4068q+HWr/d378hG0NbDL4LRCYQK+ky9Io6kkjiiCt6Qu0Mpw2mYnHjI
 lLe5x+ipLgmaDCzRfrLsHaEuYWhcEpCe6QB9qhG8CJid7cuOuC3Hrnto9u5Hvs8oTJwMYNzI17N
 LySJgSzJGirk1QiW8hgx7MH5zsLpe0ZeDXowo+CHFnoEJkA5pdRS4NQFFVsWkf+qQ+AMy8QT8tm
 MJ1RVz4I9O8tKsdZ9puJbcCseAJYeUI4Ekym9IUI9UQ8gWcSjAvhGeYUSyeuuYOz3MKGCB19SaH
 RxzZU2igLuoFZziFu9DEaYUijdq5tn9mbZ6srbYChLhOK0ocPy4Yo4/2EzqYLsqRw5m1xaToUf1
 xD+LRj4SD0dQ4WiUu9D3+JT4CfxcrdZLndR7AbLlzxzdvsaQgR+V/Q7VEuQ5r4J6KBx/pdhZqPt
 /LNoWgpQ25MazdpXDbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93341-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 065F015C8DD
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:24:27PM +0100, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 13 +++----------
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 13 +++----------
>  2 files changed, 6 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

