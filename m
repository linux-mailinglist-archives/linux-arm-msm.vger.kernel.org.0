Return-Path: <linux-arm-msm+bounces-14750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3AD8859FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 14:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917021C217F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 13:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE0B84A45;
	Thu, 21 Mar 2024 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQSi3vn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0644784A3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711028052; cv=none; b=otH25wHXlPBPiPsWcyYFuUhOCZ6GJmvkyb9MIuFYXNvXb+Cmei4Ag8XfQTpg0CSKE/x1RO1/9ACkzw5Q51lOBaZLo+u+Ag7QMYGfIr8dqvwXC8bde1aGN8wZlof6dyFEJygfu2cXNrka8jWtg3RpBRCsxfcxBDAhaFOm7kjYhPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711028052; c=relaxed/simple;
	bh=4rGCuazBqIHOXvtaI7Wo0zKZRsaUt8SJwAl/0Nh+JqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDJymaq7mh9Abis35p7zSZRqCGLkIcPZ558zdiioi5N46fZhlgWPqehowgCgvX1jCOnx/yCK+2X9EKFO7iykL9ADGJHuiqK5upPphJqdrdyzJlN9w8Apl2ut0Lb9Z53x9r2tgn2rifkhIMX5QRpAPRNPP9hrOGQ5XrRyMhxHRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQSi3vn9; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso729043276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711028049; x=1711632849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7bxt9nrUotSd041Jk9I1N2RXEe6VR/TERlrPfMUlBo=;
        b=nQSi3vn9h0FL9kh8bQkPn9T1yNjHOzCo5t9fjNdr17TTF7fHN5v30Nlu9IJHmw9fly
         Cy7MegFn3QHB6an27Y0mqPN2xq7CLocQPdLWTAkHnbEoQIgAyGScU7XQ6Bp3Byq+Ulhc
         +M6UGsE8y9MztGW7usVFo9u9XVWy57gF9GD96St8ZAIJzGJiL/2A3sxT6iy6Xo8KVosG
         4Lz6wiwWW3Utrn+bpJd/IU0nKK5Bg/QfJVRwVjNV4UFbrT1XqvGNcc76iP3kIFUD6dUy
         CB+i4SiU4XDHhLESM5U0fuNTG8epRi6SG4tzs8vhXtpDY+hPcnHoV3KMxXEcM11BS8i1
         H4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711028049; x=1711632849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7bxt9nrUotSd041Jk9I1N2RXEe6VR/TERlrPfMUlBo=;
        b=WXtx9B2duSbsq8kwcoJCWW1MyKiCqhFYG4zT0M0XapmRV0EaMUUJXvv1ihuCOGkJEE
         FB6y77PjLGlQ9hH93qFpv+NQXSXHPalbr3kYDOS455F7emaQp6uAxXvKuIEoOScrmjoT
         3VBK48apWl0lhHZdPTItmmjbPILlFTL4uFoWoTjbSvFu8dJWTEkVH2nP4fdgBi+130cE
         8EoxoAOsVtIu6oHqHOOHSoNSk9QBBOXFAleSgXgPSCgYN8C8E20Sb8lQ6fl9aSLala5y
         JymJMg1+i+GcdZkO48Z0frKa05pGzjfO+w8SQEhskX9Fia5IBrf8y/ayHn5RT0M2nnb/
         VmNA==
X-Forwarded-Encrypted: i=1; AJvYcCVhZh9Oow9dCQZVyqmDdgKPoxsOQeQITbRJ3k6DZppvMaJy7hnnZ28Q2vMQpD+ImJMgSOTqyFB9Fk1KPhDHLcXn3fq5+4CIdlUxo97Tcg==
X-Gm-Message-State: AOJu0YzMl0dxYP6FvxTnpluqd7dvMq2rttExnUifKcyCg/6AKgiAkqaH
	NyZR3ddh8Pcj5yXAf2K3SOo3UPG+YOjW3Yu09BwFNti9gm0aQfhWiYdauVNJW32TEWjpcTMZ1Pi
	bvjlwjWwZSv0/XjbbYSmejnVBO6YV0N7Sw5/hQQ==
X-Google-Smtp-Source: AGHT+IEMV70cy2lfVctFclzg46XTHw7b9TCUBAofP7jsI4yCoZ9ytwZlQ3WAG5PxiT1bzKqOtfrpUpK2FbkGF4MjIas=
X-Received: by 2002:a05:6902:2305:b0:dcd:24b6:1aee with SMTP id
 do5-20020a056902230500b00dcd24b61aeemr9277695ybb.47.1711028049057; Thu, 21
 Mar 2024 06:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-2-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-2-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 15:33:57 +0200
Message-ID: <CAA8EJpqqDBQTLmrit33n5XoqVOP05Ts=C5xLr2qOwhPSA8rMuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: qcom: apss-ipq-pll: move Huayra register map
 to 'clk_alpha_pll_regs'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> Move the locally defined Huayra register map to 'clk_alpha_pll_regs'
> in order to allow using that by other drivers, like the clk-cbf-8996.
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>  - rework the patch as requested by Dmitry Baryshkov by moving the register
>    map into clk-alpha-pll.c instead of keeping that locally
>  - Link to v1: https://lore.kernel.org/r/20240318-apss-ipq-pll-cleanup-v1-2-52f795429d5d@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c  | 20 +-------------------
>  drivers/clk/qcom/clk-alpha-pll.c | 10 ++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  1 +
>  3 files changed, 12 insertions(+), 19 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

