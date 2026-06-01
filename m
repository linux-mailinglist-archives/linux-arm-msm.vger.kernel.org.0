Return-Path: <linux-arm-msm+bounces-110652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOVLJdC7HWo/dQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:05:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FA623008
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88D86301A0A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 17:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8EB3DCD94;
	Mon,  1 Jun 2026 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="XoJYBb7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cheetah.cherry.relay.mailchannels.net (cheetah.cherry.relay.mailchannels.net [23.83.223.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC73DC4A2;
	Mon,  1 Jun 2026 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333514; cv=none; b=Si2yzygH3BDMvycGYpabIIzzZtVwi2cQFIYT2f/QWpc9EIWwsfqQElXFDlayJcfSLuox+I3fSME1P0iO1rcnrfbgCblajV4f1bPYb2/yQQ8wqXpTHCqSPKrYNAN67bkOsNN/0KB0ltQr2OHUHnUHg0mkW7Y3gR/vPNP8sNNte74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333514; c=relaxed/simple;
	bh=o9/3t5aWbbAT4sGsBTZI/+VJf6LBvxpKJ80lKzrLliU=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=pLbWaRMSU1a7+EoWHIj9h81I6/sIgXkFXTlsSLigu0TXhqQSHXhNJtdTtinmfjRjhrM1mIqI2gQWtfqSxig5R0DG7QbiXRrU37vB6t6cz+iAtnZ7CsW6RfyVkp7m6bTf1Omvjkix5FmExhTOP37Phq3qBSFz0IezweR7PymfTrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=XoJYBb7H; arc=none smtp.client-ip=23.83.223.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 113028C2B23;
	Mon, 01 Jun 2026 13:36:58 +0000 (UTC)
Received: from fr-int-smtpout29.hostinger.io (100-103-80-215.trex-nlb.outbound.svc.cluster.local [100.103.80.215])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B4ED48C2BB9;
	Mon, 01 Jun 2026 13:36:54 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Bad
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Towering-Tart: 49787cab7e6f26d6_1780321017667_4149070711
X-MC-Loop-Signature: 1780321017667:3849519496
X-MC-Ingress-Time: 1780321017667
Received: from fr-int-smtpout29.hostinger.io (fr-int-smtpout29.hostinger.io
 [148.222.54.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.80.215 (trex/7.1.5);
	Mon, 01 Jun 2026 13:36:57 +0000
Received: from [IPV6:2001:448a:c020:315:d8d9:5955:e1e1:fdf6] (unknown [IPv6:2001:448a:c020:315:d8d9:5955:e1e1:fdf6])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gTZkS5vY6z2xbP;
	Mon,  1 Jun 2026 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1780321013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0eRaTv1LFHSdq+CnYjSAChuDEys2xywHPYRW1l131U=;
	b=XoJYBb7HLM5cEgOvFYynrBpuowCLbNp0nGP4uZhJ7EnBKpp/pdxqgknCRuO5u3wJW8k1K6
	eSJ6JJtA03NyAh0If/JuoRLBYHz9ofmIzCevOn2RoGlUSMPM00lTPVgg/pX8e8kgGBYSyF
	60FaO/akpjwEoYrIWN9efHWsg8pwYwhRovax8NKg+BjKmNxA/kzE/7GZ3nqMzhV4aDrAQ7
	W5mct+/cn+yiFnKXxdZFv5aL7kLMIyRB0ilJ6b4yaFKfiTgEbNN2TSJD/sJc1uIoAQbpn6
	IjZKk+RMN4ClXnWnauGjhl1re2k3FdCMdSOO5AEgKgZnyEfohF057wsKd6Siug==
Message-ID: <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
 <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon,  1 Jun 2026 13:36:48 +0000 (UTC)
X-CM-Envelope: MS4xfFfNaEMvPFTihY0Ico06EK6b0IgvVdL5S1AMJ8bfvfwUl0iIAAURtEPrrQUKgCmmr41byoNMuMggKQWSeUAvAOZsXhxmwI4kO00FkKbW6Xo0czx2jcT5 SkgYN7Z/Spm6jfYqXP/7srl7p9fAddVnD6vhIyg+wp+6+BEueZ4XD6UihlSe2x39Z3edGA6DPBU+bUHydvX79XmOCdgObfV2zSb1bYq+kT7Z0l3I23+m8kZX Ke+eZEUihl5im1RZn/QH7sKPdJR4c982Nep/RxIyyUfeUtz/Jp9SYdzXlF/iycy5UR4+/71ESw8QQQ2STyh7Um3XFH/W+eX7i7LSpWhmG0YTrwaEP8Q3F8EO /s4s99DUmv65/lObT3QwNuBJcaOCqdvU9F/DD0a7xNAizP4IolJ5GVUy67hX+IbBzVsXvmwqBO+S9twlooXfub4MQZFsmhnMacAUCGq4t1GrifVuW3IrLQEN JKGi4XMdTgknlw7xQuDB7kHQut1Jx0Vo6fmJRV7XtSrw6uYHqQhiaJumhY/Hn2cIpc7xCNARWQzanhskOx2iAAB149WeyzdayoS1w6mZFjYj8o76oQqgATSV 7mPo8aSwoz3YA9IO0tTLHqYVN/xjKcRRXk6HvygqJxaEhLMfqKKOoOydIkGBGB+J2jSvCVPXBRg19KncCKp/9jND/aMsO8MC0vzPNuCy9PW6TIfAIzij6UIH b2pBNJlaVJ7tOP3RQpPzaG42CUIKJaqRpaHlzgI02bRqliC5PmUKdndD1prhgOSrB55/5IkwlytBDgIKfARI0TTxbbM4eWly
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=6a1d8af5 a=sFzhlXDghRqO5QIJeS1uNQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=h6FRIkA3AyYJ9ISumXAA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110652-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 357FA623008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 6/1/2026 6:38 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>
>> Add support for the "qcom,rpmcc-msm8960" compatible string to the
>> RPM clock driver.
>>
>> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
>> rpm_clk_apq8064 for this compatible.
>>
>> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
>> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
>> ---
>>   drivers/clk/qcom/clk-rpm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> On the other hand... You have added APQ8064 strings as a fallback. Is
> this change really needed until you actually have SoC-specific quirks?

The fallback was recommended by Konrad in the initial review:
https://lore.kernel.org/all/677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com/

As for SoC specific quirks, I don't have anything planned right now 
about it though...

-- 
Thanks,
Antony K. S.

