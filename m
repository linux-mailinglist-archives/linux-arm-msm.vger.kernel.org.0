Return-Path: <linux-arm-msm+bounces-52945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF2A776B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 933AF3A9AFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65A61EB1BC;
	Tue,  1 Apr 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+7pij40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934D1D88A6;
	Tue,  1 Apr 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497096; cv=none; b=YjDPKCs6l0QSh1HS+AHmQ+pAl60Rv15vT3Uk/k2gUrwz0yVzSNTrv9rdIBMy4kHW7bBcUJwhthOSywS+Dpbn5MypoL4NYeQLTGnPnVCN0DUNygLMUdrd6eMn6ia+Zck+JxqJbeCWy6JhR7xO6soD9Xslc+ARQyZpk4g9h+fuNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497096; c=relaxed/simple;
	bh=wGqJBd7vfSvA8X3iZNsqbJZdCnTFtO00dJM6lUv2rKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlzQygQT4w4UhVQlGGsBB0z0AWxsoUJe1VqEOpQp2dZO3KeKK9C0IL+ySVHvNuj+bmvhhWPcvEsfiOgMMA78SnZp7Nuoa3rcOEhr1UMnckJCfVHnlUZrBVImekrX7Tw9SDVAXvH+gPwb7ntk/hUB8Q0h9OsbCGqS9rkTNNSNIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+7pij40; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CDBC4CEE4;
	Tue,  1 Apr 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743497096;
	bh=wGqJBd7vfSvA8X3iZNsqbJZdCnTFtO00dJM6lUv2rKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+7pij409ktgdqtrmt5J2yw5Avsc47NJG6b2awemQ7Om7i7j1fYfw9q1XtGP9eS+L
	 gJMod3wyBgb67LwHItVpzHD0E601jawMP7ajeSUL9kWse3RVzPQxENjfFBa18z3oAr
	 vRpSf3MtwxcYr59wFo3KM/BP/sjxcu0bkHAr8hEan4yQBqvs/rwwdhPpvZcw5jY/dl
	 IWbMKVgHKQ9JqTZb2vAmWnNlokqhq36bm9tMQy2wvIi7sGXXkvS6/4RmuLWo6mS0kX
	 FEuknwhmhNPFDtLmwNK+Rnr2TfwTn2/zqNM7s4pUgxOuRd9U8UzwGz/o+HK11wsZp7
	 V1eqFVOMgIAsg==
Date: Tue, 1 Apr 2025 09:44:51 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <Z-ung-_3ErYHqnXU@aspen.lan>
References: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401025737.16753-1-bsdhenrymartin@gmail.com>

On Tue, Apr 01, 2025 at 10:57:37AM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> wled_configure() does not check for this case, which results in a NULL
> pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

