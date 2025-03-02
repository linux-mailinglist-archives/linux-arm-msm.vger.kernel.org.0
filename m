Return-Path: <linux-arm-msm+bounces-49944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28076A4B1E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 14:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CE2516A621
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 13:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7767D1DDC11;
	Sun,  2 Mar 2025 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="sLvdYjX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB27E110;
	Sun,  2 Mar 2025 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740922503; cv=none; b=fy0jY2fomEIY+SdaBXwIAjD8aK3hxzrNIqAJfjv6Ykte61Qm9DVuzx9M//Z6/pvMEQWeP5+MRB08Et0V92HVZS2tuCfnclcFxyjgd3gnNQIKfn8o7u9UssE6Ousj3nDw3nGk05z+SBgDho6z61HfNyz9UbK0qRJfH+DQwZszWEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740922503; c=relaxed/simple;
	bh=MSQ2cKPPkPjmDrmJy/FLeiPBxlbYekvi38q/5qc4FFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQH67QbbxWMvyz8JKa2PGYHydU/YuuPG9+LirryVv4DXOp3FUxr9Qosl6piCvUXpSmPBDLL9W0sD8OOGUuJd8sBTHh4r7h4TEqF8ShsSPxPIGymVk3KyaX1TW+kcSIKgZs/OSLPl85hN1nciA49E0AlIOa7Hv5pee6IAF6OkCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=sLvdYjX2; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1740922482; x=1741527282;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=nTJClktE5S3QxaECergyaKe3EYsuCTuLnJ+cWLyTAko=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sLvdYjX2fVCY0heiOxqBy/peKGfkFzF4u/g0W8aLZPs8SKXgZhUeO4bSlpAEj2zq
	 DSMK49CItU2RTi446G/bDBrn9hX3GLwqORCXNDIkOnOxVCYvMxcreLjEggiSLWDDV
	 uKe5/L/2an8+XHcrAGTXBr3cOM0sIXK3WgjU/qYN34ePvObRyR0IFUP3AD13/S7hq
	 SbhppjYyaRAI5skaYB1LyTjO5a9degu+OYv1Dg+bgf+LTzJBl4iOl8QvdcsO3Fo63
	 Qymv9PMkddj6BWvNDDqfKSogZsSiiOtcj4deeHgNaMMu/jgmaqFgNj8+RA2a5BhzR
	 MQ771Y5oQgglA+6NXA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.41.231]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N4hBx-1t6Yez34nH-017qyN; Sun, 02 Mar 2025 14:34:42 +0100
Message-ID: <8c6f9c8c-3d03-45d3-b601-989e6c441501@oldschoolsolutions.biz>
Date: Sun, 2 Mar 2025 14:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/3] usb: typec: ps883x: fix missing accessibility check
To: Johan Hovold <johan+linaro@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218152933.22992-1-johan+linaro@kernel.org>
 <20250218152933.22992-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250218152933.22992-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4UxoOcT8+yz/0EC6f0+pYJva2U5iIsfbA6Qx4EkaG0kJwbIjL8m
 vV1zDRA1mQtmFSOzDTMUfi2DfrrvO+cYXZVS4k8J8VKRRNXetzdaAUeUyemJGvix2qF4QBn
 9C4v4lYWBrfQfiMq5yV+CmT/YJg4nl+FYL1Mm9sBaSvYISD9JJduwzR8YU9SWS30NlRnvkw
 vUvWFPIerripu5+L1OoTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uBKyAR++kJg=;56OUr16z7fYfQd5r7RK6dOmPuPk
 73EoC6UI+4sLkTIw25uNcMD8ygJVxm4ipsZNym+xPGAjPiYF0AFVEkJxC9YPNQ4sUZUWYfk9B
 9igW1mZUZxzXE5Vfb8ehMoODE7iz+/4M9BaGaSM+WiHoTM9YzV3kuhqjZQX3s2sYMkDEvHgNm
 TWklYGkJhwjsn/FnGAvoVw7yhrz7a8TlaOZ7ckX9Ak8zJ7UpOP31QyXCBibZJWFt7RmBINDA5
 B4PvYn/4Us8ASofOOKQJvTQTLQ7jMMYlxTGeDZ+ONCM4WXutvni3lk6z91oocxcDy4ggk4EI6
 79iJ7YXSbHkNEbLi8pYabsTvlvm+6TQ3BuqRDJH7/0BnW4ZSjesHYFtr1XmYNFCkKsGKhW/We
 0+2JxV73Is1swXGQbkwgOGSfAUSnjZZA0l85lrP5SkPYuE+kkRbivzqJN9FueyA7ra944GkRU
 61yDOElsj/4IQ9VKQSZ1oJuQS/TTWZJVkI+gLabd7DBAlYdaWRPRZ3oKEZRDvbq0jiC4+iLTp
 417z/DujamsJZVvQO8LBVcC7Fg/hIBMjyp+oE2YyQc4QMqB9JRKt6BApULxDqQ12hFL7U9mOT
 wh2duWeKXhNOosMZGYpuctRr5tO7kkNfxbmd0pOAI6avcFgcXKlT3IA4UhgjEmWj0WHob+hWB
 nZ4/dq8nZW87LYXjz3LrpERODP24s4tpezUlypV18QzgqGmJGthXRrKLVvTq1QHC5qu5ZbZvy
 50Fu4yvdYkLv7O/EuMhyiKW1lDroY0S/xMzbwCTwpQDNJ5OLpFdMwiSnSBaaW2uRc1ODVitOJ
 0g2eqg0ZaBtnRVwRjQdMa9RTds3RX7SqDnfHU8lSNB0mLzmC749dA9nS00stTMz+q24YKE4w2
 jVKZvRH7dv/JC8tiIZJJoleFZtHZn2ibRh0TJgq6mhKVccAiVMx4j2qdXxeghhQD/j65hd34M
 GoNqdkIOpq9EFjFhTfUqSY3DqqIeDRlsPuHVqyjiQjtTtIp4uoQd8nPkZ6o9tJwG5/Qzzlq5w
 t1T3sQeByfyP65/PexI7PrajzBV8kLQir63GgSUWdzECiE1XR+0OJVuCUfAeytkYaO8wSvgqX
 BI1KclswrgS5QF9xGy/hDU+o+0i47e0uq114eyjh+HlXmAZ8co9cU3pWsPVF5O0Qg58adVTud
 thxGaY5py7HaVvCsJnlWq/MvyotT7V2qaPdzO+Bwg/nHsNiA/RgP7Za+gH3eAivTgJnq8MYvO
 BRQXu2Z7i4/u2K0wOGq1uGCIXUQuWyKlwrXlTWoOQMDgltqRRDcqJu9u/5X0CnmNJ1yYbJPal
 17+6IEBKM6+dGva7rpse0HEyyUZW5Vmj8P6cWu3hTpfntdwElIMhfpWY43pJlGeDfkaglvJzL
 TuvJaYK0yptc5Nrg==

Hi Johan,

On 2/18/25 16:29, Johan Hovold wrote:
> Make sure that the retimer is accessible before registering to avoid
> having later consumer calls fail to configure it, something which, for
> example, can lead to a hotplugged display not being recognised:
>
> 	[drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110
>
> Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C R=
etimer")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

unfortunately, this one goes south on the HP Omnibook X14, and also on
the Elitebook G1Q. After excluding a lot of other causes, like inverted
resets and wrong i2c channels, I did a bisect and landed at this commit.

Looking at it, I speculatively increased the firmware initialization
delay to 200ms. To no effect. Reverting this patch "resolves" the issue.

with best regards

Jens


