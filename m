Return-Path: <linux-arm-msm+bounces-1683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7417F5E34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 12:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D65281BBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E306823760;
	Thu, 23 Nov 2023 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqcoSxCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD5C101
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:49:34 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c897ba4057so9174171fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700740172; x=1701344972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zodyNt8HU4L28WXiwaDHTNOJQKBgwAnxPffi7XClyJk=;
        b=TqcoSxCGXlxkQisfvPMHs0KTR0U1e7BokgKL5LJCFpbZSsD6WmUKz7Tbbvrf8HWEpW
         20QngTkecoT0uEQV6f1Lkygl9aAk4TncuKxZXPVyEVW8pAI+qk+6pROq4paCKWYEd44O
         NToQhmZjblpsUA+XgkRYjxcpbiWjmR4yaVlqi1YEZkId+Ndv3u2LqPsX3nT9vM84YU2Z
         fqqOp/XCQDeq7a4AS+N8l5bOUB94/KhR7XIEVW7r2IjkL26sqOfdZvqvgeYdSnXdezTS
         I3ERqjzWugYIsoi9aypfatpq2UTR1lKzi72TsEgGr2L4h9JUD2ZeTAs5w1Kc8wsl4EU2
         32fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700740172; x=1701344972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zodyNt8HU4L28WXiwaDHTNOJQKBgwAnxPffi7XClyJk=;
        b=q0d9cj3MgZtMxJEGn+8owzXCvk1s3TMNIZHYlo6EY733lhE9hTN9hKMCIRc0iaE8HS
         w/UzI4QaIOabm7F8cH/Qb1jDrg2oCzB8GUTimHxV3GEOer2LFcy0JKTXmbDTddgpytKD
         AoV1OqI2rsg77Jk5+7LVLwr1DUmI8Lo8bcDt7GZwP/WQ/Vozqo6XhV+9vKNtTMDaTOHh
         q1waqG/fbaCALmYwmz2w2gYEixrxDV/dS5Lp6rWb6g/CqY2/+aExH3RxvDBy+hpCMUIg
         9kl/4DyPrZ4WlzH3p2oG/zCxNS41M22gvb2yoAjv5uWRZCErj2by2+/MhXof+IGn7LvN
         2NIg==
X-Gm-Message-State: AOJu0YwXa6qhz8oMahWGOlG678cdhm+5SKF03Y0zlHjDKdq8M3VayC5x
	joBN+r/b7v9LVpM7jMvKYHcRAg==
X-Google-Smtp-Source: AGHT+IEvzxF8Q9LmbNFSbHtl6ccN5a7PavFv9RBaNpiHxwVgHQErbC8TQdgSRKYphLN2YUDeVe6q4A==
X-Received: by 2002:a2e:b604:0:b0:2c6:efc6:946f with SMTP id r4-20020a2eb604000000b002c6efc6946fmr3697514ljn.30.1700740172318;
        Thu, 23 Nov 2023 03:49:32 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c12-20020a2e9d8c000000b002c505793a23sm164296ljj.109.2023.11.23.03.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 03:49:32 -0800 (PST)
Message-ID: <2628b928-248b-41c7-81e2-4e4252d2b0f7@linaro.org>
Date: Thu, 23 Nov 2023 12:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-5-55eb0f35a30a@linaro.org>
 <6e66875a-5cb1-42bc-86e0-b69cf73981c0@linaro.org>
 <339c3efd-8d2b-4b71-8dc1-cdc30ab7bb8a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <339c3efd-8d2b-4b71-8dc1-cdc30ab7bb8a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/22/23 21:55, Bryan O'Donoghue wrote:
> On 22/11/2023 19:55, Konrad Dybcio wrote:
>>
>>
>> On 11/18/23 13:11, Bryan O'Donoghue wrote:
>>> Right now we use fixed indexes to assign power-domains, with a
>>> requirement for the TOP GDSC to come last in the list.
>>>
>>> Adding support for named power-domains means the declaration in the dtsi
>>> can come in any order.
>>>
>>> After this change we continue to support the old indexing - if a SoC
>>> resource declaration or the in-use dtb doesn't declare power-domain names
>>> we fall back to the default legacy indexing.
>>>
>>>  From this point on though new SoC additions should contain named
>>> power-domains, eventually we will drop support for legacy indexing.
>>>
>>> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>> So, this commit should be a NOP within this series?
>>
>> res->pd_name isn't defined anywhere afaics
>>
>> Konrad
> 
> This series is mergeable though the linux-media tree standalone, yes.
> 
> Once merged, the dtsi change given in the cover letter will be submitted.
What I meant to say is that something similar to [1] is missing to
make use of the infra introduced with this patch.

Konrad

[1] https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f43942091c01c1f263a6e7adbcd0ed8ce723a303

