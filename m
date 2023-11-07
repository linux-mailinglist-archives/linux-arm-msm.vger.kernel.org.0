Return-Path: <linux-arm-msm+bounces-62-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 053117E3AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4162280F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A30A2D052;
	Tue,  7 Nov 2023 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4NFr1pQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940792D058
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 11:17:50 +0000 (UTC)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427D6114
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 03:17:49 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-da30fd994fdso5702650276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 03:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699355868; x=1699960668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ydvL0o1CmH6mf7K0w8mZfuazbRVH1fDLTN8b3rtk8E=;
        b=Y4NFr1pQzI472JRjuHXlAOdN9HNgaQgS+zfZzjTXYwZ4GY/eO3qC6xKvgAX0sWpLtc
         3tm9tEwGPve62PHyDZO5g7rZYjeO/NZSSnPKq/J8jC5sc7d4NjxPVZT/bbcgVvmCn3Am
         dtS99s4YMg/VQSkwOsCjrq+jGI6gnG9ic3lmZBfkB70j06GvMMHuLWdS/qZd6tXY2TAk
         eJc9ibmW3NB9uh0/GcVKIiYtnTFsfXMt/0HrbyS7DWjXLbDaVALH0FunARo/5CvdaElQ
         dVTt8quPIpsyc3WNfgFaXYK9bVnOS95UEB4RJbhsDfr0II7wEjVo1atN6As9C6tsb3G6
         yhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355868; x=1699960668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ydvL0o1CmH6mf7K0w8mZfuazbRVH1fDLTN8b3rtk8E=;
        b=VZLYIqBeSvoqri07iXTBZknjcLT8UuDtgiy8AaJ+dBUkyWiCo35MtnvUaf/kh/OqWv
         yxEZfmjYyBhzySZVkBQf6Tt5K4W+0EOlGg5lVGOdvLqfDoYvf/nHYwOndecolOkOesV+
         mgXkG6Ge2nA1O+4VA4e0K5MBXC+ECgAySxBc/ayMQcGmq7xRJMFjOqb+WKfqL5EBcTVE
         bMKZAHuKxC1I5EnIK5oOizVpMrgdGZRcILDvaz1Gj23Wj7uGx5qQVsersOubxXiVE1ej
         wgnLTYfAU8/2AWb/rCujR6dYwCxkNhjRIx4//rQ2cpLQXq1UhMlIMMFdOUJaWv6+0qyf
         HTtQ==
X-Gm-Message-State: AOJu0YziwMZJwY0ekIOADzqwYvP0fqMyUNovs8XrAtjQW3bP8flWk+sh
	rGVP/PWvdTvWhMc3XbHvWsJJVdN26ixmfFIwinHlKg==
X-Google-Smtp-Source: AGHT+IG1vN6zYMpeJ5WEK+n+SDm+pr9crueNXcCRYtyecm2T33jO7z1XTVsAQX2OJcNh1gijTFjzuM1eyJHUCvFnsyc=
X-Received: by 2002:a25:d457:0:b0:da0:ce42:e609 with SMTP id
 m84-20020a25d457000000b00da0ce42e609mr1754971ybf.8.1699355868469; Tue, 07 Nov
 2023 03:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 13:17:37 +0200
Message-ID: <CAA8EJpo4GXTLtEY2AgD8y+33dHtENGTcTr_ma88wfdhRzFF-ig@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc8180x-primus: drop
 sound-dai-cells from eDisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 12:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Qualcomm MDSS Embedded DisplayPort bindings do not allow
> sound-dai-cells:
>
>   sc8180x-primus.dtb: displayport-controller@ae9a000: #sound-dai-cells: False schema does not allow [[0]]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

