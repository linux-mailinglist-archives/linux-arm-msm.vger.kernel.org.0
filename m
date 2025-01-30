Return-Path: <linux-arm-msm+bounces-46576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C264A22C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 12:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A650A1887B41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799E31D9329;
	Thu, 30 Jan 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="UmYWfAn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59271D63CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236589; cv=none; b=RaXUTywHHtIc7Po8uwhLN7XF+Le7kfiMftZf9IZypd1qsByHQ0EPtsiq9Px2WedxNFGK8QShOzJentMn5FG4CsIJMDUAZMNyUk442gn4W0SuVm39gq8kZqfnel+26twyttOr9u93zH3uiX5YqpTAEJ6wdMnU36GNuLwENWR5bdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236589; c=relaxed/simple;
	bh=Rl6iPZmIsx5OB3kYzIg7Sny9tKV0nIuvvUeFWacwWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=az2x7Z8055v283+cdaz5pcI48VUstRwi31FIgkFgNCXZ+Gwun/3umD2M+SfRgbE0c6oRszW53hq8+e+L6w13ibLf82PN0Zoj2hYLCOmOVqdm1wz55zYTjOl6s2XBji1hbqPaz91rBn4IHMk4fx6KzXqssMsWZWyClKRTzrlUWdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=UmYWfAn2; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <6312f316-f407-494b-91c4-04d761396e22@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738236575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWcktz/MAlG+7TUszakeV42NRt0QCMjIbkWs7JIUlnc=;
	b=UmYWfAn2PY7GbBqgM2bvR3M3BGIvRxBLwTdLL03KqT6k9W6yZhuuWH1+O6P9+NbIkGg0v8
	GDRLR5kYDO1zU04XJLduOqC/IL04cLHg2V14heyxHHU5abBZG8qssdLzFtIyc5sR7GAcol
	Qk63nLb6Px5ph4FeVeNsf1tnrIyGbzgRpupKFefmY4ADu8KKTalFIRuW4XZ6iiiBd/Q/ip
	yBka6oXCYdxnZ0HVNQ44+S3ha/kiIM/Sp4MeSK1TF5MB8xgb3LkCcG5WHG1KwIlZQ5Vng1
	RCPU8S0AGYVFrjSiE9m825Pl/ae6ZQTipi/x25me7FvzTcBcYmXXdPc7iyfQxw==
Date: Thu, 30 Jan 2025 14:29:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gcc-sdm660: Add missing SDCC
 resets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Craig Tatlor <ctatlor97@gmail.com>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250130-cheerful-splendid-cockatoo-d833f6@krzk-bin>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20250130-cheerful-splendid-cockatoo-d833f6@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/30/25 11:35 AM, Krzysztof Kozlowski wrote:
> On Thu, Jan 30, 2025 at 12:23:25AM +0300, Alexey Minnekhanov wrote:
>> Add resets for eMMC/SD card blocks that were missed during initial
>> driver submission.
>>
>> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
>> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
> 
> Your SoB is always the last tag, but repeating what I asked during
> previous review - what sort of bug is here? Missing feature is not a bug
> per se.
> 
> Best regards,
> Krzysztof
> 

I was hesitant about adding fixes tag myself, because there is no any 
user-observable bug being fixed here. In fact the behavior is unchanged, 
eMMC and SD worked fine before this and still work fine with this patch.
 From Linux side this is mostly for consistency with other 
younger/sibling SoCs, like MSM8998 & 8996 all have these resets 
specified. This will probably be much more useful for U-Boot port.

Perhaps fixes tag should be removed completely?

--
Regards,
Alexey

