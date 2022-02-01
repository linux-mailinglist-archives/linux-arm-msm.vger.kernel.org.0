Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690934A5620
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbiBAFUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiBAFUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:09 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D25C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id s185so31223855oie.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcyaHI9jqE1/RKblhUT3mnsT92zTzUpXiIvzMkjWysM=;
        b=d7+b9RrBlPWh1+wuR0/mn+toJNYbffLhlt03/avf5ctnbuJz2mAwRS2yl9wevN5biF
         aJmM53JBJN3Va46qekBRuQHn4IQFuU02KCG8coU94gTXqG5WAm7yCz0/aZfwRWwwjJF7
         44S/N0NEDSHbLOkZ1FUCG6Zqu628jNekqS8hPTgS3APVDKICTFkJuIfXU/ZzRfXahHoM
         PxwOSiFuiKqPYzAM/SeF7uPGpuXsVFzu7gpv54C8jHNW7FsQf/8bz8FwAvesZBR4aeT9
         JZTASDDnyYOxGWl3HXKwroFk/2WykaQ4hLI10R1njVUpmHp7fYIfydsNFccyyAR7ujd/
         SdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcyaHI9jqE1/RKblhUT3mnsT92zTzUpXiIvzMkjWysM=;
        b=eNMC+j5dZsbuhcg+J85lfJXo3QT4nwWVIs6m5ILusSoO/X/XOMNL9PURWuKEVCRwyC
         AEsY++EvLVFaldILaX+Mq8Wv/AcxBb2z9Mokre+PpEOVYP/sK7HS4cBuHHLHTFMKRVBJ
         Q+Qes+e/BdhJIxHUvXRwUBb2F+3eouDTQpRxBSZ7XLOMf4h3ASeDyI6cSQcxSXKKIIUN
         gqdwF53i56ZgQkmBsSUkuDhvAlbqVvPq696AVS3s0WCbAW/6sVwmZBfOePeDMWHkCmEt
         cgVwnPPt9vITDOdImRAr4B3oPeOgUxjxfcpTOvA8YbUT4oBFkqlrKkb6hDhgZ5xb9EYu
         hgwQ==
X-Gm-Message-State: AOAM530VnHMMdmSSgKUSN1sNfN2I2jMocpXOGlVvoUbxhW+niT6JDyth
        q7T/6Sc5I1/SzeZgefmQ7QX+RA==
X-Google-Smtp-Source: ABdhPJzAgLXvxrXKqASdURr+m4TWXktMHTNGd585xjPHVWak7DT0DWV+vs7Lss5iD5gpt6t050KDEQ==
X-Received: by 2002:a54:4486:: with SMTP id v6mr206877oiv.121.1643692808788;
        Mon, 31 Jan 2022 21:20:08 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: (subset) [PATCH] arm64: boot: dts: sm8150: simplify references to pwrkey and resin
Date:   Mon, 31 Jan 2022 23:19:18 -0600
Message-Id: <164369277343.3095904.16080421794941248982.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217124546.1192281-1-balbi@kernel.org>
References: <20211217124546.1192281-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Dec 2021 14:45:46 +0200, Felipe Balbi wrote:
> From: Felipe Balbi <felipe.balbi@microsoft.com>
> 
> Since commit d0a6ce59ea4e ("arm64: dts: qcom: sm8150: Add support for
> SONY Xperia 1 / 5 (Kumano platform)"), we can directly refer to pwrkey
> and resin by their new labels, respectively pon_pwrkey and pon_resin.
> 
> Simplify microsof surface duo DTS by utilizing the new labels.
> 
> [...]

Applied, thanks!

[1/1] arm64: boot: dts: sm8150: simplify references to pwrkey and resin
      commit: 2a03c21cca5ffd527c9ea2e88e52e58e1c69331b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
