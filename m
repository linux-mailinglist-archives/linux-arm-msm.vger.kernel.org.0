Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2BB745498
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 06:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjGCEjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 00:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjGCEjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 00:39:09 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D7FE47
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 21:39:05 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-263253063f9so2962359a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 21:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688359144; x=1690951144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JQa+D3bKZ4O4X9M+/GDbUXDgSQgWey4zHBVp12A/tyI=;
        b=m+GgiZJMY2GS44/BQkwyMYFYMP51zz2ucUazeKUJ3BSo9w69Q2tXsgqxvb1neJ985S
         amGPFnsHQcwozrLn4ghLN4POCUVgLCA1DGJZeJOODZsIdEjaaKA5VvJ/gV2PmqNgbK3Q
         ed5D/YJQImyRQjc9tzIUA6ZyvPup8uEQjfrhE6n9ELnemPmwGiWdx1zY4bNx5m2Ediux
         J5uemWTK4i9hx3pD7zleltHrluZgpWVLkZ7pvjskPZeHqqj8brCQkjlMIbc1pKQVwe3y
         NKyW4IH+8ka/S9lG2ULnI8SiNlO3YU5GO1DDrr2iKVt64nnQxb+1+CLDwGVnOoyW8W0X
         Cc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688359144; x=1690951144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQa+D3bKZ4O4X9M+/GDbUXDgSQgWey4zHBVp12A/tyI=;
        b=QDsynIobM7u6D1h+By0hkPK0B+Na6p3r/NAAsFJf9PdATO2zN4YPMMzNl/z4mMF+w1
         MfWkxDQD7pmejXJQcB959hdAIe2EHiH5jp3CxVvu+gCg3fmBlBbzYzPYRm/iDINGAJqp
         XsB3bE1qYsVLAbAZYuOpNLqu6XN5Ym8yDplvfeEJGYSn4f91Iz5qXCFgPpQuMtFnt7ym
         lgxXO3TrYhk+uXgstcgmHhIVIEG1H8tAF9cZ/T+2sYJpWSwQkm2PpYQB9CuFoFQRkYXB
         E7ix++HT2Nn75Y7a3GpLb09+YrP4Td/VNH6UYbLMUe1YM63Fr6P9lzAstba6NlljhS3R
         uP0A==
X-Gm-Message-State: ABy/qLbMx47OxF3XsYWULK2I+Vvnvzpuuj/F96Xvxp6ypVyAgQbmzNWo
        yeJstRChXA3L5X+UuRo88M+iSQ==
X-Google-Smtp-Source: APBJJlGJAqDtdAlIcLY6/PXL/R2IWqlVaFJAmvBSHXphW5VbL7iECzu9LLaRZeY67AgChYrKFKR7OQ==
X-Received: by 2002:a17:90a:3d0d:b0:25b:ea12:a2f5 with SMTP id h13-20020a17090a3d0d00b0025bea12a2f5mr8671488pjc.35.1688359144365;
        Sun, 02 Jul 2023 21:39:04 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id lp15-20020a17090b4a8f00b00263d3448141sm118842pjb.8.2023.07.02.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:39:03 -0700 (PDT)
Date:   Mon, 3 Jul 2023 10:09:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v3 00/28] ARM: qcom: apq8064: support CPU frequency
 scaling
Message-ID: <20230703043901.b4wvxgq3r2a6yijv@vireshk-i7>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-07-23, 20:42, Dmitry Baryshkov wrote:
> Implement CPUFreq support for one of the oldest supported Qualcomm
> platforms, APQ8064. Each core has independent power and frequency
> control. Additionally the L2 cache is scaled to follow the CPU
> frequencies (failure to do so results in strange semi-random crashes).
> 
> Core voltage is controlled through the SAW2 devices, one for each core.
> The L2 has two regulators, vdd-mem and vdd-dig.

Is it possible to send the cpufreq/opp patches separately so I can apply
directly ?

-- 
viresh
