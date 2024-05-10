Return-Path: <linux-arm-msm+bounces-19726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FC8C2B02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 22:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52D2FB250D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DCF4D9EA;
	Fri, 10 May 2024 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJmBQRxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EF47F73;
	Fri, 10 May 2024 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715372080; cv=none; b=Zh7J+0PUJS+Jmov+MWGlqqv+IUNS03anu7VMoIW+kVQ4vkn+VSjxa99xOozP5KGaMaOHdqUnRhF8NKSEIx6R43BhsX/g13KDtNVMt/JWxXJuC7JdY1sH1VzBUKINU2d3LQENHrP05j8Plj91ysw0A16Hkvfe03v81O1XrKENzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715372080; c=relaxed/simple;
	bh=U4DW9JqSs0oVsAPG6aqUd27s/QWxPrQQplbdlUqbnVc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=VjRayMJpWd9vP4yTaSYPeyOH2+uObUHf8A9l5hpV8IYRcPFcN5/XEPUe4bySANubIxZ+9PqVtIZH+6YS3Z/n74y9Ec/sL1RDpSMf66Qw6fIIsRA55Dfl+OpQN7kVOKLxyWaw1MyThyqLkVsX3wg0hyYvi9naG5n4Y8QEGiIuXds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJmBQRxU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104B8C113CC;
	Fri, 10 May 2024 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715372080;
	bh=U4DW9JqSs0oVsAPG6aqUd27s/QWxPrQQplbdlUqbnVc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oJmBQRxUQcfG/JDui5VMWP8tBOTGYrznL33+mujJDRLzHHf+q/5hkgqDr2ZKC0L4E
	 emdhvuALFF80c3rdUw9BPfq2PqridfT5ptXQYHHxZCTghEpOKrrTgJp9cqkd3xTsNi
	 Vn0gn2UusAVFgnCLdym0gY7m8xy+ojXQmGwoGTQe3KAkds9SIN7CQFowmMtQlg0ClI
	 +Gt2VBEmEVXpkvs5HZg4wgREXdl726Skr6fgVpFhl0uaf01A9qxQG1WxeM4mxOA4cV
	 J/0b257ioHJm+F4mGOzuIAQmnZfHgsURlmq409H7/duE+v20j02m+0iFki3KKcdPSx
	 iRfQSp+mfTRwg==
Message-ID: <27cd559d7cc47fe38437570e57ec7a99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c3c9a75ed77a5ef2e9b72081e88225d84bba91cd.1715359776.git.christophe.jaillet@wanadoo.fr>
References: <c3c9a75ed77a5ef2e9b72081e88225d84bba91cd.1715359776.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: qcom: Constify struct pll_vco
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 10 May 2024 13:14:37 -0700
User-Agent: alot/0.10

Quoting Christophe JAILLET (2024-05-10 09:50:00)
> pll_vco structure are never modified. They are used as .vco_table in
> "struct clk_alpha_pll".
>=20
> And in this structure, we have:
>         const struct pll_vco *vco_table;
>=20
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
>=20
> On a x86_64, with allmodconfig:
> Before:
>    text    data     bss     dec     hex filename
>    9905   47576       0   57481    e089 drivers/clk/qcom/mmcc-msm8994.o
>=20
> After:
>    text    data     bss     dec     hex filename
>   10033   47440       0   57473    e081 drivers/clk/qcom/mmcc-msm8994.o
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

