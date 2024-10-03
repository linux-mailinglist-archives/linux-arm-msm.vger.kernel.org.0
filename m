Return-Path: <linux-arm-msm+bounces-33066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E502998FAF7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 01:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F3F1C22411
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1591F154BFC;
	Thu,  3 Oct 2024 23:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIW611QG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B3147C91;
	Thu,  3 Oct 2024 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999122; cv=none; b=TRwJpmp6ncnjb8r17m6gTsgvgzkPYKFw6tlfEhTqCllq3BZKenomI3CWtd1is8ar6jgp9D2PoaRQ9sNHz/mVxxShU5gEIDu+6YP5a5/pomZPvB/OtXO6O42ArnpKeJeMv4Tg4yYeSYKhh+htHzt1FnqVSaI7d0V7uDscI2z5XSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999122; c=relaxed/simple;
	bh=NAs1w9Pm/QkiRiaXhoHxmWIHtYDJEIlbdvaJveECviQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHb7R9po38DaazAmHkXaAgOOpPVfosQd2m++c98l4cE3XXVLMuTK7UOkaKShDr08jQD+24aHeAmMIKVnX+005qI6G/qvSBoYOI9mZ0pdM+IrMlw5cxxYmjPMf4YgiypFBQcLgF0ThJRHwXUgCaUtsu4Kb8+D3srdPyZQYYYb9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIW611QG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6589EC4CEC5;
	Thu,  3 Oct 2024 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727999121;
	bh=NAs1w9Pm/QkiRiaXhoHxmWIHtYDJEIlbdvaJveECviQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIW611QGGx4Afz7XENQRvz1XXTgdwsfaVMz1frRWtPn+AdNCxryL8WeOjqECTSYM0
	 FU3lUOQsUu/3JV0/+SN+5GNqTzH36Ieodz7Am6EjB8dN9AINv4zqZhT9CwuEC1JDtb
	 jDmOwGsykWmJUYZUm4jwnbceuo33QQJFRqEw6e/+mPMqextPNTW/vzIfLUsn6DSBLM
	 Dr+RRU2GvXZ8qFqzhkLDn/i3P4jTJWaSQu5ONr8IoquV61ST40oWTEETsM8WngIaci
	 3guHKe3qfGjPrs+BS06GfqcZkC6/M61UAgcqWcoNxZbaHZ34wTf/8Srn48Gt8XTS4U
	 wMN7iUVUhQ1hw==
Date: Thu, 3 Oct 2024 18:45:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	freedreno@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: merge SC8280XP DPU into
 SC7280
Message-ID: <172799911629.1878572.17327003017449730476.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-1-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-1-91ab08fc76a2@linaro.org>


On Thu, 03 Oct 2024 10:14:18 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SC8280XP, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   5 +-
>  .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 ---------------------
>  2 files changed, 4 insertions(+), 123 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


