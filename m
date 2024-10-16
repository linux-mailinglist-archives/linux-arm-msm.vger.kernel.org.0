Return-Path: <linux-arm-msm+bounces-34557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3389A02DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 09:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF30D28B0A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 07:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739501C07F9;
	Wed, 16 Oct 2024 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dx8OTe1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB31C07E2;
	Wed, 16 Oct 2024 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064605; cv=none; b=tJ9ppMouL7c5dHCIWlZDAhvmBjqSPeC2ZPphI1TSy0K4/ispFbuODD0mHMkZBJ2wMEZvHCO9GP4Fi1dvHtTbaQDotkeH+LPGQXNWqGGDnWP+xzoNAm4Tz6RGvASGB0AhQEbF28xrlrAsgateT8HAMsFOfgkWR/b0GCKYY2KtfpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064605; c=relaxed/simple;
	bh=dV5m/aN/2YsxFvGILikTbXo8kwHU55b6t5psOt2j2/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwSVE9DGBhwMf5MWt5lIHtaWDTertBtE8oisSQvBS2sydD8cXyw0JlwsjR+TlpqsCDZyNGZMxgWq8PeKS7VcSOg8eVkv0OA2L7CEijZa8yDZVQWEz/qvRtJPGDoYltnpYwmO/2wr86gzbJ/ME0Mt2XXTQBZTgbzyI6Hj8vNz830=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dx8OTe1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FDBC4CECE;
	Wed, 16 Oct 2024 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729064604;
	bh=dV5m/aN/2YsxFvGILikTbXo8kwHU55b6t5psOt2j2/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx8OTe1m4AHpptQw0HFc9mfJm3zNVu9Ifd0mi6YgD9PJhMpYeurb/tCVPA0gjw+sh
	 0pR9Vt7kPTJftyQ6jiRYvv+mMSp5vsdDXN3MDHePLZ0XLhtumHlF6d+stCj4+UIva7
	 wpy5WDXtHlqWDwwdtetcf+F39euZLRupP2IfxjgsWbdGDTe4JkloTkcfDjmdKAdlMN
	 gGVlRK8sAsP3O2mkzahKbfBFzQe4B9CS0S5emI3ZzJfhCu7G0oj5sZJy43L8GTd2mp
	 pmDkXeXG+kZuGG0OQr0rdsl2NVDpaswdl/f18y/Nh2w7HHbh4pXoCa/X7eMFhYUcyy
	 OCA32Jp9noxBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0ygt-000000006FS-1bnL;
	Wed, 16 Oct 2024 09:43:31 +0200
Date: Wed, 16 Oct 2024 09:43:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
Message-ID: <Zw9uowy2_Rcl0yp3@hovoldconsulting.com>
References: <20240911115253.10920-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911115253.10920-1-johan+linaro@kernel.org>

Hi Vinod,

On Wed, Sep 11, 2024 at 01:52:49PM +0200, Johan Hovold wrote:
> When working on suspend support for Qualcomm platforms like x1e80100, I
> ran into a NULL-pointer dereference in one of the QMP drivers. Turns out
> this issue has since been reproduced in two more drivers.

> Johan Hovold (4):
>   phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
>   phy: qcom: qmp-usb-legacy: fix NULL-deref on runtime suspend
>   phy: qcom: qmp-usbc: fix NULL-deref on runtime suspend
>   phy: qcom: qmp-usb: move driver data initialisation earlier

It's been a month (and a merge window) so sending a reminder.

Could you pick these up for 6.12-rc?

Johan

