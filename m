Return-Path: <linux-arm-msm+bounces-83004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B4C7E9D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 00:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A7B24E0FFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 23:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC44B25782D;
	Sun, 23 Nov 2025 23:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOxm2x8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937F21D3F2
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763941678; cv=none; b=kvjjosoS2oAv8+P4nu5fabymPb4bUSbVqJEK9uQcySzkENBbr7J3rYlWfONHf3PnNYS2CUyW+c1ZoMc0WuNUlL/tuKcBBi7jx46Bo2tz5kukZkKbx7fbnzN6ijrxeQAzvs4Hs269X6sn8gi3wOIEp3dD88z6VtOE7sX2Z3MYuoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763941678; c=relaxed/simple;
	bh=TJIcmKvYcwLavlNS6SXJ/86zVoDsC8q0zbps/byk9vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjaW+MLRfu7/qxHJJT3aPcfOkavavUwn/JANvOW4D2xTGpO7ug1d8Y99OlevHVXJ8w0Ex26ovKx0wgN9lZ94oP+gh2kPy7NiRE7zc2Wh/XDVg+Iu+0bsgvePH5NdvlqI9W6sXq+gs0yYjfs/y/wKY19hGUu6t46asuLgV/4+ILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOxm2x8a; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429c7869704so3114033f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 15:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763941675; x=1764546475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WpSd2LefLOPcYBkAZyB05aqITFj4fqTlh36DvQaccA=;
        b=nOxm2x8a5wSNm37ObdH4mYUiP0sSwgBDm83oiyPM4k06PVw5QHFtzSvd+/tY1kpSPy
         8FDn8VMyk8s/93EG8KRk5xQR4fU3CvJ5uPl72UgRac7h1vZ9vMD0/WApAEMSOxD6oHqA
         iJaB3dtPgJhrdD6W22SiQFrQajjEoqgEg68VhUr4LPKzh71IgFpUOijWdnFPlqS+TygL
         9jTr6+0DCKTEFq5jB183Sd4vV4LYHaWmZdbMtPJiaNPoApTYX/6Gyzv6NUgvGX1aYoRY
         2hNvi/Iiz7aL5sjnK37C2VFrYBZ5h/5cEgEY3uxelR2gUvSCe5Yzu86YzDfGYG67txGn
         rpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763941675; x=1764546475;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WpSd2LefLOPcYBkAZyB05aqITFj4fqTlh36DvQaccA=;
        b=jKaXWXSyIWOb/2mHE/d/dZ+UATx73XT3BcoNC+iRVUySaRptO6UQV8OAj7EuV4vIw/
         APp3w+iuuhCpXtn5w+FsleDql4q66O3u81sByJ6kNxERPjWdE5TZ2fLFirZ+AbxV7eSZ
         zdehr3QPJOfLYD54V0+S0GLuO2uvaawXpu44NMSjlByptfG6vkUZoiMdm0sEw/TloZH/
         SzjH5xJJN0hhnM4w56/mTgt6gew1D5jSFzk3gDWZhO1bcC2CTl76dBetudg9G65YRS21
         XppMhoDfvtXK7CcQUhP23ukYFAIdVOM42BKdMl+GDO8W/tm2qfOwFyVYJxALfZ9Pio2z
         ZILw==
X-Gm-Message-State: AOJu0Ywyb1/DWERpaLmZ6GtL09g21HhtA0Vzl9ffekjmIHeiylIs+S+Q
	7LkAiVPkavlnE5eb2F9N8gsRaWZxHZfTcEvLMlucZKTsuybZ1m5xyauSMFRM6kDU8V8=
X-Gm-Gg: ASbGncsq6txInYAqL2XeLPujU+zmqluVHC6b7BCRvajjcE3Ce+NvtUrTVzbIoYPqdA1
	Ig16eAwNTvUW7+OqkO3rJ37bj1yVuAiobzTXMjSu/lTciRo6y2FyVllUBcGjwVHse5i79M0kZi7
	6upEeh4r5KHJFBU3JS4WdOWJCoC0C6ltzbbMxG00iz25uV1xSN4IV8JEFna5MA17EDnE6CVK+mR
	wCH3aZ/XTk/Hjpi7A8CJFSpwCsh3w4xXmLm8aNRluEJeVEHhrAJi8tbDq+ctRN1CioR6zvnC8gu
	vupFX4lc8837Mmokf+2bLjWMKGesCYjqQJ/euxnpOiKWyuBiNYci99cdSoaV9xnBrt0b+ILK9pi
	KVXYvZrMJ5lGXnRzE+d1rkGkqnjXqetQawcrVS57i+fbVoKl3qgGqvFlW1lm0bN8i/i7Rbns9cb
	66jRckDmoMZXG2+PEQojmizf3LtMZbkJwDK0bPpAI/9rUcOTzEbe8x
X-Google-Smtp-Source: AGHT+IHVxdc0S4p7GcNa9n3stpz6wIbEUwBNlaz8lj7snVGYZFGdUkAQ9qLVQVzs619DRkEviJfz+Q==
X-Received: by 2002:a05:6000:250a:b0:42b:4961:eb4c with SMTP id ffacd0b85a97d-42cc1cd5cc1mr10385337f8f.1.1763941675585;
        Sun, 23 Nov 2025 15:47:55 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e598sm24494734f8f.4.2025.11.23.15.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 15:47:54 -0800 (PST)
Message-ID: <0b2b8352-4ac1-4a5e-be73-67b5cffdb934@linaro.org>
Date: Sun, 23 Nov 2025 23:47:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-1-de27f9a67ce6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-1-de27f9a67ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 04:43, Hangxiang Ma wrote:
> The Kaanapali platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY

Another nit-pick which you don't have to fix, I can do this in the 
commit log - but, you've not detailed the new regs added below.

---
bod

