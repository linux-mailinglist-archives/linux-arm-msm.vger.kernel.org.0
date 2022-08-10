Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DEE58E5A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 05:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiHJDrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 23:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiHJDrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 23:47:42 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A81C804AB
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 20:47:41 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso9814161otb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 20:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5D9+PsfZh11O34sosMXObQ3c3IZI2i4ZPZyxVLOQBa4=;
        b=T/g1XNcB5lKxH1br0VWmcAt4q0w4G5U2/SXerRfzVUQdnbwacvd35mjAfU/Bmi068Y
         +S/+czJWZ81cj1oHWKyNGzr2qBn4vPFMf7BQ2vzEV2vJVl+ZnSU8IZpGTfdY834jpdUL
         dEOxluqciPcFSTJyWSb+TcTP46ch6it0DnuhmmJigfikNF2mlqq9Zyi2YJlLH/PnqH8k
         Kb3F8lCkskepTG4Y+BNIgN9IUxch1FYnjSanyRnpKC6xcw7hpflnBIz/RQjphWMvocQ+
         arI6zXPRzG/EQLKx4zwmJbN8NCDcjXZzRBtC0l/hZuUJv86DOWQMDP8mtq3Td1wWfqPO
         DqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5D9+PsfZh11O34sosMXObQ3c3IZI2i4ZPZyxVLOQBa4=;
        b=Pq5w0HrK3ABNFQZmNPuYk5fUCgxsUqWeFoxg70relKs7OK7ISmj0LtRjo0rp1PIyLX
         TVz7OK1tIZ6nYgppJZZb03leGArX+BLTUeMU41TZC82/9e2orCfjKx+xG1sb+OfEHZKz
         lTOdY++5EI+SfOSIzYDp+bLAN4Hv4Evhxv47okk2wt7g586/1TDq2d35gY/TxuXk1i/Z
         DioeliJjchN2y6DT9PNxJ9cTpkzUA2kdCFW9GtUB2EBi0ze4L+sByB5GrZ3Kk7cwiCxa
         RheSCVe4plA8rmHdjqpNQ9/bKJh79IWv2BrsZfEijOgS5aTLrOxo9qKiKTX9h+v3KzXy
         ZSqQ==
X-Gm-Message-State: ACgBeo3rVLprFulILwk1FcWANnLQ5BKUG0oCyMIhcIhbo4j2mM45OTpX
        dKGje1sGYPK/+tPezJ3pGA0+oQ==
X-Google-Smtp-Source: AA6agR69SJRWOU/4f5w8UNLQmEzoPDWv9YGDIFuD4FVXTNymk7j9PuepL3ouMkNnYCNx6VtsgGiBtA==
X-Received: by 2002:a9d:7a55:0:b0:637:1874:a2cb with SMTP id z21-20020a9d7a55000000b006371874a2cbmr812155otm.318.1660103260506;
        Tue, 09 Aug 2022 20:47:40 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:47:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drm/msm/dp: Add SDM845 DisplayPort instance
Date:   Tue,  9 Aug 2022 20:50:10 -0700
Message-Id: <20220810035013.3582848-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SDM845 platform has a single DisplayPort controller, with
the same design as SC7180, so add support for this by reusing the SC7180
definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e4a83c2cd972..699f28f2251e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -178,6 +178,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
+	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{}
 };
-- 
2.35.1

