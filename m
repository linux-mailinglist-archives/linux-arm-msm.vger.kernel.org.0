Return-Path: <linux-arm-msm+bounces-35817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACF9AFC2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FF1281336
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B6F1C174E;
	Fri, 25 Oct 2024 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jia.je header.i=@jia.je header.b="wOdIZxNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120E18CBF8;
	Fri, 25 Oct 2024 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843743; cv=none; b=HLsTclBAuka+vI93JopwISXWxkqyyTDFKpYwQ8XshXD77vT8cSCRPzuaLIgoqdy2/GBS6/U9TOO4vX0VdwOPGJhzX7Bd8I/MUyksThk0gsUhKKfTvh8XY1jtsm38nLBnxR3U/EwpwkspX6VSxNoTdx2Uo6VehkJ6NP5CNMC619s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843743; c=relaxed/simple;
	bh=udj4OU6vBVBTXv06RmJ/hQAKYTOBPesKc3qM4ATbetg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibOaZdo0nVEjZhUXlEZ18Cf3HjnEF/FnxgEklUiNdCfuTmadQ+ezjSA96uc2NV0m5lC7pjgWVbDICO9PJFVkWgP1+08UadliQ1soWwZH59T8uNRjiLcyG8XLIFe+YsHX9IM5hYQzqSXHrTLYZPENKYEDCow0l57Pa8/execOp24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jia.je; spf=pass smtp.mailfrom=jia.je; dkim=pass (1024-bit key) header.d=jia.je header.i=@jia.je header.b=wOdIZxNQ; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jia.je
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jia.je
Received: from [192.168.0.18] (unknown [36.112.207.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: c@jia.je)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 9F90B4BD68;
	Fri, 25 Oct 2024 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jia.je; s=default;
	t=1729843741; bh=hOgFl4xdVDlYtBMop6FvdwBRhm176QROYeQduhd9ay0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=wOdIZxNQV8TQzt6kMltfmTt8CZsQWCi4CZlKZBnGHc7mLKFEGW0vAXABDPn5xzRKJ
	 4ilFy8v0v/egNLHrsRGK65uYJ5AcAyq3r385P0drickwUAQ6H5yP/HRHc32QCYzdM1
	 BSTZObPqkMVordZUI7mN0DcDvYYRhy7CXgfQmwLc=
Message-ID: <270a2b73-087e-466d-9ba9-fb696167d507@jia.je>
Date: Fri, 25 Oct 2024 16:08:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add performance hint for
 boost clock
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241025031257.6284-2-c@jia.je> <86jzdw3977.wl-maz@kernel.org>
Content-Language: en-US
From: Jiajie Chen <c@jia.je>
In-Reply-To: <86jzdw3977.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/10/25 15:58, Marc Zyngier wrote:
> On Fri, 25 Oct 2024 04:12:58 +0100,
> Jiajie Chen <c@jia.je> wrote:
>> The x1e80100 CPU can have up to two cores running at 4.0 GHz, with one
>> core in the second cluster (cores 4-7) and the other in the third
>> cluster (cores 8-11). However, the scheduler is currently unaware of
>> this, leading to scenarios where a single core benchmark might run at
>> 3.4 GHz when scheduled to the first cluster.
>>
>> This patch introduces capacity-dmips-mhz nodes to each CPU node in the
>> DTS. For cores numbered 4 and 8, the capacities are set to 1200, while
>> others are set to 1024. This ensures that the two cores can be
>> prioritized for scheduling. The value 1200 is derived from approximately
>> `1024/3.4*4.0`.
>>
>> Note that capacity-dmips-mhz is not ideally suited for this purpose, as
>> it was designed to differentiate between performance and efficient
>> cores, not for core boosting. According to its definition, DMIPS/MHz
>> actually decreases with higher frequencies. However, since the CPU does
>> not support AMU, and no elegant solution was found, this approach is
>> used as a workaround.
> Are you sure?
>
> [    0.570323] CPU features: detected: Activity Monitors Unit (AMU) on CPU0-11
>
> So activity monitors are available. Not that what you have here is not
> useful, but this comment seems a bit... surprising.

Sorry for the false claim, I was looking for AMU at /proc/cpuinfo, which 
is not there. But it did not help the scheduling somehow. Let me have a 
look at it.


Best regards,

Jiajie Chen

>
> Thanks,
>
> 	M.
>

