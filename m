Return-Path: <linux-arm-msm+bounces-24795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B591DC6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 12:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75EBC1C218AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 10:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A7912DDBF;
	Mon,  1 Jul 2024 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="FxXU/Hdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7612B169;
	Mon,  1 Jul 2024 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829576; cv=none; b=dHhIHAY0jgKXIDmIVYmCfa2i+Z9e2hMfH1ZnSkua9RAdau42dWf4dDKzBbkNI6vrFJj6gFbCZn3rlWs2ZR+bgv56A5zcHCZwLgd2BqNpbzJOfDFKqGNZnjOF9v5aHdG8GGR2riHGI1bSmF/zByTtpSmTBJywoH0FZ/nCXoPXUZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829576; c=relaxed/simple;
	bh=Tiw8V0NMgvLOdm+1R26UQJ73ovGirgarP0wvHD5oxzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZCI0kcpM6gp21UF1glXG4Z6LeAd0z8DBRkCVmP7UXsCLtzM7GF8gMiDSUlPjzXfFH6pVAxkskhbXfuTVrkn3GCrxV7AYlqRpxzgT+CeRPqHyldWYLn2Aq6tqgXuNteV99A+76RdjYRXHaFxpNAliu9ZeKQgaR3pHNYQTZWc25g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=FxXU/Hdg; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WCMdf2RCyz9wyJ;
	Mon,  1 Jul 2024 10:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1719829574; bh=Tiw8V0NMgvLOdm+1R26UQJ73ovGirgarP0wvHD5oxzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FxXU/HdgPC6Bz/fcnrHg/ylzLzcdZ0/g/J3u4mDeYKyEdzbDYmSP/9ZRn/1QgSnUn
	 Vn6WVV9AnzKT3klOvIt6gg6L0gUCJ4pIpuzR4Bq5O+t0AjqrJ9qQOH6Pjf3OZZYvhW
	 B8eqSOr7GYtQHkDCg0clDJrtBrjU/xViR2SK5aec=
X-Riseup-User-ID: 180EF041C1650FE9D78EEA444199EC3C6D79B690CBC671A9011A9077D266EC16
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WCMdb4l4zzJrhj;
	Mon,  1 Jul 2024 10:26:11 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: qcom: qrb4210-rb2: Correct PMI632 VBUS voltage
Date: Mon, 01 Jul 2024 17:26:00 +0700
Message-ID: <7989762.DvuYhMxLoT@melttower>
In-Reply-To: <D2E4FJAD0UZ7.ZDYOYNZ8QOJA@fairphone.com>
References:
 <20240701-qrd4210rb2-vbus-volt-v1-1-5c06f8358436@riseup.net>
 <D2E4FJAD0UZ7.ZDYOYNZ8QOJA@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

A big mistake. Sorry about that.

On Monday, July 1, 2024 5:13:28=E2=80=AFPM GMT+7 Luca Weiss wrote:
> On Mon Jul 1, 2024 at 12:09 PM CEST, Dang Huynh wrote:
> > According to downstream sources, PMI632 maximum VBUS voltage is
> > 1 volt.
>=20
> Everywhere (also subject): s/volt/ampere/
>=20
> Voltage for USB is 5V
>=20
> Regards
> Luca
>



