Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FD445810C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbhKTX6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237581AbhKTX6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:49 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFF4C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:45 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso22766613ots.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NW1+StbYTNfhB18mz8flsS/nfpg04TTygGPxrs2ybGw=;
        b=ZzGUgVwvW/aJtq/3hkTK/+92a5zcGgKu7/NMtNz/ypKuEGqRAyM9ONdXzmB/PzPnoO
         vy+SjNEv+YllmwtmP2wJHiqEfbi1ngkGKBc98+hvwmL1v26iDpcsI49On71CSzzKG6P+
         47kEH6j6sr/fWoh9f0glzkMU5Nns5jOU+iTO+atflXOCFEBSLVdTObHiS9fXiDMEtBIG
         /7humws6CuIJ+3tsOy35ZuipBkcjhYGgxZruuq23Y1McoaJON3w/wtp4zF/cV2H1zA1/
         3pz0L8jUHan5S/iecY7Gr6Ylrvzg6tQBKgB1sK/CAkpZE/NYlkrBcNmuFJImOO6PgJLj
         LGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NW1+StbYTNfhB18mz8flsS/nfpg04TTygGPxrs2ybGw=;
        b=KQtEyeFS40262MLDyVQ/HTnM+D5xhIjBA/ZPkys+ORBPhanv1aUIzPfigAQz5Gk7dU
         WbPmBcqbbbWDzMQp3MDbIPVb44vs6aAWsRXfpuU6XyuWQQPHftjo0n9zXwYHjaPaY7MR
         k8k/KSgZxQZlMmQ4GRBKDiTiAH/7FY63CgeIhxENY6RWmSHOxbW5ftUp3NJo3XUHny0p
         r4g4EG+TRYAVJ/PhbcHcAh8BNnMm/k7eAKx5sveQHgZIt3AurSl05BXOvpMdHMRQnpFL
         miEKxTZ+seQ4Q5ggvQVeaNsmxyxPLlKvXBfontgmtG8lGSfVrbZR5LNHGrRr9hKCK9G4
         AUNg==
X-Gm-Message-State: AOAM532znoR3wAh/ZeXE2Rbfv0oCJn9Zrn234mrL0iw7xt/y+BDfz5Fp
        jzLgk/pcZAUtccerny/TL+e43A==
X-Google-Smtp-Source: ABdhPJzEEQZLRDrMQl/frDisenYmi0rt+jC4xFlEDWSOq6MJ7kj5zBataV+YVjJ+FMZOHzwfU45m4A==
X-Received: by 2002:a05:6830:4d1:: with SMTP id s17mr15061318otd.246.1637452545040;
        Sat, 20 Nov 2021 15:55:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:44 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kate Doeen <jld3103yt@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm845-oneplus-common: set venus firmware path
Date:   Sat, 20 Nov 2021 17:55:21 -0600
Message-Id: <163745250541.1078332.12313137933441081797.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028101957.106034-1-jld3103yt@gmail.com>
References: <20211028101957.106034-1-jld3103yt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Oct 2021 12:19:57 +0200, Kate Doeen wrote:
> Enable loading the Qualcomm Venus video accelerator firmware on OnePlus sdm845 devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-oneplus-common: set venus firmware path
      commit: 00128a57c0fe6ed90278cfec2adeccb83b7b49f4

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
