Return-Path: <linux-arm-msm+bounces-118599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZcQ3CfvoU2qMgAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 21:20:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D824745B9D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 21:20:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IeD4iR+8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D202301015F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 19:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC2A3B3C11;
	Sun, 12 Jul 2026 19:20:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BA13563DD
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 19:20:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783884016; cv=pass; b=jmL0bGOzFeo8mZ2P7oMw0gY4Q0hFcUl4hCPhOnRwBo6fN1yAlnVPgi9ZYjOUWew6cYbsvX5lY/6MSOJ1+S93uSAbqi6ixzhkFPA2SSORjdwXd0yxdNfjuwjS3a6qhXmHb4k2mpHxCVodcaPtzgoVm5tQRAqxL8BEETMUTf1MwmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783884016; c=relaxed/simple;
	bh=5f12F80pQzzdpLUcCQ/KIChrhe9ub2mPs63NMCHqZro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssQJfV0tJSn8VIjEpRCcQ4zbR3CdylG1gnPOL3vgaE+EBSvTVDGLqfAr1M893gUtN0k6Kn1/9nn0b5Ls8BH0Kjr/9t6gQx6Fq3t4Wwa/k/nR+MmvQBlaCepy70bDMopMcioX1SY8Rwfk+t/6lZH5NWGTISW3RIpktd1H01mP6Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeD4iR+8; arc=pass smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so3045658a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783884012; cv=none;
        d=google.com; s=arc-20260327;
        b=CSVhAY9ehHhwiZ0FDNrsctVzFEaaof2GreC2j2vh41QjnbKMj+FbqsAwCsAg/u1g1B
         NwAY17zmbS/3flpndsxu+qOhm799uEI0/BsXUE1MVAyetMSoBhkZ6v/HO5LCqHKsNwJU
         ruFQU3xQBM+kh43OOZUNK8kuqSFL9iDEFLRq7UJIszNAXiy52WN+7MdhCbItgwDOfcbg
         5qp/Jbm4xB3wlsVyIaFc9AA5ITBG1fi00XLch+/DqF78qZXo3ca1dTUaK9c348ir7LVM
         DUDhj9d6P/MCaZUCBRez9/hWZBRO4srW3ReJ3+FYvjS4PvX3UFe7HlYRDNEEoWriXeMg
         7Wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=envEX1zOzIKuUrK8VeemThjCFlpTmLy704Os8qfEEOg=;
        fh=VFrLtCfeT1Xb/hs2/RlNOnY6TZ+Q2xe1s//yqtEU7IY=;
        b=h4KNDFCV3UpjlS1uWSH7XDqqZU4LIzj3GGApE3dkTkUxnQkrrMIM/SkUUmTq84JBuY
         4DLe6fy9p3GY+DJFUMpUd4iFr8sb9JLb9lg6/9AeFdq6IbU2LxElcXwdOE7yq2ngUJpS
         Ltj+K2gJkLydYZ0gxAz7e4HaB8qA25MOHdxKeXqCWExp6OjcyvufQyDvV/dePFjIkZcq
         vpU5u4NvvF/3zKODUgQbXDKgxVslLMxV6sUC9kmHs1YEm7ODbFbS2359QD4gUKx/z854
         Y8lNpC//UkLNSooXxkIi9L5i+OBJ1EHbieSg7eACZ1kxD9xiOccOpWEVDCqC3z1jKqEi
         xczg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783884012; x=1784488812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=envEX1zOzIKuUrK8VeemThjCFlpTmLy704Os8qfEEOg=;
        b=IeD4iR+80b4sfm4l6CSTwAPEqz9ZW4m/hiPqMdgTkTxHYdRCQBKXU3hs4f6WaF5CAm
         JvjyTLnROc053gjTklpP81nu815CgFuKELiIRKIsEwZ7xdgtfOeDcqYB+4Rk3EaepUUQ
         pmimYO6oEW4aIAHepfrVjoU/HnDjdNONqLaou87jnjbhsZDVIcZPG4BoDwX/jFs1pvx1
         02bGUib0uaC53x44fUs98ITMBennCcXhT2UGFCYcP8VUqwEne5L39myVmUTdbtFkmfgC
         2J1+Jc7qgOG4XkwePZTw08YBQMOfFvc6vmXgBsEgCgC9gQcFP60j5uNnlUVbnoXq8d8W
         dKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783884012; x=1784488812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=envEX1zOzIKuUrK8VeemThjCFlpTmLy704Os8qfEEOg=;
        b=PRhvGtw/E+yd2sVjRQMpNEkmnVO3+4bMvYdRwaRiKAIzlcEFShA+m0JKMO0482b3/7
         A3Jrt3qxnXlo9cg7ggGsr9jU82U/JWKDYdDA5C4K/G/wQBxPTEaP1Xuyhm7aEb4hVg2S
         aI49pWae701vHDiyUlABifMSS8rfWzAuVB2WiIG4SiCUr22FMHpBnfN3BrKR3hpZUk8F
         /FMV3xudFadWxnXkxepUJRhgiblaDm/YvsV41JC0+VRv/PNbpPTmDOcH9r3a/VQbEQq/
         QNadVqMC9cYjhZmcjFVn2UuQmxkCIWc4ZAySPhh9ukRWERHgOZVZzN7T1UC1MVEoUPw4
         tPCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb9LYoP8yrI8yz90Nv3QZkOysSC9+3npjLKpUNgu+u0IbW17/IdzrYEpV+JXQNT7qrhy1Os1EbxBGU/ux3@vger.kernel.org
X-Gm-Message-State: AOJu0YwU7MH2uQKbxkAkVeisD4X3/4zqXiSwOcfIdACt0LewovOuHxdQ
	JQcwdHc5RVQSXxGJfI1VBLqHs8B8bU+9+5IozcIc0YCAHklzTGaqfIE9vW5PJZ3h3BDlUp5WB9v
	atj2xe8Tpdw6t9TkXuOHK/t9LBwrInui+OQ==
X-Gm-Gg: AfdE7cmQl2es2B9l1u0FEk08xmjSvgQzlSbHMSAaDBtVF1CYFUg+OV0gG+EAUM9KKW7
	ezGX1I5DvCzpvQ25765gGU0SbspimHOJM2UMwcMDi/pDBCRyzBWBrUqu/3yjapkkZg1R9oqQTQ8
	pmL0Y2r6HrzxDSnvXcBCVnF64ibdrKK5h9bi0mWBycZIkmsk1fNFc7JZ3JEaOuA/5z0NMotuICx
	3PhBHRkh5W1+EGiAggOjv+F3DwT2/CBOpay9A3kzdai+Jy3VajoFg1s4Ezsbo+ukBRgQ0w7RTJL
	kG6ylMF3lfIF9oelJo0W4dsncQECflAcZ3Vw/cIK0VEVhfHiFdBZfgmkb5KspMXnguBrcQtOR6f
	ZwAFrbFRYAGQX7A1et1BuVZjWatzxaBOsiByktpoADeFl0NNKyRXMZqL1AH65JcUrgCcJyxvjSl
	utoXYhFUo=
X-Received: by 2002:a05:6402:c44:b0:698:3b7c:7e4f with SMTP id
 4fb4d7f45d1cf-69c5f25087emr2860055a12.37.1783884011638; Sun, 12 Jul 2026
 12:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530201342.10538-1-rosenp@gmail.com> <u5ozkmhq3ll4pfhvxl63ezf5dtgz25lvrwmpk6u7ofccnjicw7@skim2jft2cyp>
In-Reply-To: <u5ozkmhq3ll4pfhvxl63ezf5dtgz25lvrwmpk6u7ofccnjicw7@skim2jft2cyp>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 12 Jul 2026 12:19:59 -0700
X-Gm-Features: AUfX_mxXjd-PzYF2J5t6POcGiPu8wkdfdxMveXKURMVFOAJvEcjTdq6lpkFJg3U
Message-ID: <CAKxU2N9tizK6xbzscbeLHs4noLj5X1Dk8SRog5yHkLnkFBW0zA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix parameter name in dpu_core_perf_adjusted_mode_clk
 kernel-doc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118599-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D824745B9D

On Sun, Jul 12, 2026 at 2:37=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, May 30, 2026 at 01:13:42PM -0700, Rosen Penev wrote:
> > The kernel-doc referred to @crtc_clk_rate but the actual parameter is @=
mode_clk_rate.
> >
> > Assisted-by: Opencode:Big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode cl=
ock")
Is a v2 needed?
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
>
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 13cc658065c5..2ff255d7795e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -34,7 +34,7 @@ enum dpu_perf_mode {
> >  /**
> >   * dpu_core_perf_adjusted_mode_clk - Adjust given mode clock rate acco=
rding to
> >   *   the perf clock factor.
> > - * @crtc_clk_rate - Unadjusted mode clock rate
> > + * @mode_clk_rate: unadjusted mode clock rate
> >   * @perf_cfg: performance configuration
> >   */
> >  u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
> > --
> > 2.54.0
> >
>
> --
> With best wishes
> Dmitry

