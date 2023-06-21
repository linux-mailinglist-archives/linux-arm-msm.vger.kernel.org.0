Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC44C73869D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 16:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbjFUORU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 10:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbjFUORT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 10:17:19 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1055310EC
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:17:18 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-57028539aadso66320257b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687357037; x=1689949037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+xYklj5PMyobjhXA/VwaGPhy9KcchXftQTErxK2SLto=;
        b=Y+sLE2CE7LA3Yqa8VXZaagqvjg43wDGdJvjZUFuAv2RxLSOuZXVfbkHl0ai5X+ZdwS
         dpo9ve84MPGB/CyNiJeS1QGFJjXYYB2qYmTite/cgjhrIuhfjq2JKovr+umi1LjFu+Hg
         3SGRwLsEvGWh53glzikHdPu8fRi28FM9VRe2udbPKqu7dmmk4PRQZdDVSGIgDpZmKsAX
         ijoJFm7stjl8kd0VRn5Kf2hnOiwz1xwcuEjJjYBJ1BRHWOYdnWaNUQeh4tvpl+rz/NfC
         trQmvm6Bh5xtzMoBjfRp04WlAcT2UXByZrSV9I7BOHkGOtn+bfWozmThAjYyj2QM8Jj1
         5U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687357037; x=1689949037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xYklj5PMyobjhXA/VwaGPhy9KcchXftQTErxK2SLto=;
        b=R2Pu2oIN/EVcx240z0JXHzpQGKS+8JQezPD+Ft6MutGFV3Tsmqr6ziQDfY3H1pvav+
         xQHNz0QSpiO1uHUdc4n8uTTT0EVanAqZxs/ZrnYKTs3WIrG/H4O3DH7gjKtQS6VgEkI4
         LcOfjTrE0oCQ1BNIg0zt4yGaltRWr6aRtvDvLQqBr5T42G4uEe7xVh6UtGkakpgoJX31
         jxAf6yDWg1t3UQVZN5WpHoX2lgtMdodZIZePgbdldGGHyKPVbvqDYXCBnCeftKf/ygHM
         rSURAsO7UyN55UB7Go0VL8+dStx+ylfpO2VMdKToX65qjcyt8JGKKWlBTGezGhNrMWfT
         VsLQ==
X-Gm-Message-State: AC+VfDwuHVqghol+LSW+VZw3oVLEGhWirakzRpMwz4t9zbZj5xpMllPL
        Wqcsdn7+CO7i/b+J8pfTwuLPSjvecLB94fde4nFd0w5eqKPBUJKw
X-Google-Smtp-Source: ACHHUZ4+JSxviD45oXipN+JSDE2ZcZ/gtwyTm9modvwdd/BXFUfRHPaKIotRrEMNyfj1LNyc58BAWLuMiEErPALNN9s=
X-Received: by 2002:a25:bcd2:0:b0:bca:6694:23e6 with SMTP id
 l18-20020a25bcd2000000b00bca669423e6mr14132777ybm.16.1687357037246; Wed, 21
 Jun 2023 07:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
In-Reply-To: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 21 Jun 2023 17:17:06 +0300
Message-ID: <CAA8EJpoXvL3rADU18AyEH_gPNXZH=odoUCVEnxgQ7vaxEYqvpw@mail.gmail.com>
Subject: Re: [PULL] Add Audio topology firmware for Qualcomm SC8280XP X13s platform
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Jun 2023 at 13:55, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> The following changes since commit 045b2136a61968e7984caeae857a326150bfe851:
>
>    amdgpu: update DMCUB to v0.0.172.0 for various AMDGPU ASICs
> (2023-06-20 11:50:21 -0400)
>
> are available in the Git repository at:
>
>
> git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
> sc8280xp-audio-fw
>
> for you to fetch changes up to 85d1739e5aafcfada7a1e847c258217bd7408a5c:
>
>    qcom: Add Audio firmware for SC8280XP X13s (2023-06-21 11:11:34 +0100)
>
> ----------------------------------------------------------------
> Srinivas Kandagatla (1):
>        qcom: Add Audio firmware for SC8280XP X13s
>
>   LICENCE.linaro                              |  30
> ++++++++++++++++++++++++++++++
>   WHENCE                                      |   8 ++++++++
>   qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin | Bin 0 -> 24296 bytes

Could you please move it to the directory with the rest of X13s firmware?

-- 
With best wishes
Dmitry
