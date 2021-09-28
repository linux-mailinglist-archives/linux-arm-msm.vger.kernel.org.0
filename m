Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4D541B312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 17:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241641AbhI1Pka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 11:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241371AbhI1Pka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 11:40:30 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1CDC061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 24so30524802oix.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UzVpZWKlJwRxSjuK78I3eEXEjM8AokgYI911F1Dgoog=;
        b=Lh7oxXzq7U5xVayIB8k4MdCaBlpkBo6oslCTe6LgtGxkoYhjvFQRQQo76tCzHSQqNo
         LcDnoDaBX4FYrTGolrUuokUEfpz5hMXbfKsFoY3qlS2o8Fr2LF1O8aBfdp++VwaYYk2j
         JocuHgDSRphkZO+zB0pdJKJ/hDSEkxqyEd0On57iHu1HcWJLu5zfSqZZLgK1nH2KldZJ
         2JEqnXg32m9KwN94R/VzGNb5/xoO7C5zCsV2VxYHK9zK1ljlxIcPRcZc9XDENGoWJ2oS
         OLP+EBd4igDboPbw7LKsZrLUOTF+5kbCqXmuE1IciV/c2pFPuUZDnZ0L2qRhgKBihrfJ
         3leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UzVpZWKlJwRxSjuK78I3eEXEjM8AokgYI911F1Dgoog=;
        b=ChB0rgd2y6Oa4JpPxhmn+x2KUJ+mm9MGY+/i+9ombSY5a4eLXh6Dqx2SN8o7BePpkw
         V/NsdktrozzUYa3OhpWlwuhGnwggg1sEuMzhhMObzpN0+JhHiAsNDj/5Iz1dwLUArO3o
         AWSHLSJ9zYTr7Nu57h1ZgWb0Voifyw7VUfNUvVjX5Rvi6WlzNVEyw3IuamO77fQDYvID
         Mr7NGKHVNFcAwHWBfA0gcbvWdXWODf0qGiiQoNLhiT861E1pVh9N6S6kCfDlAk+0Rllu
         ZdroEAYH3TVwdpOFZW242FK+TPm/wXQeHhrfBUL1R4VaC1Qh89Ta236fDWrZDL88ADGY
         aMvg==
X-Gm-Message-State: AOAM533CTgG5hsSL1bQaKSUi0XgaTUJZq2OGnvhAtsl7qHNJUHgXVOoX
        g5aeoQAsXzjsUeSKaByoNwpTJw==
X-Google-Smtp-Source: ABdhPJzpKI/iHmrF8iGPdIrucU5CqhILBdh66wKx3f4vL1+mlc0e2eWHMpxxhJ22+nE5sf9nrUdarw==
X-Received: by 2002:aca:606:: with SMTP id 6mr4222738oig.82.1632843530129;
        Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 18sm4753034otj.10.2021.09.28.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 08:38:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm6125: Improve indentation of multiline properties
Date:   Tue, 28 Sep 2021 10:38:46 -0500
Message-Id: <163284350355.1592203.2999251996289733980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210925141841.407257-1-marijn.suijten@somainline.org>
References: <20210925141841.407257-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 25 Sep 2021 16:18:41 +0200, Marijn Suijten wrote:
> Some multiline properties (spread out over multiple lines to keep length
> in check) were not indented properly, leading to misalignment with the
> items above.  The DT file is still small enough to address this early in
> the process.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125: Improve indentation of multiline properties
      commit: 4e31e85759a0622b25a63300019d04ff031c95e0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
