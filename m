Return-Path: <linux-arm-msm+bounces-13068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B886DDC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 10:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9B71F21667
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 09:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2FA6A011;
	Fri,  1 Mar 2024 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geniusmake.com header.i=@geniusmake.com header.b="uCgpz2jj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.geniusmake.com (mail.geniusmake.com [217.61.16.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB069E18
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.61.16.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709283698; cv=none; b=FvU3ydrxJo/ve/2F5vqfvcfJfXAXZbdbGL7GLJD+IrEyENfNcu4j+BhD+9fhGRFaPwjHzJaTCJjUz7ALtlXZtGS8SF1DAjMj5bSKeXHmETxJJeszBS0e9T/+JIGPi4gbjVfm7E7X6QTNNgU+QnOdv6NnypF9gWeEDFPKrGZ64eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709283698; c=relaxed/simple;
	bh=PnZc+rIY6TfTKjOaDWzpfrHUKmRuaNjVokX+KxS+akY=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=NBP2ijUBhrIuLW6kxW0BulSRHsYb8XMN9At08A7Pc4cHEDykCsrkYHzGGCAxm580lW8+MdYhL2SPx2SVgCvTZUNqS6qxlniamfMx2AQHiMmkJ0zSJU4YeDVX3/9TwVpcvJejqJWki9WBk3ZFvnx8Fzasd+636vb9EsVZdhw5fhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=geniusmake.com; spf=pass smtp.mailfrom=geniusmake.com; dkim=pass (2048-bit key) header.d=geniusmake.com header.i=@geniusmake.com header.b=uCgpz2jj; arc=none smtp.client-ip=217.61.16.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=geniusmake.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geniusmake.com
Received: by mail.geniusmake.com (Postfix, from userid 1002)
	id EEFC382BF0; Fri,  1 Mar 2024 09:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusmake.com;
	s=mail; t=1709283334;
	bh=PnZc+rIY6TfTKjOaDWzpfrHUKmRuaNjVokX+KxS+akY=;
	h=Date:From:To:Subject:From;
	b=uCgpz2jjKsfoR9kDxP/1NuniKbd1/CsQIFqVya4A5aKSOnlEK2jTrnQYSI+u4WhO3
	 nQG/LqCkLenFtKYEVMd/vUulOeecI0hghfCydZec17Tm+hGN2heMATlENTBQjSZ9fc
	 RXB4Eso+qVpNWyPYC/3FFPLl5eUsstPiHsz7ebo9VZ61+OtQv3JEfD2cuspuMN0xhi
	 dNGnBojJfQvSm+Lp6HieeSV/CAbURtRV9wm/6wI834p7yaxV9a5KazToUFqhc63cSA
	 TzUQRhExgdVwZAD6klq3NH/Oo2XfkxOttwiRdcTllqjkEiNM8Meg6pb6yEs8VUzUyx
	 hxQl+f1WT9BVw==
Received: by mail.geniusmake.com for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 08:55:26 GMT
Message-ID: <20240301084500-0.1.18.1tyy.0.anxmtv5uq4@geniusmake.com>
Date: Fri,  1 Mar 2024 08:55:26 GMT
From: "Gordon Frogge" <gordon.frogge@geniusmake.com>
To: <linux-arm-msm@vger.kernel.org>
Subject: New assortment for solariums
X-Mailer: mail.geniusmake.com
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning,

We are experts in the production of tanning cosmetics in solariums.

Our products help you get a faster and longer-lasting tan, while caring f=
or and moisturizing your skin before and after tanning.

Cosmetics contain the highest quality ingredients from the USA and Poland=
, thanks to which we provide the market with premium products in tubes an=
d sachets.

We have prepared attractive terms of cooperation for you, a wide product =
offer at competitive prices and support materials for selected brands.

Would you like to talk about cooperation possibilities?


Best regards
Gordon Frogge

