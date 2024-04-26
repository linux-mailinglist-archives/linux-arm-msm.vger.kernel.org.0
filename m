Return-Path: <linux-arm-msm+bounces-18695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E428B3F77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7009281A89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6A8524F;
	Fri, 26 Apr 2024 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gonUJ9nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE23D8E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156708; cv=none; b=FN7krJbHlZWN+eAYzWwqrqLsRh3Pk58ZtFM0Je/jovHadMgLXN0ZQ34OEhDMD+8CPBnr8ppklLcbUbv0kiH4uHzCpVTRmhUy8D+t1NCFXervjEuyS5sFXmk13WoySfU3HGMWPY1OeqPbaj2oD8APX1Ptsf5YKXws2cqXE1aCFNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156708; c=relaxed/simple;
	bh=EROl0h+lX0UEVOQ3jXAf6uS8dnPQHx/VO43DC0quFrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPWTQe+Fy68qNDhdKZggt5LEpLXMx2DJ9NT+RGdws+2NIUQTAtApp9J37KrlfPAi4Oz4jRIQ8/qrBp5FRow0G+24z5Es5QB/yOzsxyzHPFHTNmR0JC8Ev/w80KC2qdItICoQ9hukr8aQw0y3Kdei5hMDDy9C9Mbmexq8FJGseHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gonUJ9nr; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so2780011276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714156706; x=1714761506; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LCD0O0mksG8o2F+MvGZO/EX3h5H/t77oNaw9Qg2ltc8=;
        b=gonUJ9nrsYAk/tfle7bRtlD98dd3RXksVkO82PSbqLX9lzbaU5yP+9P5V6Xiou/zj5
         TNiPoZqNb3uvnz5nS9CRvTUbtYohjKfnXLngYLbkR/hzFhKJh8HZFRBpb46VTvX1ZADH
         jheJuSB0g9NPVVkOJFBvMB5NqDPNHU322QPM34uKo3oamfRHE/gXDSbcVapqNZXuSPl7
         I82fDh7gTOXepG1XW4hbcpvgVnXGxaq94py8szzoQC2BkvL9ljBtp9wKx57OgkXhOSA6
         HF1S8NeCxRy8Kvv0UuiNDncUTnV5/7emL2fQow+DeqmXGq5dxKG4YCd2wnvPj3SNdQ3X
         jxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156706; x=1714761506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCD0O0mksG8o2F+MvGZO/EX3h5H/t77oNaw9Qg2ltc8=;
        b=S4zEs0e903PoBchNdzvghFjkdNNycXpJcyq8fBRjmLufLRIGmlPZjGuYzVvICj+gvn
         2xwfWcfxRy3Bl0IUABeHkGK0ISTWUXd4YztDiH3FX7K03eL3vTFt8yYmDmrWG5EAB6S5
         nj1Fs13PQv+PKuxSpAzErCMkbxNZUlDdMX+kawGe0sTHPZb/d71bcrRkm2P8OsrQxLfQ
         K7kE3dYvLCdoV4KVhR5wWP3LZOrfAY8Q0CZsgvSWdD0NUnI2v4I07rHPGnc7SK29Ejey
         tLm15Seb70OnMW43cvazxNk6DWIq3LzRsLUsCcmgxRg7mamc22qmi+GZoFZP22qlFmPT
         C/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUvP4pkS7BlFJ1z0/sq1FXNNdEDm2NIS1zXwRo/o9FKD8ucQkJ2D40xmdizGhRiAfW1eIZ5zgtK1dhVOXk6dWMV3MbuczlDsz0hNFGZlw==
X-Gm-Message-State: AOJu0YxLzW1nemy5twKbbGHVMR7TtLgcWi5Z2edd0bsCH1xZ+S0jQyUb
	9RbJEkcCqE4kSUoOjF/vl+vnopeoyqnAcIFUZ6AwfH61xyfcrE7ekSID8NPHx2+Ui6HD3jOAV3B
	BHFcRNBAnTts8Mrnzi0Y1GvanqTq/t2GtS1y1vQ==
X-Google-Smtp-Source: AGHT+IFAGdtoxtMF2BQTf0jLN/bVVJboZUORk+tAcFQhd1qw6HVqAVGEQ/MHq4a2scbHXirClF7DoJbhhB5lfiXMorc=
X-Received: by 2002:a25:ce8f:0:b0:de4:8b7:7bbd with SMTP id
 x137-20020a25ce8f000000b00de408b77bbdmr4064532ybe.15.1714156705913; Fri, 26
 Apr 2024 11:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com> <20240426-a750-raytracing-v2-2-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-2-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:38:15 +0300
Message-ID: <CAA8EJppF_Xhv_itPOAwbeey0Fh-V=Wd5SoOxNmGZpOUjYkLgNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] firmware: qcom_scm: Add gpu_init_regs call
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> This will used by drm/msm.

Can we have some description please?

>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 14 ++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  3 +++
>  include/linux/firmware/qcom/qcom_scm.h | 23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
>

With the commit message improved:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

