Return-Path: <linux-arm-msm+bounces-113685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iOZrMb5LM2rW/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 03:37:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 356AA69D079
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 03:37:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nS+uh22b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113685-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113685-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0222F301589F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 01:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EAC2D8796;
	Thu, 18 Jun 2026 01:36:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2419539F;
	Thu, 18 Jun 2026 01:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746619; cv=none; b=EjNbDGkQUGnuoroMQP596EeVRdvagTRpFdJvC5vGHgBsfvx6woYDA006Zfvb5MmsJY8lPRDQSSmxdPgkDLLPobTwml4jIU6ph83P+Wz+TEerpzduvjARLF1pM1uw1ue44HobrWchTNmD2GTm99avblFOFqmy4kFc4aUIhhf6hq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746619; c=relaxed/simple;
	bh=OtrEK/S3KL9f3bN4yUf0JDAXx1hAr2YNLqXUgkLRvsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvPN00a/Wg7irdnEzjS5u5SwBNcBdh8Mx9W07wwHKAKUeqlIsildOK3jaoSYjGfgC8iTjuFGZ4lIUX/u9ysqbR2icK9GXB8/9U6kyGv5IAZ0V78gj44qv3SZpGRb6XIvfkzGYgq8L7q3JgC8QWhmsxE1IB2RxCSiBoB1KCIFiuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS+uh22b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4371F000E9;
	Thu, 18 Jun 2026 01:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781746617;
	bh=iEMUbmDbPRVGmmZUsmY+bAPeDIkl2GD/lKD9XAcKClA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nS+uh22bdLmsRXRLHnW/NLPMzbM2bDxsKUV/cWISpjfnvEF/aum7QUt5H8PBqkDoL
	 4GDBQ5Fw91uoX6DjNABGzDCoWRNAEMP24hMdYaC+9Zcr2fBP/3HrDiNKkBqjFGwLtg
	 H58xP2fTz72vvr5HNTb2FhxXlxGauVkkOp/GRozBmzSwwTnlYe/sVmmiwcBu0PBvog
	 0aZOiIGvovOuHCu7MwJiGgWXoeMpNSzI4MrmIB+7mSPJNavtH1/xAeN0bgyfx7uFdR
	 xJQ12fN8KhCpi08hJVIwPh1CuFXwV9rBhMKKaDlD7SHD46J33FOkDrj7wsqCBki6jm
	 0bDczPuqBc5Yw==
Date: Thu, 18 Jun 2026 03:36:52 +0200
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
Message-ID: <ajNLmO9UBH_Xs3W2@zenone.zhora.eu>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-113685-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zenone.zhora.eu:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 356AA69D079

Hi Praveen,

> Praveen Talari (6):
>       dt-bindings: i2c: Describe SA8255p
>       i2c: qcom-geni: Isolate serial engine setup
>       i2c: qcom-geni: Move resource initialization to separate function
>       i2c: qcom-geni: Use resources helper APIs in runtime PM functions
>       i2c: qcom-geni: Store of_device_id data in driver private struct
>       i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

merged to i2c/i2c-for-7.2.

Thanks,
Andi

