Return-Path: <linux-arm-msm+bounces-26188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C693167B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34241F22397
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866AD1E89C;
	Mon, 15 Jul 2024 14:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utooFV8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58118D4DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721052958; cv=none; b=KrVRfebwxhLY9NBRDmZWaQNXSR5dvauOvVYosAvBORpK0nTCeozar2yEmFbpnG9jEggW9uw8F0cgZiinY6rKG6fTEyKmapnKCD1d9Jw/inI5jnPpVdFi69XeXPeNqv37PkiFctx6z9L4h9S3tr0Z7woPqDxuQAGsp5XCqEbo2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721052958; c=relaxed/simple;
	bh=ZAMf7mb4wTC9lDvpDbVuOcf0c58BeyKwtbtakJJqNfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QP19xGhecJBnSzLMuvyeRUYkCF/KBAxK3MjIQJEhn+CKSVUJ2M/aJ1OKzKln3k1/nngThsYFZ9or+UU2bRb3lKMAvpT7OLyRd4zKdn6YBIDB2nBSzeDr+MwklsWCJv/Uapnc2qIADPLExs72EQ/s4ze4jvFtz9ZkE33KxD1iHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utooFV8z; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e04289a2536so3673724276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721052956; x=1721657756; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2wB2W0fKwhATZ+3uinQ9oRmxEy7VIVSTwoUTBV0Uek=;
        b=utooFV8zBVeAuNtI3nDT4pcmiiyYnUetBsD1Kbioj5XyfqcrJ5LVHgDwPzV6dYiAbO
         ezYOrMHjjxRSINUmiMv4FYi+KNEwFbmcjLsCmCztluFPN7Lx2g23YbV+YoUu/pRl/t7Z
         KK5wUKsz+V/dtXQ+ldEtQoZdcBkXitUMUPbObX8Ntzod1gBMzeeoEildKqmUwi911YLj
         HtUMZ/RJhiErBXilDQ/R49UW6ht0bcGjRdHdvGDwBgA9ytAQCjrdI1n9Gr1wp73mhGtU
         HVdeOJSln3D44Oy7Hzyodk6a5jy5Xp3XuZ3g2HCnCwZ7uJAQUWUAyEXDyPOwwwovJtv1
         UDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052956; x=1721657756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2wB2W0fKwhATZ+3uinQ9oRmxEy7VIVSTwoUTBV0Uek=;
        b=nkegPQKj9+59XiHqlxI1CjcVqr00z1I6bKJkfg1UD8Hs3GVc7jBEarYfZDIuI6pIKh
         6YVFNfjVBLj8z1WEVR/jpeQlXaFTZPeQLCaIi5ErVwsEugVXs/0wi8HYkGDH4IGZGuKF
         r6VZaqTTp7iDjlYANN3xqwXFERJ3LHqj5x/D/azPIq3iVC7AdUr0uNSWy3BS0irTrHwj
         EyOptMjsXK9XSqNtkRJ5pJlOrIIVTy3Ty/gR0i764E+SQEFxLO1n7EsMja2DJbVDwXHG
         N87E/itG3vc/vKnd/gsox8DuAe2kecbIPcwR8O0pwAG2wNb1/VhMLkvniuWxCy6mMQO+
         mtqg==
X-Forwarded-Encrypted: i=1; AJvYcCVp5KdMNsDzeCeoxxZaJHeciwde5N5A58LGGbY1hQ1qjxVTsdcERYxSLxPO0nDClkIAc2Jvd5f8grgfivy8gvvLW5//SEpohRgm3X38EA==
X-Gm-Message-State: AOJu0YwhRctxlipKhg2KuGeOzEf7yzYV/MAutOqekMS9o+NJi4Di5VZV
	DrBlV2o/it71ygUsUaigD/oAcejgfx1r8wN+UaE20IYWmgW9HsOeH+CEjp5PkMflaUTezve1Lp7
	3bm2X5uM1s+fiqh6NoJ8o9ftRM5wJG2c7dUkOvQ==
X-Google-Smtp-Source: AGHT+IFSnls45DRWzcf09yMhTK+spEP6tpEh1C0wOeRCIP6b5YLKMSx7ejE6MxjLgDPh49CBh90q8yIPNwxUUr37SLE=
X-Received: by 2002:a05:6902:1615:b0:e03:359a:6a54 with SMTP id
 3f1490d57ef6-e05d25e44f2mr82710276.6.1721052955898; Mon, 15 Jul 2024 07:15:55
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org> <20240715140351.olqzaiz32jpplpnx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240715140351.olqzaiz32jpplpnx@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 17:15:45 +0300
Message-ID: <CAA8EJprZ2x7tkLnOq4pyuAYqDHgt8C0EGHNbhhK7Xqve4Z+4tg@mail.gmail.com>
Subject: Re: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC subdir
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, quic_rajeshk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 17:04, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Mon, Jul 15, 2024 at 03:25:00PM +0300, Dmitry Baryshkov wrote:
> > The ZAP shader is signed and is specific for the particular SoC. As such
> > it should be put the corresponding subdir rather than the topdir.
> >
> > Move it to the subdir (like all other zap.mbn files).
>
> This need a similar change in x1e devicetree too, right? Are you
> planning to send that?

Why was the firmware name incorporated into the x1e80100.dtsi? Yes, it
needs to be dropped.

-- 
With best wishes
Dmitry

