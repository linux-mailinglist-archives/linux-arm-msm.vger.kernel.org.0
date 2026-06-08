Return-Path: <linux-arm-msm+bounces-111694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMyONsJlJmp7VwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:48:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BC6533BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=plxY8+cJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JK+pueFI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B574E3033D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1616382F07;
	Mon,  8 Jun 2026 06:43:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEE346E40
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:43:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900990; cv=none; b=gZ4JsZv+SmhOFzZQqrDQf0RdAhbPytqhmDFnDIbpbjzB9SMGbaDyPn5pbJfjtgwnN/YP9GlgAAOrHUIp/OwxcCpuBOa4/rOUIYuWKr6ecQ5lu9lUsMpmKP252c/cLMgXc+fR1SFNB/lOFo2PgxWEqmtmS3VV0bnAhfbNVAKOAb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900990; c=relaxed/simple;
	bh=6M9YqPLaKeOJ7mSiRj7yfV+8Wp+XRMcuv1t0K6U0aDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIiTzBL70MU5fcGi3VidzLiCJhNFP7CHQpZZ54UIHU/DlF69YuCylKHI6cWTNZoNa/sO9wsOKuMmipFSrOpnJyKR16ljctpzfP2spqvaC3vUbZ0IkuEv+6oX2m1IcMXzjH0sP5t2zqExBv/NTnItmY/wdLSjlxEjiPAW2NOT19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plxY8+cJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JK+pueFI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qqja2771101
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7U6p6+gmYs8qggRRdnmv+Jq8
	KCMdmVUDO3GSBfuruGE=; b=plxY8+cJLwbeTYusuTekuXzaDnnbqGclkYBA7IzA
	cV5YudEML+Zz5Ex0DQdOhdKOeBHsBCp7a48ZqQQaxuzVvR0Fg+Bc/xSUPwpFFTaN
	F9GUfW+hJMMqSk0OTAeBNvxAIDD3Wb9HTKJ2a9oERLSenVJaJLjPGq0yVnmP/frB
	88YbGsqs+19eDcZdp7CwT331VMUVtvVhN/7NFiiyW4E6ZK16njzLes0sV5c0GSrh
	fkxCjXvxbDFx9vHn23kIOnvoVkKFAt5rJHqUvHpaoxblnr3HFq+Gpo0E8tW+0fC5
	TsQoCFTDLVI9JPNns0pVDF11BZooqEGWDJRrtUehkOWn0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6e848-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:43:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517582695d7so94310281cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900987; x=1781505787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U6p6+gmYs8qggRRdnmv+Jq8KCMdmVUDO3GSBfuruGE=;
        b=JK+pueFIGDENM+YX++BbimFR/4gVlQNuQRhHHPI0MRnwTeJXDL70QzICu1peB8ZgIg
         YPRaD0xUtOLRX1r0SvoB2VmMKg4xh+sbn10k3U+W+FxwHigL4IzcLpxWxT4uwyTwETzy
         mnBTNuHbpGruBZQm1WrRONWYKPqswjeam0je4tnCpgXwt4A5GKTxONVcQhOgqUVuCSES
         kSZ+LGhCTYqT2hpVI9zhZHK0TJRIyerJEoTHhj16A9yqFlLd6WsvfVX84RCMUJPC+gby
         9DDgUp4/kS69eILud721uyBRpIfpYED5P8xdnsnymDMly2o8yyB3wCJ9Ikb8sFDqlSz6
         lEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900987; x=1781505787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U6p6+gmYs8qggRRdnmv+Jq8KCMdmVUDO3GSBfuruGE=;
        b=pZz427KRzml4w8n+yotM0KBPyz6hIH+ZzZA3f+ShB8gTyMKcPoxzbXv2l3s+5vn3+2
         vcqPmETk38J+mWwkgMr+mnpcyFPjeFmbnosiYM3CjTTCuGMNQg2WQGafA4pLZ769pWEH
         QXxCbi/wOJY0dHPfWMCa90VBj4tJFOE2S1aRkwHDfat2QjM4y9l5htq56FS//3tnfv1r
         v6MOPD3nkqi81eEN4SfQ1kbbroIyzJNBFTOMdOjlRdomtJh+rlAfyilhtAf0+Ppi/uS1
         VifTtYXV90pTpY6vbxz8VYb5wVOY91zFyT3UA3rtkgGr3Fnvfs0uI7GjX3YgH0x5Vfxt
         9zdA==
X-Forwarded-Encrypted: i=1; AFNElJ8TU63GeeShF7auWM451U+rkY4o0HTDpdESdje9Qy391FW/VALsAQW6Si+F2Q2uf+HHNT0nDe4ku7BX6ed7@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpZR40NZ2AjsBkrwrPERoA6rr0Md8Zs+lIpRj2Em8e+sHl20U
	bYdwtlBDjn75hY5BZI31KwxWYDKffoBD6UsJsWJolOplunXeB3xanFd+gVcvWV1xDpcUJ50zS9x
	ilfSQvN8A8f6bgFdgW/CI7Wna/K3+m4RssPEzMwcTG0BLNuUM/Fkwkir4eCd5lPiP1kQ5
X-Gm-Gg: Acq92OHqj8RIZHjAu8SiaHAT6E4G3pHGJa0TjwMgfZf1HOsJfEhgijUcNkVuSX7hphe
	rLlB6Ka8UEUY0CYIqLEPfZr7FWK2qHjk1VQ0mFrzi8wh6WQHNSo7QtFfKcUFcDJES4SX7g493hE
	eUuFnAEob+4DlQDJDCpe1+g6nMq/RPqRDQlttz6esZghO9I5z/ssyHG7ILGz7b4QO9508mVw6Wf
	ky1BmEpjCjB/SfxEbSbWMhoPXmwQHsl0bji32e2VzmaEHen69rJCCbKYMMxX7nof0XozsqYH/BM
	LqhEi20G/zghDhkrV/xANJXAXE9uG837EX3I/bSbgAUuyW7aRuD0qqYRRKCuLQDKjGw1Syp62hG
	VOZMvWU21YodQoUGdWneck4HPj5Od5l51z3zM8Q3vr7eo6BUaILcsnfstkGC3a/gfx+WqJyeHsS
	5dzy+uM385keORXjXE83NjcP84dwFx/+aKR2zYAChAauLqUg==
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr135568111cf.4.1780900987470;
        Sun, 07 Jun 2026 23:43:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr135567991cf.4.1780900987059;
        Sun, 07 Jun 2026 23:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf678d7sm44122161fa.7.2026.06.07.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:43:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:43:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gdsc: propagate gdsc_enable() failure for
 ALWAYS_ON domains
Message-ID: <tkwgmo2x22uo3vfdaydr55kq37nezg4su5s5eip3a3f7wcagp4@nsugsvmmtr25>
References: <20260602140934.796697-1-github.com@herrie.org>
 <20260602140934.796697-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602140934.796697-3-github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a26647c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=fsjeCebvI8nJw_oLxQ8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OSBTYWx0ZWRfXwawBpHaJqgwo
 QZwm5dGj4+H6LWme5lzKNrfdzB2F6gRUvoUN65cpvZvLPZXsUaoixDgkDHXN96mNWhLDLH/k1pL
 72XARQCh4xT7SNnJzioWpmRN7DCHkRS4dJNQC9ioeE/Qs1tk3BrL0viVV9A+ff6mry6ZEKrsE6A
 Gt9BPlvJgJ86o4mplLLhRpaExSYoJZSPopcSx7JF3QXZuANn4Sn/6ee1CdLF4gXX2OVX4la+bXx
 eULtfq/vELywSTZZxaU7bTJW55FYNtGutc/I4h+ngNek/A2lxdquAC3fHjGzExtwv9tWUyLmHx9
 ZR1A00SkjQ1DlwWKy1P+PiefEr3s1uXd4ZMi9DSSvEJCy0hO8YRWswZMgVBZMuuySKDo5QOVC03
 PHP6TtB4LuKKRPwthPHcAaIRMfI/u09LxXB/qvMeQyZEHuU56QLcga+bxvNUUkhD6lImP1lA7nn
 LRQ1TvpVqCsJzSMHvjw==
X-Proofpoint-GUID: T52iI2i4sV6JVr0himvRcEdlX_f9KmIn
X-Proofpoint-ORIG-GUID: T52iI2i4sV6JVr0himvRcEdlX_f9KmIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,herrie.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7BC6533BB

On Tue, Jun 02, 2026 at 04:09:33PM +0200, Herman van Hazendonk wrote:
> GENPD_FLAG_ALWAYS_ON requires the underlying domain to be on at
> genpd_init() time -- the framework will refuse to register the domain
> otherwise. When the cold readback in gdsc_init() finds an ALWAYS_ON
> GDSC powered down, the driver tries to bring it back up:
> 
> 	} else if (sc->flags & ALWAYS_ON) {
> 		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
> 		gdsc_enable(&sc->pd);
> 		on = true;
> 	}
> 
> but discards the return value: if gdsc_enable() fails (regmap write
> error, the long-form sequence's status poll times out, or the
> HW_CTRL hand-off errors) the code still sets on=true and falls
> through to pm_genpd_init(..., !on) -- which then registers the
> domain in the ON state and sets GENPD_FLAG_ALWAYS_ON, even though
> the silicon is actually off. Subsequent consumer probes will see
> genpd report "on" while accessing dead registers and hang or read
> garbage.
> 
> Catch the failure and surface it: returning the error from
> gdsc_init() makes the provider probe fail with the underlying errno,
> which propagates to consumers as -EPROBE_DEFER (or fatal if the
> hardware really is broken) rather than silently lying about the
> rail state.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gdsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Fixes: fb55bea1fe43 ("clk: qcom: gdsc: Add support for ALWAYS_ON gdscs")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

