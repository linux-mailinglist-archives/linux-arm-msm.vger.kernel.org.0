Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9C066358F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237958AbjAIXoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237962AbjAIXoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:11 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7723F3D1EF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id cf42so15636050lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
        b=D91kA370v1Ibjpwq0d6nIIOvQ1av9dICKJg8CSSMheH4MqYSESDGMdgyLpN8Csr4fR
         Njd/3P6uQsAzseNtpsoxIdpxOS4Abi69RCJs9SdDrqG+cpprSf+MWD0U9Kr7RPxSadTK
         s734qt40k254vmi8hP/hxGlU4ImTPgE0ltRI/j7+S2HtM1b9dwMC2xLG2YFcFfYYYAcc
         EO4i5pYBQlmueyRK/pBFFTge5IuIAzTnmdZjfxzy51a41nrLde7LjhrddMt69qakbnQr
         wqqHAjrpBQlu0PJ8LlQdkf/LFcNtXlStrEYQV0paVpbaP0JHKyNUU3Wupr03Hxdb2khy
         SE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
        b=RVPZNNJHOLJP3uTdVzqKvMWdDqb/Q7WQhWrBxHLgUye1N8w5EZjtplwef1gr9pK/RP
         1GTWHkvDqbZjgbK2Bfujxo4iYPbOUmJgPCnccBhnP7L0lO6yU6FUDja/u6E5HoyXOvPE
         5EwBZwfPn4L6nOXD8Obu6THbBpMEH8hQN08cgLS/v+MlnA5D5kug8LgOdF30ZFF9VLWc
         p4pAe4hUaHKzh6Q20q/CPw4DPf1QXgICBPa32j2k64HEsfa12n2egY164FtNeVhfApP2
         e2N1bn2bC6nUpPNrk0tiIbXxWKZJpcfq41UIxn3DK4vtobKufWU5iZlLa689RUEZI+h/
         TdFw==
X-Gm-Message-State: AFqh2kpNm7faSzuDMO67/bn+NlFBOyh9xoF/9rpgwKOqcm1d98v0Evda
        f65nsPShExU+2l63sl8X1jA+xQ==
X-Google-Smtp-Source: AMrXdXsFIuf4QQmVz+QkO6uFZg1ZOADgI3mb28RuhdCc6Dcd0DdQzCZta5vI8h5WrgQ2E87EQhSMLg==
X-Received: by 2002:a05:6512:695:b0:4b5:2bbc:e119 with SMTP id t21-20020a056512069500b004b52bbce119mr32182194lfe.65.1673307841874;
        Mon, 09 Jan 2023 15:44:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:01 -0800 (PST)
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
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sdm845-mdss: document the DP device
Date:   Tue, 10 Jan 2023 01:43:45 +0200
Message-Id: <167330408776.609993.17059327526924867379.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
References: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
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


On Mon, 09 Jan 2023 06:54:58 +0200, Dmitry Baryshkov wrote:
> Document the DP controller added to the sdm845 display subsystem.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sdm845-mdss: document the DP device
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d26407788cc0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
