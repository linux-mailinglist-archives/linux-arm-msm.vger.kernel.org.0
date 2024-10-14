Return-Path: <linux-arm-msm+bounces-34326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB699C99D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE5551F25528
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEDA19F419;
	Mon, 14 Oct 2024 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJqWdptK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D119F13F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907175; cv=none; b=kFNqKooSTcpmWoF70Jzanmx/CuVa6GIQpeymj5nyRcAJD8vjn/UijY8EBUJgAPoqH9F4h+jDJTZOR2eegfN609Za65H446AKheyodMVaduk6Hc5QTWqDLrbv6s0RucRUAtUgnYzHA7bJmk+ecgoK5ff7cKjd+TFqjSKtss32Vl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907175; c=relaxed/simple;
	bh=5FoqIwssrvjp97KnL3zQZ6UIwNDocSkh3saIm6sEff0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKnW2+6FhrkiR20GTe5t6h/MrVGpf0/S8jyCiUOA2l6tDzDATFD/hbM2+vfdyfa7G2HSYKHFdLyUoyHxCHGwkA4rTcbBn32mm0iNKzn2d42NbQrrHaOhf0kbC5XEah1yzp7nyrPjwNE+pFUyG5rJJgDpM/oEkcmkUOejESorSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJqWdptK; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e35f08e23eso17320427b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728907173; x=1729511973; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gy9SGG1Fw6l8b5zitIWLhCDUHisMjzfbWHJaJ4akvjk=;
        b=BJqWdptKjm51tX1gQfo3OdY/us6TODM4X4JKUitTHelQzFyHKR+H9+WPH7OCspGlIP
         GECCIOp5JaBRZ7arDlqNDA136AKK+P4NL78/eEexBaU6lItlaAl8ljT0Rt6Abnnql2kj
         prrsquxTGvGQa9pi4pPuY5KCtuWf5DANCs/1k7VhKMB1zRBoWjtCLaMjB071pdkj+Ue0
         Fdx10JSj1hm3Eqw/TInCAgbUhH7zh1/gOXScAQpGFrl5NpZiOBEu8RKLUJjjiKJW9oGT
         i0x4ExNvRrKxNldEvB9FhPcYju8Q4CWHzSgNysK+jM4rjtn+OFBM2cZ4vMIu1w/+wJxj
         dFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907173; x=1729511973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gy9SGG1Fw6l8b5zitIWLhCDUHisMjzfbWHJaJ4akvjk=;
        b=ujM6SVZ+p3/3ocsW+VOmVxdKR+Ht8VSYrfZPqt/tUSp79/EI7gbAqz/ju8Xlplr0Lf
         Ap1ptlM+uE52oFnxLzdNO0Y/rTwVjgWeEdLzc4Fjmb4kg2Lczs7qBflIodGCdiy0Jl+3
         j5fq3YJQQCp0qG1ddxJm/R2gOGs2SGl0NU3cY6wQia19nHYXcH0OyWMdcZEpsygWEPHm
         +yrjvvX2O3ZUHOSZRs5pUg6z437y/l4qP5QAtPGUQ6ha1HCZ0PJ8n3u3A6qrprwoqDN5
         dpx5klJmdM0+h89UkWx8ytlTLPx6BiScl4rMnVvvDIoY+RkPwgggdxLi/kLGhpqsbpbV
         rhog==
X-Forwarded-Encrypted: i=1; AJvYcCWB8x4TaUXqAJYtJU45bVDrX0WryZvlELwc89qY3hGRy0ovaRQ1uAVJsaIT2MEMIk7ae1dVH3QCldGdv0An@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxyto56ADOC4xRfAb8QeQ06Vydkuc76ZeHvqN4jWnNm8r+8WKv
	awr8Ad5cpoLxmPNZwC8ENAWf3Ct7MhR37L7fZ5qfvnqg6eT0XDBeKMclFkbEFEP8Rbc2vGs02Ow
	BF8M0Ho3b2swPTmMwR7dTsY/CP0xZcnUwTfrkWA==
X-Google-Smtp-Source: AGHT+IGGM4cy7hM75k1QKPoH1rMcKk933eWjr/PIbCrRLb2ILmm5S11lu7uUn3qOXDK0lbV0wQqiRjEi+nfT/OqcN3U=
X-Received: by 2002:a05:690c:6210:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6e347c68d27mr93871247b3.32.1728907173067; Mon, 14 Oct 2024
 04:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <rodjkasqm3orhszu7pp5eimhwgoyda76c6k3a25xkq6vtnkxag@v7dhv6ghhbqg>
 <c56kabp3xe5gcvmz23xqvd66dsfgo3gkm3xrideq4mhutm55rt@tqqv4gbzuwet> <SJ0PR02MB8750D786748D105839EE905BE3442@SJ0PR02MB8750.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB8750D786748D105839EE905BE3442@SJ0PR02MB8750.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Oct 2024 14:59:22 +0300
Message-ID: <CAA8EJprw-rjZEX6A0uZpOwMRO+HuC4gzjuBrLadun1ZpJmrjWw@mail.gmail.com>
Subject: Re: [PATCH 0/6] add_display_support_for_QCS615
To: "fange zhang (QUIC)" <quic_fangez@quicinc.com>
Cc: "Li Liu (QUIC)" <quic_lliu6@quicinc.com>, 
	"Xiangxu Yin (QUIC)" <quic_xiangxuy@quicinc.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Oct 2024 at 14:50, fange zhang (QUIC)
<quic_fangez@quicinc.com> wrote:
>
> Dear maintainers,
>
> Sorry, Please ignore this email thread. We will review it again and initiate a new one after internal review.

Dear fange. Please don't top-post and don't send HDMI emails. Looking
forward to reviewing v2 of these patches.

>
> Thanks for your comments.
>
> Best regards,
> fange
>
> ________________________________
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Monday, October 14, 2024 18:48
> To: fange zhang (QUIC) <quic_fangez@quicinc.com>
> Cc: kernel <kernel@quicinc.com>; Li Liu (QUIC) <quic_lliu6@quicinc.com>; Xiangxu Yin (QUIC) <quic_xiangxuy@quicinc.com>; linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH 0/6] add_display_support_for_QCS615
>
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
>
> On Mon, Oct 14, 2024 at 01:36:52PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 05:47:26PM +0800, fangez via B4 Relay wrote:
> > > Signed-off-by: fangez <quic_fangez@quicinc.com>
> >
> > You didn't copy any of corresponding maintainers or mailing lists, so
> > most likely your patches will be ignored. Please use b4 tool for
> > preparing and sending patches.
> >
>
> Ok, you are using b4, excuse me. Then it makes me wonder, how and why
> you ignored all B4 recommendations and pleads to get required To/Cc
> lists.
>
> > > ---
> > > lliu6 (6):
> > >       arm64: defconfig: Enable SX150X
> > >       arm64: dts: qcom: qcs615: Add display mdss and dsi configuration
> > >       drm/msm/dpu: Add QCS615 support
> > >       dt-bindings: display/msm: Add QCS615 DSI phy
> > >       dt-bindings: display/msm: Add QCS615 MDSS & DPU
> > >       dt-bindings: display/msm: dsi-controller-main: Document QCS615
> > >
> > >  .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
> > >  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
> > >  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
> > >  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 101 ++++++++
> > >  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 195 +++++++++++++++
> > >  arch/arm64/configs/defconfig                       |   1 +
> > >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 ++++++++++++++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> > >  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
> > >  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
> > >  drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
> > >  17 files changed, 1014 insertions(+)
> > > ---
> > > base-commit: 77dca4e0530173cb10896cc113f14e6403f0a31a
> > > change-id: 20241014-add_display_support_for_qcs615-b17bc0d4118e
> > >
> > > Best regards,
> > > --
> > > fangez <quic_fangez@quicinc.com>
> > >
> > >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

