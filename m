Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615E67E2F22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 22:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjKFVts (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 16:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbjKFVtr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 16:49:47 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92D511F
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 13:49:44 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so68533261fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307383; x=1699912183; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYwHzLZss+H5AjxZkh9uANjO8PXTnrkuLTQ39aeS4xQ=;
        b=RUzy0s/YDAhufLLRwLbzzo9D4zwsFOk2mfXruSdLBHGvEMBCiRmxFj03FUnyCBHwZD
         QyDq4iB0GupiZFnUUi4nxCISi+4wvpyTPAH8jgFyKyuIJGwOqaYYXnjHtyH07FY7SaEW
         s9+HUI9GoQi88bZ5TpZGr/haUeSfD1UwEkZ2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307383; x=1699912183;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYwHzLZss+H5AjxZkh9uANjO8PXTnrkuLTQ39aeS4xQ=;
        b=A+GDkmJhDOBHkrupF4l5CZmXux8VBwjFA572kpA0P7tacQ6UUvi8midcZdmqWmmQSU
         wVyOsAF33nDUJG1jOyGDr6Fub9yUpUe9+TyXaXgdgGwdNR8qoQOLVBQDs10/Wh9fqbvS
         PZEpQNMyAYgpSRI0xSjofNJ67WWjHInzGMR1btKHECKUOX3bQ9AQMRyV5PV0U0pJhAJP
         /6Y0o++K2oGF8Ve9K5XXLm7j571TDtkNvTAr/mmhMLLibXZkMoYy0VU89WJiWqIOg2IS
         5UxaPzFRH4NvMRKMMftt3j31A8uKk7xMMR85pImgERXq9Tv9158BOOQz2TN12ZgzdgdA
         TPRg==
X-Gm-Message-State: AOJu0YxO3blvbYM5xxH8WL4DxZV1kXrODoiNGqSBewxlZ5OPUYgYsDAA
        76xpFc5W7R3p0h3/PtOCvfuMgYqpK684qeEJnOdqSw==
X-Google-Smtp-Source: AGHT+IEAtizL9pLvVqQk2s36HB4ipYol7hr3ZoyDwC2Uh504c4LD9qLIVD/oDJl67Pj7/3hvn2AA4/Ma/CDN/Op18qY=
X-Received: by 2002:a2e:a7ca:0:b0:2c7:fa6:7183 with SMTP id
 x10-20020a2ea7ca000000b002c70fa67183mr8215088ljp.47.1699307383166; Mon, 06
 Nov 2023 13:49:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:49:42 -0800
MIME-Version: 1.0
In-Reply-To: <20231103163434.2.I11f77956d2492c88aca0ef5462123f225caf4fb4@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231103163434.2.I11f77956d2492c88aca0ef5462123f225caf4fb4@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:49:42 -0800
Message-ID: <CAE-0n52mAA5vMM0E=cAsqGhP6DkExUXJY1+nU+ZCdHDQbNO=Ug@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make watchdog bark
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
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
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

Quoting Douglas Anderson (2023-11-03 16:34:28)
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: 0e51f883daa9 ("arm64: dts: qcom: sc7280: Add APSS watchdog node")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
