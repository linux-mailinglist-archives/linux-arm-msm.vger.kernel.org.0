Return-Path: <linux-arm-msm+bounces-105942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEXkOJXN+WlHEQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:59:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D54CC051
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D22A53124C7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23FE4266A3;
	Tue,  5 May 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzVXiRx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F571425CC4;
	Tue,  5 May 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978220; cv=none; b=KW6TjNLfIbMKax4HuUb1+ctxLfOD/u52aYSqZEhxG8/0anPNeGXKku0MVNCIh/186Zi1zMZcWCuHOS5pm6zEPIzMUnuHIo7G2scwY/kvVrIv4KYxpxNHJZy5wgNXRcfE6zzbY8oylOaZe0gfykJF8QrGsd7+jR8ZGesCmB+9nXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978220; c=relaxed/simple;
	bh=wlXpugk6r9mJmRNQ2cr1RlgB1qYY1ILeREvHnWMgMg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOO+cH2OqibgsUdouOJ8ATnH2bEVY6pPJNkiajcxQ3Mks3gvO8jbsCJRYRuMkbpoksMCsWIvyxxQLCI/yXrmQaplWJd+kKkBDAcRRKbiV7vUennEYxF1A/3ROL3rI+ggQ2WyGYpqyTowhfcSHw6QwAlYbn2zoTQHhto4X5FEZec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzVXiRx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A774C2BCB9;
	Tue,  5 May 2026 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978220;
	bh=wlXpugk6r9mJmRNQ2cr1RlgB1qYY1ILeREvHnWMgMg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzVXiRx5bazBpUd05r+8RLJ7f6es/GACNwaTFGBccrNR7pe9NBLwBmifxBIo+4ONG
	 z9PN9NmDv/klndYV8FaY27auclJGEF4JUZbRJYdzIcmOnSqlfIvB0+eavfAFBIanxI
	 9r4IOASpgpqzOKB+HRZ11JwrlrLjSmcWCFeWhIHnlOhqCNmiBcd9l+P1OOOEYWUE01
	 mkQXfYwzrQv+J5KePDmTsB2xpNLAOqmwIIxeiDquxt8Is1JoaJtsoFQC5pk7biBO30
	 gyRzG3NUnwt1+YRz+0D/tNdplWrkaJjKYUUsj2KX7rmQR8yPvyNUWPxg0wBu/moAKI
	 RSS5GXB/WlCNw==
Date: Tue, 5 May 2026 12:50:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Message-ID: <20260505-glittering-shrew-of-promise-09db29@quoll>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
 <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
 <230aef5f-43da-4b7a-994c-7a63b631ae8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <230aef5f-43da-4b7a-994c-7a63b631ae8e@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5E4D54CC051
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105942-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Tue, May 05, 2026 at 09:36:31AM +0530, Krishna Kurapati wrote:
> 
> 
> On 5/5/2026 12:58 AM, Dmitry Baryshkov wrote:
> > On Mon, May 04, 2026 at 10:36:59PM +0530, Krishna Kurapati wrote:
> > > Add init sequence and phy configuration for the Super Speed port
> > > on Shikra SoC.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > > index c342479a3798..400dcebf8222 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > > @@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
> > >   	}, {
> > >   		.compatible = "qcom,sdm660-qmp-usb3-phy",
> > >   		.data = &sdm660_usb3phy_cfg,
> > > +	}, {
> > > +		.compatible = "qcom,shikra-qmp-usb3-phy",
> > > +		.data = &qcs615_usb3phy_cfg,
> > 
> > If we are reusing Talos configuration, should Talos also be used for the
> > fallback compat instead of modifying the driver?
> > 
> 
> The clocks are different and hence I didn't use fallback.

And why can't you use the same clocks?

Best regards,
Krzysztof


