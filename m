Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70089578DD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 00:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiGRW7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235264AbiGRW7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:21 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0800286C5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10d4691a687so12575992fac.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQNKQg4/4rlYkT0pvrPfSwWDA5R5vk3Reis9j7ygfZ0=;
        b=mproMcYTqqfOtVnyqO37xGLVGbOJIBKxs8FZcEi6h8wY3JGCHOOZTooWTQx9upJO2E
         IDg062qAL1wLGfs0c27XOt7v8Qczl1dWm6gUTlF5hLxdx47uLoFehZZd4NPb34TeUD4E
         BsnXqcTtK2Gr+gV+szOatzp4c8XvGwpsYhVKsQ3+5747FIeXAgjyv3IdJzSFua8fOc9B
         iDTYG9j/xVhBWYZ3T1i0+f6V/Meb/xVvCsiyP7YML0SP8RYiuSc8mHpvf68uliDYdPkI
         ayvs0MOMVCcadH4Cvme7Dk9eUOjztC5shPXtUqvPvQkX7LXQEu48KOldhNK5jAEQI+Y7
         xLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQNKQg4/4rlYkT0pvrPfSwWDA5R5vk3Reis9j7ygfZ0=;
        b=jwH+EZ5p+o6EjKHSbbyljGiBf3Ajw3S4TDmiW01WeR1pNsy49lw4+Hp53AR+YE/eGH
         CT5RiIUdIJvJg/BoTV9yNimA3fyQ6cF1bXxPH2f0axSYxSAg99DM3NiKcbTqTUXVTrfW
         1tCmK6y4O/I6quOppVCADpCojcq9sLBnm3rPZesf3LLuMwGlmlgU7SljDDsuauTPlP77
         9KpYYypjtGsiFiakpct7HYjZkOQBp18BKTty1hYi5RKEuhTUocJYuZiAk6segXclEvB0
         LWaC0jdysI9N5M/F4NkWEEGgREG+TEXHW3/tqrIVVhl2jKBinKqhPM9wl8ObKV36I2Kn
         h1kQ==
X-Gm-Message-State: AJIora9r1h5iFhmc7RNqE2v7hr2pN3ap65ZD8ZRi/Urk6S6CHCNOndTp
        yWnGTR0xQEAqH2G2CmS+5ePN3g==
X-Google-Smtp-Source: AGRyM1sYrhGIP2I3RKA0sIjDmB3B4FJ2ovcm9+EUBuukF3UC9eAcuhovugrFaXOPgYXTS24tMAJI9A==
X-Received: by 2002:aca:f00a:0:b0:335:2675:aa14 with SMTP id o10-20020acaf00a000000b003352675aa14mr14870356oih.206.1658185160393;
        Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, konrad.dybcio@somainline.org,
        mathieu.poirier@linaro.org, dmitry.baryshkov@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
Date:   Mon, 18 Jul 2022 17:59:05 -0500
Message-Id: <165817634387.1905814.7290372787603141520.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220704162202.819051-1-dmitry.baryshkov@linaro.org>
References: <20220704162202.819051-1-dmitry.baryshkov@linaro.org>
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

On Mon, 4 Jul 2022 19:22:02 +0300, Dmitry Baryshkov wrote:
> MSM8996 follows the rest of MSS devices and requires a vote on MX and CX
> power domains. Add corresponding entry to the device data.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
      commit: f8272a502d601d74aaa21c35aa73904bcbcd6b84

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
