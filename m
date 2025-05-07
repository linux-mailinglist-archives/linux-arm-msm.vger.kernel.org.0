Return-Path: <linux-arm-msm+bounces-57043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A0AAD4CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C060317F66F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4071DE3D2;
	Wed,  7 May 2025 05:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr9Zc5KY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CEC1CCB4B;
	Wed,  7 May 2025 05:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594546; cv=none; b=TUauqlu0PXWLhLIst5ktusQ+xozd5qZyWniwap1wXOhoFWbIeRtPuhTq2nTmENISF95dW6IaMfl/v7gpTAs3me53lo+bnQEowl9+YSW8IpRAIE8Cd5GkBVVW++ge27PFOrLYEEMbTLywQA1ud90igucCJ/O7aYRBdEUGQwdWTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594546; c=relaxed/simple;
	bh=TalQ9fNo/fQ1mqCr92hlP2SsV2ldrs0zdknJaR4RNWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjoM8JAguMIiGgaZjknumH2WzNk8ZxSC9boMuHUUHNnO0KrYJ9QBts4No4rPGRU9CCiLtbz2AQhEGxRuAE42E/vAzFRCj6nlcpRoE5tiUTM/Hw6a5313no0cPD1ZFcj2RrSqNg6GFbmAjLRQowXbnIhv8sgsWdXrJWbSNboXB6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr9Zc5KY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5196CC4CEE7;
	Wed,  7 May 2025 05:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746594545;
	bh=TalQ9fNo/fQ1mqCr92hlP2SsV2ldrs0zdknJaR4RNWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jr9Zc5KYxpfcMufoPI3V7XOQRc1ocj+dmaEiDqVZra+axaK0NwtB3Zty9LIRJArwU
	 j11rij1/5p63xwZpsWOa69pdBz0EVSQwkVL08f3l8GMjkW74cqMwQjzkMjfuClWGe3
	 TgTDfzXt5I07h4y6P4E42Xf4ClP5xybfyWo5IU16BrMP18oFP+pKBViGCWbVy78t8+
	 W4cIzwqBmOQ+OvScIXY6shDOwTBmPvYk/Fe2Nvv+BT80eFpc7EjRYPRpG/CIeZSPqI
	 EMjvqlVxnzAIL6DXh9OQ+S11XgNf0oGVzswlM7pzTUBOEPJ6QVNZnYduKIBkIgSVXJ
	 nAC39XwgTwgbg==
Date: Wed, 7 May 2025 07:09:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, manivannan.sadhasivam@linaro.org, 
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, andersson@kernel.org, 
	konradybcio@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	quic_qianyu@quicinc.com, quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v5 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Update pcie phy bindings for sa8775p
Message-ID: <20250507-obedient-copperhead-from-arcadia-4b052e@kuoka>
References: <20250507031019.4080541-1-quic_ziyuzhan@quicinc.com>
 <20250507031019.4080541-2-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507031019.4080541-2-quic_ziyuzhan@quicinc.com>

On Wed, May 07, 2025 at 11:10:14AM GMT, Ziyue Zhang wrote:
> qcs8300 pcie1 phy use the same clocks as sa8775p, in the review comments
> of qcs8300 patches, gcc aux clock should be removed and replace it with
> phy_aux clock.So move "qcom,sa8775p-qmp-gen4x4-pcie-phy" compatible from
> 7 clocks' list to 6 clocks' list to solve the dtb check error.
> 
> qcs8300 pcie phy only use 6 clocks, so move qcs8300 gen4x2 pcie phy
> compatible from 7 clocks' list to 6 clocks' list.

I don't understand any of this. You just submitted the bindings not so
far ago. Does this mean they were never tested?

What does it mean that gcc aux clock should be removed in the review
comments?

Best regards,
Krzysztof


