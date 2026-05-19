Return-Path: <linux-arm-msm+bounces-108435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CYnChMwDGpuZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6457B74C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04D09301223A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1342140C5A0;
	Tue, 19 May 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fEbPydJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC33EFFB6;
	Tue, 19 May 2026 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183627; cv=none; b=c8CxQtEC2s8Y31MMk5O833RG4L5qwmLvkTaXcbK+ZqDD6SlKRLmRZfO0xNah3SYoW5ZhriObDXVe6f8MR8LWaBKUmTQkW8gFSjC/MUeWbWwuVqFUfYd970uyUxd5OjeNl5XQEcPF+zpol75hE+1FJ7pC7l6jJakfjHM2gjKZxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183627; c=relaxed/simple;
	bh=kTV7jsMKuz6hKoUPEE+eG+zW56mh8hnqnoEODE2jrmU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BrwaqUl2+dknWxB6YWOXCvq3yqhS+x+arxCMLC0omvdmZIzwSAuz2/BH6RrqtE9o/494LNnpPhHoQVx102RueX6qbX7kPC7Bci2//rughZnZeSCahRSl6FD0Oc+vwweM6swEpVRkhtCp1O8Nh2zAHQu+VVF3j/xJokoM54YHqLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fEbPydJF; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779183617; x=1779788417; i=markus.elfring@web.de;
	bh=kTV7jsMKuz6hKoUPEE+eG+zW56mh8hnqnoEODE2jrmU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fEbPydJFHsKrAoI0UiJG4kNQ9O3n2d/6Nsjc8FUTRtmEgZVaUJJqzB9TcWWr6ssb
	 ZR4J/AHS2FMlAZyirdn/G7kZvJwijcHc4MyS9sMQPowkm/ah5+7rFnM3FrpO1SSJp
	 LFIUrrLYyP8gxJhcNQaxf4jfMqImcklq3y6aacO2Jjy9oEWXwePaxtdGy+OmfHhlG
	 +6m9FXW1FG890U8uE1lVsMTqG12hZHwHG/xSpDoZbxZRhnm2WtOYtygeapimv2EgS
	 2O9ercArgvLd27IvOmMmsPmZo+BPtkQv3x8XOv1cpQjPzkBQ/F7VsvX+9NIu9ZWB1
	 DMGZwopTZHbc5RlkEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mo6Nt-1xAOPC0g0J-00omoK; Tue, 19
 May 2026 11:40:17 +0200
Message-ID: <a979a727-1c59-4281-b9e9-2e5d582f14e7@web.de>
Date: Tue, 19 May 2026 11:40:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
References: <20260519023841.1995542-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Fix error check for devm_memremap()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260519023841.1995542-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o3T7uta1Grz5gGqLkebI2j/Wq2qLGUIqjFkn/7q6Rk0wYgiwJxw
 UZ92oyI6Z7AxXBZc2hr7ifdR4k0U2nx4FiPJ5Gyxk9Nic+Vx0XsSOoSrqtBZLsLwjP3nCJ0
 eGAnwYzP9GftrxioUCbTYnfHlgOFTZmYNxc4TJkhd3H0WwSnKwvoPDSOI2gR6snkgmXxtlP
 SzRJBoI17ZIGVAoaV/a9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v0srtoQiq48=;MyVTv9sJtGmKr6uQhbyo7EmlCQm
 +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
 kNlN4z8ejrn/d6/3v7oJ0K38zXjrbimIyItE=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108435-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C0A6457B74C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> The devm_memremap() function returns an error pointer on failure, not
> NULL. Fix the check to use IS_ERR() and return PTR_ERR() to correctly
> handle allocation failures.

Would a summary phrase like =E2=80=9CFix error handling in qcom_llcc_get_f=
w_config()=E2=80=9D
be more appropriate?

Regards,
Markus

