Return-Path: <linux-arm-msm+bounces-47868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B3A339B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 588757A139B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108F020B21D;
	Thu, 13 Feb 2025 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyCJf4vf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDACA20AF82;
	Thu, 13 Feb 2025 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434289; cv=none; b=XAhw8y95aypt1xdtbctCkxrOOArt7+fGn4qqxeqWr2bt3bBviEtroY/l1Sce6gIJhGUqPaX5ozuprmfo6hWYP6iJDWt+6VFYf5TO2++xO3iP5+KcjEswNJmITRsvnUq9psOVIURuuOdzLhZrqX6c0lhA7ynmAGL8AJjpgTYyaOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434289; c=relaxed/simple;
	bh=qhnwGyQaoi8IJLlrTunEkZvhO/0CPiOFnmcJQERWVIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/yntcidHZhHKYc+8Ke156BT/LjFshX9iGJ/lV+oJGmkdyIAjfKDoPZMHlBkeWOSHbqTdtPHjuIb3xSPGPn+5yvSa1AEzHaDb50J0ML2As7dkVbAJG3gsgYmxV+LCzM9JLcBHjfOe7LBBnZAtiNhf/huJ1Gx6A5izMQb7Nx+xrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyCJf4vf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861BDC4CED1;
	Thu, 13 Feb 2025 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739434289;
	bh=qhnwGyQaoi8IJLlrTunEkZvhO/0CPiOFnmcJQERWVIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyCJf4vf8SHTu1ZLyRnOUf9D03imj38LoyNLC9jTU6wEtitmAjg2ffn9K9pgPJEvY
	 Xx6FbFdlNW6fMjHIe/hMYWPTM1c7j8xkoPpAJN8fDeppnNoi7TfiT/4cAXLzjLkYRZ
	 jMkno97LtGAv6xvEtT+8p6tL1hJ4aBjkPvHmRqPW+KhsK6YPvPKmRq35tRmipCcdvB
	 u5Jj/6zOyJ6NiQsnhAo5TzUzHOF7F+xF7QsuPdkotHw3v7tuGatrxyGPnUd8lt3tyQ
	 xxrGGMiSD4rxgIyZOp4ODrAFptxGYhgl1WeX+VDR18UXXxD7MnYgT8NY9U/jbbCdb9
	 hvxmzgr2zlC6g==
Date: Thu, 13 Feb 2025 09:11:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo
 pin keyboard connector
Message-ID: <20250213-amigurumi-shrew-of-grandeur-bb1a13@krzk-bin>
References: <20250210225714.1073618-1-swboyd@chromium.org>
 <20250210225714.1073618-2-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210225714.1073618-2-swboyd@chromium.org>

On Mon, Feb 10, 2025 at 02:57:11PM -0800, Stephen Boyd wrote:
> +$id: http://devicetree.org/schemas/usb/google,usb-pogo-keyboard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google USB Pogo Pin Keyboard
> +
> +maintainers:
> +  - Stephen Boyd <swboyd@chromium.org>
> +
> +description:
> +  ChromeOS devices with a detachable keyboard have a set of five pogo pins that
> +  are the typical four pins for USB (D+/D-, VBUS, GND) and an extra pin for
> +  base detection. The detachable keyboard is a USB device that connects to the
> +  four USB pogo pins.
> +
> +properties:
> +  compatible:
> +    const: google,usb-pogo-keyboard
> +
> +  '#address-cells':

If there is going to be any new version: please use consistent quotes,
either ' or "

> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Connection to USB2 port providing USB HS signals
> +    required:
> +      - endpoint
> +
> +patternProperties:
> +  "^keyboard@[0-9a-f]{1,2}$":

What does the unit address represent here? Why this isn't just
"keyboard"? One connector usually has only one keyboard, right?

Maybe it is only to fulfill the usb-device schema? The reg is there to
represent USB hub or controller port, which is not true here.

I don't have any idea how to solve it. I assume you need the keyboard
child, right?

Best regards,
Krzysztof


