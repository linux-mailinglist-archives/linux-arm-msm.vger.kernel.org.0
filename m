Return-Path: <linux-arm-msm+bounces-10495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC998503B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7471B1C2116D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEF224214;
	Sat, 10 Feb 2024 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxn7BrbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC8F2EAF9
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558116; cv=none; b=f9EwKiwtr+eMnRCRHn910A7ndn0w/fh49v9x7Yb5j3hL/l1LWObrUsEpz1QyXY2ilZe4kIiKrBmmstWmsRv/yBqbp0/vdj81I+g6FA9Er4hav34ypP2ILgd8Cd7vE05H25qJoO06cbMOe0bxHWHJFeab7Q1ozXTgsu+xjNi2hw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558116; c=relaxed/simple;
	bh=+AxlR6NTEp71ei9dNRta1iEjNgVh63l24UAGkr/8cMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGI3oiFvMKl8WQ+n+YIvkncetiro0s+zKN++65/L+ahPVnV+M8b2RtJRmPQ7VpEme7g4eJ5LyH24PqViHUlnlrdcQ9NqU2Pm3OazazxLqsvxFenm1E4PSaQfS4A/Rb1Dt2NyZPlHMfXLTK7rZk/C4HVfUvPOk78wDvhtaNCXAsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxn7BrbO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc75c5e3151so601432276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707558113; x=1708162913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FmQjmWLV7DJRRFljU/pPBQtvGGLrbs70ePm8J5kL2KY=;
        b=vxn7BrbOrNEGHLyIVO4NHuB8TBUlAbRkycRcHoMe4Zz7qm90LzbQKTBPoDu4uPcme3
         TjPzas4g/cX2V3BJUy5bnjqOrIh57hb5pZVbXJD7iwGEXxf8WDSOmePy3MB//sOXWe89
         NKV2k+uXnVoqWvLPk5GCh9YbxH6lRtFV/6tJ8H9ynQeiJS3TYgyqX5NBk6srhHblMVwA
         wWnOblBAP2Kj3Ha4MSFUE2PAzSyMywxT94MAjiQG64g6EljsV1uGHNU5WnylIKSHItiP
         YQgaejAewuCYi7DvaihLHZrfE/DyKHSmcUYVp23I94kgT9I8x9JRR87CY1L8dPzLX7kb
         b67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707558113; x=1708162913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmQjmWLV7DJRRFljU/pPBQtvGGLrbs70ePm8J5kL2KY=;
        b=fjcJeiwikAqLI6+6cOaU4aXJkVvy5IYcA/I2HIfwX+kRUp/M1N5SoPiZHPgkqibV9S
         FTSNCfqCWoSd6WQ8UsSfDoNWwb5OI3ObzD09lLc9e8IcULCxk0leKWh93RwKDL/Qrr2P
         4SEj27uLnW32epi1E3/+qTX4ZQPkQ8Lb7V0xZzRVzss56n1weTIIVeXQEB9+IKtA102x
         PUcIrp3tKoBwy4GfmRP/8IDg7gCAn0gRYPQyNsnIuQjY86kYY8sTieH4UFefsP4TuW7D
         OJ//9/7OkmRyk8SczoJfreqtdMVhj/pwEEj0++MGityMiwQJU1cLMTxzrtTlmjFK42h0
         06nA==
X-Gm-Message-State: AOJu0YzClbC6eFxq5Me8s2PPClxAirNkNiO5ZoYuNpasPL0LD2se0rGc
	ZE4dS+PTYiIBKzSVfVqvoxkW+2W9oHHRg5sKnYgeNqdEHeilSuSqW5ccOMmZOSL4ZbqXa5rU/51
	4QQhg4KigkqoIxnqC+ZYZvyXxlTEuzvZb0VKMWA==
X-Google-Smtp-Source: AGHT+IE54M281Vieh3wZ0YBgqDx/AuBch5Pznwg9hx0yJY6dS7xj/fAxE3wJf/efdw9syQBI4/GbJ8uHf0sc1c5S73U=
X-Received: by 2002:a05:6902:1b0b:b0:dc2:3237:ee61 with SMTP id
 eh11-20020a0569021b0b00b00dc23237ee61mr1873660ybb.53.1707558113541; Sat, 10
 Feb 2024 01:41:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-5-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-5-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:41:42 +0200
Message-ID: <CAA8EJprduMsCwuXBOR2rATKJp+2+1R-L8+xSL6yBRE9CmdZnzg@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm
 to work for DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>
> Changes in v2:
>         - Minor formatting changes
>         - Move the modification of the dimesions for CDM setup to a new
>           patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 27 ++++++++++---------
>  2 files changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

