Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFF9797D36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 22:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbjIGUNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 16:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjIGUNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 16:13:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA181BD0
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 13:13:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-502984f5018so873234e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694117604; x=1694722404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AofgTSeTaSoX+KT+4pbt9cKca7D17Cr26/O66nz9q7c=;
        b=hDjc51ia5wFv/7FthnO6trGz1BbXY+BxQh+MvP2ag95BiNPEb9pcZMKIZr9XgAFBG8
         WYAGUSJFIcImEI53PmWm/thE4+UPcCGA3mJVm927JPRFetpFoEbZIS9xQx6zoFXHmjv+
         HVUCRrCkzrXgy59XYum1LiJx3dFBdhbkC+nl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694117604; x=1694722404;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AofgTSeTaSoX+KT+4pbt9cKca7D17Cr26/O66nz9q7c=;
        b=kxpcxPPaqIAlZj+h+d5a25g3+HiGFXmnqJDl4usp6ydB8ZaDwNkC4WGnolOjPLdL3G
         ScpFMwDAFRkyVuLzNXD9BQZteADyN2nk94QTCx33nQ6JM16Qa+zIHBPDw5j4bEMH23tM
         cwOE4b/JpgheepPeqSVaGh3Tov7nAhuEJGXx4HhCHWEJvdZVqtn0KJa8p0PmT1EwNr73
         nPuYZGtqsin31S2LOufPhWRIlgIv1v3P0+UplFa03ppVhfH/IfP3BpgMJRYRuA8Dgw8G
         EQOIeR/KseaLrF97HLTNvyrpDHQ1ns35gjhSxMpot8QiPgJJiG8h0KYSdNvvX4rgQ1Eo
         busg==
X-Gm-Message-State: AOJu0Yy5xtvJzAoocDsj96b+baSs/+RAnxJVsbZJEpOQ2NgrK+2mkS8+
        E382ho6QfChulAHZFK5HbrUs0VbN5YjlQBcaxT12jEPHR3Ygs0ra
X-Google-Smtp-Source: AGHT+IE0nBqvLlzYBmzwnOanK7KrWaQfrYJYXlchR9O/niIGQWvx9APP+f5nRQPun2bUpLU5Sbbe6CORNiT8eH9AyJE=
X-Received: by 2002:a05:6512:3f12:b0:500:ae85:726a with SMTP id
 y18-20020a0565123f1200b00500ae85726amr368142lfa.50.1694117604597; Thu, 07 Sep
 2023 13:13:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 13:13:24 -0700
MIME-Version: 1.0
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-3-6515c3fbe0a3@trvn.ru>
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru> <20230907-sc7180-adsp-rproc-v3-3-6515c3fbe0a3@trvn.ru>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 13:13:24 -0700
Message-ID: <CAE-0n51x=PyyJQQV7TXxtEOSFLVC0NxyY9_YE9Tqjiqur9ODhg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc7180: Add tertiary mi2s pinctrl
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting 'Nikita Travkin' via cros-qcom-dts-watchers (2023-09-07 03:02:36)
> Some devices use tertiary mi2s to connect external audio codec.
> Add it near the other two i2s pinctrl definitions so the devices don't
> have to duplicate it.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
