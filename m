Return-Path: <linux-arm-msm+bounces-54008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FDA85C52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE284A0EE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E51298CC8;
	Fri, 11 Apr 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJiVmiJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBAB298CBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372565; cv=none; b=kwYatja8GPYTAlc8Ie+QvPiurFagFTrl7WNhjgG/HSI2v4ppyoBEh11qpgPso0l2ESWGx9ZhnQlhkyxm6M2qnhIIHvCrkCfeq92ceSavVL3e+h+251QDLOfQz3HUehYrgV9MGfOEDGSzv/bWn1TdT+B65GJeeFjyW8zli1l9sPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372565; c=relaxed/simple;
	bh=Cu54TXjKIVZN6OAhdDN2EqzH3UTCuwiaR97H+gM+NIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK2dA4mM40tyhIv4h9WV1IQXksRPHXhkTNRO3jW7pB6pL3qDdn7naCPvsr/G6ELuMDj3rri3KO3v0ppTcnB8dt4ouI2qZ9y6+Jk5iWYQYhLSDvmFY+ww21FLbqGykkWSaUyi+WXsnEz08wr7VT/PoWtGN6zNq5xqTwDWMapOgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJiVmiJ0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so16986545e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744372561; x=1744977361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pN3Z/ARVuoJpkU2wn9E4JVR2ARLig7yuShvQyV5vTWo=;
        b=kJiVmiJ0o5xL5LjcyqlwexgNPuYrSenk13Gj7X6weR9HUD+I2xBcw8I5ZepAE+Zo4s
         u6XdTBw+rr3+WlggBw8cq9/nmG/TwmxedAe3G7YEEegPAfAErQtWQW21tOAFI7WJS3tn
         FH9N8md1StgMJCilG+ySiZLZCTq6uFBsfVsJVkYN6d8shUT3mhdjflfFpcgV+9W/J314
         Z8M70xXxQ0dNEqJKEBg9xfR3AuZkP7IZiplwBctVPYtAzLGqrukxOWG9xE4lhSMGfUqt
         2SWSnpKPgVu06APhJ1uMxL8IOeFXfVLuEZ7mB3aJvqvelWgcTwuTIC9dfuF4eSPTYFo9
         XnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372561; x=1744977361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3Z/ARVuoJpkU2wn9E4JVR2ARLig7yuShvQyV5vTWo=;
        b=F9zwCV/TBdLVAEmxBFKs924CmoDCI/cooeuIjt2flDXNunHWC1cmdakkdyonfXFs0d
         emDBnGeqUHaSYfHq1pCOFcv5hQw0GS4Cn1mANSaVvaXBGGuIhwe5dS/PMSQjQNWg/OF6
         odN+IiTvLEWwu/9D60wcNODR4TqL2946pesp6UBpmC6qNEDVZumvoSBq7FGn1h9YOq+9
         kPg7qUN/WYPfdoGgBo1/X6kw5o8viljIQKOv9VeP4lni4shTgyMv4uwojn2B63/NXc/1
         cGBrQry6JkU+DLisZqXzKfl7HxetGLk3/rtB+26G479qKESS3nx7st0L0vyPBe4XmQU2
         06OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXridX2PKWEKF+pbC5EQiZt9qTT36u7vIPDpQpeGTEo1O2O6oStMTMwgTmncavGEYozObi3pW0chdaRLJDu@vger.kernel.org
X-Gm-Message-State: AOJu0YxVFZ5PejC48U4W/QVeC01LESCeQns1gakah18gVKLvPCOm7ra8
	OB9hcMsbIG8jOHWcX6VY/NRWTX5RMgSd0UFpkzmNG51CtzEG5Zln58lPyfe/1ck=
X-Gm-Gg: ASbGnctQTouJQcs+oGuigrTxhjPDJ2Qer3jzyEMrGFgO4V7in/ac4C3rX+0ELWz4hRu
	k3iylFUVYkqlKY62Y/maqxrXCHAAq/MCr42l32CbAmvZ1CKlf/7bCG08vXO9Kvr6oB6zg9vF9Mk
	6cajr7KGw5K31/+kUJ+YB6eUigDgVnPHVgOWTB0JpWhIAIxZFaImEvB2bpEUEmlitoNRbWAftEx
	iAQCVSSLaI40KCbYFtc1Qtwk6T8nm1cT6RB3ywEhtkdwxRjPhmAH064Q9s+fo/6F9H+rY9hOPiT
	IrGsmg+cvBS+RdDPgVvidKKMYCJh+/l5pihp290sFdriYBRyDEuzuCcZZ+FsZyhsMgJyxq7jtUk
	lD9iVuA==
X-Google-Smtp-Source: AGHT+IGVwOsUyWKd/jj6a1Um5rgiAl9+zquoh9lJ8O3dxy1geRt6jJtBs9BvSvmSdZVORllOzBbeqg==
X-Received: by 2002:a05:600c:3c91:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43f3a9a68a1mr17951445e9.22.1744372561107;
        Fri, 11 Apr 2025 04:56:01 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d109sm85985325e9.20.2025.04.11.04.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:56:00 -0700 (PDT)
Message-ID: <fa6ab24d-80ea-42f0-b764-b8596e6b724d@linaro.org>
Date: Fri, 11 Apr 2025 12:55:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <sSGjuqPKGTjE9al-J0RHMuA3Rk7hIh9x9RMWNefg93pJOOacQodM38LE11xl4vmO1I0OgSZFYR2sblISUxkPeg==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 17:29, Neil Armstrong wrote:
> Re-organize the platform support core into a gen1 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the curent drm/msm dpu1 catalog
> entries.
> 
> Add support for the IRIS accelerator for the SM8650
> platform, which uses the iris33 hardware.
> 
> The vpu33 requires a different reset & poweroff sequence
> in order to properly get out of runtime suspend.
> 
> Follow-up of [1]:
> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Reorganized into catalog, rebased sm8650 support on top
> - Link to v4: https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org
> 
> Changes in v4:
> - collected tags
> - un-split power_off in vpu3x
> - removed useless function defines
> - added back vpu3x disappeared rename commit
> - Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org
> 
> Changes in v3:
> - Collected review tags
> - Removed bulky reset_controller ops
> - Removed iris_vpu_power_off_controller split
> - Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
> 
> Changes in v2:
> - Collected bindings review
> - Reworked rest handling by adding a secondary optional table to be used by controller poweroff
> - Reworked power_off_controller to be reused and extended by vpu33 support
> - Removed useless and unneeded vpu33 init
> - Moved vpu33 into vpu3x files to reuse code from vpu3
> - Moved sm8650 data table into sm8550
> - Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
> 
> ---
> Neil Armstrong (8):
>        media: qcom: iris: move sm8250 to gen1 catalog
>        media: qcom: iris: move sm8550 to gen2 catalog
>        dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
>        media: platform: qcom/iris: add power_off_controller to vpu_ops
>        media: platform: qcom/iris: introduce optional controller_rst_tbl
>        media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>        media: platform: qcom/iris: add support for vpu33
>        media: platform: qcom/iris: add sm8650 support
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>   drivers/media/platform/qcom/iris/Makefile          |   6 +-
>   .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
>   ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
>   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
>   .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
>   .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
>   drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>   drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>   15 files changed, 598 insertions(+), 300 deletions(-)
> ---
> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
> change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 
> 

Please fixup this

0007-media-platform-qcom-iris-add-support-for-vpu33.patch has no obvious 
style problems and is ready for submission.
0007-media-platform-qcom-iris-add-support-for-vpu33.patch:7: slighly ==> 
slightly

also accounting for my comments in patches #1 and #2 you can add for the 
series

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

