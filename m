Return-Path: <linux-arm-msm+bounces-52870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1FA76386
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AE9D3AB4B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5E15624B;
	Mon, 31 Mar 2025 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CeS+1b+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8715530C
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414438; cv=none; b=Dksn5Tdlbqy2I+O7fxkk9ILeRS/QE/gUrz8tTtuBSiRUhIbyNjodgvU/MEMwmxjKqxxZn2V3Trbj34HJtzOlQfB/fuZiNZUB7U5Iwcxq/W7Ux4Lu9sAJEWdrUpQ86BHY5FHaX4X9I1Mb82M7Wf4VodB0ZWyAoYdnoeJaX8Jh7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414438; c=relaxed/simple;
	bh=Venc0R9MmLZU4P6vxvqkyKPbHSuxuLNMgx9/zPD4GIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aEDdB2yqjwzzaeWdJs5gc0aT7ydKom09Fcy75Rc7qGKoHlWs7X9MrYs6gNG1DyjQVYSaHniVTnvojPruCTbLZ5qlyJPdTt1FJXletihvmruQGEBV05IaHsyYXHqIZo6J3TbF9OnWarxIUiHEM9BdSwcRF1CFbknByDeEt1s/Z0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CeS+1b+J; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3116223f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414434; x=1744019234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/6T+IK4kQFW5LGxYUkfrgYBcoHRcCX806KYmYWTSVc=;
        b=CeS+1b+JT7tOginDXWM0GJXHPKO+O+zw0azJ7FYMcZ8kBtvB1Lth0VnPLM9C5lldHj
         wKX42hp/OAWhP65ohhuE0wqlKVoit16/dVk4SQOVO75ZAg6K+fpoOsJmcB7XbqMXMZvU
         peZMwciLoRxqlBV3T0OMBOrVaNOFllilhqd1dC2kZFTLu+tGRbJCwGFn+lNv/QJpr95+
         0Ejg0IQ/f6qIrdPZvdlKcTEc9OjRaJ7WnG2NkpIKTTXtvnYNiTnQktDf/PIn/d9w2kE+
         SU5yVjoNd4lSKf15SMlEdKtSod/VU+CoIA6fXhZTGP2LJryCW7mmMQezKD2ppztGqARg
         IUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414434; x=1744019234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/6T+IK4kQFW5LGxYUkfrgYBcoHRcCX806KYmYWTSVc=;
        b=j+Qtmd5gVme+e1uAOSvQptNstql/0v2uZGibLbSZBdNfhlOG4ZVcQiMEQKcE9hIwN4
         BU9YoEkWUI/7oVgAz7n6VAqc3PQinhdTOQYO25pa4NBgV6PiAFB9SyBs1ySrLYZIcyD9
         rldnCX+w1wbIOzsgBvX/6pWaMSo7JkUzbCAqkbbWbHP96DWjvghvPjG8VR8gDv6fpHEv
         ZJlSbSuuHmsoA0cfoXVBfYeZotpnVDhRPeDUiMcO0a7EK17bKxWaetzRwHxPTWfargs4
         O/A+reg0MTH5u5KYeNH1u4BMvrKjCZ7x7sTyMzldisul8Ny54OLwW5yLOdPDzk16nYjz
         WeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPVoLY4Pb51T3hASpgTIP/5+iGDyqjdiPkIYGx/Th/9NoqW2Wrop1gZ3RX7yuBnSDahchkEcb5ubQE2VFW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl89CGHRdZkoaXra5Y1PfKisdf0cFwIOr6Ry/NRQUgcpFgJSTO
	RxmmVbHWYtG/Zz3izYN0HnwEHAtTor+7vJ2yyzD+YeM28qsL6j32PyqG1JnsURE=
X-Gm-Gg: ASbGncvy9J+gUNeFBPHFDfuSN6OHI81DcoqWgf8RuWAV8aF5m3K3CWw3TLgZl3N9tM1
	54jneuuwyy+BkTNlM+Ov2XnM03fCzB2K9GA3tMBYmvw7uSCKpWz8iT9bukmjp9QGk3DEGWhwNkM
	KgY4t8hSrbwvyB62tK03cBX/M7Th0gN/3AtUyd3SeTXq5YT9sQsrCSuYGd4mhSfwK/9sob1ZENM
	ZorzSet7UwLCok42mriXTeY3P1SBycw40tf2ngdwPsk3oq/MEEgve2bWA2ryzryT8s7MW8cW2DL
	ZSdPO6qypAc60ms3Suek+oYhg5qb3sc0LWbPIYPDSgBp7LLTekrhsaynLs3MiX8VIht6fQleQ2g
	LoWvZO0BbBA==
X-Google-Smtp-Source: AGHT+IGMUegZXQYvjBW7lBSudZknsY+kZe/fnWcgmhC6zzO71WPZhFXb7rTJvX+dUT8gTZAbX7W3zg==
X-Received: by 2002:a5d:5885:0:b0:38d:fede:54f8 with SMTP id ffacd0b85a97d-39c11b83b8fmr6341711f8f.16.1743414434519;
        Mon, 31 Mar 2025 02:47:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41a9sm11056171f8f.90.2025.03.31.02.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:47:14 -0700 (PDT)
Message-ID: <5c1d5dfc-b189-4948-8739-1fd90ebd033b@linaro.org>
Date: Mon, 31 Mar 2025 10:47:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Venus probe issues on SM6350 SoC
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <6P5iXJOUxv3jsPGI11XbeZOagg2ht2Ws-WbN2HjXSFC_xeFgWyGM3a9T6y30gmys3KSxJF9Tv3f7jAehZ6AlOQ==@protonmail.internalid>
 <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
 <6ae076fc-e30a-431e-b75e-7f9b9d7bff08@linaro.org>
 <ak18vN44u4bjszfN2KsbOPxAzArT4ISzMKI7eapjrU-rK6O85oI-fqAIHPLYeQVIzUS32Huvpql2Vcg6_UHaAA==@protonmail.internalid>
 <D8U8XDW1QRAY.35U7ER6E74G55@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D8U8XDW1QRAY.35U7ER6E74G55@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/03/2025 07:43, Luca Weiss wrote:
>> Also why not turn those apss_smmu entires you have commented out back on ?
>>
>> https://github.com/z3ntu/linux/ 
>> commit/281d07ae965ce0101bdb528e98bf8c00c94f86ec#diff- 
>> ea117dfbd122406c02e5b143ee0969a3de21416b6c192e3b5ad024571f6e4bffR2016
> As far as I can see, other SoCs only have the IOMMU that is downstream
> non_secure_cb.
> 
> But unfortunately applying both changes (RETAIN_FF_ENABLE + iommus)
> doesn't change anything, it's still the same error:
> 
> [   82.603202] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   82.604738] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   82.606263] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   82.606273] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   82.606280] qcom-venus aa00000.video-codec: wait for cpu and video core idle fail (-110)
> [   82.606287] venus_probe:505 ret=-110
> [   82.610767] venus_hfi_destroy:1690
> [   82.610783] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -110
> 
> Also one thing I can add from my notes, what I didn't write yet. This is
> how the register looks with msm-4.19 downstream. IIRC the values here
> are not directly comparable because of bitmasks and stuff.
> 
> [   48.936285] __prepare_pc_iris2:267 DBG
> [   48.940352] __prepare_pc_iris2:299 DBG wfi_status=0 ctrl_status=40000001
> [   48.947624] __prepare_pc_iris2:299 DBG wfi_status=1 ctrl_status=101
> [   48.954212] __prepare_pc_iris2:301 DBG
> [   48.958178] __prepare_pc_iris2:314 DBG
> 
> Regards

I wonder are all of the clocks going that are required to get the core 
booting ?

Taking a quick look I'd recommend keeping

SLEEP_CLK and AHB_CLK always-on

https://github.com/z3ntu/linux/blob/04f855c2b70302c9ddcd47b1fee4a2dc84fb5ba6/drivers/clk/qcom/videocc-sm6350.c#L301C1-L302C58

It might be an idea to set all of the interface clocks always-on and see 
if that makes a difference, rolling back individually if it works.

- VIDEO_CC_IRIS_AHB_CLK
- VIDEO_CC_MVS0_AXI_CLK
- VIDEO_CC_SLEEP_CLK
- VIDEO_CC_VENUS_AHB_CLK

... and if we are going that far might as well do the whole array which 
is small enough

https://github.com/z3ntu/linux/blob/04f855c2b70302c9ddcd47b1fee4a2dc84fb5ba6/drivers/clk/qcom/videocc-sm6350.c#L293

Is it possible the AHB and AXI clocks are on => read/write transactions 
would work but one of the core-clocks is off => no boot on the remote end ?

---
bod


