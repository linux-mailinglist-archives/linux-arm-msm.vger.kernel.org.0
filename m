Return-Path: <linux-arm-msm+bounces-81981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89BC6174B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 16:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1BEC4E2C61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 15:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E4A2D9780;
	Sun, 16 Nov 2025 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FadJNupf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6F16A956
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763306405; cv=none; b=uwCb0PA9g2jxHTDiM1fn199LbrEuBa55Y31BMW8dUZE+1qBeS7J4tF1BYdhSCF1cAKwqeLHtBiiP5YYoBg+s05r03fQzW33+4On+SmJuE/VDpWNsuo5hHCa/Xn3TkDPhPwwyPUbu9ZmdS8aQ2Mt7tWEKNiyEbq56IHiVDzzExhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763306405; c=relaxed/simple;
	bh=adpjExAaylQ4BgDrm5e1sssE1t25bdZNunpsUAAu984=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhIl8pEER+x1K8iGrcXwbCwjb533paGlpnam8v8zjplE+ox6cAIWLF3ReaLto2E5060RvM4u2A6TbWy/h+c1xtCfioIeFORIbnPnShdYNzW1Ij/9qQxpYH2elWIciOKSIdTZc7vNyDj15+AMN1O3uCLUK6Mx2B3kxnkAA0XPX6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FadJNupf; arc=none smtp.client-ip=185.70.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1763306043; x=1763565243;
	bh=adpjExAaylQ4BgDrm5e1sssE1t25bdZNunpsUAAu984=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FadJNupfvYIkT0e0w2t0Hot4aKCGgn1Ryn5hk9gWy90846s/Sow1bJoepnRBRa8Fz
	 x9RWNNcOL91nQ1AI4SyVI4tu8a2iAVp6jmReuDckxXllNGYfJ9prQWK0VCbWiP9mtX
	 pZGyjU4kuogjJN2o37Ksy+Vha5Zscz9xS2uJ/kIQ4Df5xrAE02hTaqykHxYWOhmZwM
	 WPz7DMh/KRMboL3f9DjqsS3Edwx5UB5WOH8sKq5gAN214gzhxc8bsIYpcBfExep3eK
	 n1zxjKWe5rNEHtSSVSemqgVIRI5qBzKY/bVseLDOprPj/11XE1RqSmhcu1V9eycNzS
	 c6L7jCxQbrs5A==
Date: Sun, 16 Nov 2025 15:13:58 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: philmb3487 <philmb3487@proton.me>
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family
Message-ID: <Q4eaiByBMrzIsd0C_0QEVlu5wPEW7kRn_1zqqWiu-Jmc7wHjVfBTftv4oiLtGzJiN5dYh0tCagJEh0A-2siXiRjEe3y6QBBvEmGoiExRvfo=@proton.me>
In-Reply-To: <66d58b6c-aefd-4848-882b-51770f7020f3@kernel.org>
References: <9nTdr-7UlyytB3d5Iz0IEGrAAzjPipf4NEiZvLMmpk9OmCmRuL346OxjZgpLkLdG7dFYE_rj-5aibg7bhYHrQmjwo1e096-2IGhfi1rKglE=@proton.me> <66d58b6c-aefd-4848-882b-51770f7020f3@kernel.org>
Feedback-ID: 109714282:user:proton
X-Pm-Message-ID: c1ed678a96933ff32d521d52669fd9b9b6abbceb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I'm a bit overwhelmed, submitting is quite a complex process.
Do I send an email to everyone mentioned in ./scripts/get_maintainer.pl ? W=
hat's the difference with sending an email to linux-msm ?

I've never used tabs before, but now have to. I can't get this error fixed =
in emacs, does emacs support the linux syntax format ?

WARNING: please, no space before tabs
#28: FILE: include/dt-bindings/arm/qcom,ids.h:286:
+#define QCOM_ID_SM8635P ^I^I642$

total: 0 errors, 1 warnings, 13 lines checked


Also I tried subscribing to the list, but then I got 500 emails in a day. W=
hat's the way to manage that, or if not, then I just don't subscribe?

-- Philippe


On Sunday, November 16th, 2025 at 6:04 AM, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:

>=20
>=20
> On 16/11/2025 01:43, philmb3487 wrote:
>=20
> > Author: Philippe Michaud-Boudreault philmb3487@proton.me
> > Date: Sat Nov 15 19:41:12 2025 -0500
> >=20
> > dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family
> >=20
> > Add the SoC ID for the SM8635.
>=20
>=20
> 1. Unfortunately this looks like a messed up patch header. Please use
> standard tools for sending patches.
>=20
> 2. Also missing SoB.
>=20
> 3. Also, missing users of this - you have to organize your work in
> proper patchsets. See recent guide on Linaro.org blog how to send patches=
.
>=20
> ... and finally:
>=20
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
>=20
>=20
> Best regards,
> Krzysztof

