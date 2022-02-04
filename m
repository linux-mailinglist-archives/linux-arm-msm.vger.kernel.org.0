Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0204A9F23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377323AbiBDSfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377589AbiBDSfd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:33 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59F1C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:33 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id u13so9513299oie.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/cZJZVrfvZ4GnGgYmaqlk+D27kVsqvVOJSRqr9sTTg=;
        b=mo+2Uo47XbsKeEaajM6Z3zZP1NQeJSSD6XyNk3nw++7bqPHHjYUEPMek0gs5BeDFSA
         RloTs2XjrvQA4XNN8WS5bW2Q02Ek8kW1vbK+i18Ss7ywvqAVULLCUUVom2Dv5oq8IbSF
         Hh/n/zzkjdVGyF+nUp6E2NJxLw3CFIyH/rivTcpganeigOxF951rPw/dGud5Mx0HDFYF
         /NrRVaxoOMoMLHd0mOCJ4MZlSy76wB+QeD/r7Lf5ZJxBDr6xu5JGm/xzplJ1v9V9GRka
         6dG1ozfsCEdEI5YjCDF6aIBMs834wNYX24Xx5g8mLZRk9CJ0VlKA9jaLHvUkuN5LBup+
         hTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/cZJZVrfvZ4GnGgYmaqlk+D27kVsqvVOJSRqr9sTTg=;
        b=MTlBQcaEAgYZHB7Qu2L2cdnv2rELfneS8EI7Q+PsK4mhQJS5fSeoXxohVdY3wqIdO2
         7pAbagUrGhPcqERQywZogRwBcCz4nO7Cbis6m8lWM8vwP7fGMrAmH79gUzUKQyFz8y8i
         6egytHLxnPS1faxy2ejsD4HLtQ4WxOsNwF5TK+EtzkOjRYNzShFnrtNHBzof7DnlDz8d
         a16doUOlenqLryWNxLobX6aZzAiiPoslbHSdCTAmxjsPwAID7osoRG0b4XNfpc+UFWIO
         TPLjybxJgQ8LRpt5DciYrxPQGD3JFSlCAqJjeNymuBGeLOqvCDhIsMW8Ka0yZTeKxd6q
         XVSA==
X-Gm-Message-State: AOAM531Rmx3v+x8mCNVHAEBxoHfPqNREvNmI3vrpERSGbgVXE4drdU/I
        cqhw8tWSokiHL3Wa4qnSsalOcg==
X-Google-Smtp-Source: ABdhPJyjVZk70H68N70evpG7v9UmUyFeqtH0I+qFzIaYWSGsZROk+/jfU0kKgL/54sM00mfXzZEsiQ==
X-Received: by 2002:a05:6808:30a3:: with SMTP id bl35mr1987226oib.226.1643999733105;
        Fri, 04 Feb 2022 10:35:33 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] soc: qcom: aoss: Fix missing put_device call in qmp_get
Date:   Fri,  4 Feb 2022 12:35:21 -0600
Message-Id: <164399969245.3386915.1525987306636894432.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108095931.21527-1-linmq006@gmail.com>
References: <20220108095931.21527-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 8 Jan 2022 09:59:31 +0000, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling paths.
> 
> 

Applied, thanks!

[1/1] soc: qcom: aoss: Fix missing put_device call in qmp_get
      commit: 4b41a9d0fe3db5f91078a380f62f0572c3ecf2dd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
