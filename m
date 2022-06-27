Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C557A55CF96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240837AbiF0UD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240812AbiF0UDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:24 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEE51A056
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so5878910otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2m+YjUY0OjFth6xgTNB2uHzcRzoY0ie6eRArFGbQnDU=;
        b=SaZA7N6vdwUKla5aGKenida96tK5DPhUJ47Qr6K6tVy1oCH3rjGheW5qD0oyOYdGSk
         NH5rBzs+fhxxxoF80TD6BTYO1Py0NMxBvAupcp1SKz0TgoWyuoa2d+0wBdrxztp8y0mX
         L09p4J1mqrOxbuKFlFUm7bJA34FPh1NjJx4xE+EL+M1A86WIIW86REaqPdZQb2+34VBT
         mIYUDEiCcPpECRXZ7EoIyq6uTr3Y8I5qiKPCAJJI3T12TbygtErgwJgISRE6q4qk/wNk
         3bFHoLr9J5UR7G4h9UUy5azU4gM45fvgVXJGf4Bj6GjZhtYZST6lYR2YXMnptpFT7CmT
         Qn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2m+YjUY0OjFth6xgTNB2uHzcRzoY0ie6eRArFGbQnDU=;
        b=WHS40AzUuNeq0zHzAeIut9P1nw393yQXOE55GDddb+00Uk9rFU0w2Qnh6X2Q0FrwIy
         X+rDZujTjKna90ZVID8EKy7O7nmWt+kOJxOCTmFrlCFDRf2EvKHLneeJBALckRpJHSXB
         GJQ55y/FrJVq+m//HebzwQ1GMyADRrpIcrcfizzxju975U+w7BcdgLSiDIOJPmFFmr74
         CUSSp+Y4MHWJS5djQ3QU1t18GAqAa0kqQBE+s2IeBf6dt9dCMWJzeAonh/43Bcxd8qs7
         5NTjG7DxyFnHzGA+oovMmAzWB0QnSjmiqk/5yaDsCWgAyMDONWHK3+gaEYCcXlVF2P4A
         2vwA==
X-Gm-Message-State: AJIora+5pp7wMUV2m1jrwZ2O06qE3BJsZ3DZ1RNucreGvOgv4sT0EVLt
        8KGQGy5o+QnLeUlRXt3M2fDAGA==
X-Google-Smtp-Source: AGRyM1t6CofuMDpSUpV5PxK3z8Lhcfi4pL7TyzbMTvwgi6KHkjY4Jeon20ibFWqJn4VpisoIBauYyw==
X-Received: by 2002:a05:6830:18a:b0:616:905f:98d2 with SMTP id q10-20020a056830018a00b00616905f98d2mr6732151ota.358.1656360203197;
        Mon, 27 Jun 2022 13:03:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
Date:   Mon, 27 Jun 2022 15:02:43 -0500
Message-Id: <165636016349.3080661.15781429285446238278.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
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

On Fri, 17 Jun 2022 15:29:21 +0300, Dmitry Baryshkov wrote:
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
> 
> 

Applied, thanks!

[5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
      commit: e7c659124c9a031c48e2fecf72c849cb63f9497b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
