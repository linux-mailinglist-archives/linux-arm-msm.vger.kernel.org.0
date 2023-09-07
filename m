Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D7C797DF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 23:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbjIGVeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 17:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236322AbjIGVeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 17:34:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2581EB4
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 14:34:16 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-502934c88b7so1912969e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694122454; x=1694727254; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc2O2hD0csi9QFFnQdhQ/KpvPCmGek+8TiHksrVnjcg=;
        b=CAozVE2BaMR7W++0BUEWl9Y2HeQ7KIWGNNFwopX0SfN5UFy1yETYYXjXWg/53oeMH1
         SStacE+LUc++UBCOcH/qvonAH1UyrTDt4rCwJK1jgrgYTLemR8R5KQEXubZqwKFcSe50
         lt+lD1CJsbxw5E0TUdRu0isvwd9pO3O+hTZ0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694122454; x=1694727254;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc2O2hD0csi9QFFnQdhQ/KpvPCmGek+8TiHksrVnjcg=;
        b=dYTPXyHMk2PuRQ+DTzupkBU1Ll4eAeYTlFyzAFVMxCLZe4x/eS4+pXNPfUeSEP0R9i
         GXgzn93XqgjVqNs9OXdOQk9z1gSKENYq1zlY1/VvE4DUYprKyN662J9UTZjYZsiXWIoA
         AP6MJHFELfo5klJRZx8T6//O0kMx1uFUOxLB0g2/rzHqnhAXpj2fS2fbVnUhcDa6U3+j
         oRoSxG24PX5HPmRUaPiUoiQIZUVoJJC5PiDitSFHYwFinGyGZihTx8oxwgBfqIkNWCx4
         YKqVvf0vgdzbbFIpw6hleW5WVDvJZnq8xRBeLn184Qg4QynLcrT5iiurT8eNhs1sTu8m
         2xbg==
X-Gm-Message-State: AOJu0YxRTfdTr1waOZcG31uKljEzBPJ4prKzV9yvV7qDWXUYSP89Cs0E
        ge5VcN3+zqPdW9AFxKrhzr5T91lxgzIyr/wNpoBiXA==
X-Google-Smtp-Source: AGHT+IHFSLJRBNk28/pXHA3uV4ZreNC2omLjMVD44CUHGiQJ/6WY/p0NrEsWtw8OkStcCfwFeG5y/zxva1dptUDeGkU=
X-Received: by 2002:a19:7706:0:b0:4f9:7aee:8dc5 with SMTP id
 s6-20020a197706000000b004f97aee8dc5mr384540lfc.19.1694122454365; Thu, 07 Sep
 2023 14:34:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:34:13 -0700
MIME-Version: 1.0
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 14:34:13 -0700
Message-ID: <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 97ba41593820..1cb54f26f5aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                 }
>         }
>
> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
> +                                        dp_panel->downstream_ports);
> +       if (rc)
> +               return rc;

I haven't been able to test it yet, but I think with an apple dongle
we'll never populate the 'downstream_ports' member if the HDMI cable is
not connected when this runs. That's because this function bails out
early before trying to read the downstream ports when there isn't a
sink. Perhaps we need to read it again when an hpd_irq comes in, or we
need to read it before bailing out from here?
