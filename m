Return-Path: <linux-arm-msm+bounces-71961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B4B43194
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23F7E7A319A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 05:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EB323BCFD;
	Thu,  4 Sep 2025 05:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="MHMaYCas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8442AA6;
	Thu,  4 Sep 2025 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963742; cv=none; b=gV6gXwVAoiKGuTuzJv8qjSYxlhjsO7LwjC1IGc04IaW7J5NOenu1EarWzEQ+0IFDRcgsS+fJsrOsh9LW3b6POS6RnjFl53uc5Jw7lMljAxJ9AeGK+TQNx11g9iAXlUOoVt9tWzFkyFj2FGO3TAalltckAcVrgAh0K54h9aS/nfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963742; c=relaxed/simple;
	bh=0xxDI8sR+v/mjCVtVzGelqoB/xDNYqvcId9UcD42+dk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=OAbxsSNpjdR2ceQ7LhuuxizErXPkGh7CNQRatexrdFsCy46XADg+nAUfnYZgCzba9rdUPA+Pgt0/suX8jhvDhyvt2Oo3lgcm8YFJyXYfGvq6QUDDWXIU3KvHgAH6Qi2lxBDuHl0zFP2rO5Y2hRpZESO4Kp3NG4itq6Wy0FAC/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=MHMaYCas; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1756963737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBvTSzGPuYGhT6QiGjBpqwb8Lf4wsBXioz82E47vycI=;
	b=MHMaYCasbppXMhRcrM/4UKZUM+ctgpxEJ9f2NSDFtvnlPBLM1PDT6+7WPbDUQICfB8VbgG
	YsVX8vE2XwvlihZTM45fjzjm5BzvQayL5kY2Ps3ruoAeYDKfk5WSehlpStwe3kJIx2JK1p
	UvRLJtziTyAYPK97VA7Ii69/MW508jII1kOx1mH6j4DnkysbXwC1YKG9li5JQQFYjtOXfW
	S855nRcQAnEXWc1hFLlH+/R4IHbytLREpu6JQc7xNMrVsXND9P1DN5LEAhTCOhvfZbqMnI
	rSK9m7Y0gNuZbXJAoJavrQi6obrIv070/0bI32tuOpFhAPkz88WW7ZYdiuWQ7Q==
Date: Thu, 04 Sep 2025 07:28:56 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Sarthak Garg <quic_sartgarg@quicinc.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
 kernel@oss.qualcomm.com
Subject: Re: [PATCH V5 0/4] Add level shifter support for qualcomm SOC's
In-Reply-To: <20250903204258.GB2663015-robh@kernel.org>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <3453985c13aa51d068c0174e51e378fb@manjaro.org>
 <20250903204258.GB2663015-robh@kernel.org>
Message-ID: <65c430990c9fef0325c6b12ac6482b90@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Rob,

On 2025-09-03 22:42, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 10:24:55AM +0200, Dragan Simic wrote:
>> On 2025-09-03 10:04, Sarthak Garg wrote:
>> > Add level shifter support for qualcomm SOC's.
>> >
>> > - Changed from v4
>> >     - As suggested by Krzysztof Kozlowski Renamed the property from
>> >     `max-sd-hs-frequency` to `max-sd-hs-hz` for clarity.
>> 
>> I just spotted this series, so I'm sorry for jumping in late.  To me,
>> "max-sd-hs-frequency" was actually a better choice, because it goes
>> together with the already existing "max-frequency" property.
>> 
>> Yes, "max-sd-hs-hz" is obviously more clear, but to me, consistency
>> is more important.  Just my $.02.
> 
> It's about defining the property units as 'frequency' could be kHz, 
> MHz,
> etc. Unfortunately 'max-frequency' existed before standardizing with
> units.

I see, thanks for the clarification.  In that case, we should perhaps
declare the "max-frequency" property obsolete and substitute it with new
"max-hz" property.  I'll see to whip up an RFC patch for that.

Hmm, there's also the "spi-max-frequency" property, for example, which
would also benefit from becoming replaced with "spi-max-hz".  That 
should
be another RFC patch. :)

