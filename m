Return-Path: <linux-arm-msm+bounces-4331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2980E449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542D01C218D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 06:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643A9635;
	Tue, 12 Dec 2023 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SP96YnY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA4BBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 22:31:59 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d3758fdd2eso51775607b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 22:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702362719; x=1702967519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GTyimt7NL0UKlmZiXkz9uafKVfa8o+8ACsFlcy9zsvM=;
        b=SP96YnY6GQafSBIMWcKBHkXDjR3K0Km9NxcDDSY7i9dE6ZVvVA2ToXtu/baWiCaF6W
         IDK5mmkm3/Bfw26piaVm6XoaQiVXBdjIhn2qFL4lsBZUOpcZ1N8TbEcfW1JzI2wXMFTf
         EU68wdDb2EFVtFFip04Jg9HTei7LWz/t4RNq6N3Bb9GwtCSeJ5P83knOSEXc/JG4UiBP
         xpPXKr/njJ9vaeVVg3trjHCQSHKbc9mocfs3YgOC27uMgUdBylaHp9qEBRqidwHVbifX
         tVh/TesCxc5SbJ8H0N364gr8wifRgUmjDNUDKVUnVhrZbTTrDLGr8EpiOVFupgru0a3J
         5W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702362719; x=1702967519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTyimt7NL0UKlmZiXkz9uafKVfa8o+8ACsFlcy9zsvM=;
        b=fVRRsxp32vykAuAl1WIg2L51kISf8ti8gcDwe6KX50AH6NxmgiWviz/sIR+SXUEPMe
         yOBy0RBhsaRhpK3uSv2Pgt0H6RVbvc0+E7E7SoIjPU3TVsuWSzMT8+PkYaPIohyG0PM+
         FwGZ3FhhQ0heFpgLRX5i/HAhlSvKS3UXrR/jYYsgMpriBnlLJChI+fBjPPVU07oMQZsb
         FK3KCPh2jV1xeUSC4e4ZGa3dSpCH2W3wEk8cIvxZtSqhFGI7SuTxl/YA9a+679cZpdN7
         x6y1Tpt4g39LZX7VpEdQPDifJazWDT6WONc5m29vLdoznUSbsyvgiK55Aox+RfqrS8ww
         XRwg==
X-Gm-Message-State: AOJu0YwQZGP6yVxjGPZ0GF6ouWls8AhkwLKzH7ZSLhzdZWOk8UDcsloh
	YKJIOjKcOm5XBNP8fsP/93CVK91lfwM5a7YDfJvoBQ==
X-Google-Smtp-Source: AGHT+IGs3HI6JS3zf1kNU/4zxKRcKFHbTh53Sxa3Dui91Qy2eQXtvbSqGZ/ne5wF8+f6nUF/3SZPXetlFOQSuaig8Ag=
X-Received: by 2002:a0d:d305:0:b0:5d7:2c6b:623 with SMTP id
 v5-20020a0dd305000000b005d72c6b0623mr4258949ywd.39.1702362718756; Mon, 11 Dec
 2023 22:31:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702319923-24518-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqAch3Qhq_nfecA06d9fk1jUMD1Dx0ZgNGrom6BrwFo5A@mail.gmail.com> <baf2ebe7-7895-9249-8487-a7c7e61a67c6@quicinc.com>
In-Reply-To: <baf2ebe7-7895-9249-8487-a7c7e61a67c6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:31:47 +0200
Message-ID: <CAA8EJpoN8OVhPEyHzAjO7DUK9b+7_iJmc0k-XO8B8PrG12ZTVA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 02:03, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 12/11/2023 1:30 PM, Dmitry Baryshkov wrote:
> > On Mon, 11 Dec 2023 at 20:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> A DCE (Display Compression Engine) contains two DSC hard slice
> >> encoders. Each DCE start with even DSC encoder index followed by
> > "starts". But it will not be correct. The DCE doesn't start with the
> > DSC encoder. DCE consists of two DSC encoders, one has an odd index
> > and another one has an even index.
> >
> >> an odd DSC encoder index. Each encoder can work independently.
> >> But Only two DSC encoders from same DCE can be paired to work
> > only
> >
> >> together to support merge mode. In addition, the DSC with even
> > There are different merge modes. Here you are talking about the DSC merge mode.
> >
> >> index have to mapping to even pingpong index and DSC with odd
> > PINGPONG (end everywhere else).
> >
> > have to be mapped, should be used, etc.
> >
> >> index have to mapping to odd pingpong index at its data path.
> >> This patch improve DSC allocation mechanism with consideration
> > improves
> >
> >> of above factors.
> > of these factors.
> >
> >> Changes in V3:
> >> -- add dpu_rm_pingpong_dsc_check()
> >> -- for pair allocation use i += 2 at for loop
> >>
> >> Changes in V2:
> >>      -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
> >>         _dpu_rm_reserve_dsc_pair()
> >>
> >> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> > This tag is incorrect. The patch should be split into two pieces. One
> > which fixes DSC allocation for DSC 1.1 encoders, where there were no
> > DCE blocks, another one which adds proper handling for DCE.
> > Unless the paired allocation requirement also applies to pre-DCE DSC
> > encoders. But in that case the commit message doesn't make any sense.
> >
> > I checked 4.x Qualcomm kernels. None of them contained any of these
> > restrictions for DSC blocks. Only the displaypack targeting 4.19
> > kernel got these changes. But it predates DCE pairs support.
>
> as I said earlier the rule of odd/even pp-index map to odd/even
> dsc-index is there since dsc v1.1.
>
> I think current code (including down stream code) works by luck to not
> encounter a configuration with two independence paths, one with single
> dsc and the other one use two dsc to support dsc merge mode.
>
> this patch is the fix to enforce this rule for both dsc v1.1 and v1.2
> and I will rework commit message yo have better description.

Good. Does this apply to paired allocation too? I think so, as the
techpack first got the paired allocation and only afterwards it has
got the DSC/PP idx check.

Regarding the patch itself. May I suggest an alternative approach,
which should work better, I think. At least it will not require
'deleting' the PP indices. First you preprocess the pp_to_enc_id array
and list all PP indices selected for this encoder. Then you work with
this array, matching PP and DSC blocks.




-- 
With best wishes
Dmitry

