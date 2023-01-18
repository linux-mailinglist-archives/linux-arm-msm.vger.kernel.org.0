Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3168F67109C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjARCGg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjARCGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:31 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0354E53D
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:30 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id bk15so22322761ejb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzS/zvWe4dE4qAlzyHEWNojqR1ZH/s6LTLUTq8cJCDs=;
        b=x1UIMFzhhzmPp33rMJL9P9/UdyqBh0ezz8HdRiZ+FCVBLR2OShryDc+uG9Xvznt0vB
         5cCrPmQCV0teL8HGC5L/s4RV3HC8ChldGjXbGsiZwjPVrQe2smTtDRRf7iqYqqn86TTk
         LVQbZrb/+9Zbg3bHkzZp0HPycouflZYRFZ5BApQc5fCqveUceFQQI8X4Q9TodF6H0E+L
         PsV3n7mIYFa0vm7jF+alaBDlUtsWJcHIWlCpZuUQsUxXdr+eF8htRbeQoPbKWKoaWv1C
         w3P3jvnRQvUG7MFjeFymVS6p0OJBFlCKHbVNzYuTwjmpB+1q1Q1MGH55JGmDjYtJbDaG
         2bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzS/zvWe4dE4qAlzyHEWNojqR1ZH/s6LTLUTq8cJCDs=;
        b=sjzf1Zl5ai5ySQsJrxebOjlM+Kgali7bPLIEHI0fAYLuGcDC4wubV3c7jGLI6iq2ro
         KQ70qWm7dvBTvqgnUq8cIdT5UKzOUHObICgugpveLoqC1xZ3emGoNC/8qQPTb6DtOLWI
         XXzotnTpsdcmuaov2sVboD71mmDF63dRVvj39spAepK42P2BTIIe69B/lhe5TsjEMQZj
         8OaJ/H1rS+MD3Z3je7jvuQYmrB1qFnFFwU1OuzeIYZREt57gTpSfEbK9BK+JjYzlUazh
         fA5XOcagGiyzLieK1f48u4wPNlhdxCigpxnLh9J1+3D3K0TLDPft2pnA2moljNePiAhH
         7o9w==
X-Gm-Message-State: AFqh2kqqYbzx6U8QTM2oFEXjSodp46SgOBBumf1Cct1FzId5QK0tw+Me
        HlbAXl0JTaMxKSAaopRPsX9XEA==
X-Google-Smtp-Source: AMrXdXtPspMwAZbGwbr77eEM5eDgiYrt4RPaQoYwIAtRNNe3VLezx4/sosP5jnJFOjMOoW2VPQl9oQ==
X-Received: by 2002:a17:906:ca59:b0:870:7e7d:97a3 with SMTP id jx25-20020a170906ca5900b008707e7d97a3mr4427567ejb.59.1674007589171;
        Tue, 17 Jan 2023 18:06:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:28 -0800 (PST)
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
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node names
Date:   Wed, 18 Jan 2023 04:06:11 +0200
Message-Id: <167400670545.1683873.1367688768865327080.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
References: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
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


On Mon, 09 Jan 2023 06:54:53 +0200, Dmitry Baryshkov wrote:
> On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
> phy. Follow this change.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node names
      https://gitlab.freedesktop.org/lumag/msm/-/commit/759cc4914fb0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
