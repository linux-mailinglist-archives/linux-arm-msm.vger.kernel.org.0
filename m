Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF99755E1E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240870AbiF0UDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240807AbiF0UDZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:25 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2210A1A076
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:25 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id y77so14357632oia.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qSpR2jzW7JjPc8Ft0ru7AA4YFOPdrEPlWqwFACOYDcQ=;
        b=pLA3DyCgOcXc+A3oEM1XWKBSFlCHa5T8OhgSrcGXCTRflFj0jwdE135Aki93Xc+AHE
         XWXmJlSVSdM9nLufkIAEeapd2ekvFuZeug15934WOX1tpTyN1X/QN1Bo11s3YZSQNegJ
         mBF51kYUbPOPo3CE4xpBmNnXzGEQmHxR4MJ0ug13x4Ca961VaPQEN2n1AV06Q/2QyeU0
         M4/zX19qwkMQEYUTCqSMBcEuy2vuAMRFsF+uBYN51VSoyV97p9N+3W8t1gYzqgSNLhls
         aiUtMM93Jc9nj5+WdSz0mxc/FOsBCkgTR40F75dQ43/23Iz+ps5Y9/BeZ48yBr6a0riC
         p5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSpR2jzW7JjPc8Ft0ru7AA4YFOPdrEPlWqwFACOYDcQ=;
        b=cG8DR3OHxSI9K3viMxmLXfWxjKyySJ5zfSno0acvvxnTCZedd3HjDfqxLX9YZ0vC+R
         8VLRUZFco00Sri1wbuvNxO6ztL+QFNBbt5kiMphjUhz9mg8oVPUNfWIc16r3mlx3wl80
         blg9CMMf1Mvcq4Kl0RpoInUGYgmwSjve9GznLeNRUZLdSVK4rYIaFrsrWBpIxsIcC4Ak
         VoYtTQolX4iy0yZLUJgw08knVzfdNtZMT9+BozJ2O7TNNjoESS8+kPLYFVHmrKA8SqoS
         ojrIoGY1xj/UNTLrtlXfW7XTxxQi3DJ0dTUd7MvwX4/i95pjWbjx6d31bfBLWDCGNdAf
         w2SQ==
X-Gm-Message-State: AJIora8GIdlkzRNirt7nAjdLmPEgHVJl2B7b3bL1efSPSD1Yf9W+srTZ
        LnWGmkvoVWsNoZKTo8CFfdQIfg==
X-Google-Smtp-Source: AGRyM1uHq2vdlXZzpakPJ9AuIsPJe71JpjdoSfbL0f2OpgpUm7tuppjIps5kR6W+OERbWgB0EkX6DA==
X-Received: by 2002:a05:6808:191a:b0:335:4fdb:fc4 with SMTP id bf26-20020a056808191a00b003354fdb0fc4mr9371809oib.269.1656360204377;
        Mon, 27 Jun 2022 13:03:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC device node
Date:   Mon, 27 Jun 2022 15:02:44 -0500
Message-Id: <165636016349.3080661.4315237571182192217.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Jun 2022 15:29:22 +0300, Dmitry Baryshkov wrote:
> As we are converting this platform to use DT clock bindings, add clocks
> and clock-names properties to the MMCC device tree node.
> 
> 

Applied, thanks!

[6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC device node
      commit: 48aa636285ad76c7cc08d080e4c2a1fb955b9f11

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
