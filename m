Return-Path: <linux-arm-msm+bounces-5824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D681BFDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 22:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C01288494
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 21:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF6E76DA0;
	Thu, 21 Dec 2023 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZSUBm1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7D6280F;
	Thu, 21 Dec 2023 21:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6605C433C7;
	Thu, 21 Dec 2023 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703192856;
	bh=l8ep+ho90zz55mBaxz8kcOinwOvjzB7qaAX4jDuIHnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZSUBm1b3ftXaEDWfhDKmhQa1MG/iOb2MaLnppHsD92h/baQnjTg7AUsC7dKIOZzJ
	 H2WI2v1NrzlBlPJZqC3z2gZCmNsYt7a8q+9ejav8lsDZ29Yfug1xDLzGBLPN/47X/O
	 rApMsy+pxCiiDsyD2hbkziXvu9geOQVOdQ4WWkKeGR3J43aOgkyEf5IONRLDytBr81
	 BL7QRVL9tdJJh6fKs3+/zLX6Skd9G37xGtynFLrrT8eacMD8uN4W66v39Lg+V6CRsG
	 S6ymSIZbzO1dX9aSSUCARo7JR2a4neSIyYSzF/ohyG6qOU9F7XV0TlUW5Q1C9Ghgf+
	 zIek1eaHIs5Og==
Received: (nullmailer pid 95648 invoked by uid 1000);
	Thu, 21 Dec 2023 21:07:34 -0000
Date: Thu, 21 Dec 2023 15:07:34 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Marijn Suijten <marijn.suijten@somainline.org>, linux-phy@lists.infradead.org, Krishna Manikandan <quic_mkrishn@quicinc.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>, Kishon Vijay Abraham I <kishon@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: display: msm: move DSI PHY schema
 to bindings/phy
Message-ID: <170319283595.95147.10971652363367515055.robh@kernel.org>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
 <20231221102506.18320-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221102506.18320-2-dmitry.baryshkov@linaro.org>


On Thu, 21 Dec 2023 12:25:05 +0200, Dmitry Baryshkov wrote:
> While the DSI PHY schema files describe the display-related hardware,
> they still describe a PHY. Move all DSI PHY schema files to the phy/
> subdir.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml}      | 4 ++--
>  .../msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml}      | 4 ++--
>  .../msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml}      | 4 ++--
>  .../msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml}      | 4 ++--
>  .../msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml}        | 4 ++--
>  .../msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml}  | 2 +-
>  6 files changed, 11 insertions(+), 11 deletions(-)
>  rename Documentation/devicetree/bindings/{display/msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml} (96%)
>  rename Documentation/devicetree/bindings/{display/msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml} (94%)
>  rename Documentation/devicetree/bindings/{display/msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml} (93%)
>  rename Documentation/devicetree/bindings/{display/msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml} (94%)
>  rename Documentation/devicetree/bindings/{display/msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml} (94%)
>  rename Documentation/devicetree/bindings/{display/msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml} (90%)
> 

Acked-by: Rob Herring <robh@kernel.org>


