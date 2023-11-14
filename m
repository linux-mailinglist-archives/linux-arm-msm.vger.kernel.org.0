Return-Path: <linux-arm-msm+bounces-609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7987EAB07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 08:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC597B20A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 07:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357C111CBA;
	Tue, 14 Nov 2023 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIad7yUp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A211C8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 07:46:10 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A8619E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 23:46:09 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dafe04717baso1145468276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 23:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699947968; x=1700552768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Mf/xSVIgKoT0Vi/mPJIhzX8ynp76JIll23s2BTYNB0=;
        b=SIad7yUpflxqxpf83VQxSTGPk6Hu6MHX7tRlzqDY8r5wi5TCkmHGEbcnyJzQe7gC7b
         nXWhTJqakofxpcmoIrb6Ufv3YXiR8ArW0XLlYqM8dNCLhQSe4cPA+vYzStxIKufwa69g
         WxGrhUfrxC3L+QG5wT/PIz98EzjcQPITctyvLjLoT7Sa6unQSYn0qhzD9yApsXcQpaVK
         v53JfciT7NANZI25ca/zgsKEzixER5WxKHlz7pRSfLqF/KDFOkbS4/CbK1pqhmkH5gjm
         90aPP1thv40jp0UbighGZBN7bVbNmlvcAjn+aR2tLi53uFTv2rU5Ew27FvbI8YmFASdY
         5GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699947968; x=1700552768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Mf/xSVIgKoT0Vi/mPJIhzX8ynp76JIll23s2BTYNB0=;
        b=VkZj/JHSEwLQBbqT7WDR/s+kZAgNCiTViPOfTaxUjxyaor5hJHjj2yfXvwdz/AJ+Jr
         0O0sStV8mnEQiERIF40fWnG+UMeaduOZ3FyuseQFpovALyFjopcbI4FunOeaxmhfR+z6
         GU5HJQ9DDCp7ta2sWCUE0yGmOG/A8K8Q5CEGyI3bgywCw8/zEQuf+4rUjF09lZguXyNF
         XidNAmq+WMbZnwSBgXHBt2nlsb+eLhKcNb0PXXw/hqkrlDTtpKzcHgpX1RPPL4U52kc1
         Xn2An0rt0F2LGAWk8ea87cTTecRJZurYU3GoHweKZmY1Qm33xwg5m9wg9g72CP3hw2BF
         un+Q==
X-Gm-Message-State: AOJu0YxUYutU4Wa9wZ+Li7A+Gdb7p3J7YAcW4xMBYb3LI+Brb0Qzw3eR
	ZEvKS/4JKwaZf7fYwlM4Omc9q7G/euqolsuNxva08dB/ukAhBaGC
X-Google-Smtp-Source: AGHT+IEEljFNVD7ewl/FBBs2hBHC84IGp7EQ3DuxYiXEeUuO4jUVXspB8EmOY9HvHArQbejHw+3p2Th6A9pBuhwJJl4=
X-Received: by 2002:a25:32cf:0:b0:da3:76d3:e4fb with SMTP id
 y198-20020a2532cf000000b00da376d3e4fbmr6843475yby.26.1699947968695; Mon, 13
 Nov 2023 23:46:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org> <20231013145935.220945-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231013145935.220945-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 08:45:56 +0100
Message-ID: <CACRpkdb14A5z2nhe18VupwPdDvuOXxM68nTrU-drO9nRNhWmzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: allow slew rate bit in
 main pin config register
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 4:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Existing Qualcomm SoCs have the LPASS pin controller slew rate control
> in separate register, however this will change with upcoming Qualcomm
> SoCs.  The slew rate will be part of the main register for pin
> configuration, thus second device IO address space is not needed.
>
> Prepare for supporting new SoCs by adding flag customizing the driver
> behavior for slew rate.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patches applied.

Yours,
Linus Walleij

