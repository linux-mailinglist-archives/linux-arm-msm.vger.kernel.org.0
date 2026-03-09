Return-Path: <linux-arm-msm+bounces-96197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGcKKq2jrmmbHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:40:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB5237411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 915FF303B944
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1643909BB;
	Mon,  9 Mar 2026 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EHb1PLnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFD37E2F1;
	Mon,  9 Mar 2026 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052689; cv=none; b=t1Mu6/agjWlmfC5PUVd6xGKKfyH0Gj5LgnffsAygE3NlIZuL/eh7SbIaU1GwC8BMNvPt4s/Cs4dtHQ6ThmC3XkS+UxLQQfxMRki6/zbzlHIH7GKWAAPSuBcdRBvUBWp30VV2XPMJ8LKahFEou5EndPkX3LZhu4nj5F7PodqB4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052689; c=relaxed/simple;
	bh=BqzA1te2B/7ynICtYnGZD9d8W0rdrXkSAJUR+LHByC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W35MiZHljKOhFXtO7r3wEzs5sVKU9n+x06YT4BuIzZ97TrKlQqo74xapZvLTwVO4d/AuN+Q0fa2hW2Xri57cEJq4K0hayLBFaWiOfNAcwwsg+lYIP/YrWGqbtVUf9mzttaVU0on7h7FFGf9gXUQvc8KQgH+4D2i/0DjbSWlEHNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EHb1PLnD; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fTtZY6w8Bz8kgP;
	Mon,  9 Mar 2026 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773052246;
	bh=BqzA1te2B/7ynICtYnGZD9d8W0rdrXkSAJUR+LHByC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EHb1PLnDwpAxWe3X/Tqx4oTYkMjBMSRcjyU3ouTxquc9pn/cmnHVULBTzp2ze6/lt
	 rVedYtXD4KOGK277ZGVdXatQ2mc08leVcJqCTKjOYE6qNGbazn3C8TuJZA12+qjrpH
	 xkHiTCfrn1C+INdcye8ESKU/cPb32RbMONbykDtrVLX5awupceD8TBlyBNJfuxcTPf
	 8xpnBqLIrN2gqShVSts+e1FLSSh4pJdDUBxdb2ayEPLIGgDkXz5NdzlrCLW2q3oKof
	 cQUPUJjwL+a5TZwQHcwJ5y7g6N93o5w0yXXrHkUREvcUR+GG2Wo3Zo9ZIiyPFXqhDH
	 SI4ynatXL0xRA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fTtZY69RJz8kYD;
	Mon,  9 Mar 2026 10:30:45 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fTtZY21Lvz8sbs;
	Mon,  9 Mar 2026 11:30:45 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6E0F86176B;
	Mon,  9 Mar 2026 11:30:44 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6e4d21f9-87cb-44ea-bb04-eb4f047f3ff5@leemhuis.info>
Date: Mon, 9 Mar 2026 11:30:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
To: Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177305224482.628484.15274903014256727451@mxe9fb.netcup.net>
X-NC-CID: r4sVEQRX2v8XAJUvNL3AqqEizskwt8cI3E0fmZuqnS/dRS/ras0=
X-Rspamd-Queue-Id: 23EB5237411
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	TAGGED_FROM(0.00)[bounces-96197-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,leemhuis.info:dkim,leemhuis.info:mid];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.930];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/14/26 20:26, Bjorn Andersson wrote:
> On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
>> On 19/11/2025 11:40, Alexander Wilhelm wrote:
>>> Currently, the QMI interface only works on little endian systems due to how
>>> it encodes and decodes data. Most QMI related data structures are defined
>>> in CPU native order and do not use endian specific types.
>>>
>>> Add support for endian conversion of basic element types in the QMI
>>> encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
>>> ensure correct interpretation on big endian systems. These changes are
>>> required to allow QMI to operate correctly across architectures with
>>> different endianness.
>>> ---
>>
>> Hello,
>>
>> I recently (next-20260119) started receiving errors on Pixel 3:
>> [...]
>> Since it's not well tested, I believe there could be problem with
>> configuration, but after reverting this series, no errors pop up.
>>
>> I would believe maybe these errors was previously hidden, but just to be
>> sure asking here.
> 
> #regzbot ^introduced: fe099c387e06

Looks like nothing much has happened since then – or was there some
progress or even a solution I missed?

If no fix is in sight, might it be best to revert this series for now
and reapply it later once a solution was found? I assume that's what
Linus would likely want here at this point.

Ciao, Thorsten

