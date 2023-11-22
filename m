Return-Path: <linux-arm-msm+bounces-1529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071B7F4BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 16:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B74391C20938
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 15:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4041356B7C;
	Wed, 22 Nov 2023 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOrWO93o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248CAD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 07:55:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507c5249d55so10151241e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700668526; x=1701273326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuUSCKitbZ3SGvzXZg/oUjqEJ+iFFMtGQawxrjsdu7o=;
        b=mOrWO93okSlWgGBufvDV4HfEG1Wmpyodus1zA0TSmWII4ehJUOLBhKxoC8wAaBCVZq
         X+qwGkubMkM5SpmXEeRBk563nDfHuKWYxhG2haPDbGCyzB1mctQwxXn2qONNty7bM2xW
         6nS7bQCFOxq21w7zup02YBt+bskBY1V2METz6fAHFJqaRLKlyYBVXBD1faEH5MPydOJx
         9lhSUmlqXlqRcazrt+UYYF1Eg2GIhl+bnV0C06O1wjdM1NijRP/ShCzzcR8kKn36WYjw
         Fvu9jQRbEL591BNF/fLb1vrOIMZQ4cpqogEwL2tfBVEJK6O9aHjNPfaCJ/61YgKqjqxB
         uH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700668526; x=1701273326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuUSCKitbZ3SGvzXZg/oUjqEJ+iFFMtGQawxrjsdu7o=;
        b=Eg++3KOmrXRXzMpjEgrDBVCTy+j0J8grmwnCm9FvAj5MdBo5ZkFe0H9WR87ZBunXSP
         K+xe22rqGmBgSCoNoD/4EkPuv2AEhh3jfRrBc8W7pMIPu1R+k+9ITDdYzXJSNbvsb7km
         T3Bt0DYJtVsxQAGY+PbjlDuwfiYmEziMmz3iqpbscohPgQzwbehDQ4erFteaZYYs7gVs
         KN6l+h9uxOMmEOzs4SnqvCVZyUu/L5YdXuKomhvw/pamAnxIu5To3Cdd+jF15qq/6JCQ
         DE48vFyu4XsEp2cXt2lBWzcGMZh1rSonWWN5eu3oo9UGIC7GBPRpOIHc2NaLY4UDZYql
         PcVg==
X-Gm-Message-State: AOJu0Yz/5u696qlTPu+IQRFGcY7q2MVdB/R0dV79JiNtqA9uUQPJgpyR
	2xcng2m47FYyWOPkbTuqarlsAQ==
X-Google-Smtp-Source: AGHT+IFqAGojedce1elFd2BPwcWFUIy9NXz5jsXKRY6OKpwaxzJFqHBgoXDG5A2VKxkV81eYQDCVIA==
X-Received: by 2002:a05:6512:3e02:b0:502:9bb6:3aba with SMTP id i2-20020a0565123e0200b005029bb63abamr742848lfv.14.1700668526169;
        Wed, 22 Nov 2023 07:55:26 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s7-20020a19ad47000000b0050aa9df16fbsm1323460lfd.179.2023.11.22.07.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 07:55:25 -0800 (PST)
Message-ID: <029d9924-0f02-40ac-856c-04547c2cb678@linaro.org>
Date: Wed, 22 Nov 2023 16:55:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add TCSR clock driver for x1e80100
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122-x1e80100-clk-tcsrcc-v1-0-43078c6d6452@linaro.org>
 <20231122-x1e80100-clk-tcsrcc-v1-2-43078c6d6452@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231122-x1e80100-clk-tcsrcc-v1-2-43078c6d6452@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/22/23 14:42, Abel Vesa wrote:
> The TCSR clock controller found on X1E80100 provides refclks
> for PCIE, USB and UFS. Add clock driver for it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
[...]


> +static int tcsr_cc_x1e80100_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &tcsr_cc_x1e80100_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(pdev, &tcsr_cc_x1e80100_desc, regmap);
> +}
qcom_cc_probe

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

