Return-Path: <linux-arm-msm+bounces-46830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB68A267A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 00:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478893A4C7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 23:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8796B2144B1;
	Mon,  3 Feb 2025 23:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W73U2Do3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0412144A8;
	Mon,  3 Feb 2025 23:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623894; cv=none; b=TaNrv0QsjGWubpYxwYM4oPNdLhIYLkZknSM3Gwl4cH7AT+3VK5Gn5QM9unERcZVT/2h9XsQjsDTBuf2OLgsAyrRjwMgQq0svzd07+XoqQQOKQMhX5MYXr3KuuyEcpv6e/GoBwDxw7bWE31ENEUDXr1Y/nHR+RDclMP+NUAM4mjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623894; c=relaxed/simple;
	bh=8LXNfDj0XbdIAmhPvi+TuYd1/opSOX2Sn7nRqUMekVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEHiDOLh+shMvqUv+F65Bm8WjB8Y4mTQBVNwz8+7qJ0SWD+yW8OGmU9uEBdgYX468cge9JLDltE91ikC0J5RoHFNLPhBZTD/7idcBfrlypwNoRSO6WcxJ2BmWCTFJz2E9n784BeMi/cY0tcunm/gbNYAKAdcDmCm+zYDEjz2Vfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W73U2Do3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B72C4CEEA;
	Mon,  3 Feb 2025 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623893;
	bh=8LXNfDj0XbdIAmhPvi+TuYd1/opSOX2Sn7nRqUMekVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W73U2Do3p8HRpob25XLwSf3uFb+Uj7d/dFfMIyFRZwRt7Foo28qldEsHhuEr9Heun
	 A9z/eoBtcyF2nTtz2xAMc5oYBLvgFCVNfhLfDsZi5UMyOzJV8ZwlFNnBpqr2sZsrfT
	 sXLfoAdGPWyUMLtEcYR2Mbna2AXWtk9ynv9dR7MhTmcJPk/9WqYl07AKMu/zmbPY0b
	 v/mYDKfMtkgiWWK+6wMl+rNOMhuCxuoPip9ZDKzHRSec9oHP8a4VOVJIwwjMPm5xsr
	 2QnmeGncsFD5N5KDaQ9H6jvDOC9imsSR/UFMTbQ41ikzR18cID0hlssuc3rS25xo67
	 u12dLkBwxJdhA==
Date: Mon, 3 Feb 2025 17:04:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: maarten.lankhorst@linux.intel.com, konradybcio@kernel.org,
	freedreno@lists.freedesktop.org, linux@mainlining.org,
	tzimmermann@suse.de, dmitry.baryshkov@linaro.org,
	devicetree@vger.kernel.org, quic_abhinavk@quicinc.com,
	~postmarketos/upstreaming@lists.sr.ht, krzk+dt@kernel.org,
	jun.nie@linaro.org, fekz115@gmail.com, robdclark@gmail.com,
	marijn.suijten@somainline.org, simona@ffwll.ch, airlied@gmail.com,
	mripard@kernel.org, conor+dt@kernel.org, sean@poorly.run,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, andersson@kernel.org,
	jonathan@marek.ca
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Visionox RM692E5
Message-ID: <173862389119.509853.11162021545785979711.robh@kernel.org>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-2-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203181436.87785-2-danila@jiaxyga.com>


On Mon, 03 Feb 2025 21:14:24 +0300, Danila Tikhonov wrote:
> The Visionox RM692E5 is a 6.55” AMOLED panel used in Nothing Phone (1)
> (sm7325-nothing-spacewar).
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../display/panel/visionox,rm692e5.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


