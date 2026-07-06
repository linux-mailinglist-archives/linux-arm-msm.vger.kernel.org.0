Return-Path: <linux-arm-msm+bounces-116739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6RKFE22IS2p8UwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9091770F798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:50:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k51dKZg9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="K/J2cVc1";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D33134E641E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915B34314AE;
	Mon,  6 Jul 2026 09:52:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F73BCD3E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331552; cv=none; b=lNhEpBSmMHNjjiAYSdtQy1zSopHxuyK+2m5HX/B9nPPoRrA1w1em3RjM4jrMuD5CT/QWMopDjAcWLfxEB4nZH5xmUx1X08VApzXrDKVK6bXDF9JXta2gmquN1Zz0XLhEeSC8rfyfoxzuEcGlow59EFq1uIrRI5njxYRKMinG7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331552; c=relaxed/simple;
	bh=CT+6sTQWuPnhtOdpILmRJgYsA+lqXyqFq362sw8L9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UE8z2DCI7VaHHgWFzX7ghR3XBsWRw5ybCn62saQRO4G1L1XspbZk06gmzPNQBskqU9Tqx2U1KltBSwQoGTKNMVZt1/ROLOpMuankPwsCFjczFj3SFuDUnYWHOfOW74s+lJEjeuntEDiRrKIWfnZ0+vNRL6f7WFKONDy/EGBcoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k51dKZg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/J2cVc1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693uCQ103072
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymiCvoZUHnvPV3UZWE3h9gNLgtym4Czr4Iw523eM3AQ=; b=k51dKZg9OvEZm8mO
	V65Bh35rQB9pDW3pfKnt/YioF/TmIHOaEKTKmzXF2FoDqvSLG3JTaq82KuGMwVHh
	f9DkDecvTmnLePdBr4MEtws+tq5rkHGfeiNF9lXYum61eyxXAcRbOVv2Ve2n+JfJ
	me/L0UjjscMbH6T7acjPDd9gjG6/wiQTHBaMubgkhIpleQNmXLb+FZo2oKUmXn1J
	C5jWoA8Z6VCEr9ddCWK/axrMY4Djo6Afz9Tq06TK98pqlkhtLw0URo8+C6cZPSid
	9mhMD+SZQPiYIZBKwGDGRiEi6DBITGNoZMIW7Iqkfm4f4ZedsKJhLTdqw0UvAMCK
	LLvukw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50dk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:52:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso4533846a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331542; x=1783936342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymiCvoZUHnvPV3UZWE3h9gNLgtym4Czr4Iw523eM3AQ=;
        b=K/J2cVc1VBZkCzl7tB6KJphsVX0Rsr9kwHASizk8KasEcDkaAV2emhGRkR1b+d6rso
         HWWUqhD8JU7JEFL99hGVbtBuW12NQjauaHmjTy5UVoMAez9wMTjXCd6BTVO2FrEr+KI1
         nM47pIcuAAD0XMAjB6KpfuC7tLBmxqW0Om3epZT1dw66YfwQwVImK0fbxmLQqK0s2Uyb
         W0J9hwULzSrTI9DguWNs8+SRPXroFHCXW4Jc6pO6eQ9XP0SM8sRiikcdntWUN76ps0An
         p358Jhxo8n40VDjuuH4hQKcsNH2sCHiTxr+bgvaWC1NiOMfbEyHhSWE5phfLpn9C8C/i
         T8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331542; x=1783936342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymiCvoZUHnvPV3UZWE3h9gNLgtym4Czr4Iw523eM3AQ=;
        b=o4aylf4RLdQg2ajfcvrUkyvyf5TsfG73Mb3PPxSThZaE8fJg5YGix1tdCuyS4KuuoH
         n8RGG2PwqVM2KwFwGUSwYFO6TSuqEf30kq1Rda9nVhtlf8Etp8f5OOm42e6fy/Avx24m
         p5BawkW6HbKpOI8Ha3J84nSpqqwMo2KqUOZk7pAsWQAuWW6B8EWNT3nXc4BI3m63dFCO
         FslGuuhH/cgjIfGf549TQ4PvcPiPA5LS8kXClr4lz3LK+rWwzTu5RJBIx6neTgzpMWjW
         2lEUAjUwGDRQ2lMqqtLuPalYmFXObM+GKO3zA2c75FtTovmwl56I6YL4hCHp7ry4Umng
         ZdHA==
X-Forwarded-Encrypted: i=1; AHgh+RrOei+PEeOL+3nbnuW6S2Scc8XASt9gA3dEIb7p1fjHc2O1SN1Pt8Av+7WF0Aoa4x0YpoEkrx8+XQuclOn0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYSQrFcb2QkXGPbWm/zE/9no6denTd6zKdUVYsznsTnoxlNNy
	lC8M4KwPV27kEMcx8kaxD9FNDH6D06oSYBE/j+buddXxt6tfQ+OvooiogGgT+PX0eOs8EG/bTET
	BGxSq+cTZ6DrwjcGqzVFGnxjmint/BOdb0EX8sQOStTksy3UUzFQTLIwqeNGsLOcHnR2H
X-Gm-Gg: AfdE7cmRaIauZftoGA1wvfGPpJ3RBDgPr2N0DBHIJo46HoLSiRWqslbFXrzGsmGZg5G
	ZBAdUO67tbB3mMVie3gb7McvHtwwWSAF0O7uDgGuij1hRI9I0eX9jKrLoH5LZgW+Nj6gFKpB3b6
	zZb5jHBEYK7vlHOkUTIDdd4NlzqFFk0fS0MLODErA7kUYxoeD5bVw50lQjSDdPmk0+D8ZDC20Ti
	gEDwbvFEy3JEZ+BNQdBqF+n+Az4PU6CpkvnERt+2zK7DKbRkHYgzjKoMS3vYvSRHtRcd6rZSSDm
	YMILQRB4geZ2GbCZ8GKRvsMqXIhv4hRUHLU/Yg/Jb+BfBCqFyxTIj2B/UZypAYEzN6dL6GJF4p4
	Hy5jAgKMO2wZNYiaT7BEQUF02Syn0CUAq/ZLF
X-Received: by 2002:a05:6a20:72a0:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c03e52c6efmr10345059637.59.1783331542224;
        Mon, 06 Jul 2026 02:52:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c03e52c6efmr10345031637.59.1783331541747;
        Mon, 06 Jul 2026 02:52:21 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm52826858eec.3.2026.07.06.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:52:21 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:22:15 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
X-Proofpoint-GUID: wgjc388padwnevP2NFl87se9Q5RaIdBd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX9V6VhLTht7dt
 CyiSjK529gd/9o/b52oigSWcgzgelJ4fS4rWGOSlujgRgWyXpG9rw3lwLilWTb0xpXljSGAhjq7
 Ix471gAIH1Vb0I88kCZDB8nLR4+oAms=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b7ad7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=X_DaoaUhr7fqxi3pwtIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX6QBbuIsL9Com
 2Nn+RMRis088xUP3+ysMUcSgG+5s02SlK4Ea2IHZFSdXZYCJ4zkOpsQ70Htmz+FxqxuwT/qGag0
 gtPC3STbpv51P/g165e5mjOBmEGIxLYNZRdl8wvsVuURWh932qpUjX9JPAb7mBmt/k/w52qC2Qi
 n6+URcrMOlp124EWiMlWJKAiaGnDNkwYMamPOx1MXRHst0Aoxk1IDsmuOCPd2OEsFT8EyDAVLAb
 jEuxB2plzvOPjeFsZb2BmAxcS3ZBeMFqLAmR7/6FSVanYxeSkIYhnESUwPtrn1yZvcTcAEgX2RJ
 flPXSZZFBX3tKlNFzd6KisLr67oT0zsvfaRNQnjKzQkjz1ktlP0kSf/LxVx5wJEdSda+xHSfEpf
 FyBu0Ye0lp1m62MQ+TH5evoNo/n0Zn6s8PVUgM1tL/aLDWPwgIdnp+8fQl+MjaXYvCFly90X6HY
 SkxjK4qZPnmg4i1KrsA==
X-Proofpoint-ORIG-GUID: wgjc388padwnevP2NFl87se9Q5RaIdBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-116739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,hu-mdsor-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:regressions@leemhuis.info,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:vishnu.saini@qualcomm.oss.com,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohit.dsor@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohit.dsor@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9091770F798

On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> > On 5/4/26 22:09, Mohit Dsor wrote:
> > > Sorry for the late reply. I am attaching clk_summary and reg_dump in
> > > working and non working case. Lilliput is just a normal display working
> > > with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> > > Gen2 only.
> > 
> > Neil, Dmitry, and Mohit: what's the status here? From the outside it
> > looks like this regression is still unfixed with nothing happening for
> > weeks now. Or has progress been made and I just missed it?
> 
> Thanks as a reminder. Unfortunately, it takes some more time (and I've
> been a bit overloaded lately). Worst case I will send a revert soon.
>
Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
> > 
> 
> -- 
> With best wishes
> Dmitry

