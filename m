Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E23B72145E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjFDDCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjFDDBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:49 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F331B3
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:47 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f6067a9029so4379746e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847706; x=1688439706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwdXG6TznS6YsdZeNc+jVXR47t5rcv+aXMQckTFPgWg=;
        b=hUItQ2HUrJfQHD/w1Vh+fWuxshHXW3x8Em4GmH5Hj/N8KfT63vPtQjI8tf9O6P9UcE
         /6UpGrnL4fwsv1NPwcwcuXObDAsdQLktfqm8MIrw0RKDaO3nzKUvjP2HCdk6zUn3ImU9
         oRzqhmL0fTjlpJViDr2L+yRsvw9J54t3OAsc/+8F0auPwjB9uyM0VtZ6osBhN3iwTg8+
         EK9a7pHNVT2B4bbgJBakF5T+0KQsMI1weiKD9y+Ti8gzmub4CnWviO134DpgycJWlR4t
         z8xC++6Af1HU1FgeAgwZHfDmqKAmg69OlbvdeD0d9gR6WIvx/19TWYKaBOgkivbEQJQe
         P6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847706; x=1688439706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwdXG6TznS6YsdZeNc+jVXR47t5rcv+aXMQckTFPgWg=;
        b=cVQJ64Ule2AzJq+2ium8xOS+ne4ecBAyLZEyJTRvk0JnHtABXtQTfj8ptHSEg5zXAK
         TcMWX+kEp3OSJRy0Zb1i/ZYCAHwlCFr46XkOoSlFLAnn6mwWRlCb+fAF29XKCZgn7I2D
         0ZZfoTDwWY9Pppw3E6z/COvgrMCr721p3w/OspIIOmwtIELUX4xc/OUCmBwXvLfC9CYW
         U5CVtkGnz6nrpx/Pe20lT9/q1l8AuL4BJiJE+OTBi8QWrGVXSlj4zwj8TX8yyENKfoEL
         /1aiX/mbrcjhyiOxuh2h27KFBEOMyxhtvLhXIvZopFk5aWGdebZ+W12oY0XYZhOs9Wlh
         BLsQ==
X-Gm-Message-State: AC+VfDxZ4L/IjcdkFouOrsTE1zLwZFFxchRtQXRUHub5HcZky/XcFaPH
        6hsTqABtiYsnkLWsWocvCOugbA==
X-Google-Smtp-Source: ACHHUZ4eJeV67ZtXqpRqs9jL9lgSaKyZUHm7qTxGW709QMtSD6UlDTJblh8Y+ZXxAsDs0+MaxbcAIw==
X-Received: by 2002:a19:ee13:0:b0:4ed:b329:5d85 with SMTP id g19-20020a19ee13000000b004edb3295d85mr3405592lfb.15.1685847706163;
        Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: add DP Controller to SM8550 DTS
Date:   Sun,  4 Jun 2023 06:01:34 +0300
Message-Id: <168584750425.890410.17653839132037298856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 01 Jun 2023 12:09:46 +0200, Neil Armstrong wrote:
> The DP output is shared with the USB3 SuperSpeed lanes and is
> usually connected to an USB-C port which Altmode is controlled
> by the PMIC Glink infrastructure.
> 
> DT changes tying the DP controller to the USB-C port on the QRD
> board will be sent later.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: dp-controller: document SM8550 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/76015b9e573e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
