Return-Path: <linux-arm-msm+bounces-19152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607718BA3E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 01:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82EED1C22C22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 23:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC741D559;
	Thu,  2 May 2024 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UQ+uQiaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7CB1C2AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 May 2024 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714692056; cv=none; b=ViWPLirjDfWrRt1WltQnyaexrzN7RlYZe86xcIKxFUvzSZPtgs9j8SlDSJiXJDxfQKjvfavpIFkzl/c0JrSvE5CyHOGl1IVeB++dR24/1pqZnlRwcrcXfIJJ0jGjUDVwPolZaX+p0t9DN0i+zYQjF0KSz4j+7bdwCbKH5mJKLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714692056; c=relaxed/simple;
	bh=/BD3wxAtMeBhjQcyimNBdRRV8wUoskv6H5KUanY3Oqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYs37EtPmYRbyyBT9Oqbk1sgTvL3xo43J8lyY8Wm0fFEFmEcM6eTE9XTxWzoLO79xqiD1Kk7Xsm38/BVhn3tAT5J/ZdKXmjw4F9+B7oGBjn7hlr8VoXDENod6FSJR7cXYAfPBNXrLdLPaezNE4qEIKuQwcOCyxlDRQmdEI3adis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UQ+uQiaq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a58772187d8so1111021266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 16:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714692050; x=1715296850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ByVaaMKgikK9K01TQNZAeU3i4lX5j7GPcDDDxv6HGU=;
        b=UQ+uQiaqzBmGAbh5GUQIa0DzdA4AzZaZSV9HSafIn23UneEGQmPwt+Jw6CGTxX2V4/
         sClIYE8rDQxBFEoRcsgfQGstcY2dzliHt4SCOVPrJRJwwGAQqm0AjLBbkO4OkgHd6N31
         J5/1wCmTJdv3j4pfpImAHDDWpcgiX5nY2tmg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714692050; x=1715296850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ByVaaMKgikK9K01TQNZAeU3i4lX5j7GPcDDDxv6HGU=;
        b=OBth59H75peHJ7GjR14niJR08iU6WXavzPyxssXqTC+m8xCkInInU43ccByFuXVoy+
         e8KAmZuMRHrWKthwittkmM4f7mv0MdPvRFIX8NpAqBobHBuFkgR/sZG9Jvbcx2BTzlJT
         m10IHbNVuCtSDrkXZGD6UbX/JfUjCw4jo0TLMVBS0GYiGniYIHbFYBrGVCsfHNd8zArB
         5sgtlQpTLyMJHJECMRWBqlu+N8U02+IzmY6TL/DeqzjsC1NivX8b6ipmnl+Dv0vM5WoA
         LqNMlIXN2cxhMNM7C9cJIapUqRvX+0G6W1hJv4cQdkS61GVJlZCFlZJIX6+8aIuF2dDV
         EfOA==
X-Forwarded-Encrypted: i=1; AJvYcCUgQgYi6t0XEueR2la9HVrYMactssxFNCyoKkROtVPoQ2O3Klsg02YVlQ6Gn1ZCLDFEL+LByZ7ecmj7xoaRDNlLcnrk9t5CkE6vDhdAgw==
X-Gm-Message-State: AOJu0Yw8qNyiXWTvOqQKpjWMGi5MQhJmLabs1U64lmyDoalvVXmzCw3W
	1tywMY3ZBVHAexZZ+8zW6ovrgfpjNubgjDPLpuD01BRQ8yvKRriCRG+TmFfXAenq+hXkpYYjMBb
	FLQ==
X-Google-Smtp-Source: AGHT+IErgq2foC23PH3reDZefAZ9KE5dUs3QkrKnNps3TgeWF05P7jWONWi9iAb+jxBrXdDsYbC5cw==
X-Received: by 2002:a50:c003:0:b0:572:7c13:c7d8 with SMTP id r3-20020a50c003000000b005727c13c7d8mr539676edb.34.1714692050202;
        Thu, 02 May 2024 16:20:50 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7cf04000000b00572abf81975sm1009819edy.52.2024.05.02.16.20.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 16:20:49 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41b48daaaf4so17365e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 16:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZxqIylRHBdkWB5vW/UAeczarMZkSJGULzYqVoFIzjzRCY7AqvHr/rSD28TGmN7mCLpoWLjmIIoyERKKoy1pPYrNC625rHwZNRpdBBLg==
X-Received: by 2002:a05:600c:190c:b0:41b:e55c:8dca with SMTP id
 5b1f17b1804b1-41e1cf3429dmr334315e9.7.1714692048795; Thu, 02 May 2024
 16:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502224703.103150-1-swboyd@chromium.org>
In-Reply-To: <20240502224703.103150-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 May 2024 16:20:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtSiueVky6jX2DjQwS58gYU07+0em3jW0juHcDM4K0mg@mail.gmail.com>
Message-ID: <CAD=FV=UtSiueVky6jX2DjQwS58gYU07+0em3jW0juHcDM4K0mg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Park shared RCGs upon registration
To: Stephen Boyd <swboyd@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 2, 2024 at 3:47=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> w=
rote:
>
> There's two problems with shared RCGs.
>
> The first problem is that they incorrectly report the parent after
> commit 703db1f5da1e ("clk: qcom: rcg2: Cache CFG register updates for
> parked RCGs"). That's because the cached CFG register value needs to be
> populated when the clk is registered. clk_rcg2_shared_enable() writes
> the cached CFG register value 'parked_cfg'. This value is initially zero
> due to static initializers. If a driver calls clk_enable() before
> setting a rate or parent, it will set the parent to '0' which is
> (almost?) always XO, and may not reflect the parent at registration. In
> the worst case, this switches the RCG from sourcing a fast PLL to the
> slow crystal speed.
>
> The second problem is that the force enable bit isn't cleared. The force
> enable bit is only used during parking and unparking of shared RCGs.
> Otherwise it shouldn't be set because it keeps the RCG enabled even when
> all the branches on the output of the RCG are disabled (the hardware has
> a feedback mechanism so that any child branches keep the RCG enabled
> when the branch enable bit is set). This problem wastes power if the clk
> is unused, and is harmful in the case that the clk framework disables
> the parent of the force enabled RCG. In the latter case, the GDSC the
> shared RCG is associated with will get wedged if the RCG's source clk is
> disabled and the GDSC tries to enable the RCG to do "housekeeping" while
> powering on.
>
> Both of these problems combined with incorrect runtime PM usage in the
> display driver lead to a black screen on Qualcomm sc7180 Trogdor
> chromebooks. What happens is that the bootloader leaves the
> 'disp_cc_mdss_rot_clk' enabled and the 'disp_cc_mdss_rot_clk_src' force
> enabled and parented to 'disp_cc_pll0'. The mdss driver probes and
> runtime suspends, disabling the mdss_gdsc which uses the
> 'disp_cc_mdss_rot_clk_src' for "housekeeping". The
> 'disp_cc_mdss_rot_clk' is disabled during late init because the clk is
> unused, but the parent 'disp_cc_mdss_rot_clk_src' is still force enabled
> because the force enable bit was never cleared. Then 'disp_cc_pll0' is
> disabled because it is also unused. That's because the clk framework
> believes the parent of the RCG is XO when it isn't. A child device of
> the mdss device (e.g. DSI) runtime resumes mdss which powers on the
> mdss_gdsc. This wedges the GDSC because 'disp_cc_mdss_rot_clk_src' is
> parented to 'disp_cc_pll0' and that PLL is off. With the GDSC wedged,
> mdss_runtime_resume() tries to enable 'disp_cc_mdss_mdp_clk' but it
> can't because the GDSC has wedged all the clks associated with the GDSC
> causing clks to stay stuck off.
>
> This leads to the following warning seen at boot and a black screen
> because the display driver fails to probe.
>
>  disp_cc_mdss_mdp_clk status stuck at 'off'
>  WARNING: CPU: 1 PID: 81 at drivers/clk/qcom/clk-branch.c:87 clk_branch_t=
oggle+0x114/0x168
>  Modules linked in:
>  CPU: 1 PID: 81 Comm: kworker/u16:4 Not tainted 6.7.0-g0dd3ee311255 #1 f5=
757d475795053fd2ad52247a070cd50dd046f2
>  Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>  Workqueue: events_unbound deferred_probe_work_func
>  pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>  pc : clk_branch_toggle+0x114/0x168
>  lr : clk_branch_toggle+0x110/0x168
>  sp : ffffffc08084b670
>  pmr_save: 00000060
>  x29: ffffffc08084b680 x28: ffffff808006de00 x27: 0000000000000001
>  x26: ffffff8080dbd4f4 x25: 0000000000000000 x24: 0000000000000000
>  x23: 0000000000000000 x22: ffffffd838461198 x21: ffffffd838007997
>  x20: ffffffd837541d5c x19: 0000000000000001 x18: 0000000000000004
>  x17: 0000000000000000 x16: 0000000000000010 x15: ffffffd837070fac
>  x14: 0000000000000003 x13: 0000000000000004 x12: 0000000000000001
>  x11: c0000000ffffdfff x10: ffffffd838347aa0 x9 : 08dadf92e516c000
>  x8 : 08dadf92e516c000 x7 : 0000000000000000 x6 : 0000000000000027
>  x5 : ffffffd8385a61f2 x4 : 0000000000000000 x3 : ffffffc08084b398
>  x2 : ffffffc08084b3a0 x1 : 00000000ffffdfff x0 : 00000000fffffff0
>  Call trace:
>   clk_branch_toggle+0x114/0x168
>   clk_branch2_enable+0x24/0x30
>   clk_core_enable+0x5c/0x1c8
>   clk_enable+0x38/0x58
>   clk_bulk_enable+0x40/0xb0
>   mdss_runtime_resume+0x68/0x258
>   pm_generic_runtime_resume+0x30/0x44
>   __genpd_runtime_resume+0x30/0x80
>   genpd_runtime_resume+0x124/0x214
>   __rpm_callback+0x7c/0x15c
>   rpm_callback+0x30/0x88
>   rpm_resume+0x390/0x4d8
>   rpm_resume+0x43c/0x4d8
>   __pm_runtime_resume+0x54/0x98
>   __device_attach+0xe0/0x170
>   device_initial_probe+0x1c/0x28
>   bus_probe_device+0x48/0xa4
>   device_add+0x52c/0x6fc
>   mipi_dsi_device_register_full+0x104/0x1a8
>   devm_mipi_dsi_device_register_full+0x28/0x78
>   ti_sn_bridge_probe+0x1dc/0x2bc
>   auxiliary_bus_probe+0x4c/0x94
>   really_probe+0xf8/0x270
>   __driver_probe_device+0xa8/0x130
>   driver_probe_device+0x44/0x104
>   __device_attach_driver+0xa4/0xcc
>   bus_for_each_drv+0x94/0xe8
>   __device_attach+0xf8/0x170
>   device_initial_probe+0x1c/0x28
>   bus_probe_device+0x48/0xa4
>   deferred_probe_work_func+0x9c/0xd8
>
> Fix these problems by parking shared RCGs at boot. This will properly
> initialize the parked_cfg struct member so that the parent is reported
> properly and ensure that the clk won't get stuck on or off because the
> RCG is parented to the safe source (XO).
>
> Fixes: 703db1f5da1e ("clk: qcom: rcg2: Cache CFG register updates for par=
ked RCGs")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Closes: https://lore.kernel.org/r/1290a5a0f7f584fcce722eeb2a1fd898.sboyd@=
kernel.org
> Closes: https://issuetracker.google.com/319956935
> Reported-by: Laura Nao <laura.nao@collabora.com>
> Closes: https://lore.kernel.org/r/20231218091806.7155-1-laura.nao@collabo=
ra.com
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> This is an alternative approach to [1] which doesn't require any hacks
> to disable clks during driver probe.
>
> [1] https://lore.kernel.org/r/20240327202740.3075378-1-swboyd@chromium.or=
g
>
>  drivers/clk/qcom/clk-rcg2.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

I'm not even close to an expert on the Qualcomm clock stuff, but the
description of what's going on here seems reasonable to me. I agree
that getting this fixed is important, so I'd be OK with a somewhat
weak:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...hopefully others more in the know will also review and make sure
it's not going to break anyone's use cases.

