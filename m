Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E85578DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 01:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236468AbiGRW7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbiGRW7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:43 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21562CDD8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so10461089otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drVbYFCYCk/XQG0CX+PIBYqM5tVWSeGrCuK4ayZqjI8=;
        b=yvGhiLU6RqpjMMCknxnSJ4gPB/3V30LSI22dDmEfoSyfDUMkVNG/cFgEEUQgvOR0K6
         kCxonVamWXjxv/EQO8Pdr7A/LerxgRtRrPGuv+Tic4VNIduA1AAYpsus5dS/TWmXCvjr
         cIe5b/c30qLa5ogEJIVYVCj5BFpfi7HUNQo98kJ0dAWvRyEQmdACp9l9+YaUcE/aFqE8
         U5inOmYED1Dn4jC5ZYC82tFSgM7u0UVzmtS4C2xkMLR87jhAulmy0Q+B6qsqEZFuwzcc
         snZQ/RzovSogVtsH/enUNzCBWGLTvqhNtYIjc6EanR09lKx7WdJpaLlnbY/Hv5L6R4PI
         wT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drVbYFCYCk/XQG0CX+PIBYqM5tVWSeGrCuK4ayZqjI8=;
        b=xm6R59E82D+rZWns7lkjh5oXI2pR25fNUtCVJnal6aT4cUJ9OKXyf0VIQKZQkHNq2G
         1B1U7zPcA2XWgz9UusjKO8e+UoS7U3WABF3NZ0/5y4+kp4BFlJRmU0PWikhdEK5eZ5ex
         pAUVYqqdvDphe7JJzWA3EcP/u72zdUIcMeTu2MBlmyxlw/GznfstPZpOfEO4o5XG+Ygf
         6P+ai9+txQReZlMPzvLzEtidSgUFV1KNMmeaR7f6dC3B8NMC6nW2WpoTZZNNMEk1FgQA
         YpbyA8XjsNJjLY8YCq6LKKH0QezynCNhG6ILLB1CVWWp5Vf7phypTievngrOxshVpxRm
         0g7g==
X-Gm-Message-State: AJIora9F93T7SK2KU4XRLseonCiZsrgAa9MnWW+UBvdDQ2fWjYyTqcl3
        wlKJWLr9YCxObeLKqZ2G1KMShw==
X-Google-Smtp-Source: AGRyM1sJO6vupjFVRGWI2o1CliQD5fT+a760+JSu3pSoDFN1qKMkU5VMw6APLkhmLazAFfY/ndPYbw==
X-Received: by 2002:a05:6830:44a2:b0:61c:71ad:b7f4 with SMTP id r34-20020a05683044a200b0061c71adb7f4mr11009629otv.290.1658185167338;
        Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, quic_sibis@quicinc.com
Cc:     linux-kernel@vger.kernel.org, mka@chromium.org, agross@kernel.org,
        sboyd@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2] remoteproc: qcom_q6v5_mss: map/unmap metadata region before/after use
Date:   Mon, 18 Jul 2022 17:59:12 -0500
Message-Id: <165817634386.1905814.1933035759281220435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1652248625-990-1-git-send-email-quic_sibis@quicinc.com>
References: <1652248625-990-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 May 2022 11:27:05 +0530, Sibi Sankar wrote:
> The application processor accessing the dynamically assigned metadata
> region after assigning it to the remote Q6 would lead to an XPU violation.
> Fix this by un-mapping the metadata region post firmware header copy. The
> metadata region is freed only after the modem Q6 is done with fw header
> authentication.
> 
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: map/unmap metadata region before/after use
      commit: 8808fc4008e3bb70bfe682c41d8c0d8626d1ec0b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
