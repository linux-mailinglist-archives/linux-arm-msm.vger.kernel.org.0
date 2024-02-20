Return-Path: <linux-arm-msm+bounces-11925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF785C89E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C65D11F213E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 21:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1124151CE8;
	Tue, 20 Feb 2024 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n22EjbEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187AB151CD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708464230; cv=none; b=qZtg/a4Cd6ErAoeemCc3AicSnmPTweGpoi9AqzXQxNVa2I5uW52t/kvQlB/1UJq6W2EBADbgZSIhKlBrFg4ImmSg7RfNK/ri5NF8mA+ZqcxCTuQyo5Nr1aFbXn+PZ9JRDUZnw2cVWyB8Q8Q/GbHmH4j3BnlALYuqcuWS+Z8fwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708464230; c=relaxed/simple;
	bh=rI8vpSht0L7BzqoOkCoHJkGo2xBc6I6x6gxOL3k6wgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYwoW1TVDspYQBlQJ1j1EPkbQpfZ5Ni1sd1gtfQWfjFpX7yc+Kil4Xlss5OBhwFyU3Ko078LHpb1wNnvvkyI27c1BoSb2C05jQJJVKwm9SmL3qOMGH21cVoLtM25Vfc8hgXBm1Cxs5VJYupaHhiVQN4qpJVirXpiKQqtxHDr0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n22EjbEK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51197ca63f5so6435585e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 13:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708464227; x=1709069027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQN1gJBuYdnaMz2lZP1Vhemjh7XxE9ird9ZL5Hi+qmE=;
        b=n22EjbEKamPeEGz1Pcflg43NBAolA9jtaRWB3mt2vTH8yKyCWZ55WPT6bX91NAQMxI
         VEVlj8lwGKbuyQ3CRYNopd1mvlFTtwe9bgKKwfLcUb4bCl00cudvhOaglggODIHsCmU+
         zg5n6tLdwBwZZ/53gE6iSBRtITJkkeqyC/3roof4fKGQIDr4N5T3wD8Bbu+lkbo0mWVn
         +pnYeiaNr/EMb2qoG8xXcEZdMDJ0Pcih/Ip+ckqt9i8LcxiJlwBu03JPYxHINE4OJwf9
         h/sMT40Lla1zd+SY6KijEY1stvQhfaOz2z9CW6jVVdEitB3on/nV/J7m8yrnEfZCuLEu
         VdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708464227; x=1709069027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQN1gJBuYdnaMz2lZP1Vhemjh7XxE9ird9ZL5Hi+qmE=;
        b=U8pi0u+QtXKKFKetBidqmtcqn9IwdNUnYEkVB5FMLucKteDc6RyIWWgRYO3p4usGck
         +fL3i5TqJ8zHVABTbi0NbRzh7GYKfq92zvCAT3+YJAtwzIw6dGh7sNlD2ZSehj3fwIzu
         VIn+Lz1V6gwHCK0QthRklmqeNeUukCLTjlFPCm6TvOx3iFREXR/ElS7yfNweJEuprhCF
         UmtuJJpsVhNBw7/heyAhD7WXI8ob16GnAe+FV7VcCxEu2+MP/N2Dp5ZJAA/MgXoJywzs
         Y5L8wXYQ4ACpl0ePUrQhejgAUKMWe2XOzL0RPeLb0XpGVixYKDvFwvUVge4R114kH6K9
         39kw==
X-Forwarded-Encrypted: i=1; AJvYcCWNxl3HoURcd1JtnyXyt6t6Zu4WPKQK4uzx6aDWad/e0PR9VSx0ztIIo2FV6C8D8Ha1f5++RlWkDcWlrvWhXopjXR99KHjPFvukoxuGQg==
X-Gm-Message-State: AOJu0YwSN6xQeG4bKDjOjtd9FcYhSSph1blt+c6URF1j7N/SZhnVNyNd
	na7UtRiU86UiVCYqdlrj9tbHkfv4WYJwkZpiDMwp04tlrX/CKNvcrBeXn3WXmzI=
X-Google-Smtp-Source: AGHT+IGUGRVWsh1lOrSwTwSBnK+MNgr79zGnGLrlETgeDUz79QjMadUApjmPNi/qsoaLXat8TR3+ew==
X-Received: by 2002:a19:e003:0:b0:512:bf99:7d80 with SMTP id x3-20020a19e003000000b00512bf997d80mr2723866lfg.1.1708464227159;
        Tue, 20 Feb 2024 13:23:47 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id i29-20020ac25b5d000000b005118a6de76esm1407778lfp.162.2024.02.20.13.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 13:23:46 -0800 (PST)
Message-ID: <c87d715a-d6fe-4ccd-adc5-d98d4837a120@linaro.org>
Date: Tue, 20 Feb 2024 22:23:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: fix USB PHY configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 18:31, Dmitry Baryshkov wrote:
> The patch adding Type-C support for sm6115 was misapplied. All the
> orientation switch configuration ended up at the UFS PHY node instead of
> the USB PHY node. Move the data bits to the correct place.
> 
> Fixes: a06a2f12f9e2 ("arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

So that's why UFS stopped working and I couldn't for the life of
me guess why..


Konrad

