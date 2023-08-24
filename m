Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4D57877BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 20:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbjHXSZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 14:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243064AbjHXSZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 14:25:28 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5F21BE3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 11:25:26 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-986d8332f50so9319966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692901522; x=1693506322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/dmEEbj7+i/B+fm5A2Uaw5rpUCMdPhpq0R3TswGQcw=;
        b=R2eMJxiXeuLEd+V7um/DUPtNQDItKfs9VqHmea3P7OhicvkxcrN0T3O/WhQOjtSqJA
         ELzA/1CmHxsyekuXm+SKsK2zRGKZlRRGOih2u7HjrVnUI7ld1nQ5MRnRZVBJ/T17ru38
         LQiPp818Lti5vwQwDVUK2yj4IGBVeF5SmfCbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692901522; x=1693506322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/dmEEbj7+i/B+fm5A2Uaw5rpUCMdPhpq0R3TswGQcw=;
        b=C0t48UejeOQ42Dft63/ZvIOyslnVql4jek/GXJ4b4toGMcwScsLkp25Ok2XW+xM5RB
         et0SqnUTz8O+16Nr2ZYNoK5TGCgx3hakiveFgba1+VHTcpYVZC+0CsF0QhmsIDW3IOq5
         5dURJOdnf7Kfkcyk8ejQbQhK06dWDCDOKC5uuFr1QZoxHimAKbNUmdz7jo9HRjPGR+3i
         vkcEDQJNUO6KOrZelZj50MiE3lObEbla+5lgKGHpE3l1vnTqAoCd46LcmEg39FAqAA9W
         IJztHW3dWc0DKWs4hIEcGZ7hxrvjdsn2yc7pyVHNj7palQI+KzuEc5ppqbYAjm0PJvbJ
         N/4Q==
X-Gm-Message-State: AOJu0YzDwaUWRlzmHPEhKu3TW7D1bfC8JemSBh3lWuQpKEvLSlZFAtwo
        3xMEyT5Uy95xaZdOsc/xFuZBpZH7CjN0OHmQcIvoEwOX
X-Google-Smtp-Source: AGHT+IGEDuwV9k+wIlgEpCpgfFPkWkfQEBlMc1LpYF1zVH9N+Pd8P85aj45+A/3nsW63Xdz5z5YDFQ==
X-Received: by 2002:a17:906:3018:b0:99c:ad52:b00 with SMTP id 24-20020a170906301800b0099cad520b00mr11811508ejz.6.1692901522508;
        Thu, 24 Aug 2023 11:25:22 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709064f1000b0099297c99314sm10307608eju.113.2023.08.24.11.25.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:25:22 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso11455e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 11:25:21 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba5:b0:3fe:dd72:13ae with SMTP id
 n37-20020a05600c3ba500b003fedd7213aemr24711wms.0.1692901521167; Thu, 24 Aug
 2023 11:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230823222741.89584-1-david@ixit.cz>
In-Reply-To: <20230823222741.89584-1-david@ixit.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Aug 2023 11:25:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqzpL1n16eBrV7N_i8Zx3-eJRUBY+NgZxjBqaZQCYkdA@mail.gmail.com>
Message-ID: <CAD=FV=VqzpL1n16eBrV7N_i8Zx3-eJRUBY+NgZxjBqaZQCYkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: Fix PSCI power domain names
To:     David Heidelberg <david@ixit.cz>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 23, 2023 at 3:28=E2=80=AFPM David Heidelberg <david@ixit.cz> wr=
ote:
>
> The original commit hasn't been updated according to
> refactoring done in sdm845.dtsi.
>
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle stat=
es from PC to OSI")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
