Return-Path: <linux-arm-msm+bounces-26732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF484938B5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8BE1C2117B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E156166302;
	Mon, 22 Jul 2024 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="KgPyeHlo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B035280;
	Mon, 22 Jul 2024 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637546; cv=none; b=ctHH0I3YDx/OJoGYzUDFPFdmFUcRYGhdggSr6O1oGw7MP0Td3LYlZy15HI3JyiyLSj/L8UH0TEX3jXVUB+fLuIzfBtkahTIsbQdIk1lHAQVC57d1oyGZopCQgppyYm619vovtwg9STHIcsNncewoFhhGIRqQOIGkuXHYPlWyeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637546; c=relaxed/simple;
	bh=y8i58oPSI+YRI06GfWPqhrOGnEvKtszUB9Z6Si06570=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPhmcLeX/T3prQPmKDOsIBS0IgDvsTgyE4m+oQmL6buVXT8OLm+0an9fbvymB1fj99AXTFWYNMZyIPIVl1KaYjumuSp7Lj5ItYAtln9/n/jAaUOHEGBVuvgQHvyDF38ck73f0hdxeLNRjIuojHYjoHSKxNyNDn3l3Iz5EeasrTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=KgPyeHlo; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSDGH6Wkmz9s93;
	Mon, 22 Jul 2024 08:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721637544; bh=y8i58oPSI+YRI06GfWPqhrOGnEvKtszUB9Z6Si06570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgPyeHloABkDl53JLlgYZW0TILOVUXd2IFN4kXRugHfRlQ/BD5EzlKdYl3ce5R2nS
	 8xWHPV6dGC40MS1xRBg47VklJBqyedQqBMoJaHlxkEQ/fwZ8+s2FAkWe6Z2Ce48K/n
	 qN1GPu9p+iHFwTjlnkDTwolFP1dPtdsvxMJcUGsc=
X-Riseup-User-ID: FF3A39E1ECB3173456427B1F846A6B531C8206FA9D0C729C7ED3C2354F19974B
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WSDGF0TVLzFtK4;
	Mon, 22 Jul 2024 08:39:00 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 03/12] arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen
Date: Mon, 22 Jul 2024 15:38:59 +0700
Message-ID: <5592483.mvXUDI8C0e@melttower>
In-Reply-To: <29c10415-4b59-4aff-bfef-8cfaf090e361@linaro.org>
References:
 <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-3-c4d486435b96@riseup.net>
 <29c10415-4b59-4aff-bfef-8cfaf090e361@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> On 22.07.2024 9:10 AM, Dang Huynh wrote:
> > +
> > +	ts_vdd_supply: ts-vdd-supply {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "ts_vdd_supply";
> > +		gpio = <&pca9534 3 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	ts_vddio_supply: ts-vddio-supply {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "ts_vddio_supply";
> > +		gpio = <&pca9534 2 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> 
> I suppose you don't know the voltages for these?
> 

Nope, no schematics to verify.



