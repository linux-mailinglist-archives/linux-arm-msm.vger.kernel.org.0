Return-Path: <linux-arm-msm+bounces-91732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JQiKP+CgmkyVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 00:21:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07578DFB27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 00:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 797B2303A871
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 23:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6467E792;
	Tue,  3 Feb 2026 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6I7k67f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4032F39A1
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160883; cv=pass; b=WoJZJTFrVYi6UgbMbe4ZXumX7jbKSFGinQrkxCUkio7ho6hvJ343ojZX2fpUD62sytP6WmJhWyO6uBqde+65Ojq9ZpcNdaGwyTlPT8okAHxQJ3dLgP9bsmtbmlZiEymvrCmWINxa/58b7xIRVPdBNJtaATzwj9w56Fznqa/x0/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160883; c=relaxed/simple;
	bh=9rZe+6k/pw5ZiVmvM7tDCZmxWnx7S8gg+l4C4gQmqag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNMubSyR4nSFE7NoFv8aQ2q9g7C2mxyvqBS5PLuSsddvZUImsSX9wI7ngu3X4P/aGGzOpKFYaGk1+o2C88RK0h5AW87IiGTjrbYymoiusbzww3rgSsXO7PJpz4PbNo5dgsAQzReE26BOUU4LbcL7NtSNY535hQQ3jyFPztuwaNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6I7k67f; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so47670951fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 15:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770160880; cv=none;
        d=google.com; s=arc-20240605;
        b=JBxzg4tUTxU/PPfisRLxLfx7XIxGK5Y+wFpQU/y3P7RO1FXytI+j/eBZDIMGnxe8ZN
         UgkSdIA21qPpsQx6gH2IPfH1hYjCy4HY2dqPU3EYuTvFeWM9VCPp4ST/M37JnOCmBzVR
         W+WFy/HLseu9vakfmBusV7jALzDo37Akqx4YBH9cIQkm+7p1MJo+VvIdjhbLLcLUTOeL
         mqBfaGIHKlihKIw/MlqXfza554I1wwQxtBA9dqnOTQTb5Cv+TFiCITwtacmw4gg0jPgF
         GpJ7qEZfbmKkF7d/C9oeMILygIygyxjLr50V6RKaKLAOTCT0/f7Vb6X/mEfEkG+eF2GM
         ygkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eC1WOLsv/3bKDyARmHhZ6mlLb3rvFcNyA7jeBOuOSAU=;
        fh=flgoJHMbg0v1m4sy+N1g46S2qwdll4muDCoO+uFb0vI=;
        b=QSnMwLim1RmgjeF0NvjBj9ZFMz7ZgNpZjbZOfIchCTCw838GJyUfIdOYAWFROV9VLW
         1Aa179DhT61dzbDhJPKlorRvS4/IGLQ+CeNN50Wk2FAjIGgZc8zkqcSU1Z8WpEoxLdU9
         NS+hT8grlMb403kLMOMg+7QqZ/P5Im1+mgTqX0GpecqWkEv4xPNbupKzOtFa9qGllzyf
         80Ok7wAywkxFpWiARSD0wx7HQQW88ZsDOm3ZA4s5dijH6MOzi2X38HgQzuTY8+csTVi4
         zTuJueTtDmPyScBeOJyADSRtok9/oKCtw/jyfSPjXmDVVMb/kdU1hwlnkuKH4srcC2yz
         uBBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160880; x=1770765680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC1WOLsv/3bKDyARmHhZ6mlLb3rvFcNyA7jeBOuOSAU=;
        b=H6I7k67ff7HT6h+WzVP8yCp+rDQ8MHWe7hWQ3GGqBrl+tYr+OXLoIII1dqoaptUe/6
         EHihgstOrV4iVSpUpyGcgN0M5wSsYLqhJ5//KLsck7srtMXPMvix6hcpulhUl+wvthA3
         D41CrOksDKGSL6JqzD7Jxh/R98B1tN9m5CHj08peMUKmetuMclSvXWWoM7Ws5a+p0Mw7
         eF/77kUMDLUWUCKY0ivWZo7BGpEyKYY1yPm50uB62Q8c2zlDkVc18TdyjIRHFWJLMnkk
         33ubBW9NfS/hsrBCBZfMhaMFWJPKdxGm4AWsK/oTD+h3EQu3zZNpAUHuGNLoNWl2NAhh
         tz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160880; x=1770765680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eC1WOLsv/3bKDyARmHhZ6mlLb3rvFcNyA7jeBOuOSAU=;
        b=nn5X0nljbY5cbrUCs1tsDUQ7VFupuJRGx6eXxC5S1x1kR2DEbbz9/QMzmj/GPotMFN
         VS4O4pxCUpfYBpDCU0MegGxDKfS73QePR6U+wAyU7S7PMbmvFeI2DEZxbZyeu+ZPmnhl
         3H+TYw39Ij+xJpEZZaLtZ4AbMvlXiHt1lqvu8QqDoKAF/X797/SxmYwJe8mnTZ/y983B
         s+jOB6W7ArhEvMhHkCPPW7wYH+tyTIXaBRTISWm7azy9Dsi2p8y1wHdaB5sGAVD2lgg6
         JMLDkYuaYsTEif4rA/FwXhQezEZPVOB9NRSYaisvXT3ZOaPcn893l6rmAWFpzlid+P6R
         1HHw==
X-Forwarded-Encrypted: i=1; AJvYcCWc8HQaKYndkCD8agDqRBir1pejsBJvOlU00CmAIRqUfwhbRX99zwbCaoeWzF8NhvyuifUnL90ccn+ViIjb@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhNBQ5yR554BROOwNCeLoCDAE+LKQeDL0TviLnWMEcQhcEWuf
	scanJpwLxp83ym2l4yRKUaGCYAMd3zc2ooQ7yoSWyHtJYD9ugDJXl+6Ne1tU0ujMSWuphSnjwRT
	chKqFggkbSs9VhOOCxMJAIjy7mX5bnHw=
X-Gm-Gg: AZuq6aLuQcKnFOyGCLHhDW94nS2bmYLkepwnbYLRDGjs/mH0MoPsk7euF5KGy6IgFYl
	fWvSnEc9w1Ge2Buolq3vMF2HCXAdk758wBqfNrJNA4nmwOFtDvpgf2MBTxVXeKK6ziz4AbfWlTy
	pfycFQMxfRxCKilT3qebZu3s8KEA2JV/xsLNe2ZznThe2QUl2Z5V7lywvFV/dACRC0fRVl92auf
	j9crA4FqGibM3//Zng0ers+uQHFphaNp9fsmjg9uGit9NI5a56OxVOk/ya4/EufnrtKeeqBBKFJ
	sV4KQz9Q++oY+Zp4AnR1Lcr6GSUBP18yQd1m+z/0auWGcP1qgvKKqmiM
X-Received: by 2002:a2e:a5c2:0:b0:37a:584c:23fb with SMTP id
 38308e7fff4ca-38691d5a6f7mr4867511fa.20.1770160879408; Tue, 03 Feb 2026
 15:21:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com> <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
 <CALHNRZ-3nr+EF_m3UpLHRfv3bpOdzzxSZfnnk99xH87MM8WiSg@mail.gmail.com> <f4420072-4540-4e90-a22d-02b79784c3cb@oss.qualcomm.com>
In-Reply-To: <f4420072-4540-4e90-a22d-02b79784c3cb@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 3 Feb 2026 17:21:08 -0600
X-Gm-Features: AZwV_QhxO4oadINA6_NILHxio4JNsfA62ZRBJTQlUGUjWpZeS-FgiwLtnR7cpz4
Message-ID: <CALHNRZ_k6ePOC0AuJR_-RUF-bts=pkWpcrB=L8=HZbQQTFnqmA@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91732-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,0x0.st:url,googlesource.com:url]
X-Rspamd-Queue-Id: 07578DFB27
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 12:35=E2=80=AFAM Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 2/3/2026 4:31 AM, Aaron Kling wrote:
> > On Mon, Feb 2, 2026 at 3:35=E2=80=AFAM Taniya Das <taniya.das@oss.qualc=
omm.com> wrote:
> >>
> >>
> >>
> >> On 1/28/2026 7:33 PM, Konrad Dybcio wrote:
> >>> On 1/27/26 11:48 PM, Aaron Kling wrote:
> >>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifical=
ly
> >>>> for Android, using mainline kernel drivers. I have come across some
> >>>> missing functionality and failures that I would like to inquire abou=
t.
> >>>
> >>> [...]
> >>>
> >>>> * Some gpu related clocks complain about being stuck off during boot=
,
> >>>> causing stack traces, but the gpu does work. I tried to do some
> >>>> research into this, but quickly got lost in the weeds and I have no
> >>>> idea where to even look.
> >>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> >>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> >>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> >>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> >>>
> >>
> >> Aaron, if you could share the boot up logs or stack traces it would be
> >> helpful to see what is leading to stuck at 'off'.
> >
> > Sure. Here [0] is a kernel boot log booting to Android launcher.
> >
> > Aaron
> >
> > [0]  http://0x0.st/PbLh.txt
>
> Thanks Aaron for sharing the logs!
>
> This warnings seems to be due to below ACK change which tries to proxy vo=
te on
> the boot time enabled clocks. And the same change is not part of Linux ma=
inline.
>
> https://android-review.googlesource.com/c/kernel/common/+/1164507
>
> Can you please see if dropping above change is helping to avoid the warni=
ngs? or
> please apply below patch and see if helps to avoid the warnings.
>
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-s=
m8550.c
> index f27140c649f5..55dee8a96e74 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -825,7 +825,7 @@ static struct clk_branch disp_cc_mdss_ahb1_clk =3D {
>                                 &disp_cc_mdss_ahb_clk_src.clkr.hw,
>                         },
>                         .num_parents =3D 1,
> -                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_DONT_HOLD_ST=
ATE,
>                         .ops =3D &clk_branch2_ops,
>                 },
>         },
> diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8=
550.c
> index 7486edf56160..2cd27cb835f9 100644
> --- a/drivers/clk/qcom/gpucc-sm8550.c
> +++ b/drivers/clk/qcom/gpucc-sm8550.c
> @@ -330,7 +330,7 @@ static struct clk_branch gpu_cc_cx_gmu_clk =3D {
>                                 &gpu_cc_gmu_clk_src.clkr.hw,
>                         },
>                         .num_parents =3D 1,
> -                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_DONT_HOLD_ST=
ATE,
>                         .ops =3D &clk_branch2_aon_ops,
>                 },
>         },
> @@ -348,7 +348,7 @@ static struct clk_branch gpu_cc_cxo_clk =3D {
>                                 &gpu_cc_xo_clk_src.clkr.hw,
>                         },
>                         .num_parents =3D 1,
> -                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_DONT_HOLD_ST=
ATE,
>                         .ops =3D &clk_branch2_ops,
>                 },
>         },
> @@ -415,7 +415,7 @@ static struct clk_branch gpu_cc_hub_cx_int_clk =3D {
>                                 &gpu_cc_hub_clk_src.clkr.hw,
>                         },
>                         .num_parents =3D 1,
> -                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_DONT_HOLD_ST=
ATE,
>                         .ops =3D &clk_branch2_aon_ops,
>                 },
>         },

Both reverting the clock sync state support and setting the
CLK_DONT_HOLD_STATE flag on the affected clocks do independently cause
the warnings to stop.

So this is an ACK issue and not related to mainline at all. Sorry for
the hassle. But while the topic is here, is this something that should
be sent to the aosp gerrit? I'd be willing to spearhead that if no one
else is planning to. But I don't know much about the underlying issues
at play there, so if anyone that does know more about that is willing
to, it'd be more efficient for them to do so.

Aaron

