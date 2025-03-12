Return-Path: <linux-arm-msm+bounces-51139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3FEA5DBE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ED053B526F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E3B23E35A;
	Wed, 12 Mar 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slYiwfFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35623237C;
	Wed, 12 Mar 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741780087; cv=none; b=hisWpYeQrH03RYEYU3l5fqxlb6KLjrFKVSsZZav828EPojl/zGsSUJPOlyolnmx9i+zULhvSAUoyFMbL/WskX51V/7P8B3rMFFzyI3ColMu+lmrRb9ZFn+CsJc4qF3LNZv2aVEa7YHq1eQwZ8g+QGgXGUuV089s2s++oFnJuUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741780087; c=relaxed/simple;
	bh=R8v6pS0pixsrHLGD3aftIutJXs5Es7Ccu+wDgrw5dfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYjgTWE3GzNtgc5b0wM6KCxmVKVusRDG5ysQFbjQC/3VcmJOqE42DoQ3f4sWuye5pwjB5NgA0eVEWyKprC+E0KHHExkED3XJQ+5avf7uAcaj4tnRSEWo6gBq5SOG3VXsC4IYtUTx/RgGzmFd1gWzcLL5bNWwe7RH7zYjmkw5VcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slYiwfFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED828C4CEE3;
	Wed, 12 Mar 2025 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741780087;
	bh=R8v6pS0pixsrHLGD3aftIutJXs5Es7Ccu+wDgrw5dfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slYiwfFlETo+CSOzUJfEviQJA3id2tmJKLSvxzbMzg7HtHWPTHlVwz+LwX+GAWsCa
	 xanbQiLQbbUIKSPUg/XZnlPtR1KZE8dDBmijAvmF2c+5REYDKdWVZFzNssdUTLJ040
	 EjGuwT5BGAsHa+Ye/Lbgna9pDpkYewuCm4sJN5ZMsbt6JWXh37g43AHM4P95pH3T89
	 QT4ZhxRODZzca56xRKeXQiDXENaoroZ0JGTuZU2sNMoGsbFQ0wkTvxKC+531zQ47Lk
	 7c1n8hiTvqrg2dxnLAUX51w9PDk6uyj69r2dkH8mp/eMUtremxUvFPhnvxeJzT9fZo
	 3aaVAnitvBnMg==
Date: Wed, 12 Mar 2025 12:48:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-8-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:42PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
>

So you just gave up after one comment? Context of every email should be
trimmed, so if it is not trimmed means something is still there. I know
there are reviewers who respond with huge unrelated context, but that's
just disrespectful to our time and don't take it as normal.

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>


