Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DF53B1240
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 05:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhFWDfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 23:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhFWDfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 23:35:24 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12BEC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 20:33:06 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id v5-20020a0568301bc5b029045c06b14f83so550664ota.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 20:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LUc/CMzwyAMmIfBZUm64TD1gM42DNa6BTHTCy82+BB4=;
        b=tFPFCIwzK9k5OT6bjBwGn4U/IGsIEyokHOPXQHFUffgdiAMlMbaueq/64zZKYFavWk
         oU1UGiE00REnZdfrxutQma2JlV+eAvVtvSFlXGjuk0ZFhp47NVSyzUM+oDj3yqEvUuN+
         bSjN1FbCS8t6dqqhtkiXdgd0zJ+0J5Gszi7i3mnzhoAAvvN63ArKuMIKWqZfuOFyAYoe
         YJqxQg1HSJXwwJ/lx9BE6HfJG5AoEo5FUVQvv101Jaxe97BqlfUWO7TrGzEJbicYPxOG
         HrC1iAxgAmc9wWwGQwr7nWHTkpHxJIm8hXNaKKc72fQuD8efAxIb9l9KFh+TgWRhx15P
         jX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LUc/CMzwyAMmIfBZUm64TD1gM42DNa6BTHTCy82+BB4=;
        b=UsiqxfiTzGM7TiBj332U0nr2snO3mTe6uMR7uhBKQlXpEETatVb6nKobqVftWdQODc
         gdBAz9jVRO+ci4Od6PgNgsYplcdDWkihoBChiZFX6jKe84uM7estSlWRfrr/HsA8c4Xo
         wUVVMpai4dijYq+0VMLNtXwHkmiJb5x+K9jiOaelDTIQBSqg8soAXRhzC8oCIji/oKaQ
         zmZ5cmBhjpPqxQEaV/1gq9Knl6BKQcY8oPMp7UDM9eyG49fsmOa/2pj/9GgL+oQ7n0ez
         tK//Y8RNXhWOOJlUXOrW3Pbf5U5KsBTsJlucFslnk5i/CUjhqJXcKOcGWn7TL24gtNEH
         BPkw==
X-Gm-Message-State: AOAM533CsvOapmu8xItyRLmmMIZ8bynrgHivWFmhAxesxjreIi+F2JhS
        mcYDzq1SCnKjDnYG63SR43EQPQ==
X-Google-Smtp-Source: ABdhPJx1m0AwnV2HEPSrpLkiEUal21OY6y3ubUm4VHFMNPSoK67PWwBu8/tbipA+psRLFC/HzCaIuw==
X-Received: by 2002:a05:6830:270b:: with SMTP id j11mr5807089otu.161.1624419186186;
        Tue, 22 Jun 2021 20:33:06 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b198sm4735924oii.19.2021.06.22.20.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 20:33:05 -0700 (PDT)
Date:   Tue, 22 Jun 2021 22:33:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: qcom,dwc3: Add bindings for
 sm6115/4250
Message-ID: <YNKrb4/X/1EIgnsI@yoga>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
 <20210622203240.559979-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622203240.559979-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Jun 15:32 CDT 2021, Iskren Chernev wrote:

> Add the compatible string for SM6115/4250 SoC from Qualcomm.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 413299b5fe2b..4e6451789806 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -19,6 +19,8 @@ properties:
>            - qcom,sc7280-dwc3
>            - qcom,sdm845-dwc3
>            - qcom,sdx55-dwc3
> +          - qcom,sm4250-dwc3
> +          - qcom,sm6115-dwc3
>            - qcom,sm8150-dwc3
>            - qcom,sm8250-dwc3
>            - qcom,sm8350-dwc3
> -- 
> 2.31.1
> 
