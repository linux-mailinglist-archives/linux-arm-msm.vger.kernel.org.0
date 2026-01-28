Return-Path: <linux-arm-msm+bounces-90926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxJH93OeWnezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:54:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D09259E7D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22598300A135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37E3338925;
	Wed, 28 Jan 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fl+R3N9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07A62E2665
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590256; cv=none; b=mSr+loGSpi/nn1TmIJN0h9TZxy51qfXLVTP31sJKNKA6UfEJQiNt6Y+tU7UfiGuMrGo3HXLbBVbgn5woz12OO1nnETGWKrp7gRUBzUKekyGBs83A8H3yqhrEH35u/Mk8+hovQHnjgT5vLqXhzKEsvtHFchIJZxFEUFSPD6P13mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590256; c=relaxed/simple;
	bh=QwahENjRv6yMSgGKusNuEi0ZgjRSHxY1JzqJONC4wcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uNIHej1rB0nnofe7UPyhjtb0nGd8GBgWCXfZ9oDE/yQKdN8dIgKhKIBZ0SwHN+SoZCrXN2yQLkmLn36J1slve6GTHk45FyvYANQdkVUWwvC6fHGHYsEYA2fytNf+swLEadJwa+lDc6vyUDKRY0RCfvs52vuWkM3F5jc4dSWEPCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fl+R3N9K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so6304941f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769590253; x=1770195053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GDRqSH86rcZ7DxGiPdA8r55+F0/yRBX+4Wy4L/WbZM=;
        b=Fl+R3N9KpiTHVk3JOA5V4r5FWFM4PWppVmockBN+VmR4hr9hOAulsOAoVUXHP6HwY4
         /OMAElbh9qAynbjzGWOEflOSiuAvlTVw/8wHvMI+gOSCaByxpZtu9cXUvCLMz4nlIF9G
         Sa4SLDq/0uK2C65SXiHgf9kT6/HxfbIGKlR6ilHHstMyFK7uLHGLmBj9cTn/X/GPIb6B
         cz6pLoHZmIuFBvGiCfEa9hvUn7Lc7tdK50WWixpuc8a2DwRaCyFJZNS/U0IePlYNqpyG
         dWxhUBCemxMvL73fHVt46/TOuGc+sy25EV5HywcoF53Q0K66w7OpSBJqkAGt54gCN90l
         81ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590253; x=1770195053;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GDRqSH86rcZ7DxGiPdA8r55+F0/yRBX+4Wy4L/WbZM=;
        b=k+hWe0GjDGlImkU8E1kuDubNLfgx1nlNyzPsnS/s8aYI98w2FhdQujEgGbmhJpJp2V
         Ctelr/YLGh97EV13M4pHybTn6Vf8Q57EUknLPHbPfI6z0G41T2LzICanm+VytgQ2Mm4y
         Qt/eN2mAm+pzH4WHCFo6rb/IV66fTks1YuJjVNa1BWOJRLUkFqnGXWyoETMjpy3rMSKh
         b2AYSnj1S/r1dGoQnObq5+Ro5K3N9JP2GaO89go8QbYR+OCV/gYvTePLbI+THr7zM/Sw
         QIr1DE+tc16YzMayO1IADPpiQLyIBrWpZiNHLWRiD3yOUsTVA1ag79n0ZUEoKCM/fg5v
         h43w==
X-Forwarded-Encrypted: i=1; AJvYcCWusYqdNaufHjjwxGL+JIyd+Nou9DcsqUiI1pIpR8o9H8SudQOhEr2GE/5yg/Mo6pDEHjSlYnhlu/oHR51i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3eU86xYsZSMjv7nI6NFgCiHxikLKRZ02fT65W3MiiWkPnEPtc
	WVprKl+5/0MmDv2Ert9mdIhWop2ocNOy/EUmGMgZ6FluG0+HWfKPbSpWM6JVS5iXifM=
X-Gm-Gg: AZuq6aIOwkB1mTgy9QXkmg6Q4TgwFTjl3SHk+D08IinK7yW3w+sZ5rZ3/OTFRjcRiw9
	ShWlaZp8tQIUHj2oxmcvTGKMFh8VMt7G/kiaP77g80AKs5E8rFDSskkp2W2qhe86+kY5VwfE71E
	22U8AAc2sN+51/yHpKKkkX0Lw9JyGvJv1ECeI8vi6p0XKEhcd5syvL0UytGV2krr4geOhzx7tsJ
	hteAH/MF62CuhbmEkzNjtI1lf5zdQ+wVoy7ps5ibYbbP9ruDS6gydY0v1gih64A412HRPia8pov
	EVopbexq6P0chJTZ0ay67asV5BWrX2B37CQs0Kp4PUSawAVMoycc7/o1qds9Ynk/3HP4hhDZPgk
	7v/fRv+BLlBFSGZwUGJOmFKzZ1JP3ynq1fI8t0mmjLLcNhDpdTfCSaIzlJO+4CHEju120VZqJGA
	djZvhn7OtvAKvLKylfXjzttL0YWGZiZ2VxwluHbJ9cLpLs/IfNqR0JcB2xNciaIU8=
X-Received: by 2002:a05:6000:2408:b0:430:f255:14b3 with SMTP id ffacd0b85a97d-435dd1bced5mr6308702f8f.43.1769590253095;
        Wed, 28 Jan 2026 00:50:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68? ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm5157254f8f.35.2026.01.28.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 00:50:52 -0800 (PST)
Message-ID: <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
Date: Wed, 28 Jan 2026 09:50:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>, linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
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
In-Reply-To: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:dkim,linaro.org:mid];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D09259E7D0
X-Rspamd-Action: no action

Hi,

On 1/27/26 23:48, Aaron Kling wrote:
> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> for Android, using mainline kernel drivers. I have come across some
> missing functionality and failures that I would like to inquire about.
> 
> * ABL fails to load a dtbo using a baseline dtb unmodified from
> mainline. Using changes described in the gunyah watchdog thread [0], a
> dtbo loads and the devices boot as expected. If any of the changes in
> that post don't exist in the base dtb, abl will fail to load the dtbo
> and go to the bootloader menu. This appears to be an issue in the
> baseline abl code, affecting all devices of that generation. Would it
> be allowable to merge a change adding those changes to the sm8550
> dtsi, allowing an unmodified mainline dtb to work with overlays?

Any addition to the DT must be documented in dt-bindings, so if it's needed
for boot they should be documented and added for sure.

> 
> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
> have locally copied the commits from sm8650 and adapted for sm8550,
> and that seems to work okay. But no measuring of bandwidth was done,
> so the numbers are likely not entirely correct. Is there any plan to
> generate correct tables for sm8550?

Cpufreq works but not the interconnect scaling, so doing the same as sm8650
is fine but since the values were calculated from downstream DT tables,
the same should be done for sm8550.

> 
> * As part of a series to support the original Odin 2, a patch to
> update sm8550 EAS values was submitted [1]. But that series stalled
> and this was never merged. If this change is valid, which per that
> discussion it appears to be, can it be resubmitted by itself and
> merged?

I missed this patch, please re-submit, I also need to update the ones
for SM8650.

> 
> * Per the mainline kernel device trees and audio topology provide by
> the oem, these devices use primary i2s for the speakers path. There
> was a commit adding clock support for that as part of an hdmi series
> [2], but that seems to have stalled. Is this going to be picked back
> up?

No, I do not plan to do this work, it required adding callbacks in the
code to handle the clocks like done for the pre-audioreach firmwares.

> 
> * Inline crypto fails to detect hwkm support. And I see other logs
> online, such as for the sm8550 qrd, that logs the same way my device
> does. I traced the issue to the check for wrapped key support [3]. On
> my devices, the derive call is supported, but the other three calls
> are not. I was pointed at the downstream headers for sm8550 support
> and only derive is listed there, the other three don't appear to be
> used in the downstream driver. Is this expected? And if so, will this
> case be added to the mainline drivers?

Does hwkm work with you remove the last 3 calls ?

> 
> * Some gpu related clocks complain about being stuck off during boot,
> causing stack traces, but the gpu does work. I tried to do some
> research into this, but quickly got lost in the weeds and I have no
> idea where to even look.
> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'

This may be related with the display handoff from ABL, did you add the
plat region to the reserved memories ?

> 
> * Sometimes when starting rendering, a bandwidth submission times out,
> then the driver immediately complains that said id was left on the
> queue. I have tried increasing the timeout, but the same sequence
> still happens. Timeout happens, immediately followed by a matching
> unexpected response. Implying that this isn't actually a delay /
> timeout issue.
> [ 1848.517020] platform 3d6a000.gmu:
> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
> *ERROR* Unexpected message id 1015 on the response queue

Weird the timeout was extended for this very purpose

> 
> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
> unsure if this is a kernel problem or userspace, so I'm submitting
> here first. If the consensus is that it's a userspace issue, I'll
> submit it to mesa.
> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> 00000001512E9000/003d ib2 00000001512E7000/0000
> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> (com.futuremark.dmandroid.application)
> [ 1860.258126] revision: 0 (67.5.10.1)
> [ 1860.258132] rb 0: fence:    2884/2884
> [ 1860.258133] rptr:     36
> [ 1860.258134] rb wptr:  36
> [ 1860.258135] rb 1: fence:    -256/-256
> [ 1860.258138] rptr:     0
> [ 1860.258138] rb wptr:  0
> [ 1860.258139] rb 2: fence:    41563/41569
> [ 1860.258140] rptr:     1752
> [ 1860.258140] rb wptr:  2319
> [ 1860.258141] rb 3: fence:    -256/-256
> [ 1860.258141] rptr:     0
> [ 1860.258142] rb wptr:  0
> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> CP_SCRATCH_REG2: 41562
> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> CP_SCRATCH_REG4: 3736059565
> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> CP_SCRATCH_REG5: 3736059565
> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> CP_SCRATCH_REG6: 3736059565
> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> CP_SCRATCH_REG7: 3736059565

@rob do you have any idea how to solve this crash on a740 ?

Neil

> 
> Aaron
> 
> [0] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
> [1] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-7-e0aa05c991fd@gmail.com/
> [2] https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/firmware/qcom/qcom_scm.c?h=v6.18#n1285


