Return-Path: <linux-arm-msm+bounces-3600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A81F807B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 23:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0483282284
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 22:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC3956382;
	Wed,  6 Dec 2023 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EiNEaH+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B442D44
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 14:24:08 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-daf7ed42ea6so374609276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701901447; x=1702506247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFW1BtHzKKyWMjTKsTgJeCE0JqHRAauG27klyOmROjc=;
        b=EiNEaH+nkoYet3Y1uEYehpX7ztPyB34baspR8MWcbGpKz+Jf4Z3aMHEAIyQJEEQWJq
         SuA9gotQKR4pEOzRK6c5GOZs0fZcwqK/RzE6EYfCOwQlw6yWBeR66JGHQcwx53qx/R5t
         F8oGrgNiRxoUs0y3Hn94TOz+miA8w5P0yfDnJ8XYDKvnix4X7vaYq33OO/bx3115xBba
         cTk+DOPrJc7nYV4QePjjmeKwYIuosYmm1konXwaZmrUmASEzLKhcSocnyMG+2FA5mOA8
         S9/fm26Ov4bObukAWKqmC09MtNsd8dn7Z9FJDg6q5jaNLgzYo9MVikb1bhxbnBCWWNBH
         uGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701901447; x=1702506247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFW1BtHzKKyWMjTKsTgJeCE0JqHRAauG27klyOmROjc=;
        b=fYd7RnI7yB/OcPOQu5fUHt/ONOnzwJmtHqM/PyHULe5vvsLby4fOPdGRQ7Jiobw7QT
         QINCH6ecypIBG3b8PXmBYhvCFUOYizN/TIWTVfCPy8DC8vrQdire5Z+8O5DtWkX44Zsg
         tz3s5JmdFlgpsNvduV8vt54ItHvUiHAdtpC6JzwcMBm7nx/XPpBsjR5cgfzhwDmmJHOp
         az3zuItDi0f385pnL8onKTqO8uMigl9FM1B4NIA72V4MHrmSvzWGDK9sh75senRdy02X
         /eIHcK9g7DUHc/5HxNEMo0cC7NXmvrxeB3lcblE/wvintjlFkzWbGaXUrWPpgurXLqp4
         n26g==
X-Gm-Message-State: AOJu0Yzd/FTRVA6/lOpKu4a2dD/4TKQAp0t4b2d9upsiIk91zZMv4j53
	ZtsE8/KmrUzgdJ4pNF7/y3gi7zVOe4rLCspeo8A8LkIWB9ER0I9W
X-Google-Smtp-Source: AGHT+IEHcerkxXFp1Wf9mkkpYSruKLDzVFs7vUbnsFJMGyrEWX2GOTzqPWBuAvK/kL7CD3Fu11efxf1XOn9R17miGKI=
X-Received: by 2002:a25:8102:0:b0:db5:3f84:25f4 with SMTP id
 o2-20020a258102000000b00db53f8425f4mr1484992ybk.65.1701901447301; Wed, 06 Dec
 2023 14:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-8-quic_abhinavk@quicinc.com> <CAA8EJpoRcdHtyp3mym5HB2A=O6V4qUNTpnMkvm+OiSt7nHuXJw@mail.gmail.com>
 <5bcbb092-1d29-f795-3be4-5ab1c708cba0@quicinc.com> <27074b58-25ed-dbcc-1048-dbd9ba3135c9@quicinc.com>
In-Reply-To: <27074b58-25ed-dbcc-1048-dbd9ba3135c9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 00:23:56 +0200
Message-ID: <CAA8EJppKG=Jxd1rh3UB4qUhrVW2SYOiwBiXum-RD-10T63yPmg@mail.gmail.com>
Subject: Re: [PATCH 07/16] drm/msm/dpu: add cdm blocks to RM
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Dec 2023 at 23:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/30/2023 3:47 PM, Abhinav Kumar wrote:
> >
> >
> > On 8/30/2023 4:48 PM, Dmitry Baryshkov wrote:
> >> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar
> >> <quic_abhinavk@quicinc.com> wrote:
> >>>
> >>> Add the RM APIs necessary to initialize and allocate CDM
> >>> blocks by the rest of the DPU pipeline.
> >>
> >> ... to be used by the rest?
> >>
> >
> > Yes, thanks.
> >
> >
> >>>
> >>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++++
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
> >>>   2 files changed, 19 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> index f9215643c71a..7b6444a3fcb1 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> @@ -8,6 +8,7 @@
> >>>   #include "dpu_kms.h"
> >>>   #include "dpu_hw_lm.h"
> >>>   #include "dpu_hw_ctl.h"
> >>> +#include "dpu_hw_cdm.h"
> >>>   #include "dpu_hw_pingpong.h"
> >>>   #include "dpu_hw_sspp.h"
> >>>   #include "dpu_hw_intf.h"
> >>> @@ -90,6 +91,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
> >>>                  }
> >>>          }
> >>>
> >>> +       if (rm->cdm_blk)
> >>> +               dpu_hw_cdm_destroy(to_dpu_hw_cdm(rm->cdm_blk));
> >>> +
> >>>          for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
> >>>                  dpu_hw_wb_destroy(rm->hw_wb[i]);
> >>>
> >>> @@ -240,6 +244,19 @@ int dpu_rm_init(struct dpu_rm *rm,
> >>>                  rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
> >>>          }
> >>>
> >>> +       if (cat->cdm) {
> >>> +               struct dpu_hw_cdm *hw;
> >>> +
> >>> +               hw = dpu_hw_cdm_init(cat->cdm, mmio);
> >>> +               /* CDM is optional so no need to bail out */
> >>> +               if (IS_ERR(hw)) {
> >>> +                       rc = PTR_ERR(hw);
> >>> +                       DPU_DEBUG("failed cdm object creation: err
> >>> %d\n", rc);
> >>
> >> No. If it is a part of the catalog, we should fail here as we do in
> >> other cases.
> >>
> >
> > I guess, the only reason for not failing here was other hw blocks are
> > needed even for basic display to come up but cdm is only for YUV formats.
> >
> > Thats the only reason to mark this a failure which is "OK" to ignore.
> >
> > But I see your point that if someone is listing this in the catalog but
> > still RM fails thats an error.
> >
> > Hence, ack.
> >
> >>
> >>> +               } else {
> >>> +                       rm->cdm_blk = &hw->base;
> >>> +               }
> >>> +       }
> >>> +
> >>>          return 0;
> >>>
> >>>   fail:
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> index 2b551566cbf4..29b221491926 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> @@ -22,6 +22,7 @@ struct dpu_global_state;
> >>>    * @hw_wb: array of wb hardware resources
> >>>    * @dspp_blks: array of dspp hardware resources
> >>>    * @hw_sspp: array of sspp hardware resources
> >>> + * @cdm_blk: cdm hardware resource
> >>>    */
> >>>   struct dpu_rm {
> >>>          struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> >>> @@ -33,6 +34,7 @@ struct dpu_rm {
> >>>          struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> >>>          struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> >>>          struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> >>> +       struct dpu_hw_blk *cdm_blk;
> >>
> >> struct dpu_hw_cdm *cdm (or cdm_blk), please.
> >
> > Ack.
> >
>
> I was going through this more. I think its better we leave this as a
> dpu_hw_blk because if you see the other blks in struct dpu_rm, all the
> blocks which are allocated dynamically / can change dynamically are of
> dpu_hw_blk type. That way the dpu_rm_get_assigned_resources() remains
> generic. Hence I would prefer to leave it this way.

Ack

>
> >>
> >>>   };
> >>>
> >>>   /**
> >>> --
> >>> 2.40.1
> >>>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry



-- 
With best wishes
Dmitry

