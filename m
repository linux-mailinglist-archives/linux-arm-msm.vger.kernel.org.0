Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85514C9A9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 02:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbiCBBkp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 20:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237273AbiCBBkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 20:40:45 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A064A1BDA
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 17:40:02 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id z7so469927oid.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 17:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7r8DktoMMiU6kxZgUtdDfLqEPV/rwGM/wklZZcGwOD4=;
        b=WdqbcJlWPnIcq2+R/OIykf8Q79FLutQ0RbnFIsrAEpPLjz6XCU1oay5mqgDdvCJO8Y
         NZOPAE6HdrFggV3YuxmiHX1E1Zify14iFztVq+7HKMczhnlVrz3iIAocivmbdioHcHT4
         4CPih0Xbfoqhdwta56tEDFVEySyZanmiA7ftc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7r8DktoMMiU6kxZgUtdDfLqEPV/rwGM/wklZZcGwOD4=;
        b=OX7K7n3prdapE+9yDUFSkCGlKKDfwASDosqezc+hVq7ZX8o12Gc0/rAVZ/4BZVcbd2
         OWBiDs3W3ENEHWlIw6/4i3V+AAcUR7FNADeo1U0zXtuF3sdqcP5FH58d3yOT+WTtv9Na
         UfOGZ4HNaXINTra5y/TTimH4CGnj7m58LH2kMwntYFZ6KPXWnwouGXM2B60lIJ/Bg0m+
         p8UJgUcZuH7mAkMhwX9nvtXCbLKFb229y+vaTSS0ToLA1WLjAx53yN/C5J1rZ0RwZPXw
         zrOS++dlHxV9MPgyfsH+FUsz+N/F0HbRRdlAcWCpjCjW4Des0Bl8TuBmyoACYet7QbvK
         F5qA==
X-Gm-Message-State: AOAM531o6uFREdbmrnH9DNK+HjkSpQIqyDoNRklOSvLV4+kmxWEqOIhM
        5t9fQcUs5H5inAf/95dl3s1Qkfk4e/05ITTbo5UOGg==
X-Google-Smtp-Source: ABdhPJz4RH+Hn9px5XpnHBpdIX3jYHmWz/PqejcAlUI+/KcKmgS9mOVXw0I7Y3pQHCbvaFV4ZDAd2OxUfohCVeqYf1U=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr15561879oiw.64.1646185201756; Tue, 01
 Mar 2022 17:40:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:40:01 -0800
MIME-Version: 1.0
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 1 Mar 2022 17:40:01 -0800
Message-ID: <CAE-0n53oEDNsHnmZJp7GuAM9t-50dnQ7M2fhRGhQbeZ=R8M1tg@mail.gmail.com>
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-01 16:14:10)
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
