Return-Path: <linux-arm-msm+bounces-1536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7DE7F4C72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 17:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9B41B20BC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 16:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D2F5102F;
	Wed, 22 Nov 2023 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ujriAYPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96CA10DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:32:32 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a29c7eefso9785122e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700670751; x=1701275551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3CpM5/THx6+8DnjFCPVffJyK/2ER98rSKDWGZl4fAA=;
        b=ujriAYPHAWMdIq41fFWFPjbVdohxhz86pE6yoc/Rf2qou/o+M+Rn45lYhjnZ4Zi0dU
         sGPFIltMxXIO3RJeR0kNKpFjZHUCRKlwRgRCzRbCGdCpCFpU78pVukFYNZ9wQKwA8Mp9
         qZBBe8YnmR9zMilQrt8qh3JRPq6AcY3U8yFDqOQS+jBv56WTmp4QveWUXUvp7iKfhHEJ
         wEqWtltKiNbYpVbOC2H1NfoJlzKUu8Ly3OGBQpa0VlY+MIv5E5nDbi/gEchoFAp+OI8z
         DIXKj9iVM+CKgSsiOpVIDicb78xvXYPJgMudmEnBkAb8EWeCL7kUij7z4zPicFtzbgU3
         m42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670751; x=1701275551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3CpM5/THx6+8DnjFCPVffJyK/2ER98rSKDWGZl4fAA=;
        b=wRtdw0JW+LUxDiNxlZPVhureuV20qCf8CDJ4zb3TwvyLpSseEb1ufx6ELseZ4FCXgu
         ATd2ddL3a2hsQAFDhRfjSM/QZ/8Qd3byeQ7gVkWPXH4b8FjsPyXGVT6e6wcVqRzp3Kd9
         kO6X/a+67CId1bW4ncGgx+ihPpmQmncb5KZTk+jihFTQF55h4hIaXf15gV8kl8n9fXeH
         dmtaFMXQgP2ZcSuc0sRm4xJmbG1lwJtbw/Pzxthr4KZnwZn18yOR+BxA0R8zmYMc003U
         GaOF9XC7HMNfDzGMRlN5DmeERa82lNbq3iwJN3crLWHNhNDHAJHfo6I3fqkAN6B+1/su
         IxmQ==
X-Gm-Message-State: AOJu0YymEIasCnebN+MnM1G7CXsrpt2OaK51Y2iEhpEQMif1xVdMc4nH
	skHlqiqVg8PfuHcKUoXXcIIFew==
X-Google-Smtp-Source: AGHT+IEswAuYBltyPm+uze537OkFpnHIvLyX+dTfkYTTj3/W/ds74UqBcuP0IiPRNjnnsPDDUNv/dA==
X-Received: by 2002:a19:5514:0:b0:50a:a6c3:4b21 with SMTP id n20-20020a195514000000b0050aa6c34b21mr1976243lfe.32.1700670750880;
        Wed, 22 Nov 2023 08:32:30 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k7-20020a05651210c700b0050a6fd7ec34sm1886640lfg.191.2023.11.22.08.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:32:30 -0800 (PST)
Message-ID: <a27e1190-69c2-4879-9917-b9545bb6a118@linaro.org>
Date: Wed, 22 Nov 2023 17:32:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] clk: qcom: ipq5332: enable few nssnoc clocks in
 driver probe
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-2-a7ff61beab72@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121-ipq5332-nsscc-v2-2-a7ff61beab72@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 15:30, Kathiravan Thirumoorthy wrote:
> gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk, gcc_nssnoc_nsscc_clk are
> enabled by default and it's RCG is properly configured by bootloader.
> 
> Some of the NSS clocks needs these clocks to be enabled. To avoid
> these clocks being disabled by clock framework, drop these entries
> from the clock table and enable it in the driver probe itself.
> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

