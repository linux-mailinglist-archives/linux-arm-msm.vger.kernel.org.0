Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8447D081B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 08:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346971AbjJTGHY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 02:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346958AbjJTGHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 02:07:23 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4CDD55
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 23:07:20 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c87a85332bso3717895ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 23:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697782040; x=1698386840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rVyFTHziGTZvXM8QOJKTZz+Wz/IyPiUmtA6+5uxh8So=;
        b=OM5USKmYa3WQ3pXfIhNnOJyQcwuPH29TXnv+hni2Ps6xhdriTnqGFZih0dH8JZ5Tb1
         QUXG7n3h+MDzOqLZkHcKpVIifUtNfQeFe1in0Rfon+wNr/YMrd6oUB2q5srqOtzOebwS
         K8faLngTUNFaeqsOvTmCT4/bCESPna8lZBaMoS9eAnMDVuAd93GvIkOWJWcfhCHIceoQ
         jRYzC+EunDkO6eKJhkrTsl3W6S2qYwSYGfWs0FTz4n7Iy3SJzJqBqrDafipibInbMbUQ
         5hVKr1HfYFanQHeBF+jSRs5DbdX8aggrMhqsjERi2nN17M517rbZHQ5/kUiVkYVCYUrL
         159w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697782040; x=1698386840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVyFTHziGTZvXM8QOJKTZz+Wz/IyPiUmtA6+5uxh8So=;
        b=N0VyncIiRbG6T3G1BoCtbQnz+w3tpAZkSsUdBL0ugs9HpjaGA5YPTlbiMwPrOMWlK6
         XL6dAWWr+Ky5mfGMSrxtT1/CyY+wGrC23g+A29eclVWGoKrU9SrCtSRNY4D5PouWkIG9
         wj7hHDbl2D9iASm0bPVszfp14Jymtow0NNsF0LokaqXNmRRn1O6sEOyazQ9mflNi7vyg
         AzmfpesS+i3ZkXFwbzLie/+FNaDUgMB7m+oPO5238ExExL+X23mbDYr2+dPk1fHrzFay
         GTR992yJBdJircViSPKzNoiin90JDHB23uVYFFg/ynJ5mvZ9NkDjZzrE3O3dUZl6GGsW
         slCw==
X-Gm-Message-State: AOJu0YzwdccWw/3MPz2EoPMF9zrREI/z7BfCuA9A6naNHmFvcmisTABm
        NvhtEtu6jAhlQh/dw3Xd7LGLcg==
X-Google-Smtp-Source: AGHT+IH0RgwQ4wA/3gxyRDCCw9MaaIp073BtAY+qdZEdtqbg8ac2ZJsTfZswsJbCR4mTxOlKwHHlzA==
X-Received: by 2002:a17:902:e5d0:b0:1bd:d911:2a85 with SMTP id u16-20020a170902e5d000b001bdd9112a85mr995121plf.12.1697782039899;
        Thu, 19 Oct 2023 23:07:19 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090282c900b001ca4c8edf21sm698038plz.170.2023.10.19.23.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:07:19 -0700 (PDT)
Date:   Fri, 20 Oct 2023 11:37:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 0/4] cpufreq: qcom-nvmem: add support for ipq806x
Message-ID: <20231020060716.53zzgxdk7lg4evb4@vireshk-i7>
References: <20231019105011.7289-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019105011.7289-1-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-10-23, 12:50, Christian Marangi wrote:
> This series originally added support also for ipq807x.
> This part was split and is now merged.
> 
> This patch was originally dependent of [1] but was later reverted
> due to compilation problem. [1] had some changes that weren't related
> to the compilation problem and were just a fixup.
> 
> This series include these 2 required patches from [1] that are
> just cleanup and won't cause any problem.
> These 2 patch were already checked and accepted by maintainers.
> 
> This small series adds support for ipq806x qcom-cpufreq-nvmem driver.
> Special function are required to make use of the opp-supported-hw
> binding by hardcoding custom bits based on the qcom SoC ID.
> 
> [1] https://lore.kernel.org/linux-pm/20231010063235.rj2ehxugtjr5x2xr@vireshk-i7/T/#t

Applied [1-3]/4. Thanks.

-- 
viresh
