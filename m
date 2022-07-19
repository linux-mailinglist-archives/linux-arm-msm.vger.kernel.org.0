Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2776B57921C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 06:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbiGSEsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 00:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbiGSEsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 00:48:10 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4DC3718B
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:09 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10cf9f5b500so28159330fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Miz9syEFJn7QliOMjPkvrAypLemtj44SeEriFNdhzo=;
        b=EMagCCNx42JY9bLMeQky5VTtCcgB5ZIrZc/o2b5Nd47Z2D/lqhLpuJYt3iK7C8fz2Z
         +huY50jkXhQi0LVOT4MCbDSIdMsg4hzwOuL9WzcN+d1tG8b4OVvCoWZnall6qRNtCv2T
         jJ4o7zyk1yvwW+Wzby8QFUH17cw3B5CH7cAVYGVSwBw/yWp2eaPh0eDHGiQOQKvNoTXo
         QyENe8OrA+yYZXK6BMadEZ29xnOUubaDDQREGm3iIPQ7ac0TSkxYkUmOrbo4AGgWZYL/
         vDoRSQEHcWoJ1AR3IJsbuPJXCQhKtmxeqCeCeTTFvESkppnYldc5i1tGBZmq39j1m0iZ
         CqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Miz9syEFJn7QliOMjPkvrAypLemtj44SeEriFNdhzo=;
        b=4Y8SxPmAPqzyIdUdD8IlGxhNDZ9YQ7dlIf+q5b9iV0U0Bu2wRLLvU28upPIFnKZTFx
         z7X/zoSlrO90Gf4rCzqEk/gZTg/7A4tg2+2q/GBs5GMQsylxxMGbcCDA8jSPqYuiJ8js
         VOEYRboqNilO7Wt3AN3xgddqQwKK3W5LMPVSRzC4Ay1ERa93NLkepVIvARTyKzLIu61/
         hByPm/Dj+bGLa7vybq1YUqWrU67bgZ7K07I9XJng0Bultb1VvAmH9zAddbFA5SBSSHLZ
         Kp9gG7oxFqCOzWg8uD95XpT37tDNuKZ3PK2uCmABnsq5F64SiuoTRw15LfLlqNxKpK57
         iXMw==
X-Gm-Message-State: AJIora/5sxcwpeo3R/FRJyI+N1iyf7B2YVCJaZvnoYpHR/1/3NM5rdk/
        XsR0J8KZwnrpjr9QHA+m+Bj9qw==
X-Google-Smtp-Source: AGRyM1tsSjfRTUVstZHZ6U28OsKodWt1hi4Twskm2X3hpdboUZvvg/D8U0Smg+fRxOLk2pe41UjoCQ==
X-Received: by 2002:a05:6870:231d:b0:10b:7a0e:1be6 with SMTP id w29-20020a056870231d00b0010b7a0e1be6mr16000377oao.114.1658206088532;
        Mon, 18 Jul 2022 21:48:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, ansuelsmth@gmail.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH v2 0/4] clk: qcom: Drop use of pxo/cxo_board for rpm devices
Date:   Mon, 18 Jul 2022 23:47:56 -0500
Message-Id: <165820608074.1955453.9110920777524045791.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220706225321.26215-1-ansuelsmth@gmail.com>
References: <20220706225321.26215-1-ansuelsmth@gmail.com>
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

On Thu, 7 Jul 2022 00:53:17 +0200, Christian Marangi wrote:
> Trying to convert every driver used by ipq806x to parent_data api, I notice
> RPM was still using pxo_board clk.
> 
> pxo and pxo_board are the same clock and are defined just to handle old
> clock definition. It was discovered that rpm is the last driver using
> pxo_board instead of pxo.
> 
> [...]

Applied, thanks!

[2/4] ARM: DTS: qcom: add rpmcc missing clocks for apq/ipq8064 and msm8660
      commit: aa7fd3bb6017b343585e97a909f9b7d2fe174018

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
