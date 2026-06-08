Return-Path: <linux-arm-msm+bounces-111683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4R9CBjVcJmqyVQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:07:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFEE65307D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:07:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=cC6g03sH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111683-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111683-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30A6D300B135
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F483839A3;
	Mon,  8 Jun 2026 06:07:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12E324B2C;
	Mon,  8 Jun 2026 06:07:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898863; cv=none; b=AywV7ovkph7lryHEIa6JXRmm8NLzW8ppT1efqlcY9ZunZNwSR8Fy8Sfsem4xtYes5Kgrh6XucxNpRdye2wVRkDaf7gKXAvFPLHuJUjBKD9uJcTmbgz9zlcKwDVqPC25p8UiC/8JJu2CRVpoDQg4H0svAb9SQAbW6o1rjc1YChE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898863; c=relaxed/simple;
	bh=+dcXv4zWRWzCmRcsErz8MQZtU9CNwLr2zjetIe+6/mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xn2AVMx6wEWrQ2FEEdJXgRvO9u4kupEAJzXP3YAOD8C8vv0aHOa7IgzKwUS6qEKpbdTJFbSBROKKpX6itwCek0LZXGB5+P+VGqgPe8cGA2zWt4lDwZpdNxPmR6mIvNnV9xsS1WDXHSKlUfOG2Y8HHuEsSpgeW7/GernjFPLCF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cC6g03sH; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780898531;
	bh=+dcXv4zWRWzCmRcsErz8MQZtU9CNwLr2zjetIe+6/mU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cC6g03sHSs7sp0X5XtqVYnhJz00Uw3zFpcwqUhkUucc6F0kHJCHwMQNJxLBtV4ddH
	 CAOXalB+zZrHkCubP+10Ybf8fcDusR7qJNzEoSHS+mi1S2hjID+glOPxE9hcKwlgyQ
	 wL4qXWKoA66eKfBt5qmagENkIzxnE01oQcxp6z47lc/OTeUHUXzeYqo/nhAJOxUIku
	 B5dZfirRuaT5Spp780ySds1KFEkboyCM0lRaxl+oPRZXE8TTr9LMMmJqgrjdIGtuDD
	 6wtnI9i3hVY0sPv/twP6cDGJzieUteCMN6mTL4CzOi5fGQdyzLQOS9vPWLxAdJ6v6T
	 BOm6jWb0VfGMA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66B0217E0416;
	Mon,  8 Jun 2026 08:02:10 +0200 (CEST)
Message-ID: <4947ceab-e60e-4f11-9553-5341cdd12a47@collabora.com>
Date: Mon, 8 Jun 2026 08:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 00/10] SPMI: Implement sub-devices and migrate
 drivers
To: Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, srini@kernel.org,
 vkoul@kernel.org, neil.armstrong@linaro.org, sre@kernel.org,
 krzk@kernel.org, dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
 melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
 ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org, luca.weiss@fairphone.com,
 konrad.dybcio@oss.qualcomm.com, mitltlatltl@gmail.com,
 krishna.kurapati@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260511100805.121432-1-angelogioacchino.delregno@collabora.com>
 <20260511141743.251a47e4@jic23-huawei>
 <07739437-4720-4a15-87cc-40f6f92f3759@kernel.org>
 <178001901320.7182.15120759905441640016@lazor>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <178001901320.7182.15120759905441640016@lazor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111683-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:from_mime,collabora.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADFEE65307D

On 5/29/26 03:43, Stephen Boyd wrote:
> Quoting AngeloGioacchino Del Regno (2026-05-20 04:51:26)
>> On 5/11/26 15:17, Jonathan Cameron wrote:
>>> On Mon, 11 May 2026 12:07:55 +0200
>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Hi Angelo,
>>>
>>> Why the resend?  If marking a series with that I expect to see it
>>> called out as first thing in the cover letter.
>>>
>>
>> Right, forgot to mention why.
>>
>> The v8 was sent on January 2026, I pinged maintainers to pick it on
>> March 2026, even if this was fully reviewed by multiple people nobody
>> picked anything here.
>>
>> ....and I've resent it because pinging multiple times didn't work, and
>> because the series got old all that much. :-)
>>
> 
> I take it you want me to apply these patches to the spmi tree?

Yeah, sounds like the easiest option.

> Can you
> respond to the Sashiko bot comments about why it's wrong or fix issues
> it found?

I will do that asap; sorry about being late but I just came back from a work trip
and might be a bit too late now, but still, I'll make sure to get this done between
today and tomorrow.

Thanks,
Angelo

