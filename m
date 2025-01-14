Return-Path: <linux-arm-msm+bounces-45028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B42A10DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 18:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC621885D15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA24D1F8EFB;
	Tue, 14 Jan 2025 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WU9QW6xK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0D71CAA7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 17:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876223; cv=none; b=srxyxev72EENuFPsAK560XvY7msufTJ7yUfePzD+8FI95lG/rhNOCFH/9OsRuty1MJlwi6+Q593hwmlFlSmCzyb5a0yN9nARCLtsOmK4ZwUuqcCLKHwKldS3z0ki3o7d5KsWFJH6JudSP/Lk7hrz0UaAgZtsUGb9CLOFyZrVIt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876223; c=relaxed/simple;
	bh=HOGM+1VPtJmo9bMIxYQO0YkNCY77g9qlc0Z0fhwZYnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VXZlfDfyKiTBRZwckPLlczr4BdpdxZxJm7LaG+7FdsPzh3BeLt4SevXDc1zkP2A5s6f+QvXEYQe9OC1cjxqBbdOsMAyZXLBdYtKnbChf87AuRXqRaYv9erTOq9aWtSvCaq+n54T+pQmXAUxNlVU4WfaE3k3qg8q4pfrqSsLGIio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WU9QW6xK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso159795ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 09:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736876221; x=1737481021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rcl1SX/OvDfBPdSZc3LYo5TUWBN/Uceh2ueRnzxWfk=;
        b=WU9QW6xKJ+N60QGhgNCths1sX/ARscFya9eJPOPFQI9EzfqejrjcYRNJcrzqXF1JNP
         Ps4pvjIEsNm6m9MC1ub4aTWCI9WNhUu8pSBKszHgfAdoWSidm8jEsjL0U787Wv8z8QB/
         JcTNIQev3EWUsG8gFSqC3Uz1WYqbuQDqSYl+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876221; x=1737481021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rcl1SX/OvDfBPdSZc3LYo5TUWBN/Uceh2ueRnzxWfk=;
        b=Mx2anhA9y5NtEVa2Mh7NPuUdSKzg6csh1mx1uz+u5tFrcCBaSggvUhfNGN9jCGWlsx
         6t61T4vL8s1nK5oNc6NEnQXKcuVaK/qxBV5nQgrFDuTqZY7s4x5s3N3ow3ZLUFtwFD92
         C1dVPpS5Hg0kSXli0EDzvJQbI1w7m5u0HJ5HjhFK9lgapD0FVsSTZvJZLJVPEmaJ14df
         rBRAqN49RbxH8MWjc7QHBsddpihBETNHF5Dg6sAuCpMCk5tG96+4fK5aO070/DXy0hvr
         /n+j6ctB9NqkdtiL7q3E/w9DCFbpPM+UdKDMvA8a5Gnt1cpDr82S8UweRBoC9e3gh5Xh
         1rlg==
X-Forwarded-Encrypted: i=1; AJvYcCUEFzmW6wAwyLw64Kdl5RyCRYYKB4HslwlFUlNFT1kwjbTNO1Ih3+0HpcHYQqfhkTVxmUYGyvs/1rUlM60r@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd6tuwO5d7cXc7zjtafYyyMBjw88KlwkUwnAcgmdHI1XxiywD7
	0DA2Vez/Im+9Mo1qwyCEal41QX+hlaKAUDU/D6fVaU2rmdDYRfUL/fumUsKNM0V+Bw8MVZ51SA8
	=
X-Gm-Gg: ASbGncvDY+jPEf9iX1iuoVHT4jRl1z0c4jRG4U2AL4T/wW6Vqk93RjzTOI7ayxeQ32l
	a+o3uEhoE9+Dh5BppgjZh7JOkv/q8a/JfINjIOURM7zotZWtdTcEyc3TzvZ3eNpb3HXRlkx6eQG
	f0HHc31ZcdnQ41JWOyQQ/7nAiY7I4vK0LBZvi46xby7VmcGOuYsAcYFzfAPXRXHMZ5+CPYZi7iI
	5Bx5HOG81c22wUMvkTAjAMjp+xhmDehY3yXCDEKoeZERV7X2MB5NcyhxX03Ns234i6Cu79TknJf
	3OJXHUFHuAYwTrQgm9Fm
X-Google-Smtp-Source: AGHT+IEFzv5G0xmABBL+XZICiZP0VhjMpDV3vlDzoecWcnfA7PB2ZBZcrMRU1kwwvn6finYRTqr0/A==
X-Received: by 2002:a17:902:ecc3:b0:216:14fb:d277 with SMTP id d9443c01a7336-21a8d6c7ab4mr318410025ad.22.1736876221535;
        Tue, 14 Jan 2025 09:37:01 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10ddeasm70270415ad.48.2025.01.14.09.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 09:37:00 -0800 (PST)
Message-ID: <96dba1fb-53f3-40fb-8e20-887cd089961c@broadcom.com>
Date: Tue, 14 Jan 2025 09:36:59 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/25 02:56, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

