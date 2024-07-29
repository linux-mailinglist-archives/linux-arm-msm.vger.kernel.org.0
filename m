Return-Path: <linux-arm-msm+bounces-27164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8A93EC13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0667B1C21776
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682E4839F7;
	Mon, 29 Jul 2024 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcCwZB0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3812582D8E;
	Mon, 29 Jul 2024 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225522; cv=none; b=Sjdu55K56IleMX1nRUsoTjb26EQqKAZWQXAncSsHWgvs9cN7AoKngcFVeR8H/tMQAPFTy/UR5ouZlVU7BgLPYuXk+EYYUOqQ+3FpP93EM58tGIUW6X7diUH/4QhpYuP3SQt+Bh3ruBXmgyQsOPrGVMB8d6FPrYg0/AEJRwozvHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225522; c=relaxed/simple;
	bh=uC+kHph6ZlE3LKYL8XLpfKF9GkQtsulqxQzM2ueqVa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OiPVBUU2MHie7hro5sGBojv+/9u8lnfaJ3YJ5xrx8VRqR2vqhWZ78ujboJK+QsAZBo5uIc+zkaPXjqcGkgV6J/1GVlnPhihWlY+REpqdS1+P/8zMZAGiYiwMwm7Igl9/pMIVd1ETjRn9kY6PCMQg9uaPL7uUbFAw2t4bNwEk81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcCwZB0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11758C4AF10;
	Mon, 29 Jul 2024 03:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225521;
	bh=uC+kHph6ZlE3LKYL8XLpfKF9GkQtsulqxQzM2ueqVa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FcCwZB0vL5xc2ng4VIF+J7hfNufy+MvMLqZjgiNaRjyqPVsNHpIy8mleZMAYbyE8H
	 jSmraqcd8QEF5zag/s/gvXmPyIfElfVfx52tWjzdl38zqQAF0NSaYEVenPFxT94opn
	 6nfM8yOWraFVVflh+YpUkKNNLpfSXFxJh8SDN60BhZ2hbmRHGr1L5pv8vtIEgNmlLE
	 mKMnAzDgtq1Drr+SEL+8ufXKOjbxvdoghfAuWnT+t7Jr+hZ6wgAaqAOXSD2X6++CBI
	 BykhVSImFu4kH1I8LrlnpNWx3fiPufzFb/4eSAJh/EXmAq8+jQZBor3uUY1QUR+Ziv
	 uDaFdzzw6yYdg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify struct freq_tbl
Date: Sun, 28 Jul 2024 22:58:08 -0500
Message-ID: <172222551303.175430.15476491165760895112.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>
References: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 14 Jul 2024 15:01:58 +0200, Christophe JAILLET wrote:
> 'struct freq_tbl' are not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7595	  43696	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Constify struct freq_tbl
      commit: da3c15ea05d8257c1987e527004e6331126e9451

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

