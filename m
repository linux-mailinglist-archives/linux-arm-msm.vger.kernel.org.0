Return-Path: <linux-arm-msm+bounces-96200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAERLGKkrmkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:43:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF5237483
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F94304FFB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3572439283E;
	Mon,  9 Mar 2026 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyA2FOdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA477392C2E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053010; cv=none; b=I9/fF+xiSPI7o8I3GQ9gWUx9cT0WPeOlllYMHNA/qvzDcVIKiEZO9pHB3Z94xsf0qwaYYMRkdo83nfX7O05v9K7sHg2QMtxczA4HQTciu6Mrg/4HTbHE7VBDoNsCnTEoDcD2be3L0qk48ftwo6aSRe4j6A76AE1KYicD4KSobFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053010; c=relaxed/simple;
	bh=0mGwP1npF13+mveUUa9xyEzlo2GsKKm95aBIcO3Yp+c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VitQeVGljmtaW1H6to3q3NY9sTI5HdGY3HIRA4iJqWDZBSfmzcNyoulzcHKwJoPjEtyjWlhEGBRoNHax1k6eEzzBC8JlOicZYMKLk4fx5pY/THdBMTxeB2AvvUQ3QtQazhnYYHrm1tpzayR97tL77tMaMLIm0+CARJvp8GriCOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyA2FOdB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439ac15f35fso8076615f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773053007; x=1773657807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO33nrQTJBN0oESW+jd8KbSuNkISed6WOuwXvy0bMOE=;
        b=DyA2FOdB3h7NO9dTA+6YQqYFgoCeMfHuFRgTZoqnk6Oaf8p1jXNMb4ryaZMkQ2IDoa
         +z32dgtJ/mzmzSnzX2m0mXAAFFX5B2U8IcwkKqQjXui9PJnTKBuxYrl68fwU9O63ziDk
         lnXUUI0xJ5/CkmBx1YIqibLUC4UziO3hjOxX98Xh6F2xRrciNSuH8SCLUHBt+RIJ3Rd7
         cSZLfwBIKZBE+xvPj7Ui3gg9yAD6SZdMd2eNiarG+E/ZXlPU84VDaQ59uLa7NXIlmT6c
         3pLpkZntwiQh8WDZ9+/MbFwiYAgVa8JKUiGKRGzM6awdL7N3++icRtG0VK1t1tBqaaDe
         Y6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053007; x=1773657807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uO33nrQTJBN0oESW+jd8KbSuNkISed6WOuwXvy0bMOE=;
        b=E3GDK+tCnQIlUFXLIIUnTKoICQYWZGvd78Ms0vBDDyUNSMsXpdiwMF/0ZenBjJUYMo
         ZA9rbC4zjY5O1bSh3c79sA8OY/Jo66+T8W4bH5g4QRBjt3f3NDnBGfQZTwstob+rEC3Q
         JTzaMLCYwS7sdVivwxlJJ97OXv0VakozluPJA5BdIfA7Z0TqMgGYSCnFaH8Ho5zBTkcN
         4bSLCPsAvvTaKZCPkJlJ1h7jntJGhkNi5hs8yB9TLr7RffAKxqW743uWz4oKdppcM55Z
         Vft/pVtZ29kUeWnevKPO1ibOHskuvq6w4q2hTwmmGOFbJdfwsqNK1KLMn6L0DMhPQaw7
         B5BA==
X-Gm-Message-State: AOJu0YzHlyQLeX9poR4Is/AebFLfXhLCbxpATCYC6UuiYszO0M8K506c
	LGZ5mOuJw7MA2DNvwFVQs4BooHrBAvyGcRtOF7ObKHJvNqhbsTGH38X93WfXHuDI6cI=
X-Gm-Gg: ATEYQzyO9Rbs87sJx9odoqbuo06QvfpiqmEqWapKGbijx6OGpR2mmRglVcQRrB1ErPC
	FaoIfeBCw+Js5R6xnYGo5Y+UqCsi9/rjJ6lAskvfZFImz+frFpuuhjLlI9suEuoAWgs+sj95D0k
	2/wGNheLoX8nGP5bk6ZKMet0n/IpcdEJMF6mWPy5FtFSwwrnS+1fUcc5qp8wWRvBxZPrbKxaS3j
	qbfkaWZtAE09oQPpwwARvNrO7K+rlAp0ldCdbO87EqyBTX3kl+u9VcLsI9zi/3Jz0xLzCnRsX/o
	DKMjAFnV9NZSkdenEy94oMqiQKJivYg/Z91eqopfrXXCoXNSeRxnAlB1y7k6BmYfESaDsgdhKCg
	PJBOrKRrAilW1Opa3qfGnPKVGJDRwkdzRtZcfnkMxpVxz4wKkGGknWEsbpb1Zdf5BqCTn8yz2Sy
	aCGkqpdvqw0S0pu44hhq6EkC4DS80XfWd4I5y6+4U7DsI8y+l7RE6SCo+dnBW95O8JRiq+EeFnC
	S/wj+Vohm0AJEA=
X-Received: by 2002:a5d:5f82:0:b0:439:be2e:7339 with SMTP id ffacd0b85a97d-439da31dc6bmr18054588f8f.8.1773053007102;
        Mon, 09 Mar 2026 03:43:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:658:37a3:23e2:4cae? ([2a01:e0a:106d:1080:658:37a3:23e2:4cae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8dbb3sm23001591f8f.4.2026.03.09.03.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:43:26 -0700 (PDT)
Message-ID: <0af1c6d9-2408-4111-8738-5eea2c5d42f1@linaro.org>
Date: Mon, 9 Mar 2026 11:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected
 edge case
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jack Pham <jack.pham@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
 <7fcbf142-f2c6-4b9e-bb63-befa553aceff@linaro.org>
 <f8c968d0-0668-424f-9f5d-8ddd1b6f3fab@oss.qualcomm.com>
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
In-Reply-To: <f8c968d0-0668-424f-9f5d-8ddd1b6f3fab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 23FF5237483
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96200-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:replyto];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/9/26 11:38, Konrad Dybcio wrote:
> On 3/6/26 3:47 PM, Neil Armstrong wrote:
>> On 3/6/26 12:20, Konrad Dybcio wrote:[...]
> 
>> So what's the difference with :
>>
>>
>> if (blah)
>>      ...
>> else (alt_port->svid == USB_TYPEC_DP_SID) {
>>      if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
>>          pmic_glink_altmode_safe()
>>      else
>>          pmic_glink_altmode_enable_dp
>> }
>> else (blah)
>>      ...
>> else (blah)
>>      ...
>> else (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
>>      pmic_glink_altmode_safe()
>>
>>
>> Before, if mux_ctrl was MUX_CTRL_STATE_NO_CONN, it would set to safe mode whatever the svid,
>> now it's either in the DP case or at the end.
>>
>> I don't see the difference here, except if your desire is to ignore
>> the MUX_CTRL_STATE_NO_CONN for USB_TYPEC_TBT_SID and MUX_CTRL_STATE_TUNNELING.
>>
>> But it doesn't match the commit message at all.
> 
> 
> The difference is the call to drm_aux_hpd_bridge_notify() in the DP
> case, which isn't very visible in the patch diff.

Oh I see it now thx, but with this change MUX_CTRL_STATE_NO_CONN will be ignored for USB_TYPEC_TBT_SID and MUX_CTRL_STATE_TUNNELING.

Neil

> 
> Konrad


