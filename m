Return-Path: <linux-arm-msm+bounces-111544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3RngBjv3JGrLCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 06:44:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FB64ED02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 06:44:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=packett.cool header.s=key1 header.b=bSk7wk1X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111544-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111544-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=packett.cool;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7738301808B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 04:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A41280329;
	Sun,  7 Jun 2026 04:43:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19127B35B
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 04:43:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780807409; cv=none; b=abKiCAlNnVRgem28utr3aXGm9ZB6P5gEreSS++TFcyPY7etFLqI4P70moKmLZVCRDzKHsA4dY5JPtjAmiWR7vTgIrlzq5Xy7AqR2r5ff/mwRSToxVKQALTqZnRS50cNg1SkWcarPyoQYpCHJclXgMWmPyV6M/aMjSMMK18ddGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780807409; c=relaxed/simple;
	bh=Dd9Jrs9HlP7jZkQXx3mkWpkdTCHX2H4RXixCJvaWed8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChbcpRc4e4r6u4kIR/eVkJ98P+kYo7cy6NdPiFS7zvERYG0hCTuwEzaGnbE2cuxELQa/nwYesk55NjkPnluqkVyVecie9rSpUsAtb62D/Cs1VQo6PQZRwCTXFb2mqBoVmiyRVvHAaGkXYUI4RetEzJNkvQlAbLvhWz+TFjY/yrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=bSk7wk1X; arc=none smtp.client-ip=91.218.175.188
Message-ID: <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780807394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7joSm0+uHvv2hAYIoyujknuutXHNZcAC8aA6ciTS3Pw=;
	b=bSk7wk1XQkNAGQS5xfIVD6KD97lK+TDYwZFkcvMaQJ8fIYR/M478GG8zX0a6cdGocG6XPq
	6EJdcuIiLtKtkGLGMuJpKUtl2y2hnTNMWIMuJU7qt9qsWRVJCPjI3eo948x7NP1yeROr+w
	uuUiDcuD4fzHTVjyXKh6o0J2R4VTjNb4TLUZwYZlqUrVtNulDa6XHyFm6xfqpW0fmgeeno
	L83bhyPH4YjLgP6LziKuLVl4BwADxArL191Yfd0DsEZZAL1T88FZJvvp8pVx8FmhU6K4p/
	JqAapF+fQDCbnhDvgU2MzuegJEmhtAm7/R2rJo6zfl0KaIJqPwqpjTOveb1Gpw==
Date: Sun, 7 Jun 2026 01:43:06 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-111544-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,packett.cool:mid,packett.cool:from_mime,packett.cool:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 524FB64ED02


On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
>> Several qcom clk providers currently have a sync_state helper set to
>> icc_sync_state(). With an upcoming change to the clk framework, if
>> sync_state is not defined for the device, then the clk framework sets it
>> to clk_sync_state().
>> [..]
>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>   
>> +void qcom_cc_sync_state(struct device *dev)
>> +{
>> +	icc_sync_state(dev);
> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> internals. You might need to set drvdata to desc.

Hmm…

Currently icc_sync_state does not seem to use the dev argument at all.

How would something get messed up, now or whenever icc_sync_state 
changes? o.0


Thanks,
~val


