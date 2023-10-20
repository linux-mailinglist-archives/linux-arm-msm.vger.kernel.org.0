Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D227D0937
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 09:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235632AbjJTHJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 03:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjJTHJx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 03:09:53 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1807D4C
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 00:09:50 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27d5c71b4d7so1257854a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 00:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697785790; x=1698390590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcNPWYHZsV1jl4Y6m712SS9BEogduv8nGwwMCSKf3jc=;
        b=MVcyaPq5vwEGkbz0OxE4C2wShgo50AIMusLupnmjKwa0fJkJApLkKodQc8QHnYqp3/
         XFtEB/OV61TH0+3t0O+JOTpGLJbOn8zSXbJs3vHPpRiPt8hbeJLZs1xX4ew8v94ZKagl
         9yPwibQFin8xZHp+FkXeB/BmqFWaRIAFJ9BErkab6xxIQMWb6kCj4IDJZEPzEAbVwKdc
         OARsNzbYtvyCr1uLOguJM63TaU00HowTIBzVQmh1n5fpYcSd2EmURshAzyFLUpc6GoSi
         FrDi4q74p9qFup3PLmxSr7FqCOpstSxANN/et4csZUTq42zPb4/yDJBOQMESzxi0pcv1
         eIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697785790; x=1698390590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcNPWYHZsV1jl4Y6m712SS9BEogduv8nGwwMCSKf3jc=;
        b=e228e/QQES0ByBcP8VDFT6BuVm9gK6CwCmIigp5gMUbRiaOQXPQH7DPxvJzmsGuNLc
         eM1/xYOf7of35Nf7dSHyKgxdpG+z7+tepJ7H6E3RvRCUHYnqtd+b+qDOrRvzzP6NgKUX
         VARSUIzJ0dh5hNDhSEyDg3M/IpaPyNKi/xtFY+C+6FFNb3GLifs4CbQ9JOXsUZvYtv0p
         +1jN+7TP5aZqbH/HP9I3oZvUzGgewUd2FP52yM7wZzCeKxrLRy+lNn/jD+xee3u0nPmS
         8f7Pdc4OHuzCK5s7IsNxsRHguqgMuLoa5AM+5naG3I5kMnBxOWSetyhepqtyC5/8SPSQ
         Z2kg==
X-Gm-Message-State: AOJu0YwD0Zd1xMb6dB2uiUlsQOGUYmRzppgTySal85TUh8nvxjBw2slF
        /0FRsvHPXQ/LoX3Nku+tZk2MGA==
X-Google-Smtp-Source: AGHT+IEGbSTpFO9vjBNdmRVUt1VTUISUjGcuoWitbvQsLR23qQQ7aO6ak2oavK26Yyl9K+kiLs8tsw==
X-Received: by 2002:a17:90a:52:b0:27d:237b:5592 with SMTP id 18-20020a17090a005200b0027d237b5592mr1623090pjb.13.1697785790342;
        Fri, 20 Oct 2023 00:09:50 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id bf15-20020a17090b0b0f00b0027463889e72sm813515pjb.55.2023.10.20.00.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:09:49 -0700 (PDT)
Date:   Fri, 20 Oct 2023 12:39:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, ilia.lin@kernel.org, sivaprak@codeaurora.org,
        quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Enable cpufreq for IPQ5332 & IPQ9574
Message-ID: <20231020070947.cwigtaa2haij56hz@vireshk-i7>
References: <cover.1697781921.git.quic_varada@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697781921.git.quic_varada@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-10-23, 11:49, Varadarajan Narayanan wrote:
> Varadarajan Narayanan (9):
>   cpufreq: qti: Enable cpufreq for ipq53xx
>   cpufreq: qti: Introduce cpufreq for ipq95xx

Can I pick just these two ?

-- 
viresh
