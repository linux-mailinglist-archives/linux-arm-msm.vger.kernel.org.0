Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4122A6DB5E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 23:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjDGVs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 17:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjDGVs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 17:48:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EF7C650
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 14:48:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g19so42798804lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680904103;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DllG90e1WWVTHQdAKRkXXv+zJvR74w4Quq11ghlPJtY=;
        b=OVyB1bAFGN0vaGLmVCCfIH5/O4EAIz104DNP3AiG1HqDZ6ggD45bD6puMR+66SwJSK
         4ZUAKjMTvJqwjpGxxauYTX3B3Qsy5NOfW3GSp6NCJY1Dbq0SiP8vRE2nv87+iJxdV3Ff
         b4b2Gr4tI95SF2pvloDwpvasMCAXEcUsELAo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904103;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DllG90e1WWVTHQdAKRkXXv+zJvR74w4Quq11ghlPJtY=;
        b=6SQgPr7+fvNvGkrghwv9LUkYVt3YtCn/af7ahMiCCixhSkoVYMyZY9ys7FRKwq3MQV
         gfM7pfkFHmzz30Tucree9N2mri+qv9FIk0lnLKjx81J0T+qM45ohigrwT0QbX2uXSpre
         hiomBHBRXQ3on1bAO17RgkWZzzqur80i8gKh74s6QeCw13mf8fn6tpN46Fyb957WJljO
         34mXyLAj2KhWYmD6b42IdlIvh9SBPUW6FfMvOy22k0FdpCI14SXjz3PhkYsLyoktciVy
         wwO346ZAydHjsgT/waW8UwFt2hTprDCv0HCiwFTWNacIAg9v/1Hjr+P5Pyxh+5q99JCB
         +AiA==
X-Gm-Message-State: AAQBX9c6DPiHXMr95AawKL3VvZsTUW+Q1kRr0cLBcsTa1pxIUwBNWhub
        6drLOlcaShDkuU60iBlJLOKWbMmYQ2g21jiPrPlF3A==
X-Google-Smtp-Source: AKy350Yu9m9x8GYDbA/5kgPKVUoE6uvF5g/lH6PO8SorwlwARoXyVdIMeX0FCOQzbIDqgqm+YxpKrwGoFLvyzeXjW/I=
X-Received: by 2002:ac2:4c14:0:b0:4eb:eaf:aa00 with SMTP id
 t20-20020ac24c14000000b004eb0eafaa00mr1109097lfq.4.1680904103550; Fri, 07 Apr
 2023 14:48:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Apr 2023 14:48:23 -0700
MIME-Version: 1.0
In-Reply-To: <20230407092255.119690-4-quic_mohs@quicinc.com>
References: <20230407092255.119690-1-quic_mohs@quicinc.com> <20230407092255.119690-4-quic_mohs@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 7 Apr 2023 14:48:23 -0700
Message-ID: <CAE-0n539B++ynhR04xEDiszz7u718QGLyN4KukrPE3ya6_m9Zg@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] clk: qcom: lpassaudiocc-sc7280: Add required gdsc
 power domain clks in lpass_cc_sc7280_desc
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        quic_visr@quicinc.com, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mohammad Rafi Shaik (2023-04-07 02:22:55)
> Add GDSCs in lpass_cc_sc7280_desc struct.
> When qcom,adsp-pil-mode is enabled, GDSCs required to solve
> dependencies in lpass_audiocc probe().
>
> Fixes: 0cbcfbe50cbf ("clk: qcom: lpass: Handle the regmap overlap of lpasscc and lpass_aon")
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
