Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8323E5BDFD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 10:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiITIUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 04:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiITIT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 04:19:59 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE69C2646
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:17:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a14so2039823ljj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=x4MAfY1VGIYMXUmdsJlOqMmZnmClXuiEwgPZwceqLLw=;
        b=jGs9b6WlGRmlKRGXCccRnBMJaM6tqKS38Eo0BuFIY2xu70iewskfsl571XW5edge4N
         x4ZIOFDJLXcuApuVO4LA41tlaCw6K+j8I9CSSA6kbe0trvb4YWwpPS+Eil3e6ZnfxENs
         0iiGFup9Znm172Ls+P+zrE2TSqztojsFpXLkPBNquzBxFugh8ze8yxsDkQhUUSyozGb7
         CWFZV3s5om1iS+DLXAlCcoEw3GXYN3WWzvQdJC+TWJ5BAXao6wg5f42VZTfc/C8vDKSl
         //6Z947daPYXDIoSi3HvYDmp2fiq2Q7d/3ukr+Y3Ty0CUfR1Euzm0G4Kop05X+qMAGx1
         nqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=x4MAfY1VGIYMXUmdsJlOqMmZnmClXuiEwgPZwceqLLw=;
        b=yo+DmtPOEq0/UbZ+fqyIVidvWJyVSrdv8TZazJl3cu4mlTzku2WAKvYvJAROjkoEo6
         EkO7Ne7O8bjK/FUi/N5fHCbUKOI1RIn8/hqmEks5FgAV99ZV12/WgZIVpWqwWRYWqoqv
         AJm+R/AZTYi/PtY2w2VWql4CBVssGf7Ryj3hQ+eMAFBhEgukCaNtu6hi8L7Dqg0EKh/q
         za4+9vZqf0neU50yPPEEcGu5cJ1XXNzPrhzSvZvSGLAPYbqy1en2ue5GbqZnWoKXVNHm
         eMH5BXRWZu9XrfmMLh7fXz1/qMSSaLHAamAUsVe6cpdCJMFwuBWjcXKy9f0PvigS/UWv
         95+w==
X-Gm-Message-State: ACrzQf1dPtxWEDw+MVNSzYrDYADynf0T2s7cN+w1QUNrXoq5trCa5HIk
        ORUrSACVwDzLP4UF/BdMg/t2Dw==
X-Google-Smtp-Source: AMsMyM5g2iUvFDFjem7icSO9UxkfWSOZkvkZYXBGjv/AHbErp0fN++5z186PQlzCoss79lkvxOHTVw==
X-Received: by 2002:a05:651c:4cf:b0:26b:dc6f:26c6 with SMTP id e15-20020a05651c04cf00b0026bdc6f26c6mr6780359lji.41.1663661862197;
        Tue, 20 Sep 2022 01:17:42 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bq5-20020a056512150500b0049f5c71f1c4sm189858lfb.198.2022.09.20.01.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:17:41 -0700 (PDT)
Date:   Tue, 20 Sep 2022 10:17:39 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: add sdm670 power domains
Message-ID: <20220920081739.eh3qzohw74elqyfm@krzk-bin>
References: <20220920021927.2489-1-mailingradian@gmail.com>
 <20220920021927.2489-2-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920021927.2489-2-mailingradian@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 19 Sep 2022 22:19:27 -0400, Richard Acayan wrote:
> Add the RPMh power domain IDs and compatible string for Snapdragon 670 to
> make SDM670 power domains accessible to the device trees.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


power-controller: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
