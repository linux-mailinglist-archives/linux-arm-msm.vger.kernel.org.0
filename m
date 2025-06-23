Return-Path: <linux-arm-msm+bounces-62110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADBAE4B47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9E93B8428
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89C22BDC39;
	Mon, 23 Jun 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="FC94XtYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DA299ABF;
	Mon, 23 Jun 2025 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697075; cv=none; b=oyL8kiomqrR9FgKOfUlG2hfRr4dryrGrf/+HDMRrpc1f2DI3rh6qvmBzQXz3urtL9BHvT1liq0szNkPrxofNjshjbFHmfh6x/pVmGGstOlsa7SDUBqgXeOd64rMnuQJ4aw6HVBIzfNdkzvf4nCgJZimkneGUW7iRaCa+aH2K0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697075; c=relaxed/simple;
	bh=5mjnTZIf1798lzAG/42eHA/DYiBDORF3uK1JXlBMUEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNPp9Pfuw0gTpBxgdh0XQmGL9igYRCO3EB0xKZTCBrTjU1Johl99lAE2fzDTuFK6aUKkcEZakuEMklgvAYiW6P2m1Nd5Sss63Marcl+OgEXlgXfJH1HU3TISA8PI1JRi4+hoMjZrcFdUvpiy4rSqZjy9Exezl9fXJbIfZ+9g0TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=FC94XtYp; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750697066; bh=5mjnTZIf1798lzAG/42eHA/DYiBDORF3uK1JXlBMUEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FC94XtYpIZvQGC2aLDS6BufiUJtQGhD83KUrv82djouKhBztNbp9+CXqj5gCuRTqV
	 NShVS126WpV6octVlHGgC0lG74uH3gIQiU5doTLrpXiTzuZbrrkRWnjEH4EIvxdG6v
	 KVT/t7V/R4SlYi6Ahr0YzdSQfg3igiSiJZJ/3q4Q=
Message-ID: <d31bf707-0f8c-4f55-927a-a08c5310b7be@lucaweiss.eu>
Date: Mon, 23 Jun 2025 18:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
 <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-2025 2:39 p.m., Konrad Dybcio wrote:
> On 6/21/25 3:19 PM, Luca Weiss wrote:
>> Due to historical reasons all msm8974 boards have used the CX power rail
>> as regulator instead of going through the power domain framework.
>>
>> Since rpmpd has gained msm8974 support quite a bit ago, let's start
>> using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
>> for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).
>>
>> For reference, downstream is using GFX power rail as parent-supply for
>> mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
>> modelled upstream.
> 
> if you use an opp table with described rpmpd levels and bind the GFX
> domain to gpucc, it should propagate - check it out

I don't *really* understand what you mean here. I'd be happy if you 
provided an example (or better yet, a patch) for this.

Also msm8974 does not have gpucc, only gcc and mmcc.

> 
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

Regards
Luca

> 
> Konrad


