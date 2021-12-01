Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42CE465129
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350787AbhLAPQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350778AbhLAPQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:16:40 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD2CC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:13:18 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id n66so49103715oia.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Faigimso/eKhezrSrBSm1c7NresIpvj+ZLwfXnPZnt0=;
        b=ggsyIUz21plARJChab77MjTcSP4lpVzebQgwSuw6onzOum6+MdW+ivVn6uSXqW/1E5
         jUt7xXTYVxZKlPR+gfrTdma3ElWNpydgeTegRw3vSxwo5r7Cc6lY6ZZBqJg88KWiVGAv
         XOdycaTvrGvdKzBDn31SkeaK3HICCLWvdJuXTo6XKUsfzzOrlHtylHzDqiAPkAzQXlTB
         GjdYChNM0JmnhZn3AwL8kU2tbMtKolRYs6SOL/bI4A9gRxEc6ihKQL1exkbrpskWmWSY
         ixkwpUCYoB/ZXcfQgTnOIub/+84PoOm1N3eSaEQg6Uhw1AVRqosetwEF4i+1t7Y6FTUu
         xyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Faigimso/eKhezrSrBSm1c7NresIpvj+ZLwfXnPZnt0=;
        b=22SZrE4cfJSbybun1uZGWRhLvwBO5u6AdQIJSQYRBoeVfeLFJaoMazciqJeu8ZHFRk
         qyeCnGbBnDxjOoI6UPxYCkOMTnnlkLGGl9s4TJbNaQbpx6bpV6deUDVwZfrJokXvilTO
         9Dqk53eBA/dUAkyv/UuPDDBScVEIW5ZwWrFhmAFAgL2HFdztUG04L3I1c2z8v8Mst6UQ
         FtC0Nfz7Lwu+UP89OkXaJaJ6m+zQ1xFSYCFqTFbihOr3d0Ey+tko1O8s3hoQFyAz+gD/
         6vHpYhwda9ZJSMyD3e/ob9tT6NRD5T17v53g80chooJjxRqMq7NzHP/hvxFQURg3I+nQ
         AFnA==
X-Gm-Message-State: AOAM532P5kxLW3BSLV+7HTRrx4jmdFgetQ5ythNFOCXTvBEUPio26yXI
        5HAFmRVfYOMXpMs+vfq7MDkFSA==
X-Google-Smtp-Source: ABdhPJwL4nvT3mS/qmLvp0wCnH/+djF2CFgYCVoLRZT+yFjiCKRB0m3rNYTS9/5HAMBO1sOBrYGNoA==
X-Received: by 2002:a05:6808:13ce:: with SMTP id d14mr6662405oiw.62.1638371597902;
        Wed, 01 Dec 2021 07:13:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id be12sm33933oib.50.2021.12.01.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:13:17 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: qcom: msm8916: Add RPM sleep stats
Date:   Wed,  1 Dec 2021 09:13:04 -0600
Message-Id: <163837153032.1905338.14761982004035075078.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119213953.31970-4-stephan@gerhold.net>
References: <20211119213953.31970-1-stephan@gerhold.net> <20211119213953.31970-4-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 19 Nov 2021 22:39:53 +0100, Stephan Gerhold wrote:
> MSM8916 is similar to the other SoCs that had the RPM stats node added
> in commit 290bc6846547 ("arm64: dts: qcom: Enable RPM Sleep stats").
> However, the dynamic offset readable at 0x14 seems only available on
> some of the newer firmware versions. To be absolutely sure, make use
> of the new qcom,msm8916-rpm-stats compatible that reads the sleep stats
> from a fixed offset of 0xdba0.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: msm8916: Add RPM sleep stats
      commit: 1c0ac047bbfb3efd6549d18c3ca47aa0afedcfbe

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
