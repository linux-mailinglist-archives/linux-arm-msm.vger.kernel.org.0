Return-Path: <linux-arm-msm+bounces-119272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKVZLuKPV2p0XAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:49:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD375EF73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119272-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119272-lists+linux-arm-msm=lfdr.de@vger.kernel.org"
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA7F13077128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513A12BEC5F;
	Wed, 15 Jul 2026 13:35:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147442D97B7;
	Wed, 15 Jul 2026 13:35:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122524; cv=none; b=myB8vQ9fByejlgWneZFN0m7pTCkCKhwUWZLd7+GCqweKjuAA/NS+i0KRMGW/0I5CJD9kpJtvgx55pPIVNFn4e7X6uriQhVbG+Tl5cWYo1NNsz7xt/Nq4aDxgH3nkSLkz3wiuP0omFpJFJu/0L3TOZWvN7eoRraBXgk05Yv0YX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122524; c=relaxed/simple;
	bh=S/3hecLtgGPTNwjB5VbeiEgRXAloznJD3Td8NWMr3cE=;
	h=From:Date:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHcLOpFbsWYTa7HB72E99c9tleHIbEZUXezriwxuZpzKQKmSOzJ4yEgEScCBhBlPBqBr0oHBLBCpQIIvio4Fqsp1wZihI/YXCl3ttbvXTSCXfTv0zjFF8v707Y8mWbWeIhsG78ivFhbrFdO8HSZ02IbdwaMZc8/VoeFF/0yzA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from 0002-qcom-geni-drop-reply.eml (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3AUCPjFdq8fMBAA--.1841S2;
	Wed, 15 Jul 2026 21:35:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Wed, 15 Jul 2026 21:33:34 +0800
Message-ID: <20260715133334.2-qcom-geni-drop-pengpeng@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] soc: qcom: geni: depopulate children on populate failure
In-Reply-To: <alKIj80YwTj0pydP@baldur>
References: <20260616005118.5108-1-pengpeng@iscas.ac.cn> <alKIj80YwTj0pydP@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3AUCPjFdq8fMBAA--.1841S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYz7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
	CY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
	CaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k2
	0xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUozVbDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119272-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:from_mime,iscas.ac.cn:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91DD375EF73
X-Rspamd-Action: no action

Hi Bjorn,

Understood. I misread devm_of_platform_populate()'s failure and cleanup
semantics; the GENI driver does not need an additional depopulate call.
I will drop the patch.

Thanks,
Pengpeng


