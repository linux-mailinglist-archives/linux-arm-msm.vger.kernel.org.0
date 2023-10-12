Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA347C635D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 05:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjJLDmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 23:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343496AbjJLDms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 23:42:48 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524ABB7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 20:42:45 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c87a85332bso4793995ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 20:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697082165; x=1697686965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7nADTi8p/TYCcFoqwy7wIdRGyUAvcVuWu1MGhn66nEA=;
        b=Qe8o0U3g4ZajNWQpqJrfqnjeVRhtgFz6SqZYXAmyUP4UibufYVfyoIK9ilgZwlhD9C
         /ivgEKBq/VazLMpAhhHa+Ev5i0JNpM1/nJzerAN/59/lOxEju7bP8k3J69RvO5g2yOfO
         ads1hoMxg2yMiL8+qUCalIizd3iH5LhTrGdU4il+F9UcCcC0eRXgkbXGiBX6eaVOY27A
         AI8iB2Bxb7XyTIjDgAvUaxVLw8eoFsmGD0YkT4cU7AZGQ4JMdL6ictFitGZIvpZbYzEE
         6eClqQ7XggtjlsHVwGNIqLYLhBq95Dbh6Z2dff6XX4FmsEBu/rNEOdz5LNI7uTZT/4CU
         4Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697082165; x=1697686965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nADTi8p/TYCcFoqwy7wIdRGyUAvcVuWu1MGhn66nEA=;
        b=FV6yTXMFdqBDbIc4SBhO0ytSBig7IrDlrD0IdxPMTKcMtk9AjVviuRAa5SF+Zt24QO
         UHS04pQyoVuD75y5Gfc7IZ2giNTYKKtLLVwwOkB0ZD/og0X2cBfTrEN2NzbhLZyoMwt9
         ueEFsLAslmmnYYgPINOemn7bfjlJQXx+1bZeIhtX5pwFqGV8C0NJrkTGltjo7z0OQV2k
         wTNVwJsSUN5Q0J6B3ZGIfiYvxIDKdu9gcOAQXiicJ/2ZNhmvjn+b0o+o5DJSRGRyzsXK
         HoneqeKqCJUAss1HSn0Ha7BFss1kZmVe/1MO131Z2EtyYAoVvOWncGgsPbLpt836ocmL
         A9Wg==
X-Gm-Message-State: AOJu0YwFbQQU+scbVicuy2ZcBwwVw91Cyie6YHQ4Tr9h6vcQlwPSSOQT
        n+yLKiJFXUX5LGpYGcrdBXEvbA==
X-Google-Smtp-Source: AGHT+IH5vhqHicRELepcn9OOPQFFmVMWymakQt2rn9zy2Upu2MiP4JWmXB4wVeUfWQoNqfdb5giMlw==
X-Received: by 2002:a17:903:810:b0:1c9:e257:f88 with SMTP id kr16-20020a170903081000b001c9e2570f88mr108445plb.10.1697082164766;
        Wed, 11 Oct 2023 20:42:44 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902e74600b001c9c5a1b477sm685950plf.169.2023.10.11.20.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 20:42:44 -0700 (PDT)
Date:   Thu, 12 Oct 2023 09:12:41 +0530
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
Subject: Re: [PATCH v5 0/6] cpufreq: qcom-nvmem: support apq8064 cpufreq
 scaling
Message-ID: <20231012034241.jwtsq22w2lwzfbvn@vireshk-i7>
References: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
 <20231010063235.rj2ehxugtjr5x2xr@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010063235.rj2ehxugtjr5x2xr@vireshk-i7>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-10-23, 12:02, Viresh Kumar wrote:
> On 02-10-23, 21:59, Dmitry Baryshkov wrote:
> > This is a split of APQ8064 cpufreq series, as requested by Viresh. This
> > series includes only opp and cpufreq parts, with the DT and soc parts
> > being split to a separate patchset.
> > 
> > Each core has independent power and frequency control. Additionally the
> > L2 cache is scaled to follow the CPU frequencies (failure to do so
> > results in strange semi-random crashes).
> > 
> > Core voltage is controlled through the SAW2 devices, one for each core.
> > The L2 has two regulators, vdd-mem and vdd-dig.
> > 
> > Changes since v4:
> > - Reordered variables in qcom_cpufreq_init() (Konrad)
> > - Fixed of_platform_device_create() error check (Konrad)
> > - Dropped unused ret variable in qcom_cpufreq_apq8064_name_version() (Konrad)
> 
> Applied. Thanks.

Since these are causing build issues, and it isn't entirely clear what's the
right approach for now, I have dropped the changes from my branch to avoid any
further issues. You don't need to resend these, lets finalize a solution and
then I can apply them again.

-- 
viresh
