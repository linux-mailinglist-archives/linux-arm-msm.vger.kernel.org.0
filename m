Return-Path: <linux-arm-msm+bounces-17506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 244CD8A5BD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C2C31F26854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427D815625E;
	Mon, 15 Apr 2024 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3kq/na2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721DD156225
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211022; cv=none; b=ejokW8vMX4H2Z8gGgQQUdpuflrLz3hv62NzFrRoNw5okFWrudKNB90T58rZVgJZlffzPLr3Lxodtrw7rb3DJOlZBdJJsu5As76LmhyxpD82Hb/orjcqgZYeAAhoxL6mhhf00oaI3ZoWAarXJZaAZjnTaBqtVHenM5U0SEE4GYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211022; c=relaxed/simple;
	bh=2slfWTMln8rIj3aslEiPXhhOYTM+m36meXVTS0sJjrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BykHitvrxjzP6goe2FHTQXeRTPKMcCqExYY5cxLndOOvRpIwQeup8jqEREfjUytcVogoUvmL3ky4rUOnH35Kzx/7dimasx7iR2zYZvzWFtejM2o68PAKiX4lH8zOosxNpW+oHLQF5yP9ZrDKBe1HHc027/lrbzWmhbwGlD35Lm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3kq/na2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-518c9ff3e29so2056760e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211019; x=1713815819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVcUvUxKvP42tR9nsbF1BFtRbXcEbqx0UXm62N5Ey4I=;
        b=P3kq/na2RmWuceNXXngAtJYpWwTPWjH0g0JoLzhtumVo5CtuGlBEjuI01GhioHfHPw
         Y81lVwu26zyttr/RZY1zd5IWOYyaQH12Umf6gCeIHlQNSbg/0TvNMebLb46svYRK0JGm
         f05kBZdmWNJicuRMZAPuw26lZxHJ+1U7dJ83RYnHkud0RYdt7n1gluu7gtien8Me8EZq
         mRMJ8IhzOUmhQwsX+qdCGjEX0cxUTGsEJJqRlTZGEnH3fztLx395Rj9cPPwtyxr3voRn
         Zn6LmiOx/x/w3Q+uyVWfwWi1LzOk9fCAIn3Pdlnygb5AMm2L63byKp8K14umZbf6lqlL
         U52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211019; x=1713815819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVcUvUxKvP42tR9nsbF1BFtRbXcEbqx0UXm62N5Ey4I=;
        b=h9bnJp3B8KDB+GiJcdOe2e1oe5Z79yl46vpV/AsFXS2ItvDEVDHCfCCjzY/yRdYUUI
         K+BCWScp8dyPW9s7Atecxzf2UTZy8FPhhwTxy+PBPufQoU3s3XY7PqlXgU4lzNDr35a+
         1neJGlp/FLh8nz+PkuzpBXY0pgQXf/Ao4ZSaAoddkQzR6nIPNerFTI5hGtxJrCh/Ue3o
         CAYPyCpLFgKRV+01nFSWt1Ht5ycyoRoSRlvbqovkRRS51gamfeWBoqEPNPW1zNR52ANb
         Zbv+BBuFQbAR9XsB58Fce1rV87pb/xccZimvcjnpDcgmM9Afkf6ZRXMNhJft6VSrHJ5Z
         dNzQ==
X-Gm-Message-State: AOJu0YyVh5cJ5hd+2SOLsCexJswlcoOM5LcqhYYKn2s3KcJdpjpLQwIB
	Stf6pSCCPEu3eQyPmIEBvAdGU9lsw1qtQUp8DrxvNXboV1vbqodJxo5QuKRvJFoaS68pWZo/t/Y
	RpzY=
X-Google-Smtp-Source: AGHT+IHEkDeQYsQxzyG8UfgTqSRW9hLhKp6aVkMeAFdcHs+cwe9mtvL+V+Yp3pjeboAJrpGZ0UXkcg==
X-Received: by 2002:a19:8c0a:0:b0:516:9fdc:2621 with SMTP id o10-20020a198c0a000000b005169fdc2621mr7074100lfd.0.1713211018626;
        Mon, 15 Apr 2024 12:56:58 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b00516d6925de5sm1346470lfq.92.2024.04.15.12.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:56:58 -0700 (PDT)
Message-ID: <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
Date: Mon, 15 Apr 2024 21:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 13:13, Marc Gonzalez wrote:
> Video decoder (venus) was broken on msm8998.
> 
> PH found crude work-around:
> Drop venus_sys_set_power_control() call.
> 
> Bryan suggested proper fix:
> Set required register offsets in venus GDSC structs.
> Set HW_CTRL flag.
> 
> GDSC = Globally Distributed Switch Controller
> 
> Use same code as mmcc-msm8996 with:
> s/venus_gdsc/video_top_gdsc/
> s/venus_core0_gdsc/video_subcore0_gdsc/
> s/venus_core1_gdsc/video_subcore1_gdsc/
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
> 
> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
> 0x1028 = MMSS_VIDEO_CORE_CBCR
> 0x1030 = MMSS_VIDEO_AHB_CBCR
> 0x1034 = MMSS_VIDEO_AXI_CBCR
> 0x1038 = MMSS_VIDEO_MAXI_CBCR
> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---

[...]


>   static struct gdsc video_top_gdsc = {
>   	.gdscr = 0x1024,
> +	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
> +	.cxc_count = 3,

Marc, have you verified all three are necessary for stuff to work?

I'd expect 0x1028/venus core to be absolutely necessary fwiw

Konrad

