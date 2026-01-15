Return-Path: <linux-arm-msm+bounces-89285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7AD28B66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD0D3041553
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C42F326949;
	Thu, 15 Jan 2026 21:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJyAHnVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25099322B72;
	Thu, 15 Jan 2026 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512377; cv=none; b=genQyl0/jLPG8A6xzb2A6qVkOrtEWJElvhSWcwxVP+LJd8xeQ2GU8Wa+x6mdNedIyqtPQfOD0Lg1JUOygbRHJ//72wELc4Cnd3qcZ6l2PQRCj3IKxcWVINs8gBChsm/ge+RWydkv9KA+SleCCIvCfyi0P6G+5zAShpoyM2N6nfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512377; c=relaxed/simple;
	bh=LjEeRLtspIw+x2RORFQirX0OW4sGtXmdp1zlvKu6y5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3yd43XlHrNY3wgWWC9DFXXNU+/pEla9+WxMK/U6IbZzlxf6rSiD4p1xq6d7ZNrLgOJ4vr8MtDAmpBnqJrBwXO5coAnHtjvkvhCFnRg3C+wfQkoRrmOIHeyy+alSJ8D+wFGIjLVRC6xdbVzHYMRRQgz6nRygHLmsWl2uOYtYyv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJyAHnVl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F60C116D0;
	Thu, 15 Jan 2026 21:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768512376;
	bh=LjEeRLtspIw+x2RORFQirX0OW4sGtXmdp1zlvKu6y5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJyAHnVlCBE8ClWTSVictKAgaLSOrXvktzgX1ATwsMBlY0KWsSz3UXMifJMgT7U+b
	 KjnfZwRJ1MKAMuXi82absoYo9LPGfZ4vN8Fhto2i6t6T8bODqIxcA9GzSTA5nKkZmd
	 w0kIAVz9HvcDkxB3UNygJXIX5L0UmN3mJzjNe8rO+a0MZPoxtpBh2xPKVhvBv0qoxw
	 xjCc1rFXfbJCpQzFuIodT+iXMHcSTwYPlvwCOlQzOlB3IAbp7XJHvXBR1AsS52sduR
	 i1PvK7jRQupB+DVeAdYKp1jTiUxgFnXdmC0eSQGqTb58wwzkp7oPPehjvA1IEEKMt8
	 lQ+VghcXmHrBA==
Date: Thu, 15 Jan 2026 15:26:14 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, abel.vesa@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: typec: ucsi: ucsi_glink: Add support for
 X1E80100 compatible string
Message-ID: <cjw5s6a65ldtr7xczlhr6uxiqwoy5dchtc2kzj3xtruxalg6ri@nxuzan2lkpo3>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
 <20260115-annoying-ludicrous-hummingbird-c7cefe@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-annoying-ludicrous-hummingbird-c7cefe@quoll>

On Thu, Jan 15, 2026 at 10:14:55AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 01:17:58PM -0800, Anjelique Melendez wrote:
> > Add support for the X1E80100 compatible string which needs UCSI_DELAY_DEVICE_PDOS quirk.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> 
> > 
> > Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > index 11b3e24e34e2..e700c6a58a46 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > @@ -379,6 +379,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
> >  	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
> >  	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
> >  	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
> > +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },
> 
> So is it compatible with sm8550 or not? Based on this commit it would
> be, so you need to clarify here why you decided not to make them
> compatible.
> 

pmic_glink is pretty much a MFD, for this child they are compatible, but
the MFD as a whole isn't.

With the current model of naming compatible data objects by the platform
that happens to be first, this is what we get.

I find that it would be better to name the quirk objects based on what
their actual impact, something I talked with Anjelique about introducing
recently.

Regards,
Bjorn

> Best regards,
> Krzysztof
> 

