Return-Path: <linux-arm-msm+bounces-44942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64017A0C5A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 00:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84C9C18873B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 23:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D241FA24C;
	Mon, 13 Jan 2025 23:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuqVNYp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AFF1FA171;
	Mon, 13 Jan 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736810845; cv=none; b=QammDmyz1uGIVDiatKGn7J85mM1k86FqYLVv7GRRZKyNhE9KlQDCL5OZ9FsNx2q4hc8gu0oQwzM/unRY8JGHY2g0EeL8CcptKVtEpUv7uxpgpcpLq79paPKxkrVTVdejP5G69D81NJ+uK17v2TrqpGqKRDka+BrP8zz99qd2a64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736810845; c=relaxed/simple;
	bh=LU24eK07VvcIkX9LfFim5vaybKtgDkqsrjcRzbnxX2k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cn/ZEwzkV+GlOppOAHXbLNARLpFwkqJr31UFPFZTZMn5wR+gBqj4s5R8k7rtU3bsPAPVSAWKwK0U/8aLbd+Cs+BNvx2LlTv2g1mVHLLvC80dTeX2dO7xYrbIx3EJZsJ4qym61GShEtRCtw1UkjrU5tCY5w08aEkWKdDnMi1FBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuqVNYp7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F588C4CEE2;
	Mon, 13 Jan 2025 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736810844;
	bh=LU24eK07VvcIkX9LfFim5vaybKtgDkqsrjcRzbnxX2k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OuqVNYp72kU4m/ZLkR2w8do2Oiy7y5lcpPjjFWqKewZyA9/I+AfNf6J6fhIREy+HH
	 b2GTXzah5jpzVNawtzHJKjPNsmddER5XS5EyV+lnP/ui7RZ98FxjRjrOkLDDhDSEJ+
	 w3o2P7HMbpP9MALBadSLs2ReFD3WOmrNlbtakMP1lI2o8PbPHCMfR4CA5pJ/pZO3me
	 AGqIhBAeTU9S4thjZi3hSL3UbJoyc4BC/d1Y3CdH2EbI82LfG76jQS+U1jdxYOlA3I
	 K1+p68h83RITXH3DxG1+Ac4PtDCfi4LWnRWWEimPPBtFo5rmnRXBBYxKdXpbZW7Xux
	 riTGsdbFdY9Nw==
Date: Mon, 13 Jan 2025 17:27:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-phy@lists.infradead.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-usb@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
Message-Id: <173681084257.3610270.9006254199741701933.robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible


On Mon, 13 Jan 2025 13:52:09 -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
> to utilize the DWC3 QCOM and DWC3 core framework.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


