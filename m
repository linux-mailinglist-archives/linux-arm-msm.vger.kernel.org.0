Return-Path: <linux-arm-msm+bounces-100544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL20AJ33x2lMfQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:45:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AC34EF87
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A781830078CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 15:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1C0347FDE;
	Sat, 28 Mar 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEuYxCrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DF339872
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712451; cv=none; b=BMcQbmaVUEPhvr/kjZXcjWwjCtgyCoS32UeX1Pzft/K6/0y5YwOQcCNRlUaWC5D7fQAnkUnVTiNC6aivTHdlN8iehrI8iJL4yQegHYi6oFGDJ/hBnK8vEItKpIVtd21gAHv/ZiF0J8EVlJ9PDRF9u7pNfcPQHXSZeAfAokxQg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712451; c=relaxed/simple;
	bh=uvVVub+gmQlPjulx8qodfzDWFFTVrM/t5QvQMJsmEao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElREexyld9HJNq647XwPUEwAKimft4lumQ11Q5qDwpUaFzMui3e4CaOWGtqyOqd7fjnFZdnIUcGjnnL8XS3QVZVnDqgeS+b+HN5QcC3Wg9WR83D1uYLsuA+MQTJ+zfn/FIPDOUjAsipTdR408Y6VixAggAwKEpkT1c5/YALhICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEuYxCrc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2ad56dbb2so1340997e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774712448; x=1775317248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si+LqWUeUzQbWuRX0yXTIaRmzGoM4iuF22tOkmbkOQQ=;
        b=PEuYxCrcru1wUNoCA0dQIJIC6WXzniTrwGMHNDjilyuh7oAGh4EqSTI7YS50zS6QD8
         Z+S4gqCkdT2RrsAAyV+wt39mWrjPXkDXlwlaMenFbdFCVI1hxKC5v0skFoxxc6iErsqi
         WA8oGiu7w+rectKOpvIZhhepHRIqC+0ipnAnmde0aD0FhNnXnScNAmicJXqh0vKfNYdU
         WPpqr4yk6Lk+h6U7bPrwtwg0ywSczHTwf1VhjF9X2Il9xGvCsHZ1dtbvKUtBqvX3ZVvA
         504cDyRNp+YjaTK/665X5VqwAAdhebwP2Ehtv+25YuEbFKcBheyh4k68FIMsuwgbQKMk
         7omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712448; x=1775317248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=si+LqWUeUzQbWuRX0yXTIaRmzGoM4iuF22tOkmbkOQQ=;
        b=RVr5Tcp/N9eDgZtTjCqCA1d1Hc7Qz3Rs1bGzeX3tk4U5bwSxbpBL65u3Z5fvo9wQx4
         KVlfdvhojkKfydrjhr9LNx7wT82/CvValoWr4sJP3xU65YMGQBO/ZpGDxystX2yAcJAq
         vEkioCvTW8+BpTLAN9mtlaDaatvmwdIaylGvswCrp5+Hj69Qer/DN6ya5dTP+MqLh4o9
         nTdLD8lvdXfVunSGK2BJO+1MbwL6onOwgirhB/ZxrN5EVlPs4abzyL7SMlblYxGdUQpT
         /m9ncvz4ufFjBt1fdpNQ6YfVxj7UxeQw3/91aQzWaZ6Wir6yhKnD1OAeTA99jzR8grE0
         3S0w==
X-Forwarded-Encrypted: i=1; AJvYcCVL3LFmbMS19GDJdcC1ZO4W/906f/Wy7qvW8/ACPeYmXdKnFreKyhQHkKXVQPSMhrbYYePEp9srYsPPvN4c@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXXio6+DHN3TqlyvlOhXrOeu/O8r6l+IUcyEFa2io3DlFVcTb
	Rzuxw3SZraBLRdY3QmOjqwnwXtp4WsoR66WDX1nXwZQ3p+AxwLxlm1O9WkilhjWTEOouuIP0l6J
	7YCA6
X-Gm-Gg: ATEYQzxRkKSc5kwzmURA9NYCyjQ5FocPO3yneTy29QQIDRsKhONNzeIjNJNiDGNY6O0
	Gv0kdzAHBuIktPHpR1yqksb2w+aQTpd94diRvqZQD9D1sexTp7eoJCFidEhXieJnuRMecHvVWAd
	6mq/IHuPXk1AcDcvRUDYqBzEpbU1LP+3cjElQTL/PMxM/KGmV/VkTUB0+1sVWe7hwIOSHUXlV0t
	sMyfo1c0qksSuZf1QyXkIWn6eD3WCnIita6IBGulaAQN7vrZ64xnytGcQwp6WXmHmQCLK98Vnr7
	s2JwoHYGPp9+VZW/SHUd2cKmaK3Ja5c2iEMlcOSHZfnIVWRuvrfqHB+f3TIJ4WT6/C9wLnknmoL
	Pm6ZgSp1MwWi7TlJZr7TI1Kta1kJYn+C7jrRJwzGuhmjqpM7jeW4fR4ZmYIWCbPdBdo0NqwOdXi
	9j4dz3R13eWt2/vPS4NKCtdKNM9gI1+M1Y2Iw=
X-Received: by 2002:a05:6000:144d:b0:43b:94d0:4d8 with SMTP id ffacd0b85a97d-43b9ea4af78mr10369975f8f.34.1774699326323;
        Sat, 28 Mar 2026 05:02:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.108.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2580194sm3855810f8f.37.2026.03.28.05.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 05:02:05 -0700 (PDT)
Message-ID: <417a34c5-6c51-4c5d-8796-7212e566c23e@linaro.org>
Date: Sat, 28 Mar 2026 12:02:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Fix csid clock configuration
 for sa8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
 <20260313-vfelite_fix-v2-2-7014429c8345@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v2-2-7014429c8345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100544-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 660AC34EF87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:13, Wenmeng Liu wrote:
> Fix the mismatch between clock list and clock rate table for CSID lite
> instances. The current implementation has 5 clocks defined but only 2
> are actually needed (vfe_lite_csid and vfe_lite_cphy_rx), while the
> clock rate table doesn't match this configuration.
> 
> Update both clock list and rate table to maintain consistency:
> - Remove unused clocks: cpas_vfe_lite, vfe_lite_ahb, vfe_lite
> - Update clock rate table to match the remaining two clocks
> 
> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++-------------------
>   1 file changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..cb013471898506f483e5b2779cfd4f679dc083e8 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3598,12 +3598,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID2 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite0" },
>   		.interrupt = { "csid_lite0" },
> @@ -3617,12 +3615,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID3 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite1" },
>   		.interrupt = { "csid_lite1" },
> @@ -3636,12 +3632,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID4 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite2" },
>   		.interrupt = { "csid_lite2" },
> @@ -3655,12 +3649,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID5 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite3" },
>   		.interrupt = { "csid_lite3" },
> @@ -3674,12 +3666,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID6 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite4" },
>   		.interrupt = { "csid_lite4" },
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

