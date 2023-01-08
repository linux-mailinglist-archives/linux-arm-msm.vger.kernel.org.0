Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCA966183A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjAHSm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjAHSm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:42:27 -0500
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71583D2CC;
        Sun,  8 Jan 2023 10:42:26 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id r72so3529055iod.5;
        Sun, 08 Jan 2023 10:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOk0eblRh4ROTkJiNfifMBFkqz7mSxV1hUtb//AGMZY=;
        b=mZXqOkqgeu2osrZKPMwnoB6n++KAYdsWD5hz5B4MXl+zyyUj/fE6/1cWgP+shFiFOI
         LyWZxicgx9e5sOI16k6p6UwvyvOfw3rZMu/SUUy17t9uFMRfyix9XGpi0//482qiNblc
         tYTE0Xs6CSlGyXV+8vjajhNfJBk7rGBIZ02T0EU8fsamke9rajkyHqjx8iYi+xFwT7XI
         XOgE3Q7tmpFENhz7raptAvAZvmQjlLHeFuqUUSqgfqZn0sgeqzqzZV2QJjKs+/snwxBA
         w/IWVnaDCHrNxdgGwkIriuU6yObCnATaI5EoHwQ5JvBnpLECzNgkr5fjd5TxT+okTcDk
         MQHg==
X-Gm-Message-State: AFqh2koirC9edhjFWTT+Jwpd4t+d7reHTvxRXV1D2CVX/mm7fipHu2Q+
        02umcBzKlGLMH8PwdcrxzfAyhR8SGA==
X-Google-Smtp-Source: AMrXdXuehyB7nPXDkOtDWPYaaOZVYzVdbUogZuWnOni77gbi4TegJtFjf+mtaVA5nxMge9e4m7tNTA==
X-Received: by 2002:a5d:89d9:0:b0:6df:e475:7c68 with SMTP id a25-20020a5d89d9000000b006dfe4757c68mr43686873iot.19.1673203345726;
        Sun, 08 Jan 2023 10:42:25 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id g28-20020a02271c000000b003757ab96c08sm2171716jaa.67.2023.01.08.10.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:42:23 -0800 (PST)
Received: (nullmailer pid 189591 invoked by uid 1000);
        Sun, 08 Jan 2023 18:42:20 -0000
Date:   Sun, 8 Jan 2023 12:42:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 02/16] dt-bindings: clock: qcom,gcc-sdx55: drop
 core_bi_pll_test_se
Message-ID: <167320333777.189350.5589273126964058146.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:23 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml        | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
