Return-Path: <linux-arm-msm+bounces-8913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6D841558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 23:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB86C28825C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 22:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C57E158D9E;
	Mon, 29 Jan 2024 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkFVN1Ow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F741158D9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706565805; cv=none; b=mBOszHOsIZfAKRQ3RXKgw7GSmCcmaUTwEb430OW+2S4HCgNNwlkiIxpyMTIVfsku0tFC3aAbv4NtEjZsXlfvd3XXIrCaeIPvI+rodICWemsG1UoIIaRRzs0ajqK5H1mxAMvtPGhov9lc/hAK6V1XDKXTYOPuE3PiF7xiR0TJ22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706565805; c=relaxed/simple;
	bh=1VUKD21nrbIVOTIxxRybvfvlN1MBpUbaPz67ZZlJlPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvyqLrK5OtvV9y0PRNRXhuT7xKIBxuGe7aaJOOOf2KbV6iiqF8gJS/ZbKcpMNYETLZzBmaLKNt57FtnRBQ5eYbWbwBM6UZpo+B4ZYVpgFFcM7JnniwCYGitTHrn+0ojfh5ZzGOv5KBJkHPn2qWK4bJTr7v7zr55hWOB6LgGAxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkFVN1Ow; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-602c91a76b1so42120877b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 14:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706565802; x=1707170602; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iizRxv6NysE36xdrVEdKo+2mCUyIdpOKnLfh9KMSTAo=;
        b=lkFVN1Owg+GMNV0ryFQOc5WHYTsYWPa2ISDlnduIY9eKrUO6YEfk00n81wWBdZyNSL
         XtFLACiEIjq0lXdRQv/ffZWo0Di4pGfTTgtQJ07Cd6UtXy1FJM9lcx4inPEhq47hpqYs
         P2vODrHcXb8sIBtdNYAUovDE3cMpYFvNbY1YLBIogfvIOhNQ1mQlYlYPmuanZTkOia29
         LQjobyAab8vB9RwQzTxAMSqKS8Zsg8z0f3GK1+C8KFA0yO+08dXH1Oo4cKQlRHs/UFnX
         GJLs0Dgg1VTiSXUIcUS3iL0T9PRME3VgjlG9B922SnehBtq5OMW0G56SJJUhvbSLV0hz
         TW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706565802; x=1707170602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iizRxv6NysE36xdrVEdKo+2mCUyIdpOKnLfh9KMSTAo=;
        b=toC4QHv0cE5draycBeSytNvngh3RfQSIC3IrsnLO4fzg4uDLvcLS2JVv2gQZ/RozBL
         kfN1rQjhUmy8pi2eFABqVB4p6bxrlELLZU1QZwqkiUUOrOKycrC/dRpiUSfMq6giKmQe
         faGm2R7iFHefMZ2hRLC7d1XZZ7VQfG5RhpSUJnjhhxNCfehyeAwca7fsGEUCKNi/op7V
         Cg++bBFxtvLGngmfI3P9IWT6SK2nEPRV6e6lHEqSD5xdjwxkV/QTVqHf/h+TuiMw7c6v
         P/rARgXsYJAaf9/JGtnhEERgh2LpiPepFRjd9wo2UpMTKWCDQqg+h9wGVlGcdVfWRmo0
         +vLQ==
X-Gm-Message-State: AOJu0YwnHw/mAUBEEO4Ti/8e9vwQnpC+rQSsFv+2q9ysjNWXW33hsRti
	i3sDD1H9sUfTfCmumBpsYjM1RRdOH29+zIy7uhRanqDu7qaSBoGgcDfpycviLWKBrv/i+jebqjk
	3Z//1bxqggwO8w1kpveq1nFlB2eCpezAvjVUPOQ==
X-Google-Smtp-Source: AGHT+IF56uXHT4Cgjob666MahBgikEJ7dPk4T30eS88whDfuArgJB7aIwJP3xVTnl2WJOYxa9KCJ6EHOmRzxFs/98Rg=
X-Received: by 2002:a05:690c:d1d:b0:5ff:9089:7d19 with SMTP id
 cn29-20020a05690c0d1d00b005ff90897d19mr7855510ywb.66.1706565802609; Mon, 29
 Jan 2024 14:03:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706296015.git.quic_uchalich@quicinc.com>
 <12bfdd23772c49530b8b0993cc82bc89b3eb4ada.1706296015.git.quic_uchalich@quicinc.com>
 <CAA8EJppapW5nOFphBWove1ni8nbkA=xHON9D13NYeYHhyqL1Fg@mail.gmail.com> <94b097d4-dcfa-4136-ba75-f665f5bc747d@quicinc.com>
In-Reply-To: <94b097d4-dcfa-4136-ba75-f665f5bc747d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 00:03:11 +0200
Message-ID: <CAA8EJpqa5YArFk893nDz_oibbV=oqGEeYq6_jw582rQs=O_WpA@mail.gmail.com>
Subject: Re: [PATCH 5/5] soc: qcom: llcc: Add regmap for Broadcast_AND region
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 20:17, Unnathi Chalicheemala
<quic_uchalich@quicinc.com> wrote:
>
>
>
> On 1/26/2024 12:29 PM, Dmitry Baryshkov wrote:
> > On Fri, 26 Jan 2024 at 21:48, Unnathi Chalicheemala
> > <quic_uchalich@quicinc.com> wrote:
> >>
> >> To support CSR programming, a broadcast interface is used to program
> >> all channels in a single command. Until SM8450 there was only one
> >> broadcast region (Broadcast_OR) used to broadcast write and check
> >> for status bit 0. From SM8450 onwards another broadcast region
> >> (Broadcast_AND) has been added which checks for status bit 1.
> >>
> >> Update llcc_drv_data structure with new regmap for Broadcast_AND
> >> region and initialize regmap for Broadcast_AND region when HW block
> >> version is greater than 4.1 for backwards compatibility.
> >>
> >> Switch from broadcast_OR to broadcast_AND region for checking
> >> status bit 1 as Broadcast_OR region checks only for bit 0.
> >
> > This breaks backwards compatibility with the existing DT files, doesn't it?
> >
>
> It shouldn't as checking for status bit 1 is happening only when the block
> version is greater than 4.1, which is when Broadcast_AND region support
> is added.

Let me reiterate, please: with the existing DT files. You are patching
DT files in patches 2-4, but this is not enough. DT files are
considered to be ABI. As such old DT files must continue to work with
newer kernels.

>
> >> While at it, also check return value after reading Broadcast_OR
> >> region in llcc_update_act_ctrl().
> >
> > Separate patch, Fixes tag.
> >
>
> Ack. Will remove this from existing patch.
> Thanks for the review Dmitry!
>
> >>
> >> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> >> ---
> >>  drivers/soc/qcom/llcc-qcom.c       | 12 +++++++++++-
> >>  include/linux/soc/qcom/llcc-qcom.h |  4 +++-
> >>  2 files changed, 14 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> >> index 4ca88eaebf06..5a2dac2d4772 100644
> >> --- a/drivers/soc/qcom/llcc-qcom.c
> >> +++ b/drivers/soc/qcom/llcc-qcom.c
> >> @@ -849,7 +849,7 @@ static int llcc_update_act_ctrl(u32 sid,
> >>                 return ret;
> >>
> >>         if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
> >> -               ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
> >> +               ret = regmap_read_poll_timeout(drv_data->bcast_and_regmap, status_reg,
> >>                                       slice_status, (slice_status & ACT_COMPLETE),
> >>                                       0, LLCC_STATUS_READ_DELAY);
> >>                 if (ret)
> >> @@ -859,6 +859,8 @@ static int llcc_update_act_ctrl(u32 sid,
> >>         ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
> >>                                       slice_status, !(slice_status & status),
> >>                                       0, LLCC_STATUS_READ_DELAY);
> >> +       if (ret)
> >> +               return ret;
> >>
> >>         if (drv_data->version >= LLCC_VERSION_4_1_0_0)
> >>                 ret = regmap_write(drv_data->bcast_regmap, act_clear_reg,
> >> @@ -1282,6 +1284,14 @@ static int qcom_llcc_probe(struct platform_device *pdev)
> >>
> >>         drv_data->version = version;
> >>
> >> +       if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
> >> +               drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
> >> +               if (IS_ERR(drv_data->bcast_and_regmap)) {
> >> +                       ret = PTR_ERR(drv_data->bcast_and_regmap);
> >> +                       goto err;
> >> +               }
> >> +       }
> >> +
> >>         llcc_cfg = cfg->sct_data;
> >>         sz = cfg->size;
> >>
> >> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> >> index 1a886666bbb6..9e9f528b1370 100644
> >> --- a/include/linux/soc/qcom/llcc-qcom.h
> >> +++ b/include/linux/soc/qcom/llcc-qcom.h
> >> @@ -115,7 +115,8 @@ struct llcc_edac_reg_offset {
> >>  /**
> >>   * struct llcc_drv_data - Data associated with the llcc driver
> >>   * @regmaps: regmaps associated with the llcc device
> >> - * @bcast_regmap: regmap associated with llcc broadcast offset
> >> + * @bcast_regmap: regmap associated with llcc broadcast OR offset
> >> + * @bcast_and_regmap: regmap associated with llcc broadcast AND offset
> >>   * @cfg: pointer to the data structure for slice configuration
> >>   * @edac_reg_offset: Offset of the LLCC EDAC registers
> >>   * @lock: mutex associated with each slice
> >> @@ -129,6 +130,7 @@ struct llcc_edac_reg_offset {
> >>  struct llcc_drv_data {
> >>         struct regmap **regmaps;
> >>         struct regmap *bcast_regmap;
> >> +       struct regmap *bcast_and_regmap;
> >>         const struct llcc_slice_config *cfg;
> >>         const struct llcc_edac_reg_offset *edac_reg_offset;
> >>         struct mutex lock;
> >> --
> >> 2.25.1
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

