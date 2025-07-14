Return-Path: <linux-arm-msm+bounces-64841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD10B04373
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5D34E2203
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79837261584;
	Mon, 14 Jul 2025 15:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KtpXOjqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A8260578
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506227; cv=none; b=q69cDRVeWOxbPtb2oZfA7QzJxROeERf9LjNjRhjraQwYdeDawm/4m5FGgwDaZW4ZoB1P5Q6beByP+4+P4M9eAg3NdyopNu3jtv5c6F7KqCH1cEgiwclohojifkPSaIA8t98Oh4obrxuGkpxUxyy0DxfiNDuCxxMVrw/M6At66M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506227; c=relaxed/simple;
	bh=yhMu5T6hzBLMdh1uAFjKTy5PMnMnoPVoGkdLGs7pRlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzJvlQ9CaJCvL6hgndqyjaDdzzSC9xic87cn0ZaHUX3PLfyQAavIzrxPM4ZBhfzhhXkAU54WDcDfH2C0rQyhEg5pl4Xnx3HPG/HbHKpiw7DEvwhhSZA1Ji2caBUfi4NH+K1su4duqW0bO3E5y40GuCFSESq+4PZp1FTVgB0jrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KtpXOjqF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-455fddfa2c3so21975495e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752506224; x=1753111024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCjJs+mAQ+eyQ0cHltxO4UYluhIlp5Nf/WChKLF+U7U=;
        b=KtpXOjqFHopRdm0ZMSLVrZJhmkzxVMzQ9+qU6MtRv8/VcP6gEP8Oni3zy6l+Hr1fjT
         bckbB1+ZTiGUQ3l1PEbxzZ4Eq6/IvNmrrKbsqZcAtNgTMRxlic4fMRgwZdXIQsWcEdvw
         R4bvAQcZLdAEiMxPyT6P5+LgueyJgQdzfD8JNlyttiDK+KIK09iwRgi1ZsduNt8p//dY
         cA8CWv501am2lnfdk/4ASV0Mgt4EsoiZ4GB7CKRtMzDkddosdwd4JL7rt2MbBb80gL2o
         XX8uvibz7RCnpCzhnYn/4ut8WbV2hpa1C8wLyl9TB12Xpcb2aChJnEBiwwuhPrvFGG2n
         opEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506224; x=1753111024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCjJs+mAQ+eyQ0cHltxO4UYluhIlp5Nf/WChKLF+U7U=;
        b=dzD2hlCavMumCdf/hm5T9oZ3WxLd0UAEic8WBZGhfKhsLd5wJmT3KadPh+01hmtWfp
         FS/1lAbXl4RZ54Qxc95Qmk9BxP8n8q9Lg8gi0qGd+rnZH6Ly6CJF8afuq5UzI24Zw9P2
         e6ErXYMI7491FhVYf/3isN08AeE0EyX+6e8wAX/U0qqLjdS4KWO0N3R+HAl96OVcJLmg
         Iwc0ufbR0JD+aONcbgWae2hcO8YSo0wGrDphUUrngrMS8M7f4ofqwltZzar8HtXFmYwK
         4GOdN9aCVX6FE3eg01svILTI3GmgL3N4ZRslagH3NGibxPyka4giMFvGwb+F/Vd5p2l7
         djEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcarL+R56sthOF1CiKB4ONEZITBfF7bR6LNsmQQE7rCTa0lL0vKwuxLRZg5t6XidMgshEECb29BXkc7BmL@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzPMBklIy5nZoBjczOAwC/Bsw3ujkoJJ5MzES6P8+23Rfb8XD
	ocH5wOCgYK0Nd3eEq4tI1RBlmtGz8JSd5X4ZmZWdCW6f3wQBaTZkyf2wqqAixF6Vqas=
X-Gm-Gg: ASbGncvt7PY2RKjmN8xjHMEAcbcUXZQU72KMaf98mrp67qEdZAhpuQ0NNh9xHRn1xYx
	7qm4Xdw3JZbMfrMNTZ2G2SGpGD55ryYTQcfdmObk3U8mbC0DaNOqSxJnYXUycjsqYqtPfm7/DDU
	bHPF3Hr1NmDkq029WbjVUy+awajynwFDSHNA+xW03gw+4TZiS/Hz+DCzfiTF5gqF1Wwci035hSU
	y3A1cGFZJscG1/uNgPyLmPkQ23KXC0lIBcRVgC66tNgillzDGWv7Qfg8zM9lzOI4sHftxn3KUP4
	2eqOPZGgfnaceJx1A1FzGxGEUtZtKnsMovhB2fijq04KORW2vnza5a+bEsYAYILHSg5jzB133/J
	mrjoOvAgd7k6oVfXx2V0RY5PNx8D0Xsa09ver6IUON6IusTv88PmHmBhaVdzOOuI=
X-Google-Smtp-Source: AGHT+IEpin0kK7Y62+zwW4eiqts/4lq2fhVPTieQctRVVCnIYpoH+CSOCtblJicWaiIjBRT5U9/Y+A==
X-Received: by 2002:a05:600c:c096:b0:441:a715:664a with SMTP id 5b1f17b1804b1-455e7890b03mr75864705e9.20.1752506223867;
        Mon, 14 Jul 2025 08:17:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd540b52sm135696755e9.28.2025.07.14.08.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:17:03 -0700 (PDT)
Message-ID: <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
Date: Mon, 14 Jul 2025 16:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vz@mleia.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 15:58, Vladimir Zapolskiy wrote:
> 
> This proposed device node scheme does not solve the known and already
> discussed technical issue expectedly, namely there is no given way
> to describe a combo mode hardware configuration, when two independant
> sensors are wired to the same CSIPHY. This is an unsolvable problem
> with this design.

I think that is genuinely something we should handle in camss-csid.c 
maybe with some meta-data inside of the ports/endpoints..

> 
> Sensors are conneced to CSIPHY IP blocks, CSIPHY is connected to CSID.
My understanding of best practice is data-endpoints go into the consumer 
not the PHY.

These are PHYs with their own SoC pins and voltage rails. They should 
look like other PHYs in qcom and across DT, IMO.

---
bod

