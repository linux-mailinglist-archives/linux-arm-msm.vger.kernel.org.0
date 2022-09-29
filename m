Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7AF05EF4BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 13:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbiI2Lvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 07:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235478AbiI2Lv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 07:51:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952931401B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:51:25 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id d15so630426qka.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YNi1Y8KkMaCeP2/kUJouKfJubCMsxZA/yuBkgPD+92Q=;
        b=GlYsZmIc5Z78NCseds4axXfmzpXbAZhfqOkfCQrQIrzs05RISK+xEZlE0R6svYTB6O
         6tj1+xLWGis2ILrgW8CAIV9Qn5t9Bdwc0YR1Tr89Bo9vx/yhC4YYwvrvK9NnYQkUsoCL
         pOgACZP4gb2IJ5MgxFx+awLHKv4Gh+zwTvXROxAbDDYgPQvgNYL7SZfBe8cMNcdjoKc8
         TSSc3Pc31gtYO34YY7f0i/mBSiGJAefmeP+5kqlR4+hJsBsHf6zGCkxyfqfTxCHB9Zff
         QBd9EKFzqvqOpe5qPOXbAgf2N7Cn2w9yMavhH5Z0LbfRCGGWngAAMTeorfEtKdA++UCN
         iqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YNi1Y8KkMaCeP2/kUJouKfJubCMsxZA/yuBkgPD+92Q=;
        b=HPe5Gesk29sYUpKVwNtQkLVgIy9ZYTahPX4PcunTVnX7Sk2W2OMjJCXqoxvSgM68c7
         KYGzuaas7a/46hBGS6QphuPj804QzPTks3DoF2FdejrBOTLpsNAaTgN/ntfLLENfSvw+
         H0yOJdQw0pLqs/jpiy+vt/v1YZtsP9J08ipCoymGwGNi2KIW6zMebRKKDWg9kDpKhLAC
         gJEuGiPr9MIXiTi8ZEWJXoRWOq337lOJl4TBAuNPKlJaZtf/RrjFk9Z4tWOZT4SLqRYf
         2WZ58QCTvYLUzvv/gUmKXEZYkteWmLEASaBmAXygMNZ9kqEsy/AkUAGjRSNawEPsF545
         lHdw==
X-Gm-Message-State: ACrzQf28WZ2rVGxMgoG+TE081/fubdPlmJ+5snYxY3RpuIgc+3VQ+S+a
        w3c7Ic8KkJwJvkN6DQ7iAmO2EmFyQQZs2vaFog4456U9mElkBw==
X-Google-Smtp-Source: AMsMyM4HbSoCaywYT71OgasH0p8EEJn0zsWFWjGld3Z6YEbpnVohgiUlf1FECOYitm4Td/I1VYvFOVPfyhSIlPaq4E0=
X-Received: by 2002:a37:ad0a:0:b0:6ce:1769:6f51 with SMTP id
 f10-20020a37ad0a000000b006ce17696f51mr1833026qkm.522.1664452284408; Thu, 29
 Sep 2022 04:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <75bb4a68-f47d-1de1-a900-789e365be41e@linaro.org>
In-Reply-To: <75bb4a68-f47d-1de1-a900-789e365be41e@linaro.org>
From:   Robert Marko <robimarko@gmail.com>
Date:   Thu, 29 Sep 2022 13:51:13 +0200
Message-ID: <CAOX2RU79tLBVDPtHdfKx_pj1qb9F3sic0rN45fXtUPc-DryxPg@mail.gmail.com>
Subject: Re: ipq8074 USB PHY
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Baruch Siach <baruch@tkos.co.il>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sept 2022 at 13:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi Robert, Baruch,
>
> We have been looking onto the QMP PHY programming in the upstream
> kernels. I noticed that the ipq8074_usb3phy_cfg uses usb3phy_regs_layout
> for the regs layout, however the Qualcomm's kernel ([1]) defines offsets
> which correspond to qmp_v3_usb3phy_regs_layout. As you seem to be
> working with this platform, could you please doublecheck which of
> layouts is correct? Thank you.

Hi Dmitry,
Unfortunately, I dont really have a way of for sure knowing which one
is correct as I dont
have any register docs.
However, QCA-s 5.4 kernel has been using usb3phy_regs_layout from the
start, that is how
QCA upstreamed it as well and so far USB3 has been working fine on
multiple boards I have
access to.

4.4 tree was kind of full of broken stuff that mostly got fixed in 5.4.

Regards,
Robert
>
> [1]
> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/tree/arch/arm64/boot/dts/qcom/qcom-ipq807x-soc.dtsi?h=NHSS.QSDK.9.0.2&id=894e56082ca89638c68b7cee039ac1b2a6cb4863#n1237
>
> --
> With best wishes
> Dmitry
