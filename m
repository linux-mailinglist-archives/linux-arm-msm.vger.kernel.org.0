Return-Path: <linux-arm-msm+bounces-47524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF5A305AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B2E1884CF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB721EEA40;
	Tue, 11 Feb 2025 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITvmJVg2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFBE26BDA8;
	Tue, 11 Feb 2025 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262289; cv=none; b=kYPFVYbwVmyFj0Uw1V8XBgQx0Ravor70hmGb6tLbb8VxiH/WlFPqjfM9kWz2H/f/vL9baPNW5vh0+/zBmGJsLnxe3mbmrh0srdq53EIRY37c27HUpquu5j3kXMCGW82nJLhxTzfJoWQNYxrJZOjVyjphscjqzBBe8VjxVtg2ezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262289; c=relaxed/simple;
	bh=xzTwU6L6aVazkS2rIsucwAMSQj7eAV5dZxshfy4Z8dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWpgdV8F+MhVDgTdrcmZ7jkyW55ZnFv8qzvGuaWt7fZl4NNJc/UWmQinKkX8EjSgQ3x8A7MQowgmk48lc3iw8ibr47O46UVeAfu5c7DW4i7O0+HVp/kYLw4kJP1lcwzEOa9opqObgUkkOszQ661HsG9fPDHaaUyDUmPK/vyI+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITvmJVg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06020C4CEDD;
	Tue, 11 Feb 2025 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262288;
	bh=xzTwU6L6aVazkS2rIsucwAMSQj7eAV5dZxshfy4Z8dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITvmJVg25hgF49vgDKGzmVu2LkOW6dIZtVLpU/KXP+mq0nJ4ZT1OMGxlkcvZxaQQL
	 39Tu9WCL1eYHte2HeQM0sCKrO4HwWUtaLpYrLappeaVsCd37oXOC4gzC4HMZY4JWAE
	 DkjOT/q/bNrJdb9JOyee6Y5BXTSdZnI1V9BlgIFS3ur9aGN8hAfYcYD6zmWNSRU9TO
	 ELzjI6JdNomKI6gdULxtOjNgfeyn8yvEAjdoVhfM5T+KMeAuEyISspwYfm+PveIMiq
	 oA1brOU/oJgx8CYoASC+W+NC0gIv5Gw8/2nfq300SOnk7/iaoLYIo8txJBoRT8NFIc
	 v2XYfQJYuAo+g==
Date: Tue, 11 Feb 2025 09:24:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/16] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
Message-ID: <20250211-hungry-cinnamon-jacamar-b0b3c2@krzk-bin>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-1-6224568ed87f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-fd-hdmi-hpd-v4-1-6224568ed87f@linaro.org>

On Sun, Feb 09, 2025 at 07:04:45AM +0200, Dmitry Baryshkov wrote:
> The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")

That commit looks a lot like an ABI break and keeping bindings is a
proof of that.  Commit mentions upstreamed platforms, but you have also
downstream users which matters for the ABI.

Well, that ship has sailed, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


