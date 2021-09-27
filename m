Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6CE41A0A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237027AbhI0Uzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236992AbhI0Uzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:41 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8994C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so26236499otj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TFKvhiE+AB9qfToF8fjgV3vn5rkI1BwN2aBTOC7rP0g=;
        b=ZSNfa6iCbS4fzBxZmRTJqRn7ELViMB2f7l093dSIzr5qW9IPMmJZ+6FesWA95Gqr47
         fkcqPIExWFr2TE8NWl/MtOmb82GvAq1YHEXkODsI3hJXBq3C5t2BMcN4VMogyu3punS1
         Meo6/faO57BEkUygnKR9BPs4kLfQ6DqQzQkImtfYUd3i876shrsNhhsAXA9SfetuYkjt
         ztSTY4+HL5bpvD9UQLpUroAz1Dm9DQW7ukJBc0zkoHW8Y1EekOu6X9dY5OSXcax2dFmM
         psBu43QCe2gcim026abWyBc0xrNC+AKly619lNf7gc175swozSkPWKmfvjzEgiPr+ZTJ
         RbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TFKvhiE+AB9qfToF8fjgV3vn5rkI1BwN2aBTOC7rP0g=;
        b=3T3knN/J27RqgxAHXE4MJWY9iiRGxv5Moz2vP5SVcQZkHy26zt1irkFKnNwzFR7Nqq
         VEqcxCjPBFvqj6kcEFlyi4/yF3+nFLyYWxtj640JBASIb/6i1SmngT2nFUFRKQYPnE7z
         keaXSPw9I1gxhaOGd+RWgFhKTSxyAUuX3qcEaapDap7Tal8MmWhoNFGkDrqb+Nlp5iei
         A3tWcbSPSpUI+05Xwl5rX2Xylf+zeV6JqrN/l/3alqoW6oLLzzzroM/uOxkeqoIQOeyN
         s9Rbk5kKZyUj+9714Tk4PK6HmnSfk8Ho9LioIShy8g0jYMOBOVhujG8CUiFcVaNsXKHE
         Xfyw==
X-Gm-Message-State: AOAM532u3OcO3ykQ1AJzq+YG258ndd8t2/7Y2GJc5s4HDIHpKkthuAGb
        hFdYCJaA4nWtc6gXn0lhOhF3vw==
X-Google-Smtp-Source: ABdhPJzxVVW2nyxXj5hHBv9ombPY38ONZfSAFxh8yCgUCbhNlGgLS7RKZX1IoM789Tn3NahfduZuxw==
X-Received: by 2002:a05:6830:25d6:: with SMTP id d22mr1869247otu.50.1632776042306;
        Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rishabhb@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 05/13] arm64: dts: qcom: sc7180: Use QMP property to control load state
Date:   Mon, 27 Sep 2021 15:53:52 -0500
Message-Id: <163277593825.1470888.4619664022427752254.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-6-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sep 2021 19:29:22 +0530, Sibi Sankar wrote:
> Use the Qualcomm Mailbox Protocol (QMP) property to control the load
> state resources on SC7180 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> 

Applied, thanks!

[05/13] arm64: dts: qcom: sc7180: Use QMP property to control load state
        commit: 135780456218e98172f3bca1e1af4ae6646d4bbe

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
