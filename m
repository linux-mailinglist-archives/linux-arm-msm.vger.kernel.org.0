Return-Path: <linux-arm-msm+bounces-72925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7479B5115B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DDA1167824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7C5309EEF;
	Wed, 10 Sep 2025 08:33:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A528B501;
	Wed, 10 Sep 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493212; cv=none; b=mfhq5Tptkzr9sDdSc4h/0UxU2f5C97JCqJyQeQ0Ys52gEu+YOZmcF6I57M3gIXwJQHq3AK5YvJNTF0Y/osd/wqvF1d729uaaFTI+JUu0c3muaCHq77147dTCIFZYHx9UI8OliiJvjQ1LAjcGsdxZlYOxOSlQvTpgv2ibgFXkA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493212; c=relaxed/simple;
	bh=NSqTIMqAzgAZL5B55e0zBOkYdwvwba97n0GXA+uE3Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl3odHvqCxPtfUr+tGu10a8g1KBPj04Zqwndy4wa2/3RffZEQorkqPnWC5vMZ+T/C4MNjp1jHt+k44I/+kgb01RLf+IQ8vklqRdIEkTYS1nuFrM2Y5MuzjMSjOhVRH8g78UDsLnR/M/kUMcrcnKf6iP3v2w+J7CxrxThrPrHoHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C44C4CEF0;
	Wed, 10 Sep 2025 08:33:31 +0000 (UTC)
Date: Wed, 10 Sep 2025 10:33:30 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite
Message-ID: <20250910-piquant-mellow-snake-7b62e1@kuoka>
References: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
 <20250909-phy-qcom-edp-add-missing-refclk-v3-1-4ec55a0512ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909-phy-qcom-edp-add-missing-refclk-v3-1-4ec55a0512ab@linaro.org>

On Tue, Sep 09, 2025 at 10:33:33AM +0300, Abel Vesa wrote:
> On X Elite platform, the eDP PHY uses one more clock called ref.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> So attach the this ref clock to the PHY.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


