Return-Path: <linux-arm-msm+bounces-94377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N02HTkcoWlhqQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:23:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE31B2A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8DAC30775F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F78355F55;
	Fri, 27 Feb 2026 04:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lDRlqMaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408E3542E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166068; cv=none; b=HT4QQQIOzfyJzyv+6Hu0i7mQMoY9Gf7xTUc86QPOzIRKAb01zzTSwerVqLrrpVKLXC7SUBrKl2HmvSmcya7PW4y/hUN6mUhxaIkOILATbBIw5TnGE14YAowW2CZoqXCe0Sb2685KQnbeN8Rey+MWd4nsKd6wSVbrAVu3ib9GhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166068; c=relaxed/simple;
	bh=DjhCwJelsHxDZr2A9nbd6G55W14Jv0FPsNstLX/ZETA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8MzOLQ6NzHLuVygIXumoBitJGbqwQdMsLFLdmHnalXBLAXVomtOgdlnEqU0UoJ8u5p77OFFRhrR5nghtXdT/enuaAxnT/DEITi6GQIQIav1pLCdJ7KpQzD4K5qaFMZlHzAT0dJGZsYY9J1WG0jWss1KBX2iJXl7SkBeT8lEil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lDRlqMaL; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <4c8e310c-ab39-491b-9a39-99ddbc943b00@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772166064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9n0A5zUZC+lx+LR4fd6ULnk460On2lLPIMiPdwgeFyg=;
	b=lDRlqMaLbqiYTHS9SlFw+sFcgiORpu7H2cD6sR1nTRI1gsNlTLmO4wB2dHs6Pbo7D8W2mk
	Kt9mksvkriB37vvj7wanoVOd7H+HqRvthfYEIrdPtKN0II+xPrm3W3DRTr2WjQD4ynPgZ+
	TnyfS/guUR13OM8DzYZlBHujN5KyJIqm/ssSxWB3okq8dnaVaxoZ9mNbWmKEmkTOWv1gop
	UgLt0UKUV10d4klh4/T13svGl3atZYKKgB8rI3o4gfjoCjYo/r3cR9Yz0GEymtN6LjXqX1
	a8JMKTxhYjzUtucdRrUB+bMvHjJigVw1egwxqFqXm9v2V5a8oYnnvDNFvQjWDg==
Date: Fri, 27 Feb 2026 01:20:48 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
 Luca Weiss <luca@lucaweiss.eu>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260201210230.911220-1-val@packett.cool>
 <jup7hphwpa754gyhtcahz25glecp6ctpuxcwzvco6wrbokvnip@quw7hrauahsa>
 <ddd8b949-3f73-4e3d-90b9-be95e859f3b1@packett.cool>
 <mteufo3laiiuhcgbihxnossy4xfkxhct57mkav2fr4oxvaldp7@k6p7edkfgjt4>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <mteufo3laiiuhcgbihxnossy4xfkxhct57mkav2fr4oxvaldp7@k6p7edkfgjt4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94377-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,google.com,lucaweiss.eu,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EFE31B2A67
X-Rspamd-Action: no action


On 2/27/26 12:52 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 03:45:05PM -0300, Val Packett wrote:
>> On 2/23/26 5:03 PM, Bjorn Andersson wrote:
>>> On Sun, Feb 01, 2026 at 05:55:03PM -0300, Val Packett wrote:
>>>> The changes introduced to handle single power domain platforms have
>>>> swapped the info pointer increment from num_pd_vregs to num_pds, which
>>>> would shift the info pointer past the end of the array for pronto-v3,
>>>> which does not list power domain regulators in vregs.
>>>>
>>>> This showed up as a difference between GCC- and LLVM-compiled kernels
>>>> on SDM632 devices, where only with LLVM one would get the
>>>> "regulator request with no identifier" error, because the out-of-bounds
>>>> memory ended up being zeroed. Fix by skipping the increment when there
>>>> are more power domains than regulators.
>>>>
>>> Is the error only an error print, or did the thing stop working as well?
>> It's a real error. Likely no one would've bothered debugging it if it
>> weren't breaking everything :)
>>
>> It was a blocker for allowing LLVM/clang builds of the msm8953 kernel in
>> postmarketOS, the whole reason to dig into this was "switching to clang
>> breaks the modem, WTF?!"
>>
> Can you provide me with a Fixes: line please?
>
Oops, did I lose it at some point? o.0 Sorry!

Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only 
single power domain")


~val


