Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5EB70DAF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 12:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbjEWKyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 06:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbjEWKyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 06:54:52 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9BA11A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 03:54:51 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so12683315e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684839289; x=1687431289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3WjXgsNuqa7/WDZdFims98+tDEhGOYyjkquS66fJPs=;
        b=GRPH6+30lAf//AJM9pWiPwjzF5resuZuGFlvxrJZigGSKauVKhCG67QuBSxJIpJm9U
         UqO8OPb6Abqjc4UsG8oYtlAIVKSqo2vxyuSfQyWCumvIMPaR4MwQJ7Z0Ju+VoZTxeBkO
         EVsOiQ08u3o1NpB8UMrRYa9vZDkXWkoowif5QStMG5MDDhTyatuwZIjDeaUeaXd+LFPl
         WGsxrky31gmDvppGRukw6KgXVPFf1ZjQBRuky5u4p7SmyiU17zYITeNa/9JloaRpIv9d
         v5SgyDMHDqwKmIQG8gD3aogHnsCvpF1NiJ+OODHOl7+VXJvQ8iCL3fFJ+AZeaMK0d+1H
         UrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839289; x=1687431289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3WjXgsNuqa7/WDZdFims98+tDEhGOYyjkquS66fJPs=;
        b=dXkkpMF5R1FG6Ylo1eVYc3fQrT0G5/gekWleeBKumsqBd7Q7cgCfv2cRBic7DDKube
         cm5qhXEY4Eol/khdOCaLDDgcqk/CqzmsL0Q4R5gFgeVaFRFoeWdHp4VAgNYAqPt/91fN
         oii+19YQJan3/AdosBrc+7njFSjcIp95razEHdpF8NoF7S0GV2dGMcQH4zbXW5qSTsWO
         /e553ye9YZgUXS6eq/b2Mrjnr7zsuhsfXeJ3+pLwmq9SN7KR13a0gmd6TF2s4dfMHm6p
         4GVMbBTkcPymWyxmJO3MhFdKQb7pCIjfSisCxBV3KzEbOtkavD8OB0lb2dMKVB0bIIp+
         6eSg==
X-Gm-Message-State: AC+VfDwfLGl0yVcce6ctP6Rpmedxq/D6sYPi3xAUZdlEi9HwwzzuaAtX
        0gwyeso6AM0X5jGEGoK3cGBvrlYc4L9GIvb5xrY=
X-Google-Smtp-Source: ACHHUZ6b5/OXboW+vGmX4shXePUEyDe7NDvlwNpoxezhMOSU58x9BGVbiVKV8bYmalzS4dohoNrkqQ==
X-Received: by 2002:a05:600c:2152:b0:3f6:938:1001 with SMTP id v18-20020a05600c215200b003f609381001mr2059704wml.8.1684839289624;
        Tue, 23 May 2023 03:54:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a1c7216000000b003f60482024fsm6072367wmc.30.2023.05.23.03.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 03:54:48 -0700 (PDT)
Date:   Tue, 23 May 2023 13:54:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <4abf38cc-20ab-4606-bc39-85255b8bdee8@kili.mountain>
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
 <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 22, 2023 at 10:47:50AM +0200, Marijn Suijten wrote:
> On 2023-05-22 10:48:01, Dan Carpenter wrote:
> > The "vsync_hz" variable is used to store negative error codes so it
> > needs to be signed for the error checking to work correctly.
> 
> Nicely spotted, but it it looks like we have more to fix then.  The type
> returned by dpu_kms_get_clk_rate() is u64:
> 

That's a good point.  Although the type of clk_get_rate() is unsigned
long so probably unsigned long is enough.

> - Perhaps the int used in this patch is too small (though 19.2MHz vsync
>   clock ought to fit);
> - That function should also return a signed number as part of this
>   contract.

What about if we just return 0 instead of -EINVAL?  That would match
what clk_get_rate() does.  Also let me change the type to unsigned long.

regards,
dan carpenter
