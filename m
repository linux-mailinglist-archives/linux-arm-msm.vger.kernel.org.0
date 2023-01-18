Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF63D67108F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjARCG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjARCG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:27 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBD43F288
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:25 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v13so13604268eda.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04yt4xQQnP6dtAFyamorFDli5j18JC4M48HBXJbEbHY=;
        b=HI9f++1UNXYSemQX1hiRHDg52hCshzdQeQ49dI9inGJXYUSByO6/WHrHEn6aUov9Z0
         woCXty+Gr+WSNWODYzczAXW7pttpln+6Wo32fNKlzpl+ABBqKedSzbJV+luCus6y+ylq
         tTOXrNAZmvStNPPrVLAD2mzhXQc2Ng7F04encX4+rdR08fPkIOYu8jpWKU3LZ7zMsgFG
         z3AlxLI8iAXkXDRgMf7jOpq2egayOpk+4Soe9Bn/KP5b3FTqDkkyQ0IkYcLrV7QiucaJ
         xOoK7bUVMbVEAkU5OCYNXheSbVh7VGBVFNT78j2cPZBcuu3IxfCNGIpKf7XFBPHsQodv
         ejWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04yt4xQQnP6dtAFyamorFDli5j18JC4M48HBXJbEbHY=;
        b=c7sa2EjyLz/HCyaDpkCNGWShaUmMnXdTK19Zwy9TQMUXS7/HXFbpPJOLxd/qaqY4YS
         xTRqX7vF12WwDndaOaLmIRIkiUG00Iho5phATCSanxLTlFoCl82dp60Mfm2bH5HUg059
         I4zh81h7VRHwUYWTKPxxkfR+lOP0eRl+lwbljw15YQcjQdAYd1gQSzEEonN1ucq9ZmZl
         uX/6kjd4fR3pOleoB7kIu8Fo1VZ3cR0qrBOnwxpocl9iuJzaZgumRQ5VGiW4Agbgl5/T
         /5mBBCpvcjYay+hZ5YWE3vRtovPjTeFzpQ8PeK4naFYGqzF5M8Z2KiC9W/WcGa9JaSEl
         gHig==
X-Gm-Message-State: AFqh2krzlebblXnq+pYR1PCPfs6mf8qD+J0+oGAsFFKkAOawaDVNFw0B
        FlN43Yoo8xBzGhbD8I5/msSV68CkiwZ5cAMh
X-Google-Smtp-Source: AMrXdXsBm3c0/1SvoATEKrB2V2Ccdr0KVPvkZK2NVqaD4EJEhMF5BSbtB3jAe4+zL9U5yrvoPppSYQ==
X-Received: by 2002:a05:6402:e9f:b0:49a:f52f:eed0 with SMTP id h31-20020a0564020e9f00b0049af52feed0mr5406382eda.13.1674007583732;
        Tue, 17 Jan 2023 18:06:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] mdss-dsi-ctrl binding and dts fixes
Date:   Wed, 18 Jan 2023 04:06:06 +0200
Message-Id: <167400670529.1683873.13012274230061226169.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
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


On Mon, 16 Jan 2023 22:52:14 +0000, Bryan O'Donoghue wrote:
> V8:
> - Squash first and last patch to fix bisectability
> 
> link: https://lore.kernel.org/linux-arm-msm/167388664232.594279.4607492026981202284.robh@kernel.org/T/#u
> 
> V7:
> - The bulk of the patches for this series have been merged.
>   There are still four patches to be pushed/updated.
> - Adds clocks for msm8974 - Dmitry
> - Adds compat strings for sm8150, sm8350, sm8450, sm8550 - Dmitry
> - Changes last patch in series to state - Rob
>   compatible:
>     contains:
>       const: qcom,mdss-dsi-ctrl
> 
> [...]

Applied, thanks!

[3/3] dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e0c2a96cc939

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
