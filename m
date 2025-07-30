Return-Path: <linux-arm-msm+bounces-67051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDFBB15963
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85ED018820CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21D72288E3;
	Wed, 30 Jul 2025 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSLo3GuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5388226CE6;
	Wed, 30 Jul 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859646; cv=none; b=r20IcDhIXpFxfEwElhO3pedcg0A8HALL5AcIPLzm4ccglrx+mmSE0UjM2PAfyYF2GY6la8MVFVhJWOXlh2DfxJ0ajArj8SPY/XI4z3x/8hNXSnYB92+2WFcmD1G0UeT+MAWWNrHDkQDaqkXYGKDKY2iLsxhAk0ozdMpoOBWagSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859646; c=relaxed/simple;
	bh=m27DEqGKRw5A/5dNURJLfYJFuXIlxW9rHVBdHO1Cxj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bsey19skah1YAG8TOXxElohWuvtgZX3FAHa5VsL/ldjVOs1dQPPQHrCdqj4H/tvKF8bDDrAJlWnI724pAfbPBBOZl8Tba9WTnmXXUlhmi96axC4x7Kv08fo5LoBErCF481lAwb4HUk+rifspVNnsNS/i6iEz8XOKsAUBsZbvXKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSLo3GuZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C7CC4CEE7;
	Wed, 30 Jul 2025 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753859645;
	bh=m27DEqGKRw5A/5dNURJLfYJFuXIlxW9rHVBdHO1Cxj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSLo3GuZjiZzX2b+yTgimK8M51MH9yWbxgM3KcYg//X8o6/AmUIC2GQkqEHjPQDy5
	 +DieZpE0pLf12cHbyEnYOKhNK2Js4b4juG7mRMIU9Wm1CfS1oAlmRNDm8VoSgdtYR4
	 W5giZ/KBlx4tbvDL9vCvW6Mh4tWCq5Fg3bJd8VCWsCfMP2WFaSlA8La7iUw23qzKLX
	 dNO+Q17HNaQnt3MFGt+9se3PNDMIaHqv7msyAsvADleCeBAxBmYaB/BZaPIS97YEwX
	 p7lEWxJw/U32CeK4CcUxgj2UVGZ8PGIpJbl3XSEmGmC/ARw5/nw5kNHUS2bmBBLZkq
	 26UjvVY/TBpLg==
Date: Wed, 30 Jul 2025 09:14:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Message-ID: <20250730-evasive-hummingbird-of-force-fcb1dc@kuoka>
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-1-806e092789dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250729-hamoa_initial-v3-1-806e092789dc@oss.qualcomm.com>

On Tue, Jul 29, 2025 at 09:31:57AM +0800, Yijie Yang wrote:
> Document the device tree binding for the HAMOA-IOT-EVK board, which uses
> the Qualcomm X1E80100 SoC.
> 
> The EVK consists of a carrier board and a modular System-on-Module (SoM).
> The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
> carrier board provides additional peripherals such as UART and USB
> interfaces.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


