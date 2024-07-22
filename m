Return-Path: <linux-arm-msm+bounces-26739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7B938BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23ABD2820B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22BE16B3AC;
	Mon, 22 Jul 2024 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="MvZCyBoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC216ABF3;
	Mon, 22 Jul 2024 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721639836; cv=none; b=CPcqUhbM0a431qhYgRDnR1i23JzJlMf+uAC4TLDLY61ts6DYYdto0SToYhbfOJ0E2N3sXKyF9bdXSm72QuICHIhfjGt+1S3Hv76k893mM5seWQDO7Y58jLn4hfBQx3EVaNGDQ9fYfyrybGiW2xBvfHiTOZuPGwvudiGKJL5FdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721639836; c=relaxed/simple;
	bh=fScq566XnRNd6AA0xPg2aOnSVjCHflGPmFXAyikTsn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlG035EaXEEmrtBUTd9R1cwUaIRjTf9I7lrp6E5jv8wIWOtwMC8Pff53AlaNeBKVXRjWVimqEwdsgDZJ6X4DQnFHmhV1uU7GimE2Tf4Qflqf7t1eSZySeaCL8zeDb0EjiDfVhbGHCaSAJ5+BEd906QDdhSq9hXGy76n7Mq3tfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=MvZCyBoy; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSF6L1d3wz9s93;
	Mon, 22 Jul 2024 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721639834; bh=fScq566XnRNd6AA0xPg2aOnSVjCHflGPmFXAyikTsn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MvZCyBoykTnWpCWx8TXn0hRq5FhaU62QJe+vV/sUskf6uwXqELsnAKfBKx9slnrSy
	 jqdvtt0eYbENjltPcU2Fkz4pArPj4u4jFmuwAkd2IjyHsB9/PcyTwcDvPDFvhZ1xIE
	 35dthzS/m9YwmWOv5+B4ZzBKaI79irKmDw2+gzNE=
X-Riseup-User-ID: DA389E7C6FEA219298227EA4A4FB07FF7A1A5924C27901CEDFF03F711FD62ACC
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSF6H36BDzJn9v;
	Mon, 22 Jul 2024 09:17:11 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/12] arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
Date: Mon, 22 Jul 2024 16:17:08 +0700
Message-ID: <15331308.O9o76ZdvQC@melttower>
In-Reply-To: <b902989e-148a-430c-a013-172e49733769@linaro.org>
References:
 <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-6-c4d486435b96@riseup.net>
 <b902989e-148a-430c-a013-172e49733769@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> > +&mdss_dsi0_phy {
> > +	status = "okay";
> 
> No power supplies?
> 
> Konrad

Doesn't seem to be defined anywhere on downstream, may be hardware controlled.



