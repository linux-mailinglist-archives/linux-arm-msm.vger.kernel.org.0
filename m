Return-Path: <linux-arm-msm+bounces-77315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BABDD0BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E192352837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4378431327D;
	Wed, 15 Oct 2025 07:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoUOpIzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41E313E1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512957; cv=none; b=VYpysq1lwr5Lrr5EgXias+uUPGZKWIg0avfvm55jDDpDQxGcRktlWK/3yHczrmLfUT+6/19r68n0XOXtLBTiLNHufYQt5zs0tHQgmpFjBRYSGTD2FZTO3KMFtNgNAfSdF8+k9nMKifHjgyW0kBGg1sUNpPscob1Uygy0sLiby10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512957; c=relaxed/simple;
	bh=0VJRnfC9n6Sgwi/8S393WIjXh2WBrAMTy+hehdyv2SY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=trRKFjHuu3kPwQ7uhSDNHOfAPNqdvZk+5CUabftBJBxT6shPmaKCqLLtfwrFqcP+aF8X3u5Qx0mC4MAFEv7jflzEXYgpThHaQI915w0zhcaENrep+YOaRlxMKapauWCnB6oQvxhjtnHeCcMpOuV5f5Xl8/DMH93Wy7IQYxKNZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoUOpIzE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso37953055e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760512953; x=1761117753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPcOIJjAqivuI68Wr991lCzvZe9U95/X4cXzOMjHBFM=;
        b=MoUOpIzElO8jQxBvwcgAf1UpDn0bu2jrLg+gInAMroNIEJjGOwF5VVajYTVM/nXk6r
         FyvxtYhGQltT1GY++mtgjcumkmIR9K2QFePZNOZLCfmOCnOIVv2fP8XY/2Czn02ci80r
         2vImecCDFgBbbN+J8UbyDxwndxJDr/iQx8vzd4Rw/jVydysKFYs1yDd51AEjQWM8tPvP
         Bq3JH4Ebhz24ILbzbbGfoU7NLBmMGnMXAOZd24/9KWzFQ4qJd5eC65vNSOV6lnr6Vv1A
         wgKL/oli99B9wmgl8a8RN67evfU071xvQhVTEisJBz6U3liXM9Ujz/LE9Ec9Vholl3N+
         d2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760512953; x=1761117753;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPcOIJjAqivuI68Wr991lCzvZe9U95/X4cXzOMjHBFM=;
        b=r+JlPhz/4eHSZY8Ye4fhmIVSuvOjZ8h1GW8DWAK5leVq3sPDzdujP7ug93u4CXS1SO
         XP2iKAJHzAAby85BXf0Q3GiYdRzbphx/aKyc2uyZManK/6Qu0Wl6vZikuWBriRUkbT2y
         mWU+pFkwIzOHme8YHoNDJykT4sARsl5GP86KfNOSAFqjj6sXfPn8uK8o5z/LbDy29bHG
         XJjEyKQaEnFBeWVm5Im8M9wzHUoQTbr9Bz712taxKhF044VvZn7lFFSTHDfHk8RJmVFP
         2nPe2tu1TZO4mFe1MgccR0BiAGQKZhldBhqeG8HrBvWrp0rrZwc1cu/HB7h11Qk6Ty12
         mUDg==
X-Forwarded-Encrypted: i=1; AJvYcCVllMsgPVr9yPff5GbrHuUfci8RQIQ7l2KDQ4KY5cYJabhIchDzjtVvj8SrjfDwHPvBbnngjJcmBea2bQmG@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGqz7QAcJQLDZz0Dwt6M5X3ryXWT4kyTzzCNW2vSg36H5em4N
	foy8DHFMJiTDP2Xm+BCw7Ig5uh7gMeSOn6uwIy/JPxOjwm3Kec2UC3GLcFNktoADxy4=
X-Gm-Gg: ASbGnctQlsMUUIYXNSOq/I/e5bC44tMoyyujuBil70yWzeABNbuXwEoObUYevJKKDva
	1Vi2bwsdwWEQmz7yfRfN9CEvtQDnSXGdEwYUHKHGoqiIRgVTjOI93wwjGoYM6sM0QwKsKBOxXRw
	6TbSBKTNf29rcKDDIfLeUsRT1eiDJgqV/mGwlNbV8YjYUxHNDGJ+SS+VwzphQEn3HIoAEAMhLYh
	6IoAJk1J/Q7hXKi92SJzpJtYrgvbCY326VUlRGv3JV20ECgQPKQC6gpvgJhKFlCMZhDgyVMC7WN
	TyeO+u0KRdCeFsrhjxzKKQpdNlI/PTdlnkMrWE45EuULwT5+zX1k4/l2h59YgbkvKvuodfVd73/
	LWJhMRuKsZRNfbxxx59xPdGB2CYnXoct4CXL5vOHOjHLJTa2/0aC3uIuEUCNpzptwMw==
X-Google-Smtp-Source: AGHT+IH3BD5WhA7FG6Zp4c0PVdvEcLCxk34zjohYVpVCAm31anzYKVfvwlaIYZ0XuSu0KRWu7NkXdw==
X-Received: by 2002:a05:6000:2dc9:b0:425:7e38:a09e with SMTP id ffacd0b85a97d-42666ac2d01mr15689229f8f.2.1760512953270;
        Wed, 15 Oct 2025 00:22:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d4bbsm27804930f8f.2.2025.10.15.00.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 00:22:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-Id: <176051295262.2274368.18317625493336873860.b4-ty@linaro.org>
Date: Wed, 15 Oct 2025 09:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 02 Oct 2025 16:57:35 -0700, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] MAINTAINERS: Update Jessica Zhang's email address
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b076ed3017529ec528f2f28b8f37242a6a29a4b0

-- 
Neil


