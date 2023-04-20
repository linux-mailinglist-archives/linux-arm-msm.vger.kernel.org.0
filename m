Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7D56E988C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 17:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjDTPlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 11:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjDTPli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 11:41:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929B14ED2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 08:41:21 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f09b9ac51dso22953215e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682005280; x=1684597280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pMTCI9kAG7wRhQ4LO+BFtd8OeJXKh9I5SStps/c37Rw=;
        b=PsOyPWDCsi920bN8Udf6m0hFPjcB7Hp3uhPoxvdq/n0L8GKwzbRaBjT67AFSTy8etY
         dSxDU4PLWYFfVwc3MwyUS1a6Op5jKszILgf4c140Cp1OuLCCUyTe6ZZ40QvUyn7ldb82
         07T1NhScT3g4Kf+6DbgUKy4gdirJpfjjuzaFjxwlFSETLG7ebv7t/9zlAv4SXQ2tpcLs
         rvl+vle9tOoZVlmgyhCdItgQAW9LV2W8H5AIWyDj5lUM22E7iPfIENAJJoibq2yuvvyT
         +dx61Ogx3NogDVkYbVskFRw1Bu/2nsIV56zRNYtRrf8l0a1U6Xe4mp4s7WGBk+dJnaqD
         qnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682005280; x=1684597280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMTCI9kAG7wRhQ4LO+BFtd8OeJXKh9I5SStps/c37Rw=;
        b=lp+Wg3mv598XiIg95FjYJHHlsFUV8P1UZoNUaPB1ddJqO8s23Yv3heYnYO/QMXRLp3
         9yYOBbi7gx4ADCCf2haIeW3bjXKxCyBi9F7q9xSu6UySmEu8VmTBUTdt8iqxcLUVE+5E
         uWvLGLogu889uajMZrDI6xlxHzuMVGOe3K46+hvkPooGP/QcUbM80xxGW/6IT0tv0G7d
         QIw8EdAXHpkqnm+XlRPsXRwXXLm4B75wyPYJ7rerPhnUmm6HakegKMBO0B8mb4OY9q9F
         NyvFRCZLENpDsO8Gcz4suvRYZMdby+493Ep99Uz7pxjyRUq53KGcy8XXeFeS1ku+hdyF
         R5/Q==
X-Gm-Message-State: AAQBX9cUIGFtG4EaRa504fxO0ckrxkljj+t4NHxor/Nmp6NX2PZjo/XS
        PVBF6fB8rB8HI3GdY7vz7307ILWOoYvXCxmFtz8y7w==
X-Google-Smtp-Source: AKy350Zm2fmnU/Ys/3X2CzEj8wVPLTgQsWnV/f20jBKDfIONBHIbCzhsBE/x/IkJXuZKQzVRBRgr21q2SXkmBujHd1Q=
X-Received: by 2002:a05:6000:1181:b0:2fc:3596:7392 with SMTP id
 g1-20020a056000118100b002fc35967392mr1580931wrx.24.1682005280020; Thu, 20 Apr
 2023 08:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <1681971690-28858-1-git-send-email-quic_sarannya@quicinc.com>
In-Reply-To: <1681971690-28858-1-git-send-email-quic_sarannya@quicinc.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 20 Apr 2023 09:41:09 -0600
Message-ID: <CANLsYky00+sD-MsGK40E79xe8v8vtxji8O0LdgEOHYTF5PPpZA@mail.gmail.com>
Subject: Re: [PATCH V6 0/3] rpmsg signaling/flowcontrol patches
To:     Sarannya S <quic_sarannya@quicinc.com>
Cc:     quic_bjorande@quicinc.com, arnaud.pouliquen@foss.st.com,
        swboyd@chromium.org, quic_clew@quicinc.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Apr 2023 at 00:22, Sarannya S <quic_sarannya@quicinc.com> wrote:
>
> Added new IOCTLS- RPMSG_GET_OUTGOING_FLOWCONTROL and RPMSG_SET_INCOMING_FLOWCONTROL
> to get/set the rpmsg char device's flow control signal.
> Updated the cmd name 'RPM_CMD_SIGNALS' to 'GLINK_CMD_SIGNALS'.
> Changed 'remote_flow' to bool type, and updated it's evaluation.
> Updated evaluation of 'set' in rpmsg_char as 'set = !!arg'.
> Add destination address of endpoint as parameter in rpmsg_set_flow_control.
> Addressed review comments to change variable names/descriptions.
>
> Chris Lew (2):
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support
>
> Deepak Kumar Singh (1):
>   rpmsg: core: Add signal API support
>
>  drivers/rpmsg/qcom_glink_native.c | 64 +++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.c        | 49 ++++++++++++++++++++++++++----
>  drivers/rpmsg/rpmsg_core.c        | 21 +++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  2 ++
>  include/linux/rpmsg.h             | 15 +++++++++
>  include/uapi/linux/rpmsg.h        | 11 ++++++-
>  6 files changed, 155 insertions(+), 7 deletions(-)
>

It is not possible to follow what is happening with this patchset.
Please send a proper V7 that takes into account the comments that were
received _and_ a summary of what changed between the revisions.

> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
