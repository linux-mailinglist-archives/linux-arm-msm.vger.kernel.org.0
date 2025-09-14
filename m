Return-Path: <linux-arm-msm+bounces-73422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79714B56856
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 14:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8FB8189E0A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 12:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA292522B5;
	Sun, 14 Sep 2025 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUeAnkDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05DA261588
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851722; cv=none; b=Gl8kH4tcPOKzXN9bV19sgbE4otA66iG4euvbcWJLfUB+bUx1gfDSwXH3S+x7zh8JBQM+7OttQS6+ckhZOnC67QWrgNCDqwpicrt+ia21ienlPfThFS6qgHV7BwZtsJGZbzhcuQU1IXHhEHbqbTOs1CfZc6atzNhX//ABHEwkIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851722; c=relaxed/simple;
	bh=/vAVhu/ngR4yHd05XqGLRzyRf/JzOKMB5L/10fK0Kk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QivdxamIqZXfPEcZAl4DBoy4jbQ91Z/KQeVJ0unjgHe/h33bVOW49T86jPGrdF4CcnmK10koWhOkzcJUJyX3icrdhNcR5JyU9LoSJUd6qGE3eiQNZPXxJieO9P7doeAzFeVsOx7h171j4Ive1RWXYvJqo70jFTlVdRQEIN5SmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUeAnkDJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
	b=FUeAnkDJW2mk8y1fOisF489Z0IOpfqgbpu9XulN49RNI288zmCFbSBfrEfRjRpKAZ5tK44
	7S/gQlysYWIHns+MG2wcxt9+q3ixxGadaflWsIYiKMs7qVeMvsM0b8LrcdYK46TWPA8Mgn
	GU8DJINiIk3yZCr1VyN3F7dsLXU/Lvs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-ST0-cId-PKmnpB3hRiRsuA-1; Sun, 14 Sep 2025 08:08:39 -0400
X-MC-Unique: ST0-cId-PKmnpB3hRiRsuA-1
X-Mimecast-MFC-AGG-ID: ST0-cId-PKmnpB3hRiRsuA_1757851718
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-81312a26ea3so906250585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851718; x=1758456518;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
        b=tEOxgFM1i3YPMiuox0cd1Jr2bdfNdxedcdTeWvLoCNR5HpFTckyBPT2oSGnrjGM0gA
         8QKKsK5oSGM+iLArIPvsFNcHjeSuP0m20f3pQxbn2erwjNqFONN6JeDRE3PxeFgmXnqK
         0NIETGeMumN2LtS4LsOKgQmxIIZuNTMHe2krsi/35O5fN7cl3sqStQVbHpout+esHd3C
         l7UlvI4tFHP1rZ2p/v6P+vXXowexoHE6Nei0Hv7gBHJa4Sh6FqHdSjis2ZnatTVqg/Yh
         nSzMcbFfUhM15WdcKBhyA0km5mmoPjrsXktKtk+Ei9SXyD3xZHVRvARsk4oW32FAJil3
         qW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUBUUPnzv3S4kZCQaMS/KpjDVa0ENOYd29vKBVAzmP+fGnSUKVBWTd1PW8vja7hgvqqB9erFx59JbhDXB1q@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJ1DUBD9lL88mhGvMnUJGbo/gcz6u5FlJWLmQgzefg8hSF7YE
	VWw6VHFNhjGwOU3YP1Vr2XzfJynbkKylf6ieiOgQ6cCcSFU+O8mM8tLk7orGw5z9XIe2Rdw4LJu
	UbABw9Cy9tE6i0p2mtXTIIxpCe+//cDHCQD2tkrQLSAvIOGRx+Eq1PB+vFAckrdKIcSw=
X-Gm-Gg: ASbGnctf/nVz0WthIcmWxokkQW/QODSo10UGmv9WI9L5nBNXiq3j2h4tP6/nVG8YSO6
	obr1kDVgDdR4YtuEdUHpVK4DRuAEt+dYBEikd5eIejYz+X6CiSBNV7ihT/nNNxLahiR86KcaMYy
	jbUa8S6oRw/TH4a2fNniqq6x5xlIe+BB8hnfe7/ZtqVBygfXdxh6ZHoLkXqkRgWT0ekHTGcYSqy
	D8UJOoFyMGmKlr8iBsQrFfDunHjQfVn2g4++7j0D2NlzX8NSHn7zO3FfqQDR5iBNRqkwLjEbEu9
	rJkb6s/bqx+JtrWtQd2Ekcu/MXZROTni+lz+EKyVr+PIDZN2W/AtUiyytp/rXL67zyTTAzPUIBx
	kx5jPUVAcdl/yDHi4OUcWhG4t0+y+M8o=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036168985a.69.1757851718243;
        Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778;
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian


