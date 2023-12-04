Return-Path: <linux-arm-msm+bounces-3314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DA803876
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EFD51C20AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777832C19C;
	Mon,  4 Dec 2023 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vv/Fx9qE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549BB2375B;
	Mon,  4 Dec 2023 15:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42ECC433C8;
	Mon,  4 Dec 2023 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701702943;
	bh=lKRmpWH6UR7dQ27BRS9KstFz+7kTpsRB9YknLvU8rlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vv/Fx9qEMNFV0KlnfGLl4eFeHmRhbZTXvwqMfQeFytuZoP6LN7riUBwDOB8/Ts2Yf
	 Y9nkN2IRhew5Vmafw/4ybGAnsP71mb0RrZnBlThTmHHTFea4Gm6MMyYSuoGrtgbxwB
	 nXnaHdMWyEwDruCaX45tD2E+jHwQ3eyInCqDvxefavWnPS3kQCabsD8PZpWtKQ5NAq
	 f9FenlvEt7BYvlp03YanuX+LYWDrI0eO9eZCZqac7Je2M7IM0MuDaOgBfS/DtjqnbS
	 hGpDBLPKvXpQ+4vl3C9bElr9d2DwbENkZDLCpZqb4e5yW5HZMUHqtgBHCgR7huqNDZ
	 oN8R+FmDksUmg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rAAgJ-0003tX-1d;
	Mon, 04 Dec 2023 16:16:23 +0100
Date: Mon, 4 Dec 2023 16:16:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Message-ID: <ZW3tR86MM0upnh9v@hovoldconsulting.com>
References: <20231122-phy-qualcomm-edp-x1e80100-v2-0-114e789f0195@linaro.org>
 <20231122-phy-qualcomm-edp-x1e80100-v2-1-114e789f0195@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-phy-qualcomm-edp-x1e80100-v2-1-114e789f0195@linaro.org>

On Mon, Dec 04, 2023 at 05:01:36PM +0200, Abel Vesa wrote:
> The Qualcomm X1E80100 platform has multiple PHYs that can work in both eDP
> or DP mode, add compatibles for these.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 6566353f1a02..190f61c1d0f9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -21,6 +21,8 @@ properties:
>        - qcom,sc8180x-edp-phy
>        - qcom,sc8280xp-dp-phy
>        - qcom,sc8280xp-edp-phy
> +      - qcom,x1e80100-dp-phy
> +      - qcom,x1e80100-edp-phy

As was discussed here:

	https://lore.kernel.org/lkml/20231017032810.GP3553829@hu-bjorande-lv.qualcomm.com/

there should most likely only be one compatible here too as this is just
the same hardware block operating in two different modes.

Johan

