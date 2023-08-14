Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8AB77C24D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 23:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjHNVTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 17:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbjHNVTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 17:19:17 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFF8E65
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 14:19:15 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a800814122so990964b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692047955; x=1692652755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch7iOK23HpyclWTasGeXT9ePJoq30NPZ97e56+klJvo=;
        b=pxUVCFjGvomrPkqbqftFjizbk+sb8yDJV/05GArHlhTBz9lQRrPh11uYmxGdZstcbh
         ITEfPXvobXih6G2N5wkII86rMFFwJtllMnGz9wRdXH28DYI75mnoAakYH3BDaY4aXeto
         5xRFzxppF92q9Rh01Mbp3PKE1H4esVXUPnKr9Ylr7q1JVAgrgPvKCuLZ8zyglgYdSnUm
         Ww5euGK9dHcyV8mY1ZFZqZI2h5hztOVHOASoEr3wbITRfz3Ty5clD1B8FvnVjGX8cZ3H
         8UmFR42ra8cB7X+fMPEKPVsyf5nQAL/ttx+dnCgJFkePDStJAIUkCvjerajGlTt9rale
         oneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692047955; x=1692652755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch7iOK23HpyclWTasGeXT9ePJoq30NPZ97e56+klJvo=;
        b=bREQ+hhZ0GcPIdBnfYKHuvGhS2JZhL7SURBzA7IjACRMkiyC31kD30MWFnpNmaDzZr
         NGqZYHIAa0U8xc5Fa/QJjtIjZEwJNAAdLyzOVJEze4QFyfkcbJ3Iwu1E7jDjvTya+XSL
         +NgjcX81g8RIm8WKp41eQvT+QODNtBIl+u6aO2+ILo1N2FWFzG0h0MMXryuxE8Bm9RSl
         SXprVsge7d3VekcX3shR1ABq5h+QTn1eTGkg3Q4RGibwbxnn8K+NsVlmOe3d0xiyWgtk
         BiYO5rAak85scUf87vZzLl9lqbKmSGaGCo9YLX7ITlDt6EZSyJtEFj7l2JVj0zEb7DPK
         z8pQ==
X-Gm-Message-State: AOJu0YwnrUvmUkY/UZ9MZkGFc9SmLY8s10QvXhTD5dYZn6dRN29MeLnV
        4VREdQdNa6SUfzLDwqUf5tNOkjrEytH5hypo9HdVRw==
X-Google-Smtp-Source: AGHT+IF6+PPxKh/z99gKk6qy/HtwoekThhdV96Foo/S3ynaoEiRKl2vLsjoo7XevIbqfwO46Fba2e7BXVvnIQiPQTiU=
X-Received: by 2002:a05:6358:9924:b0:134:e458:688d with SMTP id
 w36-20020a056358992400b00134e458688dmr8708127rwa.15.1692047955143; Mon, 14
 Aug 2023 14:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-4-git-send-email-quic_vgarodia@quicinc.com>
 <5eecab7a-0d14-de96-f0ef-7de95c68aa62@linaro.org> <29644573-82be-f62c-6c7c-bb8d1265d761@quicinc.com>
In-Reply-To: <29644573-82be-f62c-6c7c-bb8d1265d761@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 15 Aug 2023 00:19:03 +0300
Message-ID: <CAA8EJpo7YJsu-mO8T1TCznOz2CQ6QL-XrTqXe_u53H_weuk8cw@mail.gmail.com>
Subject: Re: [PATCH 03/33] iris: vidc: add v4l2 wrapper file
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Mon, 14 Aug 2023 at 22:00, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 7/28/2023 7:04 PM, Dmitry Baryshkov wrote:
> > On 28/07/2023 16:23, Vikash Garodia wrote:
> >> Here is the implementation of v4l2 wrapper functions for all
> >> v4l2 IOCTLs.
> >
> > Please do not describe the patch. "Here is..." , "This patch...", "This
> > commit..." is a bad style. Please describe _why_ you are doing this. In
> > other words, what is the purpose of adding such wrappers. Please rewrite
> > your commit messages describing the reasons, not the patch contents.
> >
> Sure, Will add descriptive commit text explaining the need of changes, in
> next version.

Please restructure your commits into functional chunks rather than
just committing file after file. This way you will have logical commit
messages for all your changes.

> >>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>   .../platform/qcom/iris/vidc/inc/msm_vidc_v4l2.h    |  77 ++
> >>   .../platform/qcom/iris/vidc/src/msm_vidc_v4l2.c    | 953
> >> +++++++++++++++++++++
> >>   2 files changed, 1030 insertions(+)
> >>   create mode 100644
> >> drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_v4l2.h
> >>   create mode 100644
> >> drivers/media/platform/qcom/iris/vidc/src/msm_vidc_v4l2.c




-- 
With best wishes
Dmitry
