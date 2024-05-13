Return-Path: <linux-arm-msm+bounces-19790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD08C4189
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 15:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A95B238DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 13:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F096615219D;
	Mon, 13 May 2024 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/F60R55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA061514C1;
	Mon, 13 May 2024 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605916; cv=none; b=sdBUt3Zf6mFVISQd9Y3AN8iviwwQ2O89Ux2xHO3BXbQrX9Y5y0yoOkgBt00G6HnKrN/Iupw76D/+7StJBLZRsdoOvtSl6zk6GWWWD4DW4TPlFH21ywtWqH76jkglFGMX1Ew1vRqNkMaVD2MJCmbh/LxaRrrdLryayx0DlYZ5GIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605916; c=relaxed/simple;
	bh=uGs8wzYzpFdHeDX/Baun3PNqRfhFUdOCMRK1N+BXjW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4WsXZcjH2w3u4MxWNkO7KerML+guXqIUSsA1JCzs90oc90CBuOd9ohkjmxGVlgjX0JsoVOUm9z2ms0ArfwVh6MWJUI+MMeBTLQGe896qLVgSr30PjpZ20/eqVcvQsHAVPGS5JEln129+T6BJxXxKCu74IUnNxzHf+++jOaFjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/F60R55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784B8C113CC;
	Mon, 13 May 2024 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715605916;
	bh=uGs8wzYzpFdHeDX/Baun3PNqRfhFUdOCMRK1N+BXjW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/F60R55cHvo9mUi6TeNwVAW+cVuHc5gINjapKsijPDjTyvL3OJxAPo1CI5s4PgQU
	 GOEwEnrtWN92SqnR7sNe8m9lKmIhmV2lv3I2LtXzUKPqkD6j7okakkVhLo1VUwa0oc
	 DVbM700lQFHqWRNi5n4oubd0s1ujyiLsMyxO8gj2LzBitMoQaLi5pV7vnfkV2WRh9m
	 3WwgyoBouZ7DnGYxCqhDTOnUR7+QRH162mWBIyGwHgkEUSE7dqxUlaqT3idbP/qjRW
	 t9u1Ug/QTnxb1MitreNh/M+0VdbJjJov6YD770VxGQPaTgQQ3E1FiW7i5Ok5K6Lxev
	 6cSaAiEqK5WyQ==
Date: Mon, 13 May 2024 08:11:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: fix interrupt max items
Message-ID: <171560591201.2413613.15944875819159638447.robh@kernel.org>
References: <20240509083822.397-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509083822.397-1-johan+linaro@kernel.org>


On Thu, 09 May 2024 10:38:22 +0200, Johan Hovold wrote:
> A recent commit adding the SC8280XP multiport controller to the binding
> failed to update the interrupt maxItems, which results it DT checker
> warnings like:
> 
> 	arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a4f8800: interrupts-extended: [[1, 0, 130, 4], [1, 0, 135, 4], [1, 0, 857, 4], [1, 0, 856, 4], [1, 0, 131, 4], [1, 0, 136, 4], [1, 0, 860, 4], [1, 0, 859, 4], [136, 127, 3], [136, 126, 3], [136, 129, 3], [136, 128, 3], [136, 131, 3], [136, 130, 3], [136, 133, 3], [136, 132, 3], [136, 16, 4], [136, 17, 4]] is too long
> 
> Fixes: 80adfb54044e ("dt-bindings: usb: qcom,dwc3: Add bindings for SC8280 Multiport")
> Reported-by: "Rob Herring (Arm)" <robh@kernel.org>
> Link: https://lore.kernel.org/r/171502764588.89686.5159158035724685961.robh@kernel.org
> Link: https://lore.kernel.org/lkml/171449016553.3484108.5214033788092698309.robh@kernel.org/
> Cc: Krishna Kurapati <quic_kriskura@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


