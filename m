Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC6168D279
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 10:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjBGJSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 04:18:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjBGJR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 04:17:59 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712A6360B3
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 01:17:51 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id be8so15004243plb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vynNRfSz8UJUJP4Q5FL14QMsef62fBn1vsCCQDDV/vY=;
        b=R1RY8J3+sZ1bzuiDAlqrWeNM95zr0EH40rmNJmI63W739CVH13b3MkpzVaSUwdPzrG
         Nt6CpRYcBIGPRFVB4HLt2m0DmN2l4eRhy2NTmtUSCciX7/PRY8xX3/JCC5L5Ks6ROAnr
         P8QNKTiVHjdzpV04oO4mCxRcX7LWuzTKmWJLbtuHTHA+/gCgXor4ZqU1IPmKalccOwxu
         WOlb0apKV7l0mCbMXTEewcMoYgijMMM+4k64Nfsy1uiTB3FGhGipm7L51TNuaO5homR8
         5GoC46YNcJAvu2ifxEtlSXO+bgzJ2qBF8CTTdJaiIb1pMrSdHp1stpF/1rzEzfoDSfA9
         2NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vynNRfSz8UJUJP4Q5FL14QMsef62fBn1vsCCQDDV/vY=;
        b=DxtxtNiSWz6tpCgtZijzsYcRHv0Oh90m81AOmjkknXtZ7dU4ZxdNpfEOeGuJAXsC6D
         SyYCLDQUptUngsMr4p3cFYugwYfIE4xgLZfx9vjANqkh5dWNGC+q249qLqOUC4Y0LB/H
         vAvJdWXo7HgQ17hKmrqHOlPLqZ4SmN1m4is+tulonKo613l41xDrBTsbdZaNMoPgyPe+
         59IuZJVDRCEoHIGTrQ3a9hUcfahNzixL+OvbxX7i/9sBai3HsfNKgwNkXaTrZAcyEKAv
         cj/H2bhSWloh2adncyipOsUR5UX6k8k6QQ4OpSSixquKyHlprNY3gWmMwyLNZXlRnld5
         SZjQ==
X-Gm-Message-State: AO0yUKWacHNQgIA5ROFZ3k1CPdgC6U4dDijAz1b2uf0v717w2w2BGdlH
        t91hZwd22fPv/eKGiD55QTuqkthHqmNNJO/e9Ce3Uw==
X-Google-Smtp-Source: AK7set95NxDcJOcKwkgKYhUL7CmWpq4Or5U/UqhpyeVInDXOvC3DKLJkdy89G8Uj7gYy5XkPJ7v1GVSh9cah2hMa3FM=
X-Received: by 2002:a17:90a:6286:b0:230:86a0:4d96 with SMTP id
 d6-20020a17090a628600b0023086a04d96mr2391839pjj.49.1675761470716; Tue, 07 Feb
 2023 01:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20230130105423.1338554-1-mk@semmihalf.com> <20230130135418.1604455-1-mk@semmihalf.com>
In-Reply-To: <20230130135418.1604455-1-mk@semmihalf.com>
From:   =?UTF-8?Q?Micha=C5=82_Krawczyk?= <mk@semihalf.com>
Date:   Tue, 7 Feb 2023 10:17:39 +0100
Message-ID: <CAJMMOfNJV+eOqTgUoLLWKQe2MJ=6fXL3aaP6d=YrSBQvfhOXiA@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: dec: Fix handling of the start cmd
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mw@semihalf.com
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

pon., 30 sty 2023 o 14:55 Micha=C5=82 Krawczyk <mk@semihalf.com> napisa=C5=
=82(a):
>
> From: Micha=C5=82 Krawczyk <mk@semihalf.com>
>
> The decoder driver should clear the last_buffer_dequeued flag of the
> capture queue upon receiving V4L2_DEC_CMD_START.
>
> The last_buffer_dequeued flag is set upon receiving EOS (which always
> happens upon receiving V4L2_DEC_CMD_STOP).
>
> Without this patch, after issuing the V4L2_DEC_CMD_STOP and
> V4L2_DEC_CMD_START, the vb2_dqbuf() function will always fail, even if
> the buffers are completed by the hardware.
>
> Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful =
codec API")
>
> Signed-off-by: Micha=C5=82 Krawczyk <mk@semihalf.com>

Hello,

Did anyone have a chance to take a look at this patch? It's fairly
simple, but lack of this fix can have a big impact on the V4L2
applications which implement the flush mechanism using the stop/start
commands, especially in the middle of the video.

Thank you,
Micha=C5=82
