Return-Path: <linux-arm-msm+bounces-88822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555DD1A191
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B085A3038943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DF6346FC8;
	Tue, 13 Jan 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="iw8qlTaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2DC2C236B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320561; cv=none; b=UnaNjqN4tGmuDHIHXIrvhz+cvSsqd+dp+qhUi8lsN4vBAAMehkETJuGNy4czA9gFgQEStfJGfbzPsmNz5fqoEqmYE1hXg8ookQIYrOHHDwvCxBtlig5SUryWIvGR5BId94BToMFUSCbdZz0xlSxK/A6kCXe2ZAF6dzxyY+An8OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320561; c=relaxed/simple;
	bh=ieLFkGx9sdSz63gF+Uom7GsmIfQZ/NMEjVcGAmgV7jw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DRVQyZlw4N1zCY7pFCPXmXJ6XvpeQb8L6tuNm6BULxJqkcJn1vIVrQLD5Ncp5NUYG6QSIR42SygdUCNOQWTbnwMMFsywAcF4SaJkFtqqLV8qm8a29gYd7DC6WxA9Xw+dRj9I0RRPa8LrKvkZPqNTDgWwoahP8c5eFGjZRtOumok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=iw8qlTaR; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768320558; x=1768579758;
	bh=ieLFkGx9sdSz63gF+Uom7GsmIfQZ/NMEjVcGAmgV7jw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iw8qlTaR+VCxqbiN39r3LZXwKCUyW5tKDJDKYjQGOM1qvfweHJwvwJFQmJgSxCHQ9
	 TnKm/hcdDQdWOPHISm/xBvAPjFEy2vCALJq3us/c4G3Hp41OLTKOuA4/Z6vHNZUvVd
	 +2q+xCZMphjWi+2/mb+Oi/nJ1qWvpGbHhp03Mu8nPNr7I+2teuheyjN8jc63gAIN2l
	 kf6nTS0DN57qdBqD4WfEtfIBb/qkdpqx+Agd9eyxw3CEPRCFNYdPUTxOWBh1TPzrUk
	 JELZ9DCYBjVsZY98OFkoTMOljDw3h5bpY4ITQsJU+h/yCBdmXW2id4MJrkPd3Xvpnt
	 fnyrZBx8Lvw0Q==
Date: Tue, 13 Jan 2026 16:09:13 +0000
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me>
In-Reply-To: <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me> <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com> <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me> <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com> <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me> <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 15f7d62df0ba0e7ba6f85bc2b6e21fb122ae6b3b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 13th, 2026 at 10:59 AM, Mukesh Ojha <mukesh.ojha@oss.qu=
alcomm.com> wrote:

> Are you trying to modify hyp dtb here ? how ?
>=20
> blair is very old SoC and may not be running with Gunyah at all.

No, don't have the means to modify hyp dtb. Was just guessing at reasons wh=
y this issue occurs.

Was just using blair since it's the only secure boot off platform I had on =
hand so only one I could flash ABL on, but if it's using a different hyperv=
isor than not really a relevant test then.

Alex

