Return-Path: <linux-arm-msm+bounces-65989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98BB0D1E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D334546FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 06:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF5928C2CE;
	Tue, 22 Jul 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPkecZYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF9028A408;
	Tue, 22 Jul 2025 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753165759; cv=none; b=l9TXkDgD7QmRtjlQFAy3ufIaq8DZwvkhy+6IO1umx4Ausq9gfpDh6ifs3R+7x+oyhvfGl/NZjvZFYbz9QpIF+bycYCgnmftERG1jjMKFKMkPTk767RDCxmm1ju94VIE2b0MrRutCUoIZQibYPOXarVqAE4GbCopL2RGkRIeaDhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753165759; c=relaxed/simple;
	bh=8SwUqEks9k0PDwC3ci2tkkL77iFORQTbQEXKSYXId5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K29Z/ryVMiEJmX1JYKmClCoMPME+rVlqKJU6cLtMPwRoyv9YqHPhCtjmE16Hom2RDxxMjnFp/+GcMvL8r3SV4zTiLl92bpdXW2zufm6sSgKP5TH7rswwrUrnqmkJRobuB6h2j32d3gbordTivFjC1JzBawHl7bagYH2ySwazKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPkecZYW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF17C4CEEB;
	Tue, 22 Jul 2025 06:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753165758;
	bh=8SwUqEks9k0PDwC3ci2tkkL77iFORQTbQEXKSYXId5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPkecZYWF3sz54RWKFcjpewfY47WdWR2JxqcWFOsYiftZonaf2ZS85pnIfeSGobTr
	 mwJ2pvMUJx8iwhT3PcqBZ6T9dBpYOSwCtpWSaopPy8J8zmUMkbMAFjCeAiz0A/A9+b
	 3ABhG2IN/H4x+MZXF97lYL7UxK/uEvmofkz980DuGjRkyCgY89ZuOp4ghSjcHH2I3z
	 cZ25Zbn5nlCpRtgnxHPbv9wIW36TfWzLHg/Vq65gkmZmAYTCdt5B/wjfBLwQ2t3LLo
	 8sERPeFKWwBHms0MOHk7kpoRu44QFt9/WWJq5bnFjIuPoAIGP1/Afe6OMClZ1/k7F5
	 5zy8Tr3o5N2MQ==
Date: Tue, 22 Jul 2025 08:29:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, bryan.odonoghue@linaro.org, 
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, quic_cchiluve@quicinc.com, 
	quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: qcom: geni-se: describe SA8255p
Message-ID: <20250722-secret-bulldog-of-promise-0ef76f@kuoka>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-3-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721174532.14022-3-quic_ptalari@quicinc.com>

On Mon, Jul 21, 2025 at 11:15:26PM +0530, Praveen Talari wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> SA8255p platform abstracts resources such as clocks, interconnect
> configuration in Firmware.
> 
> Add DT bindings for the QUP Wrapper on sa8255p platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

How the tag could be placed here?

> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>

This is really oddly managed. Can you finally start using b4?

Best regards,
Krzysztof


