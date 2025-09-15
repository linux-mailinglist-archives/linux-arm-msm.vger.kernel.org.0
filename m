Return-Path: <linux-arm-msm+bounces-73479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D57B56FEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DC0178D2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 05:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9912773CD;
	Mon, 15 Sep 2025 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLgMo64b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DE20E6E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 05:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757915614; cv=none; b=huqd34nHXxsu0vd7nTiUBSoKk89xdX08nozl6KEjVFjncRa0Mk+D0rbQwxAOxkF4ffNpzFOd+34O4wF8gDPOZXCjducn7/YaQHnoy7tUPlc7Q1HMBHALmapE8LIx7DgHzjLzVkkZymyHOVMyLMhHG3MmcrHL0tHbgUf1/hwL52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757915614; c=relaxed/simple;
	bh=JIF7wtlPlo7ensEBWZTrh6HhFvaUaAowbOa05FbDUnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZbkadvssISlAPQ7wLaIH9wEkd0Abw5H9kzyEmGtjhsC6BW7yNu0avRyoy7Xo0aXedZnzno2AVC77Hw63OmjNlzOEKq33t5PHQUzV0NJTFthKwsOOmU4aYNz/yh/OnrHzQxHijMTnaUdzwW0ITo9gJQsoq86PzN2JLvqtnVP5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLgMo64b; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2953427b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 22:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757915611; x=1758520411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXozmDJ3HnlGu75CLn9cmOAS5UrsjMSL6Ugc5vl8nJE=;
        b=fLgMo64bjJDN8aDInzKl2wmL7bTzRvamykzapDgnZQ67SltrVl1GioYK4ezgeU5abg
         fSKDzlBIMisipcz3VML7KINz2/swhyhMQlNBO5F3ch7i+39vhqYG9MbIw9uYNDOoutFZ
         FZ4WT+sSYxCI9H4k7vtRfpLDdjkluwc1cQbvmcOTqv93oo61Rc9xXn6BI2lcMSJj50g7
         wt3g0nFVa5jhwJliMiwBMzkjiQJ5YRuEcw5guCDFtdM+O6C9b54tbhCTAPJRGiHtzKyp
         7/+dsiPb5f4l2G2yNg0wKMsIiPjU8bQXZPESTSFCh373/duukHWDPtnVsxSbE8h6609T
         8D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757915611; x=1758520411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXozmDJ3HnlGu75CLn9cmOAS5UrsjMSL6Ugc5vl8nJE=;
        b=guhlF8wX9+n26QZXW1jhomCwOulxq36ou4+ojjTB0kaL+Lv33rQdaQpfHGIy4TGJe3
         1cDo9+kQu7QlgWXctMyL9SEGpXlGhIaOZNNXKt65eON4eizDMw1GWz5vvYMXDwqi2hCX
         sBhrxYmZVpOL/rf5ozvrujpRdr4NFsbAKnoNbrw7UMwHgEXK7EZZDiotXeQvCzCHg3px
         e/HyjvNxcy2OW9lAuwtRKOmY/DvxGC6opwAGAgKb+ko5JUfoy4shrDpU5q5blB7yXHep
         gwbslE/SMbhDwP9I1B5k7AKSDmME8JsNJKxR+q4nEExYoW1g2FPJZTdr+wTz6Mq47Vji
         Xd+w==
X-Forwarded-Encrypted: i=1; AJvYcCXpdCBEOWU5elrPvvTOUj5oCntXaxWWzRooA4ZIz4tLhNLvjvYeNZ6QNqK29OrCC0oyK5J2FXXTy3ZjG+Wj@vger.kernel.org
X-Gm-Message-State: AOJu0YzYj8k/aQqshtjg3OjYLpB5WdnJ0kzFbUQR/r8Gu5/SzrelUbjb
	v9SxNUuH11CzX8efkROVvS75xkKyD2e20TnEL108D5rTBYU0O33UPptF
X-Gm-Gg: ASbGncurfpqTTOCXzmAr/NDoBgmgvsYbQ+AkNc6idPHZkPy3yb4QNs8Xnyf1XdN/wG6
	uWd4rMXHhA6MBcU4M8imaGOwx84LnlI8bPxO8evtL88C06/mL8+TYGgsitZ3t4+Qj1/2bZNW6nA
	gP+4aUr4Hi+a83uzGfI7qExKm86R4C4PkZnhXKPphRvLdPgclIhTOmQDQhIcZXc6sqbeETSk11O
	I7in3gxoZDfkPYbN3FsOy4XEluyQvpJHtjqYH01mfmdNz2F4ovrsJzwPriSO4MbBu81iquzbOBZ
	ODQ6Yp5tlyIgt9c49Ikav5NKMg32RmY1P4WQ7zDb/s1te+zRXvmsi7O2F3C+94Ek9t2GCPncgQt
	ZNNnaLDq4KkO8SqoQB1x0Jx9S3bFuOKu3qUqeJC5t38c=
X-Google-Smtp-Source: AGHT+IG9GD83InwBhFOW3NGAg67t2y+nz21UMxqm/mpb0uOARyNxtHSYfMypATTlZLh+C+BHHF2zLg==
X-Received: by 2002:a05:6a21:998e:b0:24c:f8f:2b95 with SMTP id adf61e73a8af0-2602ca0782bmr13719523637.40.1757915610927;
        Sun, 14 Sep 2025 22:53:30 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b3603asm11755559b3a.84.2025.09.14.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 22:53:30 -0700 (PDT)
Message-ID: <8fa9b725-5490-4ab2-ba0c-9923bd30c677@gmail.com>
Date: Mon, 15 Sep 2025 11:23:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add bindings for QCS615 talos
 evk board
To: Krzysztof Kozlowski <krzk@kernel.org>, konradybcio@kernel.org
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <4869bf32-7a0c-4db3-b3ee-4a237f20f81a@kernel.org>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <4869bf32-7a0c-4db3-b3ee-4a237f20f81a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/25 19:27, Krzysztof Kozlowski wrote:
> On 09/09/2025 14:52, Sudarshan Shetty wrote:
>> This adds binding support for the QCS615-based talos evk SMARC platform.
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> So simple patch and so many trivial mistakes which are already covered
> in documentation. Did you read the docs?
> 
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 03a7d3c92ecd..a5dbe6af68ac 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -952,6 +952,12 @@ properties:
>>            - const: qcom,qcs615
>>            - const: qcom,sm6150
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs615-iq-615-evk
> 
> That's enum with previous entry.
Ack, I’ll fix the commit message style, drop the redundant "bindings"
from the subject, and correct the enum placement in v2.
Thanks for pointing it out.
> 
>> +          - const: qcom,qcs615
>> +          - const: qcom,sm6150
>> +
>>        - items:
>>            - enum:
>>                - qcom,sa8155p-adp
> 
> 
> Best regards,
> Krzysztof


