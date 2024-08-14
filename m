Return-Path: <linux-arm-msm+bounces-28497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8E951A32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96FBA281D37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADF71AED44;
	Wed, 14 Aug 2024 11:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VnIOWX5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA8394
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635652; cv=none; b=WU2bdP51ims+pfufG78QlxFToJ7bi9h1ShDOSoIYA8P07BO5Lj5v9+2djel+jaR40rPODjKSuOX4FR2aJV+MfR6OCQTeXTf/98WiyCNhNs2befWM5bVjoIn2KwQjvnmJLFYXKZlkCQIjbwxx6iXSaUuMaBlNApdiGnq10WFNbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635652; c=relaxed/simple;
	bh=e8mXQbUqQCEEWGhTEMIaH+4giqzidvJR227tArHS/aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRinTg/kInODOIFlhEmpq/TyuZwE0KbfoFUjEwa5qwB8LKuqdKWobGf7TnuZUwSiI+wr+dvaUoZe9qZCBtxUzb4KS8lYp909Jz3Nz1XFV0pXdfz93nKAhL6lcMXcUmTXzGhIQI2Fb2ROyMmgzImIv7Jt1vSWUUN3rd6icL2WC5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VnIOWX5X; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7aac70e30dso726596766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635648; x=1724240448; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sbgxlrXHc3w9+156HZaTZfFlJWdnKYz3nijx1PbV2J8=;
        b=VnIOWX5XxIGLE2tQ2bLUkBKFokvn6hsbADVtH7BxFQ9a1gDA3/DvBZN7qbNzpl+Jw9
         0dZ0CFxszLegQ/dZ8VrXRFfiRUUJsULTC+f/t3gC97ThTF/jaQcg8G2K1/QPhPSZTWtb
         NrFnoSJtiAWyZNsGKeOUa96cXXovd6SS1kW8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635648; x=1724240448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbgxlrXHc3w9+156HZaTZfFlJWdnKYz3nijx1PbV2J8=;
        b=IKvwtoAmPtkegVddqB0vtY/jksWMSDGPa0Fs5NF+F+MqkB5cYd8iR0UWNFfETV2cdD
         oPoqi1hUbgItFeLvPdOkFhofmdEucTd4k4Wqn0OZOwADhVl/UKMS39gVpzsh8trMjmqm
         gtBgOcDDI12ypS8jlUW7e/gfuoAqr1/KtOi1WiaZxhWWxMEPH6vueGFdlXb2zrDPQiEd
         d58GruK0XpIxzShVrJenNHOLAit+rSkjJ2/Vc6p6xyEQeMurD935Qo+GONu8Eft5654f
         qC18M5GDP/7qHSLR+8Rwbv4sR3jmKyupTTiRbDweM+efydUwWoGBoewcr+26Q38FE9o4
         y9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCX+tgViadXM4EBzCKgAthQk2tFoLVd3L9tqiot8rlHTfnPusqgy5pZMy3ZCLaRbAai9HQhMlvpU5PgmXbufM3M4uNCUJNirYt1DEo7OZA==
X-Gm-Message-State: AOJu0Yz9DeaX6B9jAyrNCkntvhLDyIeubos15fAj2zcUblq6rq5fVPzE
	7csR/oux1Hfbz8vdAuYFYu1O/A6IFeRR0kI5OpqpfEQ5w8gGuSu6ETJP8biSFeJCC85VOtDRWH1
	lM1cW
X-Google-Smtp-Source: AGHT+IHSev7TdAZPGmPfFr2LGFF1m45b6ILmIb56t7FtY1dTxuYPJEYES4OA2zXa4ID5POO0kXnE6A==
X-Received: by 2002:a17:907:c7e4:b0:a72:44d8:3051 with SMTP id a640c23a62f3a-a8366c421b6mr174365566b.16.1723635648535;
        Wed, 14 Aug 2024 04:40:48 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bafesm162166366b.99.2024.08.14.04.40.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 04:40:47 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7ad02501c3so785076866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 04:40:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfWxmFofp25IAyvhU9lJAdEIU2PqZHEnS72qkMgy7OT+BnIBdFyMh5n6OvCtNg3V9I0fEzBmjenjkft3zHsklrIPP3XuNOPMrHN7zEzA==
X-Received: by 2002:a17:907:e285:b0:a7a:a06b:eebe with SMTP id
 a640c23a62f3a-a8366c1ef88mr189428466b.9.1723635646675; Wed, 14 Aug 2024
 04:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
 <20240813-cocci-flexarray-v6-1-de903fd8d988@chromium.org> <3352aa92-6c50-45c6-b5a7-215e359bdf0c@suse.de>
In-Reply-To: <3352aa92-6c50-45c6-b5a7-215e359bdf0c@suse.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 13:40:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCvpHoMb69=z8-Gbag+9EsO_KH5k8ickSL6NrTDy4DraAA@mail.gmail.com>
Message-ID: <CANiDSCvpHoMb69=z8-Gbag+9EsO_KH5k8ickSL6NrTDy4DraAA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] media: venus: Use flex array for hfi_session_release_buffer_pkt
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stan

On Tue, 13 Aug 2024 at 23:38, Stanimir Varbanov <svarbanov@suse.de> wrote:
>
> Hi Ricardo,
>
> On 8/13/24 15:31, Ricardo Ribalda wrote:
> > Replace the old style single element array with a flex array. We do not
> > allocate this structure, so the size change should not be an issue.
> >
> > This fixes the following cocci warning:
> > drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Could you inverse the order of the tags, please. "Signed-off-by" must be
> first and then the others.

Just sent a v7 taking care of this.

I am almost sure that I used b4 to import the tags.... Are we sure
that this is a policy that we should follow?

Regards!

>
> All patches in the series has this issue.
>
> ~Stan
>


-- 
Ricardo Ribalda

