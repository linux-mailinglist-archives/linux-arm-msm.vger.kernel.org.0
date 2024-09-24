Return-Path: <linux-arm-msm+bounces-32295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213D984607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 14:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE3A283894
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C00D1A4F39;
	Tue, 24 Sep 2024 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9jBpMSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE91A4F18
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727181409; cv=none; b=k++mx6LzS+tyfOqWghmPW2yiNy1eD44rXocx/XJsyd8Dxh/nFTrnlChRW4U9XfZAZJyI+QZsMCb272I2w474iinY0PXixOPfMvpT3xqdGUyf/Nf9Tx9tR2shyEjt5SI3UA4bKHHp/Ex5qVTuKiAt9TWpaCaaMpZmfEHfby1J8OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727181409; c=relaxed/simple;
	bh=0tgYaNknECHGcREZzuh0GavXRA4JoNzrI0nt+ohvHAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8U5rauItN7/B2BFPynnnT+VkoLTwwmpY9huO1dJ6onf3uY9IrQrkJRJ50KerVBjSqNweb29+w8H6azHyp9/D0TX8o9kK09MPBOGoFJ1lEbSQqNpocrxwo0AfJMqPEY/euuP+jdtmmWQhG2zca1PWytIVToI5fAb6XwTRkT38wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9jBpMSm; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6de15eefdd3so39541907b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727181406; x=1727786206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZclqvN8OWviCoeP7W2fOBR9cc4G4ZJZYXXNmxnjQMg0=;
        b=S9jBpMSm2q+HNAhhL9QgKFolkr2nCGbcDH64mL44hYiQzTMBehO8OrH1i9W2Nr+mXY
         etayHSzpH1zETTVB8yleWvza8EbkZbvwnB5fBpPjeDJQiGtiY8wO1Qq6Wy9v57knbNGm
         fXkvXWNBY4OWI3JTfMQorBt03b3/lm9h7S5iRZV39SH/MP/SmAp33xMRhr4j+BRjBs7w
         TSO7HwycuZpO+2CjIXRdROtNe8bH+E2DUzYXdh0L5m6yeFa8+c1KUP7ivpNEAUxsydMZ
         Hh9963QythiYyYBakmmYjLu3SMbn6+4kQ4faNDwjetJP8g6kzmgsS7BOvLZVqMtzGZMN
         gxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727181406; x=1727786206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZclqvN8OWviCoeP7W2fOBR9cc4G4ZJZYXXNmxnjQMg0=;
        b=gtJRfbM/sw6BHFbxj3XtoR7nT1ALqZKp0ai1rI/5Ip2vtaPwyHpdaQTwS5OTiegBX/
         y9VssEqokZiTos+7I5FyyjEzMNBB2/cPgS22GXDzNThfRKcyONCr8pJmQYtE9d4rL8SY
         tb96+q5TmcGyZxH5ATAKMqnDVnbF8V2UXl0CnN/nids6T5XepTr5lYnE6Ei1ReZTHbS9
         FiJT/KvPP1oCJoCu4gZ0PRB2vj8SP5lBpc0doc2+sckCZNvKYWJjZ13XLYRj1hXoMGAi
         f+cN6e3KwK0aBR4AZLsNLCZR0tFREhJRi8SpXxsiNGVmEgsS/fT9esdcjJGL8yvouN9Y
         bKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXDkxK2bTrWdIRlFXOGr4OjBJqXk6wYs4K3gEb4j391w19tWG/fI8pU5wRPlHbw9lPdD6tzRCIOnB4adBbL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DQfCEikTEbThSY4SqJkAfw/MLMTKxSS8jRf5oTvsb0SQtynX
	CJl1po8aqSqek9jCiQUmEKniyKqkKrMCX7QYsMHR6NSY98DslVF1g8no5eYpv4///LkEoefK9GM
	TaxdTKrLCtE96lkOmGqdvN0bdfn8uSflabIivei97AbENicRQXq07Hw==
X-Google-Smtp-Source: AGHT+IGYuEuHzLpsgKnYPKtlxcYnqyLY8yYJBAHJhgxQ8dv64VF7X1Tzkg40TcunXFxtwU+tj7usbv8oLmJYhPL74p4=
X-Received: by 2002:a05:690c:4443:b0:6e2:1062:9b90 with SMTP id
 00721157ae682-6e210629d20mr13188617b3.44.1727181406631; Tue, 24 Sep 2024
 05:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-5-quic_mahap@quicinc.com> <v4cnmso3nl5oi3scd2lkg6kepb52vjrzgoti42ikds3y2wq6aw@sbn2yu4xeiun>
 <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com> <rmndmhq67lajdmva6gt46rqtkvf6jh2afbqazafz6oxv7ep56j@bznopz3aexyt>
 <ba0bc896-41ad-4f1d-9218-fc5a44add422@quicinc.com>
In-Reply-To: <ba0bc896-41ad-4f1d-9218-fc5a44add422@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 14:36:35 +0200
Message-ID: <CAA8EJpqTuj2j4mTKCTGpOX6ZfgGLocmDdwX1BwqEp6OkBejnDg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SA8775P support
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
	konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
	neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
	quic_vpolimer@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 14:31, Mahadevan P <quic_mahap@quicinc.com> wrote:
>
>
> On 9/24/2024 5:46 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 04:42:02PM GMT, Mahadevan P wrote:
> >> On 9/12/2024 1:34 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 12, 2024 at 12:44:36PM GMT, Mahadevan wrote:
> >>>> Add definitions for the display hardware used on the
> >>>> Qualcomm SA8775P platform.
> >>>>
> >>>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> >>>> ---
> >>>>    .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
> >>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
> >>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
> >>>>    4 files changed, 491 insertions(+), 3 deletions(-)
> >>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> >>>>
> > [...]
> >
> >>>> +static const struct dpu_intf_cfg sa8775p_intf[] = {
> >>>> +  {
> >>>> +          .name = "intf_0", .id = INTF_0,
> >>>> +          .base = 0x34000, .len = 0x280,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DP,
> >>>> +          .controller_id = MSM_DP_CONTROLLER_0,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> >>>> +  }, {
> >>>> +          .name = "intf_1", .id = INTF_1,
> >>>> +          .base = 0x35000, .len = 0x300,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DSI,
> >>>> +          .controller_id = MSM_DSI_CONTROLLER_0,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> >>>> +          .intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> >>>> +  }, {
> >>>> +          .name = "intf_2", .id = INTF_2,
> >>>> +          .base = 0x36000, .len = 0x300,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DSI,
> >>>> +          .controller_id = MSM_DSI_CONTROLLER_1,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> >>>> +          .intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> >>>> +  }, {
> >>>> +          .name = "intf_3", .id = INTF_3,
> >>>> +          .base = 0x37000, .len = 0x280,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_NONE,
> >>>> +          .controller_id = MSM_DP_CONTROLLER_0,   /* pair with intf_0 for DP MST */
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> >>>> +  }, {
> >>>> +          .name = "intf_4", .id = INTF_4,
> >>>> +          .base = 0x38000, .len = 0x280,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DP,
> >>>> +          .controller_id = MSM_DP_CONTROLLER_1,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> >>>> +  }, {
> >>> Where is intf_5 ?
> >>
> >> intf_5 of base address 0x39000 is not supported on this target.
> > Not supported by whom?
>
>
> In sa8775p mdss architecture intf_5 is not present. So we are not adding
> in SW too.

ack, thanks for the explanation. It's better now.

-- 
With best wishes
Dmitry

