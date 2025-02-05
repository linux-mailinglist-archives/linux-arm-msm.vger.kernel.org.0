Return-Path: <linux-arm-msm+bounces-46963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A707AA297C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EE623A8358
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 17:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14AF1FC0F3;
	Wed,  5 Feb 2025 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgw6onVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27961FC0EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777136; cv=none; b=GviR9AWejsWV2UKPQZPGAHnnR1kiDBVDc8moCXJh2a2fBwYcTp6k+5j4NVvVsIL8eSID5lsEThntip16qPLEXo4z9Xn/pLIHLz3Z/mW+nC82sO4NfCa5oODEWsdJIyrW59QysP8JLM18RL6yUC1d/Ag/DJe5pd8WGvFobx8B5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777136; c=relaxed/simple;
	bh=Kvc5/xmDAHo8EKHzJMF7ZIaC6WdeduGVQTHNkKPxNlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFiQn2C8enH9zKeqo6VmEezmjidVVQguLdw+QhcFqOIOZycISpuSuJeBFX5ljAf2MTMFHa/QpWy8RQVts5ZY56u/iy8xelQB1yDVAEW3T/ODKpVn74r0RdNJz61zbjW7RGajbuXguKGm1l2hVvpK/j8ytNrHWi7NpdudhwPvrpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgw6onVF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so21603e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738777132; x=1739381932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=;
        b=dgw6onVF8iN4YBXofneoRRK2Y0mUC/JZ3ci9iWAp5GWieuygwE+JGxU9qig5f7dM7Q
         JkVip1qMLWmPW4RpEC0whT4yS4JdNKoflfJvKnU3+ByBYJ+FIpKshMuckGqukTiky2fE
         eHboi0fppXpsuu04juZ7nV6LeUZGJIQAj0aRyU0QTB+hql9jIlezGHAgnNvICHXUDyF6
         HOQ/YSqVUMvLDlkdzeXoSjLs3D01D6TjA9GPTp+AeWrj9bMypnyFeUDclKMG5W9cY11z
         HNkZrVmj0aEdQmE0paKXNvQRrgmI3nrtdYwpQ4zXzEiIa5P79I+CUp39X6W9RlelxP3w
         E/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777132; x=1739381932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=;
        b=ZRIxw2Vn+Y0yWX7b9HyybwUkOg8f9mgDVYeQT9Bibv1HdEzdjF4z7+h+89uVa/CWME
         nR3g25TMr1NoZ5DAOXfMNKJWwHiBIUOPrA0vFrAlytCfavDjY7nxMJXMYsMHa/EvFs5c
         H8kGM70Wtbn/gBzWQQq+eoKKwq6ESGZuxcFQf9OGAhmJJJqP033bLv2ktn1c4pQe5O3h
         OeVYT34vOC+5I1Y5lpoasAKi2Nf616cODYrcOunyU6ielxMS6dAjRm1cDMaGsc1ctRD5
         E/9u0j9b1T01zqs1KaJe3bDbhCa0gT7f9+HcYgQIDU8zxzpGFH3gq43zMVgAv26hgJmt
         0IVA==
X-Forwarded-Encrypted: i=1; AJvYcCUz1OGqN3qaBo9EP3k/9bTtJh2L1iMVFb3Nese+VWd0HowOCoqThuvNEigvwL6Lk5ktCLxk/d+mpm+6MIq2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqc4oBKNEmK8D9CArWCj/V/Q4ED6gelp5Uwxy2kLoKg70raYZ0
	2iwBsO19AjxD3Wz2OhkiRK6MDw+KLLFSZ9NfwGkzyrueoRZRJxtZUPNcA9rJQUR9EnUvE2BPr0Z
	ItOQ=
X-Gm-Gg: ASbGncvX9FXNDaPuL02OKM7RlmzmCmEYqGInNxhUtTno5cg5WCsXZczlu+DJKH09xTl
	BqyYKzzQu/qrTKy4gMqA5XxnPiVVTLBe90KIz0Pw/aT86h303sWUMVdziPYxi9rmc7++xOFvwQD
	WniNxQZJZ/1p75SIcJ+Ef0mAhkErEWvAtOsyY2Ant78tAwdPyaSbU0pRLBV7NQQFSsG7NGv90Sf
	UaBdMNqatL6fYM9FWVhm2K50Pp8ME0dP3RPLmnDq/dQtVauV4lT8qWFL9nqwqUPtinb/1tg5Wcy
	RABwq9gbW6UNwRh6NUNS73U+popLkCsD8O8EQuUHbpVbPswkx2SEctfUzYQyCI/leSAjRDs=
X-Google-Smtp-Source: AGHT+IETBVaXE6/Hg/OAT2lyPqdN8RSfx4v6Dzg3uyMndgNxU8DF8p1w15OIVOZl+cK1Wc6eHyojOg==
X-Received: by 2002:a05:6512:2398:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-54405a71ddamr1396452e87.48.1738777131942;
        Wed, 05 Feb 2025 09:38:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5440dab6676sm21872e87.100.2025.02.05.09.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:38:50 -0800 (PST)
Date: Wed, 5 Feb 2025 19:38:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
Message-ID: <6l2temp4jz7laqvl4pgmo5hfdujzjar2ksrgdafkchul6mldv3@ygzwntmosahf>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>

On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
> NAK this.

Josh, having ack from both MSM and ath11k, I think this now can be
merged. Thank you Bjorn and Jeff!

> 
> Compatibility links are added to follow the names in the existing DTs for the
> QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
> those is fine, I can drop those link.
> 
> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:
> 
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                |   7 +++++++
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn

-- 
With best wishes
Dmitry

