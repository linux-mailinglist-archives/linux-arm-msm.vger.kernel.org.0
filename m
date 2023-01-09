Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1626634EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237525AbjAIXQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237040AbjAIXQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:16:10 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D70D26E5;
        Mon,  9 Jan 2023 15:16:09 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bu8so15526623lfb.4;
        Mon, 09 Jan 2023 15:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
        b=G1y9r7t4uOCT+XdxQUuK+QFse1xo3Fgg68VHXsdMy7a3yMPp2VvWQi3dyyzq1lsMJE
         ycjOspEcV+5KAwycp/9gt/B0b/q9MsAR+6GHUdfrCIPsqo2y94XTY3b86kcKouCWILVy
         ig1Ec1VD/mqbY+PrPi4XaDUIDj0fG6ygmh+gROdhiVMMv0hYNO0NnoYLQo4kOpipTRn/
         knjLYn8tv5mBwf5l/EeNDAt45GAXJq+TK+G/r2bJB2H/Vq9AQwwt60GNjYdOBultHthj
         cjYKp/yGxh+4WoMCFoC7Gv8JWc19d997yq4cFjO+PbdHWzjWnbVIziX4apnyfLka3K7T
         g8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvBs6bEDKtP8wO7hsql6N2nN0eBA0Rd5yITdA/W0fD0=;
        b=zUumkCR0As9F4GzacMl+BdWrPM6ZJVNMyOT9BwmUUIpxCDMjNfp56rZCCQY+5GltwE
         Qh4gSvfISGxOKPNmrZjhtc+egIwB2GOkpHDbM7XXCp5QHNop0vXLdbx/697hvcXspQif
         SV2D7MgXBX0t6uOB9sZeRDdspkdmNaxwWGO9nGL8Vr07w37dYs6F7kIuecMzHVi/rGuq
         wNxQnKRP8XIulHerLI99PZgJzDRSwoo59aXRT+mtgB9rDEtLWso2+K1hCwfF1HQ7Ys9i
         Ouxfb/LYeTd8X5Yy53yHy4X7SmVSG4MZrhvQCtU1sznwe/y1SRbmKyHK6Qo5qNWb5LmT
         rW6A==
X-Gm-Message-State: AFqh2kpyrRYnk/cMZ34x/VphEX6Hu/n9HoVEhbYrow/57tjsXcpkTylJ
        XmyHha+/X4ivFIe1DZIbSPw=
X-Google-Smtp-Source: AMrXdXvOHAyy+z2Kd3L2Xj5tL7nzBB++EQoQPSpNA3MZ4zv9ECLiz2BDQH1aR1LezSkl6ePebDCh8g==
X-Received: by 2002:a05:6512:2a96:b0:4aa:8811:4c59 with SMTP id dt22-20020a0565122a9600b004aa88114c59mr18254342lfb.28.1673306167695;
        Mon, 09 Jan 2023 15:16:07 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r12-20020ac252ac000000b004aab0ca795csm1835413lfm.211.2023.01.09.15.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:16:06 -0800 (PST)
From:   Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Message-Id: <167330408776.609993.2562174494126788375.b4-ty@linaro.org>
Date:   Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 07:44:07 +0200, Dmitry Baryshkov wrote:
> Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
> SDM630/660 (A508/A512).
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: gpu: add rbcpr clock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9bf1e33f9ca8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
