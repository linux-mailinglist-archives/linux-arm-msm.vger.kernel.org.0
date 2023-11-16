Return-Path: <linux-arm-msm+bounces-814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2167EE408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 16:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BE801F24587
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 15:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B126430CEA;
	Thu, 16 Nov 2023 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9h81Cn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDA7195
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:17:54 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a0907896so1314011e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700147873; x=1700752673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c86qO4XwJ1JxYo95YcC/cJ889pUl6EruyihJzXoM0Hw=;
        b=t9h81Cn6XW8J0eKo2E9Narw0Plr0+RWdXP7GgJllmWOTF4R1Bz+1n5Vh1Yi4mKPcbq
         iER3z0D3oV+FdZsDiGRbU2x48hKKx2q8nKBELfz6sJF9AdIK6awBEifJc5aD15zZ1893
         NA4TsrQwEiyVOecMh9tfJ4U6PUbQ0ss+0ZIX1l22fntv9p2b3BYq0/MO3p5Iz4JWCHWN
         Yq4c0RPc7JiJLiUi+OFXumoemCjg2C319hSAKjtXu7J5Nqa2S4+uRFwp2PJmDfLKhOeF
         0pGb+yu0LF/t/D0ZB5TTrcu1L4Cmb6X9NWcI4yj6XiU31niQihkZYEaRTkNM29RTjF4J
         gCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700147873; x=1700752673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c86qO4XwJ1JxYo95YcC/cJ889pUl6EruyihJzXoM0Hw=;
        b=a6XdsgN4pFian8bnOiMft/mdRJQ25Q++WZgdZ55dNEyLWYRi1ixkDMCQYruixMQPZb
         Ygv0FxDphSVaqJ0AYS2F3bfBvlSsGJ9kO5SvNQYR3qfVbOWtbmKKfukkXzD/DCUthlbi
         gKXSq4UH8U7GC0JHaAxid8C09g4m1RBPJo1ouaikmViNAAOwtUrswbl/dGctQh6r+5bs
         6cUHEO1TWsDLF5zyrtnlu8HCRa+KJg1Uryo718rW8p5E1xtRJerk21AnLKK4FUQa4vgP
         IKHT6dcw76C0+yTFDPQL56JDnAQNqG0Izr+AbjGYQms9d7rSC5Xks67V87TTs7quu7uz
         j3ow==
X-Gm-Message-State: AOJu0YzBJOnwNe5tV0M6f0mLNCE8G6Ww6sgKNpVQlfKBzeGDa4ewz/t9
	oE634WBKIh6UCTnuWKBcjHoPfg==
X-Google-Smtp-Source: AGHT+IGCynGKBV2xfjm3/F22zFoI2s5tPIReaIcXe1jrsp/JQdWKJTZfqSlwxIOf0g1DRrLOUyhTtA==
X-Received: by 2002:a05:6512:60d:b0:507:f0f2:57b1 with SMTP id b13-20020a056512060d00b00507f0f257b1mr10401985lfe.15.1700147873129;
        Thu, 16 Nov 2023 07:17:53 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y22-20020a199156000000b00507f1c8040fsm24856lfj.58.2023.11.16.07.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:17:52 -0800 (PST)
Message-ID: <8f13d5d7-a8fa-49ea-bd34-4bbe89261faf@linaro.org>
Date: Thu, 16 Nov 2023 16:17:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: sm8350: Fix remoteproc interrupt
 type
Content-Language: en-US
To: Nia Espera <nespera@igalia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, Rob <Me@orbit.sh>,
 Clayton Craft <clayton@igalia.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht
References: <20231111-nia-sm8350-for-upstream-v4-0-3a638b02eea5@igalia.com>
 <20231111-nia-sm8350-for-upstream-v4-4-3a638b02eea5@igalia.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231111-nia-sm8350-for-upstream-v4-4-3a638b02eea5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/11/23 23:07, Nia Espera wrote:
> In a similar vein to
> https://lore.kernel.org/lkml/20220530080842.37024-3-manivannan.sadhasivam@linaro.org/,
> the remote processors on sm8350 fail to initialize with the 'correct'
> (i.e., specified in downstream) IRQ type. Change this to EDGE_RISING.
> 
> Signed-off-by: Nia Espera <nespera@igalia.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

