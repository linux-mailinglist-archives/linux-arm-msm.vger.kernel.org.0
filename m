Return-Path: <linux-arm-msm+bounces-42964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 891719F901B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987471890D73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D630A1C07C4;
	Fri, 20 Dec 2024 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oyBlyPnz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522F1A8402
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690118; cv=none; b=RNJs55/DFJEzHGazTZGaphFnBA+iZAuen0AWRmXrDECaOmprxjXdlcDBvct/iC9/vO03EvtNGJnbsULRSygap8BgcPav7lcCDhcVVOqybeFPt7eMyCo2fEkifHTLu3l06XNqjd1WUMVH7bWOTG+gouhCHr7Sq3mod/At8wdX3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690118; c=relaxed/simple;
	bh=pVZaHkvdqKRcNvk4Ntas94k1G/NPGK94bJRewixfG+k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YxMUg1u7cgDdWWzr1XO5qD2vg8tf/Zb/hBhyxce5sT1eY8V9HtUmu3sLnKTj+NxeXh6DT0d6PH2tc00LWUBaTi/zIkBxt3aBX5NS7+OMaYrU1taRmwFAwyfRPccYNmEYWVf9CXdB0H4bjZy9T7SjYKmpCclNpxkoFbPAM0gJe9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oyBlyPnz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436341f575fso18317105e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734690115; x=1735294915; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hT9t7+Z62cNmrY6P7S0u2gAF6V0+KPuKWiIzoB2HDA=;
        b=oyBlyPnzeKJYDd4OWJNJM6YKL02Scnrfx/MfJ5fST24BNntTFcYkihK8/A9oCYzklk
         houHOctIEdk0Kxmra28t3u8sPcrt8WlSUZq0lsilg/HsQAVxdQhTilpGsp5cVMsg4Mkv
         VXH5bzfPdU8KJhCmFgMfMWqWTlmtkKydbchEocH+nTDBw2KcGu9xgKXrdXJpenHJuntm
         ZbBeUkqDATWNBqVt65HjvcZujqSz9OLDE1lCATJwgI+H5dsp+grMIVT1F/IOpd/yk5V7
         Mqt6Yu0SNNxU4YxMI91sbCd7MamIOdjb9VsfDPLRR57f1DeJ3ljFAy1aQO6TcA3J4Zul
         8noA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690115; x=1735294915;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hT9t7+Z62cNmrY6P7S0u2gAF6V0+KPuKWiIzoB2HDA=;
        b=fSVdpE0Ssfz+dnGsGKjsA44RhvOwo4+ciqx5lbwsoBT1/LuMkw1sd7ak0y6IMsYxh0
         KiFApoRtUMgoOPky3MX6FFiNuJ2kuyBS+ex1hihNDA/UPHFqqZZFo9L+Jd+fReSSShF4
         jdwyn2dwBuvngq2+MiJhe5kU8OdQVJTGLtkz8jwTwjh5yD0WKtKaDHkUFgdeXq5Nsa0G
         t1oM0FnycfMbZipZwIMmdVlK+UOTvj2lUERNswK//y4qhUzKfebiVpRcdXq5RyxrhEpK
         2YFtAkeTKXEr5G0oXDktifqtSqaI3GMNirz/TaU7NQNmjyfQNB1H6ZjnS7fvyVy7ZYul
         NtYA==
X-Forwarded-Encrypted: i=1; AJvYcCVazWsbH9pRWunYzk4tIR+jCqjXqEsRBZC/5wTUGfbUYbyKPMCzQ2rCQQjwYDk5qZQT4SMZnCc379N2M8sq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1qpEWJOZBNljWU0/ZUgaG7I9KHPhVl314oDDKZXajhtvLQ5j
	nXJYQ9W6SUqUHn7TC6hK34Ip4aap9ADK+uKYQv2Vm4vd4czCpehVV8GBZRXD7l8=
X-Gm-Gg: ASbGncu2J3YB2/JEsjvPBsk6Q7H4u+F8dYwQ6WIHS+mvcPkEfbg84sNPTaw5Mmafp2j
	RVUVjq6gBNNLMalEDLqHe6J6hR5ksGGJob0lRjC4k1VeNXEg8cn/zVKda2RfQJLO5VQjjP735MZ
	WNCC130mXcViffJiNai5snglZ3hMo0CIEs3PfZy6/l/Lwua6T7kTKu1Od3XEy9yU+L1rVbYPDki
	r6cKXZGMSfcTvxD7R4ZzGxv7WcgmVgZMLfdvdHdC5UOTmgLI2igofgac9GVmPf574FK3RNsYvZM
	7oIn/VbGUkVdLtQbHLyDUk+K0Q==
X-Google-Smtp-Source: AGHT+IGfJzQyjs0tcbRlEOFSR6IiZW6L1coftNmeUL8VBSiDokEXLJGOVBXvHFoRemCYvC2ySUKHhg==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436678f5775mr22693545e9.0.1734690115475;
        Fri, 20 Dec 2024 02:21:55 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119d7sm75380985e9.20.2024.12.20.02.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:21:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 11:21:54 +0100
Message-Id: <D6GGBPC4V5XV.YU8Z2KASBH07@fairphone.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for
 two clocks
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@somainline.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
 <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>
In-Reply-To: <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>

On Fri Dec 20, 2024 at 10:42 AM CET, Konrad Dybcio wrote:
> On 20.12.2024 10:03 AM, Luca Weiss wrote:
> > If a clk_rcg2 has a parent, it should also have parent_map defined,
>
>                       ^
>                         freq_tbl

I was basing this on that part of the clk-rcg2.c, so for every parent
there also needs to be a parent_map specified.

    int num_parents =3D clk_hw_get_num_parents(hw);
    [...]
    for (i =3D 0; i < num_parents; i++)
        if (cfg =3D=3D rcg->parent_map[i].cfg)
            [...]

Should I still change the commit message? I guess there's no clk_rcg2
without a parent at all?

I guess I could reword it like that also or something?

  A clk_rcg2 needs to have a parent_map entry for every parent it has,
  otherwise [...]

Regards
Luca

>
> > otherwise we'll get a NULL pointer dereference when calling clk_set_rat=
e
> > like the following:
> >=20
> >   [    3.388105] Call trace:
> >   [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
> >   [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
> >   [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
> >   [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
> >   [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
> >   [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
> >   [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
> >   [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
> >   [    3.455886]  clk_set_rate+0x38/0x14c
> >=20
> > Add the parent_map property for two clocks where it's missing and also
> > un-inline the parent_data as well to keep the matching parent_map and
> > parent_data together.
>
> The patch looks good otherwise
>
> Konrad


