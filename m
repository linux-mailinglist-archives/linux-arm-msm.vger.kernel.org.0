Return-Path: <linux-arm-msm+bounces-17195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F88A0B92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4806C1F238BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 08:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38F713FD61;
	Thu, 11 Apr 2024 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Osz6pd0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F5140E3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712825239; cv=none; b=liM3Jce4LXJ61TMcCCQN7R4sIFEYLOaoTb+bVxwHl6Sl7pAMC/DHlTRZHB1WRV3pLa6RiAv6HqFPGIvf1LGfetQnbT4bGWHhJeqy5ChBlouscGdihtlogM6i+KCS5yTSuLRjXiLcAUp0PIaWyQBBBY9F6vDxdVfDaYrY3SfK1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712825239; c=relaxed/simple;
	bh=yB6JYunY8EXkmrBU9V8SnkS97vIvnw2jVMSGoyThXlA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i00ET3etRVElVtcEkMf3utXQFFiFCJ5PBKvqCpbLwcoG5ePhdD8UMWdkBEsD4OpIfdWryQGd/fLBszChXvfYdDACpq8s1T7jvrXyRhlvJ0E1XPs2xvE+8f81Fh33pVgwNg7uWZP4QUm1XQMmsm7AkZVI1/t/tQvbpClGx5YktCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Osz6pd0J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343bccc0b2cso5391222f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712825236; x=1713430036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WGvYdrh9pjeShwzsHtKJ3B7j1+HaDBQWly/Ok2V2fDA=;
        b=Osz6pd0JRFmO6/wv63VkIBWRqd8ByDD4g56eJA9vVzuaNQPUiV5DA2r8RE6Su1k3BN
         XqiRPRxRHo4Dko1iRUvsA72JQ9SBWbpQWdi2RbgVpW1i2BzhxZHazIcymXa6MAGDLKYQ
         xP8husgE79uJthaV02Lz3878xbP5FHMzyieW1NjbZcdhEvNoNhGHv1qMMy5425U+fc+K
         QXPXsRG009BNaOTI21ex0mzdQRj9DVvV8ocAec8Lspy6Yq78tfPjo4muY1wYZNt8s7G5
         q2eK1CLjdy3Z1fZwcck3TEUJhA/3RPu3fnwgdF9SVcXv7oOBzsibK/eOycat+/WNbs7b
         lFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712825236; x=1713430036;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGvYdrh9pjeShwzsHtKJ3B7j1+HaDBQWly/Ok2V2fDA=;
        b=JaP0BAuzVaS8GygJR08C6AvqPetbxnA+rV8kOSw3D7Ak8JDb/G9bN9qUg2FjP9ZWcy
         HrNGVzx6DFEDCUPNu3rbbTQ2/CfdK/yZw91WB5cvwbT4ZK+zlYnVPst4ip5dP34hnfE4
         OwkHcT2a9GCKDP9DNFGVCFFzzBLrIgzyTdUEqKCU5/yBM6T98vVwGKXkgSAe+7WCmyV4
         20FRVlZ9MqY0J9nF8e/3pqt++/FOTMXWxdJWeE2IWkpHN7b8kpkph0HhaKIQxWQNUDoQ
         ILRjLpKbzAIpgPmxw0jafbHqUvnZwyfcNQmWcsbxerkGK0Mc4AXCJBu903dFK1HQVL93
         EObg==
X-Gm-Message-State: AOJu0YyHSBIU4W8xp4XCOUopXvL3pmq5XKkH7tnZFYOhj7VBNeNO78W7
	k9xDKTvwyc9RdDYnFgMU8F9taoZoKqqksNM17Ygf8x89qpeBMqM1mxkZAzEBFvPO7MP9Pu7Lak5
	h
X-Google-Smtp-Source: AGHT+IEVnyycSJjD/BjnBncJtERr0l0A8WqQtwo7eX8HaIYmIUcX1aoVYefAc7MGFuu5r9vLq2aKUw==
X-Received: by 2002:a05:6000:1101:b0:343:6ca4:97e4 with SMTP id z1-20020a056000110100b003436ca497e4mr3354318wrw.51.1712825236289;
        Thu, 11 Apr 2024 01:47:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id j10-20020adff00a000000b003469e7f5c52sm1258222wro.80.2024.04.11.01.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 01:47:15 -0700 (PDT)
Message-ID: <fda53b22-c3b6-4c9f-80e6-8f22637b8b63@linaro.org>
Date: Thu, 11 Apr 2024 10:47:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Samsung Galaxy Z Fold5 initial support
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandru Serdeliuc <serdeliuk@yahoo.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240410-samsung-galaxy-zfold5-q5q-v5-0-9311ee9a55f7@yahoo.com>
 <8f2c7963-c660-41b6-a93c-0ac19818ecda@linaro.org>
 <46bee5df-3d66-44c1-9d7a-86e32a2149dc@yahoo.com>
 <37c5710a-426f-4054-8632-e24b9d920bcc@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <37c5710a-426f-4054-8632-e24b9d920bcc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 09:34, Krzysztof Kozlowski wrote:
> On 11/04/2024 08:36, Alexandru Serdeliuc wrote:
>> Hi,
>>
>> The list of changes  (changelog) from the cover is not what I should  add?
>>
>> My patches received only two ACK tags, on V3 and on the initial request 
>> (v1), I was not able to identify any other, I added them to their place 
>> in the change log
>>
>> ...
>> - v3
>>    . added b4 version 3
>>    . removed address and size cells in device description
>>    Acked-by: Rob Herring<robh@kernel.org>
>> ...
>> - v1
>>    . The initial request was split in two patches sent due to the following checkpatch warning, was requested to re send them together:
>>      WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
>>    Acked-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
>>
>> I suppose that adding them to their place in change log is wrong, I 
>> should create a v6 and put them at the end of the cover letter? Or how 
>> to proceed?
> 
> Please don't top post. If you add them to the changelog, how are they
> going to be effective? Please apply your patch (e.g. b4 shazam) and look
> for them...
> 
> Submitting patches explains where to add tags. Look at other mailings.
> And finally: why even bothering about this if b4 does it for you?
> 

BTW, in reply to your first posting I gave you detailed instruction how
to proceed with tags. Let me quote:

"Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag"

I think it is clear where you should add it. I gave this instruction on
purpose so we will avoid this mess...

Drop all invalid acks from cover letter and send v6 with proper tags
places in mentioned place.

Best regards,
Krzysztof


