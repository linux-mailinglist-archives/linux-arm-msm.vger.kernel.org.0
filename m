Return-Path: <linux-arm-msm+bounces-51381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77CA60BDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6B417FFDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1609D1ACEA5;
	Fri, 14 Mar 2025 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpEVmwjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB31A23A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941455; cv=none; b=SyLaxkt9J0kcfs/Lm60mO2QtXDqOkvBzqIxLwtXr56fj9sz2SpCPQiryXzOYSebSl7w2Kkgcl8/w4SIPBpTrKFDAvlaXyNVPP7V6FMxRLxFy7440qcnGexBrbnHrhZqvRfbSk6U/yNA37NfUroVqhDJaR0wAEr01crUYgT5fz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941455; c=relaxed/simple;
	bh=dk+ejBCS3NH9te+aXnCnqbhIl0UgK8PkFWM4qXXJ5TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQAaJz2CZEG+F13/dsI0Wef6dTG4WtvtwX4hfbC84n9AeKEYUyXLFZi18SScrK0ourtcx6F+/k7eB14JBEYwBy+YX9HYeMtMDK3TU8s51IKf2OVqmYry7qITYXOPmUm6pXgD7MZ6z8YzsFKqUROc45v3TW+zo0VUi/wdOF8ZLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UpEVmwjc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso359702466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741941451; x=1742546251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdW92HTTZmGzjR6ChSxqLyGpU5fNUkYFaVmkq1y4xX4=;
        b=UpEVmwjchAI6nFe3+Vz4Cydv+26qouM/cxZsaP3CA171bf+Di/cVfMWDk4e4QbU6Ed
         umOIE/IBkq6glc2lBrDbEqBlwGEblFZqYTBNsEfphtDFIZFMMRH9UsesKeEgdY6fgNQN
         uCfxvoOIoOghh0T8gUtGR5gt98T+ej+y/AHKNxn3SVvFv/l+UjnzuC72BNyZM7PUPdVc
         lvtRzRHu/zplQ0Cpt1fCKAyV9emZOXBcAJ8xxgiDfHyojo8pqeLk0ewMDYT+qWj0AGmO
         1BKyqtIBLlruMzaqr3STVFgcVIVBblGSFJoEUPng8C8VWp6KM2YCqlc/EhlkPDtB0klx
         56og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941451; x=1742546251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdW92HTTZmGzjR6ChSxqLyGpU5fNUkYFaVmkq1y4xX4=;
        b=g0FMPTCBI0DPghTglvI3DTGZmEiqrBMT2BTz+MBXcTqiMXpECnEYEE+rZ78iZjPIh4
         e1HqoDsgrFtd5//JjgDHaOR13cTy1+3PR0aCQXmH6tw4v0bfvy/IA/2/3PYLzruk6JKl
         4bQ8PkpJUiiaBEJ6GsU52jw++h/mXRA/aJUTn+QpQVFHPhxhn5NKKbMTfjf/sH2iyhTU
         gtN+2DFST2oN6D5Ctn+P0ZDKVeIp649yoAjTehIZmSiOSZ7Y2fP9yQQcsLajzP3P6SKD
         qVOY7DjFgrEmZewxzc9GFQOpDiLgIhlnZcOxZ85lhSO+0qr+DAV03SfcRgef4333oTJj
         cHDg==
X-Forwarded-Encrypted: i=1; AJvYcCW+K4zbCX7Tv3zoIZX6h3xzN7k8Cs77HdzgbbALdD0xXE2HXQsAdi+rwt+0Ikf1n3nBeiI6p0XL0sz7dVt+@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmGSqmGXen6skjUehoseGHQI0fUmGNa98z7CFv0vf+trglXYv
	OYq7Iub3A/3YnBAeWcZJmWfIgPZI0QPfCAydUhE1Y4XWSBJGKlmbHnRG5Y5ZEIE=
X-Gm-Gg: ASbGncv+5zrS0Ah93YRyF4crtVnKANfwhoLXk0DcbtHhNbe84wZZu8GP4pWV+FicxHi
	kYUqoA9N6vALhbU+mQKFlEQLNiLKB1CT/V+y8GcBF2U6tN0i6JnSacOOoC4WKsk5JTt3OaqakQX
	ldofG8NC2fzOdzClxlNuKubY+CCI00VNuskiDDwGg00mKy0LWvXYM/ecjXNlY1SNirOP9UZQt3k
	fL00nCIU2DDr10NQbVmhsbXxxkwbaMjIRRH9KbAkYdSpfQEhhJxM8ZyQrqrP5OFipBSnAGFrtzQ
	8yRI1gG8UKITJo6HqTYefTEVTGSbT0ekRCbJhWrqkYW//cInM2407c9yqaaIRjG/8yOUkMnOQ7j
	VdRMIkyIDPtA506LQrK6D9KWefI1p4nnSvE/GPeQu/TPee7f+6gyfnu+aFdgkyYOPfaeipLF/7d
	YzxMZdiil+Q9GBXEnuy1shQpIU42sWW9w=
X-Google-Smtp-Source: AGHT+IFUOlHrTuzko/qUKZDoHX5T+vqpZFWSBwlhEPozEDwkhttO5RnwU44O1wIX8uDl5bdWFAV2Vg==
X-Received: by 2002:a17:907:6ea9:b0:ac2:64eb:d4e8 with SMTP id a640c23a62f3a-ac32fa44234mr197432866b.0.1741941451312;
        Fri, 14 Mar 2025 01:37:31 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbb3sm194289566b.101.2025.03.14.01.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:37:30 -0700 (PDT)
Message-ID: <9089c8e7-d38e-4c36-9b97-0f4a3039a29b@linaro.org>
Date: Fri, 14 Mar 2025 08:37:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
 <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
 <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 07:51, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 09:43:13PM +0000, Bryan O'Donoghue wrote:
>> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> The switch to multiple power domains implies that the required-opps
>> property shall be updated accordingly, a record in one property
>> corresponds to a record in another one.
>>
>> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> I do not see improvements:
> 
> https://lore.kernel.org/all/20250305-little-frigatebird-of-calibration-244f79@krzk-bin/
> 
> I expect both comments to be addressed in the file.
> 
> Best regards,
> Krzysztof
> 

Pardon me,

I missed you had left additional comments.

I will fix this up.

---
bod

