Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE114765DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbhLOW2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbhLOW2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:10 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75ED5C0613B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:06 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 7so33666413oip.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=64tsnfr1jGf0tmwUWWRjI/MvLHd/B9Kaz3K8Ihd8qSU=;
        b=L/ww2KZy8+MRvyy4yRXqKHVTE/emChh4gyw8Gr2/WWGEvnnGoFirJCxtMfVGZc2enW
         IvqanqUc5q4nKtDNujdBZ/pc5orm7mePANdQ5vJP6wBxP3Oi5nWIWwEW5KX6eUZtxJmp
         Yd6LCvhoTB1OMe/ArD45NigsqddyOJW2mCtOue7tBr+/LMfFdfRn/v9xCm+aj6mzDO/S
         ScVA3vv3W2irA9TVFrXZ5856SMadNF3tGIDdIIjPNPW9vZI+IVFb9JeN5O2goduV19IG
         swHHqUNZDBXF0eO35jCp02c5vute/zBq8JEo/ETq9ppvj+2rnmgjD0EmSiCluGXOTdUB
         gYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=64tsnfr1jGf0tmwUWWRjI/MvLHd/B9Kaz3K8Ihd8qSU=;
        b=zlGiBY4jSLJj4JrzJcU2eG7Lp3E0g1X17TNmufR1+7GM3R1odiLlBUgWGylm8KwQGy
         vb2J6ITbmBXjlhicyT2ibE6/7DhZZtQIOkbVw6a2uj+ofcCWqPYl1ThfSSEgq6AUcBny
         TXB5awK/GrLKU3p/FEG18jp5ygjp4udmK/D5SWC67Y0IeE/d5wf8HBOKXJNQ+sCz7zkq
         /eHdhyyAI8abv6NWrzMeR+mDl68+YOeXc7+5DOQAky1jPDLP3kDU/PSAwOSanffXHajl
         EDFODlFX3ggFIJxl323Lo15GETpMuoALuxCpuFIE+rOiIBUbxpCTEtGKd85PS8WzL+Hk
         gCFg==
X-Gm-Message-State: AOAM532AfqZnKxfHLgy5Hod5rsMReNuKYfATiXB9mcMf9UCazPKjsD5q
        4LFrYUn6Yr/wO/ltuXiVE6JdzA==
X-Google-Smtp-Source: ABdhPJwUHijLkYIkIEW9B/04+W1EkVXmba8uEjp+1fZYMKmQhMCgoXounGRF/ocJpWKe/2DxSe8Ulg==
X-Received: by 2002:a54:4e0c:: with SMTP id a12mr1869552oiy.12.1639607285829;
        Wed, 15 Dec 2021 14:28:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:05 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 2/2] ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c
Date:   Wed, 15 Dec 2021 16:27:38 -0600
Message-Id: <163960723734.3062250.11094863401330797734.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213113250.4249-2-stephan@gerhold.net>
References: <20211213113250.4249-1-stephan@gerhold.net> <20211213113250.4249-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Dec 2021 12:32:50 +0100, Stephan Gerhold wrote:
> The DragonBoard 410c is mainly supported by the ARM64 architecture
> and defconfig, but it can also run well on the ARM32 architecture.
> Add the necessary options to the multi_v7_defconfig to simplify
> building an ARM32 kernel for DragonBoard 410c.
> 
> This is also a possible opportunity to slightly increase CI coverage
> for older Qualcomm-based ARM32 platforms that are currently not
> represented well in automated CI setups. The APQ8016 SoC used in DB410c
> is still quite similar to those. DB410c is already used in some CI systems
> so the same hardware could be re-used to get some basic ARM32 boot testing.
> 
> [...]

Applied, thanks!

[2/2] ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c
      commit: 7495af9308354b37a3557518d0d04f4cdb2a7837

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
