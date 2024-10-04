Return-Path: <linux-arm-msm+bounces-33139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 293659906D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19BA1F21602
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCDB217900;
	Fri,  4 Oct 2024 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="y/ZfHfUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41C2141A2;
	Fri,  4 Oct 2024 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053427; cv=none; b=XW2oz3C05HgIVniV2gz+lAUFThpxYebSjUneguaeZKrABvX0K304NEOXgss5lv2ZFaHl3kRXGz0bUGiHXd/jS06E+qTGwLwqGzmCpVvnld6O7UblmWW/HgY48kGLMNpGKAdJOC4/D76Jd7TSkNdlou3CsYqSEurbsmDrWyYe9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053427; c=relaxed/simple;
	bh=jrI4QlmUIOZtU2+vT3cnGSIxeka4ceUwjqasJSUfzAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrkgxOETux7vCp2/x164uU1veW/3aBqxmvzwyM0a1dmQoTJBOvNRV+ZXwKXGfidOD1WbYcnzNb3snuXnDmcxeLxswvwy6W6r/sIHg0hTii26sQUAVHuyi0KCsVbSjZUxU4c0mH9egDd3SELOpN3f2stdYXRCk7InySWocVum0HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=y/ZfHfUh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8esOpvwhEAMg9FOrIHhtovLDXASj97AUVvZ8pGi+W44=; b=y/ZfHfUheaDUZgFmYnraZxdIUy
	FZHLsDhrZcdPaM/JoSKzUjVwd9HMvIgJk53ZuxAux3LxwSCzbY/nkBeJGNwQFXW+UKT05RkhC04yJ
	NLo7svj22cERP2UkRlgAJ65XaxDrlatTSoJ/+TLqC3HvkMsyp4xSKLHOAQS73GkYypck=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1swjdB-0093gB-CL; Fri, 04 Oct 2024 16:50:09 +0200
Date: Fri, 4 Oct 2024 16:50:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, netdev@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vsmuthu@qti.qualcomm.com,
	arastogi@qti.qualcomm.com, linchen@qti.qualcomm.com,
	john@phrozen.org, Luo Jie <quic_luoj@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	"Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Message-ID: <ac4b5546-366b-437a-a05b-52a53c3bd8a8@lunn.ch>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
 <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>

> The only compile-time dependency from PCS driver to NSS CC driver is
> with the example section in PCS driver's dtbindings file. The PCS DTS
> node example definitions include a header file exported by the NSS CC
> driver, to access certain macros for referring to the MII Rx/Tx clocks.

> So, although there is no dependency in the driver code, a successful
> dtbindings check will require the NSS CC driver to be available.

You are doing something wrong. A clock is just a phandle. The
dtbindings check does not care where the phandle points to, just that
it looks like a phandle. You can hard code the instance to 42 and all
is good.

And this is all just basic getting SoC stuff merged, nothing
special. So why do you not know this? Have you not been subscribed to
arm-soc for the last six months and watched other drivers get merged?
I also really hope you have been on the netdev list for the last few
months and have watched other pcs and ethernet drivers get merged.

	Andrew

