Return-Path: <linux-arm-msm+bounces-113335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aYS5DnMMMWpOawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:42:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 924BE68D403
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:42:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="J7OZ/uPb";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113335-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113335-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FFA305A8FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C361A41360C;
	Tue, 16 Jun 2026 08:39:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9CF29346F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 08:39:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599142; cv=none; b=tmbPHTC/cOMCkmcDt+uFkRMVu8oxXBXMe+Jjqr0+URfDE9xGpAAwuOtrAvqPjNIgW5Nht3MJn39S8MvHik4cqZPa4qALCxmbinDPlmu1QJhbU5IHRMNDeyiaSobWNEtOLPoLbH9pnmBevBqGSqU0nt36Og3rjWPRi0tsvJFNKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599142; c=relaxed/simple;
	bh=k8aQq5wGmFAB4J4lBgkr9j72Y9UninjoFJHtA/6CKlU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fGZiGCPW+1fz4T4TUiey6jrBBxfjdZBH9bfWw5UPUF1PKoCFnqtX+FOVZ7ouASMWnAWsQ89eqmwNW+/VCt6k5U6XcMxthFD/iLK/cjAnoz9F6FbaDCB5LnwFu46pN21grOoksTLc53xLP+Mpamp/0OBpajKqcOyi0nOsLK0tQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7OZ/uPb; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b12270b3so26291615e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781599140; x=1782203940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTZp3Url2zZDdRq9wvwMvf217hOXdGlg4G7ifVPCt0M=;
        b=J7OZ/uPbYioBaElB78mQDC8gLuglE0SIflZu864FX+21Osctd+gkjzlUrqNWORzpxR
         OIDofk8l2k3i8E8nCtN+MtlehMgE9BQiggK5SCDy8TMNWUq795eSwo0bRunt9OPTivnO
         A1GO4Icw/4yTOsDFycv0G8zAegc2SBABQcXb2wHquEALpuU2AcPIJUpRi4A2BPeckiuR
         FtEKDlfmyCbXPgGB74M9IzWexkAm1POuDWUrMdkFtVYgrXIIXkpqvk68YcrQCrNBtyG+
         C6PMzV8A5c8o1gJyJNynwnMYxyF/YHiibeQF7fZq1nhtIwBGXbJft288cPp5/Mvi4Os4
         THAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599140; x=1782203940;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTZp3Url2zZDdRq9wvwMvf217hOXdGlg4G7ifVPCt0M=;
        b=fin0d1DDWr+EDCrqT1ou9ZMmbOPXmRQNnUKw+2hIequ410lkclOTfzUjRazeen4KW1
         QVhU8XKNE/gb9TDb/oEfuhlAgBu0QDytmuL7oKUjtq60k6gROKUlOn4Q1ykWzuXjs5yK
         1qRgo+Eaa1gkQ42tNmuH8Ya2dLXttjjaBU2JaRMCpMdD40BsbjktB36Gkd7dXblhb/2P
         xzDp8GGeIy8Iz9qEBBSIR+s0SMLCFyq9brnVQ2Xvf6r1M6FSJfZMHC4V1Pf4RyIWJ4xy
         OIAW2tEnHRXGHmwldOF2cLvWj1W2t4wlRrQB6/Dchnc16BZQFzSmEyxEo8bVdWAX7lva
         Ubog==
X-Gm-Message-State: AOJu0YycxOei1a/ap2Q0VtlHqika2wdmJeD2m16GsuGyMXcFsB/6U0+y
	ZOiTNzn+Xh8KNm6UNIEL0xdarUfW6ie2yom/5EsbEKBD2dZB8C22kjCpm4atKJ3tRo4=
X-Gm-Gg: Acq92OG1xzGmn54VCljwtUtR7U6h0kBg7yxAloFQnW7rKBU3ffiSB3ycQ07wyrMAIgk
	mJZHFd49QfnfwoNP1csl7kR5VKrjcWK8Cw5PZx5TCzohk0bgoHOkTRKikJ9yITYvRIsAOxUVJfN
	3hGc/WMQ7TPyezDIN2ftTxkc8LwG1p03Lfcn+R6UFSLEdMNmL/uivut7A+Fero/9pC30S/5FpiR
	qDmQOGSTTd3RRibiFHZigksgwJ85okUyrIJI0nRnQYczjtddEkqWCTlC1BWKjFfQy3s1EgPtOD/
	ci9VxNVlxFP8eyJmq42rJbOuaOXpuDEChBAkDTWlR2XinoOGeHs4D9OYPVCMXID1q7OTqCNxUMz
	FXbgSk8eXkH6uTXgoOjxIi0XZFUOcfG2y/dfw7jm/3UrZbaW6SHxXeXtwHfMHcGzSk2kbNrurXe
	adeoAw/uGa9GBq8SbR2qd2oteTy9t1XA==
X-Received: by 2002:a05:600c:34c8:b0:492:1e36:8c4b with SMTP id 5b1f17b1804b1-4921e368c91mr191827965e9.36.1781599139730;
        Tue, 16 Jun 2026 01:38:59 -0700 (PDT)
Received: from [10.3.4.22] ([212.133.41.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c10sm42736575f8f.21.2026.06.16.01.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 01:38:59 -0700 (PDT)
Message-ID: <50b8d6e1-7038-4752-a200-441736dc7135@linaro.org>
Date: Tue, 16 Jun 2026 10:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
 <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
 <1d4f3e4e-ec9e-44d0-9e4a-651b6920015c@kernel.org>
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
In-Reply-To: <1d4f3e4e-ec9e-44d0-9e4a-651b6920015c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113335-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 924BE68D403

On 6/16/26 10:36, Krzysztof Kozlowski wrote:
> On 15/06/2026 18:57, Neil Armstrong wrote:
>> In order for the GCC votes on the GDSCs it provides to be propagated
>> to CX, CX needs to be declared as power domain of the GCC.
> 
> I would be happier to see here short mentioning what is the effect of
> missing votes - do things work? - as justification why required
> property, thus ABI change, is justified.
> 
> The DTS patches gave me that answer, but should be here as well the best.
> 
> Well, don't want to stall anything here, so anyway:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks I'll update the commit message with the same explanation as
the DT changes.

Thanks,
Neil

> 
>>
>> Document the missing power-domains property to that purpose.
>>
>> Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> 
> 
> 
> Best regards,
> Krzysztof


