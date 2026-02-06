Return-Path: <linux-arm-msm+bounces-92057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JclBssDhmmyJAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:07:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D9FF776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E87A3301C14C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 15:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F79276028;
	Fri,  6 Feb 2026 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhlbVCJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54AF27603A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390266; cv=none; b=BkYCt5pRCdkpkV8lViazifV3u7gwN+FRFQB33syQt0+ierLsNKfV1YgZFuohBN63tEvhH+focloqd8JoXYyZf6C9GaXipvGEo6hxTzg95O+NVESSgzwPpB1BeTDlSnHMR4Cu5+Fr5ZoxI5oQJCQG0x+mY8w2RamVvhKN2EIW+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390266; c=relaxed/simple;
	bh=TWeelvwE3q3c5UDl3+fr9q1NnMaWLa5005mFssDatPs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X0xC81XureKq3wKzYidlQ6xsGnjwgpRfHELGSeWk/QIiDo0NZwb0gS/UblC7OOtHItL7geyDaxvRZId+JesXLBB9WS8S98y6RP5pnox7X2cJOprRh9QG1zmiUbGw+Ul0LwRar6QgpXezyK9wYGXKGq9vOT/gbgvqUhT2iTI5TXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhlbVCJM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801bc32725so6520355e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 07:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770390264; x=1770995064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUCWo6bAA6ZgN340KdoXCx+F4UvbZIz9iBHPorzjHSI=;
        b=yhlbVCJM5z5ehVnMW5IiHGX64XDy9VwKRMmWmJMXW1D+2sa0e2UipwPOZCSB+vyEAi
         IyAUydWnYcmDpZcyqAyFE/bhgAcdeiJPXeuzJkRnELmppqQGxsc5HYEy+RSxa7/20Dq5
         dKimq7Z1QbI11jB/e6M/vRswSClW0D2AVAWf/I5ZAeJ7lylFK+MwqA9VkMVpJf24Fp9L
         j4QxKtzMhV2lheMAshH93Xt2K/rpxTflwqhy40uJEPy7MpY/CNHDPdH6/LKGDMPzpu4Y
         kdCJgXXhvnrTg894eiHPDghzlUpludojMe0UynuuKxyWA9yYMMKRy+IndjZ0ELSw0KMM
         6+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390264; x=1770995064;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUCWo6bAA6ZgN340KdoXCx+F4UvbZIz9iBHPorzjHSI=;
        b=BKwQvWhAt/2UCrRrEm5NDzKnW97PuyuaojwsnKK2sNlnlc/10zPXmozzwHutx4q+dF
         N2GMTgHMAbRSAYrnzLJcKdkAvnwjx8Y2BTlocITKIH9+tbKzneezmcWQcfizJjKyYAAN
         6w/BmKUxt4ZSipxXsPOGfW6cUt4Eg9XfaevV9qdsVO+wqlUJ/I/VvDz85EFyaAT1EpR2
         loHT0TSGojaMdc0Mw6yQEdqL8UIHSvDr+dIN7Ekfvdd0EUsnvbNHFItQqg+oxkd22q7u
         WC5ro93WIehspf2nsCE6YSGVbLFcrgp/XJhXczpx+nqGQ8UmlpqO17DJ0LU3n90OhMe4
         S3wg==
X-Gm-Message-State: AOJu0YymabLM/WDW7HOEhx7P/1R5iJvcpyshTgLsTg10NFRvjO3pqs9P
	WfL3ZLU1iFX4WU7BYMjXvMcxWBKFX8+pLe2KTMBlcFcUwH28l68AneFW5I5ZIHoLn1ezW5/2AJL
	idCDD
X-Gm-Gg: AZuq6aLPMOdbK6OS09ZebQLh8xnakq0zqzWlQzrNqkMSHH4LTm8ugigQGIuLogoVB+Z
	15OTVYUTUTDlXrfhYSHOGpTp94B2UvKdHfRZ2WBdXZCyEFhU4GRg061nqqrbxTk5YCO0+MFfbmp
	ytXH8oz1sr42k4wY3m4r/kb0bmbMUdLIFsL7lSHezLDmaNh3qW7+bQqfUqTsCH8qnew7rUyntn0
	znVeMI+FqvQ2olCr40Jt+Wq/OwwELPM+jTwfxY3sLGGc54l83AEMf7gPjnh84A+jn5sv4Y++By8
	GY5AXrZ5WbGkE3E5CGrXu2xvzb0uVfFLFBMrK087rbBh3GJMrIUWQ+Cxoiq7oZt0IWb15M884Nj
	dNDo/0wEf74opf+TcDYICrpe+yceuoGVk2qogu7M5BlrgkrGIhdwIMUmqId+oOBWUMO8drJ0snK
	vSznSYB88eAUwOjSwIDK6ycZFvBvDgtn92THq27Muze7wQU7PnzcGeyOheLbZRU6rPPg==
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-483202264f6mr44008695e9.31.1770390263924;
        Fri, 06 Feb 2026 07:04:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3ac5:1c69:1651:7d9a? ([2a01:e0a:106d:1080:3ac5:1c69:1651:7d9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm58740045e9.10.2026.02.06.07.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 07:04:23 -0800 (PST)
Message-ID: <e86175b8-5e21-4503-aae9-d485be2e3025@linaro.org>
Date: Fri, 6 Feb 2026 16:04:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
 <CALHNRZ__VTqAZ16Hn9QVN6-tS3eb7mfeY6hzDfw5AmBOHqfKHg@mail.gmail.com>
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
In-Reply-To: <CALHNRZ__VTqAZ16Hn9QVN6-tS3eb7mfeY6hzDfw5AmBOHqfKHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92057-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 656D9FF776
X-Rspamd-Action: no action

On 1/28/26 19:42, Aaron Kling wrote:
> On Wed, Jan 28, 2026 at 2:50 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On 1/27/26 23:48, Aaron Kling wrote:
>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>> for Android, using mainline kernel drivers. I have come across some
>>> missing functionality and failures that I would like to inquire about.
>>>
>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>> dtbo loads and the devices boot as expected. If any of the changes in
>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>> and go to the bootloader menu. This appears to be an issue in the
>>> baseline abl code, affecting all devices of that generation. Would it
>>> be allowable to merge a change adding those changes to the sm8550
>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>
>> Any addition to the DT must be documented in dt-bindings, so if it's needed
>> for boot they should be documented and added for sure.
> 
> I can make the change and see if bindings check reports any new issues
> before uploading.
> 
>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
>>> have locally copied the commits from sm8650 and adapted for sm8550,
>>> and that seems to work okay. But no measuring of bandwidth was done,
>>> so the numbers are likely not entirely correct. Is there any plan to
>>> generate correct tables for sm8550?
>>
>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
>> is fine but since the values were calculated from downstream DT tables,
>> the same should be done for sm8550.
> 
> What am I looking for in the downstream dt? I'm not greatly familiar
> with that layout. But if I get pointed at the right stuff, I can do
> the legwork.

As [1] points, I used the  downstream memlat ddr, llcc & l3 tables
for each cluster types with the actual EPSS cpufreq LUT tables.

So first, run your SM8550 device and get the EPSS cpufreq LUT table,
then for each OPP of each cluster find the corresponding memlat ddr, llcc
& l3 tables and add an entry like:

+	cpuX_opp_table: opp-table-cpuX {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-FREQ {
+			opp-hz = /bits/ 64 <FREQ>;
+			opp-peak-kBps = <(llcc * 16) (ddr * 4) (l3 * 32)>;
+		};

In downstream you'll get this kind of tables:
	qcom,cpufreq-memfreq-tbl =
		< 1132800  547000 >,
		< 1574400  768000 >,
		< 2073600 1555000 >;

By looking the code, this is handled as:

freq <= 1132800 then value is 547000
freq <= 1574400 then value is 768000
freq <= 2073600 then value is 1555000
and the last entry also works for freq > 2073600..

Look for the qcom_memlat subnodes, ddr, llcc & l3. Look at qcom,cpulist
so see at which cpu cluster this applies to.

The "* 4" comes from the qcom,bus-width in qcom_ddr_dcvs_hw,
the "* 16" from qcom_llcc_dcvs_hw and "* 32" from qcom_l3_dcvs_hw.

Note, add _separate_ opp table for each clusters, otherwise the kernel
won't use them properly.

[1] https://lore.kernel.org/all/20250211-topic-sm8650-ddr-bw-scaling-v2-3-a0c950540e68@linaro.org/

> 
>>> * As part of a series to support the original Odin 2, a patch to
>>> update sm8550 EAS values was submitted [1]. But that series stalled
>>> and this was never merged. If this change is valid, which per that
>>> discussion it appears to be, can it be resubmitted by itself and
>>> merged?
>>
>> I missed this patch, please re-submit, I also need to update the ones
>> for SM8650.
> 
> Ack.
> 
>>> * Per the mainline kernel device trees and audio topology provide by
>>> the oem, these devices use primary i2s for the speakers path. There
>>> was a commit adding clock support for that as part of an hdmi series
>>> [2], but that seems to have stalled. Is this going to be picked back
>>> up?
>>
>> No, I do not plan to do this work, it required adding callbacks in the
>> code to handle the clocks like done for the pre-audioreach firmwares.
>>
>>>
>>> * Inline crypto fails to detect hwkm support. And I see other logs
>>> online, such as for the sm8550 qrd, that logs the same way my device
>>> does. I traced the issue to the check for wrapped key support [3]. On
>>> my devices, the derive call is supported, but the other three calls
>>> are not. I was pointed at the downstream headers for sm8550 support
>>> and only derive is listed there, the other three don't appear to be
>>> used in the downstream driver. Is this expected? And if so, will this
>>> case be added to the mainline drivers?
>>
>> Does hwkm work with you remove the last 3 calls ?
> 
> I would assume not, since the ufs driver [0] references all four. And
> the plumbing doesn't do any further existence checks and just makes
> the smc calls.
> 
>>> * Some gpu related clocks complain about being stuck off during boot,
>>> causing stack traces, but the gpu does work. I tried to do some
>>> research into this, but quickly got lost in the weeds and I have no
>>> idea where to even look.
>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>
>> This may be related with the display handoff from ABL, did you add the
>> plat region to the reserved memories ?
>>
> 
> I did not, for these logs. Earlier in bringup, I did try to make abl
> leave the display on by adding the splash region, but that just caused
> display corruption before the kernel reset the display controller, so
> I pulled that back out. And I saw a comment somewhere stating that
> seamless handoff is not supported. Is that still the case, or should
> seamless handoff work now? It would be a much nicer user experience if
> it did.
> 
> Aaron
> 
> [0] https://github.com/torvalds/linux/blob/master/drivers/ufs/host/ufs-qcom.c#L311-L314


