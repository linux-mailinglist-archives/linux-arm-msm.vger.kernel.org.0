Return-Path: <linux-arm-msm+bounces-380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155007E70E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 18:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E800B20B77
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 17:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414F53067C;
	Thu,  9 Nov 2023 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRJOZmwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814063065D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 17:52:53 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15E23A9C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:52:52 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so743250f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 09:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699552371; x=1700157171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHCl7fRy9P2/hhE8qzcCbwsMlo9sARGUTH1RMXnIsr0=;
        b=NRJOZmwWgAoAm4OnK7Qk6BY6rL6aARG5wDXjTFO0aM00YeCXf3E+KNBWb4FVLXn/kw
         +s4J7Xo+7TGYJFC/pUUDiieo3AzlPA8xS6bnbZEbnp46V8sip3All6eWDQNSSpO5SkPz
         EeXu+FXeLf42TBGdN4Cjrf0SrgY9FMFg0vqviPy+MnpXoGD30Xtt0HWoXH6/JX+IW0vs
         A8p+GdilmTyxuxUaQBHtuGncVTmN66PdnZzEg0kMnzWJZo5JnDK/Z53PVgZCSiP5sUws
         4tGf4hIudKRLJDL+5HMkViTvgqLZpwNaz8WUHq2HzhbSzQcV44vwT5gpZZdxDytV2UOD
         6eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699552371; x=1700157171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHCl7fRy9P2/hhE8qzcCbwsMlo9sARGUTH1RMXnIsr0=;
        b=eHaKQxaxr6QwAJKnOeXU+NDG7HB2FwfTDLiClJk8D90QgHOqUQav8s3wRPBoY8jg2+
         jOPOOTq8W2Ybivi5slfSHrLoPj4GsskNU3EnLIB+kZruoxQxEG5EIEOS96Z37ap2W1Ss
         VQ1riU3EunnYZ0eRVkFWl2XgRcvDFKmwhHsUKwDwUfPX5NNVCP8Mtp7SKS0SJtyGHr9H
         z+u7yJJFg7SwY9wlgVoHFeuRZKsKq5kbx7csEmynwtwqiqFs5MRhbkc24gdNJDiYxXHP
         Sc48yddXSng6KJ9QAts/GgJmXeQJwEOFlLys4NxYJP0whQ0CmV3oFZ3P5EIDv1TMZbwL
         GK7w==
X-Gm-Message-State: AOJu0YzwHbc6IhSKUgkVCdgNRsgico7WyieNm/Hf74lgvYznfoZV/U8/
	vUFA16tqYHzAY197CFmaiQy3BQ==
X-Google-Smtp-Source: AGHT+IFJ1N8tYwNkDbkx9yg1lKlLbxlT2TiktkOucPlZKYTUyt8DKOaQcgdhhDkmGokZ4M8S/i8v0Q==
X-Received: by 2002:a5d:588f:0:b0:32f:8a45:937f with SMTP id n15-20020a5d588f000000b0032f8a45937fmr7703371wrf.2.1699552370993;
        Thu, 09 Nov 2023 09:52:50 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id z14-20020a056000110e00b0032f7cc56509sm167305wrw.98.2023.11.09.09.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 09:52:50 -0800 (PST)
Message-ID: <a2ae92ad-63c0-42bf-8695-c7e3967c776a@linaro.org>
Date: Thu, 9 Nov 2023 17:52:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Add sc8280xp resource details
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
 <20231109-b4-camss-sc8280xp-v4-4-58a58bc200f9@linaro.org>
 <3e0958a9-4d1e-4d1b-a914-5da154caa11f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3e0958a9-4d1e-4d1b-a914-5da154caa11f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2023 13:44, Konrad Dybcio wrote:
>> +        .clock_rate = { { 400000000, 400000000, 480000000, 600000000, 
>> 600000000, 600000000 },
> (why is it 400, 400, 480, 600, 600, 600 and not 400, 480, 600?)

Because I've listed every operating point clock instead of just the list 
of frequencies..

I will change.

---
bod

