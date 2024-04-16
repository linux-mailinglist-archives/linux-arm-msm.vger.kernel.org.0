Return-Path: <linux-arm-msm+bounces-17567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CAA8A6589
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 09:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00C21F213D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F96084FD8;
	Tue, 16 Apr 2024 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIEkOSM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8359582C8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713254238; cv=none; b=sB70b1H3y5tkCz2k6O5EFkx86EKE6QkhpMeOdNvZxf1a53c5UlGZafNIHytPhUglxL7/npiEhZNMPo6U6ZmQle75pUzDmk83VZ2n2ZY/UxBC2Wc6UJiPGmYEtxEg80VJYA9iSk3qKFNaHqlJyxZ0/a2/WFqHYTwvw+5u1b+DtUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713254238; c=relaxed/simple;
	bh=b31AnnXrNGswz4m57sykrNwwz1aACR/ovPuykzmKvow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tv/byyrTelm1wpPkc70HHKsIuWngoYIPzmt6r7c9miAQte9cwjwK0w/2uNBDvX1bxFXfT3r8QR8q+GmCxggUdWVt2MPighSKucypepg6KwWRmVxsYnOi1ikYfJMDGsaIV4vDOELI/4bqR+iFpY6T6Bb5Sli0SEHlbJFUppmWIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIEkOSM5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e37503115so3206754a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713254235; x=1713859035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=OIEkOSM5ePfdV18t6jNa2q93+wLvXdg9wV7xyj+EZ772MbyC9XQlHYWLGz3jZE8lqo
         bCx7ul7n5JJMxjAlusJFs4SAcVy+48luPD/PkhjjwtgUhU00yegB7P/Zufg9mmJZMp9N
         5KvxmqqfRdfJhckbitc4rW3OyY4uNJfN/JorJU51CntrqbhAT+PKXAlzU07IURAvbxu0
         Ljt5V0MUOiuFIBE/ADKFxwGqt/QBD1vEj4d/e6v0U6rp7ySNOFGUfBDg+8p8O74Q19dC
         drebSh5SGSCr8b2YaDx9ocD7qODVDUtKUDiPfDNz8G2kQsli4AodUE01lFHlWrujY5du
         f7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713254235; x=1713859035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=fB4v9txu1XxhFsEfyC6vSP/IDSMBO4VLbwUpP/WLm+j1gmhY7rmbIJoW3Psb5NKGMo
         cgApVwG2t5mV4BVhledMm/5A9KbSd5YWHlAJdHsUelH7TkNrYb9SuCDBtSD+uvgnzzwt
         sPvd3FMjEu2++e2wYXWcZQRR2Ki5z5wGFMFSep5C1RtPXbhGGRpvRCbQDVVaZFNlhLzp
         zJ2pfO3nIbdxpTEwuSw0VrpYg6bAETOYuRLISBCwUmM8ACaCPlyh3Z/r8Wz08nAlQP4+
         8wmWRTIha15tSPdpB9msRMeEXeUA1vPyaLP6pjbHklSMxrsCdD1ixrRjWN2FP51iAfiY
         ue8g==
X-Forwarded-Encrypted: i=1; AJvYcCW014Hb/iDUtLMwOjQRUOpKaOt0ox028xG0jaMp1wpAdYJhovO1KL53CkRpAdtBx84qUw/1l4CPAs/yqyzArCL6rQa+8xXd4NtIJs++AA==
X-Gm-Message-State: AOJu0Yx7eZZE92OAkf/e3nRa64DKOfwdg1nOO8TeJO2Zsy7UZh6W7uqW
	tAFrmbfeLaD7W0mwMxWx3SP8swOTF3EIQhaOkD99PkAnehIxKbgDSlTUjdKhK58=
X-Google-Smtp-Source: AGHT+IFmYom8ca5REWXBouKNnF3JyRoh/X3BZipPWdBTLAjIHlxGuqZNeTPobNF+ISHRPd4L/JQwdg==
X-Received: by 2002:a17:907:764c:b0:a52:57ad:63d0 with SMTP id kj12-20020a170907764c00b00a5257ad63d0mr4228551ejc.20.1713254234712;
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kf20-20020a17090776d400b00a51e9b299b9sm6444928ejc.55.2024.04.16.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
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
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Subject: Re: [PATCH 21/35] media: venus: Use div64_u64
Message-ID: <99b220ad-79e4-4920-9e90-6cd6a3349bb3@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:38PM +0000, Ricardo Ribalda wrote:
> us_per_frame does not fit in 32 bits. Use the appropriate div function.
> 

Really?  It's less than one frame per second?

regards,
dan carpenter



