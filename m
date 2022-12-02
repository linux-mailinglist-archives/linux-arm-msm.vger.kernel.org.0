Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C40B640A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 17:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbiLBQJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 11:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbiLBQJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 11:09:02 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC82A94902
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 08:09:01 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id n21so12592675ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lv5UzsGC5MNuyMX51lzq8lQHZSD5qCFW0KbPV3N8yA=;
        b=dHkIQtDWVxEzkcR9PWkORdgWl8wQJYfleFiUtDlLhO2HldA84X5tRjuMoTlAAEsMGo
         Qulu3evExmDVuVSuIYaMi5eDn18ElcfYbcklsiHd1mLy48yHzoBKd4YfJgIutpRBcYz4
         L2xut/t837fa812aTvn25G+M4SLiEhL47Vxhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Lv5UzsGC5MNuyMX51lzq8lQHZSD5qCFW0KbPV3N8yA=;
        b=RcTZm7cKCTVGGL9/qzuwqYur07tOurbL6X6Vxja0QGbWw4ZCG+ohrENG1KnW5Sm11K
         LsrzDH5Awylz1MsHzo69jcLSUwFNrOFhyxi71TUz2pZL5Dgn8AnS0+4H/5m96CXJc6L2
         Iea7huEwXTY47dHrBO80bWsKZtYkBQmMyna52HErTTzFe8KvQ0q/BAdgntbdWb1dZKaV
         XaoabS+7HDe8+v/YykMXIuAhQWjJYdTt6zv5gKHUzs075OvLu43PGu41q53BqxdGMKj0
         GPx/RmTxQbt25+P7WYJ0TUfpVVP7M5ZA0tvyJhhxuEklSVuQsmkCK2MfFu0NJV6V1rKB
         0A3A==
X-Gm-Message-State: ANoB5pn4Hmmeuq8zehkePBXGSNIEjYnKmzCq1rDZBakuG2N9Y8InbXnj
        BDiJx+nKQtad8pwKxRmHTrMJrc1UsnL1iVDBau4=
X-Google-Smtp-Source: AA0mqf67yh0tr+0LSbEqsIEjseEDkMJcKRraVb1nROYFQRrP2XHqbEG9QMX3gpnqx4sQx5+/en1QUA==
X-Received: by 2002:a17:906:19d0:b0:7c0:a7e3:cf10 with SMTP id h16-20020a17090619d000b007c0a7e3cf10mr9347459ejd.587.1669997340054;
        Fri, 02 Dec 2022 08:09:00 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id t15-20020aa7d4cf000000b0046c53c3b2dfsm78745edr.38.2022.12.02.08.08.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:08:59 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id t1so3833631wmi.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:08:59 -0800 (PST)
X-Received: by 2002:a1c:cc04:0:b0:3cf:7716:8954 with SMTP id
 h4-20020a1ccc04000000b003cf77168954mr52698641wmb.57.1669997339063; Fri, 02
 Dec 2022 08:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20221202155738.383301-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202155738.383301-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Dec 2022 08:08:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U86PyVQP4wbhwEkzYprJxz2-S3ooniuYKJBNQOudx2uA@mail.gmail.com>
Message-ID: <CAD=FV=U86PyVQP4wbhwEkzYprJxz2-S3ooniuYKJBNQOudx2uA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-db845c: fix audio codec
 interrupt pin name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 2, 2022 at 7:57 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The pin config entry should have a string, not number, for the GPIO used
> as WCD9340 audio codec interrupt.
>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Doug Anderson <dianders@chromium.org>
>
> Changes since v2:
> 1. New patch.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Presumably should have a "Fixes" tag since this is likely a true bug.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
