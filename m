Return-Path: <linux-arm-msm+bounces-99905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPocF+oSxGmfwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:52:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC6D3296A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17F373142266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208993FCB25;
	Wed, 25 Mar 2026 16:36:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A673E95A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456560; cv=none; b=q7zT+bIyZUXhZKoriSDdZmSJZj9Jekm4nJk1owXSVdDsEhNXrNoYwAsterNP7lEF8f2qkbFu+lWZoTv6QQi1a3ZDn0qTnOATxHV2B48uP8t5f4mYi//IIhXOUk9y5iFy2DmcsJdhielkXVY8rPMes2PCJaYLZ9gyTkGAZL/nsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456560; c=relaxed/simple;
	bh=vX6p1CDvWad+GoKbzvthJkwyI07/wTijn9ZWHgYK/o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DisHKYkcp9YQHV+Pk8+6H14md8QRfcNsU2GfTThiWToAyXwHNsWlPqocO86z8tPJ01joQfsbbSVkmy4l+Z1F9ovVFy0+5+ql0+KP2NrKrSOZgFXW6vSl5xKcsVCsktHAT3s85jCnWjoXQjH1Op6zmiwQKfct7wNzZ1POqQGDggA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-951a0e3cdabso11970241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456558; x=1775061358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDjwaAywwU03wv0+eLKkG3IGOSH5Z69cyrkxX7M6ckw=;
        b=qHm3mDFIoYZv8K0nLbWZ0bRyctqZtUExqew5kvWGMW/Ggrhh0IimqBK45DMEeiVFNR
         Q7rzY9eNyOE+FBguy85aN1xLn8owh40o25vgd1VSItMwUbKttUcQJVvvaEPKqdu6lxox
         ZyIqmtva+Ygm58d0bpBz1TTocxgO574QezwK6dvj3nQkP1l3GoDBGEIq6PoQ4WqobGVX
         CsOX+XRjRdUchp10aoslwmVMS4zUr+8sy9+uRxw3Ch1Ak6O9Q4XKE+T/dHrduw5UnEKX
         YQK8xNxRlDQnEKnOpPoEeGEUjkSNX2QRGlvZx0Hsun7b7Wqs+l8jez0CjB4nA76SY/zk
         b12w==
X-Forwarded-Encrypted: i=1; AJvYcCW+wf6VXT0brpKViZhzZTxfscrdU+I7LmeV4n2/Do8HT6Ht8LHCIf1r79EvwMv4CnWDBmtEhn9XqdkZRqU6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1z/PjUKi10BtTqzbllmmzGat/JukKY2Sebdv8SA+X6u0GuvIa
	pDinbDCC8zJdrJ3r+0GQn3AbT3UayzOoJxeVyTg74P15QlGj1BMLBBf2dx3Dwr+8Wmg=
X-Gm-Gg: ATEYQzyyuPZ4Jn8iU2PRXYWFxp7JRqBAYxV7kv8cYffJ86nNee5Asur1T5NQpfP+yS9
	P2CuDlXLz9AVAmSdsYmaFGzYqadz7Nl8RBgfDCfjp3dw8J2apmDK4wiDgxBwFrGpwWqonlpOERr
	hGLrvjQ+vwVlLaiA/0S8yMuOQ6tGxdS8PuOMreRQ+AGthl6SqHsJIaAYrjdel3mog4RNmd8movv
	3vnT32CKpDcxlLzM/MT/ltK7jD3P/zYGGec2O0+z1DfAphA7wucHBTJGrukHBAW6Q00ue9R9dn1
	bvncLe/k5DRMgvfyN0NwTjNyzJEM8sWjldlKkdbblGAsHuFHjWewwGrJIx0A82dXquji3lY9OM9
	hCuKCQBP4n0+HtDBQTOygUcjkLYdyV+pxzGglI58NwZW7xwwaqPcosnDcWEVKhCJ+tUW1PycV/Q
	Cyf6hKnHgctHQazyjLXx3A+NH/ygdcOszJg1ZQ/l6WPXKKVjGCvlZ1PkBVMgYA
X-Received: by 2002:a05:6102:1608:b0:602:93db:7f5 with SMTP id ada2fe7eead31-6039481d90cmr2362274137.34.1774456557629;
        Wed, 25 Mar 2026 09:35:57 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be5afa8bsm597149241.12.2026.03.25.09.35.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:35:57 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60328744754so1146581137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:35:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRsng2d9m7JkO23uE7v95N3TBZKFQdMLcRw7hIYafgNUoGvKHNzOckQroOW6iquoJNjCSJSRTF4oKI0zbw@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:5ff:ea89:44b5 with SMTP id
 ada2fe7eead31-6038753a92emr2391289137.32.1774456557341; Wed, 25 Mar 2026
 09:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772468323.git.geert+renesas@glider.be> <10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be>
 <20260313215912.GA3415767-robh@kernel.org>
In-Reply-To: <20260313215912.GA3415767-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:35:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
X-Gm-Features: AQROBzAa9n7pyJe-8mgf6m8MWZ5EBfxKw9iKFNekZ5OaRcP6UMYY0cGuEWeDl6U
Message-ID: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] soc: renesas: Convert to of_machine_get_match()
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-99905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDC6D3296A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rob,

On Fri, 13 Mar 2026 at 22:59, Rob Herring <robh@kernel.org> wrote:
> On Mon, Mar 02, 2026 at 05:29:11PM +0100, Geert Uytterhoeven wrote:
> > Use the of_machine_get_match() helper to avoid accessing of_root
> > directly, which is planned to become private.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is an alternative solution to "[PATCH v2 8/9] soc: renesas: don't
> > access of_root directly"
> > https://lore.kernel.org/20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com
>
> Greg applied this, so you'll have to respin on top of that. Next cycle I
> guess. Unless you get him to revert it.

That was my impression, too, but apparently he skipped that patch.
So you can still apply this patch, too.

> I'm applying the rest of the series.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

