Return-Path: <linux-arm-msm+bounces-94956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIY1E6GdpWlvCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:24:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031D1DAB99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D34E305F3D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BB13FB073;
	Mon,  2 Mar 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZYFf1xaj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369473E7163
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460912; cv=none; b=YVPt/V3ZOHgsenw3ea1CnFW72jVgptPM0SVUENDmNiN5dHjFW0IAWSaU74vgXmKKbJEF8HgizpXtR0LQKPVaj05/+E18eFk2YQAS0uZKPk9QBecZMSdqvYV0NuieJwSY0unApLxkgIORzQINVcziBtTiBinMsXiDKx2aracL1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460912; c=relaxed/simple;
	bh=MRsB+ggb9gY6OTnRsgy4soOGBpDiwxz0KPu+0ZYKyS4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RORLump4Bcxcin348eAoC2zRtCi/I8EBnG+Mb95I6F2wrxb0XgEXzRQ2ACt27tYZWUUF19sJbMfN+avwnCiV/GnD4nRu7jZbiKyRZIBp+j9IRHqeM0YFYNH9nFykCFc55twbbj0oGwiDtttdrC69UvsCGbtciCS/OruWJotRsoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZYFf1xaj; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772460908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7s+ZulK9w2XgyNuxI+xCHbmVgtE2eA3P4tLtW8NCy2E=;
	b=ZYFf1xajMxKVCniWPHlKnuWaSfG0ndZ7M1ifSQ9fG/pIAngImahqbQRGpeBreH9yBQYoKr
	YpUGSIR2JIvuDt2kqWmp77JWoEkMXOaCfqYX/L/okesrgAVaFiksLKKSOPY1B5t9DjoNpl
	HGMGT2FxTZKAIo97ZdInDWsp8V8KTjo=
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] crypto: qce - Remove return variable and unused
 assignments
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <68c63578-ff12-4f4a-86a0-212c2a6adfd6@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:15:02 +0100
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <380D92D8-9451-408C-B9D0-C2A46BB0F1FC@linux.dev>
References: <20260302113453.938998-2-thorsten.blum@linux.dev>
 <68c63578-ff12-4f4a-86a0-212c2a6adfd6@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 4031D1DAB99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94956-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c15:e001:75::12fc:5321:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DNSWL_BLOCKED(0.00)[100.90.174.1:received,2600:3c15:e001:75::12fc:5321:from,95.215.58.188:received];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DWL_DNSWL_BLOCKED(0.00)[linux.dev:dkim];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2. Mar 2026, at 13:47, Konrad Dybcio wrote:
> On 3/2/26 12:34 PM, Thorsten Blum wrote:
>> In qce_aead_done(), the return variable 'ret' is no longer used - remove
>> it. And qce_aead_prepare_dst_buf() jumps directly to 'dst_tbl_free:' on
>> error and returns 'sg' - drop the useless 'ret' assignments.
>> 
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> drivers/crypto/qce/aead.c | 12 +++---------
>> 1 file changed, 3 insertions(+), 9 deletions(-)
>> [...]
> 
> This could be made much better with a DEFINE_FREE()

I'm not sure this would be an improvement given that 'sg' points into
'rctx->dst_tbl', which is intentionally kept alive after this function.

Thanks,
Thorsten


