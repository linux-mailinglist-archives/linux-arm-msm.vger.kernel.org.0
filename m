Return-Path: <linux-arm-msm+bounces-30112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548D96503B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 21:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A9F31F221CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2551BC084;
	Thu, 29 Aug 2024 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXnTYe2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552A1BC070
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960809; cv=none; b=nO1+LFSknQcaCrViomM8Ncu+xd4atyk3yiPM0xRPFQWLvFiZaOK6r7vZJxAbyVuEJNxVD9Xb4mMdANS5Pcr/mTlAGjhJDwIM3KKnAtFNtyiz6BKBbR+FISecErcDDp01c9t9HG7oTtDEvvxy8mpD+sNKSmsU3/9GyO0PlMDiRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960809; c=relaxed/simple;
	bh=xjo6xE95/L4xgY83ZcPoZzNMlqlD3HD/nseN0UBMbks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtefTgL5CKCcxjMaOesTqu786T3XpMrIvbP4k8L+4NRgZPUBlVqxqkIVfAA/VdEGZ13ZSX0YUAY76S8kWa2z/NAd0kHb6nGxCNIgS93YEs3Oda+30+eyRU/LG4RU1ojffspXtyHqzqehRtzshkPAY7N3cbLm+C/bTecuxKYsN+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXnTYe2g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF01BC4CEC2;
	Thu, 29 Aug 2024 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724960808;
	bh=xjo6xE95/L4xgY83ZcPoZzNMlqlD3HD/nseN0UBMbks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXnTYe2g5t6g0IYQfZzIOoRUDL5g+p97OsR8OCbz0pRxSO2MFH/3RrQc6cVa4zHAd
	 wmmR4kJtXCL+5J6/e3YAOFwkUYHtOqGESst62S0fCcs6C0W55wncDzDnh0YlfQ6dBn
	 BKlXcNOOEMrWQourvYwHWc+D2qvg9pxpott30lb8K+nhbTbNfIHESM3Q2dhGK3LDeq
	 Pt+woW9Y/MGknEEB/+ZNenmd62fIWzhfQPvr51KmDI4whcZuTB2AqwluJXiAF93BK5
	 BUZNOq7SQ5kg02K2rL28YUlrCdjsqe6RYsKn1HCtVuPfZtBilghjMZHiFHSbtcHLJ4
	 jY3/ZhVX1zrTA==
Message-ID: <2dca6714-971f-46d1-9a72-511a276f6ded@kernel.org>
Date: Thu, 29 Aug 2024 21:46:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sc8280xp-wdk2023: dt definition for
 WDK2023
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Merck Hung <merckhung@gmail.com>
References: <5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz>
 <910a53f7-af59-423f-ade2-66d53ddf0538@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <910a53f7-af59-423f-ade2-66d53ddf0538@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 6:37 PM, Konrad Dybcio wrote:
> On 29.08.2024 1:47 PM, Jens Glathe wrote:
>> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
>>
>> Device tree for the Windows Dev Kit 2023. This work
>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>
>> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>>
>> This dt is more or less deducted from the Thinkpad X13s.
>> It contains a lot of guesswork, and also a lot of research on
>> what works with the Windows Dev Kit.
>>
>> It is in use and under development since May 2023, pretty stable now.
>>
>> Signed-off-by: Merck Hung <merckhung@gmail.com>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
> 
> microsoft,volterra

sorry this one was called blackrock, volterra is a marketing name

Konrad


