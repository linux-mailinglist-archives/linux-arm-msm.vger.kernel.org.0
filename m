Return-Path: <linux-arm-msm+bounces-108445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPuQLDhBDGq4bwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:53:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5A57CEB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C10E304C694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADD035203E;
	Tue, 19 May 2026 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCt2jVKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A6352005;
	Tue, 19 May 2026 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186916; cv=none; b=nYw81rVE1Vhh5SfHI3GMnKQC6lD2+N/DFKYvU3XYHnxxxORUbPZAZ6U2VRYXfV0sshtSJZxxdoW/vf7c9TRS1HVv+K8xYtsDmGTrkt4uO2QJQp5AE1onfyYze6HNR9nKre7OLsXwoDM01nuomNRtH6JeNwyEmCET2EL+mw7ksFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186916; c=relaxed/simple;
	bh=g5E7bT/PM4Dhfzh+9I5AFakJmUkK7R9MsAxESX5l0p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksLSft94lHdIXVegC8TaQ/wtsTazfT0Vo0MqYB4ynGOr/mGzj+r1396r7+fLJZH9cBMmyD3UmSBO4+wYoE8RdiWtBsNpUJVGcKksuOYZ++gcU/QDOCvydw4BPOuGAMS2BqigFYqsFwo9U5cEFWrEJAd4TbWF4sf+oxoO/fDeIqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCt2jVKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9644AC2BCB3;
	Tue, 19 May 2026 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779186916;
	bh=g5E7bT/PM4Dhfzh+9I5AFakJmUkK7R9MsAxESX5l0p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCt2jVKDZ0fPj0IPRTU3IqEbCWO0BFwXBp0Mz54Xj9jS/4nqD0cBHnXpIMOCOnVmB
	 NoOmOO9ofeToMba6qUK/4azWCFa3zyYGhsvjHmw9VbUVH4POhODq6jmgeX4SwoWTeu
	 kLeR7sI5Y67BxbWLE2uzH8O3PkX9cCEM2f1LLkee1Vo37zCxODUOkuGRnnDeoqm2LC
	 r0u/jHDHurK5RJf2RpxVoDmbMHg3Rd+imXYBsjkpdip7r3glGOdKlAki0AZYt17XaS
	 AyaNcxJQ0HHq648ubUqOiyHz+Vipwf6qmUqoQ67WVV+htUZFgKTp82WCAUtLPja1aW
	 w/PJDLiG0KEaA==
Date: Tue, 19 May 2026 12:35:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com, 
	kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <20260519-first-wine-bulldog-a6a4c7@quoll>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108445-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B9C5A57CEB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:55:26PM +0530, Rakesh Kota wrote:
>=20
> > And isn't lack of monitored battery property enough to indicate that?
>=20
> Regarding monitored-battery =E2=80=94 its absence alone isn't sufficient.=
 The
> BATT_ID line on debug boards is pulled to ~10k=CE=A9, which is used during
> development phase where some battery properties are still present. The
> same ~10k=CE=A9 value is also used on some genuinely battery-less product=
ion
> platforms where no battery properties exist, making auto-detection
> unreliable. Hence the need for an explicit DT property to identify
> hardware platforms where no battery populated.=20

I don't understand this logic. So you claim you have debug boards which
do not have battery, but define monitored-battery? Then these are wrong
and fix them first.

Best regards,
Krzysztof


