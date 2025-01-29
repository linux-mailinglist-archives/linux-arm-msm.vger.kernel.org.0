Return-Path: <linux-arm-msm+bounces-46554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 047DBA22539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 21:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673241884C3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 20:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA5D1DF979;
	Wed, 29 Jan 2025 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="L/STYsyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B6187325
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738183967; cv=none; b=uto+REwY0E6u62caNrjOfIgyX5jbpfDIj62I1SwPe8A5TO9HK9lAIamzcxicICPjxVG0n4wTXMx8bYgAzjOswxa8Wx47Ypg+mGY3dxlo18COcOOqY1oBcaficTKBxdYcBDqstFpkdjyV/ipPIbfVxxczRBrU2ET+SfHyl7QgOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738183967; c=relaxed/simple;
	bh=xyr5PIlbLfJ6I4Egb8Efh62Wto/uwzslQ/ZHlX+4w64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlKWLRN9pyfvRf7BdCPYJYhB7U4NN5j5TXRxA3wyEs0uZlWtydNl9yuerndApDSTnqDWX1RqokxyJej52Onlt//GQ9Ya69Zcl0sywxk2dhVI8egQUDDqV6NzPefq5ZTYZ4dexF5wpXXx6NpAJlcBjEmqEJUBW/AJU8/AaaCe6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=L/STYsyh; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <09d57c27-f287-4ae5-8c78-db39dd9cc820@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738183953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2anBw/0nl/MpoKmZoouOwpqjWzlpK42AL+hFfwTIX/M=;
	b=L/STYsyh4Nxtvet1dU3G7XbPpflMqeZ/CB2HpVjkjsU59avGYhQBCdy4ldppNpFi48DA5s
	eOAsY+zFnPkyTwotkj1Ka121s3L073whNhBxEITTeN+jR7NBipxbCn8FiLs1sfazqF79sJ
	+0+F74zMoAjhkTtFIh0sMtfA47ocNkr4BBF3aPUTGb9BGiRMUgyVYOpWm2aJBPoYFFRyBP
	oXL4R+e7KGbJF5E0QbCLaN7EvcfO2mmJOo9/YiTmmoJZnpcvpV/YORShJ1ux5fj3k4vPZg
	rkI+j24M43q6RP59djuExoX/hpKVUvmBN56OHmu6Q2hu0PCp83IhbarzEaKyoQ==
Date: Wed, 29 Jan 2025 23:52:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sdm660: Add missing SDCC block resets
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Craig Tatlor <ctatlor97@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129171842.1588526-1-alexeymin@postmarketos.org>
 <55c5cef2-3cfb-408c-8c78-4bfd5ee19a29@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <55c5cef2-3cfb-408c-8c78-4bfd5ee19a29@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/29/25 10:06 PM, Krzysztof Kozlowski wrote:
> 
> No line breaks between tags (see `git log`).
> 

Will fix in v2.

> 
>>   include/dt-bindings/clock/qcom,gcc-sdm660.h | 2 ++
> 
> That's a separate patch. Always.
> 

No big deal, but I've looked at git log and found previous commit 
b538304da785 ("clk: qcom: gcc-sdm660: Add missing modem reset") [1] that 
did similar things, but in a single patch, so I did the same.

Will fix in v2.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b538304da7855f4e31f91f915f259936eb67a1e6

--
Regards,
Alexey

