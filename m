Return-Path: <linux-arm-msm+bounces-88841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBED1A6FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A3573032CEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BA934E74F;
	Tue, 13 Jan 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cJrq/+hX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721EF31A04E;
	Tue, 13 Jan 2026 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323376; cv=none; b=dBS0CnSNpeFtDJTiZZv3D1SHTWKRY7aO10fcCk0ajxkKtTQomOsmKVOwuoUblWcDtx85hqOfKCvsNfrkU3BCuZlVY1TGc8ycwOBKKtQrYuTeTdE448Z2QF/jF3oJNtN4qUnZFzq/1ZuLnzl7kPMHiJupDvTfQurfEqYXcKvBS90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323376; c=relaxed/simple;
	bh=2oYAZPig7tjbeL+r0wP67boo5Ct8cG7n70gzHEjMttU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FA4vkwkgvkk6xBvUqfNJYuhSR8NXsBUe4bvY6cDXGvWLPdwqTUA8JCbtyYaHX0WN4Vmqgpo96a73p0AuZeBWLc7AE3WOteew27ez9tZ7pJMHRYJlSBM9YUsRJjuaHromtOHj+RxAql0Lzh2AE71+DZYoTvba8OnP5BMUZH/tcIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=fail smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cJrq/+hX; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768323359; x=1768582559;
	bh=2oYAZPig7tjbeL+r0wP67boo5Ct8cG7n70gzHEjMttU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cJrq/+hXzNWkMtABfS5Z3QNf2bQnyECQSm0Ux2q8PAR09jz7KW8vMn1SX1mywUTZH
	 CN8O3cGJ/Yhc9GR6Cd2Bmt0COpOmBeykAdzlkpX3RNO76HARfdRKIatZVKyceTntqp
	 y3GNiralKGnt5D+aShEMihf4R4N/tJdR4/hWskC3mo6IxydI13DK9i5IXPvmpiB4eq
	 eKXHYOmURKoAla0IhoMOGKc2Jc6CLQZTgI+W4RFNAWrNXWeNCp7rodlLHThzqtfGVa
	 NkQBck4rxvZE+exNocukLs97O7++ma0rgPbqONrlw8YFf8t8ZIoeCVSPIVBFcBsZ74
	 wKmaZhOFNHVIQ==
Date: Tue, 13 Jan 2026 16:55:56 +0000
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <tKcoAs2SS60FpZ7kb5BZTDoNFMgIBPe3Lvu59uksDQNhOoXPrF7bsvp7rs-s63V_xbnmqV0_nGXa-OiFW6V9a5waP3VK9lLxv30mxSayfF0=@pm.me>
In-Reply-To: <20260113164744.6lwz6oox6pdlxn7z@hu-mojha-hyd.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me> <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com> <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me> <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com> <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me> <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com> <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me> <20260113164744.6lwz6oox6pdlxn7z@hu-mojha-hyd.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 515c6448ccc73e3ba25f30a9b54e5dc835cf6c6c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tuesday, January 13th, 2026 at 11:47 AM, Mukesh Ojha <mukesh.ojha@oss.qu=
alcomm.com> wrote:

> Just to clarify you said, there is no issue if you just use dtb and not u=
se dtbo ?
> And issue happen when you start using a dtbo, even a dummy one, right ?

Yeah, the cases are as follows:

dtb only (no arch_timer label) =3D boots
dtb (no arch_timer label) + dtbo =3D fails
dtb (has arch_timer label) + dtbo =3D boots

Alex

