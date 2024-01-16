Return-Path: <linux-arm-msm+bounces-7346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2382EE93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 12:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D105B22C62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 11:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954C81B955;
	Tue, 16 Jan 2024 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vk0PhE8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509E1B957
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd84600920so66819141fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 03:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705406353; x=1706011153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjoS+jEPIwKkJhEpZr3ojbVQp7LSl4o83U4xS7GmZh0=;
        b=vk0PhE8LRH/zKVKx5PQ4KRveSA4VOqyHII9Bodwim3AhCcQvgt/a6U1BZ98oejlR1d
         SeaRuhcouShwYP/+5ZXV2uhAVw0OmeraiKZYMVLmqyP/ssY2pQoaD2izEt/lSBjdKNR3
         MKuQ0NcJ4Pe4owJP/AgzYhPfr4duZTIPZ2dgOt2ba8MeuouZlbwZxB9JSiyrCvD7aa0E
         095kOT/z3mfB8njZtrA/zYpf+Aqs/weZdmUbU+W8HBUkNf7OgLCxAQpVwR6MXmOvL0N5
         JhjFGulHU+XT+/kav3139+XIrVXBVPqwqr60roVd4dbDuXyj+DamxnH+hQMMGCb5lGoe
         Khng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705406353; x=1706011153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjoS+jEPIwKkJhEpZr3ojbVQp7LSl4o83U4xS7GmZh0=;
        b=FZo5l3YmXTalX65TOKkUhrRQX6ZYzouskqOnwNt4Hd24Gl5Wlnpe8+5MgA07+hQkJl
         mCqUddXAoY6v/yK6yaKD6clPk67IPqEyaB2g1YvM/4Zb9Y+d9/jeNxNcMxcY4SdDKDf6
         +thmBqVQ0qd1yu+hvpqnBu2z710xNWHMq3P6yvOqvMWIBYp0H7S1zxWcx5RvXVjH6BVx
         wUrVxQqb4SDQiB6IDw/kuziinSTsFeV3hoK9LDK1n0pdsUtA8IrTqithyQrfCHgthugx
         cQVfhBAYO+c+lAXs/sO7yOevnd0yqEq5RzH6jSsF37uA9+xsjCL6+MQfjJaS3//FOccl
         3p/Q==
X-Gm-Message-State: AOJu0Yz8ZNvm0kQKrmAXPxRaAdPpQZBzuS7vWX65N581xCKTG2IP9NoO
	JJaForvt7D2ufk7+MnR5up9tKbvaYa1bow==
X-Google-Smtp-Source: AGHT+IEd84FtFwC1Jk5X6Lp3Z7fYVFQ+KCbh9VJGDlRMwoWNGqxysvDmhMPiNPL4KWnty5c2sZjMEA==
X-Received: by 2002:a19:641c:0:b0:50e:6ac4:f1e3 with SMTP id y28-20020a19641c000000b0050e6ac4f1e3mr3121487lfb.114.1705406353043;
        Tue, 16 Jan 2024 03:59:13 -0800 (PST)
Received: from [172.30.204.234] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f3-20020a056512092300b0050e7a2be0f8sm1724362lft.191.2024.01.16.03.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 03:59:12 -0800 (PST)
Message-ID: <b2fbb8e2-e4aa-44f5-9c57-7bcb8adcfa8e@linaro.org>
Date: Tue, 16 Jan 2024 12:59:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] phy: qcom: qmp-usbc: handle CLAMP register in a
 correct way
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
 <20240116-usbc-phy-vls-clamp-v1-3-73b2da7691c5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-3-73b2da7691c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/24 02:08, Dmitry Baryshkov wrote:
> The QMP USB PHYs on msm8998, qcm2290 and some other platforms don't have
> the PCS_MISC_CLAMP_ENABLE register. Instead they need to toggle the
> register in the TCSR space. Make the new phy-qcom-qmp-usbc driver
> correctly handle the clamp register.
> 
> Fixes: a51969fafc82 ("phy: qcom-qmp: Add QMP V3 USB3 PHY support for msm8998")
> Fixes: 8abe5e778b2c ("phy: qcom-qmp: Add QCM2290 USB3 PHY support")
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +
> +	/*  for backwards compatibility ignore if there is no property */

Double space

Looks good otherwise, I think!

Konrad

