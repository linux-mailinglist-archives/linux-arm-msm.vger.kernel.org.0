Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CF0771CD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 11:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjHGJDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 05:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjHGJDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 05:03:08 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997972D4F
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 02:02:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d4d0ddc15feso1573076276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691398936; x=1692003736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LnORt0w2WaBBTXxnGuGRnHMAouDS1iv7SlCa9HMty8=;
        b=YnHh0CSrVsRhnZQ8IR9haybhkmEtN4T5+9MeOfpwVrIfnHAhvav9BGGn26woWf43j/
         pBcfeXh+zb+KA5QDK3qtQwxl93pOLX2KlDB5DGhhXmZCpHYjF3t9Ok3wDVTnqeEeSyqD
         urG+PUkn2FIML1zPiPT/Y0iVcVWnSoEKLW2DkE6OiJV0WTMj/RHCCQM7yL/1+gCzrQuu
         U+s6H1Ml5QaINxbPyZmpy3cc3kuYKPyh08bV7MF0gCJUzAgoujux3kfBaATktbeIh2e1
         AkqLB8zqKPNrIWf34bcSvZuuW6L0hICBvX93PcB9mZswWpwysE7Dycr/QL17cDl3fxvK
         N7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691398936; x=1692003736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LnORt0w2WaBBTXxnGuGRnHMAouDS1iv7SlCa9HMty8=;
        b=R9yM6F9tnDLOf/Q19k4Ku6IWjDWiHmeuUYjO00DBiHS2jLJDgpCZf6L85Lh+YCSjmr
         bhDeTS2kwuaunqhXAoKrBg2HVqDuq8IwJqIg2PmZD5CUFaYxAhJbCEtwISEP6hQzEZX+
         pAzPr0Vzhs18DsafJSZcpixxzhgOeThDvDtStnj+0mZ/xS2s+InVaWviifZCZNmTxkth
         YudMQ7bExzw/UT1H4yXAdKWL8f2PklYcLQ+kmQhrL//d2UTYpmkXDkBetDCGN/oexmQb
         1reAJDIt4MIDxdD0BtKS+cOVkMInqodFeC30xopUt47j+FHdu8ZjXvXBCmuPZuaSt0QE
         Sg4g==
X-Gm-Message-State: AOJu0Yw5/cmHvYNb9GCXkToMY+8HBf+cKzctUTDjNgCENH0H+7AnPc1Y
        QWbzMCyv1u86xeP4yEvYLr2ZTN8FguI9ZDccmFwb1g==
X-Google-Smtp-Source: AGHT+IFUQqODHoeAVuP9Czlc9nQuP+oHH0JOPYjo1jINrz/Uekb/1EK1zrJaDHwi4fTURWcUqkNXJ9c5jxnFuQ64zyw=
X-Received: by 2002:a5b:20e:0:b0:d07:5b87:ec56 with SMTP id
 z14-20020a5b020e000000b00d075b87ec56mr6801980ybl.14.1691398936634; Mon, 07
 Aug 2023 02:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <1689934361-32642-1-git-send-email-quic_srichara@quicinc.com>
In-Reply-To: <1689934361-32642-1-git-send-email-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 11:02:05 +0200
Message-ID: <CACRpkdb_VLSVm4s7wLcbRri7kdsuMEZ6p_kiaSP0SFWM+0HwtA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove the unused _groups variable build warning
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 21, 2023 at 12:13=E2=80=AFPM Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:

> When building with clang toolchain and arm64-randconfig-r015-20230712
> kernel test robot reports the below warning.
>
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused variable =
'_groups' [-Wunused-const-variable]
>    static const char * const _groups[] =3D {
>                              ^
>    1 warning generated.
>
>      static const char * const _groups[] =3D {
>              "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6=
", "gpio7",
>              "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "g=
pio14",
>              "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", =
"gpio21",
>              "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", =
"gpio28",
>              "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", =
"gpio35",
>              "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", =
"gpio42",
>              "gpio43", "gpio44", "gpio45", "gpio46",
>    };
>
> Fixing it by removing the variable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307120814.vWPY6URk-lkp@i=
ntel.com/
> Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
