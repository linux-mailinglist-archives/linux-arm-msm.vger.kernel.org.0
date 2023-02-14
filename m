Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33FE669579C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 04:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjBNDwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 22:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjBNDwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 22:52:04 -0500
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6672124
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 19:52:03 -0800 (PST)
Date:   Tue, 14 Feb 2023 03:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1676346718; x=1676605918;
        bh=0Om9daH+srbk1Ex/nmyUaiTIs6i2DWm1NO4B9XgAcyY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=QCqSa/pMmKl1ay1aobbYEyGECEStKkRwFgCn1Zg9Srvv0ADhfNSXrEAXEM6ff+L0s
         5OEaYgf+G458WSp0jHGTETKoGpGQBOcJgpQqr4f9KSO4s6JyfruycXkKcupJFOQZ+d
         gSCaQsPkASYWcV0Hv3/2GhXsaV80ZyiST44YNHSoxYhW/5nfNq8D6QkMicu7VAfd6p
         QbMORxWvEFlRSZveKY30PdDfauIQN13hAeCkiiyKspG00RgbeDuboJwsXXAgwpTScy
         Dl9B9YBEDbqEbWGJgLnIR3H4wS66XaL/idGJ0cQrq/MqZiuC8LJgiH0TWYGMnbotS1
         1TEZw3unvTxzA==
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jami Kettunen <jami.kettunen@protonmail.com>
Subject: Re: [PATCH 0/4] drm/msm/a5xx: make it work with the latest Mesa
Message-ID: <Y8RflDlhcu8n8TdSUK96ddC4DWbEDkGMcVEPfYYB2QiGB84R1-KDaERr26P7SOmBrxowVqP75m6dC2r_30-Wx5mSxgS3ytWnvQhhsB4C1DU=@protonmail.com>
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 6882736:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tuesday, February 14th, 2023 at 6:09 AM, Dmitry Baryshkov <dmitry.barysh=
kov@linaro.org> wrote:

> Mesa 22.3.x changed the priorities used for the GPU contexts, making
> kernel switch between different ring buffers. This uncovered several
> issues in the A5xx preemption code, which are now being resolved by this
> patchset.
>=20
> Dmitry Baryshkov (4):
> drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
> drm/msm/a5xx: fix highest bank bit for a530
> drm/msm/a5xx: fix the emptyness check in the preempt code
> drm/msm/a5xx: fix context faults during ring switch
>=20
> drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 +++---
> drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
> 2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> --
> 2.30.2

Thanks for the fix!

For the whole series, on MSM8996:

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>

