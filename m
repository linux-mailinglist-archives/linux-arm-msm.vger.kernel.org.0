Return-Path: <linux-arm-msm+bounces-66745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B3B1274A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 01:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86443AE27C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 23:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B2925F7A7;
	Fri, 25 Jul 2025 23:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mghQNf4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E640856;
	Fri, 25 Jul 2025 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753485816; cv=none; b=Wh0cdtPL5BdokROOkFIHb0y//Ij+c50hVMQ+DaS7KHMEEGgdplG/v1PV06D4BbB9H9Hcfl2tOrJcCSbb/rr0J9NOe1Z14TKfXPXwy00aV6INcQgrDOhjw9sp7D1SG5Ni1DOA8NVrh/MQFEhrfyW0DbfVEGzYuwP8QPwmEUXFLS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753485816; c=relaxed/simple;
	bh=PN/tSm4QrSvwt43cns0rNqj0r+MrbUldO6LQeQ9iGGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLlQ7+fCdyvvNHwQegyZzm4aH+3JZij6FPvYx5AJsPJjoDWnmTfJNIeBSlCYWQcnx5sO7zER6pgAAN4POppkE4T8/ATkhTcR65aZ/aPR71VXZhnHjegnyA02qCwOpVtz+grLFjEkE9oabSg3HCGfy4uCyenerPfUqSU1sJg84HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mghQNf4H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEC9C4CEE7;
	Fri, 25 Jul 2025 23:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485815;
	bh=PN/tSm4QrSvwt43cns0rNqj0r+MrbUldO6LQeQ9iGGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mghQNf4HuKgekXgZ+Nd7145X9O2PoaNk0p3NrZMwI/PVHMmVSv9tPDX384VsHM1v6
	 b0nm8Xd5nT52oBGxCjurmTFPltcK0njPbgRQJF0ldRCRwvIINyy1Bt1Iub/AVLVgZX
	 0egZUxLTl6yaSsheek7xGSb/yXr7vHwvPU4g+Et5YXo4+bEU6Ojt2vapBtr78kfh1U
	 mAZ+g2PgFKh7qPA1sRXduX/xZAwebiazdMyd8ScabU4rtLa8C1Cf5Ch7bWiB+nlrk7
	 xchitZidT0oz74EUUAcd7zIRTCZUWmY/esBcGV2sudlCpJq+BYbslG0Ux3f/OkwXxM
	 Q76wbWqnfALJg==
Date: Fri, 25 Jul 2025 18:23:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
Message-ID: <175348581438.2022551.9381678152141796362.robh@kernel.org>
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>


On Thu, 24 Jul 2025 14:28:08 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Qcom Slimbus controller driver is totally unused and dead code, there is
> no point in keeping this driver in the kernel without users.
> 
> This patch removes the driver along with device tree bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>  drivers/slimbus/Kconfig                       |   7 -
>  drivers/slimbus/Makefile                      |   3 -
>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>  4 files changed, 831 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


