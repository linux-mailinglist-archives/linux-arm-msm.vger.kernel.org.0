Return-Path: <linux-arm-msm+bounces-43278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D179FC248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 21:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0441648AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347AA21323F;
	Tue, 24 Dec 2024 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="it2dGhWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717E213226
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072876; cv=none; b=khgsaXpSiOjhZBO1Mcna44R2EZvI2YA4kQPCXSRaKTUdtR85t7EffbSQSadKU6fELWESDE4kzwydgmZPzE70ZevzKKGOW7OoQukp0IyTHShBwAb/wAif5iUB2AqqUOBI0M6jEw78Pg8Uzkz5A3hNJye/QKcXAFxZBflLeHwH9Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072876; c=relaxed/simple;
	bh=gJA+Xd3UrO1/NXJi2ERar0XyLaqNWgmeOkAh4qtAOh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAoCO08k8+B/pbY2nGpQQ1aWGd6jkDSr7ztpW/n7lIuu+VA1UveJEiy4sC3SJr5LwJvMKbxhJEs4jBN9b65pPpHJvVp7t448tJjyXYvv5XVTxpjtOVxslydylw1FUZNpKFCYuJRckHWthodM+3PXcf0+t4ZninUhgyqNdseCcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=it2dGhWI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b229so54926171fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 12:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735072872; x=1735677672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxdP0DwV1vvdjxVFkfCt8h2E2fTP29N8mLt/rhTucSs=;
        b=it2dGhWIM7IHQns/VUrky7/vMwnxtvWM4JF2b0pqIssTeRA13lUjVV3O/VEC+LGBx0
         WvRMsuSTUDQCBPEACQmTegLlhuWHAURVCH5QxC9h4d2717xaCN0eBwm0rY6r1eTBXts0
         rKw37IGQV4+06dLgNwAPZ01/f4Ga5RK5KaOJGp2XXY1Bw3Mibt7gjkbquw/XHlEeVPaS
         vGyb5pyMxkc9apk8kUQQKx0z5vjT+wo/nwqk3xtbbuAFtiOh6zLt+y6IQv2OKNv7IOFJ
         ab93QVJ4kN7i0QbWGVuT27y1o4hGM0bpZ1ukiZHcDpvkiblqclp7vBRkfgYpAZ3ziL2M
         tcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072872; x=1735677672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxdP0DwV1vvdjxVFkfCt8h2E2fTP29N8mLt/rhTucSs=;
        b=R4NS7sp5Eoeuq8Y9Ty0O5Y73jVC99P7p7SYKBjvGn3tet3pI93XvEkg4FNrugsHi0O
         XcJrPBk2dRboo/Nr//vbHXo0474pV9sn7LtFYoepErrnB175Ne77gGR/dTB4nJXIF8NP
         7lbp4wpawQQKh0ulSa0lqYJs+B1BQZt2Qt0tQ5G0F0wCYfOpgktjRsjRy1hy3kBwSPyg
         ZU7PtwsvnccYpABukcujFNqep6WGIPO3qwp6SlqOLdkzt/lW20UAdMRH41D1lhzIfDU+
         Y+z4I55lzOBHe8M++rlyipaZccsHMLrvF9wOdnDgSaN/T5mGk6ZPNkMbG+0DUUhIDzLh
         Ao0w==
X-Forwarded-Encrypted: i=1; AJvYcCU1uKvTTczNyx119Zpc0a7gtJ2jqSXoWqWY98BFOVl6mSQn/ivDZAXQasPmusfMcCIdQIlViSqcvpIP+5Cp@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3dQKmdtB5JI+bnvC5R+lbpPsf/5Z0dbWi8YKD8tn6oEFlPae
	JVQY4EHeRPy6dev2+LyailfHCk+BJhDXbhM68BDcHvFD8OuGF1svmGu7txfZ8jg=
X-Gm-Gg: ASbGncv6YZiECnXEBMR+OMyWlTpW/iqVaqSUNs+whc2Sq2n0TZLWJF5uLw//SAodVGZ
	WpY1Rb+2AOVeg/h/0dV551e+VbVu3id1nCWSqlYGzsi2RYGJZWLqBBi1XF+rZ35Vo629PKLv7t4
	aFtgna0eUfiNSjaUqMopbAqyLqD51RUZrEzEqd+kcLHKJS0f9Mfuc6TgXH/Mi01fXjmL1KAzx++
	2x5Efu7RlpHzHpUKaZrR0y1qyo4oor9Y2ByxmSGvTA4bP+/QQhiZuIDgaH6U9UYUbpB07We
X-Google-Smtp-Source: AGHT+IHbSFzE8H93kHj+1AlvSfiTODvTKnC9+woz5LfzDEW2hwU6oeqa+kX5d4R5Hd/NRNkq+vXYZA==
X-Received: by 2002:a05:651c:2115:b0:302:2598:de91 with SMTP id 38308e7fff4ca-304685484a2mr59824641fa.16.1735072872465;
        Tue, 24 Dec 2024 12:41:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:41:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 0/8] drm/msm/dpu: catalog corrections
Date: Tue, 24 Dec 2024 22:41:00 +0200
Message-Id: <173507275853.561903.15400337552406278875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Dec 2024 03:28:28 +0200, Dmitry Baryshkov wrote:
> After checking the DSPP units in the catalog vs the vendor devicetrees,
> link several DSPP units to the corresponding LM units. Each correction
> is submitted separately in order to be able to track and apply / skip
> them separately based on the feedback from Qualcomm. I think at this
> point only CrOS compositor actually uses CTM, so these changes do not
> need to be backported (none of the CrOS-enabled devices are touched by
> these patches).
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: provide DSPP and correct LM config for SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9a20f33495bf
[2/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ac440a31e523
[3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0986163245df
[4/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8252028092f8
[5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/42323d3c9e04
[6/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e21f9d85b053
[7/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d3ca0915aa3
[8/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3a7a4bebe0db

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

