Return-Path: <linux-arm-msm+bounces-85978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3DCD1DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 21:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4851F3061D79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 20:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0FB338595;
	Fri, 19 Dec 2025 20:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeWEQLYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2582E093E
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177473; cv=none; b=IoLftxiGRWyL3IyT0qed6kJj1Aa69Y/38Iu2XTDWC09JhyKZJGnTKa2bejeUVaiOKCZQEKjFseM+2damh1bdrJBzVFqirF51JQIXeWI2pCZ+T0yvEtR9xNR4kIxcSF54KRXIIM8VYgpSNOxGORqr+xZLY0P2p/SMoudmeysj+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177473; c=relaxed/simple;
	bh=2uEzBQQQWtRp+sJcH1ZQ4xURaTMrXsucyXkYUYunCcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uix5pqoO4gETtc7zqop//XH6+j8dmBCd2uuMjZrw6RU1S8aa3kbmxDnUcx614mznoIYjUW1ApuyE/i6AlYjZ5r9HQydn9qK+lKJ7ZKVZRT9ttRzUjdcP4isvOJ3MbyETCQA6xurb50uy+lLRYslfqBSasKv41495CijFDq9Nvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeWEQLYt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso1325264f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766177470; x=1766782270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWvXjifL3DdZLZBwrViPG2ul+dj2alJq1oBwhJ2GYV8=;
        b=UeWEQLYto0YeellsmmrMBt6YYBLTldKFKtK/uT+ehGYeiY6S35yZezYP5AuvDkSJqt
         YclW3mihQsijnjA9oE17TKdRXtuefL06dFzr3ybGiZ483piUBwHa17e4levKaP+SkLqc
         Z2PoyEdJtw6SbnTQg2i/ibzgEwPbi9V2jqQYuCPqWJ2OzVjo+QhlDA118KcAUI+FgGyj
         YPSJAu1DHrdGsUM2LauuExmatpEzBzxhw7PisxIYD3hqcpOJkft9tWzPzI80B037ha3f
         B89S2fPBWzdEPvO58vrIGrZoGqWyl77Q/grprIrBWTMeEu58tfYcCm/CnzMiUFgGlJjo
         Nwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177470; x=1766782270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWvXjifL3DdZLZBwrViPG2ul+dj2alJq1oBwhJ2GYV8=;
        b=LsFjO3PgTzLxAyQatT98qXHfnMn1TboK3T4PhlpOiAhfHEJChyCKp6b3Mp1TODv25d
         Y2IKVM5D8CqV8T1B8a18sRzAafhywpLcTblUPtOv1tvMA4hPXo+b75rnP2wt2+vj+FQS
         Gy/rG05SkhjYmZvp12oNlqT2HipFisYWUPL5Yn8jPqw5Af97qaYu23Pcfy5nDlJPT1sT
         FPsvcBtINBotAaFtN0X7eYT17AFYV7yDgld6u9mbCFIdiY72qwEn1GyvmPchqLzG9O7h
         q8a5HTzHT/6ypQ9B+dDUcUqEPtTERKPZ3DNMKmhuS96l40TbU/e21XsIyTOe8GcOe0kN
         F+BA==
X-Forwarded-Encrypted: i=1; AJvYcCWyCmhU0ofIcoxArP5tebqKmYt8ixy0CBQu+SsaF9uO3a8rffnNLcTuvMAf2kBo/shVZfNkc3xY+p8pgpp4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1BNBU2rlhW3TDS/1DhLImpJfv+zH+lX7Bt3G9jLqkXdR8EQXL
	OZf6ITDgoUlvSmaw3jaEtWneXUSWkpzJIa8l0ILDNTXTlQRwaSBFeF/FIFPZaZZbk01isSHZMq7
	Gtsc1vyXfr3kruQ8A2q4MwXzKnTrgn8YGB4LlfMb2Ng==
X-Gm-Gg: AY/fxX6XNvmBMI9w87P+DzAX9z0c4/hzXOEGxHUG5Xgm+NQb8jQszpzPSXWY0S7d28U
	ITa+iY/f0Mzck3K4lXsnaW7ciXcRMP7jTdJ8x/v9mTkoJUXR7cm8PtgVFGv1M55H34sQwHsbmRP
	n5MPe9gU3iT2mKgInr6+DGVMj2zxqrfurFN2v0VqIUgjy1/RIwrj5ViTEhyaZASqSftJeVG2mRa
	xjxNUGVtw6bZFXMT+829MrU4EqBUhPh7E8HyIF+XcUknoBJsxznNwi4xEnaeU93TmQfXwk=
X-Google-Smtp-Source: AGHT+IGakMjrjS0V+HjSXPWQpWbplx43XdYM8jjjAPDTeyhMqD3a9HCEG4A0lUMyYh9/xn5Pzfqlw5gcu8eqe4tbxOw=
X-Received: by 2002:a05:6000:2211:b0:42b:396e:27fd with SMTP id
 ffacd0b85a97d-4324e4fda01mr4658908f8f.38.1766177469787; Fri, 19 Dec 2025
 12:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com> <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
 <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com> <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
 <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com> <CAO9ioeVBk0CLGcdUdbixVGwGfheOaVwX=i39JovHa740mO4kRg@mail.gmail.com>
In-Reply-To: <CAO9ioeVBk0CLGcdUdbixVGwGfheOaVwX=i39JovHa740mO4kRg@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 19 Dec 2025 20:50:58 +0000
X-Gm-Features: AQt7F2o78umlcW_HrVktv7_hgHR3QXtloBvEZUbyjIHfwxuPnlTElq7osnyWvPQ
Message-ID: <CACr-zFA0vkn_a=a1LNn_rqrSsKPUsuf+jt8_a3MsHg8Ao30qOg@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry, Konrad,

On Thu, 18 Dec 2025 at 13:33, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, 18 Dec 2025 at 15:09, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 12/17/25 5:39 PM, Dmitry Baryshkov wrote:
> > > On Wed, Dec 17, 2025 at 01:22:59PM +0100, Konrad Dybcio wrote:
> > >> On 12/14/25 8:26 PM, Christopher Obbard wrote:
> > >>> Hi Konrad,
> > >>>
> > >>> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
> > >>> <christopher.obbard@linaro.org> wrote:
> > >>>> Apologies for the late response, I was in the process of setting s=
ome
> > >>>> more msm8096 boards up again in my new workspace to test this
> > >>>> properly.
> > >>>>
> > >>>>
> > >>>>> It may be that your board really has a MSM/APQ8x96*SG* which is a=
nother
> > >>>>> name for the PRO SKU, which happens to have a 2 times wider divid=
er, try
> > >>>>>
> > >>>>> `cat /sys/bus/soc/devices/soc0/soc_id`
> > >>>>
> > >>>> I read the soc_id from both of the msm8096 boards I have:
> > >>>>
> > >>>> Open-Q=E2=84=A2 820 =C2=B5SOM Development Kit (APQ8096)
> > >>>> ```
> > >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> > >>>> 291
> > >>>> ```
> > >>>> (FWIW this board is not in mainline yet; but boots with a DT simil=
ar
> > >>>> enough to the db820c. I have a patch in my upstream backlog enabli=
ng
> > >>>> that board; watch this space)
> > >>>>
> > >>>> DragonBoard=E2=84=A2 820c (APQ8096)
> > >>>> ```
> > >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> > >>>> 291
> > >>>> ```
> > >>>
> > >>> Sorry to nag, but are you able to look into this soc_id and see if
> > >>> it's the PRO SKU ?
> > >>
> > >> No, it's the "normal" one
> > >>
> > >> Maybe Dmitry would know a little more what's going on
> > >
> > > Unfortunately, no.
> > >
> > > Maybe, the best option would be to really land the revert.
> > >
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Is there a chance that this removal:
> >
> > -       case POST_RATE_CHANGE:
> > -               if (cnd->new_rate < DIV_2_THRESHOLD)
> > -                       ret =3D clk_cpu_8996_pmux_set_parent(&cpuclk->c=
lkr.hw,
> > -                                                          SMUX_INDEX);
> > -               else
> > -                       ret =3D clk_cpu_8996_pmux_set_parent(&cpuclk->c=
lkr.hw,
> > -                                                          ACD_INDEX);
> >
> > could have been the cause?
> >
> > On one hand, we're removing this explicit "set ACD as parent" path, but
> > OTOH determine_rate should have taken care of this..
>
> My idea was that we switch to SMUX temporarily, then CLK framework
> fixes that for us while performing the actual reparenting.
>
> Christopher, as a quick check, could possibly revert just this chunk?

Do you mean something like this diff? I thought I'd ask and confirm
first, to be really sure.
This leaves the handlers present for the other two events
(PRE_RATE_CHANGE and ABORT_RATE_CHANGE).
I didn't bother checking the calls to clk_cpu_8996_pmux_set_parent for
errors as it's just a quick hack.
If you think this diff is good for a test, I will check it in the next few =
days.

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-899=
6.c
index 21d13c0841ed0..5d7f42a86a923 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -565,6 +565,14 @@ static int cpu_clk_notifier_cb(struct
notifier_block *nb, unsigned long event,
                        clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
SMUX_INDEX);

                break;
+       case POST_RATE_CHANGE:
+               if (cnd->new_rate < DIV_2_THRESHOLD)
+                        clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
+                                                          SMUX_INDEX);
+               else
+                       clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
+                                                          ACD_INDEX);
+               break;
        case ABORT_RATE_CHANGE:
                /* Revert manual change */
                if (cnd->new_rate < DIV_2_THRESHOLD &&


Cheers!

Christopher Obbard

