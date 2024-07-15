Return-Path: <linux-arm-msm+bounces-26140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD2931122
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 11:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92EDE281704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 09:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784C7186E20;
	Mon, 15 Jul 2024 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="ZiJ5X59M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AE6AC0;
	Mon, 15 Jul 2024 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721035433; cv=none; b=h+Otb+l9wT2+jrn9+F8y6cvNUrT75gyFsemZFusTLQH9oMeMupnJglcQr0X1xXf8nZxuI/mxov4y8+glNVXEa958352bmIzP0XdoUVtNS/glWJFkS09t87wh1hEjl+DHLlZLC+D93eIU5gP3q7RsUdI0QMXS1zmSe3KOwqrHF0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721035433; c=relaxed/simple;
	bh=LNctksWt/BWgWvKVNP6PVGbSb9J4ENKZHbaJ//1oUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ix4CbdtXdOmItIANW7WaPIhGREtRAikmsEyodKyR7yuSSP25qwtwXNlNJPHHK9QY/FR2uaB7Itf30IbFix/aBX90TI2GkaI0nC0D+lBGr9ew+h7fGaf48T1GDWi2HvEbRvmB173/MaYOFXqjAygckiBg6NpoFsDvnbWHJ/dfuaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=ZiJ5X59M; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 8C79238A399E;
	Mon, 15 Jul 2024 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1721035429; bh=LNctksWt/BWgWvKVNP6PVGbSb9J4ENKZHbaJ//1oUz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiJ5X59MdkmyOSwF9IW85OzaGclp7y/azSCTABmjMx6pHoJfDP3G5BTeGvKfS+h0v
	 xvtqZ4CGswujnzWi/T1JusCUmHK8VoPv+S+0teWhVpMnZhlly/qoyWZSBtetx6SMAl
	 79y/NYBTBCPPOOi1mbsIQz0qB8pjEe46iRNzRoutmRMLnMdxjsOerEHJQ7PwOLNaTN
	 INbxqk2WXY0Uk460r1108Ngks2mYF0tTIkZARBGqdJHiGodHDbsrVaOSGU59yCWGEI
	 FOSiB9Abcdzuz6LtMh0jAZ8M0ZeTBfnsV3EtViKMddfLPJ2C05K3Bpyx7Ni3Etz7ro
	 fKIoPSXZ2UjksVG+BWWKenAew2pcAGVRM4FCbzaj/yFvo7t48c+9nvJw5jWlhyRVY2
	 ujOH2M2gT0zWNGdcszEOsfgDAfcJGadpOK9e0o/sMIOjr6Y1M6NwSp7XYXJeQxKAy7
	 CftUJYb2crFqXlX6ZehdvlAMsGoqEZk42DpKQRKPxqsN/MjoQ+nr4CbIv4fBAwl9aF
	 O/2LKVP4EA4KZlZrKm97+UXNF+IeHnBr+dxwSGzM16MbnKGkqlVUJAjkODOVYtGvsW
	 gnasm52CY2mClc39YarQMUCco7B/YgaazUS7BNAClCCkZtW+e4PtEkipmT4c99m0hD
	 AzUDQOHVgjF/tVhFaFjsK9fk=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dQQHflczysxv; Mon, 15 Jul 2024 09:23:39 +0000 (UTC)
Received: from xtex (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 15 Jul 2024 09:23:39 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 ~xtex/staging@lists.sr.ht
Subject: Re: [PATCH] ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node
Date: Mon, 15 Jul 2024 17:23:13 +0800
Message-ID: <3271103.5U3o9Z6ar0@xtex>
In-Reply-To: <552dac56-8915-4b26-8c90-769d09924861@kernel.org>
References:
 <20240715083245.80169-2-xtex@envs.net>
 <552dac56-8915-4b26-8c90-769d09924861@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, July 15, 2024 4:57:54=E2=80=AFPM GMT+8 Krzysztof Kozlowski wrote:
> Don't duplicate the nodes, but rather extend via phandle/label. Or at
> least drop duplicated properties.

I was referencing other qualcomm devices with ramoops enabled,
such as qcom-msm8974-sony-xperia-rhine.dtsi & qcom-apq8064-asus-nexus7-flo.=
dts.
They seem to have the same issue. Should I make another patch to change tho=
se?

Best regards,
=2D-=20
xtex / Bingwu Zhang @ Mon Jul 15 09:19:42 AM UTC 2024




