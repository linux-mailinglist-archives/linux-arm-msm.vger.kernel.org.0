Return-Path: <linux-arm-msm+bounces-79139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47602C13D13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64D285E35BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9D8302143;
	Tue, 28 Oct 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4wEuk65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00707301498
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643567; cv=none; b=HHYSuYGVWqRwkImtPX9WjiLOVufA2ZVJQJLIQ0o1WHjufvMWmb7yk8edcnkF0OBLvXINZe8PxjmcBHWNCNeTT6+46/HHHjZkBTIrYnd5vjaAB3BvqifCEB3KNC7ELGoD1u7BoxSZs+hrNOslXmwngeGTSZIhgJkXMAiYKq5kp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643567; c=relaxed/simple;
	bh=G3fa4DEKYJsrbjpYbG8l1S+0+U7oaIpFhApn3v9mVok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGQZ/4ZEYTQtyJxBlal43k6aR40NzqmfaRDJpFXIKjcX78NFltLtFQ/B8kRMCecWsWMthA0uxrUfHtNbOwOIugiMeRQCf0q1XAaILUnAuM18TC/57iFRwVsvza3VSfb/2YjuWPEkVvoOJLaFUt4L/+0kQ5FjVYzHYoaMwGm63bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4wEuk65; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso46694055e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761643564; x=1762248364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WIhNUyRI0kZl2LUkLnytvQqzIt3iG3+keT/4POrd5A=;
        b=i4wEuk65Uva9JyllG5C3QAYlNH4CN9Ckyf3TnlnzuwawRg/lQIuwBvSboDw89RtB8j
         DrRkpo+XKGbDGzW342mx807zqrdPXxbPl3z150+96RbmE+VMnaxftxuNVg69bmCcKDHi
         b5MQV3sUliY/GOUPsn7/sXQtEs9CwwJEAzWHlzrUFPZW8vF14WGE2emLog1az3rmohVU
         4QC8GTHe2vqw2Oa31KkhnoqLCdx68gXonYBuJFuJG5Nwihqfn8dXj3p4ZH2kMSJ70jFD
         gOpOLdDhOWqGtvUfdawcU1sHQsTLLZaq9w1c7FzAqVU3CLuQgHkt7pn+VjWNOyXIcSTq
         MCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643564; x=1762248364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WIhNUyRI0kZl2LUkLnytvQqzIt3iG3+keT/4POrd5A=;
        b=v3b2xMmmF/nzsudYCqqLcAD7fQ2aN8Y3elCj6IjNuqfHhbqB2tl5JGmvVtDMuPEiCp
         4L2kpAFYKfDslMZg31ctdzQWQpdzWZjCZiFDGFvRsKKQGDTbps9sp8m4924CRgRQ7lVD
         96wB9Sg6cJEn5XUl9t6PnYSkEQHykfokdxrD/+1+p1FG0oUpyslLFIhvcHN4b9AOxZm/
         DzexwlLuJ3rN6rKMNaCly8AGoi8ahVFc/mW6rpfcjH0lPqe39KNHLqmWJQG+jNIYsXxG
         zY/sOri8eAHCSvWEHSr0BQpwkbWrjM78dotfDc95J0mpXuVV/MwD60PEWoSi8d4LW22y
         zPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8FxGlfNJViBSepSqgAUTZSuwIr5E0COSEtzoUadv6Y4psE3iRRApZSAuL/1MmgA1QTT806HEx2+Ze92Vm@vger.kernel.org
X-Gm-Message-State: AOJu0YzdTBYqutP4tAW/W79b0DgKeaO20UdQHojWoGfzOI2Q4A2kuV5v
	fpTFEFsX3YnmT0dI6cTaivo6EyOqkLjHG/j7KwXid+1lqUb0zW1BMl25djcoS9d4Kww=
X-Gm-Gg: ASbGncsx6kPrOMypFagC+KfR06T2rUMKgaX3CJN/9WqEc7meehUVbO+fI1ckmY3zcv+
	sOLHa8TZIh9oJN+wz5ZTKJWN1HejlBYUVPCXdJXSoLyCpRwzYXaiMRYN/e8Dtlq9DmuFYqSl6IB
	EVAZ0CzwgXAvSyTGGr5nq8viNzzPm6HDHgEDM76hwba/lQweyyYwAV5DfIvi5ppkgifQpTmOS57
	KDU8sviqLmLP9Cy0Zeo+zHec3Q1KMda5lZZeK5D07W/uRmF8blzmpRWh7oI++tC0UCW1wEFs2zL
	gviz9rUvfKSWn0o/5P6IMZeUu049nAulMbPd/832CFdwjFHryzbxX4Jtbf6JTrSDrpVCv77ICyA
	EQuIzcZ/8ZnIc3QrQoMnFCrSQvax2BU8/smVj4dX5so/VGo/I8WXTRuCUFMutlBzvyA+WNXtzWz
	iatLyqPoO51GBEJX8VK9uxvvQf6BzpY2jPFOaqKy8+NJunW1GbWoMoRA==
X-Google-Smtp-Source: AGHT+IG7SGjSk8s/DTqkizgYBNEXizsx92+JaKgr3Y3fQprN5gLYg9kJPcLa3kFS/x+7fFwVaMqF7g==
X-Received: by 2002:a05:600c:470b:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-47717df9dc0mr25845305e9.3.1761643564349;
        Tue, 28 Oct 2025 02:26:04 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd035dc2sm188343505e9.5.2025.10.28.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:26:03 -0700 (PDT)
Message-ID: <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>
Date: Tue, 28 Oct 2025 09:26:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2025 13:24, Luca Weiss wrote:
> +		.regulators = { "vdda-0.9", "vdda-1.25" },

I'd like a little bit more consistency with the regulator names.

0p9 1p2 instead of 0.9 and 1.25

---
bod

