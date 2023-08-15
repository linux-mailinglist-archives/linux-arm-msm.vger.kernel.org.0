Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4BDC77CC47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 14:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236988AbjHOMFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 08:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236974AbjHOMEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 08:04:47 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C0A10F9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 05:04:46 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bb734a9081so24718261fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1692101085; x=1692705885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZNL+lyJXlDowNIbWWyMureRuKR8rAj9k/oL5v5izxc=;
        b=blx3s3KVk/ndOnqHTKt1sHABOS2zy30PgIpcc/O3edhtSyYXL+U1vhVumuylgW5tns
         PKn3ytyiaJ6ytk2jEB/9Y/J9r5dk+ECrQ8vP4fej7ZsaU90zLfEL8c5WI+Y+8xWL7GW3
         KswpYBcmpN6pV/a+B2pCHEfuxyWJUCwAjpH2mPtA3biPXRAtjZpn0IFqE1E899EVbR7n
         Y/ODrxDrHnG5GIrN6lh+n36NQgDf4TBZ4lF1rmh+YNoBvMi5vs1ccqgom3bKi+Yllnvo
         FayWUVMZFe7cgqXwrjm8M2RKP8c7WkbJPnMmhNfF99W3HC5Apb8ulBsdcZ2u/0pdbAe+
         JiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692101085; x=1692705885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZNL+lyJXlDowNIbWWyMureRuKR8rAj9k/oL5v5izxc=;
        b=a2ZeC0E6/pqM/DxCeDFst2v9ZyRK/WQNjKzWyFZDvEiIoeRIcR+HRVABjlncGJGO/s
         i/tBooTKlSvFA4jC5xSA5ACa93ytU5SF4fF76gyEbaiMoBBZPDLcjyl9eUth8oWROmj0
         OxAg4/LOOIN9U43oPKIVD0luXGS5aFYZ//yDdGYG7zBbkH/0nwh6byT3TodzgzuN6KOZ
         85QCREJUKs/D0ZPcxqKgaUMnAQFHeAZkI52J9N8Y6QA9WtqGD6LMVkxapp75FwEWfLAr
         hjoUrwEXCqCgd0n+DFnh79CvKgwUikfSL8PV6pFra8vsboT5cPkXRWZcoDO/bKXVRrOo
         rX4A==
X-Gm-Message-State: AOJu0Yw6E+vSX5ZpJu38hSD76QeS1HkT465AI163fzI8Ubvon4EaIg8s
        WZ3uOeLNsJAiEdYeEw7hQP1N1RlxC/RtGozkhav9vQ==
X-Google-Smtp-Source: AGHT+IE8gqnACIFDnu3Op7a3XdWdZvfD0AG054fdNXDttJp1YBYTEtCJFVXxXzSJqp5uo73PYYcNwsR3tNOjvzRqhzI=
X-Received: by 2002:a05:6512:710:b0:4fb:103f:7d56 with SMTP id
 b16-20020a056512071000b004fb103f7d56mr469965lfs.14.1692101085051; Tue, 15 Aug
 2023 05:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230814181823.3662-1-aboutphysycs@gmail.com> <20230814194335.GV1428172@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20230814194335.GV1428172@hu-bjorande-lv.qualcomm.com>
From:   Alexandru Ardelean <alex@shruggie.ro>
Date:   Tue, 15 Aug 2023 15:04:34 +0300
Message-ID: <CAH3L5QrLyAHyA3zdtjM7+eNQk5vExq=d9LWaOegXpv+-6s4Jzw@mail.gmail.com>
Subject: Re: [PATCH] power: reset: qcom-pon: removed unneeded call to platform_set_drvdata()
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Andrei Coardos <aboutphysycs@gmail.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sre@kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org, agross@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 14, 2023 at 10:43=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Mon, Aug 14, 2023 at 09:18:23PM +0300, Andrei Coardos wrote:
> > This function call was found to be unnecessary as there is no equivalen=
t
> > platform_get_drvdata() call to access the private data of the driver. A=
lso,
> > the private data is defined in this driver, so there is no risk of it b=
eing
> > accessed outside of this driver file.
> >
> > Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
>

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>

> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Regards,
> Bjorn
