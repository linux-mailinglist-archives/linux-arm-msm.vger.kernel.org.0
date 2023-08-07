Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D667A771AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 09:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjHGHCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 03:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHGHCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 03:02:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AB31A4
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 00:02:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5232bb5e47bso1824018a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691391765; x=1691996565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU5B2EBHhQjBavzHa+Lju5JaCfU4uGI90WK0F+KwopU=;
        b=D2+pEqFLwGX9TPKCDHNgJfpbnfHaC0s9ballaAGrnHGRkH0lJPw53s+B/QJM9iDGeJ
         alreyZzPf2i3J36Q+fEMCXTejIOAsv588jCjFO14PooeZb6nGr58ZmpUCb7mtGJ/Ha2J
         ekoSzfzhiTQQZ08dFSnnkJtOzxce402ynNUrSGHBHkS7XsZm40PQLdwB+yedRbuDNbPk
         y2ab+bXtPVs9MEA9tPhzEIK5Tcx1jXPitRpt8KWJdqexJ5H+PPeCzsX6VMwmFiHY4mIv
         ujqHUrlclo3BOIJSdmKIhwOWnhCHllMIvJKh8nqjAmosFmC64ypVeKNK0x0dFsz60/fI
         fRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691391765; x=1691996565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU5B2EBHhQjBavzHa+Lju5JaCfU4uGI90WK0F+KwopU=;
        b=X4hY5i6hXK5Ecwn9Nv/DGBoORhjbvpThSAT+/v4pzW1UYMWbhCA7uWleG65Ic/DGel
         mhUFyHi8xIOQT9Tacs+yavlYBb2GmBi0yG9GkVyfmtc4HVjsygqCh5nPKZBhLgDoodRn
         OL7Qi5ImfJJM8k9xufj5ytKVggGxkWapl25kG/8m/XJG1ln8LturysdwNOmvFmtPHxOj
         s06pfORHiLrptoB0AnNEHHm0Q34FdR/SWsZUNSV8rbzj6Mks+jtX199GbghBqshwmgi7
         TYw7A6S+uyDXNjpwXoy/catZ9ZgvpBS+YPjw5pAisKJzgoMUSI3kTQYVO3d6ctnnql5x
         KjQw==
X-Gm-Message-State: AOJu0YxeE2A9RfCzBzVHuo/nvluC5m5iN1YuADzS3wIqlsg+CKEcBAX0
        wD2WTPGRL2h6+hends77OA//+RcjnvE6SkqZRLUWtQ==
X-Google-Smtp-Source: AGHT+IE8fCofi961DObv0VFjUtKUaX4ki8nzGwBAjm4iMSth8k6td3HgtEY47o4ONGrjlAN7E72usAGLUfXWmDvnvqM=
X-Received: by 2002:aa7:dada:0:b0:523:3e23:15ab with SMTP id
 x26-20020aa7dada000000b005233e2315abmr600196eds.26.1691391765628; Mon, 07 Aug
 2023 00:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230807030454.37255-1-duke_xinanwen@163.com>
In-Reply-To: <20230807030454.37255-1-duke_xinanwen@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 7 Aug 2023 09:02:08 +0200
Message-ID: <CAMZdPi8jijOw5oEeNFkPG1U4qi8cV+MHTE3FAm5oKF49yG5tmA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for Lenovo RM520N-GL
To:     =?UTF-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
Cc:     mani@kernel.org, slark_xiao@163.com, fabio.porcedda@gmail.com,
        johan+linaro@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
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

On Mon, 7 Aug 2023 at 05:05, Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xi=
nanwen@163.com> wrote:
>
> The Quectel new RM520N-GL product works with the Quectel's existing
> RM520N-GL modem settings.But this one is designed for lenovo laptop
> usecase, hence Quectel got a new PID.
>
> Signed-off-by: Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xinanwen@163.c=
om>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
