Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21104704028
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 23:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245224AbjEOV7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 17:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245377AbjEOV66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 17:58:58 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9447E720
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 14:58:55 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-559e2051d05so189684727b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684187935; x=1686779935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2GhCPVz0jzDkj0tIcHEjP7z8Dxr8q4noyGfNYwo8Fn4=;
        b=T20qXytAdukd7caoUSDVMp/Tqbeas2tlJge36KCD65W3BB8AvL19MYrGci8Xjrlcxy
         jswP+Z+Al205C9vDw70XYnIDCXmcMJ4FxFP43ap/hZtYn0yDflZiFLkt/iHerTDFr7aF
         lw34oYsQtEk1A6KBz/08vq0f2/ApjxP+qE3eO+QlEBeULbWi/y8Ar/guz4xNBcepNF7l
         jNcLoXp8zCEXlpfcEtjFyHdaGE3z8UhEZf3ORvlpIbKm6HX58RIAgMLZJzWPj0HflOGY
         bAnBSbDqXkaFCskBYCzt5HWNbjwhbFchUCc+fLBLdmspNX5fAj5agc/Newb+XE3oT6YY
         m2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684187935; x=1686779935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GhCPVz0jzDkj0tIcHEjP7z8Dxr8q4noyGfNYwo8Fn4=;
        b=E9EZgLWdDG14Fg3Gd+sBc3GaleVRN0SnkymfvsIkmtCdDI5RufUCAxyo85AwxrT/CV
         byNA5Rh8+L3UrvpuCZH+nZx78QHsRmIt3UocQfgDxiCt4ZpV2ZBWo5PAeJp7H3AtvDPG
         opYePf4IyIpgOg1UT98jx4w8ncDbaTiEAq5PMKVtq2BAM1rfzpQtjWseym9TWtuC3Nl2
         4C7jy73hDoCXFDgr2Zx2X/w11/wbOGgsY6y7ruT3m/Q8TOaBLmHHXBoCxmRgDUEgGX4D
         Y6F3J264EIMMUUFqzOPQZRwkhWIV0+sAIS99MU61JpgE9eEoTNUElbccPsDEQ6YN9Qp/
         PxGA==
X-Gm-Message-State: AC+VfDxJ7r73WgkG2WZH+JXJFKzNihMZLq6EeqE5L5XzJU/XvtV/4Zad
        1L4wny7n4Jc7JeRKsnnQVGYkWb/ZUkcLIg5JHcyZuw==
X-Google-Smtp-Source: ACHHUZ7wH41QbNMvn4niiaPesS26XWfJv3Ub7CgOhVFWa3tfs9gH7O2bfRrojl2uZIX+mtAE2Si5HM9b5TfE0lS9xS0=
X-Received: by 2002:a0d:c205:0:b0:561:508b:b8f8 with SMTP id
 e5-20020a0dc205000000b00561508bb8f8mr4524989ywd.50.1684187935098; Mon, 15 May
 2023 14:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com> <1684185928-24195-6-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-6-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 16 May 2023 00:58:44 +0300
Message-ID: <CAA8EJpqXyoBjZJythTw=gDp4jDda5eWL1E4W_YmgGfzGijWBPw@mail.gmail.com>
Subject: Re: [PATCH v9 5/8] drm/msm/dpu: add support for DSC encoder v1.2 engine
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 May 2023 at 00:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Add support for DSC 1.2 by providing the necessary hooks to program
> the DPU DSC 1.2 encoder.
>
> Changes in v3:
> -- fixed kernel test rebot report that "__iomem *off" is declared but not
>    used at dpu_hw_dsc_config_1_2()
> -- unrolling thresh loops
>
> Changes in v4:
> -- delete DPU_DSC_HW_REV_1_1
> -- delete off and used real register name directly
>
> Changes in v7:
> -- replace offset with sblk->enc.base
> -- replace ss with slice
>
> Changes in v8:
> -- fixed checkpatch warning
>
> Changes in v9:
> -- address Marijn review comments

Which ones? This is not a changelog entry.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
