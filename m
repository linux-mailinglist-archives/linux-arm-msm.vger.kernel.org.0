Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0F3F622610
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 10:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiKIJBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 04:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiKIJBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 04:01:04 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDEB1D0C4
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 01:01:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id f5so44909451ejc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 01:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsdyl9eQolwHQu2400xEuupzASBq5K0VfYORRvnPoT0=;
        b=CLqmvEVcSBs8jh+I++OezYrLnpWMKuvFa+ctyobLa+R/SXb5T1ivx8uoWtMmyApIYz
         ounc/hnZ3Mxr0h5Vm6kBQtwByb4CnlEFrKodY6saOlys+arRwAkb50zZ3F7UV96HkYWQ
         ysQHZ15zI6f3z/rUExt6guzTBLmt1fC2xMOlUaYbV/aI/6KD8cJtH0FArn9SR2WGZpfM
         cU2zO0PJpaEnguqK6wnWBqSe+npUf80EXunYaL5CxndQeX43xUyfInQJcI6kMiGtqY2Y
         cuSLc6G+XwTwkKYvRMLFKwUEInTwQmVOVl7qAy8kp1bCGgcUGOBgMNMoe/wpPPI9MJo+
         SEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wsdyl9eQolwHQu2400xEuupzASBq5K0VfYORRvnPoT0=;
        b=sBCdRwfvPTrmybBCXPMmxBulP8dKWGT0NJ26TO+T59vnTfnWMIepHO485wEH0tqVvL
         ZBC8zboK/e9hlZNAt1Hm6eBCS5IDpulJKnAHPv8gx4bQjL6K8N5t3tKwTZRBXt8LB385
         h6gP/2vnbdCOyHJaFNqB7Ed65NeiIsf8dzDM++yVSGA5hmHMz3S0NbUTf0Lv+l5hky1K
         c3uIexOb2dm9PUPaDHr++lsv92gS19v3jK8Cbv7uOWK0UMRLYlFIRnC8fVKf33qlRNop
         a7XS/BhJ9NDyNPkn725qNhULa2KRC0bGlaecv4RZTVsA3Pswp3FIbypD7VlmcVW4FB/G
         AEjg==
X-Gm-Message-State: ACrzQf3HKfLXNroN521g/M5N7c/KftlyzGFzPt/JFN+jgpjH/nY0j1+E
        t86RQavxrHtErqnV3torJLy8Vy0hzwd2ZJlZ9dQQLg==
X-Google-Smtp-Source: AMsMyM6OeCTpErxM3BzIkOS9g1uNoOpQf66z+lCIcXSiJlVfhCJ3tq22oVyyKtPYOfrVMAaAAMklQfTrVq7EBkq23cM=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr57350750ejw.203.1667984461798; Wed, 09
 Nov 2022 01:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20221108140909.51422-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108140909.51422-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 10:00:50 +0100
Message-ID: <CACRpkdZa-h9Wwzf195EtMz7pewEMrzy8g5B=WkmH=DB9TXfe2A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,msm8976: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 8, 2022 at 3:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Convert Qualcomm MSM8976 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
>
> Changes during conversion: update the list of non-mux pins (like sdc1)
> to match Linux driver.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

As usual with these Qcom bindings I simply expect to get it in
a big pull request from you later on :)

Yours,
Linus Walleij
