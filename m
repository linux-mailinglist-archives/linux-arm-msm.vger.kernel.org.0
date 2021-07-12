Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C17C73C618D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 19:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234208AbhGLRLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 13:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbhGLRLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 13:11:36 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69E8C0613E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 10:08:47 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so19552197otq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eoRs3jZry7KcnKcDapY0XJ0GGSCOklV/X4YSX1hb1x8=;
        b=PJwQSJBOZq7qli3w+9NUFnTbKKfVbFNYdEcCYjiG5LdgbQCS1WBWDlpmNPEnPs2B1X
         Ay6ImdQbwk+iELQJuM47wGLXfgueZE4gd29ibMTpGgraYgx4HGjYmW+SzhGouu8rpbRk
         XysJ8L6C8UtquuBxPD7Lzea/Dz/3KWpU7ZkZok+EuT5ISKzEGnbco+nmZBCPDcvgg897
         yGe6hnoxXAPt9VexTjmxAbnHSxvz21DMVAoAkC1BS0BMQbjx7tbjrMSBO9SFDHQYN4Fq
         AfKBE/KnkIyCh4AV0bmfEArS4OcqmNwXx9LoIJxD0T/mSzBu1xGnYPEoEbMJEU75DmVy
         z51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eoRs3jZry7KcnKcDapY0XJ0GGSCOklV/X4YSX1hb1x8=;
        b=jL8nxuFMo+11O17dDU4NnkLnuytN5Kxb9+53h1yPkZ/4Jj/qjt+K+TwUyFkRHy3Xnn
         Z44qBenMOmBKO5dKjVzVNpiEtbaw2g4NZ1PfoTYejH5HwrvRSYWqRON1JeXFSvxIFsdq
         IKmFTKmBL9CwcmaZ+rChQNVci+kGmX5no8j6wd10Vp4myOVmksWIvLeWBPj592D+7UTS
         32iXBh+5NXQI/DO6LJYAWr8tXgTyhBRx5zKilYa0O36I978DMqW9xY6XDfp8CFWz6HKu
         YHuRV2Z2l5xJbWp0fI1XGeteN0DWyMrBTtLM6iELWQlKmLHlyWMY3ik7HEudiWkbuwHA
         /5ug==
X-Gm-Message-State: AOAM530U/n7ZM220Jkim2dCbDwA1/M6Ow1x4IcrT1GS/d+ziYZ0EUBnS
        LBM3clYkevEQ3EQ5JNR/mixfzQ==
X-Google-Smtp-Source: ABdhPJxxZh+RoC33x45e5HtehEjtcbXLDiBQcMFbCCv9umYtziLtzdZUph/tUf1jm3FlN+xmYmWL4Q==
X-Received: by 2002:a05:6830:4027:: with SMTP id i7mr45106ots.180.1626109727111;
        Mon, 12 Jul 2021 10:08:47 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k4sm162226otp.2.2021.07.12.10.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:08:46 -0700 (PDT)
Date:   Mon, 12 Jul 2021 12:08:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: qcom,pon: Add
 'qcom,pon-reboot-not-used' property
Message-ID: <YOx3HGWEyHWr8bYB@yoga>
References: <20210705025032.12804-1-shawn.guo@linaro.org>
 <20210705025032.12804-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705025032.12804-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 04 Jul 21:50 CDT 2021, Shawn Guo wrote:

> Add an optional 'qcom,pon-reboot-not-used' property for devices, which
> do not use PON register to pass reboot mode but other mechanism, e.g.
> particular IMEM address.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/reset/qcom,pon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> index 7764c804af1d..584eff179904 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> @@ -23,6 +23,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  qcom,pon-reboot-not-used:
> +    description: Support of reboot mode passing through PON register is not used
> +    type: boolean
> +

How is this different from just not specifying any mode-* properties?

Regards,
Bjorn

>  patternProperties:
>    "^mode-.+":
>      $ref: /schemas/types.yaml#/definitions/uint32
> -- 
> 2.17.1
> 
