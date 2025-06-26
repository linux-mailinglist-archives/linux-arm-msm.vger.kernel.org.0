Return-Path: <linux-arm-msm+bounces-62696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6392AEAA36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 041C04E08D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 23:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22D4225409;
	Thu, 26 Jun 2025 23:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NplTnHlt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73B2248B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979362; cv=none; b=NjvXinF9VMoCnxe/w8c3uZq+u+yS1JfAh+D3rLmAegTzXD7VXh/ulUmDAK3mjI0HIrEDmlSKTFmIrjOGE3MHypXGuQzYT8Nv29JpHr2KmPP2RM2kbBdqKdgNuK9ST08JDcVBcQ/AiqqDEum+EStZWxY0QJauaYqarDsZC8H4iOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979362; c=relaxed/simple;
	bh=sYxekMkD45reXqceAZfeKek4IPprnhR3B/ofXTSdIFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUPrJWvMjchBUHRx/tA4d2On2HUg1t1DMt44Wy6yKlDpROb2p+p07KD7wS4Cfj11unv8tHobQxs+Ty/POBfZAFLDSqWo6TEH0t2PMRm5sxYNonq96ZnPa7PBxUx/mnUBaNwkVaXz46Z8XPWelRrd8+t9X9oIkkzBBSl2/T2eXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NplTnHlt; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-45348bff79fso15845935e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 16:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750979358; x=1751584158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I984LjdCSI2og4FoX/by4gyCjX2JLqS5cCJCVpz/WdQ=;
        b=NplTnHltxEe0lAP6fvPtvgjtUUeDjB2MqSHo7x068wLiOZtkw5kkmpShg0xUmYcRmy
         ubtL9BkKONJscJ2H8qPL0aHWbt0H9IAH5f+5O4MZJOuaOEVKpR2xX+RrH6H0fFfdmNR/
         mH9br68cSx7ChiegYtx+xFRXY8kZpIMvDvBlLjRuMn3EMpB/vU6ODibWnY8w9TDH+pl/
         XzDGSzhO+sLTpNzD8xOpiuvaB0oEa+i69VorsPFoOAEpNiQI7d/uavEK4JAkE/24xnb5
         G8bIdoO9vwAubUlc9siwSDUrnnf2HYP6FDCXTZiQyQLzvC3KEdo+zbDgdaRhjTVFEWSX
         pM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979358; x=1751584158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I984LjdCSI2og4FoX/by4gyCjX2JLqS5cCJCVpz/WdQ=;
        b=OJPP1OZdvBKaZr8xaV7AwaXHnVEQk33heakVhZc28PWOK/VvdDq7qnJt7lWfA/3VPI
         O/XOQajCuVjf6wuiqO81pY8Tn9g3FEtPSljsKowrtQZFEUsrTpO3VXSohaImxQKArSCy
         PTdhMX9+NCJ+61RjYuGrW2ZbHShmc5gr4zt4aJRdZlDLUpt+5p5bvEspdWI9WRv5sHs6
         0HgY9T3K5NMbGwYYjD2T/AJU+7gDDZ9fYpDxC1B6tgLIMSjSlZZi5wl04EO5+l/eashN
         zHRuGMOg79Xo/JoDYgJLvRYxzO4nrX5Ls/9qmd4LzA/1AQQr5OTSvexU1qSCbvE+KS9T
         1Rig==
X-Forwarded-Encrypted: i=1; AJvYcCV3zaLAw/mCh7wyA7Ar86lS9PdoTJgNpgIkDGBjbJX6jyB5RbHHVdQQ7242kFUnUA+GdguvMh/pGnsWCNNw@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMowxTL0OxY/2klLWlfWn2Iz0Q957Tq/NPFTl312tgRqZW4ZI
	QF3Z8A1K6ai+5+PwGMjjhX94BYtzq8LQW09pWqmzP/tyl7b6BrVvU8mPDN82Srbbo5I=
X-Gm-Gg: ASbGncu/M6BdGwACJPrf6qSEeoXU0W8mczlPoVxF1iGndzGXraHCbkVFPvHvGQpN689
	hLSEPwZfBhTYC5EihyOBRc0+JDCOEobtLDlVQNoi/pkybhm6lqPYjH+lRUYNhRn5Dty6673VLLF
	e0P28aL8/4d3YE4M3bWuO4C1UzqmXiUEOC0l+b/kelOo2WHnv743QfKiAQR3QMn6JZWgw2IKMkw
	FvZ4CZPNHagO0fXkSxNjVV/6UiAbXGMykxb37HIeF3MjvzhATY0C+oBsPDu+RRlohoLurtoY3HZ
	ociYGhH0sx5F0qPnDNA1+6UmCacGEY13z3HNh5hrN0DUdJXyJcP2xeYx+RHo0qH025x2Z2NIwJ3
	EDOtuopDF657RW1A9pDQPbhGgQFpuRzLK1lZjaQ==
X-Google-Smtp-Source: AGHT+IEDFLoM1pQr68aMEgp9Er98cj+bVVx1qoDX24JDkdLwRTa9t2VgKEse7pcv2zD5qy19rP/Gjg==
X-Received: by 2002:a05:600c:a40e:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-4538f8836bcmr3662345e9.30.1750979357707;
        Thu, 26 Jun 2025 16:09:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a421434sm32864855e9.37.2025.06.26.16.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:09:16 -0700 (PDT)
Message-ID: <5df11ee4-d645-4be2-841f-715343f1b7a4@linaro.org>
Date: Fri, 27 Jun 2025 00:09:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
To: Alexey Klimov <alexey.klimov@linaro.org>, jjohnson@kernel.org,
 ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org
References: <Zgp0ym-MGzX2eSZdlkVYbgvjkJ0CzKItjaC5pafzQnj1AOZnVAqvCIZfYoK7nwDhUgOA0U8eNolNtaWXbExOAQ==@protonmail.internalid>
 <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 15:48, Alexey Klimov wrote:
> Hi all,
> 
> After a long time of testing it seems the problem narrows down to qrb2210 rb1
> and qrb4210 rb2 boards.
> 
> After booting, the board connects to the wifi network and after around ~5-10
> minutes it loses the connection (nothing in dmesg). A simple ping of another
> machine on the local network doesn't work. After, I guess, around 5000
> seconds the GROUP_KEY_HANDSHAKE_TIMEOUT message is printked:
> 
> [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=GROUP_KEY_HANDSHAKE_TIMEOUT)
> [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.100192] wlan0: authenticated
> [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [ 5067.193624] wlan0: associated
> 
> and after that wireless connection works for ~5-10 minutes and then the cycle
> repeats. The longer log with more info and some info with firmware versions,
> ids, etc is at the end of this email [1]. Simple wlan0 down and wlan0 up fixes
> things for a few minutes.
> 
> iw wlan0 link reports the following when wireless network is working:
> 
> root@rb1:~# iw wlan0 link
> Connected to 8c:58:72:d4:d1:8d (on wlan0)
>          SSID: void
>          freq: 5300
>          RX: 45802 bytes (424 packets)
>          TX: 71260 bytes (125 packets)
>          signal: -66 dBm
>          rx bitrate: 433.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 1
> 
> bss flags:      short-slot-time
> dtim period:    1
> beacon int:     100
> 
> and this when wireless connection doesn't work:
> 
> Connected to 8c:58:72:d4:d1:8d (on wlan0)
>          SSID: void
>          freq: 5300
>          RX: 850615 bytes (9623 packets)
>          TX: 20372 bytes (247 packets)
>          signal: -61 dBm
>          rx bitrate: 6.0 MBit/s
> 
>      bss flags:      short-slot-time
>      dtim period:    1
>      beacon int:     100
> 
> This was tested with three different routers and different wifi networks.
> Other devices here do not exhibit this behaviour.
> 
> Any hints on how to debug this? Any debug switches I can toggle to debug this?
> I am happy to provide more info or test changes/patches if any.
> 
> Thanks in advance.
> Best regards,
> Alexey
> 
> [1]:
> 
> [    7.758934] ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
> [    7.769740] ath10k_snoc c800000.wifi: qmi fw_version 0x337703a3 fw_build_timestamp 2023-10-14 01:26 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> [   11.086123] ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   11.095622] ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> [   11.103998] ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel crc32 a79c5b24
> [   11.144810] ath10k_snoc c800000.wifi: htt-ver 3.128 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> [   11.230894] ath10k_snoc c800000.wifi: invalid MAC address; choosing random
> [   11.238128] ath: EEPROM regdomain: 0x0
> [   11.242060] ath: EEPROM indicates default country code should be used
> [   11.248582] ath: doing EEPROM country->regdmn map search
> [   11.253950] ath: country maps to regdmn code: 0x3a
> [   11.258805] ath: Country alpha2 being used: US
> [   11.263466] ath: Regpair used: 0x3a
> [   15.355756] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [   15.363942] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [   15.372142] wlan0: authenticated
> [   15.377928] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [   15.386338] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [   15.466514] wlan0: associated
> [   23.167251] systemd-journald[195]: Oldest entry in /var/log/journal/ec3e0078e5e0499bac67949f3edf3fcf/system.journal is older than the configured file retention duration (1month), suggesting rotation.
> [   23.185186] systemd-journald[195]: /var/log/journal/ec3e0078e5e0499bac67949f3edf3fcf/system.journal: Journal header limits reached or header out-of-date, rotating.
> [   31.750177] l5: disabling
> [   31.753382] l11: disabling
> [   31.756385] l16: disabling
> [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=GROUP_KEY_HANDSHAKE_TIMEOUT)

So.

I wonder what state the GTK - offload is in here.

         WMI_GTK_OFFLOAD_CMDID = WMI_CMD_GRP(WMI_GRP_GTK_OFL),

drivers/net/wireless/ath/ath10k/wmi-tlv.c:	cfg->gtk_offload_max_vdev = 
__cpu_to_le32(2);

Try toggling that offload off or on and see what happens.

> [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.100192] wlan0: authenticated
> [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [ 5067.193624] wlan0: associated
> [10437.346541] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason: 16=GROUP_KEY_HANDSHAKE_TIMEOUT)
> [10440.340111] wlan0: authenticate with 8c:58:72:d4:d1:8d (local address=82:95:77:b1:05:a5)
> [10440.348408] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> [10440.356698] wlan0: authenticated
> [10440.361077] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> [10440.369516] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=0x11 status=0 aid=2)
> [10440.446661] wlan0: associated
> 
You can put another device on your WiFi network into monitor mode and 
sniff what is taking place.

Kali Linux I've used in the past on an RPI for this purpose and it was 
very easy todo.

https://cyberlab.pacific.edu/resources/lab-network-wireless-sniffing

Another thing to try is to do this same test on an open - unencrypted link.

If we really suspect firmware here, lets try switching off firmware 
offload features one-by-one, starting with GTK offload.

---
bod

