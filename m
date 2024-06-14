Return-Path: <linux-arm-msm+bounces-22740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F4090908F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 17:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9831F213D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF654EB55;
	Fri, 14 Jun 2024 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jps9P6/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4AC2107;
	Fri, 14 Jun 2024 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380201; cv=none; b=t2aIKhtMaI+moobqnLJE24z/4qyqvyp/J8LDKHYJBbWe6rgWn0GSLttT5kJHE8SDwVRhaai2+1API4+ULPq73qTKBTD2DGW9eer1MeYm77If8uTSQKiYfZkqamdj6krXBRYlY72L5sqqktHkVt2hb69aSeWBzCigfC9XeplBZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380201; c=relaxed/simple;
	bh=YJ+EFdoyuOpNEW4FtSMDEZLjKlxpUCgBoyg6TuEMSHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKLfx1QEFVgd1MJlqsVXSnFZ3YdcBFXnhkwvYM6tCs7mKr15Rq0PHJb7sn5G+zu2tfI0YEV1ep9gX6+9CeggqudGhIqFf0mSucW7BhQNHfxRAQfUY8DwpWsyyUsYYxZbHfWG213yEX85pJMW0jAdXKnH//KvwfvIs1NBEAsabXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jps9P6/I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D4CC2BD10;
	Fri, 14 Jun 2024 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718380201;
	bh=YJ+EFdoyuOpNEW4FtSMDEZLjKlxpUCgBoyg6TuEMSHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jps9P6/ICpMRqAWPhUlWkOO49LcPbD7VCq+JNHkiMo2wRxg2gN8ZVlV1fYM4VLjUm
	 ihZCga9heUXbARC41hrlm0DOvYOqbyztYONbBtQUrsKoRP0Su5LHxf+eoeS6suJLd1
	 HpLw1WlBgKt5WLECAhdVxnhaJUsuamxdLQQcoWsYC5q+PFDzk1OnId5eZIEA2IJkk+
	 It0UJqrbq1oR6TW71hq/3HjrW7zUDtjk48I77Csaed13ClQoT3VIMupDXLwiFv8Gmy
	 +kRLxWCnMM0T9k4o3/n1nwqWd4oJOUwUDy0Z4G8ShQRIotqrxOwt84sj+Os3A5tZeM
	 XQdj1lRBrA4kw==
Date: Fri, 14 Jun 2024 21:19:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: qcom: qmp-pcie: drop second
 clock-output-names entry
Message-ID: <20240614154947.GC59574@thinkpad>
References: <20240614-fix-pcie-phy-compat-v2-0-990863ea53bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614-fix-pcie-phy-compat-v2-0-990863ea53bf@linaro.org>

On Fri, Jun 14, 2024 at 11:35:33AM +0300, Dmitry Baryshkov wrote:
> While testing the linux-next on SM8450-HDK I noticed that one of the
> PCIe hosts stays in the deferred state, because the corresponding PHY
> isn't probed. A quick debug pointed out that while the patches that
> added support for the PIPE AUX clock to the PHY driver have landed,
> corresponding DT changes were not picked up for 6.10. Restore the
> compatibility with the existing DT files by dropping the second entry in
> the clock-output-names array and always generating the corresponding
> name on the fly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - Fixed generated AUX clock name (Neil)
> - Link to v1: https://lore.kernel.org/r/20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org
> 
> ---
> Dmitry Baryshkov (2):
>       phy: qcom: qmp-pcie: restore compatibility with existing DTs
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: drop second output clock name
> 
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml      | 7 +------
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                         | 9 +++------
>  2 files changed, 4 insertions(+), 12 deletions(-)
> ---
> base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
> change-id: 20240521-fix-pcie-phy-compat-b0fd4eb46bda
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

