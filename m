Return-Path: <linux-arm-msm+bounces-98964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEJ7JdqAvWk4+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:16:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4E2DE6CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96298307D3CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC723CCFD7;
	Fri, 20 Mar 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="rJFQTNjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105E13CAE8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026229; cv=none; b=XYc3tg5jR7zykgfbDHplH+mToahdWad+uo7Lwl8kE8mgaTG4/YmpvEoX0H42ujT5pOXoWYcp8Ni6qTZsPfM3OaEbQC9bAEzUjazjDmCCNXlgT+WDdiZMt4fXj2CQDrrm8wOK4b9aHnS4HkP8azKp9DNzXKF8W3z0LL2WJeBvHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026229; c=relaxed/simple;
	bh=Gj1vtuwQXHR8UoUYcOrYnXzY7Cxk5iL7v70NyDYKxaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxJfp5wvUMYS44gTpUGe3FRvwawlkYmbFvRmgPlPRk9u1M1usOjehRn4wiuisRGlkuKYhEWq0zRd9xeu3lT2l847v3EssZrpkW9eWFZEotn4fmbpJH5sqIvULigSo5jsRd+gHO4VFehRzVgJ/rwK3uay3EmfZd2rCBCA5PkClLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=rJFQTNjB; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <4bbbebef-8a3c-4320-a2d8-f5187db2d850@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774026216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwecroZVjODs6pTedN26ECdEviq+g/i3AiPwlkMDrIw=;
	b=rJFQTNjBLoAdYfxmBhtJdesTK73gwyqAgh8WorG1RwYbp4p63tRkPFhaDnsTpQ8Uq/xNXO
	M9h6HzURzCpuCgfivuf2aIdjMSb8NXbGXc92NhPky5bhnE3MQSsQPxkr94Ki20a5kCFonv
	AqeRP+TzacYwJoFnqNPKbSYvM0Lf3N0zpUaHarqpmRTa6L1+Fai27FZnbudaxSDXf5DMSa
	LEhvbaiBDZZko8kHYpkqsTAajB0qpD27SkfpTrTkTPcFcnTz0PXbN9b78M+xIzrhyWbGyZ
	uVMHRVtLGyHo0OPtcFzn5Ngt+YEd0VIO2TR7DNG98vnlI/KNc6rkle5Nsh4Rew==
Date: Fri, 20 Mar 2026 18:03:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
Content-Language: en-US
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
 <8abf3f78-c994-4d05-81ea-ef54dd380109@postmarketos.org>
 <51f16009-5df8-4c3a-8fb9-28af73b8c04d@ixit.cz>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Casey Connolly <kcxt@postmarketos.org>
In-Reply-To: <51f16009-5df8-4c3a-8fb9-28af73b8c04d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98964-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kcxt@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3B4E2DE6CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/03/2026 18:02, David Heidelberg wrote:
> On 20/03/2026 17:56, Casey Connolly wrote:
> 
> [...]
> 
>>> +    sdc2_card_det_n: sd-card-det-n-state {
>>> +        pins = "gpio126";
>>> +        function = "gpio";
>>> +        bias-pull-up;
>>
>> This can probably be bias-disable I guess, not that it likely matters in
>> practise.
> 
> We could save few uA by just disabling the bias, as the card-det pin is
> useless anyway? Do I get it right?

Yeah basically
> 
> If yes, I'll switch it.
> 
> David
> 
>>
>>> +    };
>>> +
>>>       sde_dsi_active: sde-dsi-active-state {
>>>           pins = "gpio6", "gpio11";
>>>           function = "gpio";
>>>
>>
> 

-- 
// Casey (she/her)


