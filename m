Return-Path: <linux-arm-msm+bounces-20411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F008CE843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E7E1F20F9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B8F12DD99;
	Fri, 24 May 2024 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3KWp1OI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5127912C49F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716565867; cv=none; b=HBT4hPqFg6mnC9qP3E5jSuAvobVyl95lvQpy1cPIGIOYBE+ijfVsMGX4mqEjtC5PjiSFvXKWiwD2cX3spoFAThx3wDmCXBJRt1PmLDtL1TIrfOJJkbeF5XEJNavJ3G+6p8t9zRBhve5M9TmDH8R4KluA8DVQIk2y8fCzTn9SnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716565867; c=relaxed/simple;
	bh=/bhGs8TaMtT7d/LejTEFgkcPCME7r6RjadWpObMjiK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj41+nC887BtPBIBwkdac8jCUO+41XJq4w3KuouK2YcLtZ++qNKoXkEM1E81EQMovNOimeeV9VECHFCPJdKU08lC4x29U6g/vTzwD6o0YZvF3ZS5tu9p2u5IlyC4nt6lCGGPfQQQNAsI/Sy4gjjH1V7YB06Y56tODfTdC44GVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3KWp1OI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59cc765c29so392035066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716565865; x=1717170665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mqIFx2QvP5nWtciX6RDCcaOwo6gKu7U8WxVWcGHheMg=;
        b=E3KWp1OIJlbapnqqCeMYNnuc11f40ILzlVv8LPi4qJCZGpgiW6yUaN7JuG8/y7ogJ+
         RGyJXnCkw1QIu9gzHRn8GxirLhGbirgNYWLFERlYBJGvTJWxr7rBlLm25x1a2Buc/Lfh
         ZTqvZVvFYE/1EBHodb978e0gQaly+vTmPEOlXsUjhAcsrw6ivgSrQLfardN2FM3Y0n++
         zcahVOwaUBmEe++MBBAKwtlKy3RO0cz+3l6yQZaTSmpxDBG9DnDWprxoItXeshKdiAvX
         +ZjGbyfiMJDJwKLhrRugC8a99aiE/Ru3ow6ZCJNcjN/fMxIhVh2Yrfe9G7LqARmAi3KG
         3ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716565865; x=1717170665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqIFx2QvP5nWtciX6RDCcaOwo6gKu7U8WxVWcGHheMg=;
        b=cJaL57tLJMXX1ynmXzVRu6BuCCeh1nupyDkkUL2id4TNKMV7s5qJe5sHNS+BcngWVU
         u8kWVuwSKBDbDhA9AZ77/AXU5SHlnScqkfM6kYvTDfsqcy/TO0+Px7Ev8DahIl0F9kiH
         zuG9jLoDCYopG5rNnv6cnj+b3TjZA8PaElXLV8TFHX1icVulqGUuOZz3DqXnme3pqyLS
         i9GORFxRgU5mQOQEwk8z9iEb3JocUgzFwcmwdehUeQ6SvevXVzw9MLot0uyk53iQIQ+N
         MFws2q2/NsDYQt8iVIz/xjh30NGHbYEhmi8uh87zGkb7J/vimu7iuVGnhjmz5iGaN/J7
         nNgg==
X-Forwarded-Encrypted: i=1; AJvYcCXGh/vAe6rmITq47fRRqDEy7ALmGseMfoky+subeDocGJFqcUAubbGTj1tolemuZPyta6FaV+X+/tSaBYcTm7dfpNTNrcf6A4J2VZTK4Q==
X-Gm-Message-State: AOJu0Yw4fSGQe460IZaQCkcHS65gSKN4LDl13OdYAn4i+oIhF5kzFRvT
	IaYozHymhCr5eAOXKDJMsfbZVi414JtKIH7VlFPLnZUgq7FLfkmkMaqFJGXThzY=
X-Google-Smtp-Source: AGHT+IGR1yljmtNI1fn5a1qBNZfISAtYpYshZd6awCcjMwSwhcZ7g3R8sgO//b1CeE3duDF8TKbdcA==
X-Received: by 2002:a17:906:fcb7:b0:a59:c209:3e33 with SMTP id a640c23a62f3a-a62642daa9emr185962366b.15.1716565864675;
        Fri, 24 May 2024 08:51:04 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c8179a5sm150538666b.17.2024.05.24.08.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 08:51:04 -0700 (PDT)
Message-ID: <c875cd34-d09f-401a-8c57-45deddf65c9a@linaro.org>
Date: Fri, 24 May 2024 17:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Amrit Anand <quic_amrianan@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 "Humphreys, Jonathan" <j-humphreys@ti.com>,
 Sumit Garg <sumit.garg@linaro.org>, Jon Hunter <jonathanh@nvidia.org>,
 Michal Simek <michal.simek@amd.com>, boot-architecture@lists.linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAA8EJppYmVMmhgLSiSEGA_r4hFbQYriOLjNK9b6VXUYEYiZ6Zg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJppYmVMmhgLSiSEGA_r4hFbQYriOLjNK9b6VXUYEYiZ6Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2024 9:00 PM, Dmitry Baryshkov wrote:
> Hi Elliot,
> 
> On Tue, 21 May 2024 at 21:41, Elliot Berman <quic_eberman@quicinc.com> wrote:
>>
>> Device manufacturers frequently ship multiple boards or SKUs under a
>> single software package. These software packages will ship multiple
>> devicetree blobs and require some mechanism to pick the correct DTB for
>> the board the software package was deployed. Introduce a common
>> definition for adding board identifiers to device trees. board-id
>> provides a mechanism for bootloaders to select the appropriate DTB which
>> is vendor/OEM-agnostic.
> 
> This is a v3 of the RFC, however it is still a qcom-only series. Might
> I suggest gaining an actual interest from any other hardware vendor
> (in the form of the patches) before posting v4? Otherwise it might
> still end up being a Qualcomm solution which is not supported and/or
> used by other hardware vendors.

AMD should be onboard [1].

Konrad

[1] https://resources.linaro.org/en/resource/q7U3Rr7m3ZbZmXzYK7A9u3

