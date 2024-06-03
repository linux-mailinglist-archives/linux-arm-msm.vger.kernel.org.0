Return-Path: <linux-arm-msm+bounces-21465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C0D8D7F72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 822B11C239D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E25823C3;
	Mon,  3 Jun 2024 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq0m/Gsr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079597F48E;
	Mon,  3 Jun 2024 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408287; cv=none; b=epH4RjgCtGDCeQ1cSUtYcbluXG8vbJjM3IvVho1GRJ/VKJnPVdKWICVOpLv45p+NGFJoyrqvLxS/1qc7WnL48QfHGOt8wF7fkQ6r9eam1ORhuc2TMZ0yvGUCecrjt9ivx8vhmzAp5tsRK5mzPsP3ykYexiHrgRPmkr+vk/El5tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408287; c=relaxed/simple;
	bh=dlwlNIqifiJiPHUdvmkhLJF3Wm8dYYgDEAIXbMJ/bYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSaVWFOz4D0oyNXfIavzSsM55mbuaVzQKnw9TcXoZiC/Ff9U1RoF72dHc9qesk5+dzQK2wp7252tZUXT885hwo41tpeykvYCek235Vbc15nd3GnP5Igpvz8dw+ZbtEJ1l3Bx8v3wC/elHoDe6ifnsWx1FnXjSokNQTCg8gnx5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq0m/Gsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB6FC2BD10;
	Mon,  3 Jun 2024 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717408286;
	bh=dlwlNIqifiJiPHUdvmkhLJF3Wm8dYYgDEAIXbMJ/bYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qq0m/GsrJcV7Lx+fMq7U6Qaas78leOwhG54wJJU/XzKjnLAz/bxUX5ZZiuYmWaH8M
	 3pgW+qV7G4ZwH9Bzay/VnCjaLnlwpcdLpjHNo22OkFaCOlrSXqw1bisBZBoQ9wpATQ
	 IfSm1W3pI86/6hfBQwoSQMbneBQBG8PlMOH3PL0MZ9IyRWJNQP9Hm5BjPuMBbFqGSk
	 XFOuZnCf1SNON09pL48DMPstXNSW/R4VmvgHyPpRwLPsO2I63u3fYZLn9zyq9xzgoG
	 ySvmlD1lcuz0IZmbjNPIuisd/8Iaz4hPufIJAVFpGtCb8t1olIoC7weIu9ppcNBOR2
	 /HcG3kOTVc7rw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE4Lc-000000002PZ-1ENb;
	Mon, 03 Jun 2024 11:51:24 +0200
Date: Mon, 3 Jun 2024 11:51:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink node
 with all 3 connectors
Message-ID: <Zl2SHA9o1kUMMnOa@hovoldconsulting.com>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
 <Zl2DUXWUN0088-Af@hovoldconsulting.com>
 <CAA8EJpp2hK1P86vrZOwXfNBz3nBXugCcERE9yBRCaCE3aDbqOA@mail.gmail.com>
 <Zl2MRMqY0Y3siXFm@hovoldconsulting.com>
 <Zl2RkMMk9B12t2CM@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl2RkMMk9B12t2CM@hovoldconsulting.com>

On Mon, Jun 03, 2024 at 11:49:04AM +0200, Johan Hovold wrote:
> On Mon, Jun 03, 2024 at 11:26:28AM +0200, Johan Hovold wrote:

> > [   10.730571] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: invalid connector number, ignoring
> > [   10.730656] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: invalid connector number, ignoring
> 
> Ok, it's just the pmic ucsi driver that is hardcoding max two ports
> still. I'll send a fix.

Abel had already sent a fix for the above here:

	https://lore.kernel.org/lkml/20240527-x1e80100-soc-qcom-pmic-glink-v1-1-e5c4cda2f745@linaro.org/

The PPMI init failure still remains, though:

	ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying

Johan

