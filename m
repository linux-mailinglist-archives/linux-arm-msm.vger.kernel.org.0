Return-Path: <linux-arm-msm+bounces-40903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A19E849A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949C1164D94
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384F1459F6;
	Sun,  8 Dec 2024 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rx1Ol5DO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA17602D
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733656087; cv=none; b=E2GLNVE+JbKB2Qk4SvXKUSpDxugoKi00akbirlqma/B2rmmVxU5LKAR6emEWW8vznhoExmN/fdW2/WalgzxNu73iAiaX3L0tggaUbAfAU8XR9gnQ/6JOmifb8b2rN737BIqwn7GpQgjzyKCVUJlNCH1H6066Z5zwtB9XWAFIGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733656087; c=relaxed/simple;
	bh=i2I5xFr43h6c0sjShesFHRb7pIhIwWji843MsGj7wy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfKu6I9YZNWyDgbzygZ5iSh9rUVqvERBcCsE1F5O3kM+3r/REJqlE2o5WLtHA67abxoYzWaXLf34uUtQjpFJ43ElZ8V8UEnWp2Soa25Xk0u2W2PzB23WIRio3rb3888GHyye1gcIINnAUXvKqFRegiQZBSknhfergw8HaaFSb4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rx1Ol5DO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401be44b58so257496e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733656083; x=1734260883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VB2+beIqVz9NLf8laV1xplvCTzTAKoRYTCewp8eMyUg=;
        b=rx1Ol5DO8Vc9OEDr5V6nr0mRLVcWR7+/czbCP0fAYifjE9rjlbLptmgBqdNEITPuPw
         91hv1S4bsKL6+sla/JRiHQbyl1lRSpxstD7hYZmq2F5OFKz6utPAd/HjoDP5CuTmo+RV
         nA/p3NH/vrz6QyQCVR6XhPhteaf9MF1UpKnqbhtiJWtX1dKQ0Lk0DtuKjvoB71q5DP8a
         Fn8nl0iv9bZA3lhqylYjrt2APDImDKrzGKGhn3cS4NKc5la53Mw9aMCjckj23agIn8T0
         ePFoBkVGEvuJPAGVDWzD8o4fsiBODcAgL+70B5HqPGv2ioxvqncbNKDwiUbBH+aXFu+M
         5aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733656083; x=1734260883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VB2+beIqVz9NLf8laV1xplvCTzTAKoRYTCewp8eMyUg=;
        b=vkFu1SwOH/3zGxUWQYGHVH7pTNV86jAu+RIZPtjGaIO7KPaM/a5K1+hdNNMCqYscLw
         /JpvpS1gDBpblLaHomwwbBl1Mq3i8wosoli1cULsdEtNDFPQamFFszuTa+XpmztlBFRJ
         aVwwE9/GizMlZUcw/UF5ndCK2Bsz+usdQj71qSbDykDrX7siMuhdlirVew/7n/SeTiwc
         N8GZn5J9Y+9WaxMf01yVzt9nfNan+hBuRCcI6+qtjQG+yHYHnZfWZQLFdiRisK9EPylS
         O3sI35xZFflUUS/L/fTHYkNpnGdZ6lS90PKyL90S0udM7euwUeL5VYGqbHOcD0DUcL3/
         UwNA==
X-Forwarded-Encrypted: i=1; AJvYcCWXaopMQruyt6/B0suNRxYCxM9KAJPaWipdSbbnPzSnW1QEXdANc0T3Vca9w41NtSIg3jiBtx8j79JF7wPr@vger.kernel.org
X-Gm-Message-State: AOJu0YyKqny0XFYKGtjCyatz6cZYjFzaoFFVBN9Tg873hsoupyNufdAn
	LHfYgCzGKe/AQmNxwGKzCCANQQNbi1aSi5lk5V7521RjQEmmOvo+s4hHrSuChbs=
X-Gm-Gg: ASbGncve7FzC/XCjBUkXe0LUf85xyd5DzNFDMtqxNR6XU8I0qj7b5AwkNx2NHs7n4gY
	dSzv9/BvjU+xwdlgqisTjtwI91BVLB5DFBliApEZAI27aPDJh65bpvVQT2hS40buM5U6ZJRDQxb
	CBeClM+UUICxKKFJYpdYCOB2CIc7XY06RBTRnweDutjSOyiO7FVsJirDozZ6P7Yhkd7eSUmKeU2
	Ipmr7iYW5peZWPWAm29fTYwBzvt1QtqApj4yK9nRvnqXXLHgPyZCGB4nz7Uve7I/dpa+Pd3X5kp
	AgJfD15S6FEWRxqhlrluKdc/5M7+Qg==
X-Google-Smtp-Source: AGHT+IEPwz/DlmKiUGnz4YB99+xhYKrQeR262SJLPjLUw84SmBKtXiKNCszuVXMjeWuRzdQf1Pt2pg==
X-Received: by 2002:a05:6512:398f:b0:53d:e4d2:bb3 with SMTP id 2adb3069b0e04-53e2c2efb94mr3986572e87.50.1733656082939;
        Sun, 08 Dec 2024 03:08:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e377f3ba3sm648212e87.187.2024.12.08.03.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:08:00 -0800 (PST)
Date: Sun, 8 Dec 2024 13:07:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 12/45] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Message-ID: <zdod6f2a6c33wbjxcw2kqg5mb3lkedmfxq47lgjxzxuul3lcsb@elka24uhxyw4>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-12-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-12-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:43PM -0800, Abhinav Kumar wrote:
> dp_bridge helpers take drm_bridge as an input and extract the
> dp_display object to be used in the dp_display module. Rather than
> doing it in a roundabout way, directly pass the dp_display object
> to these helpers so that the MST bridge can also re-use the same
> helpers.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  9 +++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 49 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     | 12 ---------
>  4 files changed, 67 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

