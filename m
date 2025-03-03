Return-Path: <linux-arm-msm+bounces-50066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEF8A4CDE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63DBF1895A89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DDB230BE0;
	Mon,  3 Mar 2025 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aKNIsYn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341D1F12ED
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039707; cv=none; b=nedaHmaIAoUVp8EkGL85dWWKPJaSXXvPzqFYIs44/w+jeyaEaq/y8ptQjJW5MBlioSsErfL6hfKiyPXW5KmjRfr4Ms0EcL1pdBioStDyTF+v32vxFAp7CdPr/sSahPob1r2+VBiaWJuug8RQ8Hz8yXlftoWnbqTO6oXeb51HlG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039707; c=relaxed/simple;
	bh=b4iMWATKJPmqEf3YNKW6l41GKN4rNmQLHLGWfk6g7rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfFrernHyXv6/mekYdYU1wKGbDqEl4UIkqCb1vbUQ1F/FZwGcKwtKnjRsjGrlljSma2tCtFEWvD/b/7jcQiV4q8TbebnlM4sW70Puc43PvhJ8Ue/oB98GbsB+sn11qgIMX2NxBdTmf6lKLOmvlm9lWYFVVBHyvNSiz6gsaNB37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aKNIsYn9; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60009c5dc41so481076eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 14:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741039704; x=1741644504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m1LlYx3lX3cmCu9HC5TAQ4F7fddxzpssEl8kFZBezXM=;
        b=aKNIsYn9DSnRgsXxLy0JV7f/biCgDlESBa/LaRd6u0yj5EQdvbdV9Wua7NbQvwMcuT
         DWw78g44GF9x6C3yeZuOZ9PZ7oJy/L3NsXpvosPMyTL/fjg+7tAzDKbuJjhdtPxyh3Mf
         OepAtmo+AAPp/kUz8m3euCDQ+efaply9/OFMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741039704; x=1741644504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1LlYx3lX3cmCu9HC5TAQ4F7fddxzpssEl8kFZBezXM=;
        b=KPyhl12b8JAei1JL2UD4vAB+0CwGWzMv9qmNRMlg9mCiU4uMxth7Dufa8szMnQHLXD
         Pv/6/RByOzqdy0uvWo7gTgAT1bWhLrl14OnYdm184OWW5bFCaNwFA+XRUY116hd9ij7I
         AVoyG/n/ufOThudJKg+YihWSWCOeiI4x4Lnk+F/fw94kkkDN5neiLIic+qs/emqpuWt4
         YDWUOu1OYtqU/hCjji/IVmnqqZtHRanGIJ1pnCdUISi4I5ys/+urWTrfnl7KdSEZBVuv
         8DExs0Izo5Ydq0GIWXeonIe0Xy5UsVTxBpnj3wZeQh/aZ1V4jcuswqB80DKSCdOvYowm
         qnHg==
X-Forwarded-Encrypted: i=1; AJvYcCUB30M/5H1LxisP5/W8HzWsJ7dl4IEjwk4PwJs4DWpAVZOkzpZvZ5OrnOwmS9+8QcjZ4MtzmqVucnrcJNsK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3R+B+ne+OKDODDfMWK7AO0v//zSqMcDwInDkpg0PWL/ad3xML
	Lw//jZAW/B4yWR1CKX+vKzLH+saP6AZz5w1SRjm73IrXCwpQm3EaXm/Ieqz5AA==
X-Gm-Gg: ASbGnctzXTk9L9HEm/3v9PRkQ6rucP/hqSuLRiJapt82Z7W3gNDIMrZsrxTv2m/e6KK
	5uaNdEbw7yrkmdrvfXvXAdGncL+Ub9cE2aZgsM2Gp+iOwKKYIjO23mT9Yut8wOkuYOZZuV+qTTX
	tv5evy8GdbShbFM04hGE004qUgCzoYeP/r/Jeh0uyDTQubFK6nDdh2bpioMEtGq6oHDi9YwP35F
	Fy4Sqpbt48fZAhc9q8WbeWkSZ/IW9p60tHGYbhR9O6lRAKa0rLnQCY72zNL03k84ZIg1H4biTJq
	GdqhCI3RPIdtH1KThZW6MQm5iT3nWCmmHD6MT4G7xt1ZGqiZM3t+0IXORjMtk41z4fjJRBY51sm
	EWv4jNVMq
X-Google-Smtp-Source: AGHT+IHEVCPRn+btmLTPyi7+Zllya/+YMJ9hICXwbK1mVgTBAEQzyvJDdOEMxmoti3Sm0FE6b1BkfA==
X-Received: by 2002:a05:6870:5b97:b0:2c1:4eaf:5b6e with SMTP id 586e51a60fabf-2c1787befb5mr10220992fac.35.1741039704273;
        Mon, 03 Mar 2025 14:08:24 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c15c12e133sm2004144fac.19.2025.03.03.14.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 14:08:23 -0800 (PST)
Message-ID: <cbc21738-2212-4124-9763-bb20fd927ba9@broadcom.com>
Date: Mon, 3 Mar 2025 14:08:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
To: Elliot Berman <quic_eberman@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>,
 Elliot Berman <elliot.berman@oss.qualcomm.com>
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/25 13:08, Elliot Berman wrote:
> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> 
> SoC vendors have different types of resets and are controlled through
> various registers. For instance, Qualcomm chipsets can reboot to a
> "download mode" that allows a RAM dump to be collected. Another example
> is they also support writing a cookie that can be read by bootloader
> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> vendor reset types to be implemented without requiring drivers for every
> register/cookie.
> 
> Add support in PSCI to statically map reboot mode commands from
> userspace to a vendor reset and cookie value using the device tree.
> 
> A separate initcall is needed to parse the devicetree, instead of using
> psci_dt_init because mm isn't sufficiently set up to allocate memory.
> 
> Reboot mode framework is close but doesn't quite fit with the
> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> be solved but doesn't seem reasonable in sum:
>   1. reboot mode registers against the reboot_notifier_list, which is too
>      early to call SYSTEM_RESET2. PSCI would need to remember the reset
>      type from the reboot-mode framework callback and use it
>      psci_sys_reset.
>   2. reboot mode assumes only one cookie/parameter is described in the
>      device tree. SYSTEM_RESET2 uses 2: one for the type and one for
>      cookie.
>   3. psci cpuidle driver already registers a driver against the
>      arm,psci-1.0 compatible. Refactoring would be needed to have both a
>      cpuidle and reboot-mode driver.
> 
> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

