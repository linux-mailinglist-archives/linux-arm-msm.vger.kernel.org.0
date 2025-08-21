Return-Path: <linux-arm-msm+bounces-70072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370CB2F066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082BE1C85902
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF4F2EA744;
	Thu, 21 Aug 2025 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPXpavYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA102EA14A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763287; cv=none; b=J3ErHyPEs9f8+UFdL5s54AFYKLq0AmVDLsfLCr99ZdSRduoYkdf6WBAC8PkhkLxIyp+qKT0VtVY8k9zs5KD+WnQZ3Iksda68m2RYdzWIX6Rw4ZLay2aZaJEjU7MA4hVMd+fIwrB78jmJ06YfDYOUetWxWHcLRFM+e7siCq7mgaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763287; c=relaxed/simple;
	bh=oZLJpaFA1XQqrArXlzUBWsQNthOhGI0qtYmaSRqQPTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXaoYgeLVfnbIgKcuE6pwPGYTkd5B3gfjN5+brn9Kf2Be26Iqw392/Q6i9H6MxoQu7e/S5BDDBikMKcHTnqfubLTXP8jumQWk0smnuj+CmP0JbZrDeOmNUeSVWyIgNVyTBuHJ1zwnG7oaC3XuMCfyTHDZJPrvIZ+89k7BCT4qro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPXpavYv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so4945325e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763284; x=1756368084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNGT98klqSv2rZl0EJTYaB+wlY9yv0npHx6OP4ljkeY=;
        b=lPXpavYvHhVKV9hUtYe8IH3KqW1LI6mGgoofrXSLMjgtFK2hhEuX2V589fF4UFaS/d
         lLyu7i/mkUkhWlGL62hoqhdA6/WNDkruw1OBGLY4CPEfLaMaWSEgKkjXwgOZSApn7+b4
         sTwwe64yXZPLXsQ0kIjjIzlbEGXEtMIsIBYgzXczpmFuTH18LVrAHgHWfjl+RCEo5+WU
         eykx/hedcZUAZVx4RdMEmhcbyns/CHatxJgarQARMYAxzRKnO2SWCUmqJtCijOxuqhKQ
         sMR7gUYQUMtD7DUdZ17dIYYq7g89zaROF9callkTBZ9znyulHElpY7HLVyOX4C/i+r7T
         3RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763284; x=1756368084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNGT98klqSv2rZl0EJTYaB+wlY9yv0npHx6OP4ljkeY=;
        b=lkMWkg5j6qC5CmjrBJbtCU1tFg5rCSHOddW2q4WcHcHNkSbL34CmT77Ob0EAgxePtP
         5hLt/tzI20c277Zb9ZlevPVbJcYHL7FjioWrdgtOt/lS1xpF6di9d2pVnkzFNMFAO79w
         3NqBPu1MV2HjO8z7t4V8xhNX9gxmfHQmct8P/Fw3U6FbKN/3wBabgoRartvoZSBfKsor
         E+mBQSbDnK4HHNk1oxRuptB2Uoc9DQmvZGBTs47JhUd7d9cx5kUN4dckqnwaiEl/ISal
         Rnt3IFoYG10RmCqQzBkWveQ5rzzk8Acc+AS9DFQoRHc9uto3IkN+ZEb+Vq1uGlrXMx7o
         lv9g==
X-Forwarded-Encrypted: i=1; AJvYcCX/unWcmWAmjCPDhwQTTd5zGT+qpaxm6cv9dZ1NswFEXUGDHvh5IQYG1spg7QsS9Cj3hHECOxX/+//BSWyk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TrKkRysl1Q9N7U2AhTx4sG7QFRPUpnerFTLtxVKhpZ+be9yl
	7jXJ+29wpzyxzqdeGqzRfaFqK1benMjynQhdjCKH0/QJTQ8xqmRh22w88cC2SvzHf5M=
X-Gm-Gg: ASbGncuhXw8wHZRqZGVbyB9MML3FxSSrvO72pJW5PUjBFwUXp6es4N4Lq7AQISH+fhe
	AnLkiAEjJTttf0OnqGs8JsuN1f4bdRnT8rsPaHbRr3fA6PeOf++dcw9ki+JfxYdyJgaD0ZF7V/H
	GRdWl4uYcaL1aq2nMb9ocilY6KijDTPpU1ct5OcXeEzqpxX15dAD6vR6VtOX9aTFR6jeT1CFaht
	E8y4yQvcjn9comPBxKO2H10lmGnltxResODfcI2RS87PXZWxop/OepHzUd1f0/FM/9rI74KdeI6
	FMGcqwFU2uakQ8v44rVJ7CCav8dY+53vqDNOx0z0Ejh2v04cMvc/AIOVEeNBC1n1HetURDPgVT6
	jQFU5OF7k9OOAwev8cmh1Ldh1Gl7inRW6xWEeYbJdzjXklcosFuQIxk5vWyxDHBA=
X-Google-Smtp-Source: AGHT+IHCjFPjgsVt7tr3xezlGae2i3luW4j7fhzwL2N2wuLceLA5EUcPHt7ylepsbKjsUGTs+yYXqg==
X-Received: by 2002:a05:600c:45d4:b0:459:da76:d7aa with SMTP id 5b1f17b1804b1-45b4d84ff9fmr10651545e9.25.1755763284010;
        Thu, 21 Aug 2025 01:01:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dba004bsm17558505e9.24.2025.08.21.01.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:01:23 -0700 (PDT)
Message-ID: <8f337afc-32aa-47cc-afb5-7d5785d3e377@linaro.org>
Date: Thu, 21 Aug 2025 09:01:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: firmware: Use correct reset sequence for
 IRIS2
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 16:16, Stephan Gerhold wrote:
> When starting venus with the "no_tz" code path, IRIS2 needs the same
> boot/reset sequence as IRIS2_1. This is because most of the registers were
> moved to the "wrapper_tz_base", which is already defined for both IRIS2 and
> IRIS2_1 inside core.c. Add IRIS2 to the checks inside firmware.c as well to
> make sure that it uses the correct reset sequence.
> 
> Both IRIS and IRIS2_1 are HFI v6 variants, so the correct sequence was used
> before commit c38610f8981e ("media: venus: firmware: Sanitize
> per-VPU-version").
> 
> Fixes: c38610f8981e ("media: venus: firmware: Sanitize per-VPU-version")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/firmware.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66dac2acbe11751a8c250876e20d795..4e2636b0536693a86dc51503d01dc2bca40b532a 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
>   	u32 fw_size = core->fw.mapped_mem_size;
>   	void __iomem *wrapper_base;
>   
> -	if (IS_IRIS2_1(core))
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core))
>   		wrapper_base = core->wrapper_tz_base;
>   	else
>   		wrapper_base = core->wrapper_base;
> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
>   	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>   	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>   
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>   		/* Bring XTSS out of reset */
>   		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>   	} else {
> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>   	if (resume) {
>   		venus_reset_cpu(core);
>   	} else {
> -		if (IS_IRIS2_1(core))
> +		if (IS_IRIS2(core) || IS_IRIS2_1(core))
>   			writel(WRAPPER_XTSS_SW_RESET_BIT,
>   			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>   		else
> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>   	void __iomem *wrapper_base = core->wrapper_base;
>   	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>   
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>   		/* Assert the reset to XTSS */
>   		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>   		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250815-venus-iris2-no-tz-f9b52f33c4d0
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

