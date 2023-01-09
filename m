Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B8A663500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237824AbjAIXQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237709AbjAIXQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:16:15 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096F0EB9;
        Mon,  9 Jan 2023 15:16:11 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so15549297lfv.2;
        Mon, 09 Jan 2023 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
        b=kXzNDKMPeb5e6lJRcwwef0qDEXt9Kf/UfU1M+YcIBbkS3pXfnA+B4wWSrPGHCyskF9
         Rsg1DqAQsfjQBh1td3BfPWXG8Hizai5plx0RmpEy0nVCZ2kgFyThGE4EkBsR4b+Mgodw
         AKDHhkSjq0Q2xJQB8OWksF7b1U/YcKLm9RskjZAUMR+y3QDnukDHRukWoWpWoHnX2C8B
         Zl/JvgDeyn/5cv2myxEmJNi+SFhuas+YcKJb8UxJthU0A863lh4yjhPfUn3CTQ06DvWn
         8o84QlT+cscfbEAyLt7ARgnRXZS89/VWWpAk8gv48bgL2A7qpgzFRON46sbvWWgXHL6m
         toEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctFTCfSoJjTZfY+rdJcn3BKR4sJeVp5aACYPINpXosE=;
        b=7WfxFMD1I09Q29OAm+QAoEMuDuX5o+dqQZalO3UP8qoUCH6aaDHlSTin/Ae+S3Jaqb
         zcmpTpHrzJdWknRl9ojxpV9yONQasBcRTqEja0ZwuGaWUWfQWwLATJH940P2Vgepi6ne
         Y9mLgwKSOEQRC9S+oe54YZ4odtNWoo7rCltrdc5p/Dtc1Zz1HjAvMveNdGD+L45bEe0T
         9HFyxkmYV7DdWrS9UNAM47uFhVp0HRqbqtb24V8H4VE3xmePNQDKNZDXUUOWSyF6yTpU
         r4pjCRg2CWGCSI8KfqsF4iLbXtwXouUeGDOdZ80VJCcRrdNjQesEtJmjGltzFyl3OJry
         4HDg==
X-Gm-Message-State: AFqh2kqUziWXtTXavFtrPk9DXw5i6bn6hYqGCNQuSfv2+kX7BC2Vpj56
        28ZoW5VFqIwo5ty4p0JYELg=
X-Google-Smtp-Source: AMrXdXvsvMbJMxbVIOP7MhGcARYLYTaMj2qJsVj4hOLnwTk6gCkRAHlDRVLXezAOi1HZGO5X8RuPjw==
X-Received: by 2002:a05:6512:2314:b0:4cb:4571:9efe with SMTP id o20-20020a056512231400b004cb45719efemr9847698lfu.35.1673306169077;
        Mon, 09 Jan 2023 15:16:09 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m9-20020ac24ac9000000b004cafe65883dsm1847495lfp.122.2023.01.09.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:16:08 -0800 (PST)
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
In-Reply-To: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
References: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sdm845-mdss: document the DP device
Message-Id: <167330408776.609993.17059327526924867379.b4-ty@linaro.org>
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
