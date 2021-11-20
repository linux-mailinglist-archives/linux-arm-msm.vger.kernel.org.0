Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F133B458133
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238028AbhKTX7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237643AbhKTX6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:50 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835F0C06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:46 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso22680701otj.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9GJrK6nefjIeraEHJzWvaKlieCTNqwzUPY8Lmxe7PTg=;
        b=c0SnihBVDu8b5qc+WdFgm8MlRbgSEYeZAGk7ZEmvMh4LkJce1LS8wXOwDlTuSsiWgY
         XASJM23O57bVXzD9pHboWmb6XoVBeRWlSS7yOkQ6oXbBgejklUZWrr8EIdfbBLqIfpmF
         hhirTaMS8F2SnNrJwF7sRAUF5534Hjl3fQJyHKXFgZz4s2EebvG73A5SnraQQpFwqN7W
         3Lw5JsHA4JTUjMnysIHh94Wucu/vyIaNDwtd02VjvSWN2bbo5ZmE5ljrXKq+eVgDEJck
         QHCqzyTGJ7AQTTjXHI0gyycWuzsl0dhDc1VHPoMl/L97N6R65tb8oDCD+BPEm3EPc97F
         2eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9GJrK6nefjIeraEHJzWvaKlieCTNqwzUPY8Lmxe7PTg=;
        b=lJg6UWqGjS2gHnAqW2EhTpx/0lldOP2GfFSjaEYPoNGanMdAHMbiHmkT1rEcY/LXmh
         mqCLnUYvQyjnbmD1b38L0YCy4AXrmTV9HNytycudUPpVy08K4TTDHhFLkZiy+/VklLMW
         ZlGGaI+SLLQ0R3EogMDMzoyKz/So8r3hmSvdT+2R4E0Sj5vjbyJT9zC9+QnyGN4hh7A2
         4YfHUtjV4YZiQVuNx45OStvlEjqHHxA+dXRvI+bNb6oTG/EE5jwnEyRBjFQixApzy8XL
         CRZWO4UWByHNdSU5UyJc4ruRy32V3Zb2MDsUoWF1+RsjP3u5+Kou81N66SJCKKqbPbPl
         dhzQ==
X-Gm-Message-State: AOAM531pLPc+4Pa2h4zClpnZoVpcsv7rlLaEkMbckrme3lMEOPubOdsV
        juUdf0pc0K0j+XZw0Bnx5ybtew==
X-Google-Smtp-Source: ABdhPJywRZPUXpMmqH7rW7FsevQFjTaiGtt8WE+YKIqnlOH8FNdxdoAfXIhx8zBNnTpKc0YHYZ2MhQ==
X-Received: by 2002:a9d:137:: with SMTP id 52mr14254531otu.260.1637452545901;
        Sat, 20 Nov 2021 15:55:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kate Doeen <jld3103yt@gmail.com>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: set venus firmware path
Date:   Sat, 20 Nov 2021 17:55:22 -0600
Message-Id: <163745250541.1078332.10313476303397104922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028102016.106063-1-jld3103yt@gmail.com>
References: <20211028102016.106063-1-jld3103yt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Oct 2021 12:20:16 +0200, Kate Doeen wrote:
> Enable loading the Qualcomm Venus video accelerator firmware on Xiaomi Pocophone F1.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-xiaomi-beryllium: set venus firmware path
      commit: 42dd1efffebd731e22623008058dd9c659812d1e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
