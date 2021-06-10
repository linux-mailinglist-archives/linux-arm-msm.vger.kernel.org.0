Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322043A2E8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhFJOuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhFJOuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:50:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8568C061574;
        Thu, 10 Jun 2021 07:48:06 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso6727390wmh.4;
        Thu, 10 Jun 2021 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D/ihjXO4RqE7jX7suSjDihZYCxFd3H0ms2fk8B+1vrY=;
        b=r9aCM9AHb8JpMAdzpnuIG/pJhJkaOVrMX09Mz+tP7L5ahdd51MuGMJBZ7ltUxxNN32
         kkmrAarwMbcwPlLQMDF9/+2/d5CudUoTqWLfobzSqEKEWITkDQnUpgq6I/bPmWAiUJxF
         cHQwkZn6oYYYyENrQuX3xtQMLeMRhIILcyapldrzkApmrwTTJRRxb/EZb0WKv1+agi6y
         Kzuv8ntPYyRGyNFesU+HYqB1cbFErbX13tEXxUOfRnSOGMF8DZPz2nGrIySRF86guCaj
         eMy1FFOTD/L3mGHT/9usARui+NqlbvMZ1+TRBwO3liFoiUBXvwFwUUuNSvSQjo4+w/qT
         NlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D/ihjXO4RqE7jX7suSjDihZYCxFd3H0ms2fk8B+1vrY=;
        b=X44iHVIQK7wE2KNKA0QP6/p/W8fm1BnOq5P/b3XU/jyFkELBppEKdi1hIof/w4qwCG
         NPi90siFfZMM9Bd38cTzXjnCvsDoVYBlhu39T+h3yA996l2s6y/zm+KQBjsln/BqLGdQ
         PkMmmWL0JROldglHXmIGlpYP02xDjUFJFf47W0/gc7PHtY01brNGECLUiTZMQb7UxVr8
         LRDH4xrnt6tI20EDHI0kHk7b+Waq00lSJ6ynC7jHuIIK+8/Tsg/lY20qOSn/TS7WZL7H
         7hTb+WWV+/+GaZiNKob2uWWqK1mgDwvGvCbk7/h+ZDwUHactIctsETEcMV027PBnxL/7
         REYA==
X-Gm-Message-State: AOAM532O3ZdFfwk6IoxvHAmr9GpenRyu8bzLdblzCVwR5Np7g2FXcbEk
        xmoC9GlNxlMQafFQSdnzQIu9I6I6kgQ+1IUyz7I=
X-Google-Smtp-Source: ABdhPJxs+Nw9AecB4n5d4NRAI3Sze1CREk1iqKnLbtL7oryF5BI7b2gh+Dmm/XxLsQJnB6KluTS30+Rjsn/w3RtRtPA=
X-Received: by 2002:a05:600c:1c84:: with SMTP id k4mr15648966wms.164.1623336485064;
 Thu, 10 Jun 2021 07:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <d60373362ed41b49f763cdb46c9973e2@codeaurora.com>
In-Reply-To: <d60373362ed41b49f763cdb46c9973e2@codeaurora.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 10 Jun 2021 07:51:58 -0700
Message-ID: <CAF6AEGui16Q9uDrkXNuDsi0Do-ZNDJa9aQGWhqG_tjV7O2DReg@mail.gmail.com>
Subject: Re: Re : Query on UFS Lun detection
To:     vhiren@codeaurora.com
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        adrian.hunter@intel.com, Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-mmc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        linux-mmc-owner@vger.kernel.org, nitirawa@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 10, 2021 at 6:28 AM <vhiren@codeaurora.com> wrote:
>
> Hi Community,
>
> We are using UFS as a boot device, and we encountered an error,
> mentioned below while booting through UFS.
>
>
> APPS Crash - Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(8,7)
>
> Here in Kernel command line we are passing "root=3Dsda7", this is our
> Filesystem partition to be mounted.
>
> While debugging the same we observed the partition which is suppose to
> be mounted as Filesystem is not enumerated  itself.
> The reason behind not enumerating of partition is, the other Lun got
> detected first instead of one which is having FS partition.

Use the UUID or PARTUUID instead, ie:

  root=3DUUID=3D13846802-672b-4a5d-9f0a-22d13957add3

(but you'd have to check the actual UUID of your partition with a tool
like blkid

BR,
-R

> We are using async probe, hence we know the detection will happen in
> async way,
>
>
> In working case :  it looks like below
>
> sd 0:0:0:0: sda1 sda2 sda3 sda4 =E2=80=A6..sda8
>
> sd 0:0:0:1: sdb1 sdb2
> Here, sd 0:0:0:0 Lun got detected first and enumerated as "sdaN", we
> have FS partition as "sda7" and so we don=E2=80=99t see above mentioned e=
rror.
>
>
> In non working case : it looks like below
>
> sd 0:0:0:0: sdb1 sdb2 sdb3 sdb4 =E2=80=A6..sdb8
>
> sd 0:0:0:1: sda1 sda2
> Here, sd 0:0:0:1 Lun got detected first and enumerated as "sdaN" but we
> don=E2=80=99t have FS partition in this Lun. Instead FS partition now bec=
ame
> "sdb7".
>
>
> Observation here is, which ever Lun gets detected first it will have
> "sda" enumeration and so on.
> However, sdx=E2=80=99s driver scsi/sd.c uses async probe to improve perfo=
rmance,
> meaning sdx disks are created in parallel. Whoever calls
> device_add_disk() first becomes sda, the next become sdb=E2=80=A6.
>
>
> Is there any way, where we can fix this in the Lun detection part of
> code?
>
> Thank You,
> Regards,
> Hiren Gohel
