Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F91793B64
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbjIFLdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239875AbjIFLdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:33:43 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D1D19B4
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:33:15 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6bf298ef1f5so2634586a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693999994; x=1694604794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK8NHS2iC+EdIrz93YoOnu4w+oJGTzeh1xrolghJ1sE=;
        b=rMeRzV+mZXQwu/UUcwsyWhT+1Lz0a3Aschqifjztd+bsNj2e6OvXs36/ZEyTJdnuuI
         Yyh/7EfKVjEegXpzjSat3NG7bO98h8qQ6pMJ8f6fSUTPukM8HiOWGWqc3f6gte5D953o
         jI3+4bAq+IAyENjbLyJBvLnOgs2EVrZLlWrnU80uoQy6q+RqXaHxH6B1rnxdVWah6zAQ
         m/Hpt+d3I160VzdBtgQ4u2hSvhdthi3yBuTMFXalnukOh1fRHRgpr8Ju4KAmcpNENxk2
         ypNqgSTluhnj9bdPe6sfpBXAo8XGsFEBFOFDOGKLmXXfq75v+2tP38v4sMjtyIRwd+eL
         J0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693999994; x=1694604794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK8NHS2iC+EdIrz93YoOnu4w+oJGTzeh1xrolghJ1sE=;
        b=YWmnGIWNchnXB8shvK7HvLiEJPixyuyY71C/1zNoddW3rxgywQGkfghPZp+hLrZ0yD
         SQzG+FqggfAW474uViR2LePn7yxCRRqmhDM5rEVHdvrHh2lH/g2/WHzfTFN/kEoE+Ms+
         bIT1lOpJ1Z3LPYn8QYVE3US1Aod0LhGRhVbPt9/BUQsTxrqHi1AlyZ3frmq3PdTwV7uq
         AiP9zYUnokU6b9UzDQlnRbKPxyLhPbRlgiev6Sd12v5c/EzRRj7FcRUj67IDYwv7Ero8
         ZkFNOVrP2WsOwya+wO1vWAR44XDDQHFyRel+jXfW3OmkYKpkkKtytE7EInGpdFsRK6+A
         q0gg==
X-Gm-Message-State: AOJu0YzJDnx8wza39tYmATobvsmBI1BeZmUBnqSaW2XmJeKnjm+1sCvx
        2ezMKvCpenSSZ8h94g75zHZRubakysW/v4MceUYUTdWGRuVdT2CDzng=
X-Google-Smtp-Source: AGHT+IEL+0Z0XHNTz7i2K/mMp7ueLzlwT/AaPbcDh8kRFJFEJmq0WxqnWGkdTYlDm6LWmROLnuMaO3obmL4C5DgIdok=
X-Received: by 2002:a9d:6956:0:b0:6b9:6481:8e33 with SMTP id
 p22-20020a9d6956000000b006b964818e33mr16933615oto.13.1693999993888; Wed, 06
 Sep 2023 04:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org> <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com>
In-Reply-To: <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Sep 2023 14:33:02 +0300
Message-ID: <CAA8EJpqTd20xGZFpgsA=yoQELonn4QtOwAE6OX9abmv01SWDpA@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware for Qualcomm Robotics RB1 and RB2 platforms
To:     Josh Boyer <jwboyer@kernel.org>
Cc:     linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Sept 2023 at 14:17, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Sep 5, 2023 at 8:02=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Please pull in firmware files for new Thundercomm boards, Qualcomm Robo=
tics RB1
> > and RB2 platforms. This includes Audio, Compute and Modem DSP, WiFi, vi=
deo
> > en/decoder (venus) and Adreno GPU firmware files.
> >
> > The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8=
ddb5:
> >
> >   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware =
(2023-08-04 06:33:54 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/lumag/linux-firmware rb12-fw-v2
> >
> > for you to fetch changes up to f29e3265b02430630222fb3aba8b76ebcba632be=
:
> >
> >   qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210 (2023-08=
-23 20:24:47 +0300)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (5):
> >       qcom: add GPU firmware for QCM2290 / QRB2210
> >       qcom: add firmware for QCM2290 platforms
> >       qcom: add firmware for QRB4210 platforms
> >       qcom: add venus firmware files for v6.0
> >       qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
> >
> >  WHENCE                    |  27 +++++++++++++++++++++++++++
>
> This conflicts in WHENCE now with the addition of the RawFile type.
> Can you rebase on top of the main branch?

Done.

The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade901=
:

  Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +0000)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb12-fw-v2

for you to fetch changes up to 74cc8ca8217cb0967ade52953f9d9242f09e3460:

  qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
(2023-09-06 14:30:16 +0300)


--=20
With best wishes
Dmitry
