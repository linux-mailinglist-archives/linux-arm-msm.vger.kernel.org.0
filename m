Return-Path: <linux-arm-msm+bounces-99654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDeLBiuOwmnDewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:14:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4603091AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B095930672CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1B9372ED6;
	Tue, 24 Mar 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN3QvYqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D126E36C0CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357013; cv=pass; b=NcL4qV9+8fUwMG5ZqyZ73IsA9KGB7/A+j+9B/hZV7N/ZmAYl5RuvxalrfiwR/tMFkI2qaaPymergTrnhiguQTiPqmmE0yzy8enXfEW2DAp5K5rEwf4DjxcjNGX8k0+QbP1uyd+Uoa2WVKpaGQq5J2tYePehjD7sHnpSFmVE+kFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357013; c=relaxed/simple;
	bh=06XpnV8zg64W5RaYQb8EET8nnTo7zdHdhj7IYD7Y5ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFFmgTio0OKWYi97NXvUhiknq47af1M/KxLM7HTxpqW3Y+9B7uGNKBoECKe28U/IIx1pGsfLggVz4QcMYHwgy74ubwJSRlPe3DUpDLTLU8HXZJFgpb6CQIgiY/CepxSE/A+lbaRdRpiJdBTlsFIT0oK2g8bSz6YeIUi/PXW2i3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN3QvYqc; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fff18d44fbso3130026137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774357011; cv=none;
        d=google.com; s=arc-20240605;
        b=g+294oxL6no1ti0ertQGtiKkM+9qGYi/LCqQewdaOQ5/ZRR20o+a3MhBZB292f/KHe
         hFzUoMfWK9yJZ8XzUrZS9XTXnQmArG9ied60r3u8KdjxeoDggUFuuS4XCYWJDh68gmHe
         Rrkd2XEN6GvlkQJacCb6gc/FscNbOnX+kVI00lfAybtnWTPsvnocQvDvkjqrFQ4kLdaT
         0rLifzpcw5lt97b9319SNneD+3NSiO2iowxd/wg9AfHT5j+hCxUM5bLNq/N1S4/P6tGn
         CvJTfRlEoXWCc54CZyipHHQphkFgcfXjYKeUINyPhLYoWCcrGiDkjh7vCgFflISGYJOI
         R4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI8vJKU9Q3yKpt6NPMFT7ralVTCYenpE05X4y0NVE8s=;
        fh=w/4lQ25sQgbwaJs3gqnMsytwzeoipvsFxY49Hrx5GQM=;
        b=L8fUj3bvYM0v/CLyNtjhwAqdF/6cQL359ozKmJk+7zVAqzm8o9qxMiZVxLQPDXXtO3
         XNSnw3007GYq8HMT9q3TIJtJrNEQ82CfH+4lzmGUuUn2a4VpdB3TpJbAFRdKJTtrqcuI
         mA+M5RcBkT/qELSvB3VjilioiSczGmBiQwOdfgkUW7uTkjTRN8wIUDl2OHPuM64lAa9L
         XyW6LMSDhfOCC73nbgKoWchBrUS42hjC1E7+4kYaSXcWhnRfOaYTlzcsXadI3G5aMCSV
         Au83zZ1L2SzTrVFaZXB54hHz4ut/9Y2SEKat2f0XKFIPo/1bKC6kXRqJIi3C4BAKZI1z
         yWBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774357011; x=1774961811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI8vJKU9Q3yKpt6NPMFT7ralVTCYenpE05X4y0NVE8s=;
        b=aN3QvYqcl6uyj5NEijX2PNex8aRZb2yezeS3slMZK4hMaanI6fFhJn7r0sjeCUAtfF
         cJuH/zhIRCbS1ihUb1rvjIWE+q4ObgD5XzDPTcKn5mHgtsD5wXZKiWX3izTA0wv4gHrz
         1RTWbymtNn4nK6V9viKxH7FSD+3Dt4xi8KsWuLtCK5Ar/fk9WHm8lhlak+XXgM5cduGn
         1aFX0Isx0UtedpQ57Xzmg/aBw+ccBg1pZCKE6hR48MMQD7RNNVBjZWRud0XdgO6Yce5N
         mlse64i8HmGBHInIsoJ+9yddmCVNdCdo+8c5f0cUE2aIc5+jpi+6Qwlepqbh7Az+aRSZ
         pw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357011; x=1774961811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sI8vJKU9Q3yKpt6NPMFT7ralVTCYenpE05X4y0NVE8s=;
        b=TmmoO8mkapuupYNYWwNIS+wAhljkPvtr+chitiTR/AMrPhK0H8A4QJSPkoWa7Sf4k0
         pk6BCdH2DY1v0Cr+/lCBIcg3MEZJ80z2o05qj2EGjAsfa2PyW5/Lqp9fr2ZVbeuXV9zS
         HMj1ajPRShAYvSjpIK7gYTlDj2j97/Wjmg/YBrzYL1eMqycXhgVGEZWgN7MLAU9S0uDS
         Y84H3kdkYYNIP4/WwKqKzKToCtzkao81xgkn2zdV5p+egBiW0akig3kZWEi1lASPKI/7
         s1+oWz4vmBWbinBEWA4xyFLAUpBWxRh2s2hsdqRKJKFoLqzuufnc0+qrxrojKVmqS5Qa
         ZOzA==
X-Forwarded-Encrypted: i=1; AJvYcCW5dMvuyMwS/7mFYYueKSsC6KRv78+Pm8DOyDPuj4apn69Ca//61fb93LaK+yOo8wvosu3YNPxAxCfRw5l2@vger.kernel.org
X-Gm-Message-State: AOJu0YwHiKs+TcUra3bZFNncLOhbFQsuRBZwFPb49wGC/q1kX/T0xKZx
	SWiJGHKQpvqZug2txFlhlW/5zt/q6Ex8WX8WCMHQMx9R1ScjVgj1oYFrZLr9FK+5auefsM7xM+G
	6knluCLe/7YMrSkB385Jyku06CjYkSxo=
X-Gm-Gg: ATEYQzyZpCpMYl7APSh5ZTSr9lNPs+NPkQbY7Pe0PRbmc7gdkwKAp+8FdsRUSkfmk0P
	NGmfDFaANghmxfwqvFODtWaa9RW0V/pBRb71v015VymvXUgpTvjJxu12GaqNcxF0eo/PudMg0Nv
	AKCT0vnytoPmaqxHm3xUFzfQggKoh2tCVsj9pyzkjUJq/D0VMPtJowUHy6pI8shgfQtEaLd6O8X
	+Ne0Of+RHXsMDRW40Gch9Xi8wc3mbaBGd+ZK/7hbiqkiv1xydRNtzRsutnQesSyDj9XwlcRK8wG
	LlTkcBA=
X-Received: by 2002:a05:6102:419e:b0:601:f74d:a671 with SMTP id
 ada2fe7eead31-602aed4261cmr8703142137.30.1774357010730; Tue, 24 Mar 2026
 05:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com> <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
 <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
In-Reply-To: <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 24 Mar 2026 20:56:22 +0800
X-Gm-Features: AQROBzAXlHTH0sfKTDTSX1I53HFppyLBw_k9kVJKjc_1gSsUFMxL32yKmCv63JM
Message-ID: <CAH2e8h6PB43h08aZsHmN68Cp5HHuEEmhD3WhF7KOaQGyqvHjsw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-99654-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AB4603091AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 5:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 8:23 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
> >> On 3/21/26 10:50 AM, Pengyu Luo wrote:
> >>> Recently, when testing 10-bit dsi C-PHY panel, clks are different
> >>> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> >>> now (dsiclk_sel =3D 0)) And we failed to set dsiclk's children.
> >>>
> >>> dsi_link_clk_set_rate_6g: Set clk rates: pclk=3D172992000, byteclk=3D=
108120000
> >>>
> >>> byteclk was set first to 108120000, so the vco rate was set to
> >>> 108120000 * 7 * 1 * 1 =3D 756840000. When we was trying to set
> >>> 172992000 on mdss_pixel_clk_src later.
> >>>
> >>> Since there was no matched ratio, we failed to set it. And dsiclk
> >>> divider ratio was set to 15:1 (wrong cached register value 0xf and
> >>> didn't update), we finally got 50455997, apparently wrong.
> >>>
> >>>   dsi0vco_clk                1       1        0        756839941
> >>>      dsi0_pll_out_div_clk    1       1        0        756839941
> >>>         dsi0_pll_post_out_div_clk 0       0        0        216239983
> >>>         dsi0_pll_bit_clk     2       2        0        756839941
> >>>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
> >>>               disp_cc_mdss_pclk1_clk_src 1       1        0        50=
455997
> >>>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
> >>>            dsi0_phy_pll_out_byteclk 2       2        0        1081199=
91
> >>>               disp_cc_mdss_byte1_clk_src 2       2        0        10=
8119991
> >>>
> >>> Downstream clk_summary shows the mdss_pixel_clk_src support the
> >>> ratio(35:16)
> >>>
> >>>  dsi0_phy_pll_out_dsiclk             2       2        0        378420=
000
> >>>      disp_cc_mdss_pclk1_clk_src       1       1        0        17299=
2000
> >>>  dsi0_phy_pll_out_byteclk            2       2        0        108120=
000
> >>>      disp_cc_mdss_byte1_clk_src       2       2        0        10812=
0000
> >>>
> >>> After checking downstream source, 15:4 also seems to be supported,
> >>> add them two.
> >>
> >> I don't see that, not even in the newest releases.. Is there even a re=
ason
> >> we have to list these divider pairs in the first place?
> >
> > https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c=
8a8d21ad8e8733d61f6b69ab
>
> Ahh branching..
>
> > We need those dividers to correctly program pclk RCG2 clocks.
>
> I would assume that's the case, but perhaps the real answer is "because w=
e
> don't want to try all possible combinations"
>

So you meant the pixel clk can support any ratio actually, and just
common ratio pairs are listed? That is interesting.

Best wishes,
Pengyu

> Konrad

