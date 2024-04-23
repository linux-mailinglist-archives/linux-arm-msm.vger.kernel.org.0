Return-Path: <linux-arm-msm+bounces-18308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BDA8AE7FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 15:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505F41F22346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360CC135A64;
	Tue, 23 Apr 2024 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbPk0RTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F44E135A40
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878540; cv=none; b=NdDDIRnikPZPXqpPsJ4Dh/P7PIVI+LFmS6AG9cO3LKI37FSqwVbg8Me9/mT9w/6RcGfEcYgS7bfLDEn8FzHWtCpwj18WHJI5oqnAl/+6AgbQ8pqv3S1b5NMg0XMZqpkECvGGYxci5rGAfP6ihPzg+VgwUSNbPRdw5mK07BFGvvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878540; c=relaxed/simple;
	bh=Hv++gcciHk78PNTCIv/A2iJfPJVk4iYqFyoESE4aYIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNjGTNt/tVFf8+Nzz4aEa74VtN+RrwGSiklUZ+G6BTRYW78ksEONl5+8fHFCckH90/si6I6NcaWkamI5yjv+2dPiPPbeKErDIxd3D996gZtMh9xe8EaTkssv2uGa57baWnph2+4MJ8lg2dJUdC8Vy3SmYVPhFNcYFJG9Mop1dnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbPk0RTL; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so6059949a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878537; x=1714483337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
        b=dbPk0RTLhSMQennpZ+/MswXVIM4JaPN9JZ/ZbACybcnJyBB/VA+19qmg6ckl97z9VG
         ofLPJIOJawEon/WREHrik5gKIxXKyqlP2ZqbrO5gxFhgmVMxwA2rlGz0R42vLIxwsek+
         SilmKi0X7LwPTHx7w/RLiJ8JbStXJnPFIOgDUpaJJC9wYEulokrBJFujAQiyqh5rPwIz
         3RSr/TPXiGBs5Jc2V8xsLTljtQUsSjRgIpwxOdAZDKxtqPdQv882oE4Ni8G3eslFjAHR
         U2GRFjoX3o++RfACiDsAV5UIddF511L28FLim7k373+ok2gLoPhXzWnh6JLG9d8W1QKE
         vQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878537; x=1714483337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
        b=fK/voe7VQmnAjjzVcCc5K57bbkl/hbSVX3s9l32rOCi6jLmLjjMUnkzjrYa0XjSo2C
         GOc2+qQr7DFAmUyJN2PLNPtb+OagJulxkdOvqyt7K8cyk4fLiGflOx51aaU9sZnuWGn2
         C6+4D84s35D0VixNyULRypO6ENmgH5EXTFWIYKmXFZ9cbx/APRqDm60SJKaCXlbMBLDJ
         K4mlAZFp8NgyQ6B9y8bkTlnfPNSXU7GAWhzBEd9MuTJPLIE8Q1FkDZUv5UmSIX7I7erk
         5yZSl3+xOz8415xIt2oXsCxvZyYlz/jPSfmR0fpXYgjIzhivu3gW4+tDXLNSkyKwMkKy
         xwfw==
X-Forwarded-Encrypted: i=1; AJvYcCWTtyK0OaIikRxXEg/tAqlkkkEbFZxEKX1YTxwH0zzp1wQKagnFjuRF8R/dKvSR2Ing5i+L1sx1p9tiukiaXN0yaolNvKqrFhmKDF0ESQ==
X-Gm-Message-State: AOJu0Yw8MxHKUhP8WKLDhhCTdM+bBL7XQ/t0ASANDPn7I/BFsNy9c3Nj
	B/GIo8wJM5ek9wsizK/lT2VkWdVS6RPTw8wGUb0c0A8MrOcQZhBLox4WctBCBvc=
X-Google-Smtp-Source: AGHT+IFQefJU7h8rb4dkLhhIb7FlpFabv8pybeKyFHMNkkIFmzd0O8xUj7u39jSEp0mSnynBk1GipQ==
X-Received: by 2002:a17:907:1115:b0:a58:7ea5:c49b with SMTP id qu21-20020a170907111500b00a587ea5c49bmr1872927ejb.42.1713878536780;
        Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w23-20020a170907271700b00a556f2f18d6sm6980541ejk.57.2024.04.23.06.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
Message-ID: <cf050593-44c2-4b4b-8198-215455c630f9@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
 <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>

On Tue, Apr 23, 2024 at 01:43:49PM +0100, Bryan O'Donoghue wrote:
> On 15/04/2024 20:34, Ricardo Ribalda wrote:
> > Use an API that resembles more the actual use of num_channels.
> > 
> > Found by cocci:
> > drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> > drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.
> 
> Hmm, that commit log needs more detail.
> 
> "Convert from atomic_t to refcount_t because refcount_t has memory ordering
> guarantees which atomic does not, hence the WARNING for the free after the
> atomic dec."
> 

The memory ordering rules are the same.  They're basically identical.
The difference is that if you decrement a refcount_t past zero it will
trigger an error and refuse but atomic_t will merrily keep decrementing
forever.  With refcount_t you can still have a use after free bug but
afterward the double free will trigger a warning.

There are time where people use atomic_t to get unique number and don't
care about wrapping so that's fine.  But if it's reference counting then
use refcount_t.

There wouldn't be a Fixes tag in this case, because hopefully it's just
hardenning and not a bugfix.

regards,
dan carpenter

