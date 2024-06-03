Return-Path: <linux-arm-msm+bounces-21468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B818D7F95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1061F248EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695397E796;
	Mon,  3 Jun 2024 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfxZSCp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9782872;
	Mon,  3 Jun 2024 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408940; cv=none; b=A9mZsUuklXQ5I+qQR3QXkzTbJHP2EejTbJckIGOq9+9E+wZZ3Nf1sghWvcDrPpRM41/qz/avWnOcIfz8Mjy64QvgZM9w0KZs7eCCQprh6gGmoQuNMhkvWi0Wh0BBnFyg5H0tYZAfI91wot665NwzCGQaUVH0bxelXMXJLmfUwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408940; c=relaxed/simple;
	bh=BRWVv0tKrlhNfNNgMd2meuvKyvRJuR+IFhp+7/utZc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uny8R6qKhbfg9q8MXAF0XeC+xVlc/yu0nO6wGnHfNRT8MP101rAuv920rwdrA+E9UZO2kxIl+X5zXh8Cu6oH4zG4ZEpPvesDDKgIQQn/asXA6UVMFnpDhOBOhkvGsOL/xkxskmzgYkBoTwyWvIOLGw/9vGNCdBWCJZ1BGL1q96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfxZSCp3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03553C32786;
	Mon,  3 Jun 2024 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717408940;
	bh=BRWVv0tKrlhNfNNgMd2meuvKyvRJuR+IFhp+7/utZc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfxZSCp3vFXJ+jDvpwtpgjEQZJeQYigvvMlSyXr0QlH0zXBjwtcwaTycXygjjYKY9
	 vH4mCJwpBiVmALRSxDY4vTfY01HWpSgxaPHS+5fUy7jCnvaIG2SIG6h2uigXCSU51F
	 nOhBeR2wKNs/CY5+xTbZp3vp49OxhdRwh+aZxEFppXptzyjTwEpaDqmHgMS+sDN02S
	 Z0JTzS5FDf/IfrcNfs9GSfqYKXVsI2HJxgqpCqjsJVHP93vlKWBo/dsqdCoJtiAflW
	 zuvVXINBCR43zPfplvhdDnmK6W120iPMbbLTjXDxr0esyvNj8XReHF2+lhAqc6s9EG
	 t5lcvn0LGIu5g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE4W9-000000002he-3gPN;
	Mon, 03 Jun 2024 12:02:17 +0200
Date: Mon, 3 Jun 2024 12:02:17 +0200
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
Message-ID: <Zl2UqbmqR5KLtUXS@hovoldconsulting.com>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
 <Zl2DUXWUN0088-Af@hovoldconsulting.com>
 <CAA8EJpp2hK1P86vrZOwXfNBz3nBXugCcERE9yBRCaCE3aDbqOA@mail.gmail.com>
 <Zl2MRMqY0Y3siXFm@hovoldconsulting.com>
 <Zl2RkMMk9B12t2CM@hovoldconsulting.com>
 <Zl2SHA9o1kUMMnOa@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl2SHA9o1kUMMnOa@hovoldconsulting.com>

On Mon, Jun 03, 2024 at 11:51:24AM +0200, Johan Hovold wrote:
> On Mon, Jun 03, 2024 at 11:49:04AM +0200, Johan Hovold wrote:
> > On Mon, Jun 03, 2024 at 11:26:28AM +0200, Johan Hovold wrote:
> 
> > > [   10.730571] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: invalid connector number, ignoring
> > > [   10.730656] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: invalid connector number, ignoring
> > 
> > Ok, it's just the pmic ucsi driver that is hardcoding max two ports
> > still. I'll send a fix.
> 
> Abel had already sent a fix for the above here:
> 
> 	https://lore.kernel.org/lkml/20240527-x1e80100-soc-qcom-pmic-glink-v1-1-e5c4cda2f745@linaro.org/

Nope, sorry, the above was for the PMIC GLINK driver itself. I just sent
a corresponding update for the GLINK UCSI driver here:

	https://lore.kernel.org/all/20240603100007.10236-1-johan+linaro@kernel.org/
 
> The PPMI init failure still remains, though:
> 
> 	ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying

Johan

