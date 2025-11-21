Return-Path: <linux-arm-msm+bounces-82881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF9C7A734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B9613A2647
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBA730AAB7;
	Fri, 21 Nov 2025 15:12:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F7310774
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737968; cv=none; b=LB8cjk0dBUEBnOyTdltjQOYL3lZyDFEs65LMAU39XpSt0pN0POZmtg6k8X0SphNJJWdnhG5AnbgNcYx633QbkiZmfMOSOD2aw2tIZQi+ZO8Mnt6vrTWFaFHEoU1Po0eA+RHIJ3E8ced9wds28g8DcWBdW5xX4LHTuPhgsvPzu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737968; c=relaxed/simple;
	bh=c/0oCu+rGc6tvcUoTld/5pCPiAxjb/r+ucsFd0idU6s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZvjJ/spRriCCRObqVbYg7yocTMTeqNZmdufhfwCu87d8W3FCdrY8lUnz2XJo+zgvXEewShlnHf8r3Yebmi0ZUip+Ht/OHPKW2RDblXsLRsUWHtwcd7KIrfUm3b2vHZGgPqxQ/y88VnbA53fLWLMRb1qb7D8esESyQS/gwbrwS0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSoW-0000uu-FV; Fri, 21 Nov 2025 16:12:44 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSoW-001blf-0f;
	Fri, 21 Nov 2025 16:12:44 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMSoW-000000008r5-0VHx;
	Fri, 21 Nov 2025 16:12:44 +0100
Message-ID: <ae40536e39c8b0c5dd238806874e6a714eccdfcb.camel@pengutronix.de>
Subject: Re: [PATCH] reset: gpio: add the "compatible" property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Fri, 21 Nov 2025 16:12:43 +0100
In-Reply-To: <20251121135739.66528-1-brgl@bgdev.pl>
References: <20251121135739.66528-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

On Fr, 2025-11-21 at 14:57 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> In order to correctly handle the interaction between the reset-gpio
> devices and shared GPIOs managed by GPIOLIB, we need to be able to
> identify the former. Add the "compatible" property to allow us to use
> the device_is_compatible() helper.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

