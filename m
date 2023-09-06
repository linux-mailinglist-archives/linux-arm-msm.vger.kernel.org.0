Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F13793B83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237817AbjIFLg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239990AbjIFLg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:36:56 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7178E10D0
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:36:48 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d7e741729a2so3133103276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694000207; x=1694605007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARqqnV5RUKOZrE62CjUH+mZxkGrJ3vy4uKrUnWYINHw=;
        b=aMiuZF2q/GFE2N+DihHvaIIGvprGU/p22ZhgIZ+ysQvzD015wcNgzGbB9mjQdVlISY
         IZ4rVbagodCZ1C1kuI8CHpYtKbTP6TBd+VNlN2dw6P+f/DtNhgwOEF+ofcuoTyXA1MTR
         enQHqI2T4QPyAoYQzKCMOtyWtVOnSfFetLbgFKoazEsgx6HgCXSlXt7Gw9h0mWG9vmjV
         a691ATYeynf6U3J7vErZZ/2hCtphjZQPz+Xnvvw1G9AqrJP/jrI+YUiGi85kgHpHWDhS
         lBW9lC/egFnLrpGi++xEHwYtYpDO3B0Wxt5uU0oBtzwXDbg///TYktzYjrooGvasOqJX
         MVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694000207; x=1694605007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARqqnV5RUKOZrE62CjUH+mZxkGrJ3vy4uKrUnWYINHw=;
        b=M4vMqpPyghSWEGL8U41LI5mlGQK3/E0tOU3BG1OoUB8kj4G7bYWzKNL9RuKv0Xb0aU
         P2yw+oymv5TRdms1+eIBlbnO/frv8zDlHSDuzBvLFhhkpDPsXtmdgiuLN4qXzm+4NmGP
         yGJTWW9dAG23I9/oPOqTVcPlv8Q9fpIp1jhNqgjrwohim4PJItuFyvAr2ceXvycf7mBn
         t/L6gZw7cTViI74Uw+xvFErZM5LlK4Da4aHwf+FjfNDgCTgZsUIA4J3LCy3Ei9a9P1oh
         T+W4nykXBugynTHRnr5q/5CwU+eDc/xXqQFYcl82djdc5nHpMqHeWlQY9FEZ5fpXt8nR
         ZV7A==
X-Gm-Message-State: AOJu0Yw3Sgtyc+z0xme4WHP7LxrD+sFvFVnLl2SIQ0o2x6I98u9wp1EI
        ma3loqae2GDC7RCQFqH9X83lNOAmnwU9AbqBc1wvjBo/AFB7nYGjzPQ=
X-Google-Smtp-Source: AGHT+IHzN1O4eKhhaHQsSNTImOt728Le7M43YBqMykRfepRO2PBuT3k9nODQuABhWHpayV2T1mbw6Hsshs4JQzYt5qc=
X-Received: by 2002:a25:26c9:0:b0:d11:c89:4256 with SMTP id
 m192-20020a2526c9000000b00d110c894256mr16819309ybm.31.1694000207521; Wed, 06
 Sep 2023 04:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org> <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com>
In-Reply-To: <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Sep 2023 14:36:36 +0300
Message-ID: <CAA8EJpqTwbEDcws=Wd1tuXkmEdRZnh_DkMydofKZ-n9srEyJWQ@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware updates for the sm8250 / RB5 platform
To:     Josh Boyer <jwboyer@kernel.org>
Cc:     linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
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

On Wed, 6 Sept 2023 at 14:19, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Sep 5, 2023 at 8:45=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Please pull in firmware updates for the Qualcomm Robotics RB5 platform.=
 This
> > includes SM8250 DSP firmware updates, video encoder/decoder (venus.mbn)
> > firmware update. Also as a part of this update is included the board-sp=
ecific
> > firmware for the Sensors DSP.
> >
> > The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8=
ddb5:
> >
> >   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware =
(2023-08-04 06:33:54 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/lumag/linux-firmware rb5-update
> >
> > for you to fetch changes up to 60b397dfd9d77da4b62e08572bdc7174a29f53a8=
:
> >
> >   qcom: sm8250: add RB5 sensors DSP firmware (2023-08-16 16:03:46 +0300=
)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (3):
> >       qcom: sm8250: update DSP firmware
> >       qcom: Update vpu-1.0 firmware
> >       qcom: sm8250: add RB5 sensors DSP firmware
> >
> >  qcom/sm8250/Thundercomm/RB5/slpi.mbn   | Bin 0 -> 5646296 bytes
> >  qcom/sm8250/Thundercomm/RB5/slpir.jsn  |  21 +++++++++++++++++++++
> >  qcom/sm8250/Thundercomm/RB5/slpius.jsn |  21 +++++++++++++++++++++
> >  qcom/sm8250/adsp.mbn                   | Bin 15515796 -> 15515796 byte=
s
> >  qcom/sm8250/cdsp.mbn                   | Bin 5822228 -> 5826324 bytes
> >  qcom/vpu-1.0/venus.mbn                 | Bin 1973540 -> 1974884 bytes
> >  6 files changed, 42 insertions(+)
> >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpi.mbn
> >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpir.jsn
> >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpius.jsn
>
> This misses WHENCE entries for the new files.
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: qcom/sm8250/Thundercomm/RB5/slpi.mbn not listed in WHENCE
> E: qcom/sm8250/Thundercomm/RB5/slpir.jsn not listed in WHENCE
> E: qcom/sm8250/Thundercomm/RB5/slpius.jsn not listed in WHENCE
> [jwboyer@vader linux-firmware]$
>
> Can you rebase against the main branch and fix this?

Done. Please give it a try:

The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade901=
:

  Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +0000)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb5-update

for you to fetch changes up to bb3d5bc99fe629cab2024c9bac528c3b466d2f31:

  qcom: sm8250: add RB5 sensors DSP firmware (2023-09-06 14:35:32 +0300)


--=20
With best wishes
Dmitry
