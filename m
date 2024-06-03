Return-Path: <linux-arm-msm+bounces-21463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E98D7F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7061D1C2358E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D9B84E15;
	Mon,  3 Jun 2024 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyW6+Ks8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C88174C;
	Mon,  3 Jun 2024 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408147; cv=none; b=PyoanUgo0R3nfU9r2X6iO1RcpL6bI3v8j0WjxDWJW48yHIXaFMhZkDTN7LKPpbv+9HDAkjkhRSYN/RUB6BFTagI7umgxhmYWEWyq9hHhlZM5VKT6nGnFVAJ0IZBJOJEdKaL5PPfm/8Dn1DFnx40xIi4bMYe1xCuiGlj6CP6BFsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408147; c=relaxed/simple;
	bh=3y9P8+PbJrRQG3SiUbUORiES8VRgcAyATIiA49Pf0mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxa586U3Rds2imNx989+vEHZYCw4GQ4i4IQNbYnzDJxpdmcD+IJNETQUk1fDORt8X0RHerJxWPuJ/dlEyjeg5B/U7QS+yun420CExyrB8G9yhaNtwsTkKiXGHu3smfj9NxsQ7KzlzYbIhwy3sWIURLg8UvpwKl3TkHPOkV7HkFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyW6+Ks8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4ECC2BD10;
	Mon,  3 Jun 2024 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717408147;
	bh=3y9P8+PbJrRQG3SiUbUORiES8VRgcAyATIiA49Pf0mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyW6+Ks8LlaEG1q7e8t4wnj+peec74jmOkj0hRKwMjItZd+yasWNZy3Zo5aWPBl2L
	 cGm5GDDdPQu3UiA+KlrR/afHOontNjaELhZ1gqJHvKDFWOrAjh+0lYjGN3tBpNQDGI
	 ydJKTlnEI2b5M8gmqITFi1v4086gdOyo4x78yoa241M92qh41fUMUkm6ZppmP1Bdmb
	 GffnhfABv8N5xeazKtSz74k42jVhV1AKha+89VraTh8wNE3TftBTwyZnu+9zk7ixng
	 eLG2rB1BKPQH4gZCTPhIJHcFcoa228n/KPYMfludvmJ6U8tvZnrLVKCOg2f6uS29b8
	 LcrLk5UG3rwUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE4JM-000000002M6-3JMY;
	Mon, 03 Jun 2024 11:49:04 +0200
Date: Mon, 3 Jun 2024 11:49:04 +0200
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
Message-ID: <Zl2RkMMk9B12t2CM@hovoldconsulting.com>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
 <Zl2DUXWUN0088-Af@hovoldconsulting.com>
 <CAA8EJpp2hK1P86vrZOwXfNBz3nBXugCcERE9yBRCaCE3aDbqOA@mail.gmail.com>
 <Zl2MRMqY0Y3siXFm@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl2MRMqY0Y3siXFm@hovoldconsulting.com>

On Mon, Jun 03, 2024 at 11:26:28AM +0200, Johan Hovold wrote:
> On Mon, Jun 03, 2024 at 11:49:51AM +0300, Dmitry Baryshkov wrote:
> > On Mon, 3 Jun 2024 at 11:48, Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, May 27, 2024 at 11:07:28AM +0300, Abel Vesa wrote:

> I don't have time to look into this right now, so only reporting to
> Abel.
> 
> Looks like there are two more warnings earlier on boot which appear to
> be related:
> 
> [   10.730571] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: invalid connector number, ignoring
> [   10.730656] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: invalid connector number, ignoring

Ok, it's just the pmic ucsi driver that is hardcoding max two ports
still. I'll send a fix.

Johan

