Return-Path: <linux-arm-msm+bounces-43495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D140B9FD42F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 13:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7661118842D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 12:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06B2156257;
	Fri, 27 Dec 2024 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I157RiCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA432C2F2;
	Fri, 27 Dec 2024 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735302966; cv=none; b=FX26s4fBOKW1ntlTmhkC653lj8KGJ06RgkhWSBeU2WkoVNgpFLBJKValjB9FDwKmtzWeEtqpgwlOz5XncS7p/LxgkuwIQ3ld3QDpNwXh7HDfCR9j1XhdBpcpxM+fctfBPWBfBasaNNYIPkMzyaLNkoiukX05HzZWGGmzLjy0Z8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735302966; c=relaxed/simple;
	bh=6RR7V3txwXh9aXzaQ9Hc/4kiVxrwz6uqYZDbewct27Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoRQeaxedcYgrxZu5v3AUWPvyNy2Nsm0LFL2C9wuVOSqfzkx4+N+aCVAk5CqfG539tY48YWC9ZdbpfglqgPvCFPiKvSktTKo9WK1dPmKDwFN17qCm9OT32C/28NDJ8JHgkidsT7QBSM7FoPIcljRhUkrNSsz22ZE0vQfuR4ugms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I157RiCl; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YKPv5230Nz9sts;
	Fri, 27 Dec 2024 13:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1735302561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XUPIVzIQH1ZTcMyn6ll+dH7qG/x93Dl0ZSXBjueMKTc=;
	b=I157RiClLPuDbnfL8TeWbleGv+YAQq2S36CBU0K2XdB38WcGPZeNWAu0azlC4b82F2mSEN
	tlfTfFrlwpdNs50DofVew2lXYCsQaJuzq1P+yzqrlVZgBS9dFV5tGuhK3z5u//zvLWhnag
	GqF8PBkQncGyBDMYsWuFIQu+i1sTFwq47inUCl0441T08aqpu3TVdy6077kO11kjy6AOqt
	B/1qrgiF+PxNuygDt75lGHiU6GqaJHLW61TiQVu6jtWQoNgdKIiBqK7sXhzc6U2wrWQ4uD
	c0jCSsXsWwn+nRiVs0ESUopVXYqMOiUCou81wKOnZ1zjwRSxYpGuzxOvnnBZMw==
Date: Fri, 27 Dec 2024 13:29:17 +0100
From: aruhier@mailbox.org
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 lid switch
Message-ID: <vgbobvds33l6xzlatmvdbcyexf73e3digkwp7fukqdm5gotwbf@dn3a6lh3fr5x>
References: <20241219-patch-lenovo-yoga-v3-1-9c4a79068141@mailbox.org>
 <173523761378.1412574.8287690464874311392.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173523761378.1412574.8287690464874311392.b4-ty@kernel.org>
X-MBO-RS-META: z4cbjqsujyuhf7h6e597w4d1ygdhht5x
X-MBO-RS-ID: e1ce8baf03a5c73e6b3

On Thu, Dec 26, 2024 at 12:26:34PM -0600, Bjorn Andersson wrote:
>
> On Thu, 19 Dec 2024 17:05:08 +0100, Anthony Ruhier wrote:
> > Add the lid switch for the Lenovo Yoga Slim 7x.
> >
> > Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
> > Slim 7x this pin seems to be bridged with the pin 71. By default, the
> > pin 71 is set as output-high, which blocks any event on pin 92.
> >
> > This patch sets the pin 71 as output-disable and sets the LID switch on
> > pin 92. This is aligned with how they're configured on Windows:
> >     GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA
> >     GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch
>       commit: 7069abcd5340f4c8dc4a96b814609b25d7e332ee
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Thanks for the review and merge!

--
Anthony Ruhier

