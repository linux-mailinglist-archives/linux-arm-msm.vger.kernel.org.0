Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1315E770155
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjHDNUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 09:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjHDNUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 09:20:30 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CB059CD
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 06:18:16 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d075a831636so2336801276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691155015; x=1691759815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CN0KqmR92Gl21HQtvAMPIpHXJ6Dwonwz8bIB3UAxFh8=;
        b=lTe8kRlkQhbCr9QuKFpIQmuAtZdUH5mPurZ2vCnZAsxaQqcSqvtzge8st2Doky9U6y
         xY/2YDlAzjvJxM+3yPH5G6wjvpFlPDN/qPR4KmvahczFf0xUY2gffcvTJ4I7WDDINNU6
         xnffE8OAedgkbwdJoiZZV72j7B0U14gzEJZm1FA3uYB6YGRQF9I8dUmb4HvDv1oOtH7F
         nppWSTaOezES3Qq1iAqOSdow0tmHbRDOcLFhTenoUNEgPu7dDfXfhF11nBemTfQK9YRG
         cqmtB4syCb+9g1BDBbU43sFuyPtNlcQ71KB7zK0zzi77eQkJt74uCl/eTzvWt8TBr0ec
         tkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691155015; x=1691759815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN0KqmR92Gl21HQtvAMPIpHXJ6Dwonwz8bIB3UAxFh8=;
        b=glmHl7CMLr5xuL4p9jt56H+1eV1opwHUVT3w1hytjjG5YPsnBR6zEmV/ietcgpwb9t
         QEFbsYUFlyUwvFQEkXtW/HwsFvhP9dgvX+TXJnM2qwNr6BwLtHawrlQeiy6V7ClI/adI
         KB91nmgHmR/fk2m9biRG4ZN3fVgthCjQJXXApTDKjy8DulPp5xY+NSILX57iH6YKR35e
         EH97hYJ0dW/HfoRr58EIvXIuk4tU7eHNauz+vwlFPVL6uu2Q7v/gNhqCInEguQqB5z2M
         iB129BRr/5FGTJ667qveW6JZLZwHz0JIUNNLDBHqmVFgql3J0cSaSihPq2CoHJcyI8JZ
         +Usg==
X-Gm-Message-State: AOJu0YwEsZjG9Sj6HyggHp9oGiERvCB+f5Iy3VqlZFVunO4J75w7dP67
        RrT0RgwnF7atCWpuN1KDQThHHbQnvPJ/ktQ0zm0spA==
X-Google-Smtp-Source: AGHT+IEAY+cs9ul8AsuJqNlA1Ij2SA6DE6uBQAWyhGZ4hywFx5Y9P9mpVKMALAsrD8z/aHpSNClZlHD8GZm8+r89DqM=
X-Received: by 2002:a5b:701:0:b0:d0d:f5f3:d2bf with SMTP id
 g1-20020a5b0701000000b00d0df5f3d2bfmr1444562ybq.48.1691155015082; Fri, 04 Aug
 2023 06:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Aug 2023 16:16:44 +0300
Message-ID: <CAA8EJpp9SJG1MQEwbGHLVWvJZomagttQ1y2B3EmXqB+owO0Xwg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: clean up some inconsistent indenting
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Aug 2023 at 10:57, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:183 dpu_core_perf_crtc_check() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6096
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
