Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F77B7CEFF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 08:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbjJSGQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 02:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbjJSGQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 02:16:16 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C84C113
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 23:16:12 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6be0277c05bso3358238b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 23:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697696171; x=1698300971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yH/UjLgq32jH++PpMoUqJLeIFE0ZYZEDnxQSEj9bfyQ=;
        b=XhQ9rch0+74TVCHpR01n3JHumgle+KuMfQscJmbaLNgjAh2Jqde2xQDbA+N3Crk8fi
         a2WLAWqMwipqF4DdSDHumJCyN0L6bWFQHLcb0DSkiqrOZQsaZVDkuVVYrdBGAIGqhCxK
         QPaze6Bn84FFwXoDAKtSUzhWGnzxYS1FWprqj50rGJiyaCtbHTxHzdIQlf2jSfA/Dyh3
         igPWdmrg3yYoUtBVGldc6ENP7hzbihwScFYDNLDW0UiKAqQz2V7EX4N29/lx7CVN8fWB
         7n4+r2S4GCQMCjJQUNWKJzZ4fecndvvLrJERZsd9xw+6eeu0NI3k+qUlTfdM3gYhGc8l
         h1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697696171; x=1698300971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH/UjLgq32jH++PpMoUqJLeIFE0ZYZEDnxQSEj9bfyQ=;
        b=d+uGr2eexZEgN1PzzOctD3HDsusaw3NHzC7BP3URzOIFkkhgwB+qzD1OFeHot7ep/0
         Uu4qLFmiVP1XjFfHC6xuvF8nxHS1om+6twC918Tabi+k0m/iBSMr61zYAgiSF0wpthRb
         e65gqUwB+PLeEeEVKD42j4k8vM6TzVOMFxyScUhoqa7m/rl6J20Mizg3hpSmJ7wpDl9g
         BWSF48tMAfwi5Oi5fxkbFXEupMzpvXFu/OT3D4pUsz+7JnyZHNr7IvFvJplyht1xPHRp
         roRKsqCeR5I1vFRKihb6o/YIxLYv+27LJoie7Do7KjH/NjnqXuxeCoPyo3oyOf3qd2XI
         BpMA==
X-Gm-Message-State: AOJu0Yzl9mItVcZpf29mjfvVt7HZ05C5GN9qgpSlkXxn6yPla2VaDERI
        4HsCWCre9Skcl7qbT5o0nhn7LHK2t7ifCox9ASU=
X-Google-Smtp-Source: AGHT+IFaTXuhZLlg7nK3UyK8fM+1t0TG+C2O2i5DXfpYAeJ5f2mO+dwIkmiwoqHBiZRsQHyYhwplMQ==
X-Received: by 2002:a05:6a00:1a8f:b0:6be:3c44:c18b with SMTP id e15-20020a056a001a8f00b006be3c44c18bmr1167269pfv.25.1697696171321;
        Wed, 18 Oct 2023 23:16:11 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id x13-20020aa79a4d000000b006be0bd6a4d8sm4325600pfj.36.2023.10.18.23.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 23:16:10 -0700 (PDT)
Date:   Thu, 19 Oct 2023 11:46:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] cpufreq: Add basic cpufreq scaling for Qualcomm
 MSM8909
Message-ID: <20231019061608.wjlf4orkdlpnv3a5@vireshk-i7>
References: <20231018-msm8909-cpufreq-v2-0-0962df95f654@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018-msm8909-cpufreq-v2-0-0962df95f654@kernkonzept.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-10-23, 10:06, Stephan Gerhold wrote:
> Add the necessary definitions to the qcom-cpufreq-nvmem driver to
> support basic cpufreq scaling on the Qualcomm MSM8909 SoC. In practice
> the necessary power domains vary depending on the actual PMIC the SoC
> was combined with. With PM8909 the VDD_APC power domain is shared with
> VDD_CX so the RPM firmware handles all voltage adjustments, while with
> PM8916 and PM660 Linux is responsible to do adaptive voltage scaling
> of a dedicated CPU regulator using CPR.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Applied patch 1 and 3. Thanks.

-- 
viresh
