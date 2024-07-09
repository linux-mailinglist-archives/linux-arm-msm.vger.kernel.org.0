Return-Path: <linux-arm-msm+bounces-25700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84A92BEA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B9D1B26660
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2DB19D099;
	Tue,  9 Jul 2024 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TRwfLKXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4F19D089
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720539746; cv=none; b=I7e8xQU/htK8IvY6o8ANmUOkNrsf5k256H0jiqM+ujXbgP9lzbxocNv9DSR7l/PnPKaVCuzmTrJ7kKiYxLA3Zi01cUBLllKrrUNM9Hd1J8WhTXOS4FjTSv8y5VI2nWaQOxzdKv4UingJOKSChRzKdbyoX7j2OqVqsDhYOe4QpX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720539746; c=relaxed/simple;
	bh=IDnYi5w2LkIAtpFV1WzjyImHgQ9ZfZokiHY6+eIhub8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofqHBVT4EBYZGhv052+omNyIukgVnUJkgGdOCuCp+sJP5GkJvWjwugEuO24JLBBgWIB7peaIALmbSisz/hzjCXRUU06lG+TzwLDvAEMJUpY49gYx18JtiXe8e2sVs9gx0zje2kELXO32M3xpkpDAG/KBvH4yiCJJ7MfL1+JmM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TRwfLKXE; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b29539d87so46753827b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720539744; x=1721144544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X9g3Ubfmw+SgcZ7Yd9+hBldZBcIN14Yh7a3NFHtWpvs=;
        b=TRwfLKXEL5VsoP2+wvhJXYKLx0+GP0bscFNxmDzFMtHqVyXMpRxe4+ETLBts5pxdZp
         RQxhweRlezpmT65My52hb2NawsIlTA5wrTv0d2MnKkXLVGSLODYd4OzhqyfAKp6b5aDv
         wD9DCsIeS0gxlAWSBzp6GOCXbgxUTvCIrqq+QSRKytbqXmdGsNv8EBQRWZBGQloS2NAr
         TItvKu8dMe8W3I2KAQ9p2IZ+9vgiF3aSVk/TvdZqvon24zz76zETQqr/Uc98s+XX/R44
         bwQ1DQeEKIQ1E1z3jPRqD+hYjOfsm7W9olxBZ6hnLIK2wsBisqYQgOgb7fKVpH303C0k
         rkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539744; x=1721144544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9g3Ubfmw+SgcZ7Yd9+hBldZBcIN14Yh7a3NFHtWpvs=;
        b=tyQKymGwla6bpqHTizks3/HA4apNBa2USUOIUINwQlYvuyv4tFr7aKnezTJqaUtDAC
         aktC65hhKOzbGkzFkr3xUSZxlLnCocH8Ni/0A5G5NZA7nByN+MSRIxg4LUUZgy/g149E
         L4yeUO3byKL1uLwaoWzUZE0p3ZAkfPTveUhmuHP6UeE4C1/MLosViyLYndla5EHHffNF
         SIdu6W1Or2X4Aq+sQzVkSDptW+AB0VjGOShDaUKRrvbQ4KLlrYejWkCAoG8Svm9Akj14
         Kwg4kQIj5gffnMawrqNtND2FHQQR6eMjZd0wQPjTBmVEGXJzdOYaeIK5Fg70HX1Of8V2
         rjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqEQHAaf7T3A62XDAIxj9IGfsuov6kzRd+QGfCjyVaJ9gAAWn5K9Be9w3F6pMUJbNvUkbtZa10qbRQtFAHNFp9+65GDGTU+92vmvbRLQ==
X-Gm-Message-State: AOJu0Yw2Hk4UEMyTY6DLKv5H5gSKXF+dGSK1cip6EhBimsT94cz3UbF6
	BTg4fS7j0T4JTy9PVNqLbI+Oy8giM4k5vYNiHRwrANZT0DMeGEF/sVSa0JGieZ5Es41t064zVpl
	knVEP8CHtNKJd0xeN701Q3uSo/GaDGgoogXHm3w==
X-Google-Smtp-Source: AGHT+IGIeAAB+Zbo9F+WEJ2ntehsPTH0AozBaKItZWisLbiKVixjbm/yHkzfeSzldmE/b2T8w3/wYkXX1FUE8aCOXZ8=
X-Received: by 2002:a0d:e809:0:b0:648:c8ca:f2d4 with SMTP id
 00721157ae682-658ef24b2ddmr30424457b3.27.1720539743849; Tue, 09 Jul 2024
 08:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
 <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-2-5ffeb16252db@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-2-5ffeb16252db@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 9 Jul 2024 17:42:12 +0200
Message-ID: <CACMJSet_FX85rwa2JNBCSfVKUQbZrNdi-ya4KnJjNOumrJaOfg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: qcom: add the SGMII SerDes PHY driver support
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 17:16, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
> Add the SGMII SerDes PHY driver support for QCS9100 platform.
> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> platform use non-SCMI resource. In the future, the SA8775p platform will
> move to use SCMI resources and it will have new sa8775p-related device
> tree. Consequently, introduce "qcom,qcs9100-dwmac-sgmii-phy" to the
> SGMII SerDes PHY device match table.
>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> index 5b1c82459c12..0ea7140564a9 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -353,6 +353,7 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
> +       { .compatible = "qcom,qcs9100-dwmac-sgmii-phy" },
>         { .compatible = "qcom,sa8775p-dwmac-sgmii-phy" },
>         { },
>  };
>
> --
> 2.25.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org

