Return-Path: <linux-arm-msm+bounces-109922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN+nJkkeFmpZhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 00:27:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECD5DD30F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 00:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668EA303282F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 22:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DB93C769B;
	Tue, 26 May 2026 22:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="RjUxyWNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7F29E117
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 22:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779834421; cv=none; b=oEh0cImgS0YWEk5DGq3HfRnxp0fE8+u+9JRTw/JycARegw98ikSlRFL0EteaLTRHeYToUsJhwzJLAKauD+ylsKvE9L1ElfOz+Vd8aiDztDvdHrL0q1S+zuo+XydozYLqBepzK6yQYsmhJI3Cg19chSL05VT/XshnEtfXwMcCO3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779834421; c=relaxed/simple;
	bh=HgY5Masn0W5/0NfnUc8THm8uwyfc2gbRIogqIK3E7rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LD9jkGG98merm8CGVchY74Onvco9L2wn29aN59we+flg2GDwpDBd2sxtk9VL/CXiczQgmfZFrClNtK2sim3uk9HKmhmcKR/akmgP/3CVQ4NFmPyYmlsqMZHI12fNYRSWW3fkEqcoSLEIHNxS879bEzVag+oYoPCe+B+NDFFFS48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=RjUxyWNn; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <133ced18-1aa9-475d-80d8-6120678bdde4@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779834407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FKKP3/izRY7pwM0mbrBoI1rU+sAJfmrdc5PGmqj3SQ=;
	b=RjUxyWNnJrOGazqvy+fYoXHQwS9CQs+m0AUI/nNM63JjDdpp9Q/V6LarTRaKDPOBS3/Buq
	hePwtP2kYgL33/bn8SaejFWswqAESJm7Z3qTiM2/cu8iXHe8I2u5zp47mDxdLdAMHZCsH1
	TkAGmkOm5MPo4LnVJbXrkp/Xz/pl7ltFZNlxVwTGzL8NcTVEyRCcjWc6BlGkNbl520yYtG
	6tJK6mSW/4NywhX11FJUhXIIWHEDCuRaiELtwY7yVAg6+JuDlySpRxsc1IBgWD1lJw66YK
	9M7uo27Euy8caPfQ7oP+Z3CX1jlMWNzKKzrTWyp12c7Hey4PDC+LQ1nlhl6oQg==
Date: Tue, 26 May 2026 19:26:40 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] soc: qcom: apr: improve RX processing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109922-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flathub.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: F1ECD5DD30F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/14/26 12:50 PM, Srinivas Kandagatla wrote:
> Hi all,
> [..]
> Srinivas Kandagatla (3):
>    soc: qcom: apr: Remove service from IDR before registration failure
>    soc: qcom: apr: Check response packet length by router type
>    soc: qcom: apr: Process RX messages using per-service work items
>
>   drivers/soc/qcom/apr.c       | 283 ++++++++++++++++++++++++-----------
>   include/linux/soc/qcom/apr.h |   6 +
>   2 files changed, 200 insertions(+), 89 deletions(-)

just saw a crash under apr_service_rxwq -> graph_callback with this 
series applied. Can't say it really is to blame, but still replying here 
because it was applied..

hamoa, quad WSA speakers, pipewire, audio playing from 
https://flathub.org/en/apps/com.rafaelmardojai.Blanket, crashed when 
opening pavucontrol (display froze with the pavucontrol UI already loaded)

<1>[577090.453413] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000050
[..]
<4>[577090.453924] CPU: 0 UID: 0 PID: 946838 Comm: kworker/u49:1 
Tainted: G        W  7.1.0-rc4-next-20260519-uwu+ #116 PREEMPT(full)
<4>[577090.453933] Tainted: [W]=WARN
<4>[577090.453936] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
<4>[577090.453941] Workqueue: qcom_apr_rx apr_service_rxwq [apr] 
(../drivers/soc/qcom/apr.c:359)
<4>[577090.453957] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS 
BTYPE=--)
<4>[577090.453963] pc : graph_callback+0x1a8/0x280 [snd_q6apm] 
(../sound/soc/qcom/qdsp6/q6apm.c:577)
<4>[577090.453977] lr : graph_callback+0x194/0x280 [snd_q6apm] 
(../sound/soc/qcom/qdsp6/q6apm.c:572)
[..]
<4>[577090.454086] Call trace:
<4>[577090.454090]  graph_callback+0x1a8/0x280 [snd_q6apm] 
(../sound/soc/qcom/qdsp6/q6apm.c:577) (P)
<4>[577090.454100]  apr_service_rxwq+0x274/0x3b8 [apr] 
(../drivers/soc/qcom/apr.c:535)
<4>[577090.454109]  process_scheduled_works+0x190/0x500 
(../kernel/workqueue.c:3323)
<4>[577090.454124]  worker_thread+0x230/0x330 (../include/linux/list.h:404)
<4>[577090.454133]  kthread+0x120/0x158 (../kernel/kthread.c:438)
<4>[577090.454141]  ret_from_fork+0x10/0x20 
(../arch/arm64/kernel/entry.S:842)
<0>[577090.454153] Code: f94026e9 910242e0 f9400e95 d37ced08 (f8686936)
<4>[577090.454158] ---[ end trace 0000000000000000 ]---


Line 577 is         atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);

weird, both graph and hdr have been dereferenced before this line..


Thanks,
~val


