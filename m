Return-Path: <linux-arm-msm+bounces-87164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B1CED5E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 22:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEE9B3005EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 21:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532A9257452;
	Thu,  1 Jan 2026 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aDLDdG/9";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="J7H7YUmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F68632;
	Thu,  1 Jan 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767304678; cv=none; b=FhWu1YE3dVVqKlT8NspSosczDFElNbNHyo1URxLv+DNyLfqOLwTAtJmvFaFf4Q4iDT/5HvY/BrFVqts6NgQqBB5Ry6HpfNxZoWIbkEgeG0gv0ZdwMUPxLHAT9SNVX/vtymDMttWGfi3w0QUBpg+79dM82+RpoTE+uMfKzOxfCYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767304678; c=relaxed/simple;
	bh=wFGzshqpRxQlJiZVcKZdreo/deiapqPJPqnOG070a4k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=qc0LVW3TEBq1s+/UxYHqfzYfZw8VP3Vo1XV9FkOG7fXYRETXZMa+jEOqAkOq8Fj2a5Zz1tdZbPEvfGoEelPZkdf38jqFghvY0NaM/Ji6pFpljX66i/UEIkfS6JI77FAaFBzATskmj868xrC6Red0sCJ8siU3iRwdmv4n1+4vsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aDLDdG/9; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=J7H7YUmA; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767304665; bh=5wwVpGucWLa74HLyeUMxbQ7
	S1Mk8uI3EGGdugrrYuiY=; b=aDLDdG/9EIY2pZWYegzcirK+nbhGPyRRO6+Tr+JLUesJbPGk6B
	Jg1cWcMbgqxdd+o+7r7Sy73s7yyg9V0ZdMkGZB1PySqjcjoQ7rM2+aGqOQsFOLsFIMmKyfHnixR
	tvaZFRf13zGneHZsyUSVC4VhN9fUZY6BhNuEfU5SKxqRAvaHWG4gaEfgJzVMLK4pTbEetCyzFIP
	fpS+9pJAyTB2mbt9Na278kNXwr1MtAIsGWu6KdQ6yFPu7pfwIIRPd6osjE5Pt5gwa7PvA6jmVMF
	2Pd7Ki2G0R79TWSeGJkWEOMAT6tHHiH6858jsklsMUXOUiZ0d+dAdbqDvr9A9DPlMjA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767304666; bh=5wwVpGucWLa74HLyeUMxbQ7
	S1Mk8uI3EGGdugrrYuiY=; b=J7H7YUmAKg0qirxWAZ1Lhiqb8H9GG/IDjR7ISwhDy8afK9Dqa7
	Ao5wNSKJEEuqwCtZYElvl+lmuyZZacbJ5QAA==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 Jan 2026 22:57:45 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephan
 Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
In-Reply-To: <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
Message-ID: <73d028cfdd514d6c3f073bb66fdd07cf@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-01 21:58, Bryan O'Donoghue wrote:
> On 01/01/2026 13:50, barnabas.czeman@mainlining.org wrote:
>>>> +				for (; i >= 0; i--) {
>>>> +					val |= BIT(i);
>>>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>>>> +					/*
>>>> +					 * Read back value to ensure the write is done then
>>>> +					 * wait for 1us for both memory peripheral and data
>>>> +					 * array to turn on.
>>>> +					 */
>>>> +					val |= readl(qproc->reg_base + mem_pwr_ctl);
>>>> +					udelay(1);
>>> Isn't the logic here inverted ?
>>> 
>>> i.e. you've written a thing and ostensibly require a delay for that
>>> thing to take effect, the power to switch on in this case.
>>> 
>>> It makes more sense to write, delay and read back rather than write,
>>> readback and delay surely...
>> This is the original reset sequence without modification, i have just
>> moved it in a else case when it is not an MDM9607, MSM8917 or MSM8937.
> 
> Doesn't make it correct, we fix upstream logic bugs all the time...
Here is the original upstream logic
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/remoteproc/qcom_q6v5_mss.c?h=next-20251219#n823
and here is the same at downstream 3.18
https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/drivers/soc/qcom/pil-q6v5.c#L451
and same from downstream 4.9
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/drivers/soc/qcom/pil-q6v5.c#L518

> 
> For example a read-back to ensure write completion is only required for 
> posted memory transactions.
> 
> Is this a posted write ?
> 
> Is there an io-fabric in the world which exceeds 1 microsecond to 
> perform a write transaction ?
> 
> Anyway leaving that aside the bit that's really objectionable and IMO 
> obvious a bug is val |= readl();
> 
> Why or the bit back in ? and then why not check the bit was set on the 
> read ?
> 
> val = readl() is a lot less janky and shouldn't it matter that the bit 
> we tried to set is actually reflected in the read-back ?
> 
> Failure to set the bit would certainly be a problem...
> 
> ---
> bod

