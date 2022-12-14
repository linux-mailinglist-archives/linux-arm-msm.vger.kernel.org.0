Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAAB64D17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 21:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiLNUvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 15:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiLNUvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 15:51:52 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E9E13CF2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 12:51:51 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id kw15so47475739ejc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 12:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ffmonq0jONZ5zQpJsMWvuzEqJVc48PVYRBBpDxiBFE8=;
        b=J21O/4LrOSaQND9lM5pYxQbxMkBGx3wIYOJIVakgCN5iuimwusKpAJN/yjlAbwqUEj
         fmSGijwMCZ3ljnt8COaOXgfF/rh+yUFaroA6YrJVCh52+CML2gdfyZBYYWUeE7xV7pCm
         m9+pDchgrLfn+A++E9tMcJG4SzRMLQA7lNQG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ffmonq0jONZ5zQpJsMWvuzEqJVc48PVYRBBpDxiBFE8=;
        b=ySLAfDRm4/YDlSRIy3mW1j6WK9DVehCxLTrQ8TgVM2CjWXnz/pV4I79yW6WKQtUBIK
         PxVMYtz/LBBUk0xGHiXioQCCxiWZpgSptQd9RRomjbaGsLK7DZkOhwv9pLXv/v56UHvl
         v+VjU9Ow1VdcIxgDaTzy6fyuPqYp3t+1b4TEk7InEyqCTwbNa1rF1FXffrZCPYTLGhOa
         3pcr9bAqRcNI+s67G9eIeRdfGxuSiubO6zsa2AVuzJxinAj1UR+eXNVQQ++y0/GBtE9Y
         uU2kM4/dgZ67kjax3w2CynbY607Z4lFwRb0p0epEPf8ZoPBHHAQeOZhSG4NtHe9ZEMTt
         vtjA==
X-Gm-Message-State: ANoB5plAwdweFsYzEg03x5nYXjgnCBpZnVPf0R/66zV2848zHW+krTYX
        iUVh7x1vOHyfmBWSATCWj/cXx53g19hAaJY8ThY=
X-Google-Smtp-Source: AA0mqf6RTkAnr0GopTWydr5h+A0roCOfQz47Q7lUwsnr0OwL8IKOTUoxDs2KwdV5ddEQpN4wXNOhyg==
X-Received: by 2002:a17:907:ca2:b0:7c1:26b9:c556 with SMTP id gi34-20020a1709070ca200b007c126b9c556mr18373663ejc.15.1671051109939;
        Wed, 14 Dec 2022 12:51:49 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906689800b007bd9e683639sm6161557ejr.130.2022.12.14.12.51.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 12:51:49 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id h16so1027918wrz.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 12:51:49 -0800 (PST)
X-Received: by 2002:a5d:4943:0:b0:242:3ca3:b7bd with SMTP id
 r3-20020a5d4943000000b002423ca3b7bdmr18737336wrs.583.1671050745735; Wed, 14
 Dec 2022 12:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20221214114706.1.Ie4ca64ad56748de5aacd36237d42c80dd003c1a9@changeid>
 <20221214114706.2.I1a0c709f8ec86cc5b38f0fe9f9b26694b1eb69d6@changeid>
In-Reply-To: <20221214114706.2.I1a0c709f8ec86cc5b38f0fe9f9b26694b1eb69d6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Dec 2022 12:45:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X1XMi6rMN7FVf7iWkYbs8rvYF09ebbaA9gb+SkMWHPRg@mail.gmail.com>
Message-ID: <CAD=FV=X1XMi6rMN7FVf7iWkYbs8rvYF09ebbaA9gb+SkMWHPRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280: Add DT for
 sc7280-herobrine-zombie with NVMe
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Abner Yen <abner.yen@ecs.com.tw>,
        Bob Moragues <moragues@google.com>,
        Gavin Lee <gavin.lee@ecs.com.tw>, Harvey <hunge@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 13, 2022 at 7:48 PM Owen Yang <ecs.taipeikernel@gmail.com> wrote:
>
> Add DT for sc7280-herobrine-zombie with NVMe
>
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile               |  2 ++
>  .../dts/qcom/sc7280-herobrine-nvme-sku.dtsi     | 14 ++++++++++++++
>  .../qcom/sc7280-herobrine-zombie-nvme-lte.dts   | 17 +++++++++++++++++
>  .../dts/qcom/sc7280-herobrine-zombie-nvme.dts   | 17 +++++++++++++++++
>  .../boot/dts/qcom/sc7280-herobrine-zombie.dtsi  | 10 ----------
>  5 files changed, 50 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-nvme-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dts

It's like sunshine on a cloudy day!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
