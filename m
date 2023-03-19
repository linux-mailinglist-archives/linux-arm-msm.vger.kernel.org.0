Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25166C055D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 22:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjCSVRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 17:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCSVRI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 17:17:08 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29713B45E
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 14:17:07 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id e71so10914378ybc.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=odOHan5KodgnZmQYP5bE+Zx5oWuObSka+JlAj9+I+PEuls9mRUte5Fd1E9WehPEH0v
         ZEUouTX/UvXXQBiT/SNrO1n/f3o+kSQlfaYmdNK4DAR8Ejqf2fhzotkFgCdRQtcs1CVC
         t5VLMfDqC+6dzZCRc67iIWhzpcy/Pk8gir+iKkECVK6wCNHZH2ZDuC5lvdh7tZq5DQuj
         ObQBbb4TSLQVxE7XBRQy+d8Lbb9XjTL/2eJtfomhereizk9tghsCcrHhrXpWlcA+TL2p
         v61FtSAq1/yzKQz5Qm+nbB//3YVMqfY7U/pGKdm4qJTu9FwuezpIoi2MADQXjrLIWQlB
         6CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umIKUZ29cWxRGLpplScGRMR85hsAlE3Adfx/LlasVhM=;
        b=gNAvpyn81qtYINiHCHsMI4+zvM/HzzkxnoVx17umhVCTV8pAPG+4m3cC7iQRt7dp7t
         47MEynKu5ZL/QjeRmceUrwO9b6LXtXrFJctf2nMsKjlIprIyAaqu7vxwIrpvqvXtkdqt
         PrKCZeSgeU1qtjH8wYceGrdm37DXSoxYCMPktLoahKxHLJAr+Em8ZavLg+srJXsTKY2R
         YLnCxMyEr6QIem9CbEvZ2rd1WUR8VCZ6Jnb1c1bjvBgsvaodFs30xwsWHsRCldP8itEF
         +gofOvwh4k1RunxKJuyJvCuIekN5NBu0UUXQZVAy7yARRbGDtmPzGD6Up0CglndcPYoY
         5hvA==
X-Gm-Message-State: AO0yUKUIz25bYbvvGj98DGgjR2/hssUhuvV7jnWZQAwrZ+3rKVdH0o6c
        jKv5qykFCOQ1YCvVHXKUDtYwFVPJ3iXXYUrPTtYlkg==
X-Google-Smtp-Source: AK7set9Y0TmDGARQ0tonQqRCQHdH+03X2NR6qq22FebqKohfKPMVp4wrMtKTGiLfsl0XoE3P/cG/TeF1FO39PIanZTY=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2999493ybu.4.1679260626301; Sun, 19 Mar
 2023 14:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233631.3968509-1-robh@kernel.org>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:16:55 +0100
Message-ID: <CACRpkdY0twhF1+ipbV0DuWUdeCyq09uZidyVSNr7eW=K6ecnkw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
