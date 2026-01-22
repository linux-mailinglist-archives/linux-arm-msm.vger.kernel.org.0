Return-Path: <linux-arm-msm+bounces-90252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJfsDW9scmlpkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1266C6CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA53A3123F93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6809B34B1B6;
	Thu, 22 Jan 2026 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="pbSCKOTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634AA314D25;
	Thu, 22 Jan 2026 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104022; cv=none; b=QXRJCR3Om4OhhyPQaFU+rN8bi5JMq02qQstFS4gFJuAc13SR2APy9U3g1UOLWwGImZQcuHaTi1rk2XwtG05CLhHlzuXuXaDAUcxyT/RoemFx5tCLxb+jZ5ZyMFbe9d1BzCb2koOWR9tosPIiiu0f9FHtegwIlES4UmMEbfDuirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104022; c=relaxed/simple;
	bh=qiBP/4SRdmMQYLKgNzGWnYwT8x0hk6ckI0/MKlsjmDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg8vnwfws5smOjaDEkz4CoMWQzxPM8zns91H/ShDrxKewpRtaQrZ0U/Uxb+4b8FNF5HPYKZKdSQ1e9mC7y3mQ4KlScArXT1BXBS4kUMvHbM5pek0xLA8zlk4GrrKi6vq6bAN05DROtRtHUFX5TNanCKtjKCuUARH8z/Ld/27/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=pbSCKOTj; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LMErJ2CE0Kf7FyhBx2/ovQ4jJOaOFaB/canwUpCX3WU=; b=pbSCKOTj1XmQYzL7ri2ysWeJ03
	Az/oxU4OrTb1CTHoJ7XVnLJQOnIBwXoF03Fbg99irpASrx87b3KKYYUOkA+He9VT6ND8SKcx9XabL
	DoikLmsEiQZKMcgSiZYo8vCmOj4RyJEMubnnnA9FQvBJw2m2ic2KwTVSGAttbEklQ+1U=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1vixdH-00000005wF2-05uX;
	Thu, 22 Jan 2026 19:34:07 +0300
Message-ID: <f0532740-473f-4e2a-a71b-b28357f752d5@minlexx.ru>
Date: Thu, 22 Jan 2026 19:34:06 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gianluca Boiano <morf3089@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
 <20260121203005.13529-1-morf3089@gmail.com>
 <a52ea93c-537e-4234-869f-50cb625e47f5@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <a52ea93c-537e-4234-869f-50cb625e47f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[minlexx.ru:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[minlexx.ru : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90252-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.982];
	FROM_NEQ_ENVFROM(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[minlexx.ru:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C1266C6CA
X-Rspamd-Action: no action

On 22.01.2026 14:40, Konrad Dybcio wrote:
> On 1/21/26 9:30 PM, Gianluca Boiano wrote:
>> On Tue, Jan 21, 2026, Konrad Dybcio wrote:
>>> Why regulator-always-on for l3b?
>>
>> This regulator powers the touchscreen. Without always-on, display
>> initialization fails during boot. This matches downstream behavior.
>> I can add a comment explaining this if preferred.
> 
> Is there a chance it simply needs to be power sequenced in a specific
> order vs the display itself? (seed drm_panel_add_follower())
> 

According to my schematics for e.g lavender, vreg_l3b_3p3 does not power
anything directly controlled by HLOS (Linux), it seems to be connected
to p-sensor only, and goes to bottom board.

The change is done by vendor (Xiaomi) and as far as I remember is there
for every xiaomi-sdm660 device [1].

I'm guessing source for this change is [2] and this patch lacks my 
sign-off and explanation.

Does this work now as is without reordering vreg_bob to the top of the
regulators list though? It did not work in this form previously.

[1] 
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/commit/b16ba644a26986cc4cc3cf526eb497b9fa91a043
[2] 
https://github.com/sdm660-mainline/linux/commit/d54c8cfe3d76fa309b7e71fce1973176bdc095dd

--
Regards,
Alexey Minnekhanov

