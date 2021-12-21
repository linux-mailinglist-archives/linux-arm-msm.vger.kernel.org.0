Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001B847B94D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 06:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbhLUFVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 00:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbhLUFVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 00:21:15 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7331C06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 21:21:14 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso15261954otj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 21:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Tfxl9dT962fD31BS5U4Z6JC/5fHXiOCox/iQOt3hnU=;
        b=vxeva6jcbASlZxrUlr+z5jASd/dqqWgtJorwTqTX3X4MerWvjpj6lDOLnEMHz3vrIN
         CfohilF1IqUqP7clAUcyJQUVze7WqxG5BBZp5ChzgjEHPhYunUwv7T82TIQu4VnAU5N6
         xOOGvPFR8RGMofgWqrk39l6MlGN049N2e34O3QhI0DYcQ4HM3QSCea6epEerYcn+lmBC
         hg9jZWfzqCrfFd2iFiIa2lQTMUC2wHYtGPBrDvg7SM0QM4pZqO8PL5xF1Fha+Tm3zmKT
         cq2Ez89MZl/LZOQN0ZD101drCmXPzpJRTpMYEtJM6h/vbQycpdUEEDHQxcpwm5FJGEYb
         x14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Tfxl9dT962fD31BS5U4Z6JC/5fHXiOCox/iQOt3hnU=;
        b=jAEmnIk3e+22khk/hMOaRwVgBKq/29d3lq58EB2NOok2OhYzTIrAYN8kzXhIa8qdGR
         v2x4A8dhQUxQFB2ad/dkyrPVgFrL3TTT5X37ydJZk5B52c26lO86k9+Gj6F1CakGpWMw
         YZXVeVe9snICy461yKSbto0ef2fdbe5G4C9FXxnGmoB3UAnALGyuLfzAWVlwIbLUTRV6
         aPUIVxqvCvPtA2bmxgVpqmHk+imxI0iKrKHFM9STfBhrNedSajGgbp5pzgPBH5tH/ehW
         JLGC+m70lC2YE8fLXiJaCGiEYllY7tNJWmSPKK2oMmPUxkAXNLbKNZCdUZcpjKnssaMz
         MK3A==
X-Gm-Message-State: AOAM533uuMtdS4bB7ar1EiSmugB9UfVJj51bAcOuYDVKEjS7NQDVTDXZ
        4YvqlrKy8IxwtfoS0NrMMSNlhw4kwZmP6A==
X-Google-Smtp-Source: ABdhPJxV11CjE25op0O9LXBxBiJP9fQJs/VNdtGZvWMngidELRdJZxc144fVL5C/cZgpLWX81ZAzJg==
X-Received: by 2002:a9d:6c18:: with SMTP id f24mr1087774otq.250.1640064074060;
        Mon, 20 Dec 2021 21:21:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v19sm3573867ott.13.2021.12.20.21.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 21:21:13 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] arm64: defconfig: Add SM8450 drivers
Date:   Mon, 20 Dec 2021 23:21:07 -0600
Message-Id: <164006405161.3630669.2116117218198683916.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216065444.650357-1-vkoul@kernel.org>
References: <20211216065444.650357-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Dec 2021 12:24:41 +0530, Vinod Koul wrote:
> We recently added support for Qualcomm SM8450. Enable the clock, pincontrol
> and interconnect drivers in the defconfig. All these driver are already
> picked up by respective maintainers
> 
> Vinod Koul (3):
>   arm64: defconfig: Add SM8450 GCC config
>   arm64: defconfig: Add SM8450 pinctrl config
>   arm64: defconfig: Add SM8450 icc configs
> 
> [...]

Applied, thanks!

[1/3] arm64: defconfig: Add SM8450 GCC config
      commit: 6d10fcd2faacaa9f7fa2ddf30f65e96257964c9c
[2/3] arm64: defconfig: Add SM8450 pinctrl config
      commit: 4685e234ab34591ce12ea16eea2d3db273c1af47
[3/3] arm64: defconfig: Add SM8450 icc configs
      commit: 156f91f1c49a5f2ccae8e4b2d882ca3a28e3f26f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
