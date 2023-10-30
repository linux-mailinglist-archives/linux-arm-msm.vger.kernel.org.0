Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AF37DB9C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 13:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbjJ3MVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 08:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbjJ3MVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 08:21:05 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8BEE4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 05:21:02 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a8628e54d4so38100307b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698668461; x=1699273261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx0E1lO7sX80TYEZLbZ/p7IN8KY+xevJVJVX9CSG4+g=;
        b=E1Supr9PmXY1SK5nvsePtOPDuCxdtw7ixjy2sCUzCWZO6+UdYRnStsBNYVw3rF9Ayi
         0pTaIdcbzl79P30ovDKBq1TB5LVJonsKK3x8fcI0UrChg4dsLLEG3dhP2DEH4+k2bv1O
         /tNKCi3w9KUKNzNpIbDID8ThaYTeNEGpD6s9fEbQV/hQEGEB3dfEMfj+qW4LlTK5ecll
         57pxRnUJTsuk3ifc0Z7L1X10cxSP/v31QPvpqQogIxXFCsq41qWteEmqiadpkSLQ1gXo
         Anf4jE02vrBG2/Arcch3VlUvoLxhiE40+dMyRBsh4u1/QqUulbuFL8NgbemRm1ibXhcx
         i1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698668461; x=1699273261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tx0E1lO7sX80TYEZLbZ/p7IN8KY+xevJVJVX9CSG4+g=;
        b=fWemq6Igi9vKlFRjQWmZ2djIxgvtjJok8KzxoqmLogIRgabJYdDz+A16wr1ooN/e4d
         ym8c3UfVNS1Cou4di7KKH3mqfp+hMbDxLhXjJrfdkJa3hbnLZsPQLxkY8BGRC69mlPm2
         qH1LbLdxUERi92/iDDzyYlDrjhGHyQCGHzfAIBvC21xKY4bGxp/WGD70ri0Bg4L5I3m1
         +Gw3JQHbIu6tp5YLLS4Wx/1v5BU0/luEsnp0b6olWwLyoBRo/s7lFNbRIMHGUl3HW/Cm
         wEemN2XZ0f3C0erjVCi1nj3UfUVqmUtZIFEzQrQ0FomqlWah/gmC4GGdsMleB4iyKMDk
         x6JQ==
X-Gm-Message-State: AOJu0YzBZll6Z8Om91LB3QRPIwChvDM0QxRhPZb1uIsdedBj4MrhVofi
        5luUQFgt5k9nABG09ttNAeIJkNgIHW4pjYRCLP8/DA==
X-Google-Smtp-Source: AGHT+IFKE8vLRCh0SuUhxTnn5PdhE/o7DyZSiHlRWBzISa81u1bz2zPdSgaIvbzp7Wc+FD7P0CwSUInn+dj6DwNZIKw=
X-Received: by 2002:a81:441e:0:b0:5ae:15bb:466a with SMTP id
 r30-20020a81441e000000b005ae15bb466amr10123206ywa.14.1698668461455; Mon, 30
 Oct 2023 05:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org> <20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 30 Oct 2023 14:20:50 +0200
Message-ID: <CAA8EJppBTOnSAWLpZjHAGwwfQzPRVgHVmDfN4nvaVifU+2xEOQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: add support for SM8650 DPU
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
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

On Mon, 30 Oct 2023 at 12:36, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DPU version 10.0 support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 457 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  26 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  5 files changed, 488 insertions(+)

-- 
With best wishes
Dmitry
