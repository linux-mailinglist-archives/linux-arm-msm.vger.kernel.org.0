Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DC37E1D5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 10:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjKFJkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 04:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjKFJkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 04:40:14 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5924EDB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 01:40:11 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5af6c445e9eso49807267b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699263610; x=1699868410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FpIVvXMECFRktQ4IhefFOl0oiCPkgte0mG50ImpQsdk=;
        b=m2oINbE3aELoScUJWKmzQkLqrBr2jIyK0TbiP357vpB3pbGePhcnX/LiKCtlcSw5dJ
         Nps6kNjATYXFK+hz4LvNt/y4i6j35LPT+P7de/AYW/CrOQEYML+dG2HxODh/9UB3Dkmq
         c9LD/5RxVpjuFt1ViKs1dJMMQDkMp8r203FTgugxP/3dO2xe+DH3/Bcpp8IH50tUzoI9
         SF8w6IjuK8W9Ic9EstP6MMROgdii9iwj1AhP7V8mVL68/+9JDDpRGOsOG8ZyihODofyW
         iKeFl0NqvMnccVs+/vcDQCJcBLleJpV3miZamUp5eFts+Bm/cLSkqTmLxNIqxvtlndHU
         YutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263610; x=1699868410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpIVvXMECFRktQ4IhefFOl0oiCPkgte0mG50ImpQsdk=;
        b=suYkNjGjdqRnTj6+SpWo6wE6kLp98S2VRRDvg9GwXjsGvkG+CSAcmwQmp2bdhX47F7
         rEbLtJW03J0RnBvEhkMxd9YI/ghFhFNy62yi4NQMV9X+tlRy1jlCM3jDcqMEJfQ3OkFT
         lWpEHgC0LfGgTBtBPrnD14g18OgdTwSQv82fjNwNeApRt2GD+TYQT+O9RVCfQwVQufZU
         yDyp8q01nLKFnCrojvXXAkAFVDwzhMJ9F1VmNw+VHcLyLUGXtkQnHj1a0V1MKoF/e+Gj
         Mt/qGTctrjS6z4CIsLH6o/VDaThzC/xyMj5hIBJe1wYEl6Ya8FjRc1OEjDE4OOcCvWUH
         TRCg==
X-Gm-Message-State: AOJu0Yy6+IShxLadLuZ5kmtwFk6DjL2bJqvZMPBOTXjN8Cjextt10t3J
        RiTWuIAUgMyz5St8gzXvvLM9BglDrCxXYmG0cNgYUuy2zLB8du8u
X-Google-Smtp-Source: AGHT+IEteHXH+5R7EEOi7azE/STUcVaeWLwtpXheOcC2xH4yrT14fOb22Bk4vXiIohltgkr9GmLf/SVrlHYf6RmNdkI=
X-Received: by 2002:a05:690c:dc6:b0:5a7:b682:7929 with SMTP id
 db6-20020a05690c0dc600b005a7b6827929mr12178727ywb.17.1699263610498; Mon, 06
 Nov 2023 01:40:10 -0800 (PST)
MIME-Version: 1.0
References: <1699242172-79472-1-git-send-email-quic_qianyu@quicinc.com>
In-Reply-To: <1699242172-79472-1-git-send-email-quic_qianyu@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Nov 2023 11:39:58 +0200
Message-ID: <CAA8EJppfo94PWYK3Q=ChUBC05PZ5zCguaiB28AHxMNhpRp-tDA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add SDX75 support and its dependency
To:     Qiang Yu <quic_qianyu@quicinc.com>
Cc:     mani@kernel.org, quic_jhugo@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_mrana@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Nov 2023 at 05:43, Qiang Yu <quic_qianyu@quicinc.com> wrote:
>
> This series add new configuration for SDX75 and new parameter

Qualcomm SDX75.

> ready_timeout_ms for waiting ready state.

Please follow the same subject style for the cover letter subjects.
This cover letter looks as if it was adding support for the SDX75
platform to the whole kernel.

>
> Qiang Yu (2):
>   bus: mhi: host: Add a separate timeout parameter for waiting ready
>   bus: mhi: host: pci_generic: Add SDX75 based modem support
>
>  drivers/bus/mhi/host/init.c        |  1 +
>  drivers/bus/mhi/host/internal.h    |  2 +-
>  drivers/bus/mhi/host/main.c        |  5 +++--
>  drivers/bus/mhi/host/pci_generic.c | 22 ++++++++++++++++++++++
>  drivers/bus/mhi/host/pm.c          | 24 +++++++++++++++++-------
>  include/linux/mhi.h                |  4 ++++
>  6 files changed, 48 insertions(+), 10 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
