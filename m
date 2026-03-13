Return-Path: <linux-arm-msm+bounces-97392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EB2IeTes2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:54:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41B280EAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 842063016BB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EE638A705;
	Fri, 13 Mar 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlzMQ8ZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7938838E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395681; cv=pass; b=AUMCIvxFcYHuRsnI5F+h6iRfSzRYCFWXgxS41fKO5SeV09sOl974QdXaPM34+iv+YD9eAyIC0LeYIfuQuoPRyfqG7Ptsjc8ycOzzlLtNcn90bCWsh84syQyUSLhLqBAHVnChoj+Phvt3u1+j630jdAJ8TdtnpMjn71XG/Rk/EMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395681; c=relaxed/simple;
	bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdrb/CjuLMlBl+UUgU/SeNOdVI/fEcal+3A3lfBD8SRVci+fAkE3rLGYwYZDbwPrgzo73EKD23WhV64RnknZHJBf9SpdogEobwyIe041Ecn0FxnWxd/RJLjFQZaTw1XMhScOBvVcYpRFE3smowH9o1Tgy9q8h688037YEvF3h/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlzMQ8ZU; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56af6737b4fso884086e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395679; cv=none;
        d=google.com; s=arc-20240605;
        b=IJbEVW0D9lTxGDWg1aw348wG5MtAZaWGPa0jQRMgUCr/5GOi8CT9I9Vm9jF9oUgP4x
         vfT11Gve9DUePeZBXJVSv7OEpKfSyQtIL9uFctAc+6ekG+JUhM1mrueI0ryM1Ofrg5xy
         HNFSqmYH1Aqnjf6EWBgPLYjXo/NBClIrHBGiVCGRkDR2YP9UYhdfkvRQOZjjLfpSVJkx
         YudA6zWbu9TbH+3WMrKDkhJyQRwjRpQzS/Kp97cVoXMcEyMpfFOEVs2ULoJ53s2pGztV
         pCsVMPemLeV7evQ1HjK0LIiCwz7ZNSiUFOoX+AclOiEf89/+RMAmKTpqzLjRaEcsEqVt
         f7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
        fh=dyQqNzpeNGR3iV+1ul3lyvwbQoAQ8R2Os4XhFXwWggU=;
        b=Sftit4Zlcco02NU0wZJFbGY+tYMi+ubbgQCru7mb8V9GzogQaSooee7QRhNWi4rJ1l
         /D8nZ579It8XXA8lLhqJNQgXbBF9GCLcJgVd8z3niDPZbjOFNHW15sf8s90nUiW+Vxmz
         RNbxket59PFgdym4rgqgYYNgxiYbDuHrGgvaYUK/McgEbtYO3Xe86MHBH+eoHKNBQmZn
         KjTm5aFph5GgW8jRpoDidtnyuJsaNEn+XPJI/G5cWZduJdxGkY6Lh9jqtTTjqs3vVAaR
         6ix9SeXm/TPUkqgBXVj5SetACBdq0A5r+UTbsKPm2soQ6DWnBI7loh0b1VD0sydALx/w
         gSqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773395679; x=1774000479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
        b=hlzMQ8ZU7hV5rqi/LkjlZfiaq0Xks4Bl36HaUSGaEkBuDIxFWjE6vcLWMHZeagIh6P
         k4B2fOjeiUj3+JDnkpBcZVHrlgX6hq0hBOMICBzXuELU7TzxuBP96jRXV7NTXhzdSq2z
         pZeuHGlhFNeLBiEncF7x6IwYVMPH7oIgFjLOMyLl9DuBil4Q3L89o2KQi7fp96lRVI6r
         d7y6B0PekUivyRL979CIynL31avqcCO80TE2U/riIX4kI6yMyLo/oq1iB9/EY5X7sJwB
         mZB9JzoyYWm2/7TdxKlmduEa1sxfLBsKQyF1WM2D7X4Wtqfl+su7k8ezFG0X0s/E3Nlm
         G6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395679; x=1774000479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
        b=DpPY1w4GDXhp0LmblLEv8/J0fqOgCMcggcMclPHOkIXvNoLEia8NwkS85YcbKllaeh
         z1AtymK8BH1L8oyQ80FoqlIYsrHcGm269bCTFbu/KUFO79BvsGa3yQ2PNp+YiFFguhBl
         eRYbPqLcMCLyM4+2b/RMuqskL+fbJylCji3bC6wgsyM3Xh14qGXegeyk0mGBw2etnWU3
         nKVLtxr2zoxIffG3N8r9KPTWcB+cmvwpZqK63ONBNU99takIRn1oLqwRn+lQzMbFfqOV
         DxQ2EdUlfYnJgUjUHIcAV77wEahhm3S1svQX8a4aLN2jOATFYX4Aez8MxsRNfeclD8Hh
         6wjA==
X-Forwarded-Encrypted: i=1; AJvYcCU/C6AO7OTpAUtWuO8LGk7CmS0FOuguExWyYVtL5rO1Hxb9JiFspeEX9mTRWDyxMmYgg56OVZDU2yNNlPcd@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4m92YtnjE9sNM3673F8QXPD3+/Td5r+64S5EKGlAB1TsAkrw
	G08ed7af/JJcyaIZFZWIDbeAJSpgRdeuVjvSGeN7JZv9EsHkuO2ZkWtzZe1qRcL9gpgXLDm+ehY
	yk+mUtS5uGN4EWknSrV+oG2i8d8vW36A=
X-Gm-Gg: ATEYQzxFWr/IDAv4/iZPJXYyuleE7z71+2Wu7xLEwBK09LHvXgflqu35iJH2DEPzHvk
	d9doflY0vtdeN14ZheHDMenTTRBtoZ7RCOEUsNjfY0FfsD7cGLo8uIH85gSjwcgY0Ok0DulFS0m
	tLizZy2bvBHf9fhEGXrroafleHo5da5AePQFW3zg9aU3GDenR33IMVuZhRTSu6D/H4yZ5LZmSKU
	CfJYt+M6j9gjPtL5Ou92DFPWVAWFSlGiZAdQMhlz4dd/BZxhBofAaJNWAas0cpRtLqetDcDvOcp
	v0FAUzl8zPT+KkVvC2Q=
X-Received: by 2002:a05:6122:4b8a:b0:56b:5e7e:d40e with SMTP id
 71dfb90a1353d-56b6294ef35mr872151e0c.12.1773395678977; Fri, 13 Mar 2026
 02:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150152.90685-1-mitltlatltl@gmail.com> <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
 <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com> <d2e30b43-75d3-4c53-af26-4761cc093a56@oss.qualcomm.com>
In-Reply-To: <d2e30b43-75d3-4c53-af26-4761cc093a56@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 13 Mar 2026 17:54:15 +0800
X-Gm-Features: AaiRm50_vKWcJ6gfGL_kMjM6_0IVql9mtwkskiA_FF_ThWwG_j8-Q8jo-zNqJbw
Message-ID: <CAH2e8h44gt+eQ5hsuJAUCSRhok96jZe=9X4+uN=bt9etXav+4g@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97392-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2D41B280EAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 9:32=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/4/26 12:54 PM, Pengyu Luo wrote:
> > On Wed, Mar 4, 2026 at 7:20=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 3/3/26 4:01 PM, Pengyu Luo wrote:
> >>> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> >>> Gaokun3, the image will stuck at grey for seconds until msm takes
> >>> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
> >>
> >> Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?
> >>
> >
> > Yes, always.
> >
> >> The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
> >> node, so if you're unlucky with timing, this is ""expected behavior""
> >>
> >
> > On gaokun, if simplefb holds the mdp clk, there will not be the early
> > framebuffer, I can't see it. After seconds, msm initialized, the
> > display would show logs.
>
> I'm going to assume you don't have efifb.
>

TBH, I don't know it well. How can I check it?
Recently, grub works well and I can set a new degraded resolution for it.
On my x86 laptop, the downgraded resolution will be scaled up to full
screen, on this device, it displays on central with the degraded
resolution and keeps
around unused, no scale up.

> Is there a chance it's because simplefb is waiting for dispcc to probe,
> and by the time that happens, msm probes right away?
>

This is quite different from the android phone, where enabled dispcc
will kill simplefb.
AFAIK, the bootloader would setup display things. The display things
are properly configured(include dispcc) so that we can use fb.
However, when dispcc probed, mdp clk is reconfigured(mdp clk park on
xo), this will kill the fb, and it will reparent to dispcc_pll later
when clk_set_rate() on mdp_clk in somewhere of msm. (My disclaimer: I
am an amateur, this is only my quick insight, maybe totally wrong)

> i.e. it seems like something like
>
> https://lore.kernel.org/lkml/20220806163255.10404-1-markuss.broks@gmail.c=
om/
>
> would be better suited if you want to get logs early *and* you have a
> panel driver that works anyway
>

Actually, I just want to cancel the grey flash.

> >
> > Once I owned another sc8280xp device(Ntmer TW220 aka robo & kala), dsi
> > didn't work at that time, to bring up the simplefb, the clk must be
> > held and no parking. gaokun3 always requires no parking only.
> >
> > BTW, I can see this grey flash without simplefb too. On x13s, if
> > building msm as a module and not putting the module into the initial
> > ramdisk, what happens?
>
> Do you mean that in conjunction with dispcc-sc8280xp present in
> initramfs?
>

I mean if we can load msm asap(builtin or early kms), then we may not
see the grey flash?
So the things I wondered are
Do you set msm and dispcc builtin or put it into initramfs?
Do you meet the grey flash before the display shows logs?

I built all the display things as modules if possible, and early kms
won't cancel the grey flash

Thanks.

Best wishes,
Pengyu

