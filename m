Return-Path: <linux-arm-msm+bounces-109152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIldHrOND2pfNQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 00:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C45AC7D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 00:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 576443008C8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 22:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A46366822;
	Thu, 21 May 2026 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwHlTSwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7735975;
	Thu, 21 May 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779404195; cv=none; b=Zkb9X04DrkiuO9KPJCr53RnmH3XtS0MU2U+C21Cy9zYlwrybEMKQk9n3weh1PkE4UR0QLyUDMHdKizyBx9lK9sGh724ZAwz7iI3gGSJeMU+/I2XQP+rYwkLWeKBp9nBytXV8Od1Xrg7MdNTbJPxOrgfkzfaMCMvG60+yQ8UwYhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779404195; c=relaxed/simple;
	bh=bMZAJMrhnl5mtLM3XXeIQK/Kapd/yQRGPTj7JFVbg2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGTsVCUjeo0j7f8ohGeB2a0GZ/ckihha3652RQUqdh+2e0qcuGeOr2BpiATh4h+xIvF6zRobwBzy9FQ8RuAUUMnd3bWbQ+FZlMhc2gxAN0dBWltbtf7TarBCDZcFg6Fds+4t6BkiWqmg7pMlxRB5/nnq5gBk8czFusq9QCz87EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwHlTSwN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2081F000E9;
	Thu, 21 May 2026 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779404194;
	bh=7cg3PP8ir4Dvr0mIjKf6vyi330dA3SFiHExUj/R/Euc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TwHlTSwNc9VSV72PesrrH/8a3Q9VZZAvH0Oj8RNk3JnqzscjLlEfmiimuADYaTxSO
	 lTlPhKGW8Fi0qhvQBgXq7n/jxVza8NsgWdR0X8fgG0hUdXl/gpK9ii1P1DpVbQtAY2
	 M98jd/tvlmxRA4xaHvTcbALwNI2DkK8YNCIZhlhsuHgQ5ElKFS/Cg+zLDoqBDDvM2y
	 Os4dwt+SYb1CJZxS5nMqt7PnC9gT6qp2DxVFBtAl4ZRQiItgMTNit/est6lO4jNF5N
	 LqTHrsdLmvDJ3s4SF9C1M6jIVWFewzx/nRLcwNmHK7peV2O2IWvCfdaHmd5el04RLt
	 0/S9idqtE66og==
Date: Thu, 21 May 2026 17:56:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com, 
	kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
Message-ID: <ag-NLvh4ROgTCs_L@baldur>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109152-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7B0C45AC7D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:29:38PM +0530, Rakesh Kota wrote:
> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
> > On 5/18/26 3:49 PM, Rakesh Kota wrote:
> > > On batteryless boards powered by 12V DC adapters, registering the
> > > power supply as BATTERY causes userspace to incorrectly trigger
> > > battery power-saving sequences.
> > 
> > Does battman really offer no way of differentiating whether a battery
> > is *actually* present in such cases?
> >
> > What boards are affected?
> >
> Currently, batteryless support is only implemented for the
> qcs6490-rb3gen2(Kodiak) board.
> 

What do you mean?

Are you saying that the pmic_glink firmware in Kodiak has a one-off hack
that no other implementation of this firmware has?

My Lenovo IdeaCentre (hamoa) doesn't have battery, what should I do now?

Regards,
Bjorn

> regards
> Rakesh
> > Konrad

