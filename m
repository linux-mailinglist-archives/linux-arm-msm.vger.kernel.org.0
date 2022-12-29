Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5C58658CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 13:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiL2MWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 07:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiL2MWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 07:22:19 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBEA1208B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 04:22:18 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id v3so12291050pgh.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51XIq288nnqW30MbwCHbWdcwtSToFdLwUaH7nRrsBQg=;
        b=tQAOFqEKVTsJpkBqCV5/v0DhxXsOtyYEwJaJVCzAIi195OFvvG7IRPORAZ7n/T0gCz
         8B/bHbE30OWIZluum+72FEVTaR6aCJBOlaUKdGdKe+EMUFoDLlc+USpxfSHXLPsizW+h
         oBaHbO2hH8xp2w+H2SEU/ceIva6MZ4QI0rUAyN/iBJ6m/ILAg3phOisWxa4m0I+NA1WW
         dRx6LKH8TPkPLnLwuGTQxKR44xBPZkrdbdUD4uGsteSGwfISfBJSR7T3jLiFoBqAH2c0
         X7S9SgUMkrrcjRhqFYETvv3E2MNNJWyLDEZYKRNF6SktnP7Cmo8X1l3cmyaTaHws1b0L
         RLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51XIq288nnqW30MbwCHbWdcwtSToFdLwUaH7nRrsBQg=;
        b=D8zGLBqx+7uVbmqQwInZiVr6hR7tU4t75X5YjcRMHjQkk2+ucRHJIa3ak5f+wpPYVU
         zOKzAWd9dHGJpwzhMjpr+xojlxI2c7enAghcsPpKcJA2V77UFI+783f3t5ODHmyKoInb
         PN6c98NeZJydKeHEAQBBDR9kb32oqN9RK7fCV4fgOcuhlLVxeC5WKsU2TwOZBrMEmpBP
         ZuaOD7fv5Lm+s4dvHSPSfe9TwCuyUVHSx5b/s97FGSTXp8S7z7MHgLegpwqyLODsOECq
         VifRMHIqn4p6TMFfysJ0AMIRbd4KWTli81d+uD3etqoghCAPqQub38TYxRgHC2/13fCq
         139A==
X-Gm-Message-State: AFqh2kq4ghs4egWv0uNACEBsVv1yRUDC5Js66bdgYAHGdC9lla07aSGP
        wdeDKdYoK3RbhiOeqi/Hk4ZULg==
X-Google-Smtp-Source: AMrXdXtX8G+5jOoXvbDdQtplTg/+msreZyAoXUDhFj9qQiE8hCA28EUEUZCh+WhFcfW6UkyokeLJMQ==
X-Received: by 2002:a62:6483:0:b0:577:7cfb:a896 with SMTP id y125-20020a626483000000b005777cfba896mr26284908pfb.31.1672316538155;
        Thu, 29 Dec 2022 04:22:18 -0800 (PST)
Received: from T480 (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y14-20020aa79aee000000b0056da63c8515sm7617929pfp.91.2022.12.29.04.22.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 04:22:17 -0800 (PST)
Date:   Thu, 29 Dec 2022 20:22:10 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/20] thermal/drivers/tsens: limit num_sensors to 9
 for msm8939
Message-ID: <20221229122209.GB18875@T480>
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
 <20221229030106.3303205-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229030106.3303205-9-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 29, 2022 at 05:00:54AM +0200, Dmitry Baryshkov wrote:
> On msm8939 last (hwid=10) sensor was added in the hw revision 3.0.
> Calibration data for it was placed outside of the main calibration data
> blob, so it is not accessible by the current blob-parsing code.
> 
> Moreover data for the sensor's p2 is not contiguous in the fuses. This
> makes it hard to use nvmem_cell API to parse calibration data in a
> generic way.
> 
> Since the sensor doesn't seem to be actually used by the existing
> hardware, disable the sensor for now.
> 
> Fixes: 332bc8ebab2c ("thermal: qcom: tsens-v0_1: Add support for MSM8939")
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Cc: Shawn Guo <shawn.guo@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
