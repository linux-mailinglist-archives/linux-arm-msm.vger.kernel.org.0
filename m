Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1456A7FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 11:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjCBK3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 05:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCBK3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 05:29:38 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E448910A84
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 02:29:36 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id j2so15991894wrh.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677752975;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG0uzlam+VIYSFcSVrtgNaOvUeUxZNJ+qAZWm8ja/DY=;
        b=qiEuzk581mlkYapti1YIm/V0XjlG20KCHFn4YAGJTpbZyclABGs8iQcEU5h1RsXS+v
         ML9MQ9w5SS2nvl1b7/Nd5/hexpweNNUi6QRW0pWlOLEQZCi/nNf9jcL5VsONz7DyOp45
         yIYUSE3vJ+etNZH3HoS98x2JN0Lw9QdLpkdX4TYPwHnN6XZ8e/G9XhSLVx7q7Yzk82LA
         AvAiZRA+FMy20PQwO5QgXWobPHpmexmqiJn54YeshKpniMfrY1UuEF23rwo0SOTmQSVV
         ZMVI/omRyWUAGyUq+cArdaMAtM81zuKUZ570O5+bSmz+Q54/l5sTw1GiryHNKOce5Q7X
         56zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677752975;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG0uzlam+VIYSFcSVrtgNaOvUeUxZNJ+qAZWm8ja/DY=;
        b=2zdELwcNBEzHe3CMFUoV2MMPhYhYjQ1QsNOiS/6DlPx7pNMt25FTWGasGvAoNAl85y
         fwQgMx5q1x9UX3TJUKWvyxAkYoAQ/fQ2LfQSVbqX0WmIkbDQ/sGTTV0fP7Qy8BAQUnnd
         efR8sHdJkaGF6f2zMzqVEuxMwqIalf3l6EhNxm5eN40viBc/o4Ivd9G06x3NH6XLW3oH
         lw6ZZ+gaCamoapTQ4Y49H3BFWC1iytiqXbMouhE8SiOZpvoTNGLR6OAxPAddSAmFNWXf
         lkhUxNj+eV6E2AdnBCgcya7hUkpwershWU6k06g5CbKOjSQiyIi6SmE48D6wz26gNXew
         YeAg==
X-Gm-Message-State: AO0yUKXFPmPt/bKLNX0ZL/xUhXDU3JDCo83JYGwyuuzgfqWlw6O3xi0i
        1t1DpJZvyIpSsYFYC32nSfoFPQ==
X-Google-Smtp-Source: AK7set9vEdzBVf4lPIVfbQuTGQ+LT+gsnEcEJwXGUvFZFRmt6hqek/sgmyehiQPAW/KVqZHNXngUpA==
X-Received: by 2002:a5d:4586:0:b0:2c7:1d71:e672 with SMTP id p6-20020a5d4586000000b002c71d71e672mr6879122wrq.7.1677752975373;
        Thu, 02 Mar 2023 02:29:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d464e000000b002c558869934sm15069137wrs.81.2023.03.02.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 02:29:34 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
References: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as maintainer for DRM
 Panels drivers
Message-Id: <167775297427.128880.7902941265688645008.b4-ty@linaro.org>
Date:   Thu, 02 Mar 2023 11:29:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 01 Mar 2023 10:47:35 +0100, Neil Armstrong wrote:
> Add myself as co-maintainer for DRM Panel Drivers in order to help
> reviewing and getting new panels drivers merged, and Remove Thierry
> as he suggested since he wasn't active for a while.
> 
> Thanks Thierry for all your work!
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] MAINTAINERS: Add myself as maintainer for DRM Panels drivers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4ddeb90d602ac58bcf99924eb34d8b2f820ce11d

-- 
Neil

