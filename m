Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF46345630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 04:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCWDZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 23:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhCWDYp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 23:24:45 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32C2C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c17so5936135pfn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=hodATnKjKQUhE5+cuWqoiqtEQY4BaJr2OLA8v0fcrQ8=;
        b=Woqg7ffdwtVJhO9A1EbkRO1TS2BL2uMiyp1MfJVdCzkz8sIi14UbpOpAuy/p096EHV
         EcT5UvJu5TK5fVulp0NKDEY6zuub54j1ramn1RYwTLOGlCPjDtRfYrltZ74OujqduN0K
         gdL+ccqLFZAJ4xRZrI5x4Fe0pdfXST1p1wS8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=hodATnKjKQUhE5+cuWqoiqtEQY4BaJr2OLA8v0fcrQ8=;
        b=m6YkcMtVUNqUuSkB0KmEoMoDfmDRYjk9/UOBQvJeaW+jg1eOZOaza43GDadWt880SS
         KOFkezEjLKEl1eqAUpReGKZa1e0NOwmpnKUwUPQFb4X1KVrAMUiSGzTwVtPNmzji1PYg
         LJ5WeQ6HNvou23wJHMIoFoHSCFnRkfWERYIQHmoiik/QDUCn0uTrxw6VHi/bHLI8inhQ
         9AOs3M4w5ywddiJ8qsUJ3Z/WJkYMdUySdzsZaVXQIP9/Un94cxLvq3LhYpl/M5nJ3Fgy
         +hnH+up3yEahBEMl4MoUNIHQ8bIJ6yG59eaxManiW7M8uQjASv9YnQYKfRV2WEWrZkij
         5vIQ==
X-Gm-Message-State: AOAM532vPDlsKx9KPxilRTpnVr+yI0drGer+x7dfHzimtPGaVd52r5t9
        n5ox69fdlRpb71uUQlkHxpRMRw==
X-Google-Smtp-Source: ABdhPJwQuMfvnRVwix8vZq60PYLbsuTsaoSc+9YR/JehIv2GN8pbSU2ylDpgKbh2R38rU+4g5c9xSA==
X-Received: by 2002:a17:902:d694:b029:e6:bc94:4931 with SMTP id v20-20020a170902d694b02900e6bc944931mr3157077ply.6.1616469884216;
        Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id l19sm735913pjt.16.2021.03.22.20.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:24:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210318062650.19886-1-unixbhaskar@gmail.com>
References: <20210318062650.19886-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Fixed couple of typos
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rdunlap@infradead.org
To:     airlied@linux.ie, chandanu@codeaurora.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        khsieh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        tanmay@codeaurora.org, unixbhaskar@gmail.com
Date:   Mon, 22 Mar 2021 20:24:42 -0700
Message-ID: <161646988202.3012082.5548408805057433167@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bhaskar Chowdhury (2021-03-17 23:26:50)
> s/modueles/modules/ ....two different places
>=20
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
