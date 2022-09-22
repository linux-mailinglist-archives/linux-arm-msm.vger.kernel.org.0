Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BB75E6881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 18:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbiIVQeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 12:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiIVQeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 12:34:23 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15ADD4CA0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:34:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id sb3so22247325ejb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Im4t9lnX5R8DyS/Oqe89/5RcWfGnhyqZe+p62UWe9Qo=;
        b=Xh7fkD8mev4MAGIdOZHvcOICVshIyRbeR0HigP2a9U/aMnCKzZ5Uctq7lQBfqZSZOf
         7obnHbGc8GXP7p+qEAJ2MZsfGsSP3qD2wR4Ud70TzcdKV3Lu1z+VwryD+FscawLJsm2R
         0n8MmSvs111TR+ULATFWpPn6MLHtWVGxNSD4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Im4t9lnX5R8DyS/Oqe89/5RcWfGnhyqZe+p62UWe9Qo=;
        b=2Z6cH5iHHjXjLbagOg0tF4VTQBofBWUjPhnpU8uHAs14yOwhOmvfvi/fqip2n+0qmL
         CimCJ+28vqloeW4nraqgaThK0HjHby2A4BuH9EaBrX1YEua7w9bw9Xlm0vcEP+kCrVnQ
         NLBP3ZRFiUde1YIQe+6kNip8AwOctYdjQbj80DbRkMC6PY79h+DL28b5UWrUjkXkmNkH
         D+Q2uYPR+f6JLp+60ztzCgyOUVsj+boh4TNwNKtegaIgVNedTBaoroMMYRUdH6kY7Djr
         Ukqr27XxDthOOQMeFYy7BnwGoMsS89ta7pjHuW+jbujw1xbBQvP4/4ixPOqhPoWO6Wj9
         yuGw==
X-Gm-Message-State: ACrzQf02Fs7t3QAj+IQlcAetmyzNYpGbfI4FUJ2t5VL82+oLuaqbzZwr
        cnjyznX9k2rkP63hB2UCAkVkG+yva2cYTX6y
X-Google-Smtp-Source: AMsMyM51pj2dvXA4qm8hOfj0ST+HGRsXPOxpiTFLp5JF9FP82S/kKqG/5iSqBqo9atFV02fdyWPaDw==
X-Received: by 2002:a17:907:86a2:b0:781:eff0:999a with SMTP id qa34-20020a17090786a200b00781eff0999amr3591776ejc.71.1663864460292;
        Thu, 22 Sep 2022 09:34:20 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id c21-20020a50d655000000b0045154772462sm4075613edj.5.2022.09.22.09.34.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:34:18 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id e18so7135814wmq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:34:18 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id
 n13-20020a05600c500d00b003b50234d7e9mr2841969wmr.57.1663864457846; Thu, 22
 Sep 2022 09:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101813.v4.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
 <20220922101813.v4.2.Iea2d2918adfff2825b87d428b5732717425c196f@changeid>
In-Reply-To: <20220922101813.v4.2.Iea2d2918adfff2825b87d428b5732717425c196f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Sep 2022 09:34:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiGJ27sGaAPafQW2B3yJe_dSPp55nA-+YFHZ29BPwPgQ@mail.gmail.com>
Message-ID: <CAD=FV=XiGJ27sGaAPafQW2B3yJe_dSPp55nA-+YFHZ29BPwPgQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Add sc7180-pazquel360
To:     Yunlong Jia <ecs.beijing2022@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 22, 2022 at 3:22 AM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
>
> Create first version device tree for pazquel360
> pazquel360 is convertible and the pazquel it is based on is clamshell.
> sku 20 for lte & wifi
> sku 21 for wifi only
> sku 22 for lte w/o esim & wifi
>
> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v4:
>  1. Adjust the 'Signed-off-by'.
>  2. Add touchscreen setting in dtsi.

Just to be clear, I've looked at the differences in v4 and I'm still
fine with my Reviewed-by as was carried by Yunlong.

Also note that this should be the last patch in the series. The
"ekth3915" bindings are relevant to it and bindings should be earlier
in the series.


-Doug
