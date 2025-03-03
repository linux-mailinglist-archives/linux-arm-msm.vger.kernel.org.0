Return-Path: <linux-arm-msm+bounces-49967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D893CA4B82C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 08:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CEF17A259A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 07:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF041E835C;
	Mon,  3 Mar 2025 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lo5jZC3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572013D539
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986053; cv=none; b=L8Pbe9jr8H5EzLxbH7Owq4mWnkCTWaLE4LIHiS+lXwEzZxQWsl5bUYbu7fr1zlZ6GKY0CWn/swsAo9bqYsFzFoeOWt+Q84RREfQnyZ1gHPlFL1UKjFeP3RxStsuCHtaQTVwTSHIQiZzWeZvI7cXQknRbC8MBExgaqWC7FyJTwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986053; c=relaxed/simple;
	bh=Hln+g5OCHrAMOq/+1aDVAlOsgByEM+bWM9zySDltuR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoQpIrJbbMDVC5zU9jv/rKJ791X7cZWQkYAlpRj2n6iwsY2NGyK1BTgIxo5c9IDWpI/twTIMalKsaWeyBgqxTWS1J6wckC+ha1yZKztwfDQSED72wX8TlqRRXykUtVg7zVos4teeMRqUmuUg4aVrWnVGfYPVRS5/99JrvT/MOSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lo5jZC3i; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abf5f4e82caso237935566b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Mar 2025 23:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740986050; x=1741590850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
        b=lo5jZC3iAcg9TiASEN+02v8tjNCnIVO65YHcjQRfQveoHu178Vz4pycEF2VX+IMf1N
         qVjKOMdtBeG1S5LjTzJrESdeRo8xG0RwJnTyUMV5NV3DfAMSh3hUdACUGlxF7uuqzvuV
         q1Mtm38cTmfNA3U0vbvUKUONHRBoOI+RDB4J73PWf+7ikbFfIAZVliX3S3ZJh/uBpSfQ
         csU6x/97ZIR9KzXPZ6JMwqWZjeT8NFz6VqvWxH2fplDnXAOIEVAtR3CtiAiscZUsdZ9n
         zwSBDpFAFoxZ3XJYliPKS/+AjC0Fs1eROjFVnqa1BAmBdok7E+48ekfPKMlPham2XFXA
         aRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986050; x=1741590850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
        b=X46qDbB33SUPjmy+j5wM+hUZrLnXDGm3FTs4IlvWK1OMj5TGcZdMY1neWRLBueB6fy
         6a/8mVpG8OLNbQvs5Mf4u2r1ogh0rlaSgm8Kwm7GMAdtKa6mttPrD6x8T2wWSxXKKdNW
         5AYP2GPtVn2ah2EhknvR75LTtXbyb1rj57PuNcq2lq4+kXqD3SlKY/ntzKSdC0G8tTmi
         jfKJOxkTx+5aMT2Av1GMQtpJ7nCobA4FGuFzrCKVyFfo8Sw2StsBvPooMyHFI3h1ARLT
         gFy6HTT1KILgXxsQGze9YYuOa6298jh6bE2d3junr8gT2wzTeLAb0BWnZn86S6mIdmN/
         ih3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUPbs8UkIPSKBsqi/Elzx8YL01HTCHM2cRQB2fBhDdCzw8nml9lEJDOB98FArWWRsKPyxyppY+A7QVf/U5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8d1ITCCWEkoKQ8u28bWkWx365wQaukDpqZseVyiMbsKa2b0tL
	Yp4bmD+ByufagzAqtJaN14U6ySC1EeGwWYQrbNExzAq3wQPP9p4Oi+h/QY7FZwo=
X-Gm-Gg: ASbGncsLVidq094wVgkQVy6pH9IKZ8XPvTo8FwaDOWyaxQ4syuTOrpKCIjj6+pExydQ
	c/Xqc1XsAD2aWWtYQ96EDSMUuAiqQjCPTanDDsp9kRRaQfJVHQkE4mWmUyCD+gKhS4Qbncnsw2B
	TfTKswqT4i17yEy4EXKCPmsuWO/oza0U3FLpDOCf2fCsF0dY27fFu5pTJFM2aCIGa1tGgUysAus
	l50RheQ1H0pzyFlGgtY2U5U8oAMw6X2NK/VXYn7K9hOiB6IljmPyL785I/wq7PFopA1VLpg3BBP
	aMk6X1lC3OXWfJ+uKa7l3gnCHvzkaXd7AoynuHB+UU/40eI08w==
X-Google-Smtp-Source: AGHT+IEny668UimPZ3R6dx4axvviTs297S1IJ5VK/kkx2SxfpDGI4c5Rl/7By42IdqNYV74cMm4sFA==
X-Received: by 2002:a17:907:980e:b0:ab7:b250:aaa with SMTP id a640c23a62f3a-abf2682f996mr1554838466b.54.1740986050266;
        Sun, 02 Mar 2025 23:14:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac1dd6fd870sm60633966b.70.2025.03.02.23.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:14:09 -0800 (PST)
Date: Mon, 3 Mar 2025 10:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>

On Mon, Mar 03, 2025 at 01:01:40AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 11 Apr 2023 18:24:24 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> > 
> > Thus avoid the risk for undefined behaviour by removing extra
> > initialisations for the variable “c” (also because it was already
> > reassigned with the same value behind this pointer check).

There is no undefined behavior here.

> > 
> > This issue was detected by using the Coccinelle software.
> 
> Please don't send resends and/or new iterations in response to your
> previous patchsets. Otherwise they have a pretty high chance to be
> ignored by the maintainers. Use a fresh git-send-email command to send
> new patchset.
> 
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

Remove the Fixes tag.  This patch is fine as a clean up.

> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

regards,
dan carpenter


