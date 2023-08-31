Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFAC78E3D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 02:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345257AbjHaAPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 20:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240150AbjHaAPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 20:15:23 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BE3CD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:15:19 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d77c5414433so108581276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693440918; x=1694045718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OyQ3QNWscfTpdGqgBgms3LPZL8sWGyfgTmegeYl8UhY=;
        b=GG3pOEwqw1NYXBGv2mXfWOs3cxuhLLhkaHvDbAzQnSYX+dSgN/UfhgM0LXr+8/9X5F
         vFSLggDwM8DmMK5lPJVfmu7LWcOtboS3E7a0FPVb0RjbsROVqFEZ+LWnhbS9vqzcwTCO
         hnpC9LWARV2GJHAhwe7okFSHp25ttdROCJbGcNYJY/kBcZ9OGS/QpxEmvjhY/rc+lyVR
         P85I7hxufh3HolAImPToyHO3FKRWCgnBuAm0I5ydVEY8ncD8vF/rE6PYGLmKafGN6sw2
         vW6TyUTPToZnfASf5XAdiSDBo+av59md4+CBvxi65gY9CtkVjbK9OEu/j5xtCo8EXpjY
         FJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693440918; x=1694045718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyQ3QNWscfTpdGqgBgms3LPZL8sWGyfgTmegeYl8UhY=;
        b=ahjdIoxBVX/qYbDAWsc4r15UESyY0bZNn31NVBVXGudTAoqIyxjFuSYv06OhZ9vIDO
         0In9V7H3DQzUpwxlHelQaCkw0089dZ2LXV/MERaFsKfqAIuJqaGGtMPOEeHNz8btpoVW
         IKTvBNOuVsrPig9usyRaAx+W2hpon+46xgB5ymxj6IkWFc4nWlvTxQ/saRhUfWli2+OX
         wTRDcM2TxGUFNyEK5VqZj8Pb+r5KTsIVB5qd94ssvUy3HXzBeZ6mMo7c2KzfX90+P4tJ
         zYeSM74orgcMdEwO98b5Jk2pZ/SxfbCHUiW15CwHjbo6sfYza/qUsT+Q6eXfaZgV0zjw
         uQwQ==
X-Gm-Message-State: AOJu0YwAjWXmNIBRSk1kJmV6GS1+/3z976ivz6x6y92jmVz7zSozQfR3
        MWOjFd5Kno3lVPEfUdmmdX6C6MHr+eTCcYgdwj+PFA==
X-Google-Smtp-Source: AGHT+IEUgQBvI0sgINcVEP1+dB/cEnSbvMnPVtijtfAwJ3hr2IQuJhXns221D7jxzg+csWS71CBxDjIx0awK1xuN964=
X-Received: by 2002:a25:db42:0:b0:c60:982f:680c with SMTP id
 g63-20020a25db42000000b00c60982f680cmr3449214ybf.63.1693440918412; Wed, 30
 Aug 2023 17:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-13-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-13-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 03:15:07 +0300
Message-ID: <CAA8EJppJe-tvfFT7fO5c_Fyv1aAtniVcAk5wdWpp8FPwwki9Rg@mail.gmail.com>
Subject: Re: [PATCH 12/16] drm/msm/dpu: plug-in the cdm related bits to
 writeback setup
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> To setup and enable CDM block for the writeback pipeline, lets
> add the pieces together to set the active bits and the flush
> bits for the CDM block.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)


-- 
With best wishes
Dmitry
