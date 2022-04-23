Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95E650C6F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 05:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbiDWDtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 23:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbiDWDtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 23:49:40 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF313138492
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 20:46:45 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-d39f741ba0so10599764fac.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 20:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VK+Mc12IDWDoCeB4UokFVRy/0yOeXXdrFoo8csy15fI=;
        b=rj1fWjvFr6UfrBYJZaadRrPi88B/qmQLm8ZzbEv6/alcfmDFmFeBGWnL4HKOjP37Oo
         XIMpB2qQ1V8TZ5PJZgcS9t0rwYLuCx/HXeYd46dXX9BffgCtszf+ujA7bpVEDTbTllKr
         9KuNVf4yaUNy1B2uLsiF1lj0wM19F15AdtbVlPC3DYFAWn8EYd5Wb3/cp0mY5gePmOY0
         uDlSHzgYy48VHrRChwQWIbKfAU2B7/G+sVEH4wDLIPfXhyL1qCG67Gokmjruh61W/Wkf
         ArAI0RkwHAhB9loPoYk+0/fRNf1D40UaO2lsgdjDih3yTT+SgLXv2D69dVSO4yoTT1lF
         9EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VK+Mc12IDWDoCeB4UokFVRy/0yOeXXdrFoo8csy15fI=;
        b=tlo3SWvwUheZsHTBMuUk1VojG+Nl5zOqd92fQgJE2XdH73skBkTBI/UdDx1dY9K6zH
         K0R4mMtfU+GNoFZ103dere/ZpTcG7Ded4sIooVt/t7TXjuF6fW8eI0IrBnJ6dIF+qq4j
         SDZ/4D8iso2BxRm7gjlGoqvH8aTVosDPQl7D5U4ZqNgau5JSK0yemE73yGMXzAEA/m2t
         y1Y69p6Ce8kVR4eBnENX9vX7tFuupJ/wTvmf2fb+/+6UoxR1qv7TmpIDe0PsovWCpT18
         sa0F2FYL/Gax4aOdHLe8gej7SBr6ljhcvge+Q5svi8QbNj9X0vUwj+J5/wEcN2XWfsP0
         fxJw==
X-Gm-Message-State: AOAM531KdfCC307LcnQPBdhd48dVw0SEIeGIku4z2dyPDZMDt6rocR6V
        86EPxejeVa7YZhP85kZoYoBq9g==
X-Google-Smtp-Source: ABdhPJwkRUj9ppkMSZqmz3YeDFf41/hx08RbxlEXevnET+FZzlP8mrOGYwNPSqQII5QEVaDRbcIT6A==
X-Received: by 2002:a05:6870:8907:b0:e2:a4fd:7539 with SMTP id i7-20020a056870890700b000e2a4fd7539mr7629021oao.56.1650685605139;
        Fri, 22 Apr 2022 20:46:45 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm1440218oia.31.2022.04.22.20.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH] rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
Date:   Fri, 22 Apr 2022 22:46:41 -0500
Message-Id: <165068558593.2759280.17055526649115604333.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422105326.78713-1-krzysztof.kozlowski@linaro.org>
References: <20220422105326.78713-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Apr 2022 12:53:26 +0200, Krzysztof Kozlowski wrote:
> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
> 
> 

Applied, thanks!

[1/1] rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
      commit: 1a358d35066487d228a68303d808bc4721c6b1b9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
