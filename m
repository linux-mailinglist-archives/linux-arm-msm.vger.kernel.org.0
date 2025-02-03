Return-Path: <linux-arm-msm+bounces-46703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E4A25321
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84A6A162C37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 07:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D0C1DED47;
	Mon,  3 Feb 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaf1MwRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4252557C;
	Mon,  3 Feb 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738568211; cv=none; b=WO4/sg4Gf85SKxDbOfe2DBW5agyJPWF5HUTd8lTkk7cRGDLcJHS7UVNpAL4fHj+OgQGSsPj+2EjJuw3kOaZgtaBlPGxfNNumsYfvUqXxCIz8YI31JIFBXy7d5DlFETryfhef4aDR5tbe6deNVV9ssgv4MSivPL73rw5z6gCAGro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738568211; c=relaxed/simple;
	bh=Hg5sCKmDMIH5N6S7Afmz4ils8tiC2ujQXPYqn/6TxTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf/05mfUApmC0T58db6E5p+79F4XWescQs2qDbx1u0j4Vs/GxKhJu4RDWqaGfa6qUYEZbu6bfrFrn5WkkAUv93GBvNjNzMkisvr2s9jAS/Bzl/0d6g6g4aEzPMn5G4gm5AKSfjkIOW4Eziw0QBfj7f1axrQfzuhIW7GQI9ZD6pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaf1MwRP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6202FC4CEE2;
	Mon,  3 Feb 2025 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738568211;
	bh=Hg5sCKmDMIH5N6S7Afmz4ils8tiC2ujQXPYqn/6TxTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaf1MwRPb0ZMDY1sKLNjGOwcQ00rVSm9VQ4mTNcfI8WfUDPF4tGZIzKqLCHOiR6J8
	 0vuGr3+qHsg7NQTOs4JTfc28zkjkgNo7wbCjBer7qMtvbRC7RClWJW/s1ivKRJ6tw2
	 Hl7/wtd9Fc7Nm1wMIZslfI2NkWwH+Qm6tGNH4sJLrcQ0TrZMbksufeInsnPZCKpmRQ
	 B4y9SpxjOLIKiBrPDpWTXHEKMZdkXicdI+9+OINTmCLNsHZxUDkf8ELOlyB67G+eMH
	 fQMDwxYDmXSrzUBy6tvt6JnEKbHOXhOCqNHtYJVzqGPNjCl0JRyW56Zgsc6DOiao93
	 FWiIoPrsrwYMg==
Date: Mon, 3 Feb 2025 08:36:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: gcc-sdm660: Add missing SDCC
 resets
Message-ID: <20250203-bright-copper-tuatara-6d9eb9@krzk-bin>
References: <20250203063427.358327-1-alexeymin@postmarketos.org>
 <20250203063427.358327-2-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203063427.358327-2-alexeymin@postmarketos.org>

On Mon, Feb 03, 2025 at 09:34:24AM +0300, Alexey Minnekhanov wrote:
> Add resets for eMMC/SD card blocks that were missed during initial
> driver submission.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


