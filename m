Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836E7533365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 00:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242117AbiEXWSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 18:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbiEXWSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 18:18:35 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C0E3FDBE
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 15:18:33 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ds11so18077964pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 15:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eupBg8LTf54BtIuUjheEXOe8DwIV/IRViMAtPJVNdh4=;
        b=e51izz8ZJSfSNb4qSePKnG5II1X+Htfoef3No4FJkwlRsRmSYZrrKMRWCK6Yxwznvi
         oyepdeE1w04FLQraw3LtniwmOWnzehmnMjgYazaSJU/DEOVqXdNas05bQi0Y/F95yIGf
         TRF7VT756pl7dTOV2PL6ghaSZj0ySpi+T6Dt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eupBg8LTf54BtIuUjheEXOe8DwIV/IRViMAtPJVNdh4=;
        b=P+/U8+GYAnz8MbijuxAxIBfC+4GuW0Kwd1tKoEtRWnWckV2UvMaFRWOnGCgY9J+i9L
         nV1RB/YwYTc8dVFc3K5vH7+FcspSdLGGNzQGTpVMVL17dX5SGRmkoaiODjCHDrkXgqPS
         wS8orzW0aXMQ95Cyeulc0LXVJj8oVEWWseI58igCzSI3EqP/TINxpukFvQfMjXhV389L
         uxFSE8RssXAjdYb/nKHHHTFdNvZdn0mHmXLvLafMw1KGofbXKXZpPZSdzqNXZKEO/0XJ
         rKO+RbBy6meB+8TZJMznwlsVyfCVVfQw3Sp++StPrnhf1eEuBNvAERsljgvlGNPHkMNr
         qy1Q==
X-Gm-Message-State: AOAM531dTDhUN+r0TQEbJD0ZpxsZiN3ZG740kk/TmY5y2RPYrlAgFN+1
        J1wsTYR/Ov05pCvg32J2lhvWhQ==
X-Google-Smtp-Source: ABdhPJztA8w5JChWAFfGwFlZBdd9gfh0N78Z0l2MRbGVMqX6joBl1WnZsEQ07XBbAeecVijtbU1nLw==
X-Received: by 2002:a17:90b:4c0a:b0:1dc:e81a:f0c with SMTP id na10-20020a17090b4c0a00b001dce81a0f0cmr7018624pjb.2.1653430712974;
        Tue, 24 May 2022 15:18:32 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:4d83:f549:9abd:427])
        by smtp.gmail.com with UTF8SMTPSA id rm10-20020a17090b3eca00b001cd4989fee6sm27460pjb.50.2022.05.24.15.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 15:18:32 -0700 (PDT)
Date:   Tue, 24 May 2022 15:18:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add touchscreen to villager
Message-ID: <Yo1Zt+iaR/vjZZGb@google.com>
References: <20220524134840.1.I80072b8815ac08c12af8f379a33cc2d83693dc51@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220524134840.1.I80072b8815ac08c12af8f379a33cc2d83693dc51@changeid>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 24, 2022 at 01:48:49PM -0700, Douglas Anderson wrote:
> This adds the touchscreen to the sc7280-herobrine-villager device
> tree. Note that the touchscreen on villager actually uses the reset
> line and thus we use the more specific "elan,ekth6915" compatible
> which allows us to specify the reset.
> 
> The fact that villager's touchscreen uses the reset line can be
> contrasted against the touchscreen for CRD/herobrine-r1. On those
> boards, even though the touchscreen goes to the display, it's not
> hooked up to anything there.
> 
> In order to keep the line parked on herobrine/CRD, we'll move the
> pullup from the qcard.dtsi file to the specific boards. This allows us
> to disable the pullup in the villager device tree since the pin is an
> output.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
