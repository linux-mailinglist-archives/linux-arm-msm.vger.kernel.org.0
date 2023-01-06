Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259AB660637
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 19:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjAFSOa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 13:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjAFSO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 13:14:29 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0A476822
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 10:14:28 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4c15c4fc8ccso33096707b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 10:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xP3geULSyX4lV8d6R9rMjnULV5w7kHHpTYX3xrPNxuU=;
        b=UsNe0gNyAmOwYoDLj/i8PWxRee4X8jVDyisS53x003xJU8GpJ9FGr7LBLz9Q7mCcuZ
         FP3rrd6blhEJhWHOaKCHN4riLuLTcrxVNIBsFEt8yoKjUhMM61KI6jRYNZZUZcDLsxHd
         YhexIyBurtEAKJ0MtEO5v0WzSugvXSGoaDyejb3le0GET1TY5oD0cvBHWRuCZif2br2K
         LxVd565xq0N7YcPuCC2Nzv/5fcsQAbUXVBZNE8abWQjr6DdDbpvbkkCdgDnZyVM4X0DL
         bB5JTEjH/tCsNe8cTCWMiF9KG+7nl6HOBNhqYHa6z9w/U5HsrMW9a7y9LumOrzpeuivT
         IgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xP3geULSyX4lV8d6R9rMjnULV5w7kHHpTYX3xrPNxuU=;
        b=BurNc9XHK/NM1CMKZwpQs+6/83pSKSsAficIO8S2PpIhH6ZO7mIK21HPs0aDiVY+wr
         5FIVK2/0z0ndqVa8BBB+QEo3CtlsW9EwvmFn/hpaAYfjJxryTd6TYSXlV0tFPrzYEqUo
         lb5bBzge7Wl9GFDE26BgRQaU2t8992QqUHcwDAynmSFLro/9bB6omoDTxM3mTMf3285M
         LPQvCMRic8SyMDZpThxnLcrDaw0wssEdXeqUYPqL17G8UAK8HWgshhcT8C5PtuRcfGuy
         Fj88zCumam8EKfr1ikTEaPa68SYW5HtV6XiaO/C8m4lMGVzkUaubo0Mn1J7YUVUp0mVr
         3X+w==
X-Gm-Message-State: AFqh2krUTMQr42vqb7IrLI0x5bU0aJEUwJLW5JETLwDrF9Ai32Ong+Af
        EXISYz2J6a8oW+Yukxr5jAeeN2Mh2rfECEdPwSp7qg==
X-Google-Smtp-Source: AMrXdXslvebv24QddXX/TLgWhNaCTYaNYEw3yuKcUZCybMMAI19TPi0KCw62PgInbStQYarDYBZo8VgZN7ECFstTgWU=
X-Received: by 2002:a81:6702:0:b0:477:b56e:e1d6 with SMTP id
 b2-20020a816702000000b00477b56ee1d6mr5205418ywc.188.1673028867810; Fri, 06
 Jan 2023 10:14:27 -0800 (PST)
MIME-Version: 1.0
References: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
In-Reply-To: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 20:14:16 +0200
Message-ID: <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com>
Subject: Re: Annoying message on the console for the db845c board
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Jan 2023 at 18:37, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
>
> Hi all,
>
> Does anyone have an idea on how to fix these timeout messages ? They are
> displayed again and again every 5 seconds and that saturates the
> filesystem after awhile.

Could you please check that you have CONFIG_QCOM_RMTFS_MEM enabled and
the rmtfs daemon running?
I think that's the usual cause of such messages.

>
> ...
> [   24.662181] qcom-q6v5-mss 4080000.remoteproc: start timed out
> [   24.768150] qcom-q6v5-mss 4080000.remoteproc: port failed halt
> [   24.777618] remoteproc remoteproc0: can't start rproc
> 4080000.remoteproc: -110
> [   24.785022] remoteproc remoteproc0: Boot failed: -110
> [   24.833657] remoteproc remoteproc0: powering up 4080000.remoteproc
> [   24.840126] remoteproc remoteproc0: Booting fw image
> qcom/sdm845/mba.mbn, size 238304
> [   24.897361] qcom-q6v5-mss 4080000.remoteproc: MBA booted without
> debug policy, loading mpss
> [   31.573938] qcom-q6v5-mss 4080000.remoteproc: start timed out
> [   31.680229] qcom-q6v5-mss 4080000.remoteproc: port failed halt
> [   31.689683] remoteproc remoteproc0: can't start rproc
> 4080000.remoteproc: -110
> [   31.697070] remoteproc remoteproc0: Boot failed: -110
> [   31.765283] remoteproc remoteproc0: powering up 4080000.remoteproc
> [   31.771758] remoteproc remoteproc0: Booting fw image
> qcom/sdm845/mba.mbn, size 238304
> [   31.820553] qcom-q6v5-mss 4080000.remoteproc: MBA booted without
> debug policy, loading mpss
> ....


-- 
With best wishes
Dmitry
