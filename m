Return-Path: <linux-arm-msm+bounces-21456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 480088D7E72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0319D2828A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62817E588;
	Mon,  3 Jun 2024 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2sDXHdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567C7E765;
	Mon,  3 Jun 2024 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406791; cv=none; b=a0GeQPDeYcTOlAUh73KjnqpgguV4GtS7MS+7WqHzWc+aajtfLup251TD9vbggOxZrRD4vtDwtkqGh81niF1t2Yb9jA4U2pU/pJXBCHCwm4yIEc4gGKlF/3Fg8nhFOekZRIqo8U/xXUR2O219H3qLGsA4uSMAyhBaDXTvtD5pcW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406791; c=relaxed/simple;
	bh=Y2dx5+cOEHy0IoFA38cNu7iuVz7UirEjsLPGjgaPJFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdpMWT5J1ptYijIx8pHfzlTCHFoOPVTDGFye43bADNkC225YMQzbQYl1S/Kxgg/MmdeaKAzt52qVJV/QOUG+rVIFKyjRHgEVF7Mg/kVQCLByw+ZyNaueZ1JvZYM7mE9/spM8KLogsW17zlP6ixrBWBJd7kD8yM99PQ+L24QuvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2sDXHdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13695C2BD10;
	Mon,  3 Jun 2024 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717406791;
	bh=Y2dx5+cOEHy0IoFA38cNu7iuVz7UirEjsLPGjgaPJFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2sDXHdwh39qouEw0todqB4+2irieIsD1a7ALVgXyc6icKGsJDYPGSOO9IWYRtKlz
	 6hGc6m4KW5VzPoH2aDDf91bkVFmQf07hjcon5Czj1JM3cLYChk9kPwxjR1u9VrJW2G
	 b/ae4qGzGQ38o9rN2MisVoVp01JvJ3OaX2O4sICK3LzwFXJam6P2M9CTJ1yxn2LqaR
	 MUpfeDKlmSIKtOIeS5y2/F2kOIvK76wh4fCJxr1JRuNMMCV5iGUdcp4VTE7Ybw74j9
	 vGBxoOFGwWlUZbkIyxybDbk1zO/aM56mb0uFD/jL2fzzWHMQKRyhely8A0rr7ozKCj
	 /IFbXt17m/2Iw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE3xU-000000000Dy-2hXY;
	Mon, 03 Jun 2024 11:26:28 +0200
Date: Mon, 3 Jun 2024 11:26:28 +0200
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
Message-ID: <Zl2MRMqY0Y3siXFm@hovoldconsulting.com>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
 <Zl2DUXWUN0088-Af@hovoldconsulting.com>
 <CAA8EJpp2hK1P86vrZOwXfNBz3nBXugCcERE9yBRCaCE3aDbqOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp2hK1P86vrZOwXfNBz3nBXugCcERE9yBRCaCE3aDbqOA@mail.gmail.com>

On Mon, Jun 03, 2024 at 11:49:51AM +0300, Dmitry Baryshkov wrote:
> On Mon, 3 Jun 2024 at 11:48, Johan Hovold <johan@kernel.org> wrote:
> > On Mon, May 27, 2024 at 11:07:28AM +0300, Abel Vesa wrote:
> > > Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> > > for USB only, for now. The DP port will come at a later stage since it
> > > uses a retimer.

> > With this series applied, I'm getting the following error on boot of the
> > CRD:
> >
> >         ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying
> >
> > Known issue? Do you need to enable some quirk in the UCSI driver?
> 
> Not that I know. The message is caused by the UCSI not responding to
> the PPM_RESET command. A trace from pmic-glink would be helpful.

I don't have time to look into this right now, so only reporting to
Abel.

Looks like there are two more warnings earlier on boot which appear to
be related:

[   10.730571] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: invalid connector number, ignoring
[   10.730656] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: invalid connector number, ignoring

Johan

