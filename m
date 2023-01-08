Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17AA661849
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbjAHSp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjAHSpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:45:25 -0500
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFE0E029;
        Sun,  8 Jan 2023 10:45:23 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id d10so3853110ilc.12;
        Sun, 08 Jan 2023 10:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNM3101jYBEy0sKS1GXndfdY0kA22zJJ2W92cc/oJ+I=;
        b=CSTKJCnscdj5L1aOJ1vdRVp5tO/lKAYFT4yAPa+9OJce/vjLFsp3/55LCvVeNnbJRi
         0n5fm13CaQ5M37tNjxyDuTeaTjDu0aeYMocSrj8mH21RON9vZLFQxYOoi5K/WRpJuGyv
         DjBqdidaYpT/bV7SgIApBqnJ3712uCsAa+15waCik8G144kwiNQTreHX2/QVX4a1lU5S
         /3zwvBgMv6gBVRvqHNhxzJtEky/XiWrEs3lxbq/VL+lBirHkVJFDKFh/bNf/plkEbzRI
         OQyHkINsKJH4sCcGSZyMg7g0sWIIfZbmFJJ9AFCNTmXqT4DWejmsvt4KP+PiK1P8t+Lo
         stSw==
X-Gm-Message-State: AFqh2kpIt8VCQQ7yftGJJZiqT1WvLk+HnkADmdyeiIDlBZJasZNEhbV/
        ZBWh6lw4ihgN+xn9JGAGrQ==
X-Google-Smtp-Source: AMrXdXuPtWHVXerQw7+9SxGj8NxVWHs+6INllbfkgVSVSb6uL7MybYbgxq16CXIe4sV6HDKoL/IpiQ==
X-Received: by 2002:a92:1305:0:b0:30b:be3c:d003 with SMTP id 5-20020a921305000000b0030bbe3cd003mr43488073ilt.32.1673203523086;
        Sun, 08 Jan 2023 10:45:23 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id q25-20020a02a999000000b0038a360671adsm2226401jam.27.2023.01.08.10.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:45:22 -0800 (PST)
Received: (nullmailer pid 193268 invoked by uid 1000);
        Sun, 08 Jan 2023 18:45:19 -0000
Date:   Sun, 8 Jan 2023 12:45:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 06/16] dt-bindings: clock: qcom: gcc-sm8350: drop test
 clock
Message-ID: <167320351900.193211.7810826037803694168.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:27 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sm8350.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
