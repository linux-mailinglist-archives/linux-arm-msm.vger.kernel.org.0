Return-Path: <linux-arm-msm+bounces-82317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48BC699ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 215B22B5B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5844F30F52A;
	Tue, 18 Nov 2025 13:37:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AB34B410
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473049; cv=none; b=gvlowiU63Fhkn4s6vM4HhLKN41vzcKqU/W31GnJRbYdHuEEUKGWucbAuFr9Nq69zGadry0ELi/xvJS2PfJFv2EGezLyvmyegg9q+slGlRw5FVaM2jWuB4n3OcA2CoCgE3+tvzeac0xyQP1vrI4urvs1Z1p2fetlh7gC6NTfubvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473049; c=relaxed/simple;
	bh=aYLtYDuLNVEl76fJnhP2Lx52h1KY2MU3wh/+LjbIA0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNAO51xVZbo+Gn3+0Ws8w+DBp4RLOdECDOHWo85VqbyurNAX5gRd0+ixF7dRcDCSFi9ln6bcBoz7xAfzh1m2kS8tDBNiNWZ2siPlZNyMkMle32cTbgocVw6jepC7VQEJ4+Zq1Eer0wI6jpPHa1fEvb+t2o/09eRpRjnQyT+TOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5599688d06dso1233325e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473045; x=1764077845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAgEnjBHe9vjRkHMQeQGLB6OvwD2DqiTQj/HhxtNAY0=;
        b=RfEfc1EDwc11bS1EmkIaZMZ0T50fWtVOOOxzg9zONheUlI/RhyTyaENREs+y4ReUyl
         mEJeWcjSsFpGElmxs0gziBKIR/a1zf4rRPujCDJJ2yN961KwZvp9xzSjkkeruE63pQ5p
         NGQG0R4SuQHf5iLhL17xAMdMowL0qPPzxwZ0h6+L3DkYvHDhSqUwqtj6vCWpdQgjtQ5t
         KDQaHyp0Csu3YOVbY9WVxNU5cW09QQBiD1PymeuCK7KKu/fscEyCjmQqTPi6JZG7UGLb
         yoqzxKL1npzkz3IwzxxmDdwENtMM5/rFhqjr20ixhYtMX1JszR70EWtFKO1Nfh8XE8Re
         IDKg==
X-Forwarded-Encrypted: i=1; AJvYcCWERMMefJG+XBoxOG3SLr1fDYGlz0XUZbgbbwU4t6SgfEvCB68akEkKyT3SwfVIa3GvDRpnk4VahvzZJWF/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn7fAYhrjopi6mGSpvQfXPio0MtCA2ObosEItrdsskS64TpWls
	JxqR9VPVHJm7a7TP6XVSTKjBIpd5eGwVFbxfXfLP5Wq7onk14U8a5eUoiDhaEUmy
X-Gm-Gg: ASbGncuYgLagIEDJ4O5go3/Hl+K31zgF2e098EvFCwc6i6pHs4M6fwlxzwh7MSRe/R8
	HdwO7rzSCrcprBOpVKeqFUBPro24L/PwNg1ElWGMKL8PNSJ7wgsXF60rttj07xwi0R4JSTtV8eg
	Ljxrz9cY3CKqLWoTIVnwgvOS6mO8z6l+n6nSweOze5/suBwdpUyaUyEafSeD5QeQPl0gSPkdFOX
	OEBEsOYm/+CLW+DZIq/JInVC2cyWDFxXUwgn7CMicDPej48eDm08tffXHlJg87jzv+ZPqNj3EYk
	caydzKtEpWI1lXGbUJcTNnZlKDxZCpsWSqkqRd6lk7CwvUwgpQ89gKx+0zdjvOegwrth79/hV15
	89xwMAopZ3oq59Fg4bUk1Cqzw6kv+e1RxrorHzuCO4kxRapeynElv+JtEahqJ2MiMwVSorbnsp7
	KuzqD3NAWPdLkioVWywKm1+Kt2WUlxvNwtVLB41DOnklCwVO/L9nb9Y5yXf+GVCGhPHz7M1Q==
X-Google-Smtp-Source: AGHT+IElbEcW5LTXMzWrDLBYlTVhJXgbr6kYCuvcjS3OVuZ5u10OAhgHDj3Eth9MwouEqiVyGc6bkw==
X-Received: by 2002:a05:6122:468c:b0:559:85d5:bfbd with SMTP id 71dfb90a1353d-55b1be9524amr5003049e0c.9.1763473045170;
        Tue, 18 Nov 2025 05:37:25 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f35db02sm5322457e0c.9.2025.11.18.05.37.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:37:24 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so2244771137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:37:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVg2dKScDTIYKCfJq2YpNdyPk+kYqvWklR2KmNDy/4JIUlFhYNJV1jjIS7FQ1qL6O/fgg/Cj8YArezZ0Y4S@vger.kernel.org
X-Received: by 2002:a05:6102:5810:b0:5db:ca9e:b57e with SMTP id
 ada2fe7eead31-5dfc5b94a4amr4590345137.43.1763473044116; Tue, 18 Nov 2025
 05:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117062737.3946074-1-quic_utiwari@quicinc.com>
 <121a5d34-e94f-4c29-9d58-4b730757760a@oss.qualcomm.com> <283e7a7d-c69b-4931-8e54-d473f0209abe@quicinc.com>
 <306f6354-1502-4b9f-9a28-dcb7a882b367@oss.qualcomm.com>
In-Reply-To: <306f6354-1502-4b9f-9a28-dcb7a882b367@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 14:37:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXk91aKo6n97y8eGhfB3Ngu66mzqWhgwe3u86sPx2iaSg@mail.gmail.com>
X-Gm-Features: AWmQ_blb27zH5h3ZZ3oFEsGZzTMAKs0a-KLhrPwJAU9pj_AZJkAdwgdJpubgSzw
Message-ID: <CAMuHMdXk91aKo6n97y8eGhfB3Ngu66mzqWhgwe3u86sPx2iaSg@mail.gmail.com>
Subject: Re: [PATCH v4] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Udit Tiwari <quic_utiwari@quicinc.com>, herbert@gondor.apana.org.au, 
	thara.gopinath@gmail.com, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_neersoni@quicinc.com, kernel test robot <lkp@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Nov 2025 at 14:08, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 11/18/25 7:46 AM, Udit Tiwari wrote:
> > Thanks for the review, please find my response inline.
> >
> > On 11/17/2025 5:55 PM, Konrad Dybcio wrote:
> >> On 11/17/25 7:27 AM, quic_utiwari@quicinc.com wrote:
> >>> From: Udit Tiwari <quic_utiwari@quicinc.com>
> >>>
> >>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> >>> runtime power management (PM) and interconnect bandwidth control.
> >>> As a result, the hardware remains fully powered and clocks stay
> >>> enabled even when the device is idle. Additionally, static
> >>> interconnect bandwidth votes are held indefinitely, preventing the
> >>> system from reclaiming unused bandwidth.
>
> [...]
>
> >>> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Closes: https://lore.kernel.org/oe-kbuild-all/202511160711.Q6ytYvlG-l=
kp@intel.com/
> >>> ---
> >>> Changes in v4:
> >>> - Annotate runtime PM callbacks with __maybe_unused to silence W=3D1 =
warnings.
> >>> - Add Reported-by and Closes tags for kernel test robot warning.
> >>
> >> The tags are now saying
> >>
> >> "The kernel test robot reported that the QCE driver does not have PM
> >> operations and this patch fixes that."
> >>
> >> Which doesn't have a reflection in reality.
> >>
> >> [...]
> >>
> > I may be misunderstanding this comment but the bot flagged W=3D1 unused=
-function warnings under !CONFIG_PM. In v4 I added __maybe_unused and Repor=
ted-by/Closes for that exact warning; I didn=E2=80=99t mean to imply the dr=
iver lacks PM ops.
>
> The case where the tags would apply would be:
>
> A patch is submitted
> The patch gets reviewed and applied to the tree
> Kernel testing robot reports an issue
> You send a fix-up patch (incl. robot's tags)

Exactly. The robot's report even says so:

    If you fix the issue in a separate patch/commit (i.e. not just a
new version of
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^
    the same patch/commit), kindly add following tags
    ^^^^^^^^^^^^^^^^^^^^^^
    | Reported-by: kernel test robot <lkp@intel.com>
    | Closes: https://lore.kernel.org/oe-kbuild-all/202511160711.Q6ytYvlG-l=
kp@intel.com/

>
> [...]
>
> >>> +    ret =3D pm_clk_add(dev, "bus");
> >>> +    if (ret)
> >>> +        return ret;
> >>
> >> Not all SoC have a pair of clocks. This is going to break those who do=
n't
> >>
> >> Konrad
> > On the concern that not all SoCs have "core/iface/bus" clocks and that =
this could break those platforms: i believe the PM clock helpers are tolera=
nt of missing clock entries. If a clock is not described in DT, pm_clk_add =
will not cause the probe to fail, also on such platforms, runtime/system PM=
 will simply not toggle that clock.
> >
> > I=E2=80=99ve tested this on sc7280 where the QCE node has no clock entr=
ies, and the driver probes and operates correctly; runtime PM and interconn=
ect behavior are as expected.
> >
> > If you=E2=80=99d like this handled in a specific way, please let me kno=
w=E2=80=94I=E2=80=99m happy to implement that approach.
>
> No, you're right. I took a look at the pm_clk_add() call chain and notice=
d
> that clk_get() (notably not _optional) is in there, but apparently its
> retval is never propagated if things fail
>
> (+RJW/Geert is that intended behavior?)

I think most checking is done before calling pm_clk_add() or
pm_clk_add_clk(). of_pm_clk_add_clks() also calls of_clk_get() first.
So that looks intentional to me.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

