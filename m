Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290D051DB66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 17:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442589AbiEFPHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 11:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442582AbiEFPG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 11:06:59 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233D66B092
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 08:03:16 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-d39f741ba0so7433811fac.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qc5WiAuUEgAI961Iey54vjzR4mT3/9jMiAzTzv9c9c=;
        b=LfwknCCI51KXehuorHmo1h4eZ1nDENELZBU4f/tT5YE/eL8v7tncH5SV7EevPZ/CMA
         BWMgC0PQHaGo+7pDL2ZKjnukpSA1n/+X6dGjc+bcK3z9ZMkKXzmn0UUzV7krbiNuA5ac
         FVnDanHoD3yDn6iZnjVoNUpuTJaO5gry9AQcjo+CtC8u5o8IYWCQTVCBRppoaHPodWWF
         6Yo4MFiM093odnhxlWpkebXupXMSnIirVHhpYJIkIB5j5kJsSwTtkR5FyZBzRry/lRAg
         r4nBBZxHicbk4eA9kRomTdeMtF9CzFBA3W3AJoMBljLpEPqW+6HQzXX7+h2V+BauXidF
         2nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qc5WiAuUEgAI961Iey54vjzR4mT3/9jMiAzTzv9c9c=;
        b=rvJBYeLXB6si2tGvP+HE0EsqxmP0Pu51vDWOzFJcZ3T349M4mqZ/n2aNPiAJIsLmGm
         glFgPsWBZpTIpEyX/gfU4vr3IzJkkYqWB3jBE4X+IZVhaNWexIAJNZu06xFQ1p/rOV2t
         c0nIMx/Amn21vGOvLyVCdj7561GogbNNMfo97nGs9pYoijcWMUGcrukvolT6uA9FudSj
         1oGjKOIgUOcAo/PWlNZ7PwrEzbw4ShUhjScia0odUU4HgUxbwrJT42z/qtgXWtrs4oNt
         VjG+DkHg+bNSc9C5b3Aw8GrVSw9OZ42XV9bhonjYRcD+gPh/B5IzWH9d7chtl58A3Lgl
         J6Cg==
X-Gm-Message-State: AOAM533krLU68zvC4Zh4pUpCinwzfICT9yEv6byKDFe9/Aq1aT9x0Xa0
        QBD5PSRqkV9+NvdPQlCwD0xRlg==
X-Google-Smtp-Source: ABdhPJzX1lmkjev1x/DxRJ5nX4fBig/x0JUfqjANRmtCN37kPJkEoPYJJfNHV/hHkI7PMNwCnj74XQ==
X-Received: by 2002:a05:6870:a910:b0:e6:dca:5fd3 with SMTP id eq16-20020a056870a91000b000e60dca5fd3mr1470161oab.202.1651849395476;
        Fri, 06 May 2022 08:03:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e21-20020a056808111500b00325cda1ffb9sm1665311oih.56.2022.05.06.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:03:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: sa8155p-adp: Disable multiple Tx and Rx queues for ethernet IP
Date:   Fri,  6 May 2022 10:03:04 -0500
Message-Id: <165184936433.73465.5859927977964785560.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220423195003.353150-1-bhupesh.sharma@linaro.org>
References: <20220423195003.353150-1-bhupesh.sharma@linaro.org>
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

On Sun, 24 Apr 2022 01:20:03 +0530, Bhupesh Sharma wrote:
> Fix the issues seen with ethernet traffic getting stalled on SA8155p-ADP
> board with default (or larger) mtu size of 1500 bytes, by disabling
> multiple Tx and Rx queues for the stmmac IP block.
> 
> With the single queue setup, the ethernet traffic is stable,
> wget / curl can work well on the board and no ethernet stall is
> observed even when longer netperf / iperf3 test are run. Also
> a performance of ~940 Mbits/sec is observed on the 1G link, so
> there is no observable degradation in performance as well.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8155p-adp: Disable multiple Tx and Rx queues for ethernet IP
      commit: 11a3f3dc2cf8d6127aae6183a69dcf3dde026305

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
