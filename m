Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF7D5643C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbiGCD5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbiGCD5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:01 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8C5B1E7
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:56:59 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id h65so8909694oia.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9T2lwnVH55h9CYBqM6rpV56oIm+mlofpd3D+2E1rsdY=;
        b=tdVyOYWjdSshwDY9QsjVS9cKlUsbWgo3MU5z8jmz6iOqo1QBc72X4ayUm9BIOZ1zsO
         oTHjxLKJS7+ij+6UaaAZLEE8DVGU9s17a//J9O+aPkcPPLbSyH7pn9uou237ROrr/eWZ
         vCIP67N2bgQShZERbAA4elU9ZVTwHb2IskRsQHSH+fuE+k/2UTcZHQMBcHk1ChE1afRB
         G7JHsGZQ8S3C0Hoph/3Ev/K/ZjFbeI1vh/csQdf9g/5jd9VgOi3hWjdNKGuNqjWJqrrn
         86uxhILnomCUMrZkd/K2dZx/qhUXly/CjFXBfT1A+1RUokNYdAk+/IRtQhLJeb0tTkCJ
         zj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9T2lwnVH55h9CYBqM6rpV56oIm+mlofpd3D+2E1rsdY=;
        b=tM0WMTVftvXLq2jM8vG/OOM866YmeuRpu4tcKi9hbUL3LmmA5V8ki0tOEsDUzNn62X
         9mLOoG0iz5dsCQpXtTrx2T4RgWB7hD7D8t5m03lRK2doXeaZ77wAR7MCblF4aocVND+p
         KU+57lMFjER1LzpwdEJDWHhulg3CBtFyGZRKeWCh3ara6PbKKbBHNZhmFgWtXnLHb11+
         /YtZ3+gOsl2Y6qhsG6g9j22RghKvDrjF8dtvD56T7GotwlDd2g4Y7KFXvlek3F78UyCL
         1bGtqHMz7YyQb4bxykd9LbgULCA0TNUFUZmdvV1dpGkuz7A3UiS+ww1M3+ybr2XHqa2W
         oP4Q==
X-Gm-Message-State: AJIora98hT3mct8IWBntHu2eYN+GPj7zTeYelvIIY0dvulh947awyn0v
        Bdyq1bGQH9U2NYtd4H8H3kgrZXvnqFYC1A==
X-Google-Smtp-Source: AGRyM1uyCfE3JSw8QUmb1/1Nli0C+ea4iSnK5WY+auiVZiB4FTx+j0Ci/EykXERY3fAuM5f97zbaAg==
X-Received: by 2002:a05:6808:14cf:b0:335:3595:c62d with SMTP id f15-20020a05680814cf00b003353595c62dmr14694149oiw.88.1656820618995;
        Sat, 02 Jul 2022 20:56:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:56:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vinod.koul@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: qcs404: fix default pinctrl settings for blsp1_spi1
Date:   Sat,  2 Jul 2022 22:55:55 -0500
Message-Id: <165682055969.445910.10093580812733180672.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220611195713.131597-1-andrey.konovalov@linaro.org>
References: <20220611195713.131597-1-andrey.konovalov@linaro.org>
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

On Sat, 11 Jun 2022 22:57:13 +0300, Andrey Konovalov wrote:
> The current settings refer to "blsp_spi1" function which isn't defined.
> For this reason an attempt to enable blsp1_spi1 interface results in
> the probe failure below:
> 
> [    3.492900] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
> [    3.502460] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
> [    3.517725] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
> [    3.532998] qcs404-pinctrl 1000000.pinctrl: invalid function blsp_spi1 in map table
> [    3.548277] spi_qup: probe of 78b6000.spi failed with error -22
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs404: fix default pinctrl settings for blsp1_spi1
      commit: 2cac6baf0249cdd3748128f3196c2d203b06a4af

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
