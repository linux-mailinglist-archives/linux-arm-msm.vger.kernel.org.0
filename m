Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27CB7D5C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 22:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343896AbjJXUH1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 16:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234918AbjJXUH0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 16:07:26 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8E8186
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 13:07:24 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7dafb659cso49047087b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698178044; x=1698782844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dWqQuOwuPTBw/R7QWLQ4sHHJs2Fn36dP5dQoK4hDiYA=;
        b=yrtot5B0JlHGblliCRx3WncqMFr/rH9C5iwzylY7hMi4eOCMDlx+4glp4e8+PsZL4X
         4oAjNOpNMvawInm8ofiBcpVGZwqPu7pGUGjzWlfNaZ3cyxbjoBdiXcDpdhClAlXJL2oA
         /JTyqrZFGDi90XXqdu6ClHFgATKCo9I/STY9ETU/LH/8ibGeSvPNoWcQe8FIKdSXLsrj
         AKwvJ3q6w7p0AOT0E3TN73mcONBOZJHKexFKXNVdmQJRYDYry0e5SihcuxsWei4GIi24
         0NPQCZ1wmbANw87KrpviO76u6qm2y0z/yPYaDkQeW6cnwnP8gbt0I0wz79ljwsBcEUkz
         XRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698178044; x=1698782844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWqQuOwuPTBw/R7QWLQ4sHHJs2Fn36dP5dQoK4hDiYA=;
        b=LH9MceLn5pyXQR7vv/Y03n9K3bIkji7o/PDnInQNtSmBcnqwq8k+o/EN3UpXlUJjtN
         a4CPFMjUyrrOpatZXKGo3cGp/zYlcxOCuhawi3TCuOKvOtWNnP458C53km4t5M1IizSM
         G0iTcns9EYa04XqwvRtX4hSxl+KGSCVbhUUcaoHLFdNzBonXAOnAz2wKi72pB8wCYiV/
         9vPMGBTpyJJjCTVVUZprp9uzqapfYAAGVt4u4OWdV2PokGqE0nYOQsjWdUOv+ys7RvJ5
         vN14NWw+4L4OZ3IUV36wL78Mft1nIDQS+xR/g7fg+ezXVBaHbxvOduWuMwKfvxFw+IBf
         YKhw==
X-Gm-Message-State: AOJu0Ywzt3dCXhRzYgJsBF+yxTqA+vMxcAqXBfUaiM/HzpxWB72dSsve
        szXhw8w6e8bbGWXPawGMV+tkXWn2JhFzdZIsWkjZdQ==
X-Google-Smtp-Source: AGHT+IFonK3hrkobPO+Kacsi6dEBATYxrquj2rI289urdpcwU3z1S/7P2CbpH44ivW/dI8ZfNPCHqChrsXyVuzs/2OM=
X-Received: by 2002:a81:4983:0:b0:5a7:b515:ae47 with SMTP id
 w125-20020a814983000000b005a7b515ae47mr14648346ywa.9.1698178043991; Tue, 24
 Oct 2023 13:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <1696440338-12561-1-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1696440338-12561-1-git-send-email-quic_mojha@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Oct 2023 23:07:12 +0300
Message-ID: <CAA8EJprTCWevfRNdVDV5xpgNu-Fh21HGM_eS2pOUuZJesgCD6Q@mail.gmail.com>
Subject: Re: [PATCH 0/3 v7] Misc SCM changes
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        p.zabel@pengutronix.de, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 Oct 2023 at 20:26, Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>
> I have given version to this series as v7 as it has already
> gone through v6 and later got added to minidump patch series
> However, these 3 patches can go independently and has no
> relation with minidump hence, separated it from minidump series.

Please describe the merge strategy, since these patches cross the
subsystem boundary. Linusw has acked patch2, which might mean that he
is fine for it to be merged via the arm-soc? tree. However as nothing
was mentioned in the cover letter, Bjorn has marked patch2 as not
applicable (as it is outside of the usual subsystem area).

-- 
With best wishes
Dmitry
