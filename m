Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C166F417DE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 00:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345670AbhIXWp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 18:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345514AbhIXWp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 18:45:56 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25B9C061571
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 15:44:22 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso15171818otc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gyAp11GVy3k0igMDf0mWwOpAwqokrDaJ8vtHbGpMaY=;
        b=jwtSoWFN7eT/+6F7TkV+rnDt3whdvugsXoSs2Le3Sz9bTNBHHRRO7+f7XMFOvrAVVt
         J4RXXtld9IhS6tffti6wADOFhHmgLFdpU+PX0C65E17VE2aCLwgs7wbMHJPT6kMUkJuH
         SYWO3TkVsRjM0hglRb1panwV5OuvjEXtLZQ7YMbDWS9qxgC1KW89CWspIp/Ii71yM9/q
         VNsh7cKPCfX3KqBNEOxemhkn4fTTzbiPQf9GqKOUJsG92LYsCOOFBWY2W56X9lTC9h1M
         kx5wDDJzuoBPetvuh7WuPEdjQoP1AOEfUNlpQJGARQG0Y1Snr4W1g8/qkPcrT2jiyLSL
         yTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gyAp11GVy3k0igMDf0mWwOpAwqokrDaJ8vtHbGpMaY=;
        b=uewMohqIou3Dcrx//ROoCbvONaByWonEjKB+a0CRjfIRaDFeEa6GbW1fSLfdHwrrAp
         YC33UbROXFOeu938pju2drmFle/asnnmTS2/at50mksa3+V1JkXfle4rjxp7yLE6EyCL
         YV1CTsxf9csiqiY3/vll1RS733ZUDUkHPc3lfWjBfTOuCmfP4jBGPpaAPn8npm5T1OpQ
         gFweGCXxbijURQZWCe/k5JYypWwG9B8An7f/gS3rM0YiVhXDZZideiUfOoZA9siJ46Nz
         1869zc1mizmI4YKTY6LeKjCxkyyB/0N7+HOjA9TuxBdQ/F1P1KySE+9d2HnBUsDyGBWf
         8uxQ==
X-Gm-Message-State: AOAM5339PYbFRwjhZeywhZ4xWGx5jE7TdocazZ8OaT0+CVpFNqTk4Zzc
        aYEnQSWjcT3ZqsSt20t0qUPEJA==
X-Google-Smtp-Source: ABdhPJz2K2HvjPfjNvJQV+nwwKIJsuIByaxemSpdOIRViuYY0V41ni1py8I/1OUye2lrALIOsNHhCQ==
X-Received: by 2002:a05:6830:708:: with SMTP id y8mr6179443ots.77.1632523461522;
        Fri, 24 Sep 2021 15:44:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a23sm2374956otp.44.2021.09.24.15.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 15:44:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajesh Patil <rajpat@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dianders@chromium.org, skakit@codeaurora.org, sboyd@kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        mka@chromium.org, msavaliy@qti.qualcomm.com,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 0/8] Add QSPI and QUPv3 DT nodes for SC7280 SoC
Date:   Fri, 24 Sep 2021 17:44:19 -0500
Message-Id: <163252328671.1213592.16550436828870710723.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Sep 2021 17:46:10 +0530, Rajesh Patil wrote:
> Changes in V10:
>  - As per Stephen's comments, Removed <&qup_spiN_cs_gpio> in all spi ports.
>  - Added "&qupv3_id_1" in sc7280-idp.dtsi file  because EC and TPM
>    are using "qupv3_id_1" node.
> 
> Changes in V9:
>  - As per Stephen's comments,
>    1. Moved back qup_opp_table from /soc@0/geniqup@9c0000 to /
>    2. changed node names to "qup_spi0_cs_gpio: qup-spi0-cs-gpio" because
>       node names should have dashes instead of underscores.
> 
> [...]

Applied, thanks!

[2/8] arm64: dts: sc7280: Add QSPI node
      commit: 7720ea001b528d88cdb7980cb9c97327f95a815d
[3/8] arm64: dts: sc7280: Configure SPI-NOR FLASH for sc7280-idp
      commit: df0174b13d3f6e744a5a3dfdfc1853bb60533fdb
[4/8] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
      commit: bf6f37a3086bec4c103dc4a478b25c9adf8dd671
[5/8] arm64: dts: sc7280: Update QUPv3 UART5 DT node
      commit: 38cd93f413fd946fa39b83d3283a6a2a21ca0789
[6/8] arm64: dts: sc7280: Configure uart7 to support bluetooth on sc7280-idp
      commit: e3bc6fec5aaa67b8147a422d8d88a36d46827f0f
[7/8] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
      commit: 4e8e7648ae645d1113649a7b9a781fdb4b2701f5
[8/8] arm64: dts: sc7280: Add aliases for I2C and SPI
      commit: 5f65408d9bfcc418353c8cd4dd17f60ba60d61a0


That said, all but a single commit to arch/arm64/boot/dts/qcom/sc7280* has the
prefix "arm64: dts: qcom: sc7280: ", so I would be happy if you could follow
this and include "qcom" in the future.

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
