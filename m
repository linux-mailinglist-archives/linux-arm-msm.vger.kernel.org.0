Return-Path: <linux-arm-msm+bounces-32003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0897C7C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 12:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261651F26EFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 10:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B68519B586;
	Thu, 19 Sep 2024 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5hBkpfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E5168BD;
	Thu, 19 Sep 2024 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726740455; cv=none; b=tYLghYyn7RJLWN2IfowdQaUPbEDszUvuImQeHDXODXQbtftT0yKhFB1KQLnPIglq2s2H8IUSbkD7Xa92NfZA6L3YFE+Uwvsm3kATJS7XfBb3dWD5i36HxjHTi0AZ7IzDJSN14FaQIerfkveo8mDbCYAeLKIWmqp/g2+Gkk7PBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726740455; c=relaxed/simple;
	bh=tBBR7+8ZF6X4adQNOfOlakRM+GK+OiRN3rw2J04b8gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsnuzMeV8PNDDMgITIA4VTSzJwx9z7yRN19jiTlGI9ZdOlu7QWKaWQDe0/q1pLPyoNvOr9wYCcG075wqtwD8Q7gkCiczoWBvDKrU39J2KanL8aykqoqPaooMQeVGt+d0Tig5N1g15htlvuGuNWIspcfz7gnhNJbUzTnVEQXI/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5hBkpfm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40830C4CEC5;
	Thu, 19 Sep 2024 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726740455;
	bh=tBBR7+8ZF6X4adQNOfOlakRM+GK+OiRN3rw2J04b8gA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F5hBkpfmKRrSDFCRO6Jgr9IB7kbStucmIHlrz1W4BQ36EouETMuhv+WvdST/c0JTD
	 OOqP3eLjOR617dglTjEe81tVunJZtK3VJ2tgj29lAXhtZt37sh8Zns/WHDGGDvB8nN
	 EBeu7ncJ7A6FY6CZoAeb0EKrq480ZIkPE0sSoM1/oFhRHDS96MMcSSoGi2vlZZ1dRP
	 cUWGboKxdsN6FjcD/2jNWJQDiu2rAo/RzcLKp5+sV4NGOMyNIRONg5voCebnXDm9bO
	 6MXcrWlsOwoy3MLxTrOHeL32Fj6WZ1KQ5DkHTpoOJboOg0Ck7G2dR497eUj84kxn4z
	 eZgLMK+tJHTFA==
Message-ID: <2fb16b35-e6c5-4239-a745-a9dd7412539a@kernel.org>
Date: Thu, 19 Sep 2024 12:07:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] Affirm SMMU coherent pagetable walker
 capability on RPMh SoCs
To: Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
 <D4A2FKPTXHS5.3AHU7ZEKFVMGG@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <D4A2FKPTXHS5.3AHU7ZEKFVMGG@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2024 9:00 AM, Luca Weiss wrote:
> On Thu Sep 19, 2024 at 12:57 AM CEST, Konrad Dybcio wrote:
>> I only read back the SMMU config on X1E & 7280, but I have it on good
>> authority that this concerns all RPMh SoCs. Sending as RFC just in case.
>>
>> Lacking coherency can hurt performance, but claiming coherency where it's
>> absent would lead to a kaboom.
> 
> Hi Konrad!
> 
> You want people with the affected SoCs to test this I imagine?

Yeah, would be nice to confirm

> 
> Just boot it and see if it doesn't implode, or do you have any more
> elaborate test plan for this?

No, booting should be enough of a test

Konrad

