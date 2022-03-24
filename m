Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4568C4E69B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 21:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346425AbiCXUNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 16:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239738AbiCXUNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 16:13:40 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF22EAD137
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:12:07 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-de2cb87f6aso6036524fac.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fm33v815cGyvRnZSik/3qfh/le6zz0KlP6K6B+y0Ujw=;
        b=j7BsnOzcEainxu4qHj53ZoSIQjjCWDVI5dpkX6Y3H7F6bGoLg+zwQ1mH1J+hSY+eBC
         fUnpuDvR1s6e0lQ1cGONY7o0FhHRrOtx65byEMhBahgjGMhkzlr4QtW3ds3UgP7X1ZUC
         bGMQzgtuDRbwkG8eX+c81M6n5aYkFSU2zHGkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fm33v815cGyvRnZSik/3qfh/le6zz0KlP6K6B+y0Ujw=;
        b=2SMzjQSxh+ilYWZmfhFruldyOt9Ia5INClqtmhODhrghJYhEmzUtbJe9giJb46b678
         ATUHW2joTohUnNm+NsjbULoVrCb9HEpO8sM8assizP+0v2kjHO9NZmCcmhDOOboPRBsx
         dwhYS5bEZjBbnC8sbTDwIQ+hSSR8zmCygQ9pmUn+7WWREKvnFiokao6oAA6a+tpT0NbO
         YH9LCDzroMqO6xY2jyozTFEtOVNptW7T97W5BQNpwwAtnH37PAVLdtGnOqfrnknWqYxV
         aeXRFsYh7R2I7VxoURigQWTo300Ykv4OLaNGzk8Iuien58NyBTZjS58H0P0rtvuWxADc
         6ZWw==
X-Gm-Message-State: AOAM533VFs4c7TpizGro59BAPaSrJTC7HEeQ4/oB1S6uu25b5P9Le9oK
        XSPNxlokLhTSmSL01HtJpPr9SIZq/SXE0M1RhWRoXA==
X-Google-Smtp-Source: ABdhPJzKBovD/XnQBM2VJdM2UICBfRNvK7J2MglCmPB4nXDGNIsSoqA1flcavm/5l9LdPtrW0MWyu1WgO4fQQ3UEHWo=
X-Received: by 2002:a05:6870:b69c:b0:dd:b74b:4099 with SMTP id
 cy28-20020a056870b69c00b000ddb74b4099mr3107374oab.193.1648152727293; Thu, 24
 Mar 2022 13:12:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:12:06 -0500
MIME-Version: 1.0
In-Reply-To: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
References: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Mar 2022 15:12:06 -0500
Message-ID: <CAE-0n519RudiM+BG722M_BKqb=9Qt1rPFH5eYE1=9Lut6H7o4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: another fix for the dpu-qcm2290 example
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-24 04:55:36)
> Make dpu-qcm2290 example really follow the defined schema:
> - Drop qcom,mdss compatible. It's only used for MDP5 devices.
> - Change display controller name to display-controller as specified in
>   the yaml
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
