Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C84552B0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 08:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345389AbiFUGh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 02:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345466AbiFUGh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 02:37:59 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BB02DD2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:37:58 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id cu16so18418843qvb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/ZHdlDT/z0JI9+6gk/VhCpD+I3j8EEmsNtdy7Bk49Y=;
        b=no69+S00OHtDn40C4P/ra6GtR2wAm+qZUvTHZI8jEsM7uozh3LIqJgHR6kVRnWoKij
         HhYRSmz/G5z1mA+Kjt9FNiJcqYNTEvbTEkRDTJE7JtvW4lkAMDyGjTfVJuM2UgNeMXJl
         gePm1zHlxL/iFGGe8Os0UpF4giF7MlwaoSf8cr3KSA1Qcx0CN0fYl+bvVQz47ZOu/tK2
         R6jd11qjpSMC90G8aXCxN26qHzzJE5S7JTra7sG7a/1N+FfGbn9O8a0Awa9p9QzPDFTE
         lyouT7/Kl2thQ9ZUkf/mIQ1DbMNmYlJfg0HXEP2wEPfy+uekoBE3ry59aIvICACUGrBc
         aStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/ZHdlDT/z0JI9+6gk/VhCpD+I3j8EEmsNtdy7Bk49Y=;
        b=4bnWUpZ+Pca8dRXWvLP2ldcI+3nPlhj4eiic6ToCVB5dIpJ5vdx42VACvt0x8enjiV
         ryBP+bDVpT8Z7RL4QmRdZAOG8DdWKRBlL1paifXXEEa7gdVKPSZT4HXUuVGPBxsUGzVH
         X+eo6EWL2fxwKD9Gd54HFutAOz1JLbyhjopNi/Rd+KFjEZ5AE2Tp5FToM7NIXbKcg4Y1
         MGyqM1nvoJkYhul+9YaZ4TVOKx2j2pjGQDOCXcnYu+EzipjnxIqQRniHKyjK9p4/8kLp
         yLyoaIcDXZdoYlGvMy6hylzAcR1DM0WefnL6R9Y5PayL754s2+AxLnqWItvCbA5oalct
         3Ctw==
X-Gm-Message-State: AJIora9ilM5IdylC0A1jOXIXXhPi6OVODBofOLyvbGISmO70ifxAphEF
        yydNIjMtMX8MmVULs6R4OGox4ldQHU7/vYnc0LabJw==
X-Google-Smtp-Source: AGRyM1urfcxXJusoqWuxDZVZribTjRxKDV1QpCSj5lZ2mCOm7wDgdqhAecge8mYsCHku6y64EqEoRchNmz8hELQtKMI=
X-Received: by 2002:a05:6214:d8d:b0:464:51cc:a552 with SMTP id
 e13-20020a0562140d8d00b0046451cca552mr21693032qve.122.1655793477402; Mon, 20
 Jun 2022 23:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220621005033.274-1-quic_jesszhan@quicinc.com> <20220621005033.274-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220621005033.274-3-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 09:37:46 +0300
Message-ID: <CAA8EJpowsVp5nOqbo2thDp9ojaTJhh8OHnL6Ot-C6ovzckGJrQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: Move MISR methods to dpu_hw_util
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 03:50, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Move layer mixer specific MISR methods to generalized helper methods.
> This will make it easier to add CRC support for other blocks in the
> future.
>
> Changes since V2:
> - Reordered parameters so that offsets are after hw_blk_reg_map
> - Fixed mismatched whitespace in bitmask definitions
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
