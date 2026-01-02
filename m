Return-Path: <linux-arm-msm+bounces-87274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A3CEF30F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 19:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE609300CB98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 18:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DE6288535;
	Fri,  2 Jan 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEmTuZ+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D970EEBB;
	Fri,  2 Jan 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767378934; cv=none; b=UUdf+8KDIiahn8hpZeKa1HkJXLGngZvc4rmtgdFty/6HSyMTCjwZBFZuXhO8wlY3L0tx0DWI3YvAVT8H5sBTHsGXRpTgSlvTXbKMJH9phOXd9FzO9Q5j3kV+xO4Lkk9vujWzblFul4dbYaNRStBBMG5/CnD9WblTV9PWsP+rhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767378934; c=relaxed/simple;
	bh=2ISzF1BJvmh+Y5rh4fMaIcd4DCj19WEUStnlhxpepVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1bcSYGxsSWVMVbGiaBlRRxb+xfoUoLJ8/CkBzYggTmm0jEdwOpxZGYbGUYxcMXUH97TS/ichZ27Kkg81HJDzbU8sdJm4QLqFQNeqiv7u7oIBKuUjpBwli7ihFjHg1DpyFM7YKmqwZYk870Ean8XEYG4PzgVh2dE9a65n5PUKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEmTuZ+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3354C116B1;
	Fri,  2 Jan 2026 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767378933;
	bh=2ISzF1BJvmh+Y5rh4fMaIcd4DCj19WEUStnlhxpepVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEmTuZ+xjrvBHSqB5jWIHsv4iuRrTOlnOWA8GR8uqSpNicY+zAg4F2fc5d5tNv5sZ
	 yYutuTZlwBb14s3rz9TXIlhExWSorzTM88TGO+mClWqvfIZ4OcvbBjo3xoYZmx9etU
	 PgpykHrjc1vglzpR8DiMakIrWtnSrKLwYXBE9GBbpCgBbdGo3QmLFtDz4ftm4g5oty
	 3hV4Okc0EEk3vQkUDYdyfB2bykM4ok/hDGtoxHmT159+NORPm+IxLE6Gy+mwHoJeG/
	 p2jupChGwihXfPvqa2BRFzWl17SyY/dLCTLYgKLSyQJxVm4jjSlMNqcTRc+j3FWcJx
	 oha5ijVIDc3mw==
Date: Fri, 2 Jan 2026 12:35:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: qcom,pdc:
 Document x1p42100 PDC
Message-ID: <yulnacbkob2bxmqzkivbawshofi2byxjbqzel2edkvqko2rtfg@zzxzdsvgbzjb>
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
 <20251231-purwa_pdc-v1-1-2b4979dd88ad@oss.qualcomm.com>
 <209c49fb-04a6-43dc-a3f1-8451e3946d06@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <209c49fb-04a6-43dc-a3f1-8451e3946d06@kernel.org>

On Wed, Dec 31, 2025 at 11:49:00AM +0100, Krzysztof Kozlowski wrote:
> On 31/12/2025 11:18, Maulik Shah wrote:
> > Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
> 
> We don't use Hamoa name in upstream.
> 

Using "Hamoa" and "Purwa" is approved and IMO preferable. I do like how
Maulik included the X1E80100 name here, to ensure continuity with times
before we did.

In fact, I'd prefer $subject to use "Purwa" instead of "x1p42100" -
quite likely that's not even the Purwa SKU that Maulik tested this on.

Regards,
Bjorn

> > bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
> > hardware register bug on X1E80100") is already fixed in Purwa silicon.
> > 
> > Hamoa compatible forces the software workaround. Add PDC compatible
> > for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.
> > 
> > Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> 
> Your are describing wrong bug being fixed... or actually not a bug.
> Every SoC should have dedicated compatible (see writing bindings) and
> missing compatible is not a bug.
> 
> Best regards,
> Krzysztof

