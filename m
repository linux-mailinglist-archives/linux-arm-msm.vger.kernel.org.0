Return-Path: <linux-arm-msm+bounces-79480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B82C1BBF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 131E35C27F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A402D7386;
	Wed, 29 Oct 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFTsa/97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75862D321D;
	Wed, 29 Oct 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750039; cv=none; b=WImWKyRO59Cpqx8YxMyCTWqZ78tYecL2so/paEVKe2IJdeYlrDksWlQfDWgn9auBwk+LTheMkA15FLKD+6IXSfURTVJzlD35xTcjJUn+3dbTNAlGZ5c9DRaVIPs4Dn63LBDUNXk1umjkwt/WdS3FuR1vEj9PVWhzkEH9rCu3VAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750039; c=relaxed/simple;
	bh=Vqgk0q/9I+K4kV+nPb7zauXw84aV4k0RxA8xUqhhwcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXyn9pWQvaCnQVDQrkNTD5V1ODBMA59hMmKEBXB/a4tWisG2KQDLhtbOO3SzaZ2G+F/bt9Bwf3sptP3R5aXDKqWPz6CPO66yNg1FE3fdD3tsYtY0k+P4XQ6e42TnWrMDVhagd7QbCqqkv5WvarLI9aHqSINQ4TXZrCpQsdAofYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFTsa/97; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A74EC4CEFF;
	Wed, 29 Oct 2025 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761750039;
	bh=Vqgk0q/9I+K4kV+nPb7zauXw84aV4k0RxA8xUqhhwcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFTsa/97cp8o6vJDDxG/cn4xto3mSaC8nwV8ywmQbVD8+T3Ppvx2fHtUDOjBQu1vV
	 edP/zWqvgXuVt6OChdo4le1paCPWjAXCXLrDhBIRF0dhqhBG66Jm6gh6dWzl3VulPO
	 HqMz1o9LAccG3g6922L0DWjyF7A/K0znpDdIrvdiEejpShvfavj5xEDMPsUPgBXQTG
	 gLBcbx5D8JVr4xu0Ht1/WxW/Pc8U2ve5AIoYIt2QN0irT/2REvbk9bNEXMG8uJhYhw
	 kRxIm3HcIg2Q2XMTtuUOSpBdNABPTjUPAWFpvMHvCTxWt1c20vjPsd7K3X3MAs/MW+
	 UhuogNMtu0tQw==
Date: Wed, 29 Oct 2025 10:03:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Bluetooth: dt-bindings: qualcomm: Split binding
Message-ID: <uanegg6ni2xwgstf4nrlejkeseztxdl7vkd6rjk3nu7h7gelbn@ga3tqjgp33bt>
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>

On Wed, Oct 29, 2025 at 08:43:50AM +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Drop in few commits the properties (supplies) from
>   qualcomm-bluetooth.yaml which are not used by devices left there,
>   instead of removing them in final patch (qcom,wcn7850-bt).
> - Fix dt_binding_check error - missing gpio.h header in the example.
> - Drop maintainers update - split into separate patch.
> - Add also Bartosz as maintainer of two bindings because he was working
>   with these in the past.
> - Link to v1: https://patch.msgid.link/20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org
> 
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qca6390-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
> 
> What's more it messes up old (pre-PMU) and new (post-PMU) description in
> one place adding to the total mess.
> 

Very nice to see this cleaned up.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (11):
>       dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,qca9377-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,qca6390-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn3950-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn3990-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn6750-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn6750-bt: Deprecate old supplies
>       dt-bindings: bluetooth: qcom,wcn6855-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn6855-bt: Deprecate old supplies
>       dt-bindings: bluetooth: qcom,wcn7850-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate old supplies
> 
>  .../net/bluetooth/qcom,bluetooth-common.yaml       |  25 ++
>  .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    |  49 ++++
>  .../bindings/net/bluetooth/qcom,qca6390-bt.yaml    |  64 +++++
>  .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    |  58 +++++
>  .../bindings/net/bluetooth/qcom,wcn3950-bt.yaml    |  67 ++++++
>  .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    |  66 ++++++
>  .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  91 ++++++++
>  .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  99 ++++++++
>  .../bindings/net/bluetooth/qcom,wcn7850-bt.yaml    |  94 ++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 259 ---------------------
>  MAINTAINERS                                        |   1 +
>  11 files changed, 614 insertions(+), 259 deletions(-)
> ---
> base-commit: c9d6ae701ace298035b6529eb10083d356cf2ae7
> change-id: 20251028-dt-bindings-qcom-bluetooth-9af415056c1c
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 

