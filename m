Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC45868DFC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 19:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjBGSTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 13:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbjBGSTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 13:19:17 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E396741090
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 10:18:13 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id z2so6387090ilq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 10:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQMCLtY/o/lcP2wVxbKEZHVTujPOs6CF4TCboKmWfnM=;
        b=DYiZQ/QlyBeTa/mCDWni3T7T/0TILBtLstqv2EawL1Ewt5HTPQKQIbVG8t0RJoY5sZ
         7CWDsy4IjKqxxiPS4ke4s9Tgez07u870yZBp4cCdYjwhvqUr6HrM7ZYCgQqyGa1ZFnVF
         xsUWTLvKoPpTXYX29+5exDtYHvXgWQzD2Dw9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQMCLtY/o/lcP2wVxbKEZHVTujPOs6CF4TCboKmWfnM=;
        b=vkXPjymSIXcvH/2nvTeoAgJPnNHOkAjvwZpi9hDeMjwmOzi+P3Zf03rQuGShSvpMF6
         +KdhPBaf5ugquSgCYWRMVsjKtfEz1+RLqwcVJR83se+9J2Uyy6jjWZTB6HLorZriSkGy
         Qp4v07WkeJ/arUiz41enXdRnfc0eHvtZpt8zcqD1hQyRUlaSP78vehEzE4phy4wT0pGO
         PFbf5jsaobqUpE2aSjKNs5H+tSb7AnV57r6CtbiKB7OrJ7s9yVHjBg6zSgCI1EzJCK8D
         s7HECma4U7nzCugTo1HozClukkEktxradbFwgp2mJB/u1SNvOFxe84TK10UCz3/RBER2
         BgaQ==
X-Gm-Message-State: AO0yUKUaNHfwtYs7XyiG50NpRho2U+yWCvUQopFAnoERskBd91SMqxd5
        bX1MWneCODYWTlFVWLdHpctPuA==
X-Google-Smtp-Source: AK7set987uZbgR5yZkVJT+jrgFpaiDdCBjJhqCqZZGfbB4Gk0XbPD2P05L05pZgj2GUSaLAHeDcYig==
X-Received: by 2002:a05:6e02:178b:b0:310:a06a:d0b0 with SMTP id y11-20020a056e02178b00b00310a06ad0b0mr5382939ilu.10.1675793889892;
        Tue, 07 Feb 2023 10:18:09 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id e1-20020a056e020b2100b0030c27c9eea4sm4352263ilu.33.2023.02.07.10.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 10:18:09 -0800 (PST)
Date:   Tue, 7 Feb 2023 18:18:08 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc7280: Hook up the touchscreen IO
 rail on villager
Message-ID: <Y+KV4D0iAp1GxY2p@google.com>
References: <20230207024816.525938-1-dianders@chromium.org>
 <20230206184744.3.I740d409bc5bb69bf4a7b3c4568ea6e7a92f16ccd@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230206184744.3.I740d409bc5bb69bf4a7b3c4568ea6e7a92f16ccd@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 06, 2023 at 06:48:12PM -0800, Douglas Anderson wrote:
> On never revs of sc7280-herobrine-villager (rev2+) the L3C rail is

nit: s/never/newer/

no need to re-spin just for this.

> provided to the touchscreen as the IO voltage rail. Let's add it in
> the device tree.
> 
> NOTE: Even though this is only really needed on rev2+ villagers (-rev0
> had non-functioning touchscreen and -rev1 had some hacky hardware
> magic), it doesn't actually hurt to do this for old villager revs. As
> talked about in the patch ("arm64: dts: qcom: sc7280: On QCard,
> regulator L3C should be 1.8V") the L3C regulator didn't go anywhere at
> all on older revs. That means that turning it on for older revs
> doesn't hurt other than drawing a tiny bit of extra power. Since -rev0
> and -rev1 villagers will never make it to real customers and it's nice
> not to have too many old device trees, the better tradeoff seems to be
> to enable it everywhere.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
