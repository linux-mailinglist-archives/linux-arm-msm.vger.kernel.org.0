Return-Path: <linux-arm-msm+bounces-31971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615797BF85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 19:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5AA282746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 17:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3511C9874;
	Wed, 18 Sep 2024 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjFh4A1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B361B9B49;
	Wed, 18 Sep 2024 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679695; cv=none; b=W65S19XvzbzxvfSV7iBGiEMwnJtZVqrfjz5b4Ni9XsX1Jac7ranyJwSQ9ql3rxXhbMkB4fr5bVs+CzC15h24cMATQjZosN2xIvmd4E6KdzxC2QVc/rEELYWnsnyRGycZXdErhrqAW6X0VW5o6soTIADFnCL3e36T+1pIGE1vlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679695; c=relaxed/simple;
	bh=se9nDBRBjI7FoM8cZzoIPCEXe0jMmjU5Q1XxWRQ6wUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBD0ZS1Z3XBMUFd//SI62qWl5kIQojDTnD3eaa5R8l+2L+GIeEZ8lWC0Fp2zJySNBeWkIWMW46dd+33UvBvo9qK2pH9w7jUTWHdNS8kjqgxW2YrwmzTAUl9yFbphYbPOSCptC0v0f1CTt3tSr3YgywSyRyY8JnO8qjsRx+lxOvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjFh4A1H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA227C4CEC2;
	Wed, 18 Sep 2024 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726679695;
	bh=se9nDBRBjI7FoM8cZzoIPCEXe0jMmjU5Q1XxWRQ6wUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjFh4A1Hi4VkpIC8I2IMLHVXC6pOFVGLcPJu/LY/tYv312M0B/g+aA5eMcOB21d7v
	 pirME89AvXq8f7qy+B6NQifjSFYkUCLG3Kee7FQKBJLcNz/VI/ymALb0BCCKljjpjX
	 Gy8b3WYJAkWTraU6DbWgX2S6z8RFZ6OmA9GFSijBmzek5JfJ68PvdQ2gVmfVdxtL+m
	 vG45JW3AWMI2o+zIBHtpc7pZOK83tK8BIE2Avw4ikCQjFZVBgDP91w7wkSIViXd3w8
	 Z9FqO2F3LLS7nFTPQLEU+8N3QAomNYMbjwZlStqRp2lDIK+Xq55YG8d0Cfpklh+Frx
	 o2Q3ESpMo1dww==
Date: Wed, 18 Sep 2024 12:14:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-phy@lists.infradead.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: add
 missing x1e80100 pipediv2 clocks
Message-ID: <172667969326.1817225.11425040649410740756.robh@kernel.org>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
 <20240916082307.29393-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916082307.29393-2-johan+linaro@kernel.org>


On Mon, 16 Sep 2024 10:23:05 +0200, Johan Hovold wrote:
> The x1e80100 QMP PCIe PHYs all have a pipediv2 clock that needs to be
> described.
> 
> Fixes: e94b29f2bd73 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHYs")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


