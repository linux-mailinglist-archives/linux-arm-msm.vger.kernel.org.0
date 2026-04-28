Return-Path: <linux-arm-msm+bounces-105090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAjeJKg28WmfegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 00:37:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8948CA7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 00:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5568C3018AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C36326938;
	Tue, 28 Apr 2026 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfTQ+HXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413973B1B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777415845; cv=none; b=fBx7oUsTfoxITRCUC3WFmiqi3hcmdpJdlHKqsIATozPObCylslbcdkq9yzGS5t3QIdhFRgSmKAMocQBgtcNIzJOb4xAPr+7qOWPYhDz1sS/iph1/6w9NEYqcBShcVceQ0nkd9k2u8auhZvr7ffnGy9GOcK4g2GfRgBj3yLyJHiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777415845; c=relaxed/simple;
	bh=Y5K9w/dAWAPxr/f/0fJNiVHGZlLP5vvzBFKMA1ar/TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCS26Xy7FXcb1ztg8y5IVgIfdZhgrO+UjEJEm0fVJxEEVLM9MJ5rFvBRQDKZJu+y7bPL3cKU7X17QnBpj9gKxKiFtDqXGqfG7mgFh2HTdvDTv2zoZfwPD1Ld0AQNf1b4gPR5IzjRGOEt7lloc7PTlXgp7jMhH6SJpLcj54+V+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfTQ+HXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E12C2BCB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777415844;
	bh=Y5K9w/dAWAPxr/f/0fJNiVHGZlLP5vvzBFKMA1ar/TM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bfTQ+HXhoQZyBuQUpX1wqfOxOhp+HZM7k5crduptcGxm5s2Sa27/SlOtYuOOnZMay
	 HPCjZkxjdqmNTm0yYsLBOAtYzZZRxkJD+vvcxaRy9VUqjkD1KWOlKZn+wnFBvd2mTj
	 v6Py1rthsHuqc1/ByyGCOzCnnmfUw2T0II6YUBSAoJwZ7xoO8/oRoO0DKASYoDMlKc
	 mQwuMh0QkzzRcA3tnXaggX2OCntOF1+gHObgMsG1NOhEEJE4MleQ4p+uU1vWZmizvx
	 /vg+jc1uhx+h+WylCZLvFrfgEoDak0lnHKw+hEynBwsfGdrDIFBn1uyVgcLtUtmsRh
	 mA2UZSGLDQdeg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a525aedb24so11822432e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 15:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/y7aWW2ojrCUgaghnOos1CezTC4cOQNp2xGxcJM7a4DJ0K3ZW42vhxOJyJaweuNSDPGqgiZPTj7Pxz3mCV@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJnS7F7eAEsZB5CHvVR3TnRZulS7yWtqsc7DHgm7FkCF/MCD6
	PnKxxzfxTXAN4+5M59/CyMyL+qR8M+yOS/+c0y0cdPIxUUr/IGAtqygkpTOotW1j9THAHXjM4MP
	AVlJzbjl0JEmC5TdI6kN0KkoNx+7DJmw=
X-Received: by 2002:a05:6512:39cc:b0:5a2:b0ba:7169 with SMTP id
 2adb3069b0e04-5a74661b75fmr2060251e87.38.1777415843678; Tue, 28 Apr 2026
 15:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
 <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com> <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
In-Reply-To: <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Apr 2026 00:37:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkT+P4=uU2s20_iRJ4URYxUTodT=10FaqBnbv4nQChdUA@mail.gmail.com>
X-Gm-Features: AVHnY4JWtwnhp2akHdjilA7irIIkpOgifByCgOYtH_Pc8x94YSONShmddM6F4S0
Message-ID: <CAD++jLkT+P4=uU2s20_iRJ4URYxUTodT=10FaqBnbv4nQChdUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E9B8948CA7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 6:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 28/04/2026 14:06, Krzysztof Kozlowski wrote:
> > On 27/04/2026 22:18, Linus Walleij wrote:
> >>>
> >>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bi=
t
> >>>    platforms, which are already enabled on qcom_defconfig.
> >>>
> >>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm6=
4
> >>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
> >>>    time and feels logical, because if one selects ARCH_QCOM then
> >>>    probably by default wants to build test it entirely.  Kernels with
> >>>    COMPILE_TEST are not supposed to be used for booting.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> >>
> >> Way better like this.
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > I think this should rather go through your tree, because new drivers ar=
e
> > coming and some other changes from me might be touching similar lines.
> > Well, defconfig also might be changed in parallel, so obviously someone
> > will need to handle conflicts.
>
> I'll rebase on recent patches you applied.

OK then, let's try that! Maybe I should just split out all the early Qualco=
mm
stuff we merged into an immutable branch if something starts to cobble
up later?

Yours,
Linus Walleij

