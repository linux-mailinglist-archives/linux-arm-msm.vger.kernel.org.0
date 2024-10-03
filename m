Return-Path: <linux-arm-msm+bounces-33064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C972098FAE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 01:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DCEA1F22769
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05651D1F6C;
	Thu,  3 Oct 2024 23:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlIMlzQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF411D1F5C;
	Thu,  3 Oct 2024 23:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999031; cv=none; b=Urf5FqlQ7VkhfEHybvBRx5ag1dtt/jq7uPDRs9s2WrEV9szUgVtObfT2skC8EviA6DCvLd5Od9npVrC/5tmBXPAcST5+VSdkG6muvAWobXl6T2nfW0vDjJEK64tkKiOSkSn+3jgiNLEX3QFpidUA9zv3jsUTyPyjitq9fn7RcnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999031; c=relaxed/simple;
	bh=T81lsStQ9X3gO/r8Iw0HI7telktUoho0zLgX1MlJofA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzj9pRWpr5vPb9WZo8aHDkAF4WbWE4NrpWyjjF9ldWuPtdbvsyzmTaBRaYydF9/bKnabF6dqYoCLBcTlThm61UlayDvyf+jmWRJRP6FonphFYe9eig33A3TLeHbbGglSC9QvwR6xKHdk3fNpWfe3dx9VHVf3pzaMQPp/R5118Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlIMlzQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32AFC4CEC5;
	Thu,  3 Oct 2024 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727999031;
	bh=T81lsStQ9X3gO/r8Iw0HI7telktUoho0zLgX1MlJofA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlIMlzQsnnSej7bHvawbI+wuF+Gl9B6Rop0s/Ojv05A5i3+vV/Luxx2I8Cyw4Jl5D
	 MwgdDlFJDS2SNlwkjxwcltV8WmQJXWFrHTy++4PgvRXmJzW/i6j3bMqjfK3f5H2eqF
	 kq3Bi4Hy8IlKvsX8SvE2SwoucZX+BnbcCPa6vpMpKw0DkEBBrDqkDvIyeZTLe8KxzT
	 drArZ6YL4qj5In9C7NbEBiO9PM4fTLTL1lj/dP+woRsXEX3/QpgRjhxl3Uovu6vvrd
	 YtV5vi9CrLaoO7j7bCuOG9SDBwhGQzbI3rFy2KPI+ZRqZ4r7YCRCJjKCY7y1Kbxu5T
	 dVajMa8Z6lMMg==
Date: Thu, 3 Oct 2024 18:43:50 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: merge SM8250 DPU into
 SM8150
Message-ID: <20241003234350.GA1852693-robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-2-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-2-91ab08fc76a2@linaro.org>

On Thu, Oct 03, 2024 at 10:14:19AM +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SM8150 and SM8250, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  4 +-
>  .../bindings/display/msm/qcom,sm8250-dpu.yaml      | 99 ----------------------
>  2 files changed, 3 insertions(+), 100 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

