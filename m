Return-Path: <linux-arm-msm+bounces-16989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F089E62A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 01:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E36A1F22B4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 23:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD79156F4E;
	Tue,  9 Apr 2024 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFfzX6Cr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7B158DC4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705825; cv=none; b=LyNvcAeNqbCEgRTc2nAs/72x+e4V3PBBjcJ5hRwkMdp42+EWjmE0zP8R+OlfWo8q5YTNPptdf6lvpj0dpWN3zb1+mVLQeXGpg2EKzx+tcUhb8bmr5WXiz7tR9gmgtH/uQIlMv52BKzSm06SI4XnBZtxVXg8TTUQRck+Fhaa1jIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705825; c=relaxed/simple;
	bh=h+e5fvJt2EaWgcw8KS2F0yKCq8DnQLW0iSRB9NusBAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxJKSeUmvLfBHomKL0liD2Mc467anBAczyCZTM2H0S0xTFXSpIVI3Uua+9pT5lM83mfpfGH+FiE4pBIgD979F6tqkRLR2WmWBQMapeHD7EbPErWJKyrT07Z6srD2lbYE0WPHp0Zcer32Bf4+UwGTHZ0YbbmtCjjPpdr8Sbf+Dhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFfzX6Cr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-416c4767ae6so2022215e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 16:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712705821; x=1713310621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYrn0x7gSGG0Zq/O+j6l0dU8abj1nITQX9daWRuGgbM=;
        b=MFfzX6Crm71ZcyljN9aTsIvV1fapFSPqXXgWu8VDtavThklmct7wQ2nEiGIMNtRXFM
         mLqUt8O9o3YjHqP9DD+B03qltNCfeXOohWKhTbNAF96vBKCsyWny45Fw0YrOZeB/B1ta
         CngUGYgfdIGjCwDLc3c6ZKuRshNlw1VgGpC6ppf3glmwmEloIY7tSPMVVe/7XzWfpo17
         zfR2DfataLEz6Gk4nMKwlhR6g/r3l3v1GiwJBSKkQYF0i4hwF9JD0D0uBc36Ai5w6CJ0
         bkwUjNKN/1qgclXxGsJqng92/zSiWRk3UQff/mounyg9w3A927vlcGQ2kkaTuMtqFevi
         XonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712705821; x=1713310621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYrn0x7gSGG0Zq/O+j6l0dU8abj1nITQX9daWRuGgbM=;
        b=AxfJhyvcoj/ZdqZM5TPB5MspO36+BnJqxOE4zdnEfMRAFvqk6K9yMuGtE3pMsurx3L
         qmpcND9LkEgPeoag06dZNhmSskJgBjeT2WHMjx2j1/pGe7R3TDd4NpElc17RfrM/idJ7
         bakzYAzPdUfc4yUtZrVvzfQlLcDTc6nIggRzA63k1GMStq7/OPrWIes+BlAgEVshPHrs
         3imL3ogrwUJjWqmbUQ7aEoO8iFLMlwNICE4he0Q0TkXHUozL2W0mLrdaOqbK/zCseUG6
         3+uBqf96S2aOkdgwVY45Sb5qTM/jS3JAL9HtKdx+WgEV1s5NWity8j4m9vs/hVvlDsZ1
         9+sQ==
X-Gm-Message-State: AOJu0Yy8PYp19jKgOCR9aGQBQWoMbal+yymhVPcK02gZdKrsxkPOOEde
	j0+ycgkxh87ucb7AKzTpge/9/fHccUCqa2eC/WrtEEsnzYh1iUF2A78uSx083CM=
X-Google-Smtp-Source: AGHT+IGJQnrTHEaPrdEriH4SBasEFssxXyLPx4aNYphkDFzcVtK9Su2Gu0LZkdSMraUYM05UT95/IQ==
X-Received: by 2002:a05:600c:1d21:b0:415:5fd6:44c7 with SMTP id l33-20020a05600c1d2100b004155fd644c7mr722669wms.27.1712705821349;
        Tue, 09 Apr 2024 16:37:01 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c4fc900b00414807ef8dfsm450584wmq.5.2024.04.09.16.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 16:37:00 -0700 (PDT)
Message-ID: <bf1d7f35-e109-48a3-8e95-e35a5b09b809@linaro.org>
Date: Wed, 10 Apr 2024 00:36:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8998: fix vdec low-power mode
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c427e89e-7ec6-472e-8ba8-65d5721df62b@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2024 16:56, Marc Gonzalez wrote:
> Use same code as mmcc-msm8996 with:
> s/venus_gdsc/video_top_gdsc/
> s/venus_core0_gdsc/video_subcore0_gdsc/
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
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

I think you should explain what this commit is for and why its needed.

Switching on additional GDSC registers that the top/subcore0 and 
subcore1 depend on, instead of just saying "copy the code from 8996".

With that fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


