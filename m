Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 866915773A7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 05:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbiGQDIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 23:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbiGQDIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:39 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DC515734
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:36 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10bf634bc50so15635446fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wxd2A3vrqrJp4uEK24rDCH8u8KrHdEc+rqmRMjv5vsM=;
        b=Oc9y7n1wSjfxlcoagZApdGWE1393wVgJT4hc9QksVRQtYvaM08nxFgkXS0wO3Yp2kq
         aaO6CxsHe3IYzp3UA3chNVvvELw0eU5Y0Mc5U6jT9GRlcpleoFfS8GNEXfRWqcArn/gP
         G4yGzOTqPRVEKg0Fg5wtAq85QLOBczkrpm/yGY54GKaoIPD2mibsbkG+TZGKMO/a6oCN
         TrMQhR7RDJxq0XdyzAF1GywzpOhZcfG4tz3QpDxKLP0nbCIFaq4Jsa3uKiRVYt7E8rV3
         MXKURC0wrxF5xMZu81b9P/PcFFgCWoFmp+GI9a+MUufLiHU/vI7LJuSWihp7S/u2pfKZ
         Wtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wxd2A3vrqrJp4uEK24rDCH8u8KrHdEc+rqmRMjv5vsM=;
        b=0HVRZ2RsIs6h/DikxYXreYc3xgusu4Goz/Qg1OV1HnhOvK1u2Lp0EKcQwauecLL2/J
         cuPuDUSTW0VkghHBrXd3lRU06UzDljJd9UFm1EkbEOgwAZm0gpu6d9zGpuJg4x6s2Iki
         IAS1MvbQmlVpubzjqHWMWnz7uLpM6FUfi7ElKeYGNDeBa8Dw0t9xZIBYrLiSI6eCyQyK
         95AMFyquBKZPWQVtWQucnq9sbJsLnPX2oqVkj9kmoYYqoBh6ybCcjcqIUNgPFs7UUTBU
         I5RGtWADlYrAB52co6MepL/XwYI56OmVD95Lp8h4C5TS9dvhLM8YVNvZpsrFodhWr8R+
         jIhA==
X-Gm-Message-State: AJIora+qeusiLwsgzRetqL6UwTJgwoLbyUqnxn/0f5wddvfsrBZyb+4m
        GsVRCUmblhRiTrVJgN9LzBZ6pQ==
X-Google-Smtp-Source: AGRyM1sGOKzmDGOOL3ZAxQHb7krIn1F6BElzw2dQZhH8qvgkf9bKPwpisj+2/yge8MsIM+PUE63T0w==
X-Received: by 2002:a05:6870:41c3:b0:10c:529c:3844 with SMTP id z3-20020a05687041c300b0010c529c3844mr10944443oac.0.1658027316429;
        Sat, 16 Jul 2022 20:08:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by default
Date:   Sat, 16 Jul 2022 22:08:26 -0500
Message-Id: <165802729676.1737676.7471723089108330875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com> <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 14:44:18 +0200, Stephan Gerhold wrote:
> The remoteproc configuration in qcom-msm8974.dtsi is incomplete because
> it lacks the regulator supplies that should be added in the board DT
> files. Some of the msm8974 boards are currently missing the regulator
> supplies and should have the remoteprocs disabled to avoid making use
> of the incomplete configuration.
> 
> This also fixes dtbs_check warnings after moving "qcom,msm8974-mss-pil"
> to DT schema, which rightfully complains that the -supply properties
> are missing for some boards:
> 
> [...]

Applied, thanks!

[3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by default
      commit: 8d8be8dd7c1f5d50f84ecc7a6a41962da48c6164

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
