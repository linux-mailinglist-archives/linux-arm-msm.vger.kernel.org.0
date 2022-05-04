Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D23951AC27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354663AbiEDSGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345764AbiEDSGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:06:07 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D064FC78
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:21:20 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id c5-20020a9d75c5000000b00605ff3b9997so1341797otl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WCQd0BEkr2350zVHaq5lFX9i48jak99a6vqhtPevMLA=;
        b=fEKIAgKrPc3/Mqs8Fm9yoZwBQC9zu/F7t2r6+oEyIkgkGwg0jOe5SfeIj3DMsa1Up7
         AoG/M4xa9coTvnuHJYFlvQ5IAK0RtIqEa23aODajOCTQpz33cjKnwL1n/xLPwXbfd2Tc
         FH7r/sG/zdt1tSZz6uEZFGDQQnewvhfkeTNXe89i7/Sng2ym25yxlMiLVi7hgWB7g88i
         6SrQZpvy8JBBd5a3hAVgTOSMmSY4EhPSXgLuXcBaNCFWHRe3qefcLhTCSwGFZxpBT3i6
         M//ch3+ztRLkltCQQS6j2gkEWWRBj4UrdPi7nSEEmvSingrvRtl1GJ0cVF2XmljbkbTA
         OGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WCQd0BEkr2350zVHaq5lFX9i48jak99a6vqhtPevMLA=;
        b=GtMlwa3clfP0wtgMEHffA4N6qsDAtNi0nH8pfJwIRswaA7gy7CvROFcfU4ZGgBdEBN
         R/jztott2bbNz/AHYxF6ab3dVgXqKBYTSvKVYx7yb+ogYE+zQEMDWVuxNl85A3R9gVO7
         8xxLTCrHea1G9ZJDj/cbMFg4xFjDogfuNHSqzUwlNfR6d6qbhywCQ0tFwYDWvZFgMeaW
         GO+0VaHkyQ8+ElJH1/xVa64aXGXETaq0xtbZ/hD5Xq2gcNupzpUMHdqKBzF6LOGt4GpT
         64UWvb1QqXe8EF2QaoSWtzN+5KjMq569zf7yAv1tFD1txz7swqvzogiGdpPBEP9Q6QRe
         5DGA==
X-Gm-Message-State: AOAM533uD7MqqlVXotthTTVJmvrIHRIsnoDJJllHSh2W8UF9ncO2E80d
        lKN1g+7wJM/OL0yKWMqqq0O4CvNlldIcmdlU
X-Google-Smtp-Source: ABdhPJzYJ0FPCVUpXpj95XbIPDCcfuiWkIiq8GSf0HrRowwPJd5pm70bchb1f7meCo0CrJS5bAyQ0w==
X-Received: by 2002:a9d:6956:0:b0:605:fcae:3240 with SMTP id p22-20020a9d6956000000b00605fcae3240mr7564614oto.280.1651684879703;
        Wed, 04 May 2022 10:21:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870b14700b000ead8b89484sm5785452oal.5.2022.05.04.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:21:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] clk: qcom: smd: Update MSM8976 RPM clocks.
Date:   Wed,  4 May 2022 12:21:05 -0500
Message-Id: <165168485226.3730817.8622970582930057500.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426090226.27293-1-a39.skl@gmail.com>
References: <20220426090226.27293-1-a39.skl@gmail.com>
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

On Tue, 26 Apr 2022 11:02:17 +0200, Adam Skladowski wrote:
> MSM8976 does not have rpm clock named mmssnoc,
> instead it's called sysmmnoc, drop define and reuse.
> While we are at it add XO clock to list.
> 
> 

Applied, thanks!

[1/1] clk: qcom: smd: Update MSM8976 RPM clocks.
      commit: 665ca429bc4131f9165f119ad3ed81c786bf3262

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
