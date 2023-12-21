Return-Path: <linux-arm-msm+bounces-5825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7181BFDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 22:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90DEC1F2530A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 21:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B84A76DA4;
	Thu, 21 Dec 2023 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ7HE0KH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6966280F;
	Thu, 21 Dec 2023 21:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DADC433C8;
	Thu, 21 Dec 2023 21:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703192897;
	bh=rWCnstf7VPSOkoEfMQP6U3T55hfbyUebaA/zKF3SW6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZ7HE0KHCIPLUKI1EzXKui4xroGUa8k+MkxZf2om2cKxHYz8+4HQhzqMKEPXMx7gR
	 huk2J7CH7sWq+E8lBkVWUcWMi1HhvHSzp9zPAgVX9/Mj8oVnzqKroY74U2Z+r9QAcs
	 nPYwkVmMhPmRKICorGd/SsfCi7LZ8jNU4gLkWRtvSQR/qm4V4ZxGvSxFCPjd1Uh7Mt
	 kvRwRm8Umq2pLP3JLIDBQeowsClO24mRsJ28B0UMY7H0TZ0UJjKuM11+Uwv1AkFB4r
	 sQM6Qv+t07my4qnQlljljnbCZTglWmWLTkXWdGyUG9mWy9fwi8S2q+q8MYCMVDH0aZ
	 y15MJFOds2NAA==
Received: (nullmailer pid 96522 invoked by uid 1000);
	Thu, 21 Dec 2023 21:08:15 -0000
Date: Thu, 21 Dec 2023 15:08:15 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org, Marijn Suijten <marijn.suijten@somainline.org>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Aiqun Yu <quic_aiquny@quicinc.com>, David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [RFC PATCH 2/2] dt-bindings: display: msm: mass-rename files
Message-ID: <170319289437.96441.9965499072649831420.robh@kernel.org>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
 <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221102506.18320-3-dmitry.baryshkov@linaro.org>


On Thu, 21 Dec 2023 12:25:06 +0200, Dmitry Baryshkov wrote:
> Rename the Qualcomm MSM Display schemas to follow the main compatible
> string instead of just using the block type. This follows the
> established practice for YAML file names.
> 
> Cc: Aiqun Yu (Maria) <quic_aiquny@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}     | 2 +-
>  .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}         | 2 +-
>  .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}       | 2 +-
>  .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}          | 2 +-
>  .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml}   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
>  rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
>  rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
>  rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
>  rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)
> 

Acked-by: Rob Herring <robh@kernel.org>


