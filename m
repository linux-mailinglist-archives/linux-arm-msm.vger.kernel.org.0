Return-Path: <linux-arm-msm+bounces-2-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2547E319D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 00:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7654A280D79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 23:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7DA28695;
	Mon,  6 Nov 2023 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ep2qY9he"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669972747F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 23:49:17 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA4692
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 15:49:15 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da37522a363so5360990276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 15:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699314555; x=1699919355; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQFqDSAgiWaPIVshMRb+fCRuV7mmBlmC784sMYp/hys=;
        b=Ep2qY9heegC2duO3PSX1grOxK15NmL5yp38XviMgKb2tWg4MoO7np+aH4WvAZEoyGh
         J/0E76RDCZ6/pqFVUURpwelMDx3C7PU/fKCvI9dZHx4SGGTui9e1FbvBIHpZEoCrSces
         KOG8mFbkZ33q3ZXMy4ffXg8PWXONE1Ue8bbzL3zXiSX51NctE6QAaDe1apHj0B5h6wYF
         vGayuE0C4hgYn2w25UGFtTNFFNPV+vq9VkGoyGhU4Xo7hmx5qajSCCvyyNvizibiBV+I
         RINkXDpLF0C60utPubKQL7JMVZdDDTnSfqnmqxXSElzob59MQexFltz5uObs31/3VdV7
         rkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699314555; x=1699919355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQFqDSAgiWaPIVshMRb+fCRuV7mmBlmC784sMYp/hys=;
        b=pegQ/5SBSW2Ixk9L0RCYAW41qqHGj7qZbu1So8GTCIpPqnZe6xVGeJB7NTuZ0IaKJH
         ZxmXW2F8678BJFASz3vCQsAwLK7W8BFfMpoqFGb8X23FtDe1rupFAyW4aMB/+A63Fp3o
         4v5u/sHX7cBYXHveESEtwGv6RpX9XMmLS1pj8ldtfeTbsufI40qGCuMuG35GJeAfXsab
         YzKWHnXACGkJORP+WPF83rsmBMCEgs06iem0DewxPZlkKqNWwD1CtdZnYQOW3j38Auaj
         Ma6MtmE4vGQaQzElqQqUkP8DuxxJOJxLFs14Yf5/v17v5T3rwd/eDYYbbavf5U6B4TP0
         VVQw==
X-Gm-Message-State: AOJu0YwLf0K/sOXV3el27vj67M/lfQqzYdj4emDTOJ9ZDVNPDLTGSc80
	zr5LJGH4f1fgHdyriw01yV3nKrsSbR9Vrmvq6v0Plg==
X-Google-Smtp-Source: AGHT+IFAkvpy/g1sY/1xUwAKmKYfgd46amCuq1aXEiffyp4vSVs/pWccSw/DXuVqcLLSwjX8OS1pefTcKi6rRIgLSoM=
X-Received: by 2002:a05:6902:1204:b0:d7b:90c6:683c with SMTP id
 s4-20020a056902120400b00d7b90c6683cmr35829665ybu.26.1699314554997; Mon, 06
 Nov 2023 15:49:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
 <e4c94f9d-773a-e894-d655-41afeb01dae1@quicinc.com> <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=-k58Mwg@mail.gmail.com>
 <1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com>
In-Reply-To: <1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 01:49:03 +0200
Message-ID: <CAA8EJppY0V20rF1kV-b8X2xuCQ6ZHy_+0YGp5s6b_Srvq-LLNg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:
> > On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Sorry for the delay in getting back on this. There was quite a bit of
> >> history digging I had to do myself to give a certain response.
> >>
> >>
> >> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> >>> On sc7280 there are two clk bits for WB2: control and status. While
> >>> programming the VBIF params of WB, the driver should be toggling the
> >>> former bit, while the sc7280_mdp struct lists the latter one.
> >>>
> >>
> >> No, this is not correct. Both are control bits. But for the context of
> >> where this is being used today, that is setting the VBIF OT limit, we
> >> should be using the VBIF_CLI one. So the below change itself is correct
> >> but not the commit text.
> >
> > Maybe you can update dt bindings for the SDE driver? Because they
> > clearly speak about the control and status bits.
> >
>
> There is nothing to update here if we both are referring to the same
> entries in the dt bindings.
>
> qcom,sde-wb-clk-status = <0x3bc 20>;
>
> the clk status is indeed bit 20 of 0x3bc.
>
> What we have before your patch was bit 24 of 0x3b8 which was indeed
> clk_ctl bit for wb2. But the only issue was it was not the vbif_cli one.
>
> So we are talking about two different registers?

Ah, excuse me then, I didn't notice 24 vs 20.

>
> >>
> >> We need to make the same change on sm8250 WB2 as well as this register
> >> is present there too. In fact, anything >=msm8994 for setting VBIF OT
> >> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> >> (offset 0x2bc).
> >>
> >> For anything >=sm8550, we need to use WB_2_CLK_CTRL present within the
> >> WB block and not the one in the top.
> >>
> >> Hence for this change, we can do below:
> >>
> >> -> update the commit text to indicate both are control bits but for the
> >> vbif ot context we should using the corrected one
> >> -> if you can also add sm8250 in the same change i can ack it and pick it up
> >>
> >> Have you re-validated WB with this change? If not, let me know I shall
> >> while picking this up for -fixes.
> >
> > No, I haven't validated this on sc7280. I'll try this on sm8250 and
> > then I'll send v2.
> >
> >>
> >>> Correct that to ensure proper programming sequence for WB2 on sc7280.
> >>>
> >>> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> index 3b5061c4402a..9195cb996f44 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
> >>>                [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> >>>                [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> >>>                [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> >>> -             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> >>> +             [DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
> >>>        },
> >>>    };
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

