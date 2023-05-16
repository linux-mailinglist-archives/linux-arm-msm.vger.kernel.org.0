Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5C27051A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbjEPPHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjEPPHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:07:01 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192785B91
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:06:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3063433fa66so9328209f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684249617; x=1686841617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq0XF7+PR1y9o2CZoKmF6U/m48kNTTAS4tN4W2zzPWo=;
        b=ha7AFsQELZOGiPCowhQVUhOsNZnSyXCe/j+KcIUVhuXNM0PCgcgaeJoIzfjY7RSwPN
         48+j6+dzld/n3i5Sgzawe3+fdxasZsj3g60SCSfCcbtf7+dxSElVXXDb1Ok0JgezZPKQ
         HxE0wWNVkT/kobzZWmWC+Q6wvgv1BZwkl0ab/+4vCH6CjbAB+6DBBB3sCi+dRoXSAivK
         U+M7nk2jByhvDz5ZEg79265k9LMIeyFKavjcowfXCyWhGe16C3i0cqPx0tTuXbBZZgkP
         hcoYH1Myd149q0vktPY2z8ej5baODQMpBKKcLyErbaXRig377Y44DnEqge4OhyX5glNf
         NQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249617; x=1686841617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq0XF7+PR1y9o2CZoKmF6U/m48kNTTAS4tN4W2zzPWo=;
        b=DVpfxi7KksyvuYKl3P/DKUYxDzUAm2YVDQ+NEBBO7xj0h33nQ4OXNntQz2znvGqrpU
         /XyWuYhvzxAtOfz0PNGMJURDo4n2oghW8lshUd5qp3BycR3KutvrAMMCypWSqtCBqc2R
         TQXMaXb1WMf5l17jUYP4BZt5QephbLxGhO4eQFbq22XGSQ6nvjfdQVUksxL8GpRzaYAL
         K/U+Jyu+RGL2p4qo7E6vlWXh2ot9mZaI9c6OvcOVKW0sZ7rOl7r5wN1TX4GVvWUqyxJj
         cjwTs8ZTV7zclitF39HGzPnk8p0qNuRu6b3awrUo8iNn9N+KIIfgMBRx1kxvmCxMWXd3
         tsIw==
X-Gm-Message-State: AC+VfDxk2ZcJyrTCl6zpHURdGxhmOV6BTuIbPFBjVDmtFgERC8wtQRZi
        EkOX7lr2y9pQ3LMxfkKAsDqHyzWuFU3qeQo91uxO2w==
X-Google-Smtp-Source: ACHHUZ4LY7SDyh/oGJpKHeooYFL7cLCCmViH03hkaW8zKvIkvlfhWmWvmgx6QJpMdS2kjMk7RGoJQtTUXgX4cRY8bBw=
X-Received: by 2002:a5d:61ce:0:b0:306:30ea:a072 with SMTP id
 q14-20020a5d61ce000000b0030630eaa072mr30132707wrv.53.1684249617400; Tue, 16
 May 2023 08:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230502053534.1240553-1-bhupesh.sharma@linaro.org> <ZGOR+hvLMZLxl8fh@matsya>
In-Reply-To: <ZGOR+hvLMZLxl8fh@matsya>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 16 May 2023 20:36:45 +0530
Message-ID: <CAH=2NtwWxGbkN4Kpb-FrcKP0qD-ZMa56GQ9x-F4yU3RkB6K6tw@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Enable USB SS qmp phy for Qualcomm SM6115 SoC
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 May 2023 at 19:53, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 02-05-23, 11:05, Bhupesh Sharma wrote:
>
> >
> > This patchset adds the support for USB SS qmp phy for Qualcomm SM6115
> > SoC. For the previous versions of this patch there were conversations
> > on irc as to whether this was a 'qcom,usb-ssphy-qmp-usb3-or-dp' or a
> > 'qcom,usb-ssphy-qmp-dp-combo' as per downstream code and hardware
> > documentation.
> >
> > But after a careful look at downstream dtsi (see [1]) it appears that
> > this indeed is a 'qcom,usb-ssphy-qmp-usb3-or-dp' phy and not a
> > 'dp-combo' phy.
>
> Fails to apply for me, pls rebase

Sent v11 which is rebased on phy/next (see [1]).

[1]. https://lore.kernel.org/linux-arm-msm/20230516150511.2346357-1-bhupesh.sharma@linaro.org/

Thanks,
Bhupesh
