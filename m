Return-Path: <linux-arm-msm+bounces-89830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIKLGFVmcWmaGgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:50:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD25FAA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D723070C20E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD0942846D;
	Tue, 20 Jan 2026 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT5s/7+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E83A8FFF;
	Tue, 20 Jan 2026 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912219; cv=none; b=iF/QwP1L0uLXuhDraj2QJzK0sggkgL53zo/FBITp7b43bU8iNueFWoGSJX2nBzgwZ5xNqLg35gwINEith84i8VX3Cmg9YCmjtLFIpTCsOSrraxZfib+GAAv+Hu+hTvrLhb9Nd1J1JVG0cZHahaUHDUDWDUpn8Kp9Rw3wfNWw6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912219; c=relaxed/simple;
	bh=xBs/MwE3PqTwhLqA7Q8KYvDEWAqMaIzPGGNLMJe5yOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IH/Fj1ripwKK8TIR/zd+PX+t7vNmhsUdCHTXp22yj6DvM3hl0qeSPaVWoRaHxQThmhTL+QvWAaLrJLCRjLzfAEInqXYThooOtlI0ODMV9niwsRymeXKqwXVu5IRYXg5qNfFHRGbQyWFME4lgRcBw/X0Fzrw9qj3sXvLYBZkgc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UT5s/7+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0E9C16AAE;
	Tue, 20 Jan 2026 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912218;
	bh=xBs/MwE3PqTwhLqA7Q8KYvDEWAqMaIzPGGNLMJe5yOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UT5s/7+BdcwGYFN3XpVEaTOIu6U/5Yt59Xdx3BihSaQASRv3Nbi3R+Hzha1frQuie
	 f0QYK3CWvcsbZ/ESYSA7S9+1+qx0qV+4UORENMQtqnX/L58dzxnSXozdPjMJ1YPJqj
	 Vypp4jUjbaUGlGre1lkLHhiawj8WWX792PWtxa1ntu04QNraGDnj3elr36LIwNpHrO
	 rORK/koYljxFrZ1E7M0ZRq7CB3R6FTq7b0WCVa2+gILOSEC72IVa1vQWV1WBgCW71b
	 702zAA1Ojhe00ox/lIzxazo93HTkSD2RyDYqk3MAU61156mRciN8JUtztJWNW53iDm
	 s8Jd/3CEpTz8A==
Message-ID: <bdc8011b-6501-43e5-815b-a981df665e03@kernel.org>
Date: Tue, 20 Jan 2026 13:30:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix
 iommus property
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-2-sumit.garg@kernel.org>
 <20260116-transparent-dexterous-nightingale-c029cb@quoll>
 <aWo0t1EoVhStmOj7@sumit-xelite>
 <6020af2a-5baa-4594-8cbc-bf7241f0128e@kernel.org>
 <aW9yCK0rPjRcqplk@sumit-xelite>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aW9yCK0rPjRcqplk@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	DATE_IN_PAST(1.00)[35];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-89830-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CCFD25FAA7
X-Rspamd-Action: no action

On 20/01/2026 13:16, Sumit Garg wrote:
> 
>>
>>>
>>> There has been ongoing disscusion related to how stream ID associated
>>> with different translation context can be represented in DT here [1].
>>> With that only the secure bank stream IDs can be properly represented.
>>>
>>> Here I just followed the approach taken by Adreno GPU bindings for the
>>> iommus property [2].
>>>
>>> [2] Documentation/devicetree/bindings/display/msm/gpu.yaml +82
>>
>> Such justifications are pointless. What about commit msg which explains
>> why this was added? What about entire public discussion happening with
>> this patch? What about all previous revisions of that patch and
>> discussions leading to this piece of code? So you just found few lines
>> of code, ignored entire background and any other arguments, and copied
>> it here.
> 
> Looks like you are mixing other patch-set with this one.

How different? You found some old code and use it as argument that you
can do the same:

"Here I just followed the approach taken by Adreno GPU bindings for the"

so how I am mixing patchsets in my response above?


> 
>>
>> That's the approach - I found a piece of some buggy code, so I can do
>> the same.
>>
>> Again, we discussed it 2-3 months ago for the same patch and I gave
>> exactly same reason why this patch is incomplete.
> 
> Sorry you are just mixing different discussions here. I am trying to fix

How am I mixing? Exactly same approach was posted for other SoC. I gave
same comments. Same comments apply here.

> the SMMU stream IDs for Agatti SoC which listed secure bank stream IDs
> incorrectly.

You explain what you did, but you did not explain why or how I mixed
anything.

> 
> And this is the first version of this patch only for DT bindings fix for
> Agatti, there are no prior discussions I had on this aspect upstream.

I did not say you had discussions before. I said exactly same problems
were being solved and I give here and there exactly the same feedback.

Best regards,
Krzysztof

