Return-Path: <linux-arm-msm+bounces-98928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFBYNN1IvWlr8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:17:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D522DACF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD173043F8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B372A3B895F;
	Fri, 20 Mar 2026 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUGGSJNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3940DFC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012537; cv=pass; b=Cu6L7D6FaIT7mlw8EzVUWVKY2jHrocyTwCERcSp3Ox7JL/NxLtm855KdbvF6O8cMKxOHKpQL8PkzwyGZ6AOLmdzHjOZtYLAg0OsjB6lmJ0V88+5OfuMD1b7wbEGrKG+6XS08Wz1hluyvbWP3v7+y1V3V5YGSkELBlvD3NDEl01E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012537; c=relaxed/simple;
	bh=JDTv2EKOs9M35IDgumV8qjNQ9b8p/jpUdbdJIIDiiO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp404T8cio/ExkVCwltF1ZzT1nJCi3868dc5iGVAbFCPzhP9JG8ONgqnfIX7mJRPwn4yZ0GjmOF6GN5t0WBd8PNz1yzuhCN1w7oUyyDgYblwVAgV25zX/zm8HHTE32i9qXphKB4lzgtwcyNt/X/vkOpGm0AbwM4rhBw/MyIIE50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUGGSJNW; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56adf76631cso238005e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774012535; cv=none;
        d=google.com; s=arc-20240605;
        b=BfKOa4EhzikEfiELeJ71h6o7khPOGk5M3K79vJ0rpULVKCgPRKDZu4x1fACxxSkLFc
         0QJdV+TIC5yRMjk7VM2LEmaOEjpzqWfkBdMp2hVo/BcGd9aW8PUb1xF2xgj5eoPbHUTW
         CFAmU9cPZd+qSwCCtSOLFFjjr8devDgFGCLHUo+mfZVI9iowEbLzAWZUlWcmGK4pCXtK
         0yz7Txobqe8cHptdT3/TLZeB5q3sDZmbCoylXrtgQSEBdm6+iM54d+4qLdlEO25kvooO
         6MPPNh5DL7uKILKSaYSfQsV9dlzsj1DxSIvERaKQdWvZ7fyThYMR6NFxGoPFbTwQhy3z
         bVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=odrQtLUC1LiaxHstWMqEvhv3vLw/22xn8F6ptFJZ6CY=;
        fh=OBcj74qta0NbhEphhh273N1c+5Ky4xzCi8rXaYh7AaI=;
        b=ZizEAffcqHwv+62dXt6EWY6iaKjw2D6jyFwQkm8pvY6No3wGJapD0vWjvHABuTFkkt
         GdvS1vG+Njv4liae2eBykxK6PTimdxJuFTNRXnDJw1xeSi4XFncvUlBHkWZWfaTgGyXM
         02VzDlf7N/GJe7t5BdTNZsxBnk8HPBCpV6ElqJq064fq7S74klrm6e/EXtm6pmAa4vvO
         4EHl4Md9RRZwUOXz1zhnyJEoYN7Fy7qiXC7yGtFf4pfHJIKpmU9A324G82As3jrA+Nxn
         G714EzZtRLnbIewjkUv3wrPwGvWG8iOrDyED+kFtI8FZuInSSkfBZZsqxQouCmp18wV6
         PSUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774012535; x=1774617335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odrQtLUC1LiaxHstWMqEvhv3vLw/22xn8F6ptFJZ6CY=;
        b=JUGGSJNWF749Zf0HOcOU0ur9k7QaMg9K9I0hnfboSNL6486vLZ/o69Ergyy6NvtcyV
         juaY3uaP++eqg16jG4vi2TR+6dlsQVQJ1yCFSqqv5OnCA4JzpN2w/CCf71lLpCnr33rO
         tiVUHR1PafgOtHZ9mAoOMoD/VRwBP2CGwb6clz6Y64Un5vLDMBWeGj/PBJXIK5zesKrh
         tuFdbUlWr2/Wr9Ay+XTqny0c9k7xhGu7j6FP6+RT7R0rC3DzorbKEVOQ3SDyzHejMHiB
         P6RH6FQKxuPAN7YyMhZGKML106ozqJRbKobrxuB6wJayhJwpWJO21kqiLJOKQRMOy6P2
         AT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012535; x=1774617335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=odrQtLUC1LiaxHstWMqEvhv3vLw/22xn8F6ptFJZ6CY=;
        b=IBAdFwtaidUKQ5gfyUQLrpey1xx9Pmdbksvshm9Y056vdmKHoy3H00aeappRHHhDbr
         fVH0q+8be7Ho3OVNqqHpoCwUUCwea3JBlfC9U/YLVRmdTNrtiN4dn9wYFQGv6jTFcHw7
         ZGH4E5ECXjpFdqf6f+dG+Xylv8786GsRpoC1xWE/whFuQMKml3IPnkiT6juvzKSdjzup
         k5SLWSVbxgmFVRmkyvctMd/MhWEbYTl56VzDZPvqLPZpQkoJABqvuIdDQ97irzTHwyiN
         /5Sl2toaNJCifBUyUXVzGTi6PNIRh7+fL+DyWoidqFbTEspQ5S/gwun/4y1o9eGL8gn5
         rRKg==
X-Forwarded-Encrypted: i=1; AJvYcCWGyJzJZIoY4t6Rd1I/5ncQTGkb6ic292jFcYvEw4bkKCqbbRn2laLVwkx/AziS03D8+8E/wznqmaEFo+QP@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVvTqH7EzLRcH6j+NuvWE4f45uswFwtiEOk+BXRa4Afc+aSvZ
	mVKsvxjhDG3VVJrcD4C6zFfymqAMJ2ZMH8Xods5oyfT3SJHiXZZPyqZ7Pw3yFzon2H5lVTxEkFQ
	Yu6+KvnnRBHZpYAfcbOtyQb/O1j/gLCE=
X-Gm-Gg: ATEYQzw+ShAjRIE7f5L3B2bu72Z3iAtoE0S2mlSkuFvQEZotBar14AKYSWwtIift++A
	1LaRSCj4AMUgHzLXwWxMd4FGFrW/7meyNrhbpJDfCO4aD56T4U4L3hI8byBgn/yECx32/94XTeT
	3LucG0ubClQtJgl8WXXHl/K8BBYkF1RVwP5qq4lCvNnQAacCHzarS3uK3nwz9HBe5SOa9ivYxuQ
	lmioyp4GRFlc8aVkwOXHZ4UMaPs7BO/jdUGi4lD+cz+Jt30m4PsWXkfY94E8EJHXitQmqY/xEfx
	11T97W5rDbMLS/fOEhE=
X-Received: by 2002:a05:6102:94b:b0:5ff:ed38:187a with SMTP id
 ada2fe7eead31-602aeabdd86mr1418984137.5.1774012535018; Fri, 20 Mar 2026
 06:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
 <CAH2e8h4qnF3UxWFrU59BrStWMDc-=Vz9ZNmuq8Q3smhHeUzxyw@mail.gmail.com>
 <a2xtesu626vmfetdoykojm33at44h7zxgvo6ytf2txlg6gn7ls@34jctkwswjnk>
 <CAH2e8h4p4fyoPXTcjbhSXVgWEm54PH_=yCWiCGWOsDaMZu1bvw@mail.gmail.com> <5vqqcoggq3mrwc567jhrondk6m7vfpth57wu3gyvyjjkezfmnl@mqzlarjlsgcx>
In-Reply-To: <5vqqcoggq3mrwc567jhrondk6m7vfpth57wu3gyvyjjkezfmnl@mqzlarjlsgcx>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Mar 2026 21:15:08 +0800
X-Gm-Features: AaiRm53VnGIV9WWkU3ahSecjRfkUcxmeN_g-2CCLzAJ0oe1y1iaTq0NNNOCxNiE
Message-ID: <CAH2e8h5aM2WacbHqwLDCoNrmWOk835ork7hLVHXo+fUFuDN41Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98928-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,lists.sr.ht,collabora.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.706];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,somainline.org:email,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 35D522DACF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 9:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Mar 20, 2026 at 07:26:22PM +0800, Pengyu Luo wrote:
> > On Fri, Mar 20, 2026 at 9:59=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Mar 12, 2026 at 01:10:07PM +0800, Pengyu Luo wrote:
> > > > On Thu, Mar 12, 2026 at 6:31=E2=80=AFAM Marijn Suijten
> > > > <marijn.suijten@somainline.org> wrote:
> > > > >
> > > > > Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
> > > > > programming dsi registers") makes a false and ungrounded statemen=
t that
> > > > > "Since CMD mode does not use this, we can remove !(msm_host->mode=
_flags
> > > > > & MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
> > > > > dsi_timing_setup() affects both command mode and video mode panel=
s, and
> > > > > by no longer having any path that sets bits_per_pclk =3D 48 (cont=
rary to
> > > > > the updated code-comment) all DSI DSC panels on SM8350 and above =
(i.e.
> > > > > with widebus support) regress thanks to this patch.
> > > > >
> > > > > The entire reason that video mode was originally omitted from thi=
s code
> > > > > path is because it was never tested before; any change that enabl=
es
> > > > > widebus for video mode panels should not regress the command mode=
 path.
> > > > >
> > > > > Thus add back the path allows 6 bytes or 48 bits to be sent per p=
clk
> > > > > on command mode DSI panels with widebus, restoring the panel on d=
evices
> > > > > like the Sony Xperia 1 III and upwards.
> > > > >
> > > > > Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when =
programming dsi registers")
> > > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > ---
> > > >
> > > > Apologies, I messed up, I had sent the same fixes days ago.
> > > > https://lore.kernel.org/linux-arm-msm/20260307111250.105772-2-mitlt=
latltl@gmail.com/
> > > >
> > > > > In addition I can't say I understand the original commit message
> > > > > at all; it mentions a BPC=3D10 mode however the highest format th=
at
> > > > > mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
> > > > > ever return anything above 24, which is the original amount the
> > > > > non-command-mode path defaulted to (regardless of widebus)...  Wa=
s that
> > > > > patch doing anything for video mode at all?
> > > > >
> > > >
> > > > RGB888 is the dst bpc, which is tied to qcom,mdss-dsi-bpp in the do=
wnstream.
> > > >
> > > > Actually, we should use src bpc here, another fixe
> > > > https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitlt=
latltl@gmail.com/
> > >
> > > I'm really torn between your two patchsets here.
> > >
> > > Marijn, Pengyu, what are your testing platforms and are you testing
> > > video or command mode panels?
> > >
> >
> > SM8750, I am testing on a native 10-bit video mode panel.
>
> Is the framerate correct for you?
>

30, 60, 90, 120, 144, 165 work for me, in 24 dst bpp, 30 src bpp.

It failed to set pclk clk rate when I set 30 dst bpp, 30 src bpp, but
172992000 is right and works for 24 dst bpp, 30 src bpp.

Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_mode_set: set mode:
"1904x3040": 120 915552 1904 2180 2212 2244 3040 3066 3070 3400 0x48
 0x0
Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_pre_enable: id=3D0
Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_power_on: id=3D0
Mar 20 20:46:00 qcom kernel: msm_dsi_host_reset_phy:
Mar 20 20:46:00 qcom kernel: msm_dsi_host_reset_phy:
Mar 20 20:46:00 qcom kernel: dsi_calc_pclk: pclk=3D172992000, bclk=3D108120=
000
Mar 20 20:46:00 qcom kernel: dsi_calc_pclk: pclk=3D172992000, bclk=3D108120=
000
Mar 20 20:46:00 qcom kernel: dsi_link_clk_set_rate_6g: Set clk rates:
pclk=3D172992000, byteclk=3D108120000
Mar 20 20:46:00 qcom kernel: dsi_link_clk_set_rate_6g: Failed to set
rate pixel clk, -22
Mar 20 20:46:00 qcom kernel: msm_dsi_host_power_on: failed to enable
link clocks. ret=3D-22
Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_power_on: power on host 0
failed, -22
Mar 20 20:46:00 qcom kernel: msm_dsi ae94000.dsi: Power on failed: -22

Best wishes,
Pengyu
> >
> > My thoughts are we should restore 6 for the cmd panel, and we should
> > fix video mode too.
> > As I mentioned, I overlooked something, I thought the cmd panel didn't
> > use the value, which
> > made the value for the cmd panel wrong. So we can restore it for the
> > cmd panel (though I can't say why 6).
>
> 2 (wide) x 24 (normal bus) / 8 (byte)
>
> --
> With best wishes
> Dmitry

