Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3C6417DE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 00:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345619AbhIXWp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 18:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345634AbhIXWp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 18:45:56 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C652C061571
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 15:44:23 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w19so16533345oik.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aT6PGCkfFncvQ02pWWpD+cjAoPpE7N0nwI03xARf6nc=;
        b=PCmlVYezCc+6GF3Gbr0DDg+qJ5lEqnrovDEBcz52iwgdJ4j5VSzh6amczofyFKSVI/
         NrRCKDI1ZYOjO8Dl6hMlDkZdicT7c3XB5RVQ2LYPz5WB8OTSMg5m0Nq94H6yLNQ78FFq
         h3OQfQqprhSCoxJUj8p8///J+n4e47B95WsF5ToKLIEWhWSxQPADViwn5RSkGe0uEJRC
         4KuWWmvQcj72DzCsbGGBPeQI7z3peJ+3nAfMfUWI8LHfr5G8IalTM0e7HJ1CTPRs4XZG
         p1bTOZ+/McfFVZA10tBdZcMEE5fkLaXQg+Ff0km20CxK7BVCIxHu2xREEaHl3t5nFtFk
         lV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aT6PGCkfFncvQ02pWWpD+cjAoPpE7N0nwI03xARf6nc=;
        b=Uq1jUSyuASY5djenQodIZRxQPOsTPVhOSOA3yKtbbSjjVGHr66yJuqNCOQEQafv7+k
         LeR4ap9E0NQwSg8DrMpi1vFGc5om64Pupy32FwlXtP+MaIBn05WhNJERL18CoSmY7U01
         MgdWEviinuPdE6rK+KEP7gIH2oTGTScpxXfmPc4cO/wjqY9Y9lMPIUB1ccq+rCF+jtnX
         6eWgfxwp54yPGmcg1ECdBXUn+3ePKEKBBJjQ0stRlDlzDmLq31+xPE+xTdT6tRxiCsxa
         ZcI/nRAT3DqbEmRT7G2ImBTYAx7Chr0ABUNwXcrY0ftYj8uDLUejHYwQn83hfeG0AsYw
         Ur/w==
X-Gm-Message-State: AOAM5309Dj1/+HJfZXWap4T0TkUksYoqwkEsf778MvxpYsSFNtB/Qdhy
        PQXsgSbpefdqoIERmPUQNNYARA==
X-Google-Smtp-Source: ABdhPJzR8TfKHOJ9wfri+64aYAbQV0HcxwGNIVS0ipSncoBUjvD1yYrHw9IuohW36CdYMMqjt/83Cw==
X-Received: by 2002:aca:e002:: with SMTP id x2mr3454614oig.19.1632523462457;
        Fri, 24 Sep 2021 15:44:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a23sm2374956otp.44.2021.09.24.15.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 15:44:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>, Georgi Djakov <djakov@kernel.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing a2noc qos clocks
Date:   Fri, 24 Sep 2021 17:44:20 -0500
Message-Id: <163252328671.1213592.16008455401574085015.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824043435.23190-4-shawn.guo@linaro.org>
References: <20210824043435.23190-1-shawn.guo@linaro.org> <20210824043435.23190-4-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Aug 2021 12:34:35 +0800, Shawn Guo wrote:
> It adds the missing a2noc clocks required for QoS registers programming
> per downstream kernel[1].
> 
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-bus.dtsi?h=LA.UM.8.2.r1-04800-sdm660.0#n43
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sdm630: Add missing a2noc qos clocks
      commit: 1878f4b7ec9ed013da8a7efb63fed1fbae0215ae

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
