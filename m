Return-Path: <linux-arm-msm+bounces-29277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9595B3DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC3FD1F222A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A030C1C6F7B;
	Thu, 22 Aug 2024 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe3Tqtkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022C17DE06;
	Thu, 22 Aug 2024 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326267; cv=none; b=e44tpfd+3fmnKxQ8u9Qx8OKlUF+cmyx60vXoDXR8laYx3JpL1oyN4vai7QGc495xT/x8g1vUIcIS1FNDyK/rJixGSjciZtB19iiMCjeySK/zO3VpTSVPG3KwUC/hdDR5X7yN0B0l9WwZgi4x5DzUg2MwHa2iZ6Y2HaaqTLwOUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326267; c=relaxed/simple;
	bh=gDbTL4GZRvQeDgNI3gcM09/p4LhAfcobcN6NTa3ZLBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxU139VIFBBLLfgT1QNf7RoCun7NK2tKPyo0fhxTn2MdFKc03Jmwvi3kWn8NViTywDn3VCoVHcM3T4OtIqfzIxRYyPWKzo0OOVBMwQ7HWVgH5SKRWptnnaANdgzhKnijcAiFrFtLJ5ypQ+9B7LedjiV0uTYmsm5hqvAavRCaVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe3Tqtkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E87C32782;
	Thu, 22 Aug 2024 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724326267;
	bh=gDbTL4GZRvQeDgNI3gcM09/p4LhAfcobcN6NTa3ZLBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oe3Tqtkg1IlHXhjmboLrWfO1WBSTFiwjBK9XuytGxkdmGjMAuGKZTq6MYcfkVzigh
	 BFwraNixJP8gULzt85oN9y6+JZcmBgzYTd0tkZIK+UDB+xNehayYFP/qh9fh9Lfntp
	 t0Y/o/r9JQi51HK3/+JLqVcNkDpKNfc/Uoj1Jz1PUhSUaCy9uuCQ3izys63VOro0iC
	 R22dOUDsuM+8fYhRL9UDbPxBtoul99TbdlI7+wtZ/OSPVMgzJaf15vZRQ6ab11wWEE
	 qPwaSWz16jUSe9inDqrUVB7WGSwJoCUvMBVCNAgw9USgFYUeFVglhXtZImYxG667HF
	 CmtE95KYH1NFA==
Message-ID: <7b8f488a-deac-4089-be7a-c0d76afca0fa@kernel.org>
Date: Thu, 22 Aug 2024 13:30:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: document hexagon based
 WCSS secure PIL
To: Gokul Sriram P <quic_gokulsri@quicinc.com>,
	q@krzk-bin.smtp.subspace.kernel.org
Cc: andersson@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_viswanat@quicinc.com,
 quic_mmanikan@quicinc.com, quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-2-quic_gokulsri@quicinc.com>
 <ticwyyycqlk2uqpiqckoqqnapqatw74s6f6tjqmmyt2d6siqqt@xxe2qdtr4c2c>
 <2b6b43b3-c99b-4aac-b1fb-24f6e5e562ce@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2b6b43b3-c99b-4aac-b1fb-24f6e5e562ce@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2024 12:47, Gokul Sriram P wrote:
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: Watchdog interrupt
>>> +      - description: Fatal interrupt
>>> +      - description: Ready interrupt
>>> +      - description: Handover interrupt
>>> +      - description: Stop acknowledge interrupt
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: wdog
>>> +      - const: fatal
>>> +      - const: ready
>>> +      - const: handover
>>> +      - const: stop-ack
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: IM SLEEP clock
>> What is IM? Explain all acronyms.
>>
>> What is SLEEP?
> 
> IM_SLEEP_CLK - Internal Module sleep clock needed for Q6 reset.
> 
> SLEEP is not an acronym here.

Then probably you mean "Internal sleep", although "internal" is also
confusing. Devices do not receive as input something which is internal
to them.

> 
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: im_sleep
>> sleep? Are there different sleep clocks here?
> 
> We have different branches of sleep clk each enabled separately.
> 
> im_sleep is one of those branches that q6 uses.

So this device misses other branches? Then provide them. Otherwise it is
just "sleep".



Best regards,
Krzysztof


