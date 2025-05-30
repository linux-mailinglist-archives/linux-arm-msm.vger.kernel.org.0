Return-Path: <linux-arm-msm+bounces-59884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915FAC8D2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587234E2487
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A3322A1ED;
	Fri, 30 May 2025 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="UVxmlLZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DA22ACE7;
	Fri, 30 May 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748605815; cv=none; b=WPqNrrWdCSjZOX8/aus9aHSoYVFR0OotnNappwfHVIWrQibXjGJVk3zoZOEtxbcVw5BH0TarTLwHW8vBkrKr/9LfmzPJKwfWahIlfOsR3JZL2B7V876kUUCuj7WyE+5ngNDk8YhFXdLpBrfzXmOukLyusvadRmuIR35BB1Hz+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748605815; c=relaxed/simple;
	bh=idu8Ow8BMuBX4wTfRDd8vQr0HjKab5Y2sMtyPt5uE1Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PwHJ1PvDPbTbNSOPdpPZydUmnSVxjt0IX3YyFbcRfWSE/Ab5nYe/39cRL5Tx+1OgEUvQrP0ZOe97lfAoj8fcNoVmqJ0R5ATThQjEN90SyadCxoxCY7JC1M7BHMt+vTTOHYUCEbMsNR3IL/r8XEjv/jRcK2C+XOerjSGti/6lHwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=UVxmlLZn; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748605797; x=1748864997;
	bh=LK8UUp4Bx1tCTim2vLQR0cYMads/iCl1Xz8T7cjEVNs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UVxmlLZnUq4kKJb23XiaT2Y5Z/UQqHTcA98TrVRs2YaNFwXc0rsjlUNXRLJtsphaF
	 nIth6y1QjaUXzMa1n/DHSC9Tg859t/qW+gH03E1usZe+WCCBxT8q3tmliOMubAoA8z
	 H9L/AL4zkZASd7jZA9ODf0FsZf86EecIucpbSiBgmzzoYA66sc915qh5ivWdxO1oIw
	 9ygNEOXhyyOp5FJkD1J3GtbaVL8NRplRYdmCONd9Ruhnh7TG5DlIfggKgSAebWONHr
	 B5tAgie71cMTVRsD3K9kWLkCzFurYJAWcUFZtydJ7v28oiHtBr+IVV+mC1J/AZt1j8
	 X28Ci54q0aDfg==
Date: Fri, 30 May 2025 11:49:52 +0000
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add support for MSM8939
Message-ID: <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
In-Reply-To: <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org> <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: e039232186c158fc9bdd69f31340df6e1336c81d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
> +=09    camss->res->version =3D=3D CAMSS_8x39 ||

This is not correct - it should be 893x since 8939 and 8936 are ~ the=20
same SoC - probably 36 is just a binned version of 39.

Anyway the x is the least significant digit.

Please fix
---
bod


