Return-Path: <linux-arm-msm+bounces-26911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FE93A1BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BDEA1C22552
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E5415351B;
	Tue, 23 Jul 2024 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="RFIsckXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BA208A0;
	Tue, 23 Jul 2024 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741985; cv=none; b=Clj12pZmO1AufavJ61TV5cKwmAbq9c0twRiOmgru1uFSFbP0U2HXz560djv8kU6zoWLrVUCi+DUSye8AFtvWPiwfxuaUKPkSmTMy/Y5NaPdQnBf5LvXbRwYD+E3nORLPdgrsxDues1DKHX5WWoSyQmu4jVsjI6VeWlHJaovGwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741985; c=relaxed/simple;
	bh=5zzHncYG6VpSLatxyAWkgkPUtb8n/V+WLUJxC20pjlc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByvUOGQFIZXSXxZAGr5tus3gj7XS2xRWp/bogIMeJHh3CZI6Y7QErTvywsNmpp81eXaP8fNW8Ck1csNxE2KCAGHvAqZ3by9QWt8/j54dDVOlqTLe2kcyv3AvbLTtfoGIcabQZ1Jfq1icqkjjcOGfq3D8VBEbQWgbmmqbBSONzuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=RFIsckXz; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721741981; x=1722001181;
	bh=5zzHncYG6VpSLatxyAWkgkPUtb8n/V+WLUJxC20pjlc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RFIsckXzbVkV/BRs9LgDCom8u9bS9aca8eLU0kSBv7hwLHX1ToBwh5S/yIUGZrRTi
	 ESrggdv2V5Uw5bwzbqF5ZYfKgqaVK+pwJsfmzFREiejneeX8DZ8L5Y3EnODIeKhoBY
	 TUkpBPOOw9e3BECqQjuc7vSzP5TBlu6PpoTIviqg6B023V8T7AWMbPHwHpeVNLObfL
	 oTwfvOHHknjOgcZm/c6KPN/XInXYzYdrdEJlwpqkveCEvUaVK7jn0IYzPPcVytwRuC
	 9IUo1LCLma+/7U/dFCnqrCVtc6fvwp/y5Dqrsi9DVsQPu6gCpLcPM+Tnr8TEmX0lZF
	 GsRmJFHgU6aYw==
Date: Tue, 23 Jul 2024 13:39:34 +0000
To: konrad.dybcio@linaro.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, nikita@trvn.ru, phone-devel@vger.kernel.org, raymondhackley@protonmail.com, robh+dt@kernel.org, stephan@gerhold.net, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Enable the touchkeys
Message-ID: <20240723133916.1947-1-raymondhackley@protonmail.com>
In-Reply-To: <c5f8cd32-d5c5-4c29-be8b-571804a4b088@linaro.org>
References: <20240723131142.1703-1-raymondhackley@protonmail.com> <c5f8cd32-d5c5-4c29-be8b-571804a4b088@linaro.org>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 413103c9ae8c3d17ac0f4eb4e8d496ac130c5d0c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Fixes?
>
> Konrad

Hi Konrad,

the issue is not reported or discussed on lkml, so there is no thread to fi=
x?

Regards,
Raymond


