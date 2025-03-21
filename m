Return-Path: <linux-arm-msm+bounces-52222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07CA6BF65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BAC617CA30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E452227E9B;
	Fri, 21 Mar 2025 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHM1CbtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196431E00B4;
	Fri, 21 Mar 2025 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573653; cv=none; b=jW9n7mt6JH340VQIJ62XOWR5mLVgoaQpLTlH9m2F4JuH9lkfQZcanyGqHcyBqe6Yk5RaOSbV3RSd31ahjLBM2fsdQqzb4tjgBo+jTKBoXOmwBgrrH6g4nTGe5KHUFJ1v3db99DO/Airter59bTQo+UKHSb/jYCyVlk32xATk9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573653; c=relaxed/simple;
	bh=D4wmE+1sJieP2ZR8N+4BcCjmZMiOCHIqifIqz4WDGnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0/qkLPCyO2KQSzufonCVluoYW6KBVq8t4ortXpdvjN4Y+B+1FozLXmmwaGrhCJK3L82wr8dUjTMHXl/BIdsA8SD8/lWfda8JgOtkYecFs2jzaVyv4vKTDa4Vt1x2LiK5nkNMIsjdKMwD4CFufOOsQ/36K1wbONOxS5KD1MZVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHM1CbtZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51373C4CEE3;
	Fri, 21 Mar 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742573652;
	bh=D4wmE+1sJieP2ZR8N+4BcCjmZMiOCHIqifIqz4WDGnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHM1CbtZoDg6GisJ10dBrzHmYigP/Xc39YTSaXnWn0akMOEbRA2qWSQWAJo5RNWdH
	 SzAUmIIQfpe2bToTpNNqZKxGvaUsB/yW/z/9p1ImCY/hSLFLcxWSqUZ6kd+T6Jq+68
	 tkdZUR/0iNv4+KxjclLCBuLCMokOYwiVH9NP8Yu4swUQNyVXPtLjeyBLB05KFCRCfu
	 yDyQBNQS3ExE3WqrBJp/GsmQMpSx1pqrp4es7w+DRLUpQj+75iYC5E1umlHYPObbmE
	 cSAEC8uOQVsKLdha6Ga5b0DIgxaPnbFRwQrDv3ZQK9GIOIfrkhICi3r2BRMEKs8OKB
	 iLRg7iQRe9VqA==
Date: Fri, 21 Mar 2025 11:14:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Felipe Balbi <balbi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: usb: Introduce qcom,snps-dwc3
Message-ID: <174257365080.3466536.3652323578969133351.robh@kernel.org>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-2-90ea6e5b3ba4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dwc3-refactor-v5-2-90ea6e5b3ba4@oss.qualcomm.com>


On Tue, 18 Mar 2025 14:05:02 -0500, Bjorn Andersson wrote:
> The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
> several of the snps,dwc3 properties (such as clocks and reset) conflicts
> in expectation with the Qualcomm integration.
> 
> Using the newly split out Synopsys DWC3 core properties, describe the
> Qualcomm USB block in a single block. The new binding is a copy of
> qcom,dwc3 with the needed modifications.
> 
> It would have been convenient to retain the two structures with the same
> compatibles, but as there exist no way to select a binding based on the
> absence of a subnode/patternProperty, a new generic compatible is
> introduced to describe this binding.
> 
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible. (Otherwise if the specific compatible matches during
> validation, the generic one must match as well)
> 
> Mark qcom,dwc3 deprecated, to favor expressing future platforms using
> the new combined binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 620 +++++++++++++++++++++
>  2 files changed, 632 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


