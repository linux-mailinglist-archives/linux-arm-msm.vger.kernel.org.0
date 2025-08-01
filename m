Return-Path: <linux-arm-msm+bounces-67329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0696B17F50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A75B67B1A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94592264D4;
	Fri,  1 Aug 2025 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhIG7ViP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC442253EC
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040649; cv=none; b=eZ44fam0W57NgiAmeD1IqFErHYQMU7g/L9B0VXGH05y2vcwAJ3I0k69jSuNPuj8gfzFh05geAbzqQN99VI6jgy/50jW9sAH9W1qZJGGhfg/VYCDL5FTJmCTeTf83xpWXeoljLY5ZaV8cUoFvO9F7/eoIAVpzVH1guoJquXOJ4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040649; c=relaxed/simple;
	bh=kfic+uLDROpAOeszY5apQpKFu2TLHnt0S6dZt2k5jSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm7jT/0343d3nrO7Lls2s+hidpdGRJxNmbtol7biI6kOU3rG6LYg7+Icu1wdm+O7/1HsFutUn5blQ7PPM47pTnpybhv3XwUDdpTCpbYAuhbDPvbBIagHkuoIZqRBMGz3MnqFy+TI//kmqM/l8mWElmZDtucy5jZ0qgIcpamysQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhIG7ViP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561ca74829so7172175e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754040646; x=1754645446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2mFNWcV7woJMSvTpn6utw5/t2ceVV02tn5+m4prOqA=;
        b=nhIG7ViPMMHYfYONAu7LZwUW3XykX8NysiT+JluHRC55gFZn761mn8ghazV74bxtyG
         IAHbZGbzpw6O5Dj3VtplsExdWAV3+ht+lqq2jskW3W5VUD7tkshWr6/33XZ2sXM+sL3m
         FcRYDVEWCnMvNH5R+0KddDn/Ob2NV9iVWEBYhBLfuk9/yPABQJ+naHcLYHVp26MzTlw6
         1k6B4G+qwGHxdRouuVrpvFJPlI8E8MKyDmxt/wv6QW40qstEJk+xlSprnhvpCnIzE7bj
         CLf3SdCk8ZmF17QBETSlpwFYqagr46ef3Rd/u8AXqi6RDy1coPgWinNVdFApRPtcbm8k
         eU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040646; x=1754645446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2mFNWcV7woJMSvTpn6utw5/t2ceVV02tn5+m4prOqA=;
        b=vCXz0V/hw9eg8FJ5/gWARFjKSmsqAGLNXBbkaunARNPk8h+vjsJOcUH6lp82R+Nm4z
         kaUHSsJUGl2GbgKImbYzpiUNJ0v0PvvLFLuFdurXpgNT5S8fHYHna5EadLcCYGuqkL4f
         8UdxUYEnoMY/x/1TbLh2X8UCIhmpUgmWB4m3wahldDhvld7/tBdlLkAPf/OW9tQ53UO1
         LCzihSU70YFdGWTAp4oWJZTD+EUBe3fqOIywKGVolhTSUpXe0uPi9VC4qvLJooKvZgmr
         DHT1JtW429x4TvsY9mjVBBkjRr9fOeYy/QO3ndX8CG3I2ta4pPtbPgIGskFd1MMut9tT
         1bjg==
X-Forwarded-Encrypted: i=1; AJvYcCWYzzFdltGx71o/bXwvg4Pes4gCq/XJ3fKcllI61KTiMURkY/MWLyIRmjxbqlxU3/AxpKLzZydqqUFjQUNn@vger.kernel.org
X-Gm-Message-State: AOJu0YzpxB3BBrMbPbly0HVtqMNjRlcttQKKuCxm1njrXAwu9s9WnYhw
	SoorvUpW99qrBu4p9vGHlzmUGU9XxNBw8+S1RLUSByV5TDvXmgSLDw609qJ2sOTAZ/g=
X-Gm-Gg: ASbGncvR0AEWPZwKboPPQ0I930azMZTVi15TrmQI8+6aqaNFLzY8dUkkxyjDvLPfnpI
	D0gRSSaihmkd8F6tEvfH7rQ3oqLufzuITxJ1bvZfY7HQbh4Tfu33QP7okOsC275AzF1bdml+cDz
	8k426LC+tLad/nQpt5rXyOQk6XWCfsHfiDG46yOP1sfK2a6A9SJWcOXGyG6Ia1o/z75GuFo4p1M
	rR36zDQoChsbFSUYnj4/0UA84o5KV0/YxX6fYDcgpWTD8ffSw3i4WRG1bThNKODK7IRaYIm4+FI
	Cq32ixr8oyQCMGFZE01ihSWOFf5cKywmw4LoQybaiOFpAjwzbLnOVIgwEgIoFQe+6q+XdUPNA43
	ju4Um6tr9k66Iwu24Nqf906c5aF4wY7iCM/AJC5mOJ94ajVSsqUxjtvEeoxyGqg==
X-Google-Smtp-Source: AGHT+IHCYZQ7LJ7cYHoVpSEsRcjkIRr0e2up/j89C6HrCxyO6Tidr6iZZH2RM3WjZrbfp3fSA5veNQ==
X-Received: by 2002:a05:600c:c177:b0:456:cdf:1ecd with SMTP id 5b1f17b1804b1-45892bde5abmr104195385e9.31.1754040646427;
        Fri, 01 Aug 2025 02:30:46 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458953f887asm98477105e9.29.2025.08.01.02.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 02:30:45 -0700 (PDT)
Message-ID: <8bd9a924-3fc3-4f4a-8096-458e771f94a4@linaro.org>
Date: Fri, 1 Aug 2025 11:30:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
 rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250624064945.764245-1-quic_gkohli@quicinc.com>
 <20250624064945.764245-2-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250624064945.764245-2-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/06/2025 08:49, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS615 platform.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 0e653bbe9884..c8cc67b65f73 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -53,6 +53,7 @@ properties:
>                 - qcom,msm8996-tsens
>                 - qcom,msm8998-tsens
>                 - qcom,qcm2290-tsens
> +              - qcom,qcs615-tsens
>                 - qcom,sa8255p-tsens
>                 - qcom,sa8775p-tsens
>                 - qcom,sar2130p-tsens

Applied patch 1/2

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

