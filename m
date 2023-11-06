Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09CA7E2090
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 12:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjKFL6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 06:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjKFL6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 06:58:21 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2219BEA
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 03:58:17 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a81ab75f21so52231557b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 03:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699271896; x=1699876696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DHrhiLn9HOdOplRClwUGQLEk9jhkaaAAmdhl2iHxq8=;
        b=VsALbmb6xJ+cloiQA4d1FbFsD3y5ZfF0AuLDHpNBYZvvJqwIOPMNhX9/5vGHuXQDvD
         7I0ZYokF1mNZj5PRBsjeE4CN2zZpwJqpgNu0xEnvrzJjQbzhQ1eAOxGrtKtqDJKG2A+l
         sf1+r2yJwncKzkXz6+NQVKdV/Nc5dgb8UtmWLVoHThp+OXM5yeC6O9tlpA0hdRgbKX4b
         2EmjpqnJlodrzHO/ylaeAeXdzZW6CpoqNgLeafWPCcFsGMc4q3EbxH9V53HBC9PgdiJ6
         m47yvqXSG4UH/PYWPSh9/SaUEPy2wHPZMcO7At38RKYwrWquxlhfuclzhigQKYkrAQNh
         RKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271896; x=1699876696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DHrhiLn9HOdOplRClwUGQLEk9jhkaaAAmdhl2iHxq8=;
        b=IejUmjX2ffkUbAzojUSJ2fmWsq8wVvii9fV4vLrY6lJpyss4pGnlOA1/YmMci59Y3o
         gf36aI0Uykd1jbeisFApFX/G7Bh/TtJjzuZqNINfYwgQQ6yQyuRdVReJV0izrc3CcQld
         5iFxc+ipeAhFwQqkaazrt+A8Eg6WqN/SIXjjAjA4NdHMSs1ZSHFPslxLAv/OwR6Laal3
         qY3Vmwt2LeMIYcNT5QZfIQP5m4WaW+ePCNHGw9QvWqLeO6u6WiSOOz/gM9JIMh+i9Wop
         FLL5tgULVjnKDZAs6fRKMijybJSyDEmLFc0qx6T4ZSZUmw8MubLDIaM/mcqdj3e40y3H
         3Otw==
X-Gm-Message-State: AOJu0YydXfmL2CYnxt0493Otm4HkA8FrXQfjA7/rD9a9OyYYmz8oqdHT
        YI9EQEGkECGfmxn3hMcAKcMrmsJ0IGdxfsj5IG5jjQ==
X-Google-Smtp-Source: AGHT+IEDNyCeg7rftIKH8imNcdC4wxfWz2fHb+vxe9+X00JFqxygWdEvIdBo39mj5SI7JjmR/5Ywnk7szgLfZGlXiVk=
X-Received: by 2002:a0d:ca50:0:b0:5a8:e303:1db2 with SMTP id
 m77-20020a0dca50000000b005a8e3031db2mr11350804ywd.23.1699271896321; Mon, 06
 Nov 2023 03:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20231106-refclk_always_on-v1-0-17a7fd8b532b@quicinc.com>
In-Reply-To: <20231106-refclk_always_on-v1-0-17a7fd8b532b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Nov 2023 13:58:04 +0200
Message-ID: <CAA8EJpo3oi20p55CLxacdMJTKgr-6Wrnx=idb_D9U8p482mpgg@mail.gmail.com>
Subject: Re: [PATCH 0/2] phy: qcom-qmp-pcie: Add support to keep refclk always on
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_vpernami@quicinc.com, quic_parass@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Nov 2023 at 13:53, Krishna chaitanya chundru
<quic_krichai@quicinc.com> wrote:
>
> This series adds support to provide refclk to endpoint even in low
> power states.
>
> Due to some platform specific issues with CLKREQ signal, it is not being
> propagated to the host and as host doesn't know the clkreq signal host is
> not sending refclk. Due to this endpoint is seeing linkdown and going
> to bad state.

Is this a board issue or an SoC issue? In the latter case this should
go to the PHY configuration structure instead of being specified in
the DT.

> To avoid those ref clk should be provided always to the endpoint. The
> issue is coming only when ep intiates the L1.1 or L1.2 exit and clkreq
> is not being propagated properly to the host.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
> Krishna chaitanya chundru (2):
>       dt-bindings: phy: qcom,qmp: Add PCIe qcom,refclk-always-on property
>       phy: qcom-qmp-pcie: Add support for keeping refclk always on
>
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml    |  5 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c            | 21 +++++++++++++++++----
>  2 files changed, 22 insertions(+), 4 deletions(-)
> ---
> base-commit: 71e68e182e382e951d6248bccc3c960dcec5a718
> change-id: 20231106-refclk_always_on-9beae8297cb8
>
> Best regards,
> --
> Krishna chaitanya chundru <quic_krichai@quicinc.com>
>


-- 
With best wishes
Dmitry
