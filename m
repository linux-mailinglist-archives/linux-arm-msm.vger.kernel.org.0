Return-Path: <linux-arm-msm+bounces-83225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B85C84885
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3303C34DC3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A6830FF30;
	Tue, 25 Nov 2025 10:43:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA8830FF27
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067386; cv=none; b=evyNb83hRyYA9T8bX8ALFN0vLNblD6rubQpy/2y+D7MTZP6Qwn81Tq24pDA9e5XmGR7TifT0KHcpNrFICAAvrLa7jqweqjpwUnRRmXBcjwJnYIckgnjs2QJOCg+ZGzzyLFvWj8InG+xz/ecR35qFLszq2zNZCSYDapsHX1+j3wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067386; c=relaxed/simple;
	bh=xOq7wNd/ty3S1Us+m1tHL84986HkEhkui9fsiPWXKH8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MGdyWCNCgFG8dAK8Grp27tpeN6xF1c25GvgH+T+A0lCRPvi12R+guWKSRA4wF5WL6SO+fJ+rkkSzsrGypGarli0cMoxmnsvIPl2WNKj4DSVTWtK6dHCd4i8eEvqPY2KPm6X1plNwkitc9DnP3dU0JRh0Q6DGO1/8jZwAdaHG6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqVi-0001x0-8D; Tue, 25 Nov 2025 11:43:02 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqVh-002NTP-35;
	Tue, 25 Nov 2025 11:43:01 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqVh-000000003pX-3hdE;
	Tue, 25 Nov 2025 11:43:01 +0100
Message-ID: <cc1c6f0020b60e3a8e90ec1d55973e15c88ee884.camel@pengutronix.de>
Subject: Re: [PATCH] reset: gpio: add the "compatible" property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Tue, 25 Nov 2025 11:43:01 +0100
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
> ---
> Philipp: this can go directly into your branch, I will fix the GPIO part
> in the next cycle. For now it just parses the device name.

Applied to reset/next, thanks!

[1/1] reset: gpio: add the "compatible" property
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Da0d57f7504b6

regards
Philipp

