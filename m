Return-Path: <linux-arm-msm+bounces-86691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 349ACCDF897
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 12:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C53D3004202
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EC22F12CC;
	Sat, 27 Dec 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgEROTIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419A2D640D;
	Sat, 27 Dec 2025 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766833997; cv=none; b=bXZSdClP/rthVvWgGSf7xm5aUhQ5qoh3ADi8SL1GCRp7f9/6ccBXG+gCbXr+Iyk5+7a4anHxDOryVov10AggyMvumElTK66citEwsgaZ9TSDJOay1O6682RtHB9J+pf/hxJE7i2NQV1izP1JHmW7WPZIOirchSF5EyuYvfbDrEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766833997; c=relaxed/simple;
	bh=/MjssVrvX9CHLhuDFc+A3P/Ke3FSefMxQfbPdX0ryF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUr0P36X+0RnJFQXFXCTXpEhRhB1BjY+qeKXB5Bz7ze/TviwxFWS0AIOVwothQcx5HWwnZv9sjDlFwr6kxGbhn4E2NLZcgP6FTVU6wHSHv1ck1HnDCW+TzwSZWuUBQAIU73pe751KUnKhUiK7/1PU3Ly3Lm17DUMa7x0Rja+wNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgEROTIV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BE4C4CEF1;
	Sat, 27 Dec 2025 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766833996;
	bh=/MjssVrvX9CHLhuDFc+A3P/Ke3FSefMxQfbPdX0ryF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgEROTIV5EPkII/T4M0ZmNq/tGPPe9Sa77Ycy84xKYddUqBUzfC0zcW5HjEwePCet
	 rwyWq6du85hxrrlZiZdtLZyfADgN+mqveqS0XM4wutX0bKsfCKnIBLCHrmTo0jCIUM
	 sJXVnq9KJxDnpbQ0RpNWt5+m4CpCcUhN90g4kvlERpQmChFIMKSyInxTm6kUmTJN5g
	 l1JAcaKg0EiOdM2DTpc5NSYCvzyiJ5tH/EvU+OlD3l2KZNB1lVXM855soYDNNT2ZQB
	 6WC8Yr2DJkFY9a7dvM58PIlYkmgOUYs5neFBpODCnvVH7Qk8MUJj445HKi8RyKlJ7+
	 sgUsIFP5WBqzA==
Date: Sat, 27 Dec 2025 12:13:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <20251227-doberman-of-radical-variation-d30aaf@quoll>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-2-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251225152134.2577701-2-quic_amakhija@quicinc.com>

On Thu, Dec 25, 2025 at 08:51:30PM +0530, Ayushi Makhija wrote:
> The QCS8300 MDSS DSI PHY is the same 5nm PHY IP as on SA8775P, with
> identical register layout and programming model. Model this by using
> a QCS8300 specific compatible with a qcom,sa8775p-dsi-phy-5nm fallback,
> and update the schema to require this two entry form for QCS8300 while
> keeping existing single compatible users valid.

Last sentence is redundant. I asked to explain the hardware, not to tell
us how Devicetree works. Write concise and informative commit msgs which
tell non-obvious things. Not what you did. I alreaded asked this - do
not state the obvious, do not copy the subject.

The only useful part of your commit msg is first sentence - two lines,
so 33%. Remaining four lines, so 66%, is obvious.

Best regards,
Krzysztof


