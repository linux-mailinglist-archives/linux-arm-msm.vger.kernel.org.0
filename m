Return-Path: <linux-arm-msm+bounces-1531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 649CC7F4BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 17:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66DE91C20846
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 16:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371DC57861;
	Wed, 22 Nov 2023 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkYWOhe1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3D2D41
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:06:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50aab0ca90aso5436835e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 08:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700669195; x=1701273995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mnjxkuXcJXDP3gMcUiN4SEisCT0v2zuVwcrjlWRarE=;
        b=bkYWOhe1zQAxdhDha/XA7tBEed59jgBW3wP4X9ukDhRoY0aImCgkA3W9s1LslC0fij
         DfoGyN69GDgIKeXo1ENUVrmaOlVCBNq3QAVsk9fwjrXWur9R0f+xeSOGWLK0J191MsdB
         uo50wp2ii1/ndUVB1pPr46vShUtgrE8+JBxuvo5DCYuIEDd+3JBLjwlaE0UALpbiWAmb
         bHlusiIQ216XekhfmNe21lZNXTXdxUAa2e79TesKG2TRbj8eoLx82cBi83v9olNoA0bA
         gvY7z9NQ41AXNkoYZpC015c1tF7FzgEq77/GuR22IDgxZ4vR4wrn07jfMAD/BDXjV5vT
         KqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669195; x=1701273995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mnjxkuXcJXDP3gMcUiN4SEisCT0v2zuVwcrjlWRarE=;
        b=dczopTbHZEFVpFF+DtOeOwbNFdOsMWPiaSBXLmDuw9tryHsqvKX5Wr35vId8IZMXo6
         MxuZF5muNOxSsM6YnLXm1Ox9Nz1K/BEBWVsk+Mo5W6DPuagygYqbd4kIS+AASSCDdvIf
         Vcr2kxyVGjj1B+LqFq3I/XabOQ8DtOczFOqSp/1mR0EhkhLIZa5Gh2Z/AT6ZHMh14p9q
         33Xp3k7ZNrskio6coVjVzHWD14xVNYM33gPc++svpmM1/4Xsmd2Yc126MK7wh+AMgxSJ
         uHmp7sl+0rcwNQsqbj3K33Eun5C1x+ZwuJPR8+0irdjPl6qRGNDvVBNjseKvyh2MS856
         txWQ==
X-Gm-Message-State: AOJu0YxCw9oAJexj5Y4cruVxtN1RsFmbE5SHZXYGvjXEe9K6lfkyV4KJ
	X3Sr4gJPLg7RkBjeHFbTqlUjhw==
X-Google-Smtp-Source: AGHT+IGaNfHxXIOdW9aMrIlLdqSxyYzkqVLUEMRqiJsmE52M/h5sAhBTzkEagJpEnoMpbW++YBXC0Q==
X-Received: by 2002:a05:6512:3ca9:b0:503:38f2:6e1 with SMTP id h41-20020a0565123ca900b0050338f206e1mr2232652lfv.5.1700669194676;
        Wed, 22 Nov 2023 08:06:34 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q20-20020ac24a74000000b0050943cf9cdbsm1878694lfp.307.2023.11.22.08.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:06:34 -0800 (PST)
Message-ID: <c1d14c70-6fee-48c3-81b1-cd6d422e31d7@linaro.org>
Date: Wed, 22 Nov 2023 17:06:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] arm64: qcom: sa8775p: add cache coherency support
 for SA8775P
Content-Language: en-US
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, mani@kernel.org, robh+dt@kernel.org
Cc: quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
 quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
 dmitry.baryshkov@linaro.org, robh@kernel.org, quic_krichai@quicinc.com,
 quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
 quic_schintav@quicinc.com, quic_shijjose@quicinc.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <1700577493-18538-1-git-send-email-quic_msarkar@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1700577493-18538-1-git-send-email-quic_msarkar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/21/23 15:38, Mrinmay Sarkar wrote:
> In a multiprocessor system cache snooping maintains the consistency
> of caches. Snooping logic is disabled from HW on this platform.
> Cache coherency doesn’t work without enabling this logic.
> 
> This series is to enable cache snooping logic in both RC and EP
> driver and add the "dma-coherent" property in dtsi to support
> cache coherency in 8775 platform.
> 
> To verify this series we required [1]
> 
> [1] https://lore.kernel.org/all/1699669982-7691-1-git-send-email-quic_msarkar@quicinc.com/
> 
> v3 -> v4:
> - added new cfg(cfg_1_34_0) for SA8775P in both RC and EP driver.
> - populated a flag in the data structures instead of doing
>    of_device_is_compatible() in both RC and EP patch.
> - update commit mesaage and added reveiwed-by tag in commit message
>    in dtsi patch.
This series looks good now, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

