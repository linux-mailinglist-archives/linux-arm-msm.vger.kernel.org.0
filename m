Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92436635C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237653AbjAIXox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237992AbjAIXoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:16 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE63F13CFD
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y25so15612862lfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fcv1oFN64qJbUFhacrhJqgn8l/kgjLzAdWsUtFoBwMI=;
        b=yyqlLqmEad1Eoug+Pqw6mbGdEoWzi9i0T3BssEaafOlNHnw6xaGiWJ7pK5nwqc2J9I
         nCeo3sf8KEXXXjcma5Ag8FZ0k1k7AHvyx+7AQ8AvqEgWsSEFEIxKjlBrzP0bdojrjy1t
         6lCIzTPGrzSjxPMop7dj+ksrZYWKXyIQHWZiJQaHOwQPm9mtkRb38rYKXYH6OrQMxV9v
         Eo/gYeCL/8GFxfJae9UXXcn32c4bcZifjC5DblpUg1CIMdnGUnOggqgqJ1WD4SmZPqn1
         oYFy4VkF3YLJcwNAfAPWo5HlPP2M+oCDWOwsufXBFuG8w5zuhptkoii/XbdAq/vDM7cM
         ZhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fcv1oFN64qJbUFhacrhJqgn8l/kgjLzAdWsUtFoBwMI=;
        b=l4j5I/bGyUhCJzpC6PLHaU/xifJB0/EckdRO99yS1HgEeFXw2mNA+iZIb226lIWX+a
         UwNi2alfNVs+YMmfJWMaPp7CGp6foK5+HKTvCeriElgCchgxk7Uwa5DdL/H3xicI5kT9
         c2rKPm52sofBhqake7qXZMjdvWECufwaJkHT9YKRZmHuHpwpWzUnO8jXagbwFRlCLF8V
         pZhmr4A7bjNbgSD7ILBR5Dk0o+xxaXphHLJ2GetOGihvJLrDSHsTZo2meIignnidd692
         FgRDnNQW5JTrEMjpLSCy9aErSVPgzDJMPALClNfu0whnQp+D1eHgCkjmJWxbq7hdMHn0
         srnQ==
X-Gm-Message-State: AFqh2krlNcRlxpnkHdlyz4votbe2qCrbXYi+pWUEgFcwfu7n7rSg3R4k
        4ODETd5T97DzOQqRSnIXKmSZig==
X-Google-Smtp-Source: AMrXdXv9xequ4FXUhcniZT7Z+xF0zKqFw9XLkFAdfT6Tq7YNkvWypWehJR7aJcR04BckOI+BmqR4Qw==
X-Received: by 2002:a05:6512:3b91:b0:4a4:68b8:f4e5 with SMTP id g17-20020a0565123b9100b004a468b8f4e5mr23148873lfv.43.1673307853149;
        Mon, 09 Jan 2023 15:44:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        quic_jesszhan@quicinc.com,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v4 00/11] Enable Display for SM8350
Date:   Tue, 10 Jan 2023 01:43:58 +0200
Message-Id: <167330408775.609993.7646803775858639381.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
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


On Fri, 30 Dec 2022 16:35:43 +0100, Robert Foss wrote:
> Dependencies:
> https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/
> 
> Branch:
> https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v4
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: display: msm: Add qcom,sm8350-dpu binding
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7a0c3d0025de
[02/11] dt-bindings: display: msm: Add qcom,sm8350-mdss binding
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ddcf30003b92
[03/11] drm/msm/dpu: Add SM8350 to hw catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0a72f23f6ef8
[04/11] drm/msm/dpu: Add support for SM8350
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a596a6078586
[05/11] drm/msm: Add support for SM8350
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d6287e64cbd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
