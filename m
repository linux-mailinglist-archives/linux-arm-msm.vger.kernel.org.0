Return-Path: <linux-arm-msm+bounces-113756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nsZJKUrWM2pTHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65B69FC05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SzM5JOzj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D17300951C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BCF399359;
	Thu, 18 Jun 2026 11:25:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F943D904C;
	Thu, 18 Jun 2026 11:25:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781929; cv=none; b=TtX8IpJotx7XoYfDO/WFOtDNFC61dTMyAeRZCD2krZxxYw153tfz1KUc+YZ9BHlKu8lgZ4ihjbfS8oL5BLeD0daCHp2EdFI1Tf3vBsk2PibTVGjZC5O8Ji9z+hjHESAfWRbfYS57amcMosuF0NGLsl2iPk8Ag0eg73VzmIZV0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781929; c=relaxed/simple;
	bh=RQS8wB6VSTJQy+60gnzha79t8hRK65kV5eb6mC4rOPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVe1bqC+3x513JYVwIfts8SZzNL9YZz6dNYiQcZmmfJzDx8XBgroQP7K86XYPcqNXtZDt7cV3Ibv5rj6ySJrieKK2aDAODS599ko9n6Ds5HICUpe/YWyaoPX/Wlq+B41LsbZPY1xGCAS47IJIWPGrmWCltpHTTxxu/A96rAwwGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzM5JOzj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06BC1F000E9;
	Thu, 18 Jun 2026 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781781926;
	bh=uqc6HL3wgT0Al3nfUEKW2X0HTEsb7gSE8Bs2eGkNWrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SzM5JOzjvg9qE65fz2yBJiW20gpeSbkAyx/H9CbQMyjgEksgVKM+f8kIqzpgiljKP
	 M4IZ4H3fDp+luP8rwD+0bflHt6L3wA13IT9lzq1jv+dEU1/rgm509yZ/YX4N04Sq5/
	 esk2oYtxbtpfOPZ01r4pCkx8tFSnck+JRi0Y4tjahwNOEuFT+Ksy1svhlgS+ntx9WV
	 QiGxPVJE4ge1MTXuUJ7fO1srjbA9EVXVYIOnemyZQ8OoKq8X5Svn4wsWpqPDD7cG4q
	 YQCDDsLO8T5kAGa2dsLPMHeC0D1ohSZ5e4m9l8QDeP/9PSVFg0ETBI1pKHDD1Z3gG5
	 PDYr/wMIukHBg==
Date: Thu, 18 Jun 2026 13:25:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v7 0/6] Enable I2C on SA8255p Qualcomm platforms
Message-ID: <ajPVVacuswonBfZk@zenone.zhora.eu>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <ajNLmO9UBH_Xs3W2@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajNLmO9UBH_Xs3W2@zenone.zhora.eu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-113756-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zenone.zhora.eu:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED65B69FC05

Hi Praveen,

> > Praveen Talari (6):
> >       dt-bindings: i2c: Describe SA8255p
> >       i2c: qcom-geni: Isolate serial engine setup
> >       i2c: qcom-geni: Move resource initialization to separate function
> >       i2c: qcom-geni: Use resources helper APIs in runtime PM functions
> >       i2c: qcom-geni: Store of_device_id data in driver private struct
> >       i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
> 
> merged to i2c/i2c-for-7.2.

sorry, 7.3. It's too late to send it for this cycle.

Andi

