Return-Path: <linux-arm-msm+bounces-91138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K90DWEee2msBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:46:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF0ADAEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 09:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05D8930C6F3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BF037D136;
	Thu, 29 Jan 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atY+hbRB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFE37F0EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675808; cv=none; b=M/HbvGknVVwI87LW/X3l1KHDCdc+ogNa+HYfhrJdnRVIPgEy5UiN/ZP1yBsLLhhbc1rqhd8I4W5XMNaDq8cAsbMW+XveghLM9q5Z726dSTPFneje4aLYnHX5saaPZ8ncuFhY7BSNLr01KFFwhuFoGkYvq6qP5FBsrkE4/tScIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675808; c=relaxed/simple;
	bh=nKAcG7h9hgoUnzD+RttxQVIGjUJCdesom1VDJ+0MP+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVhu2WrnA/DYHBleIqe87etyOmBXF92JKs6yEJLZZTkS1TUPFfFpkWfIuuierAqm5ZGh3J1MnvxGPoMvR25f9tmStOxMDmcbz/Bo5KT6LPRXJI5sJRJHmMQ4qAfvts7Mc4wMkG9XRSNfkPEMTPshVPgbxFzursuaG5wk76+ESFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atY+hbRB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43246af170aso479835f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769675801; x=1770280601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgH1Le07qptdJ2tbFk/kKQatwJ7Wgt2UoHN7iFUry3o=;
        b=atY+hbRB4d+IXeVx/bdHTYQXmyQTLG3563duzDrgtiu7FApo2l3ILknKak9+qciZ0m
         Hv12IqZJUXVopRv4pvFjPBlOGlT2Dwv5SzzVTd7EN7CEtwHmvsIwClp+DTIqgPmt2kSk
         Sdj1fHn39Lh0TLzbDw8R+CZqV7xolizaDTGJIgZCuUUkw0HBhR+dGgCdFkuqam48WNAW
         O6bxdhozx1otVUpOcfTqrZglMkcM28q+S6hx5ObN3+MSE9QGZkXluqP45q7UNq2fKGZf
         JcyEdTeTzFs89n5FhNWnkscXamsWnbD7Xd637kfw6GwyY8mW1fwOiO9nrJ6zJpRfg7jv
         Tp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675801; x=1770280601;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgH1Le07qptdJ2tbFk/kKQatwJ7Wgt2UoHN7iFUry3o=;
        b=eDqHsn8aLRQIPzlKJfBqPrAjj8HlqOK/YKisodgJN/0vgR8JXeqa6gwyxDywTJBVNR
         h7xaJslSopQjNs3bLmCo8cp+izNrRhYKz7fSWBCjFmrAbh1721ULxR/LLec+0RmeSkZz
         IgVkMlHyYMRmt31lG5ddOnhvJPCWiBTYs87cGze972O9O/zaePFi5D1sL5csOvrDCKbn
         kx6rldQcxvgD7jYzH54kUJpexoBHYt10WMehO171Hkd+GpOFPWIkXdMOCh5tRdgmMoK/
         GhWNPhdIMu4JxjziHC3v5+DkRfLysC/4ti+ZkvJquCifiJGFf4/4Ld7cD+z9a2L7HzoP
         5VQA==
X-Gm-Message-State: AOJu0YzIoNNQ7Weq3YDeeMVkZ9noIOORIGb0kwanNZ6s9t+fylGS4WH1
	nm7IyogTMGTGZ5CRO8kTTInK5/D5kj4RASdWvrF3hiKvGIOH3Mth0jNn6enaAMar9Jc=
X-Gm-Gg: AZuq6aJsxWkgwxbbMeoU2w5kF3Qnio6XPvU+pqt1o94xf8MjnVTOEhUokqKTsB8APK/
	pPyyYFgJ2SqA/NdqAm3SNMBjJd5ArmcuDujz5s4U9bnQzI0lq8qn29UL18rHBgV0HaCry87ql94
	dxy75l8aJ8G1ynPz4UxBIAQSaOmaMAOGm8OqQ1l1CdXi3pyKd/MzpyZAqMAxTErzBNzqikHuA6w
	wqQWaQoBiRx7sV6giIQH+hpS4gZiWOKiGMp9Bs1P8Llbn50tAnhahC992hgsYeEf0IxCPWZ8Ulh
	q0pyEabJ9A1QZG+ZLI/jXfSqvtCGZZUbgXTFnpNO71/E4AT6l55ciXpTz1wS3mNbF8Znm8NELDj
	ofel9YMaJccg12QozT41S9H7GSllq95UDeRvAkpOPcFc/JItlWN2Wxxel3lqiGG8agTyrHHN7NW
	Kgxb4z/iFx6bPDTYekSjgTY5sUqHAr2jSPyoJoACDOYU9jC7TS7z7nDTnymaNSaSE=
X-Received: by 2002:a5d:6207:0:b0:435:bcbd:cb29 with SMTP id ffacd0b85a97d-435ea05d6f8mr2745493f8f.2.1769675800685;
        Thu, 29 Jan 2026 00:36:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ae8a:f349:da93:8d6e? ([2a01:e0a:3d9:2080:ae8a:f349:da93:8d6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm12537878f8f.35.2026.01.29.00.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:36:40 -0800 (PST)
Message-ID: <c3f792db-7819-448b-9905-680b48810ac8@linaro.org>
Date: Thu, 29 Jan 2026 09:36:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-91138-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,0.0.2.188:email,0.0.2.88:email,0.0.1.144:email,0.0.0.100:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.200:email,0.0.1.244:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.1.44:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 86FF0ADAEA
X-Rspamd-Action: no action

On 1/28/26 20:11, Aaron Kling via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> The original values provided by Qualcomm appear to be quite
> inaccurate. Specifically, some heavy gaming tasks could be
> improperly assigned to the A510 cores by the scheduler, resulting
> in a CPU bottleneck. This update to the EAS properties aims to
> enhance the user experience across various scenarios.
> 
> The power numbers were obtained using a Type-C power meter, which
> was directly connected to the battery connector on the AYN Odin 2
> motherboard, acting as a fake battery.
> 
> It should be noted that the A715 cores seem less efficient than the
> A710 cores. Therefore, an average value has been assigned to them,
> considering that the A715 and A710 cores share a single cpufreq
> domain.
> 
> Cortex-A510 cores:
> 441 kHz, 564 mV, 43 mW, 350 Cx
> 556 kHz, 580 mV, 59 mW, 346 Cx
> 672 kHz, 592 mV, 71 mW, 312 Cx
> 787 kHz, 604 mV, 83 mW, 290 Cx
> 902 kHz, 608 mV, 96 mW, 288 Cx
> 1017 kHz, 624 mV, 107 mW, 264 Cx
> 1113 kHz, 636 mV, 117 mW, 252 Cx
> 1228 kHz, 652 mV, 130 mW, 240 Cx
> 1344 kHz, 668 mV, 146 mW, 235 Cx
> 1459 kHz, 688 mV, 155 mW, 214 Cx
> 1555 kHz, 704 mV, 166 mW, 205 Cx
> 1670 kHz, 724 mV, 178 mW, 192 Cx
> 1785 kHz, 744 mV, 197 mW, 189 Cx
> 1900 kHz, 764 mV, 221 mW, 190 Cx
> 2016 kHz, 784 mV, 243 mW, 188 Cx
> Your dynamic-power-coefficient for cpu 1: 251
> 
> Cortex-A715 cores:
> 614 kHz, 572 mV, 97 mW, 470 Cx
> 729 kHz, 592 mV, 123 mW, 473 Cx
> 844 kHz, 608 mV, 152 mW, 486 Cx
> 940 kHz, 624 mV, 178 mW, 485 Cx
> 1056 kHz, 644 mV, 207 mW, 465 Cx
> 1171 kHz, 656 mV, 243 mW, 480 Cx
> 1286 kHz, 672 mV, 271 mW, 459 Cx
> 1401 kHz, 692 mV, 310 mW, 454 Cx
> 1536 kHz, 716 mV, 368 mW, 462 Cx
> 1651 kHz, 740 mV, 416 mW, 454 Cx
> 1785 kHz, 760 mV, 492 mW, 475 Cx
> 1920 kHz, 784 mV, 544 mW, 457 Cx
> 2054 kHz, 804 mV, 613 mW, 458 Cx
> 2188 kHz, 828 mV, 702 mW, 465 Cx
> 2323 kHz, 852 mV, 782 mW, 461 Cx
> 2457 kHz, 876 mV, 895 mW, 473 Cx
> 2592 kHz, 896 mV, 1020 mW, 490 Cx
> 2707 kHz, 920 mV, 1140 mW, 498 Cx
> 2803 kHz, 940 mV, 1215 mW, 490 Cx
> Your dynamic-power-coefficient for cpu 3: 472
> 
> Cortex-A710 cores:
> 614 kHz, 572 mV, 91 mW, 388 Cx
> 729 kHz, 592 mV, 116 mW, 424 Cx
> 844 kHz, 608 mV, 143 mW, 443 Cx
> 940 kHz, 624 mV, 165 mW, 434 Cx
> 1056 kHz, 644 mV, 195 mW, 430 Cx
> 1171 kHz, 656 mV, 218 mW, 414 Cx
> 1286 kHz, 672 mV, 250 mW, 415 Cx
> 1401 kHz, 692 mV, 286 mW, 412 Cx
> 1536 kHz, 716 mV, 331 mW, 407 Cx
> 1651 kHz, 740 mV, 374 mW, 401 Cx
> 1785 kHz, 760 mV, 439 mW, 417 Cx
> 1920 kHz, 784 mV, 495 mW, 411 Cx
> 2054 kHz, 804 mV, 557 mW, 412 Cx
> 2188 kHz, 828 mV, 632 mW, 415 Cx
> 2323 kHz, 852 mV, 721 mW, 422 Cx
> 2457 kHz, 876 mV, 813 mW, 427 Cx
> 2592 kHz, 896 mV, 912 mW, 435 Cx
> 2707 kHz, 920 mV, 1019 mW, 442 Cx
> 2803 kHz, 940 mV, 1087 mW, 436 Cx
> Your dynamic-power-coefficient for cpu 5: 421
> 
> Cortex-X3 core:
> 729 kHz, 568 mV, 252 mW, 1110 Cx
> 864 kHz, 580 mV, 312 mW, 1097 Cx
> 998 kHz, 592 mV, 379 mW, 1109 Cx
> 1132 kHz, 608 mV, 453 mW, 1099 Cx
> 1248 kHz, 624 mV, 517 mW, 1067 Cx
> 1363 kHz, 636 mV, 587 mW, 1067 Cx
> 1478 kHz, 648 mV, 657 mW, 1058 Cx
> 1593 kHz, 664 mV, 739 mW, 1049 Cx
> 1708 kHz, 680 mV, 813 mW, 1020 Cx
> 1843 kHz, 704 mV, 940 mW, 1021 Cx
> 1977 kHz, 724 mV, 1054 mW, 1007 Cx
> 2092 kHz, 740 mV, 1201 mW, 1045 Cx
> 2227 kHz, 768 mV, 1358 mW, 1029 Cx
> 2342 kHz, 788 mV, 1486 mW, 1016 Cx
> 2476 kHz, 812 mV, 1711 mW, 1046 Cx
> 2592 kHz, 836 mV, 1846 mW, 1014 Cx
> 2726 kHz, 856 mV, 2046 mW, 1020 Cx
> 2841 kHz, 880 mV, 2266 mW, 1027 Cx
> 2956 kHz, 908 mV, 2616 mW, 1074 Cx
> 3187 kHz, 956 mV, 3326 mW, 1147 Cx
> Your dynamic-power-coefficient for cpu 7: 1057
> 
> 7-zip benchmark single-core MIPS:
> 2128   4416   4632   6686
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..7bbbf3109bc2c6e2e6445207cc86c401be482a73 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -76,8 +76,8 @@ cpu0: cpu@0 {
>   			power-domains = <&cpu_pd0>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> -			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			capacity-dmips-mhz = <326>;
> +			dynamic-power-coefficient = <251>;
>   			#cooling-cells = <2>;
>   			l2_0: l2-cache {
>   				compatible = "cache";
> @@ -102,8 +102,8 @@ cpu1: cpu@100 {
>   			power-domains = <&cpu_pd1>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> -			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			capacity-dmips-mhz = <326>;
> +			dynamic-power-coefficient = <251>;
>   			#cooling-cells = <2>;
>   			l2_100: l2-cache {
>   				compatible = "cache";
> @@ -123,8 +123,8 @@ cpu2: cpu@200 {
>   			power-domains = <&cpu_pd2>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> -			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			capacity-dmips-mhz = <326>;
> +			dynamic-power-coefficient = <251>;
>   			#cooling-cells = <2>;
>   			l2_200: l2-cache {
>   				compatible = "cache";
> @@ -144,8 +144,8 @@ cpu3: cpu@300 {
>   			power-domains = <&cpu_pd3>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>   			#cooling-cells = <2>;
>   			l2_300: l2-cache {
>   				compatible = "cache";
> @@ -165,8 +165,8 @@ cpu4: cpu@400 {
>   			power-domains = <&cpu_pd4>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>   			#cooling-cells = <2>;
>   			l2_400: l2-cache {
>   				compatible = "cache";
> @@ -186,8 +186,8 @@ cpu5: cpu@500 {
>   			power-domains = <&cpu_pd5>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>   			#cooling-cells = <2>;
>   			l2_500: l2-cache {
>   				compatible = "cache";
> @@ -207,8 +207,8 @@ cpu6: cpu@600 {
>   			power-domains = <&cpu_pd6>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 1>;
> -			capacity-dmips-mhz = <1792>;
> -			dynamic-power-coefficient = <270>;
> +			capacity-dmips-mhz = <693>;
> +			dynamic-power-coefficient = <447>;
>   			#cooling-cells = <2>;
>   			l2_600: l2-cache {
>   				compatible = "cache";
> @@ -228,8 +228,8 @@ cpu7: cpu@700 {
>   			power-domains = <&cpu_pd7>;
>   			power-domain-names = "psci";
>   			qcom,freq-domain = <&cpufreq_hw 2>;
> -			capacity-dmips-mhz = <1894>;
> -			dynamic-power-coefficient = <588>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <1057>;
>   			#cooling-cells = <2>;
>   			l2_700: l2-cache {
>   				compatible = "cache";
> 
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20260128-sm8550-eas-cdaffda7f779
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

