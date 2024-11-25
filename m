Return-Path: <linux-arm-msm+bounces-39061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84E9D7C3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 08:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0866163224
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7C1155747;
	Mon, 25 Nov 2024 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChKRi9Yp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1918622;
	Mon, 25 Nov 2024 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521435; cv=none; b=lAU30q/npb2+JwtaN7IiHsowdFBAHmeJWgBNxBUGnW+2q9ovU/llCB/cgd8abVtrPNRRnZZRykx3GK/j2Tc9wNAiCg310Z68Sm1hITNCZ+6xH7zaW72+QnrJLj0ho3yKEqbwcuPQL+XZI8UYgNpokXpuCxSuK/svTg0ebg5ppbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521435; c=relaxed/simple;
	bh=Dm+ClvaQVu+hkU6CeDCUzpd3SviEzOUaEItzvlR9PtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nN4+9t/+FLiGhbd+su4C7dVyzHLx2Oj7MqEuFQcFDpiHRzdUsc0uhilFh/xUqAjRooYUpQSCzWUYv2JWX9scQ/gWZqzbF15GOW7/DL1s1Trk/KBD5lL9OnxvHzkOKY/VlFjw4LcP735d5NbQGGFxTf+u2Fr/FeWWKL4sU9ll3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChKRi9Yp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAA3C4CECE;
	Mon, 25 Nov 2024 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732521435;
	bh=Dm+ClvaQVu+hkU6CeDCUzpd3SviEzOUaEItzvlR9PtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChKRi9YpRLTZm0BU31pCn7AGpfI0Tr9599F5uPAPf0ltxUJr1TAeFPfIx/t5b0T5f
	 FjWH8aluGpjTBNherwTUoMcqGoM8XQUdL0OZBpHJofT8D7d75YF9MDuLWH53DcdtaB
	 3IATtoowK5Hgx765CpbVWNxc9FP+nqm4jOMw7TgEDo01JxQYyT756m3/1HUWmUww/6
	 RMaSHU1ZP8puFvjwR2fA3K5puiVFw/sjMscLnEAhPz/QmHUd99EDpRtlMi6NWS3hCu
	 O0ylrDyCmtMdZLpL0CJKEao0vrvggZ/gE2JGs+6PlcfdowF1mg1nqGtNnhFesCfhqP
	 UkcaQnwWWRZug==
Date: Mon, 25 Nov 2024 08:57:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] dt-bindings: crypto: ice: document the qcs8300
 inline crypto engine
Message-ID: <klb5rtv6kddqi6ontuvr7mpi5fj5nispppttsvj4hf6mlmztfe@xji7tzdgdh4g>
References: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
 <20241125065801.1751256-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125065801.1751256-2-quic_yrangana@quicinc.com>

On Mon, Nov 25, 2024 at 12:28:00PM +0530, Yuvaraj Ranganathan wrote:
> Add the compatible string for QCom ICE on qcs8300 SoCs.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


