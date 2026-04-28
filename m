Return-Path: <linux-arm-msm+bounces-104947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJo1IZ+K8GloUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:23:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE08482850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01D513097E5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701BF3DA5CE;
	Tue, 28 Apr 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKO4vWik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33243DA5BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369678; cv=none; b=RyXjlMkCSESj4d6aLHAeUWqT6YiLTlPB8VPqO/2fmLWUamWG2fK+qXxO0AHZXw7EWSON/q1ussTTp8lG6q+bPYKXOP6hnW9l1iGzXndMStc01Gmn6nIk654UokPGzfIiahsTnEa7LBrs4g+dRxFL3fUG+oZQ+LtAq6BZlZx+Wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369678; c=relaxed/simple;
	bh=1s3zoV2UGzWKIUYJTiOORY7/gFXs9hQgskCHHMAdMIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq1qRnWmQJiQqtF7SMfMQqmN/jQOMc5mN1YWI6zmp4liqkfxyD/ulPXgfpTPSg3JMEPKpYs3OJyhRAGHuWhIzuH5ICtT2mD3vlZeJYYkzKlXnV+7kgVYjuQwirYiM0PpSWRUgxSgX3AN4qcDjaA1196UIpGstW8PTrWSVUVTntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKO4vWik; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7982c3b7da9so106179227b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369675; x=1777974475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=ZKO4vWikvtUIE8J9qnJMqCLQWdKSWMUwhsxjk0E3wNfr8Z9nlt0cJG71SpOcZ/81Kb
         nvPcRM7y9/SZVWbFZ894Im9obwBcHVuwMuTFLJIKg3rGdzi+ziMvdKVw+rc6hz9Qx/xE
         Wmc5N0MZjRhPKsmdiTQ69ed431RhJUcpHggKT85MZRXBkZNm5feRhcLDqeuw3PRUUEA7
         R2kcBT3tNdJFj3wi5x+hBhmiePzBUhch3iAZDsfZnXTH48hfkkhx6/jWNuf6YHvv/frk
         cSfh3WQrMgO6Iuy7PYwYC0loPGAfCS9ldMRFCdjye37H5O/m733eNt35F3Okugn4Odi2
         1Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369676; x=1777974476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFFNaiD3e7rjmKA/oxd0MaN/8EMgqV0cx8JEjl2p0DY=;
        b=sWoB//X80MJHL0vaQ4nXqrHn5nbCEy+G0poIj8XXUHRZjnFAbWpFdLMT6JgV8XacQI
         cz9gEzXxQE15uLFvTorUGbBAZhLWIQw37zArpCx9M26jeFUNv3T0oj3pcCbI6XgwtggZ
         dQsygu5XVpduh6UfUnvZmxzNxOqp1ayOzLx+0kQJAIeLoEqegvwk53HfQSY+p0LTGSXS
         b5zDORRVJ257DXwecsvRA1ESkkiWYdC8c/HOVHCFbyNPpebJcsu9qvDKXQEbT1PVX1+m
         LQIVmAQvPL0oX8AsQGYVQBA8sNFkXQOaLuWmDXHCPymRhCMjFeYFbRB1PmQjvHSsPUAD
         DpSg==
X-Forwarded-Encrypted: i=1; AFNElJ+aGWX1WVgr42RGeS+yGUB4jGbsV7U14iNu7838s++sX+LWxqToFVoIRl0XtJ8bT9aM5qDvakd+x9jlhOf3@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPcgaCKB65JZF/+5Tn1jpd3mCrYvrd5BwF8tCRv5Na5tgUwgN
	TknZbxTvdJEQuKTqAKzTJbOe3JkvVkHXvoMMifLyq4/ANTyclh6YPVN1
X-Gm-Gg: AeBDietQOrgXMRmDZ50PereDGcIdU2lMbIr2iEI56hnhJMPQuaE4oOT+ny75f+/gLDl
	75Nr0X4Ydm2SNQZkp9ufFOrNUYxyZUUwK00EejlK4BkLrcOGV7RDHXVMchvVFo9apw/Ii/8T1cq
	4g648OVgPl0vN0N6jbuXStKcJ+UMQ1bVrDitjPbZhUTe7Lxk2rOYp+tYTccGJKwjpifWW9e/oYX
	7321P56/f3HapINLpLBOlyw0Y7GNDoEw1DGL5iK0JaKm8Rwnx9gpKUM+EgG49vAjLEwHaG34X5b
	ouEX2SNpqQYvPlXMZUAGNjiGOjtZeVCuXymtoQgmj+RHHXPJ1sJodrtq2zr9LuypCHuwto+7e8l
	wene3Rh3qr4/DazrMCYk/nnJfYhXPSspUu/eAi2nUHWrZm/+jPfJ6QZoozI3vmm4SDS2i9MGJgo
	Gs+0sZb/5oiuSsp4iLp9LdaMwrYIYazhovAsKB
X-Received: by 2002:a05:690c:6e86:b0:7ba:f2f1:86c7 with SMTP id 00721157ae682-7bcf50d07d7mr20810327b3.1.1777369675548;
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e4740sm14218867b3.14.2026.04.28.02.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:47:55 -0700 (PDT)
Message-ID: <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
Date: Tue, 28 Apr 2026 12:47:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DBE08482850
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104947-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pastebin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



On 4/28/26 10:10 AM, Bryan O'Donoghue wrote:
> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
>> +
>> +            video-encoder {
>> +                compatible = "venus-encoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
>> +                power-domain-names = "core0", "core1";
>> +            };
> 
> So to be fair in this case you do have a reason to have an encoder and
> decoder compatible here _but_ it should be the case that one one of the
> sub-devices contains CORE0 related stuff and the other CORE1 related stuff.
> 
> Because in that case the sub-devices actually represent individual
> hardware settings.
> 
> So listing power-domains and clocks for both cores in each node like
> this militates against that.
> 
> The other thing is to double check of the encoder and decoder are inter-
> changable here i.e. can either core be encoder or decoder or is it fixed ?
> 
> I believe on older generations - perhaps not on 8939 it is not
> interchangable.
> 
I found this in LA.BR.1.2.9.1_rb1.5:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
Only decoder bits are being set in bus configs. This suggests that the
cores are not interchangeable.
Then again, I never managed to get encoding working on MSM8939. Testing
it with
gst-launch-1.0 videotestsrc ! videoconvert ! v4l2vp8enc ! queue !
v4l2vp8dec ! xvimagesink
Fails with the following log: https://pastebin.com/nmZcLgPV
And in dmesg it reports a firmware error:
[  784.461031] qcom-venus 1d00000.video-codec: no valid instance(pkt
session_id:dead, pkt:21001)
[  784.461126] qcom-venus-decoder 1d00000.video-codec:video-decoder:
dec: event session error 0
[  784.461200] qcom-venus-encoder 1d00000.video-codec:video-encoder:
enc: event session error 0
[  784.468799] qcom-venus 1d00000.video-codec: SFR message from FW:
QC_IMAGE_VERSION_STRING=VIDEO.VE.1.8-00099, Err_Fatal -
Z:\b\venus\utils\src\vbuffer.c:1319:
[  785.791641] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.018339] qcom-venus 1d00000.video-codec: System error has
occurred, recovery failed to init HFI
[  787.097253] qcom-venus 1d00000.video-codec: system error has occurred
(recovered)
This happens regardless of whether I enable the cores for encoding too
or not. The same errors were happening on MSM8916 as well. So I can't
tell if these cores are interchangeable just by testing.

