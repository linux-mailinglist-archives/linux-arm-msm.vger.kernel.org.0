Return-Path: <linux-arm-msm+bounces-35464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3B9AB415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D64B23685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1A21A3AA8;
	Tue, 22 Oct 2024 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6zSFuUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1578C8B;
	Tue, 22 Oct 2024 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614786; cv=none; b=mniXpYPM0IX1R1NGUvvcuayMjHqqLqhBwwjJHQoP+oqQzfwYhgbq79N3kAK5GERQ9hLIph90bIVwUjMHuI7r61719HKDbGgLD4VbwuuIuEDrmGuTeADPCkk5/0FAARjtiSmXHSF7v4CJNJ4sp+svKPvJ5Z4AlLDn7la7DCl/Vc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614786; c=relaxed/simple;
	bh=X6TV2v5iwKpDVoweZscfUpkWmmhWrS5LE/vNHM2rfDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0e3bZ0AazlCMOmaTRxG1fTadnbmuzIjJoSrTdKsxxz4abF4+UNlSrdxvsE8zxnPEe2BcELfCR8yRWY2865QWGETIU0NGmd/8w1zHDpkjxMJ4sqPm8Xvlw07lZCmXYM7cAKP1cyfeMOQnLHrNgjarpPcQ4KJyUoGWIW8PlyCikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6zSFuUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F83C4CEC3;
	Tue, 22 Oct 2024 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614786;
	bh=X6TV2v5iwKpDVoweZscfUpkWmmhWrS5LE/vNHM2rfDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6zSFuUNNsR7AkaKYUVHvNmzBpaAkUE+ecCYLdiLCL0te+fHZEtPJaJZKPBvhrw6O
	 kGUFs2B48vEBMZ+BVcUtH6yhn6JQb8ezUEJR6UgAqnoYg85r36e72Ncn7XNUZnrQ8W
	 6pN0wckrQPPOkV01z9I1w0kXWc3thP2CaRS9ZtlTVHFL/p9j/njfZdZZE0iQsTl8IG
	 dPefu0a+MZjzvPnHXgCuvWcZ8W1PdWsGA8LZ4IPSdBoqeNlTX2tz4rqReUo0UH5xm0
	 T8Am8fjMiVhOYerxOBA01g0b3TTCZfmlNuqweczdycXU9YtYGz4P4qyAVLLfD0yyzl
	 Vx/kgLyeio1cg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3Hos-000000005iC-0Qbl;
	Tue, 22 Oct 2024 18:33:18 +0200
Date: Tue, 22 Oct 2024 18:33:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Set orientation as none when
 connector is unplugged
Message-ID: <ZxfTzrEpCG7NITq4@hovoldconsulting.com>
References: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>

On Thu, Oct 17, 2024 at 07:01:01PM +0300, Abel Vesa wrote:
> Currently, the ucsi glink client is only reporting orientation normal or
> reversed, based on the level of the gpio. On unplug, it defaults to
> orientation normal instead of none. This confuses some of the orientation
> switches drivers as they might rely on orientation none in order to
> configure the HW in some sort of safe mode.

Can you be more specific here (e.g. so that reviewers and backporter can
determine whether this is a fix that should be backported to stable)?

Which driver is confused? How does this manifest itself?

Is this an issue today? Or something you need for future work, etc?

> So propagate the orientation
> none instead when the connector status flags says cable is disconnected.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 3e4d88ab338e50d4265df15fc960907c36675282..b3bc02e4b0427a894c5b5df470af47433145243e 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -185,6 +185,11 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
>  	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
>  	int orientation;
>  
> +	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
> +		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
> +		return;
> +	}
> +
>  	if (con->num >= PMIC_GLINK_MAX_PORTS ||
>  	    !ucsi->port_orientation[con->num - 1])
>  		return;

Johan

