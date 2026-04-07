Return-Path: <linux-arm-msm+bounces-102107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLSPNPrZ1GlxyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:18:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 802183ACAE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6143058DFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8D43A7F62;
	Tue,  7 Apr 2026 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyyIOL2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C003A75AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557002; cv=none; b=lINIoVJSGMMrX2MhmwMmyRqtqv9uWptZBcLV3CiwD5uqeOpfLKbx5JTCveTSr++to5aBZVXb84kwqEld0Rmya1j/t/9fCzsy1yhKcrBFXt+UGmH1Q2neAQ913V9qkAxbn54XzXEFOIbJNjNxQBjWWTyKRNnwvOVjwcHt6Ohm0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557002; c=relaxed/simple;
	bh=kyte8Uv93kBGE6L7jytsmKq4nIPwhHVQjTryvIrMlyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6G5/dwN3osPxplCL+vJsyEAFxQBDx4vWq5J1u6WYqiRqaGsPuwlsnssgM0HFrbXVZ7XROawhoE729eD2jMhtFtRKQnwTYE4GemHH/KgPA08grMiKN9JrX0LgA7QxskKzFhwOm7/M+cPOWocjEqdKPnHaOJHtKQ84NT9jVbeI5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyyIOL2k; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfd96354aso2940498f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775556999; x=1776161799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYgo64gQdukpszABBGVuc7lkqiZyqohOn3FB0D8IAmE=;
        b=ZyyIOL2k+7+h7Lfp7J8jQV1H1TNzCcGi1hKyk+tCaAMff8tBprz3No4I0uyIKU3QDA
         OP53g0rJ67BN0gHGMUfR29LD8VN4f5xPfj7c9X5jCYMkdnW4vFua8RS6wLgI2iO3ART9
         tr+ZruMJJIKpV8myiGJr410a31FxLkVistm8WltwtLF6Hl10Y5+oI47pK7JpYBjJNhLH
         vY6BZCR5w6oKFlH8DcOl+ZrUCw83SiZmasvLG4mLFGvp+OCcVCGlJ0v0kbVxA7XQVOwW
         KPWRDImLbJ2NVCqWQFqpukAyG39mEkoxi2ITwYzF6evqsbYRxxzRh+kpgx97wRLUpRba
         O6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556999; x=1776161799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYgo64gQdukpszABBGVuc7lkqiZyqohOn3FB0D8IAmE=;
        b=UvOkklQhhYSrlY0zJ57Cgx4NNEYoXzqC/KWOffe+1lPjF6UDCLIsj1SSXI0A/RIKOu
         8+vj5BW3QxZn9BZ8QisZXlSOT93HESL0z6bWvx293JAJOjUmiacFY1mOdOL/lMqU8vxi
         vbjZdQlb6sAmc/8edmQgqtnLK+rYLjKUIiGsR2RtXDL5UpwFag1y72s21zt9M5wJceKK
         4tBIdATSgFahEBQWHlIfr313Go0KRnN24u8kTT46Bp6ykcsQWHuozCwPhiih7UYzyWer
         u2i3bFNj1ItdR3nNIlBBEUhD30CpkakUtEVBfq4OodbMGn37XTSRebh7978kEn6xOT96
         aHcg==
X-Gm-Message-State: AOJu0YwLwmIDBPo9Wk9ljJvxKqIYaeCL7mMm7bLszJZvvWVELwvZT5G+
	iUca7hxBdak+2gbINK2me7tFPIAf65Wlo/w5j1KeOUGsri6DrtQgSZmF
X-Gm-Gg: AeBDievWc3gLl6Q75x8xtuujH8li6dpfy4nE95Hc9izX41s2JAIrcRDD6Rwt/gM0Tr1
	vnLQRCTP6YPyr6wnKcjhMqqJVgT38mmgaI8FUD2Ri/maa7RupPKAIRaRiGbTO19aE0jaD5VX3aZ
	qJs4duD2ZASTpMgD5sNLEHIGw+y8oN8NxPC/5Miia6fd1Y4uPdtXqIcsb31IU1jGWK1v8NMhg5V
	cTurRBjGLNZafNewsNbmdlBNkB78VNc0PF+hkUj5A8SyxG/+IM54oHsQiw5CbsggrShcUsM2fFn
	rLYVfk3+OQMjckc+Gl0JQtcD4PhvKE2rqXJR3texINBGBNlhsVoS8eEtBXeVXYqQla/jX9wwpvJ
	mHWnHxcfXkIZk7aqpJb2SXuvW5qrn5kgNE3ba7l7U6uI5Pn2xNzs0z14t1kjD6fh84qXxm3GsLL
	vwny0rBDO4e//+1EzsKKXVAxu2xJmHRp+9HaQRr78L4Q==
X-Received: by 2002:a05:6000:1847:b0:43b:9903:2ba3 with SMTP id ffacd0b85a97d-43d292e1e8emr24866383f8f.33.1775556998861;
        Tue, 07 Apr 2026 03:16:38 -0700 (PDT)
Received: from [10.10.10.101] ([87.125.10.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm44461885f8f.7.2026.04.07.03.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:16:38 -0700 (PDT)
Message-ID: <9f04ae8e-e15a-414f-a436-987d02d31cdd@gmail.com>
Date: Tue, 7 Apr 2026 12:16:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
 <103424579111FE76+93c3daf1-4bce-440b-9048-74edb833031e@radxa.com>
 <cc8ba407-1d44-419d-9171-b6911f673772@oss.qualcomm.com>
Content-Language: en-US
From: Andriy Sharandakov <ash.ashway@gmail.com>
In-Reply-To: <cc8ba407-1d44-419d-9171-b6911f673772@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102107-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ashashway@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 802183ACAE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.09.2025 11:15, Konrad Dybcio wrote:
> On 9/12/25 11:04 AM, Xilin Wu wrote:
>> On 2025/9/12 16:56:04, Konrad Dybcio wrote:
>>> On 9/12/25 10:03 AM, Xilin Wu wrote:
>>>> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
>>>> computer, based on the Qualcomm QCS6490 platform.
>>>>
>>>> The board ships with a modified version of the Qualcomm Linux boot
>>>> firmware, which is stored on the onboard SPI NOR flash. This allows
>>>> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
>>>> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
>>>>
>>>> The board schematic is available at [1].
>>>>
>>>> Features enabled and working:
>>>>
>>>> - USB-A 3.0 port (depends on [2])
>>>> - Three USB-A 2.0 ports
>>>> - RTL8111K Ethernet connected to PCIe0
>>>> - UFS 3.1 module (depends on [3])
>>>> - eMMC module
>>>> - SD card
>>>> - M.2 M-Key 2230 PCIe 3.0 x2
>>>> - HDMI 2.0 port including audio (depends on [2])
>>>> - Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
>>>> - Headphone jack
>>>> - Onboard thermal sensors
>>>> - QSPI controller for updating boot firmware
>>>> - ADSP remoteproc (Type-C and charging features disabled in firmware)
>>>> - CDSP remoteproc (for AI applications using QNN)
>>>> - Venus video encode and decode accelerator
>>>
>>> You have a number of features that depend on several other series, and
>>> as Krzysztof pointed out this is difficult to merge/review.. Could you
>>> please create a "linux-next/master-ready" version of this series and
>>> separate the changes for which the dependencies are unmet, putting them
>>> at the end? This way we can take at least some of your diff.
>>>
>>> If you still want review on them, you can also send them as [PATCH DNM]
>>> or so
>>>
>>> Konrad
>>>
>>
>> Thanks for the suggestion. I think I can separate the changes that have unmet dependencies, and mark them as DNM. Can I send the new series now, or am I supposed to wait for a few days?
> 
> Since we can't do much with this one, please apply Krzysztof's review
> comments and tags and feel free to resend
> 
> Konrad

Xilin,

The prerequisite for the "USB-A 3.0 port (depends on [2])" feature has 
been added - 
https://github.com/torvalds/linux/commit/f842daf740114a8783be566219db34c6a0f1d02c

Could you please check and resend the USB 3.0 port feature?

Thanks.

Best regards,
Andriy


