Return-Path: <linux-arm-msm+bounces-33062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85598FAB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 01:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FB31C20A23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAAA1CF5C0;
	Thu,  3 Oct 2024 23:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCivXwtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A21CDA26;
	Thu,  3 Oct 2024 23:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727998874; cv=none; b=eeAihsME29d7d3JwKAXMI1p/qYT3SWMSeYKD7pi4c5kwk9V0jNgs7l0Yh64lMnK89ZmskiBfocVEBKw2RvHFbZwG/5QufQnW2HXp2Y3teZAlzuNTJr4RQfiFKst8UQnPpZOIOK4CFhaGZjJbODj648zPE3ZiKyd2cWuNz8QpVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727998874; c=relaxed/simple;
	bh=izyo/MfvsnXCOlauszx1miz+7Gvkw2ssldnsTvhIVP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VupKEqSkQzt4Z2Ydbb5fXJJbPXNhE782yB6iNTSSlQ9kSKSxW3kie1tl4MY2zXrWfjgekc45EBU76Bc8lafLy3Lh6K8pI4zUPDI8ov5ju4QIansacT7mMkx0ISuF8JvIswc5m2lv3+3MsCE14QnJ091wFQZAUBscA62rSkF5mFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCivXwtG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0E3C4CEC5;
	Thu,  3 Oct 2024 23:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727998873;
	bh=izyo/MfvsnXCOlauszx1miz+7Gvkw2ssldnsTvhIVP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCivXwtGEbSKeZElFTxVQgRfL5vFjKzc3rrKnIJ0cHYk4TxyrYaf+h5ztyzKen1qb
	 6Jd4BJh5v+rrRDsxEkIoLCiPUZkH4A6sYe+/BHuVPw8MYatgIDyi7Ge93Qv5b780y8
	 UbvQX3xzVHB9s+RJv999b8M9FBkYfBAzXJOLlug0PlYZA5f01Zkmhd5kkJ0CoSEw36
	 IyqdJ1DHfct/ZqAyyvKWU3zYYkEOAQQgzgmpcK6FeF2dZQyd8RddDUIjbQhvN3Fcj4
	 6SBKEgq3sZhUpM1FoF2kllCun3EBnM7iyfeekQF1qLHgnJxXBviDnPc+BTywjCHcW7
	 yFQtF2yo6p/wQ==
Date: Thu, 3 Oct 2024 18:41:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 3/5] dt-bindings: display/msm: merge SM8350 DPU into
 SC7280
Message-ID: <172799887185.1833455.5440021996602281505.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-3-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-3-91ab08fc76a2@linaro.org>


On Thu, 03 Oct 2024 10:14:20 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SM8350, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
>  .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 ---------------------
>  2 files changed, 1 insertion(+), 120 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


