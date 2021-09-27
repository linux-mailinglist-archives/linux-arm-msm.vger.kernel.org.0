Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D999041A36A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 00:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238032AbhI0W6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 18:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237969AbhI0W6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 18:58:02 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F584C06176C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:56:23 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id n4-20020a4aa7c4000000b002adb4997965so4893967oom.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLTtH4hZnMTDUXtG8QKxhCYz72VTXTnMX/KxhuwvS5Q=;
        b=uSFwX0imDyQ63j6benweN26xLl88rv6aO4w9SDKy+32Il6TonkY97iPFgESmGgvDHu
         StUokDsNrre8uRActn1E2d6IOWtSPKdESbrgwo7RMNY9ot/RnkmKFwQof3RdRqX9/2a3
         2amS4vBugNgpjTwyJ1tpq9I5IQKOTsGCzqIb3MZHY7u6yJ7B0bZq9wHdEEFQoWYi9fq6
         1lETN6nU0fSETrM3DOhRni2I3VpFJpu0EAH7fYNS5XY+Db0WlpJQkfFDMnjzMp+i/phY
         yoI2CVKMKYeDNNVfPNEkcTtAUSVevWmdJnRvBVyStMQRJRKmQhHIBqcQbp8YziHoTgQn
         BiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLTtH4hZnMTDUXtG8QKxhCYz72VTXTnMX/KxhuwvS5Q=;
        b=jht6v/hQANvkjoM9cLahArPyXiy+iVc8Vx5prJnZ5aIuUMgjJiMIaZn9tu7h9t7ZaL
         nQ1MQ5HQ/JKCkk1bm3y8HY+O1uRCj96Jobn2jshT2awayUaWbJ86DVbVh7Atmd8d5h/+
         1E0vuYHRBUgnhW7ztBxdjDQvkpSaC/O9N5UBgE+QbzSkn8wPmraZcgnQNzAhcsjWCjvd
         ScFUm80uXsKDGrZq7QicuWPxMUh+ZxXdevUmifC+DqBBDyUM6ZNbdPunFXvT0Ude6yCI
         p45fLVq453kOSasSuZwtm3fGDMJKFJGV/IkQTpJX7pmUrPL2HD8F8bluPqOixFaumc9N
         wmDA==
X-Gm-Message-State: AOAM531xArrf9BFc49Im3/7Tq+WHPAL6gcjwGpJLtnBhSzS7DkllFJnX
        x3ZzusPbQMyD6yMm5CAvkBtM1Q==
X-Google-Smtp-Source: ABdhPJxN9pDoeXMNZfAHDNKwyo6/0etpQuQQZlma4UN8UEzcOHf2GLratD2IucJK8My0eqs6iqiiLw==
X-Received: by 2002:a4a:ded2:: with SMTP id w18mr2103037oou.77.1632783382762;
        Mon, 27 Sep 2021 15:56:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w184sm4231084oie.35.2021.09.27.15.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 15:56:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, will@kernel.org,
        swboyd@chromium.org
Cc:     robin.murphy@arm.com, linux-kernel@vger.kernel.org,
        joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org,
        p.zabel@pengutronix.de, mathieu.poirier@linaro.org,
        ohad@wizery.com, devicetree@vger.kernel.org, agross@kernel.org
Subject: Re: (subset) [PATCH v5 00/10] Add Modem support on SC7280 SoCs
Date:   Mon, 27 Sep 2021 17:56:16 -0500
Message-Id: <163278329751.1522839.17169491081318211175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 19:25:25 +0530, Sibi Sankar wrote:
> This patch series adds support for booting the Modem Q6 DSP found on
> Qualcomm's SC7280 SoCs.
> 
> Depends on:
> qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1630420228-31075-1-git-send-email-deesin@codeaurora.org/
> rproc qmp: https://patchwork.kernel.org/project/linux-arm-msm/cover/1631800770-371-1-git-send-email-sibis@codeaurora.org/
> 
> [...]

Applied, thanks!

[06/10] arm64: dts: qcom: sc7280: Update reserved memory map
        commit: eca7d3a366b3ab9f31e142c13a43c5b0f94a920d
[07/10] arm64: dts: qcom: sc7280: Add/Delete/Update reserved memory nodes
        commit: f83146890172da67443c7b80e529fd1781046c65
[08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
        commit: dddf4b0621d61b8203d500ef85a853626ff42432
[09/10] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
        commit: 4882cafb99c2b004b9773631fb00ca6d96dc0124
[10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
        commit: 0025fac17b313cca5c640dd57cbf38d01ce10b27

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
