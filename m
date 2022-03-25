Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4FE4E7848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 16:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356228AbiCYPqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 11:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356404AbiCYPpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 11:45:47 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497F638BE6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:44:07 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id q129so8559411oif.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=NTzdvac9E0u5O5EPdTfHeL5fU+o6Dn+5DnAx+2wLf6o=;
        b=g+lsR8A0mCNGF0M7c8zVcfz9bk7XjWwfiPgATYcttSfsfYKhPqNI90t5V2pWyy3K/1
         zAiD6PcZ12g+jb0DsJg0Yhamr+ZkPZRB3Ez1pjct4VJUeGobr3ShTQNlbb3YFYps5UdP
         YOiYo/iYBVpj1inq4H0Yqn1/nC7z8g//qULAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=NTzdvac9E0u5O5EPdTfHeL5fU+o6Dn+5DnAx+2wLf6o=;
        b=NcqGyvJFOfkO3F2MvXyToOOMNQXj2b/qohlgS2Ymd+YuN7/eSxULoj115B0G/DEEA/
         6xcFA0wCtcrH9rFUJJxUfe0RwoAtkFc6ysrJlsqMqPBpf1NjSMyaZ41/CeFWJo8FWsCG
         g4oOUP/6HCDnpMTIw0mGk4rT1J9Jr86y1FwHi6tgwWsl97Dm57JmZc7Sc1+AQeqv9GMt
         Aetucg6+tdhEFv0DMtgYmiKYnzddMU8sjHom8gMOsevv3/HwKayt0/G9Cki+B3SsDEPK
         L0QCkf8ucBia0YQcZTNi9FKSidu/t3WUuihIvGEDQKBEMYqOuX9kZGPXewa/fU8VkHir
         SUJw==
X-Gm-Message-State: AOAM531wTUvbQMSsyWoyR1w5cbisPtbpM2oFhQtZ/tgDQT7Cf5ik2zRg
        829HICVJ6IZPGKXcNsP23LeSEIMFztZ5bawL3UUOAA==
X-Google-Smtp-Source: ABdhPJzl30pBr3/fWa4oAQpF/qcn7kXpetXINFM32PJnH9fEu6pMQU5faHK/sBE2DSjy0V8/NLr5FZhyK+g1+pShkp4=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5189697oie.193.1648223046578; Fri, 25
 Mar 2022 08:44:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 10:44:06 -0500
MIME-Version: 1.0
In-Reply-To: <20220325121736.2162912-7-dmitry.baryshkov@linaro.org>
References: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org> <20220325121736.2162912-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Mar 2022 10:44:06 -0500
Message-ID: <CAE-0n514UcsaTkv=P7KvvQYo_ohDsAAozjnjbQKeFY-z4EQVXQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/msm: make mdp5/dpu devices master components
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-25 05:17:36)
> The msm_mdss serves several roles at this moment. It provides IRQ domain
> used by MDP5 and DPU drivers but it also serves as a component master
> for both those usecases. MDP4 (which does not have separate MDSS device)
> is the component master on it's own.
> Remove this assymmetry and make both MDP5 and DPU component masters too.
> This removes a need to care about drm/components from msm_mdss driver,
> removes an mdss pointer from struct msm_drm_private and simplifies the
> interface between mdp5/dpu and msm_drv.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
