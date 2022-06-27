Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424E355DF48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240810AbiF0UDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240807AbiF0UDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:19 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF9F19C33
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:18 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id q18-20020a9d7c92000000b00616b27cda7cso6554273otn.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ItqEu+lAWFywVj/7Sp4uH56FVniAGH7QFEwGCURs750=;
        b=qpbOrnDDCSeOTeUMMOhi/+Gpih7IavGKBdKTPC996619XvZLRfxMFfNKZtkid3rx2s
         fPMqtC0JQoyPri1hKDi6yW7F/q/mmD08m3hZXctogXAvxK7CBO+FuvMTVCoin5dp9eom
         qvgO48HC/f1cZwRr3agSIoyIIL7jXP4haenUVQtMg7rk28yPnl6YhlE7NwAuk9cz47gf
         c8Nq30XFxhIzhszThIuYS6dEGz65hFw0oGzgjcDplwd9qlkrkrUf8qtKntDDTQqiLcei
         5ZCG46tvZGNCMagZO+HIEKOjb01uQAj/1SclumYWb0Se90Y5k1mRyStBOwosbWJqi6pY
         SukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ItqEu+lAWFywVj/7Sp4uH56FVniAGH7QFEwGCURs750=;
        b=zUkG2Zm6vtBi1FnT5/rpl8EkXtqYeOKNr+07mtzDPYgw75ClbwYm76femDZtj8ZSXd
         ZF6KPXruZ9rJ8rH/nGqPazFPjaxh+kf5fWzfCrYGjvALJ/iob50CqVx2aZmZTMf40ipY
         mjab67u0Siu5Ps2QNsWAX7rNviSl0IaqrA2KuxVCvJMnMPhI2Z4pbTB3ZeNvEAuRKEDj
         i91ewbsDKqGQ1uj0scm81rfo4YrXFHzI1JeeG0fBxRAcX4ufE2eaXGR/SeKlriYxA/k+
         xN+ex6HKquQECBTbjlcZj6fIA7WbZB/ym9OJF2jaEojQX4gQVX8/wsl0Y9/hVNCQ5oiU
         sw0Q==
X-Gm-Message-State: AJIora9lXIuKOM17zqss1pU3mAAsJ1BOII9Gl8Fv3XpfOr+v/U7SLcrB
        jtl/zRFPR3gDd2AHaRsSIkFprg==
X-Google-Smtp-Source: AGRyM1uZjewcPz1q7uEbPg0Nk6kk17VoeOQhYespe3p3jGWG44ifdwVQS65I00wjnjaMborxq/j3rg==
X-Received: by 2002:a05:6830:6516:b0:614:d633:8b9a with SMTP id cm22-20020a056830651600b00614d6338b9amr6457412otb.137.1656360198251;
        Mon, 27 Jun 2022 13:03:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        matvore@chromium.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: (subset) [PATCH v3] soc: qcom: socinfo: Add an ID for sc7180P
Date:   Mon, 27 Jun 2022 15:02:39 -0500
Message-Id: <165636016347.3080661.11368001720445085919.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220523085437.v3.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
References: <20220523085437.v3.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 May 2022 08:54:57 -0700, Douglas Anderson wrote:
> Some sc7180 Chromebooks actually have sc7180P (known by many names,
> apparently, including possibly sc7180 Pro and sc7185). This is a
> sc7180 part that has slightly higher clock speeds.
> 
> The official ID number allocated to these devices by Qualcomm is 495
> so we'll add an entry to the table for them. Note that currently
> shipping BIOS for these devices will actually end up reporting an ID
> of 407 due to a bug but eventually a new BIOS will be released which
> corrects it to 495.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: socinfo: Add an ID for sc7180P
      commit: 0f0eca0ccb9b37743466fbd1b388a04ea0307b89

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
