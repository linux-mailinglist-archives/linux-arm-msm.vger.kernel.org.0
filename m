Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C0F4B7D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245746AbiBPCA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:00:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiBPCA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:00:28 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E4FFABE9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:00:17 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id e19-20020a4ab993000000b0031a98fe3a9dso254121oop.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Y39GGSzmxBUHOwxgKdq6ykyZOrHUIJsCDTwfMhkJMyo=;
        b=DgMTmya6/M0gMhg3H7XHoavHD5THzZHhmJog19F7nTTDjjqNjdnFc8kEiKO5OmryM1
         ZExHNdw/YhLTVdd/r39ymYadzzUyH+FwpW7XRvuy3zg7WHcArO1BJXl/7C7Si20NANPz
         9ngK3tfttC7JAkiZLd44R4Ck4If1Lf1c/FUGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Y39GGSzmxBUHOwxgKdq6ykyZOrHUIJsCDTwfMhkJMyo=;
        b=00evxVqj0j1gk+hMaKx9QomFGbRgXhoxJlt5gXGp3SpIUm8llEaOz+vWosNtm5xR1u
         662uHya4MBRcT36zoRSqYxtPnC03iMBBkW4kIPUMMUeJaqEBKXZsimxve13Tl17vW+xF
         k68JLVGcLajT79t52/BPl6+9Tn6iEG/JL+jwhSMqBOxm0zXydJ4GnsCcr2uWUZNgDecP
         DexB6z66RqtnEi3tL1B9oeV3vo/BpyjHG2SO/U+HIHV+0HMYFHklS3qYk2fxm+eLYCNU
         qa62ju/mo64ONX/J0dlzq3itW/r8tftKSZRM4xmKqUkpb9MD5ip6PFaB8Qs+ra7nVNfZ
         Sdmw==
X-Gm-Message-State: AOAM533/NrqRZIA7jm1wnC/sMnQy+Cf1zvCz01bKhD1f2R9WCz4JW15X
        cIrCdjctVbGcrjpReJkd+kWnMUFe9kR9qK1ns4qmEK+r+QA=
X-Google-Smtp-Source: ABdhPJwdV21EEUJFlMWgJeVNAtf4tA1g3nuw0qBk6FBZAxwGFFZ/I/0I+Ue+GCLgLME2YDh8bl+g9B8Ahc2JRkcq55E=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr207163oos.1.1644976815890; Tue, 15 Feb
 2022 18:00:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:00:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:00:15 -0800
Message-ID: <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: pull connector from dpu_encoder_phys
 to dpu_encoder_virt
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> All physical encoders used by virtual encoder share the same connector,
> so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> structure.

What is the benefit? Less code? Clearer association?
