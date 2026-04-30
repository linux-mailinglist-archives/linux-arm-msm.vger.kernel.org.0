Return-Path: <linux-arm-msm+bounces-105365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB6GInlT82mLzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:04:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D86B94A3253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 877F13008688
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F93D40758A;
	Thu, 30 Apr 2026 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hAYsSPOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BFB175A71
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554240; cv=none; b=u6cMBCj8VyBw+RgHckjosMwpH7zl5iwdKCVVFcYtgifAh2hI1KZKRqQS3sepEnfutLKpTEFtGaGCy2ur3FH4b+h/CdtjwP5VCYBFOIOP+sGVTkA4oOz6u1PbqCK6q+caX7qu7kKotKtkLkcQXkUcMBS2ghfMXfD58DxaP3LrMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554240; c=relaxed/simple;
	bh=OnPJ4Y7ZhNXKSRaGQfqeI1Wn6feDuKjt7CixvnuHVn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4fq2XVgQBcj8y4OpEkt7uk9ZkRYHMRROnNvZ6JPx1R14V34MlypYTeaJKBL/F4+Qh9xmRc5Eq+duAEer49d0+dp7cHq8T6kc0j0Vq23GglFe4MKoXZJl4iGOBWpnDqyz1bZy/wI/6/WJMuboyIiafeOsppLwD4sod2ze8WeZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hAYsSPOQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ea635a8e0so217431fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777554237; x=1778159037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3NaV3QelK6BDnitYhWyC3c/XebfQ4XHG3/KpvqPAI4=;
        b=hAYsSPOQf/Uvr3sP1/DxbSJGEGCixDFIKhbxKRs8q316o3fzRQH9iTKNLC91lbnLK8
         4JEhwAVZKKYkWdm13rCUM9f20QS0INZxl43085xxyUlBtPNHmNARkoP6VLSGJ7oH1w5C
         7YNBpV3i4NwLXRudcHf1mhXCofqjXUfqaJHxusku6E5fLlF3cDfHN4Tj0nv062vs0ugu
         EznOees6WF6pjuEHP+E7B+TdcYpZNe0+R5F+/yWH6evcdbCJ4+uXqVmqOC1g9A7wmhdC
         DAbvURs7aA4weoI/CXFcnNyWGcWs9OUErV7jYemxIoLxIIJYJI3P0A3UgIQjLMV+BOAn
         nQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554237; x=1778159037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3NaV3QelK6BDnitYhWyC3c/XebfQ4XHG3/KpvqPAI4=;
        b=kpBSR3A4WzhTVjQ9fvcV/laPtirY5wuPtAIX/6ZnlyoaWS+BQYCA6TGd9S9BFvAWSi
         J7CnliBUz9aZrP5CswYFcb/KII4QGSVyI6suPcaKjvMKvOXg28NiY/Yxb7zxs7rEAR/Z
         IfZ2xhRsOszjCiBJ+7BITZDFJhTJksFSmSm1Z7zngNSWx+9DwZqKuV+hKPFN8sq0orDH
         6qwZ1zBflM6/uSN50CPBHa0PNOjR+QaSyS5Swo2UEG6nsdLqdKkSGWnm/BSbsynPl1/o
         wqkG2HmQhBajWHJvnc7dTo9tob+ljNMKqXTENwYtCocDTCM8cDLJfMKh+Cyk+sSfv9a7
         oe/A==
X-Forwarded-Encrypted: i=1; AFNElJ+7nIo72yRgF90UlNthihUTRgvpa05vORnEs/PrMbIw5lfN1kYJ8iRZ7XgVkwyhiNcMram85+j3fgWOoIy7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OK11l12DAbxjdNHtWdxwj/S5ehov7afuTZh8UHMpisP47PPY
	1ob2qF8ggZ7yca6S30edQCJrlRD2eR92rMAxAWf5s5YB8ZyUPXJnMwFHd4aL4f2AqhY=
X-Gm-Gg: AeBDiev8gFCUI5vt9XhelLSGK5osCa+QPotB5p+nAl2XV1ojguPi5R0eZUlydh3jGfL
	+obwg6tAg3BrH1PE0PpQv3yc3YFB+H1sAqxPeE8jVU96D085f48nTL7Lu5w0ivt3Nx2FWx5i0P9
	T6CexYqy7cnr5XV8KWbnVGLjmeKOz62F8LH8gDKPPFwAZxt7iOnmVCHfCeiiJNpZQw7OFjptLZB
	iMwj5OQPMCsEAtmUhdUHz5gwkaWIHtLIFx7PopR5m0kg8p0pdxKNyED+FToMbmVW4stZsYQleBu
	mE/pNxwYDxrQYwJyDwevw1uLZjI/y2yUO5hFQjKMAKJXLTlM32fo3yWdnGc9UVoe1dg6y+c6vmd
	Pu5DVd+0bbQOSqgtk3tC52dg9enJA26glf/OVkDXk8z5foBmWFigC20CFlnHUARuy8sX0+DC4N4
	SEOKCcBOxLfYqtNFVs7UWkSStF0d6n4MaxrAXEjm5sWgMGCBtUTHG9d+2vebe+zGmzRRguns1Zi
	e20DsgattZcqJiM
X-Received: by 2002:a2e:a806:0:b0:386:5df3:8195 with SMTP id 38308e7fff4ca-3934e221e17mr3591971fa.6.1777554236594;
        Thu, 30 Apr 2026 06:03:56 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3934fbd8072sm5397201fa.32.2026.04.30.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:03:56 -0700 (PDT)
Message-ID: <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
Date: Thu, 30 Apr 2026 16:03:55 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D86B94A3253
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105365-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

On 4/29/26 20:09, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
> 2. Add rb tag
> ---
>   drivers/clk/qcom/gcc-nord.c     | 2 +-
>   drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>   drivers/clk/qcom/negcc-nord.c   | 2 +-
>   drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>   drivers/clk/qcom/segcc-nord.c   | 2 +-
>   5 files changed, 7 insertions(+), 7 deletions(-)

What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

