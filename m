Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34467663589
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237934AbjAIXoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237905AbjAIXoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:09 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3993F47C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:01 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id cf42so15635958lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
        b=mUEInqqmE5Fldni3KiH34BZppU4mDu8PM154qO665GpuW9DJ1ur/7pMXNGOes3kRUS
         h3PYGO3c4F5ygysUMnEgZDYLOiczF75Iu9ZTYjl9VGktg0D3rSoyHLTaKTY80b28KYhT
         C8B4MHA4w5YWGI149aZ+CZVT+X5lK5G/kgpyZ1ZDnGZ3YpzgTCn6qA7EOeAjXhWkcG7Y
         C9APCPRpLNZ8nu1EHqQfstpj1Rmhsttkv7R3prMFaXxAvqK8D9wRAS+xPsOkt2TEWiss
         Fd82u5U+omzmDl8avWr02no8pF2K2id9tLHZt/n0694gANWY4mk6c5/gopHE2Ea0+tlJ
         YW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
        b=wr83onZ4Gs1QFYsSTkc+8XfG1TGARfyav0bRVi2SNfgljsfUXeE1kPXXQFgDHnZYXi
         HrjKbPTzYSZfESkMj1GR3uJh9pWDLR9qfXaEarJk5kr/5hlqV2u1nrvGqXG9ldWtnE/7
         C+NSxcpQhjx427wbdmuiqMEUUYEcB2yva+xNAbm7slJFD3SF0Z/tBhPN2oRHoGeQ+u2z
         Cv+ISHqpYB4CGnPmrvIH6MCBrTc8unpRnK136s/O0t1ohsydXrvv+yjV9cb7DI6sRsdk
         bIfmVCyEqSLxRyZkvu4BY7T5t5OFblZ0KUA4Xvi7B4SCJBcymTHBkrWkRD1idy5cn6g6
         y9Lg==
X-Gm-Message-State: AFqh2kqUp9vda10Forc4UPMGQ2o4kby6MtM+oOpIsNI5ncYx4xCg5iab
        5fedbdAAFsHUa6x6cZb7Jubisw==
X-Google-Smtp-Source: AMrXdXsG6JZKs6w9h/gDGC5MhFo7Dfbs1u2JXcUblsbGBwML27jBekIvWXNSjt2DUKaI9NUC5WgycA==
X-Received: by 2002:a05:6512:3b0c:b0:4b1:4cc1:5ac6 with SMTP id f12-20020a0565123b0c00b004b14cc15ac6mr20815598lfv.49.1673307840097;
        Mon, 09 Jan 2023 15:44:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:43:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
Date:   Tue, 10 Jan 2023 01:43:43 +0200
Message-Id: <167330408780.609993.10652879591606544377.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231170532.77000-1-a39.skl@gmail.com>
References: <20221231170532.77000-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 31 Dec 2022 18:05:32 +0100, Adam Skladowski wrote:
> Document omitted 28nm compatible which will be used on MSM8976 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/852f489b36aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
