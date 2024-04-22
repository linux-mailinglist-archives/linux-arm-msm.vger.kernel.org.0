Return-Path: <linux-arm-msm+bounces-18119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B28AC47F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 08:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ED60B21228
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 06:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B40482ED;
	Mon, 22 Apr 2024 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CM8aldRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC82C481DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768804; cv=none; b=dKLQvxBsFFQchOQoMy0+V+KccOrlFlfuYMI2mmCLzZRV/aeweSiyp6lB/BoHxkVpT2phU7h3/aXG1uTiXCsHzocG8TrG2NMRm1c3BuyHAJyLuw5VZdJnvDPgwRsfnybRJcaHJxdQ8lv438mnUsMDtMdXK71qMoW0Y9vvpjF4pCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768804; c=relaxed/simple;
	bh=WyWHeoU/Ff7umbOe8XQrl/qZdNdvHSjb9SSotewTso8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXOcguJJ+RPu48gRp6qoCs01UgR/7JK8icVMaSPZkm6HLwaQhsCn4HksiQrmrsi/Zr1egIrd92/AkSgjV0uhSb28Xji9dnJ1OOoLb9tV+ztjLAmlupcjn9F6BQaWAKXXMBmB2C2fKZOSDLC/sKiRwTHmcV0Vu/yQyh656l72Ecc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CM8aldRN; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6eb55942409so2108843a34.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713768802; x=1714373602; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=CM8aldRNf4VEvlSnIswE87tScwARnc8V2v2S9HnOHR9lV5LbQ5Q37kx6VQsIxSUsmx
         dWHRnzPVpaSDOxiJLNM/d77+UtCN4FNulPgRWjMKAaQhXAr3Jt2ZNjOwqOFskY8P9kmU
         9p+AS8x1pBSKdXhahR7FoZBKOe298davQZncA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768802; x=1714373602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=C3ZLx5PZP83VKpeRqWCsgBMyAAaZk6So/s+umKBi8BknlVm6pd+fJH/YZ8WuD8/t9D
         C6zicfUhTr92nTVmqqy/6JuI3AGLtrRGon7jIubFQL8oPcGDOO15qBq1aSIEChmyO46r
         mZvnH8C88X/OIce+VYhYAD3ej5NsU2LOX4wyUw8C0gxuUcFGprIjEUOBkq/xkBbFSNr/
         7teHYpF+zrIKkDm5Dd0ZW663KY5mJFFGa4u0xq6uNV5EY1V9iootlAl059pYyaDhHKTE
         Qvei9P/fqfJQ+40yqVQPRvn9FMqsw1ycYbAjW/maBtSK68ZhzCHQLA9GTMhiXNFWCfEX
         aSvg==
X-Forwarded-Encrypted: i=1; AJvYcCWX2uTX9PsVH5A+o/Fd+YA/6nPhAZ4i4BNKgTiFEUpEtVvNnZ/4qqxnFUhiV4kqct885jxj1Wqo82frR61NwFRozuwSGxc4AwbxipNS4w==
X-Gm-Message-State: AOJu0Ywj4PnZBPoj/d3RhOj4ueZIs7kYS3fqhQruezPz3L3LtU+vdfIm
	Yvzpo9PWNzBVqsOYqWpbUK4viOrYCRIMEHdbPqK8w8nPkoSDU2/632N00IE6FhUtZcsdJsRk6RR
	SoA==
X-Google-Smtp-Source: AGHT+IH5qaeIUeG7FLJ7TSGMglc5YZWsyNjuVQphSsagNGLThbdH+oPNU9O2A/63zMxG3WjRloofmQ==
X-Received: by 2002:a05:6871:520a:b0:22e:9125:380b with SMTP id ht10-20020a056871520a00b0022e9125380bmr11685805oac.7.1713768801820;
        Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id vq5-20020a056871a08500b0023952f980ebsm1237638oab.58.2024.04.21.23.53.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ed06982819so853428a34.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSkquKBUB3XrU8KeyXak+s9C58cNTHCI3uPHXJO8/ul4wmuHMrjnUIHoM1nuStSIsbmGUxRtn5sprzB8HflcAuhF1zihI8nrJ14B2RaA==
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org> <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda

