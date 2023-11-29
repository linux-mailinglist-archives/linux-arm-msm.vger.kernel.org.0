Return-Path: <linux-arm-msm+bounces-2585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF79A7FE18D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 22:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0D828265C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 21:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EA86166A;
	Wed, 29 Nov 2023 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIWoXVpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4903C10C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:08:03 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332e56363adso154341f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 13:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701292082; x=1701896882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9jFHV2GrUp0ps1JJpB9xoZzEO2eSz+0BnDBZmO9bUs=;
        b=bIWoXVpYSzInobRl43VhJAlIO8YRr73ZKFHAgmlKmt1c4cmNsBflJsAjGTq7q1Xtlr
         Q6j39YnZoIXl3SrOqQ1rgo+O37S3lWSqBLA7gedBE4VldroTVAaaFvIdj2WZaJ6Fb9Lr
         5Bc4qGWdg1N6Ww87GaxTSOg1Zzs7KA3mt7S/NWzCXBF9MCHMdhu1nbRGOZVunecVMLt7
         9fGZQ1Eg513HZ1V+cM5WcuQfYNQVnjevZRLNZaA7gu3yFNxMrx+NfiibVuQMfwQrQ2Do
         9I8oLP8mZ+k4y3nvpkLiXSGuEmhjUsRTB3M3ZnQSGkN8mTyxHwyVjADCpSucSBQpelbC
         psDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292082; x=1701896882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9jFHV2GrUp0ps1JJpB9xoZzEO2eSz+0BnDBZmO9bUs=;
        b=Twf0oCSIaCybg5TVdwWdtuZvMsD0MHkFoBsIUbRN52HNFNwEXG71rc53kQNF9o/tdq
         JNj2Tgbz43m3sjHp8dH1fV0Fr8LhiWuoCFlwxuuEWva9K0z58vZy56gXnumUFb5C0qH3
         nn9ClRZ2pVjV45FGD+dTSBRpIxuos66aZtx2O0PEgF1QqqRfTbCwFitWcjMFXgjt+V6M
         tjC7CdzPZ3Q2eBfQy137YJqcdjbEk9MqVBA2+HVddGfek1T3aMNdr7ozrreR9jjRSFkH
         jHg9776VsiBUyF6efJT94HuJEEfWVALFK2SYRRhCpdXDwvfEQR04A200W827PxXQFKrT
         Cevw==
X-Gm-Message-State: AOJu0YzepEUmRy96gcss2KlIwHlmqkw3DKM4zA702XMIcDa06ZpoTYpQ
	hu2e+eqPwfSpYM64nAiPcDSe4g==
X-Google-Smtp-Source: AGHT+IEpKW5T6Mdf/X3bYFt6X7XSBnY76TN2RB3vLijvMEL2ZkKnEKMVbKRqdV8Xk1Wnk5wdvI3a2A==
X-Received: by 2002:a5d:6a42:0:b0:332:c585:400a with SMTP id t2-20020a5d6a42000000b00332c585400amr14557007wrw.44.1701292081556;
        Wed, 29 Nov 2023 13:08:01 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f2-20020adffcc2000000b0033315876d3esm3082637wrs.12.2023.11.29.13.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 13:08:01 -0800 (PST)
Message-ID: <9deb31e4-2e75-4db2-8a73-7c8b7f9ac03a@linaro.org>
Date: Wed, 29 Nov 2023 21:08:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] clk: qcom: gcc-sm6375: Unregister critical
 clocks
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
 <20230717-topic-branch_aon_cleanup-v2-3-2a583460ef26@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-3-2a583460ef26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 18:59, Konrad Dybcio wrote:
> + qcom_branch_set_clk_en(regmap, 0x2b06c); /* GCC_SYS_NOC_CPUSS_AHB_CLK */

Shouldn't this be 0x79004.

Also the logic here is - since its currently marked as CRITICAL => its 
fine to just mark it as qcom_branch_set_clk_en() which I guess adds up..

hmm

---
bod

