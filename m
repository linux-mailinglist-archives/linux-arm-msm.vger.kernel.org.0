Return-Path: <linux-arm-msm+bounces-38644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D549D4A5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 11:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A09BAB21D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4942F1CD20B;
	Thu, 21 Nov 2024 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4LOCfhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D971AE014
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183300; cv=none; b=gpQhFZtslyA5qsgz35YhtNzEhX9TvH/Ojaa9tU20B0u0SP5hAogJ/kten2nYbxkSz0Dbpk6il3u3oFKZiMgz4/HeHA9eDhVv9SabjQF2E2d0++rHepG2WjitrCNBo4L8cBIwq1MvIQdLkZO4yfpg8/pJMPPp5Sj5iYoR8vVf6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183300; c=relaxed/simple;
	bh=JjNvXC0ZmNL9tTmmEX68lHKJt4TdXge4SCVOn8mxtSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbxQr91pqvPBuErtSJLIV2zw9UJannZtCeyY5qHjOHPJdbO3MhBpVsC0ESEGiLdjvYZW2dzWO5xtYHmEZWCqNM00CT3qCK6MJwEdskIR0sUbmH3V7WAIry3pAb7Tn6wg15NwFSpINRbCmsp4MRyoC84W7JkhHlbf2iz5qNCHEvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4LOCfhh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43152fa76aaso280525e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732183296; x=1732788096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rmhHnsY+RuLEc30H9+/JH1oprc05PF6GVYC48mw3MuY=;
        b=F4LOCfhhw4/uKrj2Mmt3GzkePi/yH8ZpUmj7sqJRPGz0vIkTldaZdQtOnAF1YbDs0r
         Jx1tDrlZtNAq9QQsslqIWA5P+c/JcCBdcvLyQ93Nf1lhIMVPDlDOryhUF00yNmXkTddd
         3624X+vMExHiUglGsYwZgtOHrx7NXi0RGJZesdbWLWvFJnB79Qn6ALIw8TnsKlQMmLQk
         JzBbM8oZhYJpx8nOWMq59Gvoey1z3TW4Ckufc+TWJj9NJM1OJGHkxM1+heMbXcM9hgtK
         gQhdb9kKFUEzKiBi48OAr9u/KkaJTD9K/62le5+Ae5MYEl89d0sefyHMm2zCmp0/8ysE
         1F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732183296; x=1732788096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmhHnsY+RuLEc30H9+/JH1oprc05PF6GVYC48mw3MuY=;
        b=gXvwuryl9FLx+eGkD58bhLJugJi+7aVWEGDGO6tpkeX98BIEmLf0TZzHzorKj2rQkA
         tKR9S4iN+FsVNVw+UENPXw3gV5C8cL3aVqRQK+QaHCc3ppO+ZgyBDmtF4jtmEgfETwa1
         a8ZWg9MSDzAK13t9jrZnzebc1Aii7SxLwhEinSPCMBQjh09sGB5j2v0OdGkmGcgxXbZC
         HiZj/q9CkMo0/jVRg841u5Y01r7Pv/c2BY5KudUohaZqooY68VlplGBdbdti0fPTxEMe
         24J/6xKv2UBsQUw3WheC0Hk9Mh8zsJ92NPohyZ0CuhjUCVFen1rG6evRO4VFs/5Oe4GI
         eWjA==
X-Forwarded-Encrypted: i=1; AJvYcCX3cH1npqtWlhBNJsAqyqHILH9iD/0BCdZBvLryBEGGB2XajbnebGs0AS2YSBGBhCbwqaRqCG4bWc1lwgEK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fRMD/yxKke91vJxzlYvl4KVOmrDEILtzkC45JaInCtl2h5xY
	ES4Q3xGHZdtsw0FXejT1K+2uecdqyqC5RTZ/avCPYcML9tFbHTX/jlwUhzO0WeA=
X-Gm-Gg: ASbGncvZMExaqdI9zOl9todeApZq1bgbc7P9oD8d1LL+xKJmB3SaKC/Bm4KeAoT8hd6
	hWGNYzWTQ1Rbl2oZmt52dC3GqhMWwMtQUPYT95PXOlRzXjHcFemgyHEAACrPH8lFv7sibUPDACl
	AKIMkHA8FOoLOVfbM8W3ICJ7Nqlq0au8G13uEkPkcAurrS3Tzw0iDbIeT4Upy+84Nodc0Gb3YVw
	dPGd6fQxI6SIcXwkRVHJ+vK1LjZR9RnSE+Tzz1igs4Rlp44KcpVVUu6dTD6dWtEpdUkdg==
X-Google-Smtp-Source: AGHT+IGid3k2FbUqpmxPUw0L/CPBfwbLK7sR1jKTvwOdIaiv7UN/Cz5YznPz0xaogVOdoCqoXeZsjg==
X-Received: by 2002:a05:600c:444f:b0:430:4db0:3ffd with SMTP id 5b1f17b1804b1-4334f013d8cmr21221655e9.4.1732183294620;
        Thu, 21 Nov 2024 02:01:34 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45f9d99sm51608945e9.13.2024.11.21.02.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 02:01:34 -0800 (PST)
Message-ID: <26392a7f-82c6-4b7b-829e-76f3d78115d1@linaro.org>
Date: Thu, 21 Nov 2024 11:01:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: ufs: qcom: Add UFS Host Controller
 for QCS615
To: Xin Liu <quic_liuxin@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com,
 quic_sayalil@quicinc.com
References: <20241119022050.2995511-1-quic_liuxin@quicinc.com>
 <20241119022050.2995511-2-quic_liuxin@quicinc.com>
 <d9c3dc82-24e5-465d-bd1c-7a7c97e17136@kernel.org>
 <eae9d141-9c88-4856-9287-2ba6ea6f4a06@kernel.org>
 <242451d6-2b77-417c-bd98-4455f739dc0d@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <242451d6-2b77-417c-bd98-4455f739dc0d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 09:37, Xin Liu wrote:
> 
> 
> 在 2024/11/21 15:40, Krzysztof Kozlowski 写道:
>> On 20/11/2024 17:57, Krzysztof Kozlowski wrote:
>>> On 19/11/2024 03:20, Xin Liu wrote:
>>>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>>
>>>> Document the Universal Flash Storage(UFS) Host Controller on the Qualcomm
>>>> QCS615 Platform.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>> That's a bit odd SoB chain. First, these are just one-liners. Second,
>>> who authored the patches?
>> To be clear: SoB regarding authorship is correct, but regarding Acks and
>> Reviews is not. Savali did not receive these tags. If so, please point
>> to lore discussion with it.
>>
>> All this needs fixing.
> Thank you for your comments. These are the two reviews I received. One 
> is your reviewd-by, and the other is Manivannan's acked-by.I have also 
> cc Sayali on the email.
> 
> https://lore.kernel.org/linux-arm-msm/rv3ukz6rhgp3x32s74nbftmoqmdxjxmoii3zsd4wipmhudyq7q@ha4l2svl5lim/
> 
> https://lore.kernel.org/linux-arm-msm/20241112075619.2ilsccnnk4leqmdy@thinkpad/

I meant order of tags. Who received them? You, not Sayali. Then they
cannot be before Sayali SoB.


Best regards,
Krzysztof

