Return-Path: <linux-arm-msm+bounces-115895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fK8xFHk3RmrDLwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80216F59BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=mKDsx9Cn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115895-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115895-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D1E0307B79F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657E147ECCA;
	Thu,  2 Jul 2026 09:41:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70EF47ECC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:41:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985310; cv=none; b=Q14jkFerCbLdcmJ8I0vJGDxB0EEEoKpgbvruHkJ0kYhASQCUnlVaTQAEbTJR56n7uwteWSD8uNsMCBcSrrgy6xXiYwCXv+A5oYPaCHmlQFuc9B1qrsTXojgaxLGJrMUAN2Px82T6JaM2scRcqrcsDLiX2X8PtxPid4RxRbNTEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985310; c=relaxed/simple;
	bh=VvR2g7Gd5pBy3+eoPP3ACJOFCw6gDHozq6bh3Zr/x5Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hjOxrbQEF6DKpo9VlQ+6O3VogohPA/VTYfYm4fJNkJFRPeJ2XlwrJEA4jIzRpl06e1Toi9i7sQc1vbUjy6PtsC76kdzeOt4Tk0sWojpe2G4cq+uVQRBmh2rmexQ6U4ao+CP5anxF9DRbcSxT16e3AQoeHSOa0wg7bFjaRnv1kg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKDsx9Cn; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so11797345e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985307; x=1783590107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6QJgxwUjEvSuaksm1pvVtvXZiVdGV+tGv9QPbT78G4=;
        b=mKDsx9CnPd/NrNWqyFu8xPDI5kZPbugZFCLKgTupSqwWWmuY07HNWtZiWRE/Qjr/p3
         l+SxPk21mN1njaVNxSlBHSGwdrQ4je3G0FU/bQ4GckYArjPF7rwsE+itrodewb4+pBkO
         erGU55zCf0QwPFieJ/JScYCLECBYfya1dkgr4n4KgOqX84YDDXkxdWraAR3S5prydc4t
         85+4imXvR6qaoV7FcQWyXXNB+BD0fv/MLL7Y4oothIILcdjNyfOptRKWQyFSg3KJoubM
         /M67rsey3Wd7tBY5ScHTZa01991gmeWVBBedtIowgVheBjKIZQnJo4Ss7gdPkXhez4w9
         qYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985307; x=1783590107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6QJgxwUjEvSuaksm1pvVtvXZiVdGV+tGv9QPbT78G4=;
        b=BNnbMBYbSewyNfjEvGGX3TZ/YPHn5khHZT8MSLzuNcvHiV3wLPOj4/BsF4+ovySMMm
         QLSwSLqBc1zVcX8yPoqSJqFqcBphAImGZ4Y9hCkkMgXE2u2t6zMdKeJYS3RnMFWFcYuy
         qKir4PkP3tXxDg9g+GBTDtwsNcu1f4C/+gnxfULv1FOYU7SODtMgtHpRDAdFNy19bX+N
         POdyi2UsYda7GKVUC/AIffUQgTPe7f9HA34yqzYtrCPwsa2shCv5/uW7U63VibXcnRFQ
         cvCo9j9MTJVpT8LHy4G5AzZYKSI0djh2+b5UaBhpO9yMC8uKhpliuHyVOr20skHCY7zY
         tKdA==
X-Gm-Message-State: AOJu0YzUdeM1fvNoqAo4/BIYfTbcSxZirU4rxdAj9mxpsGGN08HnUXHa
	WA9wni35hr6mZYGQbNp2p70P5FtV/R57K5EraapwV6aFytBcWi44AciFM2bWZcdKBAY=
X-Gm-Gg: AfdE7ckztfbcHfJu0F5NNv4CYpY8bcnFMjIuPOPYqsdvmrFT7KTyqvqaq0cZQEZ9GTi
	mU2BwayFAgrQD6KZhITZRytPi5XlENtj7Rs+klQ9DcKb2SjM7DWl/YVXyuMOu3miPCHFiJ5pmg/
	arsjk25dry4D4hQZhxMnjRmM2lJx84r3STP0KZ2B7/HynvpyQnhQ6CQ1BiexAqtllvFY9hwsnIn
	EVet59d6WbuIWXR87Lf3DmyKfYjrj+jJDTUY+YvahxLxbiaqIlKtrlIcmFUnWEMgRC2RAa0RK8m
	RZ2uoddKn00vN/JpU//Lja0ifUx9LDIl7PCU8kYncPh5YIGNl3FVX1R7B4dpS6euwKe1Sa+iXqU
	DNQm8r1N1KjLFdPzVQOTLvnYGypPWmn3qa2Njk0Xqvwl0ebC4i4i0N3XwmaWGaozWXbDYTfOptp
	3/iZSw4Bgxjld3urrcntD2uxQMxc+ByZtPEZlGzMXXirOeRkhKpg0NUpolmKEB8Gts17LB
X-Received: by 2002:a05:600d:c:b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-493c2b4431amr65140145e9.10.1782985307187;
        Thu, 02 Jul 2026 02:41:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:33cd:3431:8a4e:350c? ([2a01:e0a:106d:1080:33cd:3431:8a4e:350c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6354926sm41919385e9.1.2026.07.02.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:41:46 -0700 (PDT)
Message-ID: <92c1514e-eb93-4c85-81c3-b08530dea92d@linaro.org>
Date: Thu, 2 Jul 2026 11:41:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <ed1563c1-ecf8-440c-a39f-f8335db77b97@oss.qualcomm.com>
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
In-Reply-To: <ed1563c1-ecf8-440c-a39f-f8335db77b97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115895-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url,linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D80216F59BD

On 6/18/26 12:40, Konrad Dybcio wrote:
> On 6/17/26 2:53 PM, Neil Armstrong wrote:
>> Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
>> found on the PMK8550 which allow reading ADC data on the PMK8550
>> and other PMICs on the system.
>>
>> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
>> other PMICS on the system.
>>
>> Depends on:
>> - https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v4:
>> - Rebase on https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com/
>> - Change all defines
>> - Reorder nodes
>> - Link to v3: https://patch.msgid.link/20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org
> 
> wrt
> 
> https://lore.kernel.org/all/qgjntewdw2qesvkeabvx46zxcwrikvpkgthk7e2cqw7biuhmqt@2khmbjh2dt26/
> 
> you added a comment:
> 
> /* use the default settle time */
> 
> which the bindings tell me is 15. +Dmitry did you grab that value
> from the downstream kernel or something?

Yes I used the downstream as reference

Neil

> 
> Konrad


