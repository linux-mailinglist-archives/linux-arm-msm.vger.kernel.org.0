Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1842640ACF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 17:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbiLBQba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 11:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbiLBQbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 11:31:05 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E81F2E6A1
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 08:30:35 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id c7so3365010iof.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGI79l3SB2scnIYPbbhh2hhFnWNncxoQkx+8jpYYaN8=;
        b=GsR7n5qIgPW+1f7kTo/JlCpHSrf1WCdh3jPpQddfge5gMtUrhk5D1sPUfrGLhAtG7t
         FNwRT+mGFpmBPFCoG9hCcQ+XoFhGjBQG22EToyuBfCkkNtBQwyZRZosUeA5MZvQXViku
         cf6fyOcAdg1JO6PBSOS7Cx3tH2XtVlTr3OabA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGI79l3SB2scnIYPbbhh2hhFnWNncxoQkx+8jpYYaN8=;
        b=I0ijUPeAu/SjCpXuPXYO9Aa2O9wWnyL5gvHTBASVHJQR/u9oNaE6CZYKvDvseuBmiw
         9Z2m1uuLf0ku11+rKDtp/XAF0601odkGntq9yZFyq3PLqBN53Fi3FAIYjGEs2wcIa/6Z
         cnNm/g7S3TQLH/08xwr2agrW9rVDKlIcN1S/HOmKcZZSPME3gOhkqXRxpAsW3RKOibvw
         ujEkObfro1AjCthN49S2EEfP3WMWm0q+cUPa2UMEgonOPFFHeNceQ+sK52/9BclQLfAH
         iZEYzYv9jr2xllxcctJFoINEre72phd0t8eNDfrhNocU2iLGBQmfH6/1aas/t8IQZM8s
         FVOw==
X-Gm-Message-State: ANoB5pkzF2nlTT9PGNzbCj5rrsXp09MDUXevfhe8Ow3l5Vj9X4dTiFgS
        SmqMefkedmg/wWsDhhw4SBo5Tw==
X-Google-Smtp-Source: AA0mqf7A4Sb/myv6BWvienPqG3g9CQzW5iEVb2ADr2Mn6YNdixqQrqPxoPmb3nLpqUyf6mSPcop++A==
X-Received: by 2002:a02:715a:0:b0:375:260d:56ad with SMTP id n26-20020a02715a000000b00375260d56admr34073591jaf.302.1669998634914;
        Fri, 02 Dec 2022 08:30:34 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id i14-20020a0566022c8e00b006df19c8671fsm2845290iow.27.2022.12.02.08.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:30:34 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
X-Google-Original-From: Matthias Kaehlcke <mka@google.com>
Date:   Fri, 2 Dec 2022 16:30:34 +0000
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Stephen Boyd <swboyd@chromium.org>,
        Abner Yen <abner.yen@ecs.com.tw>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v13 2/2] arm64: dts: qcom: sc7280: Add DT for
 sc7280-herobrine-zombie
Message-ID: <Y4ooKlcDdfHPzEpw@google.com>
References: <20221202095048.v13.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <20221202095048.v13.2.I80aa32497bfd67bc8a372c1418ccc443ccf193e4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202095048.v13.2.I80aa32497bfd67bc8a372c1418ccc443ccf193e4@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 02, 2022 at 09:57:03AM +0800, Owen Yang wrote:
> Add DT for sc7280-herobrine-zombie
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
