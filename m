Return-Path: <linux-arm-msm+bounces-94011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PK4Ad3xnWk+SwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 19:45:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7534B18B8B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 19:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C302630BA42E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 18:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A611F9E8;
	Tue, 24 Feb 2026 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="KUeOs5ER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE32D541B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958729; cv=none; b=ZyDWBHImR/ZEM77RYnwObTJZk9JGZ8TJTvgNUCZKVwgTBGXozkgIb7zBrac7f/u/sxDwh7PO/bfW5nmC84g+HQ0RASCjaQdZTki6gIyuQHsEoEEnyyCkMMxW1Z/4P6Ns/lpREmVNy4BoTvLPb+qHlmtq/hCoFxKud+POWjEyfN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958729; c=relaxed/simple;
	bh=SqolAWGlUuLI3GWRT27Gw5TF43c8uynCsM1+ZmdyY0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUPA00W0+zOZiMIPLUbc4+LSVy2wlTpn4JGIe8M5YmsLAYzeefZVHHfkLKBNkdHTFJuXt6sMwP4BYSQXrJ2c24uQS3eP/i7UmcTqGRqYiUm/hYFkNK+gALdOmZMS02nS8cnnCxemBmFPWKhpBtBT69sDusVtxoJoe30S8I7NJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=KUeOs5ER; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ddd8b949-3f73-4e3d-90b9-be95e859f3b1@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771958716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFvAN+eThWLRnldrhy5N9eq98qVVFyFFadQtYFCknE4=;
	b=KUeOs5ERjE4CmcrKHoSDRiDxz8WcjSY7WPUhlSjBy9OwKiP2QuHdI20AQstwce59aslGXa
	ZaFZB1ldfe8hG947Z6XZkTCoWBzk6YMy2r07pha+8ToOvPCHerrlQEna7O4GI8L+rv8Uig
	srLDuurRuY9eQ0/ejTGLgsrh6PcsKXFWFe867T4VQi3T26oAeu+vWC16v8wpJfVDomNfdi
	sFsfEp8nrXQZHriQpvcf/+dSCPYpQdQwnz/dSbdzx3w9uC04gjampRnnRTQHRsdDTbJCDE
	nkYLGN4kR5mINub2UcTyMCZx9tsx0ppZ8+39PKlBnKPF5NGeMrfXvlaUn2Jz7Q==
Date: Tue, 24 Feb 2026 15:45:05 -0300
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <jup7hphwpa754gyhtcahz25glecp6ctpuxcwzvco6wrbokvnip@quw7hrauahsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94011-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,google.com,lucaweiss.eu,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 7534B18B8B2
X-Rspamd-Action: no action


On 2/23/26 5:03 PM, Bjorn Andersson wrote:
> On Sun, Feb 01, 2026 at 05:55:03PM -0300, Val Packett wrote:
>> The changes introduced to handle single power domain platforms have
>> swapped the info pointer increment from num_pd_vregs to num_pds, which
>> would shift the info pointer past the end of the array for pronto-v3,
>> which does not list power domain regulators in vregs.
>>
>> This showed up as a difference between GCC- and LLVM-compiled kernels
>> on SDM632 devices, where only with LLVM one would get the
>> "regulator request with no identifier" error, because the out-of-bounds
>> memory ended up being zeroed. Fix by skipping the increment when there
>> are more power domains than regulators.
>>
> Is the error only an error print, or did the thing stop working as well?

It's a real error. Likely no one would've bothered debugging it if it 
weren't breaking everything :)

It was a blocker for allowing LLVM/clang builds of the msm8953 kernel in 
postmarketOS, the whole reason to dig into this was "switching to clang 
breaks the modem, WTF?!"

~val


