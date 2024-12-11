Return-Path: <linux-arm-msm+bounces-41443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D29EC7C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0DD165786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE69E1D7E46;
	Wed, 11 Dec 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMfU30ya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699B1C5F12;
	Wed, 11 Dec 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907243; cv=none; b=HNbdvI1jdeumG1mPadgRiFVFJsknHyKu2PlES0JZ31UckycINCcKxQettfzIit24G3mY7stFv/1fRjrMC8p3SIv8cuRQlV3BuaA9ZPa2n0JTmRNpsx65nOCN6CUlXixzp0GJ9E3VKzALb6/rF/ElQwIjOd3rjFTffgugJxLBDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907243; c=relaxed/simple;
	bh=txMINcnCj5mm5Ch6Zgv6/itCQUSG/85S+XOofa3NB9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak66uzEMx8D9OK0zxLPtDqmTiUoPttTfOx8QLHxCvVTO7iB+GdPiX/bH8ttYhFJUtFPACJcIWMEmT3EQdFNOZW1IFXQR5GTQuhORo5gKY2SJmrCeZ4N/I8X3I7Qit4ybmN6E1mh8MiDS8Wck8nkKdXK9sQiHdYn8uD3EK/TyoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMfU30ya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3BDC4CED2;
	Wed, 11 Dec 2024 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733907243;
	bh=txMINcnCj5mm5Ch6Zgv6/itCQUSG/85S+XOofa3NB9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMfU30yalywPqrUVI3mgV92H77pRd+W0mhjm4TDGY7odG2NDGEsyfB5vYwCBiIYc2
	 dhk8J3bilAxjTrsiz9CK+sPArs5PZujxGtKlEObvwL8gHCPyb9SoanSRsAlERcrbGc
	 1KxdlNIBj0EfcaDUJeqN/OQfKZWn0qbm1u7WQtsLkMJcUjsirno9b6nEkgH3hVKQqw
	 xVbpF2iWZNKoh5nDZAYCv6ZPu5RupMu8nMjXgi25WfFi/aHXRZsOo0yj3+Ofk1FAkp
	 gQCqpEM/QhSYXVCcvbMZV5u98LfhOBqs1dRFbHGJ05+0iLwzoopDirgFlN3cABil8l
	 nBN+tVjpA+K/g==
Date: Wed, 11 Dec 2024 09:53:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com, 
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v4 1/4] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
Message-ID: <vbwg7djb4me6i4ow2q74ltqjxvkxeulhzyq4n6ak7aifhtf36f@x66pjje2iu6u>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
 <20241210151636.2474809-2-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210151636.2474809-2-quic_chejiang@quicinc.com>

On Tue, Dec 10, 2024 at 11:16:33PM +0800, Cheng Jiang wrote:
> Expand the firmware-name property to specify the names of NVM and
> rampatch firmware to load. This update will support loading specific
> firmware (nvm and rampatch) for certain chips, like the QCA6698
> Bluetooth chip, which shares the same IP core as the WCN6855 but has
> different RF components and RAM sizes, requiring new firmware files.
> 
> We might use different connectivity boards on the same platform. For
> example, QCA6698-based boards can support either a two-antenna or
> three-antenna solution, both of which work on the sa8775p-ride platform.
> Due to differences in connectivity boards and variations in RF
> performance from different foundries, different NVM configurations are
> used based on the board ID.
> 
> So In firmware-name, if the NVM file has an extension, the NVM file will
> be used. Otherwise, the system will first try the .bNN (board ID) file,
> and if that fails, it will fall back to the .bin file.
> 
> Possible configurations:
> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21.bin";
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml           | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> index 7bb68311c..2782d2325 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> @@ -101,7 +101,10 @@ properties:
>    max-speed: true
>  
>    firmware-name:
> -    description: specify the name of nvm firmware to load
> +    description:
> +      If one item is present, specify the name of the NVM firmware to load.
> +      If two items are present, the first item specifies the name of the NVM,
> +      and the second specifies the name of the rampatch firmware to load.

Don't repeat constraints in free form text. Use proper constraints so
you can validate your DTS. And then actually do validate your DTS...

Best regards,
Krzysztof


