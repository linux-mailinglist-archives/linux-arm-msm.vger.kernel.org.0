Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8D47E2F3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 22:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbjKFVwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 16:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbjKFVwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 16:52:30 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2013F10C1
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 13:52:28 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso68404971fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307546; x=1699912346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcLpYQwHOJBs1+bgx/XyMohSbAkHSHoZFZS+/mc6OhY=;
        b=XtMWDFxT2X2LyBM2vs1jV9nlKOgjtd2jyewQwPe04aYkMuJkygwJaIUzZ1X48YTKV9
         j9VPZbB0Y9REGxL8AJgkjoDbc3AvLy3ZJ1ii8rsRdrUN/cCR8Rg618bh950smNYHsk1S
         jWVSolYCW9eDRjUwsUu8gNZL0aLmCNDsQuobc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307546; x=1699912346;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcLpYQwHOJBs1+bgx/XyMohSbAkHSHoZFZS+/mc6OhY=;
        b=SeriD/s8858vOVstxk3Ed5vdq19xbfmXetdULrQB5Gz7vEcUXcdWy6hWH9g6E/+RCR
         YxOxFB8A0WGpjnp6Z5EisbQb/g1qHdRY3eghJg4xVVX3jkB7M9EWgdC0878Qx23e6rY9
         mJ1qfOEr2GQIr+n4/F1GNgnezgs9OZ1EPceWWKafsI34EUjS4yX1k8d4OuIkSbCeEk1R
         IOWL4pdA5AeU/8OrXD/GGQ9RvSCDTS0PFKyPVKSZO/DkIALvf83g1MFu3s3bDVGOJHS0
         MFgYZjXE6irqTuXIFwUZqmKE5xAKpk66jSGi8h7CmPFKn2sSuJbGau0S3ZDVivst93m1
         S6vA==
X-Gm-Message-State: AOJu0Yyail2YjDRvPM84r+FXsFGMpLF4OyzVhlzoCLM6Uz8kPvHVvNSW
        a8Kb8I+JiiH5jQBjIHMenIeQTV34utrFmE/3Sb+i0Q==
X-Google-Smtp-Source: AGHT+IHwaWHjOprXL57hNf2rFZSX55S5GAUN1q/qHfDTTNIOltSUt0SKeimJVCNC7yGPADzZ4lTXV9ddU9TVuiCpVKE=
X-Received: by 2002:a2e:a98c:0:b0:2c5:4a5:9560 with SMTP id
 x12-20020a2ea98c000000b002c504a59560mr32234027ljq.41.1699307546288; Mon, 06
 Nov 2023 13:52:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:52:25 -0800
MIME-Version: 1.0
In-Reply-To: <20231103163434.8.Ic1d4402e99c70354d501ccd98105e908a902f671@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231103163434.8.Ic1d4402e99c70354d501ccd98105e908a902f671@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:52:25 -0800
Message-ID: <CAE-0n5152eMZ_muL3rBOc6gyRQOXA0U8=vXp6GkkuvOo3Mp+mw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm6350: Make watchdog bark
 interrupt edge triggered
To:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2023-11-03 16:34:34)
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: 5f82b9cda61e ("arm64: dts: qcom: Add SM6350 device tree")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
