Return-Path: <linux-arm-msm+bounces-13106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E086E77C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 18:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B9E0B228DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CCAD277;
	Fri,  1 Mar 2024 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNfkltCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B2883B;
	Fri,  1 Mar 2024 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709314495; cv=none; b=Gl6qmi20LlPz82Mvbpknwh0XmeiOMXwXC3x/9p/hnybXbGCmOiVWks7naQmFE/YhjSzycf4TkzcSnuoIQljm5X9eWslqoTFQQTyl9uF7WFhdHNKxHNIxyEYyLWkHFXMGG/+nouKqxtl+EBG9+MquEBRdk/7wCfeDlhwqxHM9Ue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709314495; c=relaxed/simple;
	bh=hiJmLSjYgLPzRYhdIqgBms40kwe1TTYlDeb6XDjkXH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnHBmb+yIDs03jaZ2n5EoPDTPPjsEp4MfyOtvoB2PehXjoJPCp6JLmk+thgU2CX3hYYDntl0X9YoKRQgTUq1y44avaC5v0V/1h9T/tjwiJ6Koz4hzK3M2O2nn/e9wgdvZf/ORhMwuDKt2m2zRhhqAK2lF5imc6qiDhdK5CfU2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNfkltCr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B36C433F1;
	Fri,  1 Mar 2024 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709314495;
	bh=hiJmLSjYgLPzRYhdIqgBms40kwe1TTYlDeb6XDjkXH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNfkltCrGIcZDICm8gP9A0SD3vVdubgrx1kxgoGBbM6uQZRMPwj0/1KEt1+GXLCJM
	 95ZSvcgYxqmib8pv6/UQK+9H1J2L1Qc4wYVd3kbeJIBBC0h+kO3D2GF1TfYOO7OIOj
	 vrmR0kJonej3RrYRH4pxLNPx1L2Nv3TYTv3d9pRGCzD+rqlM72kmoyKSjYnWvlNxRD
	 A8WEtC9zgtdmApp/BljY7Atrawk8favrPMdfJnuaoXC91s1eOBq1PtZAPmEngZR+T5
	 sqM+lYI5CmT0RAPNrBYIPl/8V/OYoRVDhmR3jbyGMW5qC/kOKcaDpTsLoNU1fzSuWd
	 35YxBF8dxnKkw==
Date: Fri, 1 Mar 2024 11:34:52 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller:
 document X1E80100 compatible
Message-ID: <20240301173452.GA2438612-robh@kernel.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
 <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>

On Sun, Feb 25, 2024 at 12:34:34AM +0200, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 17:55, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Add the X1E80100 to the list of compatibles and document the is-edp
> > flag. The controllers are expected to operate in DP mode by default,
> > and this flag can be used to select eDP mode.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Rob, Krzysztof, Connor, gracious ping for the review. It would be
> really nice to merge this patchset during the next cycle. It also
> unbreaks several other patches.

The only thing that speeds up my review is reviewing whatever is ahead 
of this patch in the queue[1].

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

