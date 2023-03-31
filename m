Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331E06D154F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 03:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCaBr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 21:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCaBr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 21:47:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2E818F9F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:46:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h25so27013545lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680227204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzUFcUZYAgXJaL+peWiLAxW27PqyVrGiLd3CEntMJcI=;
        b=DwURgHSaGuk5chgT296uFEmpi0z7WW08Mh6CM8jJnMW+qc7FB01OoHRsIkm4EIFayk
         eFHOsW9Uv3+B/PQth4O/8vlMBpgKOjWyxuVpu1SuZY25dlrEYh1eBF1wPPft4zPE/phf
         ExyMZo5TaJwvKfS0RgJocWzrlFt800fCZRIGgo9tvVJjaD++way20A4XqfNOPaNww2hT
         qUVpDh66AiXTlunIa4l1peKeSKcQilSL4BKRJNpbtaMIMWWv7QMDtS2dgtrjEGtvh7CS
         MJ6mf34v+uufODN/tFtWMaf7hApU6oqXte3ZlCQBbbzcCOnBOppDemR2xkju16Y3s+ea
         twYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680227204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzUFcUZYAgXJaL+peWiLAxW27PqyVrGiLd3CEntMJcI=;
        b=To4IIGUBgyGwhq9ooHBGYZ+16teJ2CltPQ3P6/FsuJggdeAppTMbubEcu2YjCbjhVX
         /FlfuHXkrACQydtahhugM3TcesN5IePf5j/r6y+DrD4IChvfRsEe6T1NyI8GF7GH49Ds
         +resqzaVwEzlD+VsuG8YRY3cHK3XOY18DuzVcVXPrMSN/Byus/eDnOZw/jfteCTS8IaE
         hfG/Tu8cEIXFgVCRE6tkMtEnjBZBzi5LE2pFxVQdc3Gd+hzmTlTopAcaHMS5P7z57U52
         yOa4Gysy+2oBtjxwA9iw8rufafwDWIKfkB4WZOvnRU/1PtA+rZygFwx7/O8psm1j9OG9
         vIyg==
X-Gm-Message-State: AAQBX9eeNEiXtwh3NVQkVGh3Yl1V8hRddq9ztjcPIJDzEg7JjNPDdtRt
        cWe9xYTv86kEqkG4qkNSNRBSuCt29rtJ2fkN4lZnsQ==
X-Google-Smtp-Source: AKy350acsPBv20eV+u3HvPYOhccTDn0ARk5feDJYKeFqLB+4OdDnt+vsFwe6J5FVfZODTNLEVsFreS2LwVrGv3Op15s=
X-Received: by 2002:ac2:4884:0:b0:4e8:426d:123f with SMTP id
 x4-20020ac24884000000b004e8426d123fmr7589065lfc.11.1680227204379; Thu, 30 Mar
 2023 18:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230330084250.32600-1-quic_mkshah@quicinc.com>
 <20230330084250.32600-2-quic_mkshah@quicinc.com> <20230330093431.xn5wwiwqbne5owf7@bogus>
 <CAPDyKFpUmkF=pOwXNrva1k2R+RFBB39-Y4kA0Fve+-3NGbtDag@mail.gmail.com> <20230330131334.idb25zf4tdf3zqn3@bogus>
In-Reply-To: <20230330131334.idb25zf4tdf3zqn3@bogus>
From:   Wing Li <wingers@google.com>
Date:   Thu, 30 Mar 2023 18:46:33 -0700
Message-ID: <CADut4F0oh7kzv0GvuUV0CJnS_YxELoEzuZ_=tDKyKO86baCJNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cpuidle: psci: Move enabling OSI mode after power
 domains creation
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, andersson@kernel.org,
        dianders@chromium.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jwerner@chromium.org,
        quic_lsrao@quicinc.com, quic_rjendra@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding some clarifications.

On Thu, Mar 30, 2023 at 6:13=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Thu, Mar 30, 2023 at 02:06:19PM +0200, Ulf Hansson wrote:
> > On Thu, 30 Mar 2023 at 11:34, Sudeep Holla <sudeep.holla@arm.com> wrote=
:
> > >
> > > On Thu, Mar 30, 2023 at 02:12:49PM +0530, Maulik Shah wrote:
> > > > A switch from OSI to PC mode is only possible if all CPUs other tha=
n the
> > > > calling one are OFF, either through a call to CPU_OFF or not yet bo=
oted.
> > > >
> > >
> > > As per the spec, all cores are in one of the following states:
> > >  - Running
> > >  - OFF, either through a call to CPU_OFF or not yet booted
> > >  - Suspended, through a call to CPU_DEFAULT_SUSPEND
> > >
> > > Better to provide full information.

The spec quoted above only applies when switching from
platform-coordinated mode to OS-initiated mode.

For switching from OS-initiated to platform-coordinated, which is the
case Maulik is referring to, section 5.20.2 of the spec specifies:
"A switch from OS-initiated mode to platform-coordinated mode is only
possible if all cores other than the calling one are OFF, either
through a call to CPU_OFF or not yet booted."

> > >
> > > > Currently OSI mode is enabled before power domains are created. In =
cases
> > > > where CPUidle states are not using hierarchical CPU topology the ba=
il out
> > > > path tries to switch back to PC mode which gets denied by firmware =
since
> > > > other CPUs are online at this point and creates inconsistent state =
as
> > > > firmware is in OSI mode and Linux in PC mode.
> > > >
> > >
> > > OK what is the issue if the other cores are online ? As long as they =
are
> > > running, it is allowed in the spec, so your statement is incorrect.

The issue here is that the kernel prematurely enabled OSI mode based
on the condition that OSI mode is supported by the firmware, and is
unable to switch back to PC mode in the bail out path if hierarchical
CPU topology isn't used because the other CPUs at this point are now
online.

> > >
> > > Is CPUidle enabled before setting the OSI mode. I see only that can c=
ause
> > > issue as we don't use CPU_DEFAULT_SUSPEND. If idle is not yet enabled=
, it
> > > shouldn't be a problem.
> >
> > Sudeep, you may very well be correct here. Nevertheless, it looks like
> > the current public TF-A implementation doesn't work exactly like this,
> > as it reports an error in Maulik's case. We should fix it too, I
> > think.
> >
> > Although, to me it doesn't really matter as I think $subject patch
> > makes sense anyway. It's always nice to simplify code when it's
> > possible.
> >
>
> Agreed, I don't have any objection to the change. The wording the message
> worried me and wanted to check if there are any other issues because of t=
his.
> As such it doesn't look like there are but the commit message needs to be
> updated as it gives a different impression/understanding.

I think the commit message is accurate and we can keep it as is.

Best regards,
Wing

>
> --
> Regards,
> Sudeep
