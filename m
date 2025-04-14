Return-Path: <linux-arm-msm+bounces-54151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CAA87846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 08:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593CC7A53DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 06:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1455B1AF0C7;
	Mon, 14 Apr 2025 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1mwHNTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1231A2630;
	Mon, 14 Apr 2025 06:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744613837; cv=none; b=Fo9A7oJe02Fkt5JtlYELHxjB8FxwJUjk97kJVjy6Uu0Tp3pfP1yMMpt7Gu7vJzL3FOScb+KgkTsJvgjXhxWvKLRa9EuPNnwWfrZn+0yLN8eR+W0XmlqhaCH8REO9NCfiA+lKdUsWQbfmB21gCs6xUwQX2ZXnKUWCcAhKaSBX894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744613837; c=relaxed/simple;
	bh=mqy+aOHjVKggByK6p/2KyFRHnUz1N9o7I6IVLGCDoWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaoSzxsW/xXxFdq2sZPILcFKVZvlPVDA+xwKShVH9WUmW6krT2RenrpRD0rU8LO4a+x393ywv/Jjv8vMzww11fSIlV6P+xd59VSN0tMxrtu+KBJUVM499BTWRlyHA6sn2kZjn9rMlffpnevd7WtJ4kUH1ZrCWcCHs02GaO/kMnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1mwHNTd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53266C4CEE2;
	Mon, 14 Apr 2025 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744613835;
	bh=mqy+aOHjVKggByK6p/2KyFRHnUz1N9o7I6IVLGCDoWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1mwHNTd5ZYVAB7ZS8zFkWpRKfoBKT42FaZJgQlq2mkfY70IPlKdE5GqQxfRNcMu/
	 9xsuLXjJKf8kzqzf6SGsqaFjrU9UwliEKl9wFTEoiKulve30/JW6EN9S0QV1QLCB8I
	 vDjEXEKNM51fholDhVIi99y6EafYba7bhE7mxHQhWcXxlZYTAS+lUw2ql7Z0n5qcNi
	 811gh/UUXgUR7PrJEuy0PxQpszQ0Amefim3MRPm4Zd+qegKEH0pnL/BZ84bAHyYB9H
	 Fndg5BVfKqs311r70/4kEoQgsXrON7GIFFXGaAhWOxUFGYOTOMfRMljddNi6gOkoG+
	 au8i/dKtTCmCw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Dkk-000000001A4-19TE;
	Mon, 14 Apr 2025 08:57:11 +0200
Date: Mon, 14 Apr 2025 08:57:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: vkoul@kernel.org, kishon@kernel.org, lumag@kernel.org,
	quic_kriskura@quicinc.com, manivannan.sadhasivam@linaro.org,
	konrad.dybcio@oss.qualcomm.com, quic_varada@quicinc.com,
	quic_kbajaj@quicinc.com, johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-ID: <Z_yxxoa12N9rNn2z@hovoldconsulting.com>
References: <20250413212518.2625540-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413212518.2625540-1-chenyuan0y@gmail.com>

On Sun, Apr 13, 2025 at 04:25:18PM -0500, Chenyuan Yang wrote:
> In qmp_usb_iomap(), one branch returns the result of devm_ioremap(), which
> can be NULL. Since IS_ERR() does not catch a NULL pointer,
> add an explicit NULL check in qmp_usb_parse_dt_legacy() to prevent
> potential dereference issues.

Good catch, but please move the handling of this into the
qmp_usb_iomap() helper so that it returns an error pointer also if
devm_ioremap() fails.

> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 2a55ec4f0a04 ("phy: qcom-qmp-usb: merge driver data")

This is not the commit that introduced the issue; this should be:

Fixes: a5d6b1ac56cb ("phy: qcom-qmp-usb: fix memleak on probe deferral")
  
>  	qmp->pcs = qmp_usb_iomap(dev, np, 2, exclusive);
> +	if (!qmp->pcs)
> +		return -ENOMEM;
>  	if (IS_ERR(qmp->pcs))
>  		return PTR_ERR(qmp->pcs);

Johan

