Return-Path: <linux-arm-msm+bounces-41981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE89F0A65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7974283A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1791C8FD4;
	Fri, 13 Dec 2024 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRHa9rO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485981B3926;
	Fri, 13 Dec 2024 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088059; cv=none; b=X8VkyMVQzn2ihE0F0nSpFqOxrDS9AvDam8nVv9Ef4fvo4gttP/UFgK+PLAZzrtntElfPLS5c63I2bVfqUy6EHqMrcV3YLu9gvmRzyQiECv0hpeTItnwfN3bQfIqxW7AhWeWob3nFFese9RItZPzud5D4dA7t+0SG/t8ZHlrrDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088059; c=relaxed/simple;
	bh=f2dhwa/zhLfGfFkrjgkQK/xv7xPijgvBZCJgPe/XvRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m37ycDjkOEZvlHGnoIBYuuJOYzcMnbKqznCjEF3u8XPWGOQRaqmniE7VCugxbOb56M/NXlX32e9qgasiQ7uKtemJDKa2s9RKcDewu8SXZyXpKWjdDsm50yJHYaEGS0mBcK/mck4iuPqmrVkXs4slytLt4UZo01PnP46tAPWbKq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRHa9rO0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC343C4CED0;
	Fri, 13 Dec 2024 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734088058;
	bh=f2dhwa/zhLfGfFkrjgkQK/xv7xPijgvBZCJgPe/XvRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRHa9rO0mkkUbNYs3RbVPSuit6FzZdaZo4civREOLoJoa5rzrqqo7gW2F/ovJvtx0
	 SCT5UJ9rNsKd+/9pfKUI/59T1opJAWea83URkWG1rHEipXAbv7CQFgFBYXvnSF2Tn3
	 oWyWGBeVHAJQn6aTHODUKm3mh8DCQxtoJ/NxYS5wSMu5LscBFi4XNyumimZYr5B21f
	 Bynh8WwDuF91/hNllppXWMD2dPRkUZVOq2Cf85CZF92juYWXvlHeNlnmqXNMc6C55u
	 HJGEPdM7+nLaA5Mwz2LSsqYbML/tHuaxeW5bkEoYHXiCcvsEJBDXjBY7zSdih7Z5Py
	 42y7pJWdzJRAg==
Date: Fri, 13 Dec 2024 12:07:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 FSUSB42
Message-ID: <kq6qjrynlbqgz2ltdap67lsbehmzuudjhbhyjymy26wlffol6o@kggtwtbujilf>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
 <20241212-x1e80100-qcp-dp-v1-1-37cb362a0dfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-1-37cb362a0dfe@linaro.org>

On Thu, Dec 12, 2024 at 02:08:23PM +0100, Stephan Gerhold wrote:
> Add a compatible entry for the onsemi FSUSB42 USB switch, which can be used
> for switching orientation of the SBU lines in USB Type-C applications.
> 
> Drivers work as-is with the existing fallback compatible.
> 
> Link to datasheet: https://www.onsemi.com/pdf/datasheet/fsusb42-d.pdf
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index 8a5f837eff94b27bbd55bfe45f8d1156e3d183eb..e588514fab2d8c9d0d3717865fe2e733664fc28b 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -20,6 +20,7 @@ properties:
>      items:
>        - enum:
>            - nxp,cbdtu02043
> +          - onnn,fsusb42
>            - onnn,fsusb43l10x

Is it different from onnn,fsusb43l10x?

Best regards,
Krzysztof


