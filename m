Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1459767D4D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbjAZTBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjAZTBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:12 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0984222EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:11 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id bk15so7656813ejb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoTZ2Jk2oo1sJu0z9U4fY49QhdA4VbOjy5AeWub00mg=;
        b=zFCkTttsnqQaCwrfwAGBQ+ACq42jLXqAWnuY3wlE2cC4ZthG4+0G+HgJQQeQumj6uA
         9grSD+txpZ1qgxQrl4PoeyYbQO6FjTtbmqIkKCPQZGCu1+gfh7DhFVGQZPdJGYoZuZlY
         Y1ybkASLuGOK/ukJyFzJ2ODZXfomJFWKEQUo1tstN3N/ZXdKMllxHG3xhEm1K5pbBkO8
         idQ8LmnhVupZYF4X7bmAb0wnQI9Ew/sgMTXVBo6n/Y4UQTng0pPdLR9bDxFv1X8npW8A
         tJ7iTu9f/3sFqLIHdeqpnqiycVHkZg4oxaByZ6McSd5oeXHsuiYfw1yLm4A2Zj7PW7Ej
         O4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoTZ2Jk2oo1sJu0z9U4fY49QhdA4VbOjy5AeWub00mg=;
        b=PyFYEcOBMENr4sbY+x3Zv1h8BMr2oAtu5OncODoIR62nseqqtoLTh0kmxCe3dO0VNY
         ivgeOt2VS+cB69VeSDvYiRIqZ82CeXY2o7Zpo6BGt6uOmBy00EwLf+W7T60E45Cynvtl
         QFhGRotiTDEKq5CnbN1xir2kEbls0sVOuuXX90u3+fkQADH3FG8FKq0PNvAtnhQRL8yd
         xRen7D4B0ByKkp7hIuniH6WxerZafJ8tFRFlT2IKMWYiUxJpNqzuAfvxiGDimyCSHWU7
         bEnUjTItXHU0nN4HmBguiptyHlTAuEPe1r8keYNvrC/M+PkPOF9QC6x4q2si5NC9rJL5
         f/0g==
X-Gm-Message-State: AO0yUKX/z0sgtQd19Ml+UFvQ7kUpAT4Xm3QmlTv757/wQeapjrfzGz6k
        aIY8OWvnL3Vko4oYinoo8TirkQ==
X-Google-Smtp-Source: AK7set8CoXdSqRs9pJYWdfzKjq27yB4L36ss7j8AdDvAqlKH7VBunIDH1x18EQGPeIozH4cWpvZp0Q==
X-Received: by 2002:a17:907:205a:b0:878:4e5a:18b8 with SMTP id pg26-20020a170907205a00b008784e5a18b8mr4548339ejb.66.1674759670455;
        Thu, 26 Jan 2023 11:01:10 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [PATCH 0/4] dt-bindings: display/msm: more dsi-controller fixes
Date:   Thu, 26 Jan 2023 21:00:54 +0200
Message-Id: <167475959093.3954305.15907989272487832068.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 05:24:28 +0200, Dmitry Baryshkov wrote:
> A small set of patches to go on top of Bryan's changes to fix a small
> number of remaining issues.
> 
> Dependencies: [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230116225217.1056258-1-bryan.odonoghue@linaro.org/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm: dsi-controller-main: remove #address/#size-cells
      https://gitlab.freedesktop.org/lumag/msm/-/commit/65e835945aab
[2/4] dt-bindings: display/msm: dsi-controller-main: account for apq8064
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f8e5f8b2ea4
[3/4] dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2fd5293df88d
[4/4] dt-binbings: display/msm: dsi-controller-main: add missing supplies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/05c578d51624

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
