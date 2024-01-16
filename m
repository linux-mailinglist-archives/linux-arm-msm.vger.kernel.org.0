Return-Path: <linux-arm-msm+bounces-7354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC682EF0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 13:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C57D2859F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 12:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3D51BC29;
	Tue, 16 Jan 2024 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ylBQ8WDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D81B59A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso9860945e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 04:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705408378; x=1706013178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYW1j8AmJ2yfjMj34Xd9/BLYIzs+LQRZDCyalHNkf+k=;
        b=ylBQ8WDaD/QNaaz01Vz/34fVmRQ5fq4Bm8JVl0hrtGQI6lC2pHNvEEu06fzm6nbgwy
         F7bejM2OjsHX4KQiE/LFt3kUmRBcO1neXV/Z9mkY5SgWV4H/knwdn/dGFcaeIhoM3RPg
         94pIIPFJtDdmWJ48caF0nw4YNdcpdxcBd8zNcaglg6uQ4+gTbwuKIxxwL04/TeAeLuTy
         bsG+pzeN6x4cO6mrR/1MzYK1KRNxthVsYF4w0nQXk9U4Z5ZwNfCfvVOQg0jhDqzHQLjk
         RawbGAvk9zXRF388OgK4S5JNoYWDPCyHE2H7jZ8mo2J5bGLR9ylyBw5LAJp93U64aeEb
         tFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408378; x=1706013178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYW1j8AmJ2yfjMj34Xd9/BLYIzs+LQRZDCyalHNkf+k=;
        b=Ge1YeMNyMGBfXPO2sc4iMHbVTfORQOj/kcX4+sTe5I2N3+Ei8KC6xY+i/pln+8CI62
         NY+B3ovJbLup8DSA3wp2ZpT1zZin91Yks4GLmJiATWwwIZPSt5oKuKEXs6X4jwyPOgzy
         SnMWIElxzQdQ93asAi2iszCnXYil4H8PzQgweFz9a/PcjkhpZVKCsSMe0KNOruYDjDtN
         g171LFhGC9RX6tayHVM2ZGiSvmNhFhqmP/pXv8pKyP+6WAAoGuvPYoXAqbZuIAV1SJbS
         RMhbKiLXkH5Nng5U88TObDW15+HU/AYha+MWkQmc4TIBJzC0Grk3jXA60UuSpY4/9rQg
         RxGA==
X-Gm-Message-State: AOJu0YzlN7bFWeE/u2xhci7g6+2Pq1f3VHqgQ2EkLwdhHGKn4geebVyJ
	B6ZC38tvy7OyQTyvXqDSv6pUarouc71+Ww==
X-Google-Smtp-Source: AGHT+IHBVsHDGtoAJWdj95FICj2NQkjN6XVsh2kjd01I3c0lrtANH6nBrffkl6x3xHFoYWGY0GkMrQ==
X-Received: by 2002:a05:6512:474:b0:50e:73e8:8d05 with SMTP id x20-20020a056512047400b0050e73e88d05mr4589168lfd.30.1705408378392;
        Tue, 16 Jan 2024 04:32:58 -0800 (PST)
Received: from [172.30.204.234] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f12-20020a05651232cc00b0050eca8735dfsm1752612lfg.140.2024.01.16.04.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:32:57 -0800 (PST)
Message-ID: <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
Date: Tue, 16 Jan 2024 13:32:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] usb: typec: qcom-pmic-typec: add support for
 PMI632 PMIC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/24 21:55, Dmitry Baryshkov wrote:
> The PMI632 PMIC support Type-C port handling, but lacks USB
> PowerDelivery support. The TCPM requires all callbacks to be provided
> by the implementation. Implement a special, 'stub' Qcom PD PHY
> implementation to enable the PMI632 support.
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Still not a fan of stubby stubs :/

Konrad

