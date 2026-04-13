Return-Path: <linux-arm-msm+bounces-102889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHGlOmqo3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:25:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1A63E9141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E33230088B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A112E4257;
	Mon, 13 Apr 2026 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRjUInwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B63A7F5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068703; cv=none; b=c//VkOA9+ttcJ5TGf8dqbPTGmMuxsuZdrKoqxS339FTlxmUkVlR7pga9Mh2wWGXBJQnksPau0855IXj31iEGeTWuWi8pL8er9QjUsCeD28qjSLn6w8WR6bUQ76l27U7/r4d17wLO6lLvZTUXIJB5JcNp02ST6EqKHo6aQKSuf5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068703; c=relaxed/simple;
	bh=MplQ7Ms9QA4WoWpN+uhluqNjFz/p4moBrktYEmcBMQY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HvrXRMGnIeCob6yUoIWfQ2F5BD1BLZsb2bvaZaLwjXA3vN5smODbb2/AWcHZmpLR809qPLLKUMJBIKZ2BNaQ54hXFzJzm0kK/2B1GMbLAjTpEePOQF9EvFpKqTKOqr3OC8cVn+z5q1kpmVso91MpCSnj/iTZC34d2nGDTRXM9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRjUInwO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488c2690057so38802815e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776068698; x=1776673498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8r/K3zwlnRTdt0ijOn6gLjmBTMHGGUrXCeyxk3OAv4w=;
        b=PRjUInwOZPkVASBqiBB6zg6xN5TaUh1FQmY8OmnlHbJOlGBbHCiZ58X1Dj2gbeRjsa
         veh8fQgYmb8k+llnN7j6XdE2OnHhTK9HSC0FlJ2qYCAlfYMK40xMrpmMWX1SpwTXCW1i
         JpeUldlal+QGWjWdiVWierFOslCf4OQ0x+9bCBgCxi/3wYU5TUlf37LrVutQKAZdBu9E
         rs5d+iCy7/31FMpz6sfXaW/WbJhj+4aC92tRaW1CS30Rn2ErblV8juyyQx2j3VIs58zQ
         aj2jOv/6KooBqAuHfAgULkLmqaBX5rxdFD7zKzbcNt4LngoOHqRBu1UsZo3Kd+DW+R4y
         UjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068698; x=1776673498;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8r/K3zwlnRTdt0ijOn6gLjmBTMHGGUrXCeyxk3OAv4w=;
        b=bBVSndDdSLmgoXIrqR8ZdkCQq6X8iOTl+w+pNlK0sheBQRdnCuVGGJZ5mjGE+4pjkb
         8Pyyv476lczIi15zURQ5FwVVfi1gUP64ydaUuNEH4HpkdZuzIVDio2RyMoMPURyG++sz
         mFC4+18d9lJYFThJUv654U/2aGV1/KZshyc4mpJjK1KxjYLI9tVvfUXGQvNhvnG1SOYm
         Ku2n5SUC69ffsGHcIET8pb7UgEHkTcBwu/pfsjFGQLZSdVxD7uVwWlQin/5bk/NWUHq+
         SWBF1pDti4z44q/oQehA7IjRDUqU098Vgp2NKUXawNx/BUf7omLRdnWpR+ff7HS1VHbL
         FFUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WBmobj0usF2eoJWxIW4WmtOVguX8dYjrvNZQDDbkfmpC8K8760vHv03ow+Mf1DCgFGb4fAFBVAoL6tVBh@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNsTa5iwLzNY9uMDf4KkbjnmwmJXDn9EFN9OKgzUZddk3iYFt
	HekDIE7k/kI7EpaVcQIDhXvDUTmWHSP2AFhzxExWIk5wfNLU5JjPiQIjDc8pyXnGAOA=
X-Gm-Gg: AeBDietggzi4q9GAN+IvsMdaYCy3wpNUqfoyiOk97GKOvPW2VEh9A4iNwVxCUsmG63s
	BAymrLXKE6PVdaCClukcCNer2eTD+6WhnuKXgXHL5OOFofYxtJftWENbdJHpn4vkREp72n8nqrj
	LymNQsR+BAUE2M4kEVl6wsZC+QZPA+VnVz9TZYw+VEsSB8f7GdO+gYNedzDYQnNcOIGl4TaDSjU
	fXKl2o8kd+Zc+Z2z7KTn2htHQ5hmRGj25/21oN4qtmi16EkYgmdfW2eWEvF+JIDKfee2z6J2D8V
	XPmqfZDSJtgZbMMUfKZmgawrbt/sm1FZMdxF5srq3dTtSBz9cMIwP12OuZEaSldvdiT57K1iMnV
	y1OrUaSyZSMLBFfCR9opO1gl5VIlVzpYSmJWwxcmVHkFLq7UapYw6spz1RczEIqrJfpX7F2fzZE
	EbAAUylVx2snlLibKlUiLJLphEXKQCUrjxPx7xbmyJcMDlm7hnwEbbunZWwq+y/R1AtISnuDVWm
	eU3Z2gx
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488d680577dmr162218985e9.2.1776068698236;
        Mon, 13 Apr 2026 01:24:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm30274236f8f.5.2026.04.13.01.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:24:57 -0700 (PDT)
Message-ID: <78f74720-5088-4d8b-a320-ed6b0323bdd2@linaro.org>
Date: Mon, 13 Apr 2026 10:24:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
 <7b7b0c03-3c99-4253-8c30-b8179119e6d5@linaro.org>
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
In-Reply-To: <7b7b0c03-3c99-4253-8c30-b8179119e6d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102889-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 5D1A63E9141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 16:04, Vladimir Zapolskiy wrote:
> Hi Jagadeesh,
> 
> thank you for review.
> 
> On 4/2/26 16:35, Jagadeesh Kona wrote:
>>
>>
>> On 3/31/2026 7:31 PM, Vladimir Zapolskiy wrote:
>>> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
>>> domain provider with a special Titan GDSC as a top power domain in
>>> the hierarchy and as a clock controller, where the clock provider
>>> function of the IP strictly depends on top Titan GDSC being enabled,
>>> thus it makes the CAMCC clock controller to belong to Titan power domain.
>>>
>>> Today the formal hardware dependency between CAMCC power domain and clock
>>> controller is managed by runtime PM in every CAMCC consumer device driver
>>> like CAMSS and CCI, however this is terribly scalable to any future
>>> CAMSS IP device drivers, and unfortunately it is not scalable at all
>>> camera sensor drivers, which are also CAMCC clock controller consumers.
>>>
>>> The change adds an option to describe CAMCC power domain to CAMCC clock
>>> controller dependency properly, therefore runtime PM management can
>>> be simplified on the CAMCC client's side.
>>>
>>> The series touches only platforms with CAMCC drivers, which marked as ones
>>> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
>>> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
>>> change, because camera clocks and GDSC power domain are not separated from
>>> other media clocks and GDSCs.
>>>
>>
>> Hi Vladimir,
>>
>>  From the camcc provider driver, there isn't any HW requirement of keeping the
>> GDSC ON to access the CAMCC registers.
> 
> The change is not about getting access to CAMCC registers, it's about getting
> access to the provided CAMCC clocks.
> 
>> From the camcc provider side, we are already taking care of camcc required
>> dependencies(MM, MXC). Similarly consumer drivers need to take
>> care of voting on their own dependencies(GDSC, clk).
> 
> As I've stated in the commit message, sensors do not belong to CAMCC provided
> power domains, but they are CAMCC clock consumers. Access to CAMCC clocks
> is broken, if the internal to CAMCC dependency is not resolved properly.
> 
> This changeset resolves it in a way, that CAMCC clock controller strictly
> requires CAMCC top GDSC to operate, is it wrong? Shall CAMCC clock controller
> driver vote for GDSC?

I guess not all CAMCC clocks requires TITAN gdsc to be on, but most of them
so it's a good solution for now until we figure out how to describe the
_real_ relationship between clocks and GDSCs.

Neil

> 
>>
>>> Vladimir Zapolskiy (2):
>>>    clk: qcom: common: Add option to link clock controller to power domain
>>>    clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
>>>
>>>   drivers/clk/qcom/camcc-milos.c    |  1 +
>>>   drivers/clk/qcom/camcc-sm8450.c   |  1 +
>>>   drivers/clk/qcom/camcc-sm8550.c   |  1 +
>>>   drivers/clk/qcom/camcc-sm8650.c   |  1 +
>>>   drivers/clk/qcom/camcc-sm8750.c   |  1 +
>>>   drivers/clk/qcom/camcc-x1e80100.c |  1 +
>>>   drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>>>   drivers/clk/qcom/common.h         |  1 +
>>>   8 files changed, 23 insertions(+)
>>>
>>
> 


