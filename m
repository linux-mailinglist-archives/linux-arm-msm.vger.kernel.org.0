Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20BB055D7B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241081AbiF0UEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241018AbiF0UEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:04:01 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73FA1CB3B
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:04:00 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id q11so14291386oih.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7OQ4PpYOk3MtJlbrpk2V/K1TEU9njMilyZAM6iCtqms=;
        b=EwthyAeh+eHInump00fDV47HNuXMZR6/s0lY3EjomSeGnq3MK2dkPZHOlpdDE/dVjN
         7RGLrBqIfed1vqw6kRNxqEmhfBWi0YpXiZgYBK03NC4BrZTFA0iDkbbBfJ3KTEbXMhG1
         bsRkNg9gsls7tZ4jP+/akvQwb7e1hkI35eBiZWrWHFgNEvZ/WNXXWzz/1/eRfGDbfCcU
         SU51E5f1x/Y6k1dqyU0f1mGm+E/Uj/SoW7Ys84TREzWjNBEIt6TErDUKj9pHdaLmjuXh
         4tuA1Xw+Uaa1HtKRIBqer/qJI9e/LJpSX10ccAPmwr3LzqHWF1whXXK20ByomK4p7wM+
         FqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7OQ4PpYOk3MtJlbrpk2V/K1TEU9njMilyZAM6iCtqms=;
        b=qPzacAkdptvYaNXLGicCnnFO5yPsNgnDFDAH2TkD851DwcZ2SBSvFScnH+2XM2hHHv
         qmY7VjFAUAB0uTGvc70q/hsLldVUH37Z+KovZ/J9kZKBnVY1XgV4fjBdHgMpltlQZpL3
         LYlahfCzZU7ydpx/GCIFXOooGVTZLaRnUrnvLA6MfFsfM0bcNvJzm+iT6yixU50Z4kyE
         aIZIV49MaqtI7/9lu6pQgt51GjR5dxxZS2ze+7utTZWyzvbRs8Mmooe8cGyyerTNFOt4
         15ZxmmNVOmAmQgFuhCuFo4+qX+/qndRDLFqu0jaMclruSIGkK8ooUXg/k1Csw80MNQhs
         tI5A==
X-Gm-Message-State: AJIora+760mjEqsBE1umElse/aC7h2ydeI33UJg2k1tOcpSTtyB4ooqt
        HOdML8RzYrH0DOgE+DRsyq45CA==
X-Google-Smtp-Source: AGRyM1sUWlLBUSbfoib154IEyeb2JhJVJfnIYh7i46S3ehmh8SPVeRly6YtHpVXC3FRh9NAyeEn4Og==
X-Received: by 2002:a05:6808:3096:b0:335:796f:abc2 with SMTP id bl22-20020a056808309600b00335796fabc2mr3046009oib.173.1656360239974;
        Mon, 27 Jun 2022 13:03:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of UFS node
Date:   Mon, 27 Jun 2022 15:03:10 -0500
Message-Id: <165636016347.3080661.15168206097123129140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Mar 2022 00:19:34 +0200, Vladimir Zapolskiy wrote:
> All interconnect device tree nodes on sm8450 are 2-cells, however in
> UFS node they are handled as 1-cells, fix it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: fix interconnects property of UFS node
      commit: de9b3d9616078f1d1d0d51b01cdafa101733f935

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
