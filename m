Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF96A526BA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 22:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350826AbiEMUhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 16:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353047AbiEMUhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 16:37:06 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCB572E13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:37:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gj17-20020a17090b109100b001d8b390f77bso11815625pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=phxoZ/ScBfaDhvqeCo8S88ykmND/qvDtWT32Bd3MGQ4=;
        b=KmeWsNFRi2WfNcJj+LyJPDG0ZIwUbksePvvEX6dgio1W7taujzco64VhWvvZ4xjXD4
         sFxkWlMO8tlP26K2qUkxs3JrLKtpTyZZ0C2Tii0vi3ufF0uvv0/xFkYt5Oh2YvioqM0Q
         gyhdCqeCLXCMqdLKF7Chwx8WgbEVEEJyJCSFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=phxoZ/ScBfaDhvqeCo8S88ykmND/qvDtWT32Bd3MGQ4=;
        b=wp/7F6kPtI9nNn8jOu9fOzVYkZZhcahQ6pFPl1K/itRwOw1HkwUdBEx4vuU5V8C3MM
         xI+BhR15nDDb8C3CzM29WyDKy9rgQ3wKvwCMtc9m6kVpVicSS9WFJ3SezZoqDo9UyWLP
         wDMdcnLflBy1YMPpS6clm39CHkQYcVXxZg7TWlut9JsOdQ2ReZix6bnWSFCXVtxwgwq0
         Hm5bNniVbAq6o6OXXaknyJ3twCg5dpN/WJGeFm7vvuGyzcobvWZuBE3pVa8ECppUoWLB
         oQB0GMANAQ8aKDVB0xfsFILFBclK23tK9BzUVAVBzBI/ty/AbWGANb0caXM3EcVrpJMl
         tTdw==
X-Gm-Message-State: AOAM531dPx9okX1Jw51BPUrOC+zACjTeQl0VNwwkGipOq254tpqdP4nI
        cgztff629zWJdPazA6QsoMWmzw==
X-Google-Smtp-Source: ABdhPJzcSyg5OAJpURTegDQGSF/2vijtHSp1YWjxvfdiE5EqwQCN6uiT77Jz3GpyYZj/E4eMbfHu5A==
X-Received: by 2002:a17:902:e84d:b0:15e:b0af:477b with SMTP id t13-20020a170902e84d00b0015eb0af477bmr6150046plg.49.1652474222580;
        Fri, 13 May 2022 13:37:02 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:bc87:9632:bcce:8e17])
        by smtp.gmail.com with UTF8SMTPSA id n8-20020a635908000000b003c14af50623sm1971494pgb.59.2022.05.13.13.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 13:37:02 -0700 (PDT)
Date:   Fri, 13 May 2022 13:37:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: qcom: Add more sc7180
 Chromebook board bindings
Message-ID: <Yn7BbNeVXV1aGCsi@google.com>
References: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220513095722.v2.4.Ie8713bc0377672ed8dd71189e66fc0b77226fb85@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220513095722.v2.4.Ie8713bc0377672ed8dd71189e66fc0b77226fb85@changeid>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 13, 2022 at 09:59:20AM -0700, Douglas Anderson wrote:
> This adds board bindings for boards that are downstream but not quite
> upstream yet.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I didn't follow the discussion about the odd sku ids (-sku1537,
-sku1536, -sku1024, ...), but they match what is in the
downstream tree, so it seems alright :)

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
