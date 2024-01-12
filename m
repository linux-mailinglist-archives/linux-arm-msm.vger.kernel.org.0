Return-Path: <linux-arm-msm+bounces-7079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88E82B868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 01:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C76B285298
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 00:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E498F14F72;
	Fri, 12 Jan 2024 00:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V94TzYNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1814F63
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-337874b8164so930561f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 16:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705017911; x=1705622711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUeW4cbpZ4DyBVhP3Gp3OihLg4kH7ejzOns3IWU+5Ug=;
        b=V94TzYNxrIGl4Ql1KDfj2dIQRwVR9b1dQrxA1cZQEojq6YhzPCVfSVjfN/IiscAxOM
         8bUuW5xHjn7OlmX3CPNDqDlhhYBnv9R1joYXwOQWJNiCcd5+sRFpPAODZfN9imaGzyWL
         LaMDDlaBorSvEZglhXzI+54J6UQ4VS0IarLYknJiOulo5LskRn/VkNKd512E2KD2iPED
         aY1NtlIz9hBilBL2tqM8pyDjIjvyaFpkAit99k7l6MjT2FjBohbk+T6xNRQ3VDdtFVYN
         P50s3DC7BkCr4P9ZNN0f44CYmQPvp+KuMmDUMELhNFjFFVHfJscIVEVOIYqHzYoyLZdZ
         ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705017911; x=1705622711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUeW4cbpZ4DyBVhP3Gp3OihLg4kH7ejzOns3IWU+5Ug=;
        b=CHp65e8q2gP80Bv4AnN2sLueLI62kayzQjGaKnt5WQVGiv6ecM1vD1gI13ttVNr+/C
         /qK90HTci+ieBm2zaRZNlwx70WQ8xZXcE/tUXMO++uzx3mU4uZQ2gvOJSIj67omqV2VF
         x9/lzWX1XplMSN09iURVdxoou19gUqCLm/0ShiE0/5GrgrY/AHWwU2olJfBsYndTlJ+T
         FBdrqQKuqOcFrdxRsaA41srE8qcfWzAgGJO1TLtLas022RrINgj6f2EXFhkbDoA5rF5Y
         DGsGeU8O70KZqGHs3FyVoG4A5NglJtz5NkJVWC92QZSXLUyPUMjfR/qhlwgTr8HKQvFR
         J6cg==
X-Gm-Message-State: AOJu0YyHphtHLwVKf5SXC4KS91UKCQ80h8D9UQBoJyE7ALz8kdtLeyv1
	b68FmxH0ChTn+J6VR10dIk36XdBJPmbNJQ==
X-Google-Smtp-Source: AGHT+IHCdDVdU5Stel0+XBc70+8iYoGyZHbMKQqAFOmwuvJLM/lTb1tAB1c6+WSy2s9dD19FKm9UCw==
X-Received: by 2002:a05:6000:10c8:b0:337:7bde:f03e with SMTP id b8-20020a05600010c800b003377bdef03emr294510wrx.16.1705017911388;
        Thu, 11 Jan 2024 16:05:11 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe9c5000000b0033673ddd81csm2314450wrn.112.2024.01.11.16.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 16:05:10 -0800 (PST)
Message-ID: <39b4a009-1883-4e66-b743-6b69f0846418@linaro.org>
Date: Fri, 12 Jan 2024 00:05:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: qcom: camss: Add sc8280xp support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-0-b92a650121ba@linaro.org>
 <cd3d3034-ce98-4b96-8cdc-fbd5b66ca7a8@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cd3d3034-ce98-4b96-8cdc-fbd5b66ca7a8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2024 20:13, Konrad Dybcio wrote:
> 
> 
> On 1/11/24 20:57, Bryan O'Donoghue wrote:
>> A minimal set of patches to switch on sc8280xp support in CAMSS
>> upstream. Most of the SoC dependencies are either merged - CAMCC or very
>> close to being merged - CAMSS/CCI dtsi.
>>
>> Alot of prior work means we have far less interventions to make in this
>> driver to support this new SoC.
>>
>> Most of this series is already reviewed however it is gated on merge of
>> the CAMSS compat string here =>
>>
>> Link: 
>> https://lore.kernel.org/linux-arm-msm/20240111-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v4-2-cdd5c57ff1dc@linaro.org/
>> Link: 
>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-09-sc8280xp-camss-changes
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> What happened to the "vN" in the subject and the changelog?
> 
> Konrad

Hmm it "felt" like a new series

Checking though - yep this should be v5

https://lwn.net/Articles/950887/

I'll resend

---
bod

