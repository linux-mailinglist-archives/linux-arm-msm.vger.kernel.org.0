Return-Path: <linux-arm-msm+bounces-26171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1E93145B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5AD71F21D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BB018C18A;
	Mon, 15 Jul 2024 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZZmAYrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E98F1891A4;
	Mon, 15 Jul 2024 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046863; cv=none; b=ar9NyUDvyEAUUcibWy+JnvAxumDEPrM7EcWl8muxC+qe36/SGCxxHwwJCmWtyvKevxPe9erIu0J2zqvAklileeZFHBDJyRXPdjyG89M/Nm+OcM01NPHuMIQPWguQdcIhYfv4dhxKpXXr8oN1JPOZGipv1F0hiJTt5gXNYsBz0Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046863; c=relaxed/simple;
	bh=QuOxFXWBYg3Arz8KHBRxvT0yshEXM+Ux3TxAaR/xAEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM5nrWieN4r7V3ABQpH3VHWk95NTJTocVGsZAgwmcdvrjANoUQQaf//uS3jfYWxMjs5TzenFjs7t4y2fBapQxr5UPH5TFbk1HYNZd4m593CBifFoRxgnoaonXC3AY3RZN84+z0U0UBeiWHiTvyf9JM0qBu8WKPV0UItxBApumZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZZmAYrG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3929C4AF0B;
	Mon, 15 Jul 2024 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721046863;
	bh=QuOxFXWBYg3Arz8KHBRxvT0yshEXM+Ux3TxAaR/xAEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZZmAYrGr9relhn+T7bdHePkBUjbHLLvz5Gx5C57TKlDEGxA5ewxvWI2us1dWHJIz
	 0nzGtuJFwY9bJK4tjcV6A/EUnfaKkabFbasZ3dp7inAPprbHd7B8jv++1wQgb48nMu
	 6wvryzKwc2mIoIqbqtygWdO0hZVXnPmSIJ7Zppcijy71Kk2lkf+DnTEVJ3Cr4+sT2Y
	 DPJPzSR/ejId1U9lByIewORFxhxG1i64QJb690BMWS7BdougXHhsak/aa0iiR7OlEB
	 fMPffxeT1YAwMXixJlrx/sIZm7CBMgmiWlKYdzCd5DvMuh+EcOWB3YNSMAizXyr+jw
	 EFchG4IO1iIhQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTKuL-000000000Ov-0YqS;
	Mon, 15 Jul 2024 14:34:21 +0200
Date: Mon, 15 Jul 2024 14:34:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Add
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
Message-ID: <ZpUXTXrwL9B5es3F@hovoldconsulting.com>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>

On Mon, Jul 15, 2024 at 02:15:40PM +0200, Stephan Gerhold wrote:
> This is needed for the display panel to work on the Qualcomm
> sc7180-trogdor-homestar and x1e80100-crd.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

