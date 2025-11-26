Return-Path: <linux-arm-msm+bounces-83499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA6AC8B2B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B333B6EE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8055523EABF;
	Wed, 26 Nov 2025 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzFn56Kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD8722F772
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177479; cv=none; b=EQzL5mfOMK9jA2uJuwlDJmK3+GcjMOxdh3kfvHG8jCn+s/+7tbP0qu8TCtowvLzlbsiQcWn42w4KlrhyIHWlwYPJZpaZcXjz9PDO5Gs6OlbEdiS/afQyath0qXmlXmbTdkAvOx0AlhaOaLO2J+zbnOjPCReBlinuUcfznmt7BGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177479; c=relaxed/simple;
	bh=3y6SB68ie0txKnHoViDfxbae5Abh2qcvNZUSo+HHpU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mM4bNGFBUsyysn1JrAxjETKG9whZlrlrhcNI+Pn4UAja02DOCdS53Qk9GwSxMZuTLOlR7JyJat9Cu64/bDGvgxwAt2GZRihlNmntnYjODnwIagJqAz4QnP/mrdKXjRT358fnNmFbZ0Lywg8SNrdFER5pY+b1D5O2+h1QgKoDIp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzFn56Kq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b9879f5e2so38711fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764177476; x=1764782276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjVjPsI8gv3VbQ72UKGcVzIQLX4fJScv+tZF2KJrJwk=;
        b=nzFn56KqAJP+y3Jx2tzHx3IW3n3MmEwK+Hrfe4gZDwrBqhYF75EpKpLZD5zg5E6v+x
         tYddU6zOAASgvgCiwoM7lKKDFV6YQe4tQMABmg5MECFLtF06nTFRiCWs5LLmTpOhoJQB
         9ikeE8sFxE0+lH8AmRTYQmBSW1ZBAtlVFyfsjBJjHYWXtEESVPRNgY6yTkfhjGVJnyQ7
         EdqPZ8U0y9d/+xVWrnG6CD18ARfBkDTDKIfOiznP8w2loahGcXvtZ73idJO+hOlItVGF
         uM4zwIHfXPL9FT02ZQENzsaPvUC3YEpD5gHjFYDW+wqY4QOQRU4+ehVBsWvG5Am6F76l
         5c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177476; x=1764782276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjVjPsI8gv3VbQ72UKGcVzIQLX4fJScv+tZF2KJrJwk=;
        b=WQbL129HOPJ6/GFj7WxKGUhoo7wnSLi5OpBgirUKhyEpnSm3p/q62FTFHjfwxQNNJT
         gs6vC6fsIeizQRiyFw6XB7JFviOnkCj4dP4AgKZX1DzSl7XWEE/zE6SnIBUIFZ9o9GYu
         4bKdbRlZCQNrgETFvMGDaHkAwVqwAcCyc5CGcKABB0SvhgUeXPR7GmHTRKZWCJjHG+lN
         p7Xqph46KYmQYfNG8TNMjDGaPp3cyU3A/8Ij+/KV5d6mxvXVAReQASGml8tFyJmiUQeA
         JDPxWPCil+3TEyA6ZREom4tCzZdbrSYYnj+dnZ70uI25oVGqW6+8tMpskGMuYK2g3KLH
         feBg==
X-Forwarded-Encrypted: i=1; AJvYcCXmxS5Eh7hwQhdrfJBL4Ke01MzNMlkLZTESx9S3XbI2Ryi+aLUrj1zf5ykr3nb80Q0LuLmm1104FFDfQJ2+@vger.kernel.org
X-Gm-Message-State: AOJu0YxnVwTqVWox1onKLKc7yKA9rZ29q5EC83EPWJ+o/ZNGTAk3R5vc
	9fI+BI/KSOcMQTVWct2hbipil2GuJbS4mgGwFZ790adQHyiW19PcJqLvEdKlDciTeZvrLhUQgXz
	jhav6
X-Gm-Gg: ASbGncvqBfKv9ocQIY9fKTCtBw2CjwqkwoJARo4Rirc7GUE5w5ablEJTiPiTRYlim5h
	p8KvWMtU548nApYpyZY2PouIcYdWQasMueRaLlorDQRlN+57OI6tOzqiS5eavcHZJw2Ost0jnlG
	2N2Vlvtv54vaI5oXxFvhwN2QaGo4V4ulaVxeeC2zVK3xU73uQiuQnCbZMmetuOviMU2NnjaC3LW
	uVoG/rrzmNm9RjNZGV31+asPiVU1oQFsivVfHhvGCA7h6TCarusU1KDxdzwEaYBOm23SJEGtATz
	YMPGhHN5oHXrSUAgbw0B9uLFwxo+Y4uxzPuUg7J1ZVg9l4F8vkW613KxvBIiXQVIoCa/uMWrMwJ
	bj1AFUphqX9UO4RUPZ+wFcHvVvuJsGzeLu45X3/Rat8j47QAOVWjAKs7pjCmD5JkpeXIuBzP/69
	gUf/nyjMfJZOGSpVijkcgKw0hBUh7UBc12n0Z0R0DDbbAWMmsIDma+YQvrOkF9nAHY9A==
X-Google-Smtp-Source: AGHT+IEBB9ywUGsZdvYCVjtmtHQkpGExa7GrziZsw3x4zQJsI/QdTZqEjSoQFCogPgMJnvdqJmoa2A==
X-Received: by 2002:a05:651c:3151:b0:37a:84e5:a0e8 with SMTP id 38308e7fff4ca-37cdc38c2d9mr22822131fa.6.1764177475598;
        Wed, 26 Nov 2025 09:17:55 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbcd225sm6216283e87.93.2025.11.26.09.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:17:55 -0800 (PST)
Message-ID: <ffdeca69-baf8-4c8e-9b48-244255211f9b@linaro.org>
Date: Wed, 26 Nov 2025 19:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Val,

On 11/26/25 18:14, Val Packett wrote:
> Hi,
> 
> On 11/25/25 10:20 PM, Vladimir Zapolskiy wrote:
>> The reported problem of some non-working UHS-I speed modes on SM8450
>> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
>> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
>> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
>> SDHCI SDR104/SDR50 on all boards").
>>
>> The tests show that the rootcause of the problem was related to an
>> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
>> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
>>
>> Due to a missed setting of an appropriate SDCC clock operations in
>> platform GCC driver the workaround of dropping SD card speeds from UHS-I
>> to high speed was spread to SM8550 and SM8650 platforms, and since
>> the fixes in the clock controller drivers are ready [1], it should be
>> safe to remove the speed mode restrictions from SM8450, SM8550 and
>> SM8650 platforms.
>> [..]
> 
> I see you have tested with dd on the raw block device, but have you
> tested hotplugging SD cards that have partition tables and filesystems
> on them?

the test results given in the commit message are for demonstation purpose,
the test do serve right the same purpose of performing I/O reading from
an SD card as reading a partition table.

An important point is that if there are some issues with a filesystem on
SD card, it just lacks a justification of "forbidding SDR104/SDR50 due
broken SDHC hardware".

> We have this kind of issue on Hamoa where we get I/O errors early, right
> after the card is inserted and the partition table / filesystem headers
> are being read:

Hamoa is X1E80100, is it right? Unfortunately I can not test my set of
SD cards including one Transcend UHS-I SDR104 speed mode SD card on this
particular hardware.

> [  714.057106] mmc0: new UHS-I speed SDR104 SDXC card at address 0001
> [  714.060567] mmcblk0: mmc0:0001 EC2QT 59.6 GiB
> [  714.503873] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0
> phys_seg 1 prio class 2
> [  714.505660] Buffer I/O error on dev mmcblk0, logical block 0, async
> page read
> [  714.513632] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0
> phys_seg 1 prio class 2
> [  714.516469] Buffer I/O error on dev mmcblk0, logical block 0, async
> page read
> [  714.516512]  mmcblk0: unable to read partition table
> 
> and b1f856b1727c ("mmc: sdhci-msm: Avoid early clock doubling during
> HS400 transition") did not help..
> 

I've checked that this particular change [1], and it's unlikely that it
has an impact on the issue reported above due to the fact that the
problem is reported against an UHS-I SDR104 SD card, and the fix does
not touch this mode. So, it's kind of expected, and for further analysis
I need more information.

Note what is the originally reported problem, which workaround is supposed
to be reverted now:

9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable SDHCI SDR104/SDR50 on all boards"):

       mmc0: card never left busy state
       mmc0: error -110 whilst initialising SD card

This is very different from your fault report, and this is fixed by
my recent changes in the SM8x50 GCC drivers, and this one series
setteles the fix.

[1] https://lore.kernel.org/linux-mmc/20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com/

-- 
Best wishes,
Vladimir

