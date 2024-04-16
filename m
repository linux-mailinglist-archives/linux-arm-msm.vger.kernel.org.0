Return-Path: <linux-arm-msm+bounces-17546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4708A6282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 06:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B59921F221CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2F137153;
	Tue, 16 Apr 2024 04:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QA+XMZEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552B171D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 04:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242493; cv=none; b=WG04lOqFHo/ua1h9m4YrVXOSG2TWjFaAVloKcRMFPUPXH5jcU2HZR9CBjU5j/zSsfKdG9XGlTAYocj5vBIMO4hwVS7VIlC4uYFVIdR+LOydG1THM32Hlj95Sz+cIcWT+orfAs7CY/hGUkYJMgheSpFci1QTJHQ8R5gbDlroRsqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242493; c=relaxed/simple;
	bh=DqDyd4MpI+rvYMYAT3Ft5xs95IMJydJhHOHuJjyBxW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPbY9i7b0NYgOJOCirJ49oR/xn6/+uXcJBKZSuNZjNtjIfoGZ7hiMENDQMMmTjQNJ/+IW9pDUm7B0A7Ta/A4bGglLNGXNLo9LDElbjL0M35vLlgy1wbugVVsOFAnJzrg+susjv0iADBvxWkaN9U0e9m1SLcQKYJqw7ZyTPx+fLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QA+XMZEQ; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c38eced701so1612249b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242490; x=1713847290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=QA+XMZEQ4TSKlDwKnkstTwNqATtBiFbsIwW6mmZH78ughkAzpgyenMvV1Lpd/vMyHP
         7NTsFHch3jvOiJ+obKYa+FzwWUXuVaEChF4zTRRV/GQklNftpHjFe/lFZUezfns1dkt4
         k677k7WQs69PISiVPzIYtOUUow0YCd559kxZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242490; x=1713847290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
        b=oKbocXHrFkY1w1il/bKDi+cSArEFznev6227Kl3UnREASXw18JJok4gRDuMZNryKq7
         iX4b0w7NcLXSXULo6WjFGAa3cin/jRrDwsoAWv/qDVFpG+TZk1zlIRxfH5vzgyYFGndQ
         9YvXVOp6iR29j5/C2JeOTPCiBaXuqFrasQWc/VwNjeFzXO4kIpQbga52OgdvMVE2nNez
         pIhiFTH5qxw3U1iuZ9KeaCimmSgZxqG3ViVJYxhyvNZrueDEDWqT3Hi4bXe8/I6rRQ3r
         kstwD7AXzneoEn3fXU2AMm6KeCY+uRA+AsXlru70sFi5WZTQ9Z956gWQaDF3ijPXpwTn
         Nggw==
X-Forwarded-Encrypted: i=1; AJvYcCXyIsYFbxseNFPieroaIBSPoisDKMuLUAidCErN3MeA9SuXXBLpkU+of0aHib7/UxmaNdgHmUNpQjYxmaA6u1enfdI6i2GGKW/dmCLiPw==
X-Gm-Message-State: AOJu0YwtBre96jOVqtY747CKGRC3FASGoyRhi4kxnq4kt7bn75wa/5pa
	+sZd1TLWCPD+UJc90zdtZNvvZRGCp1WCtM9lAHAd8li0jIveg9eqNodFu1tf5w==
X-Google-Smtp-Source: AGHT+IFGNPBipDIE0AiNQc/Cqlxd5431Vef5ObfevA6hF44fnzurKBxD1B4lS2oVTJREu9b1YFAdCg==
X-Received: by 2002:a05:6870:89a4:b0:22d:fcf9:bd97 with SMTP id f36-20020a05687089a400b0022dfcf9bd97mr15408827oaq.26.1713242490147;
        Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id r4-20020a056a00216400b006edd05e3751sm8284703pff.176.2024.04.15.21.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:41:29 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:41:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
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
Subject: Re: [PATCH 04/35] media: uvcvideo: Use max() macro
Message-ID: <20240416044119.GB14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>

On (24/04/15 19:34), Ricardo Ribalda wrote:
> It makes the code slightly more clear and makes cocci incredibly happy:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

