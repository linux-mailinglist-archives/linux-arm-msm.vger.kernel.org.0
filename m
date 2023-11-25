Return-Path: <linux-arm-msm+bounces-1937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 841217F8A42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 12:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6F151C20B14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 11:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90058D295;
	Sat, 25 Nov 2023 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qoWW1Zib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71ED5D41
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 03:40:45 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-548d60a4d60so3592255a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 03:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700912444; x=1701517244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PumLW+yDxZ/EbkcbHSkfvm2AU7+9Cl4vHKO664Y9Uss=;
        b=qoWW1ZibFg2oDfmXXnMi8Q8D6OrueMGF6nWPrR0KMU3IHNOs4dZ6zuFIuIcRL00aFG
         Nhf3/GHlI1CBpzxS1N2TKmyysqocrX2z5e7D3WtojImDmkyhgCByW2IFpcXo5QoUFOGV
         Z5fsZY4FZPronrs5mM2BPcVta3qikIrS2xS4eB6RFoYiqGNn3B2LdJc7pzvlsd/CrJeD
         2XIkO7s/ZjozBc3dhmSP/xkSZbWbVjAR70hJnYd53Crz8Zk5Wpz/7Z26x0f7B4M1Qh/6
         cXL2Z4ALgTym1ISSyO1Ou9bzjWoMkCKIj8i5VrIusxtj16Xvo1m3Iz+lRhRs1hObyixY
         +G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700912444; x=1701517244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PumLW+yDxZ/EbkcbHSkfvm2AU7+9Cl4vHKO664Y9Uss=;
        b=xM//3WdVmHUhNuaPf1MQV6fahXyJSVLPGxwuprtmVsP//8OqwI1MNrIHLJ1ESoSIlN
         /CxpvYlc0q4SYUb4/LWAO+os9eE92ekLyM504LVHc0laI0IFXc/qT8SkG+Ijw0hCLe57
         pbTfclMS1iE2KUo9/Zw9/9RQk3rkAUgO5hXBxW+v7PhL6dKygx9GUndgb+V9Aatm3vIh
         dH0d03EcS/p9ShRZyrZaKJtwZ6IdGdlN7drtuYrsIs3skTFSFERRKQXSZbgTv9d0zAFE
         izgmHUdidFY0Jg6CzJhKTn5jwqrBS0fyHULlgCi/s750xTIee3j0mEZLv9wcUe921kY4
         RsaA==
X-Gm-Message-State: AOJu0YyGUwIPcQQYxbIuRMi3EE7Kw/PmQIUpZ4VkAy2iYUuZxDpTXCVW
	eP8cCpxy5a/1wjEv472Q/14dcg==
X-Google-Smtp-Source: AGHT+IFqBVsdh0o76qmN+wtVD1l8pCKeP6JfU9XIAzHXoVgjey89blL8+iGjRUsvpGsDuu/dMSOTGA==
X-Received: by 2002:a05:6402:2207:b0:54b:25e8:c007 with SMTP id cq7-20020a056402220700b0054b25e8c007mr867357edb.2.1700912443857;
        Sat, 25 Nov 2023 03:40:43 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id cm26-20020a0564020c9a00b0054ae75dcd6bsm2114552edb.95.2023.11.25.03.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 03:40:43 -0800 (PST)
Message-ID: <844cc2e9-d487-4bf2-aa3a-7e0cc51d722e@linaro.org>
Date: Sat, 25 Nov 2023 12:40:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122042814.4158076-1-quic_skakitap@quicinc.com>
 <2b619607-1219-46db-a439-0f087b8b5d3b@linaro.org>
 <a2137dac-9660-53ae-8950-4902c05a3f66@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <a2137dac-9660-53ae-8950-4902c05a3f66@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 12:24, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 11/22/2023 9:32 PM, Konrad Dybcio wrote:
>>
>>
>> On 11/22/23 05:28, Satya Priya Kakitapalli wrote:
>>> Update the test_ctl_hi_val and test_ctl_hi1_val of gpu_cc_pll1
>>> as per latest HW recommendation.
>> IIRC there is SM8150 v2.1 that's there on most devices and v2.2
>> that was used on the Microsoft Duo (or v2.0 and v2.1 respectively,
>> not sure, don't have any device on hand to read it back), do these
>> settings apply to both? Are they different for mobile vs auto?
>>
> 
> Yes these settings apply to all v2.x devices, also they are same for auto and mobile.
Thanks for confirming!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

