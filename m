Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065EE4166B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 22:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243193AbhIWUcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 16:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243195AbhIWUce (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 16:32:34 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605C1C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 13:31:02 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v10so11348113oic.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KfgAPoqNGuGt4SJWxFhDYx6cCrPZC3ApVgwyVQdWxZM=;
        b=ChnyOEHaPJ/TAR3ZO07ITYZC4dk5cWTX5CBxf2SKvotJ87MuYQxnsdyR18WVvEE9Th
         xPVsA7CaQS+LgHHk9HKRqKp8G4wSZgdIYqoyU3hpoQ9oPA8fZfZm052PHIFBMfK68cvH
         o1KDHflaL6+bP6jA3y+obR9KV/z2auTeSasdCQNKP7KBrDtJYxluXhr6uiy2NPkbtN4A
         0sfAo6J8Tx+lQGBz7615tJZwXNIU2FYrG+bIo7uY6qIp4FJlJd6W1xDVD/1t3/zuC5yc
         IczFJOvaSfuSAT6sW2My5SNi5J8QyQ1SXBQXDQbuBpY5oICzeC0bWGnX1KPx/nLjAvbo
         +AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfgAPoqNGuGt4SJWxFhDYx6cCrPZC3ApVgwyVQdWxZM=;
        b=OuKEttMevyr1bIJPvOumDwJz/toh7bzloKMjRqQyfOk6Mjr5Jn4zyforX7qcH7Kg6w
         Z2TZeS4SLfIktiTUS7qYKgeVF1ywNZrpsL3vq1bSW2pTaGnXCCLuk7tnqBGq06k8lcOt
         IBNmLp6zy+CQS+s9ITxnWjfz3f51B0wQocKJEuOP8HTDm6rKonDxMX3zNrJf3lU9OAAm
         ZNwwBVHCc5FhBLWOmZzOrTsdHorAUaqUkSfZB5VMaxAQZLjgRy/n9Fr7DdzaLNmWoWIT
         0+i6foN44sk7V10+lRgg08TIHySyvDJNco5vIHgdLnYJYc6evEtkDh9s0uKG8phOeK3A
         nnLg==
X-Gm-Message-State: AOAM533/ljg64kM3IjYjcBPS6V+QNG3PhMjFJpHMVKnf6uJOe4rcSOOS
        khxEWa2aPVClPWoN4EweWocm7A==
X-Google-Smtp-Source: ABdhPJxWTm6CaT1ND6bGaFNTSAKpnrLv00eqNbrx0WnULUxuw/bK1fjd8KciNlyMULO9ikiI352lKQ==
X-Received: by 2002:a05:6808:138c:: with SMTP id c12mr13956146oiw.34.1632429061671;
        Thu, 23 Sep 2021 13:31:01 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i1sm1583036ooo.15.2021.09.23.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 13:31:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>, ulf.hansson@linaro.org,
        adrian.hunter@intel.com, robh+dt@kernel.org
Cc:     rampraka@codeaurora.org, sartgarg@codeaurora.org,
        nitirawa@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, linux-mmc@vger.kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org, stummala@codeaurora.org,
        pragalla@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, asutoshd@codeaurora.org
Subject: Re: (subset) [PATCH V1] arm64: dts: qcom: sc7180: Use maximum drive strength values for eMMC
Date:   Thu, 23 Sep 2021 15:30:59 -0500
Message-Id: <163242893971.825761.9292228692666120286.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1629132650-26277-1-git-send-email-sbhanu@codeaurora.org>
References: <1629132650-26277-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Aug 2021 22:20:50 +0530, Shaik Sajida Bhanu wrote:
> The current drive strength values are not sufficient on non discrete
> boards and this leads to CRC errors during switching to HS400 enhanced
> strobe mode.
> 
> Hardware simulation results on non discrete boards shows up that use the
> maximum drive strength values for data and command lines could helps
> in avoiding these CRC errors.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7180: Use maximum drive strength values for eMMC
      commit: 752432e40e8f0d02d0af07cce2d6d4b250be11ef

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
