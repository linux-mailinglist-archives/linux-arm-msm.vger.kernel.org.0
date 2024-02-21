Return-Path: <linux-arm-msm+bounces-12055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955085DBD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3139D1C2088B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B79777A03;
	Wed, 21 Feb 2024 13:45:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54C4D5B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523141; cv=none; b=K+uh8GGqTqUaqnj4TnHPCgMUnxPDG0/14w48k12Y+glTAkG7eXJKrdrt4w0Tp6908jSTQks7RjVVTUe0G6ufc2pArx+2hUujHbYkB6wp43D1vzATi6IosUbGaTZ09znq0fROwMaSmpoq5nZkJ81Ku73zSY2zYMInafWgh5nS/Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523141; c=relaxed/simple;
	bh=juEouuUJ136A2uRyt4uiuxJPTi66X9k73J4uyYTWJ0A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oiaLmwkTFKmAb2e4MY8xF79haVm+XWoXsBE8Y9KgsU6Xy71NF4rPgFAXLK5J9vNO0RRTcYUk77c9iOHeztCg1HkLorOPkHXZZP2FjFKe0paL90Mg+eCjEQ/zSnnyMLbm2BUu4ok6fNWh/UWZNgEzvSIN/XUT+uykCAq4XImDEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmud-0006fc-1G; Wed, 21 Feb 2024 14:45:27 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmub-0023Ct-Qm; Wed, 21 Feb 2024 14:45:25 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmub-0009z1-2Q;
	Wed, 21 Feb 2024 14:45:25 +0100
Message-ID: <8598dea60afa80effd7fad2650dc045bc36d0f0e.camel@pengutronix.de>
Subject: Re: [PATCH v2 20/20] media: venus: pm_helpers: Use reset_bulk API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Stanimir Varbanov
	 <stanimir.varbanov@linaro.org>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 21 Feb 2024 14:45:25 +0100
In-Reply-To: <466efa71-bd42-46b7-b81f-2a70d80e3f03@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
	 <20230911-topic-mars-v2-20-3dac84b88c4b@linaro.org>
	 <a25224f5d28aa65e8bfd14fe0a8f599b9f9e3f40.camel@pengutronix.de>
	 <ad20b872-0b50-4a16-b342-582d2f33eeca@linaro.org>
	 <1cf19cf23ffd88d9ffb673e8f382f3b1d24545bb.camel@pengutronix.de>
	 <466efa71-bd42-46b7-b81f-2a70d80e3f03@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mi, 2024-02-21 at 14:37 +0100, Konrad Dybcio wrote:
> On 21.02.2024 14:34, Philipp Zabel wrote:
> > On Mi, 2024-02-14 at 22:20 +0100, Konrad Dybcio wrote:
> > > On 14.02.2024 14:31, Philipp Zabel wrote:
> > > > Hi Konrad,
> > > >=20
> > > > On Fr, 2024-02-09 at 22:10 +0100, Konrad Dybcio wrote:
> > > > > All of the resets are toggled together. Use the bulk api to save =
on some
> > > > > code complexity.
> > > > >=20
> > > > > The delay between resets is now correctly determined by the reset
> > > > > framework.
> > > >=20
> > > > If this is a recent change, could you reference the commit?
> > >=20
> > > It's a series that recently landed in -next [1]
> >=20
> > Missing link?
>=20
> Yes, sorry!
>=20
> Konrad
>=20
> [1] https://lore.kernel.org/linux-arm-msm/20240105-topic-venus_reset-v2-0=
-c37eba13b5ce@linaro.org/

Thank you. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

