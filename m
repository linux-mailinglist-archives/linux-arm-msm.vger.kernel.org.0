Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1486942A798
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 16:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbhJLOs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 10:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237167AbhJLOst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 10:48:49 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B5BC061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 07:46:48 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r18so67808118wrg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RbIVq/UEdcc303XkmHmHl8p3Hwos0Z4AAzrjzZdBALI=;
        b=DU9GCSdjmbQDH4t2pDu84NBnFqarQaZSsu55xSBMjG9CuOeHu0S+r8gzFr7IuIvQnc
         sz3qWc0KiqJMIf1/O5UHJF/ZQyT9FSyiPvDTjThe/lPMMoVWQP94D7a3eb/Ed6O/gOzC
         qCrXwhx587iVKnxlmWxcYurRTQBfv8gZ/WC6qJX3EbBGc89eXNQfHo+VdRJSfGq2WyLT
         3DwUq/WNRTHFdnECHj5IphjGV/RrwTkdZ8tXxbTUmOiRf7EwEQGO5NBS8Gy6TCK6o7VC
         x/ND7fepNo8yjbelB1nDSrrx2+h3Zg5625L4ntpq//PcOSzpmeJ8Ym8ZKe+6SpxYGJzm
         NSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RbIVq/UEdcc303XkmHmHl8p3Hwos0Z4AAzrjzZdBALI=;
        b=VRASuA4F2zIfZ/Y/TBGnMzAtvIC1Jugod9XGobPhTgHXoO+2OX94R2nD5LLsfm4OrT
         9jvR8Vxc2dZpbOfwCnbY8wLHqwF3dm3SOqk7Toogf9L0H1/GfIXreVO83mK9SSs4D2k/
         JAailijsSpUZEYdZEm9OyOsGRMrTinFdNWEoEPb2eikvcJCzfwlnTB4KiByreu10PfmJ
         7SRD0WsZGN4ywmTkw/QvOx5G/GzMFGJlcDR+epYCBpUqa3EMZrVDdSWOv/EpDpc+HOMo
         b2e8YVfzzeqYCpoJMdVqPHR4bWhXiCzpAB0/at7GLga0181/8Cfq73QSdbKt7Kd2Go8R
         MyEw==
X-Gm-Message-State: AOAM530tpJWw+7MeualM3hapQTzvsRpbmGzuU98nh/Npqf759orr2vyM
        YFOKw6jU0JJ6QX7C9ayU8ASedw==
X-Google-Smtp-Source: ABdhPJxncDBh31Ae/0zMNyUymugMmwtXjQ3mNw2WOuxjxw1IkmIyhIycZL34TQNU5ljpM7BBpBo+Cw==
X-Received: by 2002:adf:bd8a:: with SMTP id l10mr32155651wrh.159.1634050006604;
        Tue, 12 Oct 2021 07:46:46 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id d24sm2570330wmb.35.2021.10.12.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:46:46 -0700 (PDT)
Date:   Tue, 12 Oct 2021 15:46:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: qcom-spmi-pmic: Document eight more PMICs to
 binding
Message-ID: <YWWfkyoV0rF4C4PP@google.com>
References: <20211005024812.2038249-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005024812.2038249-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 04 Oct 2021, Bjorn Andersson wrote:

> Update the binding with eitght more SPMI PMIC compatibles found in the

Spell check.

> PMIC info list in the Qualcomm socinfo driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 5ef79bf3d035..1d2b5f067556 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -29,6 +29,8 @@ Required properties:
>                     "qcom,pm8916",
>                     "qcom,pm8004",
>                     "qcom,pm8909",
> +                   "qcom,pm8028",
> +                   "qcom,pm8901",
>                     "qcom,pm8950",
>                     "qcom,pmi8950",
>                     "qcom,pm8998",
> @@ -38,6 +40,12 @@ Required properties:
>                     "qcom,pmk8350",
>                     "qcom,pm7325",
>                     "qcom,pmr735a",
> +                   "qcom,pm8150",
> +                   "qcom,pm8150l",
> +                   "qcom,pm8150b",
> +                   "qcom,pmk8002",
> +                   "qcom,pm8150c",
> +                   "qcom,smb2351",
>                     or generalized "qcom,spmi-pmic".
>  - reg:             Specifies the SPMI USID slave address for this device.
>                     For more information see:

Is there any reason why these can't be in lexicographical order?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
