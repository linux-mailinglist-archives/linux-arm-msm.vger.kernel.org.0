Return-Path: <linux-arm-msm+bounces-33739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77A99776D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946631C21986
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72131E2312;
	Wed,  9 Oct 2024 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhY37mms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BBC17A583;
	Wed,  9 Oct 2024 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509113; cv=none; b=lrvymiT2oWeh6OZ1UEIQo4vKNL4yRG6EM1yaA4B+aovglbueMK5/EMOwCpCnlRT+ic14a5RfI8vWJYy0rAJl11wZ1ddEIzKncCG2bsO7E+vF6zQ99qo7+KzJqyy80ZHlUZhIHulNQDprr7cNz9996ovEuWg2uS1MaWkpTXbnR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509113; c=relaxed/simple;
	bh=zGQ1oAmmhv3exYJ6k47YJiOIx8k+EBmLwHZjg/sNWW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lbyiomet1y0uI8piqKgO0bjCYWe1M9sq6NpZsmdBZaREloKFoSzMyDQJtbyZffzAPCSGF4o7lYSIrxQGbGmenKhAxtn9If1vaY1ct/9xAJSHQ9qZa02vCIynTOqVEpNPOyLehCJk91u6XyQkZ0cI+y7hUI9tHJM1j1yUxkvDfSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhY37mms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F389DC4CEC3;
	Wed,  9 Oct 2024 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728509113;
	bh=zGQ1oAmmhv3exYJ6k47YJiOIx8k+EBmLwHZjg/sNWW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhY37mmst/dBgJAUUO4s5o6+W2aE/gjZFJgVHocTjK5OnEXZ0x+rJuOCMULKKiK8H
	 nLqLQvPFVOvg0uVltbrtZSg9uBbjo8FE/r04aEgYpuAz+aUxLsEDuH8065cUAF34U6
	 7aMp12hzzOKmUt91c3pOQw3a9syBLNhWNGDCuYgqCvp9hzlmclvz4pMCfuJS6FHJcj
	 AHoAFfX+RU4Z6SWkvegWsQEYpitJNI2U5wKpIoQc7gaC/su/ShQ37gR6L1mISSpqZS
	 cT1Oav+QSadSeTehyYDVXFhOspcFRVDGuc+YnS5ro2VP4L6KRwjePaEBkDCSA+KhMa
	 vDmgRuo1hPPdw==
Date: Wed, 9 Oct 2024 16:25:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	quic_jackp@quicinc.com, linux-phy@lists.infradead.org,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Mantas Pucka <mantas@8devices.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	quic_ppratap@quicinc.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for QCS8300
Message-ID: <172850911122.740165.2459258635220849747.robh@kernel.org>
References: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
 <20241009195348.2649368-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009195348.2649368-3-quic_kriskura@quicinc.com>


On Thu, 10 Oct 2024 01:23:46 +0530, Krishna Kurapati wrote:
> Update dt-bindings to add QCS8300 to USB2 SNPS Femto Phy list.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


