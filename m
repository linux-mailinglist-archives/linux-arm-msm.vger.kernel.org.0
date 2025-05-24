Return-Path: <linux-arm-msm+bounces-59274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B517AAC2E4A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 10:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09D11A23227
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B9E1401B;
	Sat, 24 May 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Is6pALo/";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Is6pALo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAB4C6E;
	Sat, 24 May 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748076357; cv=none; b=ANLQnRFuOFPYCxbM/lU45U1aLCfGYeyf64F9MBuvCxrAgVWUgs85+DeWOvzFblc6ZDT0ewFtso25c3tE+PpQexNKSZkm7K9NQ6N4RhzhmhrTXEem5Jx358mmhABUJuLbTwY2MHQBnd1kF0ibmrWBmYxbMcaJqH9/2+F5mqc5Odg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748076357; c=relaxed/simple;
	bh=KDBfLvQWLsyqfbMU9TfUnr8OLjE8CuR6ZACyiRNkmWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uztoGN9XANeHJBd5VLV6VDwIZ5wV8/hV8IYGcla1e7WYnxXmYAanRpv6amr/aUWjI//2GH+vX3LIQaHmmYqDtCBsr4Iv/THlaHXufgf86YN6CgRwbxTfFczWyRST7o1/vlS+4rXK276Q6BTUbw7sWRQo4Gw302AzsM+ga4PL6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Is6pALo/; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Is6pALo/; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1748076348; bh=KDBfLvQWLsyqfbMU9TfUnr8OLjE8CuR6ZACyiRNkmWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Is6pALo/SSoVrDbPkVU6iHbPJPy1yyss4lb8PRPx9WgD5Y+ligqMs7eM8ONhY/aN3
	 u5qBXnHOwH1JbH1A6TfySdO7tUPiFLH5LcGSMxBCZW6c7LIRyrwz7mqEw0Q7Vac/kf
	 HhIn1gpWpM2rszFF4fI/bbGzoxULzCHY9nY8BVyHO0vgh/MIgEoG2rP+Rl84sQTY0X
	 qIhe1kJ0M4q2WgqCmCzxw7kQOfxSX/TEaFgGRHdBNmO0NJ18Vbvwds3anc4+JKSG+G
	 naaEhGvJv/DRFqhMYvT2IiJNghyVtaA9U43v7tNzQ2SOKU3NmWXyP5RGC16UBAhuSF
	 dDR8rp6LViSFg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 21A213BC977;
	Sat, 24 May 2025 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1748076348; bh=KDBfLvQWLsyqfbMU9TfUnr8OLjE8CuR6ZACyiRNkmWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Is6pALo/SSoVrDbPkVU6iHbPJPy1yyss4lb8PRPx9WgD5Y+ligqMs7eM8ONhY/aN3
	 u5qBXnHOwH1JbH1A6TfySdO7tUPiFLH5LcGSMxBCZW6c7LIRyrwz7mqEw0Q7Vac/kf
	 HhIn1gpWpM2rszFF4fI/bbGzoxULzCHY9nY8BVyHO0vgh/MIgEoG2rP+Rl84sQTY0X
	 qIhe1kJ0M4q2WgqCmCzxw7kQOfxSX/TEaFgGRHdBNmO0NJ18Vbvwds3anc4+JKSG+G
	 naaEhGvJv/DRFqhMYvT2IiJNghyVtaA9U43v7tNzQ2SOKU3NmWXyP5RGC16UBAhuSF
	 dDR8rp6LViSFg==
Received: from [192.168.2.87] (unknown [46.32.88.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 8A0393BC953;
	Sat, 24 May 2025 08:45:47 +0000 (UTC)
Message-ID: <70d48c3d-37e7-4c99-88c9-699699e941b1@mleia.com>
Date: Sat, 24 May 2025 11:45:46 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: enable camcc clock
 controller by default
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
 <b8b43344-0b8a-4e76-a8b9-1a1e2b354f4b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <b8b43344-0b8a-4e76-a8b9-1a1e2b354f4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250524_084548_154745_A5AFF5BB 
X-CRM114-Status: GOOD (  11.77  )

Hi Konrad,

On 5/23/25 13:42, Konrad Dybcio wrote:
> On 5/23/25 11:23 AM, Vladimir Zapolskiy wrote:
>> Enable camera clock controller on all Qualcomm SM8250 derived boards
>> by default due to the established agreement of having all clock
>> controllers enabled.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
> 
> No reason for it to be 2 patches but redoing it would be clearly
> wasted time
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

thank you for review, the reason behind two patches like here and in
some other series from me is a care about potential clean change reverts.

If something goes wrong for whatever reason (even in the untouched clock
driver), and even if there are more cc device status okay/disabled series
for any other boards, the split to a platform and a board changes allows
to revert the changes independently at any point of time in future.

--
Best wishes,
Vladimir

