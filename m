Return-Path: <linux-arm-msm+bounces-94414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO2gAmhUoWk+sQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:23:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305DB1B4784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACC87307CDC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736AA394497;
	Fri, 27 Feb 2026 08:17:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0116D38B7A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180231; cv=none; b=BhRvSyRn57EfXVwFB2AZKXCAxsuBfEBYja5ul2yEx4ukfRMYoRFOYswoBPvWkz0wz6EcHXTH7MFCrMe36VRoiDl3vE4hZ/1rKLGPAHI+yzCFrVYix9My0nVRclhpecN4UmF84x0/i91WEeHenwXCJjo/Re1PdUJNbk+q+S8v5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180231; c=relaxed/simple;
	bh=m1v1NON76PMqrwAK+QogHbEEQapfrZUSwmgoYwLysaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1ONwPjsm2fY3ZZtSElTg3fPTKjWfPpQByniItj6cvdHvk2ulCvl6WxkBShhLKEL8trog6UBrrGEEyqI7BKnj/t37hrzLtEgfXr9XJMa1nrWkImX3sozqat/lEgqq5qEcyNeACYrmmbDVq3op5Bu175I11L7GMtScv3w715kOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a8da2faf4so1482459e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180229; x=1772785029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=HqcFLxQMaxO0QUCMHi3S9+UQYr/oYdrJS0eRxnjkXtLqeeVyD5VuuGRz/0hcPbzByN
         KN+E9XmUUs6Blwm/dobKJIUKkXsD0P4XPTXMy/y2KNVT6om3vFif8FqqdIS3MlHF9PET
         pXUBu+SFnrsi5mRldXevnLqoyMSqNIRDJeqbd1MbT8Npv39MyYgMLUs+wZKOhIz072GH
         HCA2Dq8dhIyeJgwBuv7s/Ce35Sb25Ccyguf6kS+YXR5/YPxMQVR8JjEurnpdWQerFBMd
         9w/LTZPVQ2h6DCKxaAZhnRS3qI5TTGcKYwpXbRrVCpqU3o9Z6H8Go1PoWg96FWJx+zNw
         88zg==
X-Forwarded-Encrypted: i=1; AJvYcCUereuZFwGX7Dz7fsJx0m31/TtyKtXwIkCm8duFtQ3Ym2Ny1FX0MIuo+9f3vqr7TFdqOFf3t7lBgb/4eUwf@vger.kernel.org
X-Gm-Message-State: AOJu0YwIy9p6a5EsRjZ9iFIQJOwSzR7BJCEZ/zGYn+NNAG1IktMvjKWa
	Z/srxyfisKcRLij0wxhhLfQBGhahip1DnDMYwUJ6/N5j2XWJm40326v7am99JkqPPN8=
X-Gm-Gg: ATEYQzyMIVtqr7pOhKJUPixMChxjFn1GKGIYVMtakcwigqCk9SFJO8sk+87IN18jgEv
	PtA702ajT8QwvBbKZfL2Bxdo02Cszgcki+jx0AIig5pENtMxkZyMGzODs/Cdq+TtSHxc6J6KLfQ
	U0TiKYijOqX++OWtvQtEByWcVE4O1tlSJD5rb9UXeMJPhcoGyTxHE7rLxJnCIFVoKH2HgL/Y3fR
	QaiqGXAmNKqjIWYWrKnYCrQL7hLL/g0y2jfjr/y+M4abDYBZibJMWQLOdgREaVvG9k4pytE7Cwk
	ezAKevUrc+K8itZZjoEKV9cxH6aSaOt5hC/KDkTNkM3Qp65GVi4Ap3Wo/to8aC/Sx4Nbf5GVFB6
	YNj53pitenrdcX0x8LeznWkkxXJOpi41VcTMbFP04utVERD8Lue2NjMH1GShQs13JESVVG12qrQ
	/wtPQq97dUpqXxXHdRwu3H4EJgCjtiFQ1At4Gl9DPADdBRxtHyLA5MJjirZGro
X-Received: by 2002:a05:6122:2a01:b0:559:6960:be0d with SMTP id 71dfb90a1353d-56aa0a8ddefmr1173491e0c.13.1772180229005;
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm5469365e0c.9.2026.02.27.00.17.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:17:08 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fdef6330bfso1273146137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdrPio8K74hJQn1vflYfz9KqhfA/Br6oV8M5xK0A1WDrcCmwv9EJd76FzIC0NG807rUVkwjcsDQv2pEre/@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94414-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 305DB1B4784
X-Rspamd-Action: no action

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

