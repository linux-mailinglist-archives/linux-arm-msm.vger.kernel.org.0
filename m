Return-Path: <linux-arm-msm+bounces-105378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLyEOCpp82ky2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:37:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE574A41F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F13453039C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3836C42DFE5;
	Thu, 30 Apr 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSbIpxIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7039140628F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559811; cv=none; b=NCcowv8KNohRf16llVD7e4+1HH8xocFBPQbGbsR9S3cm4gPkh6HfKfYWbWwtG2rcZtETeLKtlkV6vnSOwSVfZrUI1YJSoxlZvLTvRQIiJaAbQbnoVZ0Jnc5mPY9dmFAYCM3qQUKaK2NAxlF2MIT3Jr/idVJeHTruyzPMog2K83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559811; c=relaxed/simple;
	bh=q4KFS0fUCLAoDRvlQFqZ9THrM4lzkFXcoKZvVvkflbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvTmS0VSRDXaMdVMdtl/jJfCD2Kj4WEKkZVNyBmIKAZQhP6r86AM220XeqakplBDDv53Sc4MbCIu5raQFS8WQ2GVr0uyic28CqqJ/ObbMpQdwPoK2r2SyShiYOfS1dwLIKi/Ws42cYSqQMujh9DDa/60uXmNagljJzbBADgC3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSbIpxIv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a749f4de6dso96271e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777559807; x=1778164607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AASJG66/zuamirWxKBfOYrG2p46fQckg6evU2EmKX+4=;
        b=PSbIpxIvXqoLMkTe8bkOr1b7U09reLGSJuNquHJeSJQND339hHSDny477vbDYB0ZBH
         6CV6oBlcE0CaMPfbXHEY59bw66X2KwYNXc9KEntUVrUnrSD9/iTbXDtl4RhvQLBSnFx2
         erYY3YO6ojqYm8pVxGjDBrUFxmunOiD3tVjWawIS0oDrI2AUzhKj8H/am8NTh9YQM/Ov
         gcrVIH/31veckBRIxDgnzTnCtFjBom1gH6M3ssMSsMG02bxUxC6x3qWjY0n0VYIDC9in
         sIPBDX1KQvsVlId+2WHJHOZho8rjePGUYhh4sMSuDpTRpGV2UWjRkufMEOg9KKAa40+O
         R1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559807; x=1778164607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AASJG66/zuamirWxKBfOYrG2p46fQckg6evU2EmKX+4=;
        b=K0+kqXaK8EVm/fKMRwfix0cEMpUMnWufKXKWcCqMWpYqmzqy3SVNQLFjbkujQqpeJS
         P2Ey1OwQADmP9CM9AEuc74hiDAXZT8PwDNKnrABW+I/XYk7njk82U7KlpD4Jc/FC/zXd
         6mFSIHKXSyyOpgtXhO4M8IO9k/stOpJAKdztm54ezbv0MmO3bAPT3uyMSvUfrDOGfFsz
         kF+XDvU3NePnMBQvbI8fdxWXn7D/aNGWaGnxekCtRxR4yH4tcRhVEqGK0yDvzi6mIWk/
         6B9Ban5pKrqa18OTSMwcCNy+rymT/ac3wuiwUaFsJNq1YkvrwCU6G/Ab/u8ELDuH4VOI
         jr4A==
X-Forwarded-Encrypted: i=1; AFNElJ/n1klN7RY7jVxzr3awYFkRTYTG9+gHz6pI3bd7ZzL99VZurgQPhtrRa1HsyWHx/RZkIfmPoQQ/gFBx4wdS@vger.kernel.org
X-Gm-Message-State: AOJu0YwbWzfaQLOI4Ql/wN+ALzpb5f+/K1Gi8tFDEQkBBdebof5anQ8t
	kP6h/sv+m5B43JHQuavztZ5fyF3IOUpPKrKSHoJ57X5QW5i/hwpgeliCUbASofhhK/9sVAoo/jt
	5PDys
X-Gm-Gg: AeBDies2bku4yWKK1eFVIViZZkyxRlr5X0pjANJUYhka3eFzPG6ZapyDAVPJK9LzHWq
	Lbb3Svmyp4ej7OVY+e1KewzbSbOJ6SUBEEMxpetolHXXp47S6duWSCrzQ0q/0aSVGQazwKuxECc
	0UisjjDESzGrvm0OkxBihLJxDhiNE3F+a3Nyl017wgptG3HRlwsu61uD8c1AuoWy1sqqqsWGgjv
	YHCJ8+RNSltKx9DHuBj1573vWkmxuvYCJGX1MClsG5D/mt99C2rkM9nCycke3WgFHaB6zdDc4s6
	j9NI7gWmIYhVpdLFF6lIu7SSZ9q7J2z7V6YZ05gecqiV47kPv3nXjqfE78BQwF7Az/AmHYCbHR6
	fCB20LrQ9haElKJ8Ab/Lao7nM0LgyCWb5IudrljnVY0A19jYqXposYaQWizTrXHDpmJK9P6+HTh
	MDq6dIXpB7DHHNz5g9IL61G9tY0tdpWqiSNjZR3eam/bc0UlR3ADCQSnNROCPg2VWB3dkX82IoE
	75JfVm/GCvALkJy
X-Received: by 2002:a05:6512:3d1f:b0:5a4:f0:c4c4 with SMTP id 2adb3069b0e04-5a8522dbb44mr488645e87.7.1777559806540;
        Thu, 30 Apr 2026 07:36:46 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756c8fsm1460216e87.38.2026.04.30.07.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:36:46 -0700 (PDT)
Message-ID: <c2ef2e56-c8ec-417e-9771-f2e6746aa201@linaro.org>
Date: Thu, 30 Apr 2026 17:36:45 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
 <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
 <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7FE574A41F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105378-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:mid]

On 4/30/26 17:05, Krzysztof Kozlowski wrote:
> On 30/04/2026 15:03, Vladimir Zapolskiy wrote:
>> On 4/29/26 20:09, Krzysztof Kozlowski wrote:
>>> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
>>> are already treated by common.c code as pointers to const, so constify
>>> few remaining pieces.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
>>> 2. Add rb tag
>>> ---
>>>    drivers/clk/qcom/gcc-nord.c     | 2 +-
>>>    drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>>>    drivers/clk/qcom/negcc-nord.c   | 2 +-
>>>    drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>>>    drivers/clk/qcom/segcc-nord.c   | 2 +-
>>>    5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?
> 
> 
> It's on my exception list, not sure what would be the benefit in practice.
> 

The benefit is just the same as the one described in the commit message,
having such a peculiar exception left makes the commit message statement
"constify few remaining pieces" imprecise, and if it's done deliberately,
then it should be explained why it's done so in the commit message.

-- 
Best wishes,
Vladimir

