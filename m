Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86981578EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 02:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbiGSANZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 20:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbiGSANU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 20:13:20 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C02A37FB5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:13:18 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso4480365otb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tcMPkgy5AkYVoz+3cfHB2slyw4qwE3dhd9DnPWhtJMc=;
        b=LLO39Dfu3dhAmJv6RF2nqh5TD7PjF/dptrPchH8NYHTaBeUmpa988m24WqNUmZ6mrj
         csCZTfbPCAg4mBav+WbY79TzDknZUQ5qLQ/DbNqRgOWzWuYrlP4Kt2OTH2BguR1fL6/N
         6UKFk98Y27/36eSRjwlMm9G4KZRPKD1p12tYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tcMPkgy5AkYVoz+3cfHB2slyw4qwE3dhd9DnPWhtJMc=;
        b=vIaWVsaL4SUxJPXSzVp2m7r1AWywFW6I8fdjqKRIPjLvMe+jcJehlQHKi/A4z9Nyju
         tj2xstSlLR+EWsvumtVP68uEejRBhNj7uz6DT/JH9hYzB9CBuv2zSfWJWCpom3HPp0ax
         1B0rpHR9XcqjZMszGIXunDDrkuw8jYXCyJQEkgk7XAVgER8P/YyNPEOJEfIMRgxeVJTu
         42xJY7VcBoFQ26FEk/GrUK0KCXeABUVIiTYsyV5K1e1VUR5Ebkhn+Uef4a9np4+E4kNT
         1P5+8bjtgi1mazizE7sqjeVRiSeumf5oy06Y9q6IZ3N+tYaZ+Kol2uALsbkdGoBRyBK7
         6cyw==
X-Gm-Message-State: AJIora9KwaGLGk/8+g6qrOxhuTT1LEnJIxlfZv3Gf8/TILuZyoaXSn5+
        lOuqcu16x4q+qSu22NEsHLaHsDFu5NptZ7DNmNX5NQ==
X-Google-Smtp-Source: AGRyM1vWi89aXjlaCd34r6iFy+/kWv2yYLIXV7zIq7RVPWxgUmLtiyM6+wg9JULu4OxUrtKaNySQPrm92VWaoteipX0=
X-Received: by 2002:a05:6830:1d88:b0:61c:8b2a:22b0 with SMTP id
 y8-20020a0568301d8800b0061c8b2a22b0mr7059089oti.3.1658189597554; Mon, 18 Jul
 2022 17:13:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Jul 2022 20:13:17 -0400
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org> <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 18 Jul 2022 20:13:17 -0400
Message-ID: <CAE-0n53ONeCzX5jAOmGACjgXqLGSSmsj1jY60WL4MhP0OfPrsA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register block for
 DP controller
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-10 01:41:27)
> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
