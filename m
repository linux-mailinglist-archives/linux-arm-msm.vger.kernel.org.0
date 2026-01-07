Return-Path: <linux-arm-msm+bounces-87763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746CCFBF22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4015A30031AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AC023F294;
	Wed,  7 Jan 2026 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyLJ+Civ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78BF239E60
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760088; cv=none; b=D2a0z6mY13FQsLP004PPjjsftSWB0cB9QvcRY/oUdrnxCgQnfL5kD+RgOEgkf2MKsEUpSZG+ld4PueLlQ7AXrhN2mL7QzhmoqWL06i0CMP0Qsq4YXWIqLGsHhBaZ0uEUgWzz9aFZyOzoD+TPUEvCDjpCrgFiDf9fTh2QYmR04/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760088; c=relaxed/simple;
	bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr/g4o3ndciNx9DVayx0AUyeHol4q01n3x67Uy0R66iI3rR8qddpSUqb3ZfypS1mdElpI/BoP9B+CMFPihtlEXahmeuEOZM8uCUH/Rp8bkaAlzkBF+CUAiGAIYNLEtzy1juH5grEANcs/DMsk3hByJd2yS/zfwoQbsPqlpyBjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyLJ+Civ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee257e56aaso6057531cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760083; x=1768364883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
        b=KyLJ+CivbXZtxvCp8TF/x8Sev5yuK/HFr9tUIpwDrj7CKceBHqz4UD1skJzvjzBKRA
         7KeoTys6IH9TyhDXY1nz2JnggQuzNo9T4pAuRTsdFdyA7gH4dsP79Du5DNhM6LlWjNfr
         3yAjPMvVtlGWFCaCIAr5E5b4lN3/x5br9HusnNiQ6l1Mr6ljc39/ABNKWPOyaItuXAjU
         Xqv4fQruvD0cQX4PSGabVvwEq/azJfXiQhguv/wkZoS3Q+8EYnM6liAC3DD+xdeSEtDw
         ibsOy+3qTg62AErYoWV5GWSfo3LQZ3WEK1bkuvI5MJrK8K6ScmCCTEMZREpNylk4TUY8
         NZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760083; x=1768364883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
        b=Ja30MH4UcjbaH7l5B1ERJP+iEdQcumIDlcuIC9xOTWRMnwSIj1jYAi7SwV451iXY9n
         G32+zEusHdfKpwqKU2cTiVmW0glNl3uj1o8bO7tBzrK/Sv94srf5+BIv2XI+1w+xiOgq
         Fb7Xr9iEIeaTpUTsXO/CasbbIZIfpkuWbhmGsS0sBCQkiNKoiiiscojObViZEtSGYDaX
         lRBRvz5RUMEbj1Uxl8HLFd7ewKmOePa7Zdgczt5gPyzJdsp6XqYxtsZEAoogcBSkOY30
         GAppOi/woBrjDFLg+3VHOK4nLGEwSZEBBizfsIeKL+yvZv2pM/ByrP38KCcnJTMFvmAE
         Uc0w==
X-Forwarded-Encrypted: i=1; AJvYcCX642oCpbv6FM25jITUisfAXb2zV5H805QoSgz+667Mm4C+OtyGwkID0SnY+bGhV0f0RCDQVegG4O/XT94t@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqa/QpRxwGxFD0G2EbjKoIxT4mM6Cz+NSLU4dUsBre2Q15BrxG
	ah7Mc6Tfgd65DixNqRFCPtOP/bHqH27moUnHgLbe5Bm3+4eBTXQXrn5J
X-Gm-Gg: AY/fxX4TLFDt5y/3nn5A110+LSbIRXnA5UQwGRhbNhL8GyTrQHTWbtO6gz0NqXdR98T
	6CqHXfuW1RVBpvNtF/FcpCKQrtaNyZID7v8oLlQcfSDr1ZQoU03okyAyrWuWkQ8GAqTCagUz2wK
	czYPSAEHdse+sSfCxo0BCtSujWitgm80loZtiXlCBkB3Jcu/iuBZntJdmesyB/q8xkA5yQXTCp7
	06nfta2hooDWImZn3TYV/cHyzxu1n8o1833pUnIjJO8R9FMOWEHBpuGkxjLddLMDFN60sdi6hmH
	NF0mu0sCu7ZbZ9Ld71GmWvjq1OTwHpgjr+YXB8bfoy2rRpwZUpBDtJD6jsBzTM0upu51kx+Wr1t
	AKdkiR1FSorOIN37wKeJQT/FeISdDydLXW7jw3WcBzbwvIfj5hM78ssYa1oizKLnJ7D+NAKuWz3
	rgYwMyyOqcgT7E5Q==
X-Google-Smtp-Source: AGHT+IHnQfsj1iawjyhOVxIptrkGxNIYYfdvLPM+KbPfYJZ1Sz8qmIQNy0qNULXQA+Vaduz8APOYjw==
X-Received: by 2002:ac8:5984:0:b0:4ee:17d8:b583 with SMTP id d75a77b69052e-4ffa84d51bbmr67296861cf.27.1767760083612;
        Tue, 06 Jan 2026 20:28:03 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce985sm26075736d6.11.2026.01.06.20.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:28:03 -0800 (PST)
Date: Tue, 6 Jan 2026 23:28:24 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] media: i2c: IMX355 for the Pixel 3a
Message-ID: <aV3g6NT2JiLX6ELd@rdacayan>
References: <20260107042451.92048-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107042451.92048-1-mailingradian@gmail.com>

On Tue, Jan 06, 2026 at 11:24:46PM -0500, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.

Oops, I need to resend this. This version is empty with no real patches.

