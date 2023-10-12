Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FFC7C68B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 10:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbjJLI6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 04:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234842AbjJLI6G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 04:58:06 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBCECA
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 01:58:04 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7b5fd0b7522so320847241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Oct 2023 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697101083; x=1697705883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNxgvXZFUnVUG5gVMUZSnX6j5v/1/Oe30G+w9xokwNU=;
        b=SKv02az/kkjhcyDTlnigbGxaKEKWRHAHcaRqtyURmyUonaPUP6xDijvfNx+2KY0c9C
         gKUp4v9MMdqmQdLyWibjs5z4KbK0V2mpfm518+KaYcPeTY05Zjvdwf8X9fD6i+VVimWE
         L0OkEMzeaV6JW4SWL4ccJpRIs/21WLKMnOE8YBMjc+Q86RjjYTw3IXb9uexe2Jg4REW1
         sJH7qP0sR7W4MAuPljJyeePxr/IOgJTqGfJDFjC3T2Z6aY9uSzmLU1MvhqxZHIIA15Hm
         KN49RDcFtxLpEUykHhzpur4K3Dhp5rHtFwZPqo5kIKrtErTVW0cu0aM7gePMgQUAqq7/
         F1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697101083; x=1697705883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNxgvXZFUnVUG5gVMUZSnX6j5v/1/Oe30G+w9xokwNU=;
        b=HgESmtVWxJ4kzxIhoHlnQQtEvR7zF+y74o8t4SqDDvj8F6jpHjLetJ1yr+rWBzJq8B
         A6ZavLhyea+8Wz0/qmlSphU+IbSufyKSC3WtWfB7kBvijTyaRNP50lmCaVqFsZMQcaRX
         uVvmMg6mWxQeci7Xgrj1bYjUQVu7PS4QvB1blo6W0Q1DwtfpVRe2TwUwmMkrjXNxuKTP
         MXwSTjXtsHH6HUuAYmc8msPdeZbnSz1jPwwBg6Ep6qT16i0Mr8hDPNYAkKbstdYM/mDg
         MN5vSEer17+Qfhhh2YiByu+5+x3rMPQctEJEEb1EF7MW7+fJpiRictePE9p5ph6uB0kr
         e6Sw==
X-Gm-Message-State: AOJu0Yzrr08o2TWvUjmREIWiwqDitieTDRfAbS+hOmoU/7Loxz50WRHf
        C7vbr4UoHHc5m0e4iSsymVXqGYbxP8gpCY8DFtaVAw==
X-Google-Smtp-Source: AGHT+IHxZhYXDkhOsh5F8de5VQXIjsRXeJ0AnYv/a4pUz6Be4bqu1f3npy4aNBHSk+byxozjGOo8gTNE76tI1JoMxDo=
X-Received: by 2002:a05:6102:2f6:b0:451:124:2bb2 with SMTP id
 j22-20020a05610202f600b0045101242bb2mr17259081vsj.1.1697101083005; Thu, 12
 Oct 2023 01:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231009153427.20951-1-brgl@bgdev.pl> <20231009153427.20951-16-brgl@bgdev.pl>
 <vovuloeqzoshlyybypzjyni4cfxtz46rp4pqh4duftai5jhgzr@ked3hl35kx2o>
In-Reply-To: <vovuloeqzoshlyybypzjyni4cfxtz46rp4pqh4duftai5jhgzr@ked3hl35kx2o>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 10:57:52 +0200
Message-ID: <CAMRc=MeyDkV2YY08oo5ELnbFs65=VtZJgZwonSfv3c1H1mwEsA@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] arm64: defconfig: enable SHM Bridge support for
 the TZ memory allocator
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 11, 2023 at 11:20=E2=80=AFPM Andrew Halaney <ahalaney@redhat.co=
m> wrote:
>
> On Mon, Oct 09, 2023 at 05:34:27PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Enable SHM Bridge support in the Qualcomm TrustZone allocator by defaul=
t
> > as even on architectures that don't support it, we automatically fall
> > back to the default behavior.
>
> Can you give some motivation for the Kconfig? It seems like what you've
> wrote should just fallback to the non SHM bridge allocated memory, so I
> don't see what having the option to exclude that at build time gives us.
>

If the hypervisor gets quirky in a new place other than the PAS image
calls, we will be able to just disable SHM Bridge, otherwise the
kernel will use it if it's supported even if it causes problems?

Bart

> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index 07011114eef8..ebe97fec6e33 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -255,6 +255,7 @@ CONFIG_INTEL_STRATIX10_RSU=3Dm
> >  CONFIG_EFI_CAPSULE_LOADER=3Dy
> >  CONFIG_IMX_SCU=3Dy
> >  CONFIG_IMX_SCU_PD=3Dy
> > +CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=3Dy
> >  CONFIG_GNSS=3Dm
> >  CONFIG_GNSS_MTK_SERIAL=3Dm
> >  CONFIG_MTD=3Dy
> > --
> > 2.39.2
> >
>
