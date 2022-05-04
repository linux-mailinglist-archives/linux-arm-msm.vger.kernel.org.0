Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A0751AC16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359657AbiEDSGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357996AbiEDSGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:06:09 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D386E5004C
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:21:24 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-deb9295679so1845174fac.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g20RKBkr8AbgrotE60QsDG+nYEZIMd4FLsb3XNu10DQ=;
        b=U1ySGV80Z1aMt5EdVV4Fl5RT6/DF5tCKSn2etEbID/N9E7XY7QiVDfC+FP+9jsD5bY
         SHZOmihM2k5697HRpxHumk5CzgpBtCexVm1frLBBmwDsMXHt5a6TUVWopLzOvYq3A6Wl
         746XQtm9JOMhBEwMR7XcD4OmLd/8q4VbawCwjDJSWQ8OrHT1fxNLyYSzr/hz4JyNoNEZ
         9Ac2xGqsBG0sA1fSwp4P/O1gS/ISe1Eu3k4EE99P8P+9v10+6xfygFw6Mjh0SRlQZayH
         4Ux0/inq1xUS7LQ7tshpJ2ei96oX8cz2L2/leT7ZaKAdyPhKCAH46pKvas2UT2cNJsh8
         IRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g20RKBkr8AbgrotE60QsDG+nYEZIMd4FLsb3XNu10DQ=;
        b=XBcQ58UCW9sYshG3IxEyGpsq7YbKOGtadlPFa18LDIqnffN50R0/O2oMq0LVLWu9eT
         nN6/iZbwSQvHP76M6ftDeD16iDYop1ot9rDNM5Qnc2JoKqcfyxmaHWCgiZp9o8o6rv7q
         XFoDz0WCR7jBROC1ZJynxJeK1XH8XOTZwR0tsTzgDZ1NldR7GbqtDKCIEUkvVcywlO/w
         ANFL+Hla3C6urQgkxpMOY6ikxvzWTZpnaCwtFkmXQEYH/mrw20Z0KCW6KPuRh9yJ8AKQ
         kvAT/72K0txmQUk5kmoMnlOjdJbA5H/KcGxgeDoYU6yIrCCkSQxJF4f4RoTyEt0fPlty
         7ARw==
X-Gm-Message-State: AOAM532vna35rm9xqbn0CeoOOr8XNQUNBG3w239EeBxfyPvgAudnxXzW
        hJiFcRogQ8N2qYXIrPfbQF5+jA==
X-Google-Smtp-Source: ABdhPJxT/TElpFFXuSI5imiLwTiE03GxZwvqKtL4NJ3Q4qHeQMgcFhUiJGPL7xYh8zpcNcfRq7+Tjw==
X-Received: by 2002:a05:6870:4341:b0:d3:1412:8ecb with SMTP id x1-20020a056870434100b000d314128ecbmr279546oah.36.1651684884203;
        Wed, 04 May 2022 10:21:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870b14700b000ead8b89484sm5785452oal.5.2022.05.04.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:21:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: sm8350-duo2: enable battery charger
Date:   Wed,  4 May 2022 12:21:09 -0500
Message-Id: <165168485227.3730817.11054396953890266429.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207231736.1762503-2-kaperez@linux.microsoft.com>
References: <20211207231736.1762503-1-kaperez@linux.microsoft.com> <20211207231736.1762503-2-kaperez@linux.microsoft.com>
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

On Tue, 7 Dec 2021 15:17:36 -0800, Katherine Perez wrote:
> Enable the relevant qup and I2C nodes to enable the battery charger.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350-duo2: enable battery charger
      commit: aadc48f7c4ecd11b4fba7ba7d5ed1788ce32bb78

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
