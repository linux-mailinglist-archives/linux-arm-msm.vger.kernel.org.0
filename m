Return-Path: <linux-arm-msm+bounces-27667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E399444EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBDC2809B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F013716E871;
	Thu,  1 Aug 2024 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzkXvzZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C608316E866;
	Thu,  1 Aug 2024 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495315; cv=none; b=n/kcyIkcnByqWloVyrtPO1Q0oaef3MD7EQ+h2HLWMVBjeeXscdBff4gukmED51BBjV/fyh7S92JsG0nrNnFZrT1Pg4c48CBSnZpkVdfuWjtqLnVZ05K2nEO6APgPvvUWAAZU2BjBOcc8WjhB0tifObYgMUfOHapx6rwwcNXP2p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495315; c=relaxed/simple;
	bh=Xpd5cHohiKAVitbHGS98ZWti2OlD/kYcr8OPOsuncGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r9Tc4FawukVzJcsdkAeFritjhWsF2LghsSLIXCiLn7hi3uK/ttgyiQ4I84cZAT+jg/ARQbp253SqIp4qrK+SNf9TO/9HmbBC/A4llw9TpmedTi12cIvrg5wqikrR8wuStlrBo8GGRiQsioGRgsJvRnPLBIUyvIZCbUur2WCjqKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzkXvzZE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CE2C4AF12;
	Thu,  1 Aug 2024 06:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722495315;
	bh=Xpd5cHohiKAVitbHGS98ZWti2OlD/kYcr8OPOsuncGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nzkXvzZE+D1aHhy8dE4eUotLGQEwSvpek0mkDAvvZIXB2aYqQL3qLfQkJMQOkMkcW
	 m/AzkGJmERRRGk60pT5tbuiwHWRm5ufbB8D3CaizDR/jTajRtcwlpI5wMR3mUgD4XT
	 bQ/HY5Qipz3j2osuTSrlfQ5NfclsYTwFcG33OiqBdF2DzXffmMxt6EMx22LTHTA19J
	 efWUvZLH1fBAJxFeu8mi8/WPYYn2Pq+wvNEYzLJtOiSzLoUAdHjcIj5hNnCwfquh01
	 jZV/2h8xrIBpIRShWKPxHo0hKza8sMG7pBxYuGEqktpum6hnsQlEWOlrk4uGDbXw/i
	 kKyQbIUHCyPCg==
From: Vinod Koul <vkoul@kernel.org>
To: devicetree@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240711122016.41806-1-rayyan.ansari@linaro.org>
References: <20240711122016.41806-1-rayyan.ansari@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: drop obsolete qcom,usb-8x16-phy
 bindings
Message-Id: <172249531217.256913.16966169857085379098.b4-ty@kernel.org>
Date: Thu, 01 Aug 2024 12:25:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 11 Jul 2024 13:20:14 +0100, Rayyan Ansari wrote:
> Remove the bindings for the Qualcomm 8x16 PHY driver that was dropped
> in commit 4756f35fdf14 ("usb: phy: remove phy-qcom-8x16-usb.c") in 2017.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: drop obsolete qcom,usb-8x16-phy bindings
      commit: b52a38ab1e157e43a2f5f1d846c4f52ef2105763

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


