Return-Path: <linux-arm-msm+bounces-59656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12EAC6341
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8BDD167C59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 07:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9C524503C;
	Wed, 28 May 2025 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3CA8d9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B31205AA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748418285; cv=none; b=oO0wBH1S2nb8yYIqBdiV/qkLtoinMqqV4UiQuGyW5reZ0/eyrazYpKcQsyPb3GhWSqZ9aFQDDCVamOWqyEZ7nbq3ZykhkY74aJTRKFTd9XH6LBc0V9XiGnmG7iWB434cYwaVlv3zENMJzQvsasfVZim1m0gVlJNdHjAiSdj3IPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748418285; c=relaxed/simple;
	bh=9n0cPJV+g+yarXV9zmLs6fR1CGDsXbBKFs5PKVOvzX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBwtnNUfM67UeR4jGT0sE/kl7TjX8vT25DqcxGVju/tG8QeEZhSjEXcSVnKI6C9KlxlKkBN4v34kmuNT8y1ya8hF7M3CjR/Bt6DXKARBh4zt21M4NNnrwTgZRqDtgHx4sRcoarSoIh01D2QTCHvgTM2FW1FxbBosZ9A8aNecq/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3CA8d9E; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso44612985e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748418281; x=1749023081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCAzjCL4Bl6CH02UvykJmrP16J+tWlFWZGvoCIzzt7U=;
        b=R3CA8d9EK0zyietaYcN++gt5HGPpzFv1JD5ABNjJk3oHFpjslnQXmxjpQQS6GjvHTW
         81H2MVjfNiXXZpZa4gMXwFxxPO3jCUr1QdNJIFWfNfGf5+AX7pd7XOWtAG2MSjfmCbvq
         lownUMvsWFu8h2NtbnVke4leOTgrlt/7RkB1QwdIO468S1xdz83OL6i5TKiHaCZH5MVT
         slTbFLsFDZSup7Tlp0tk6SQRwoRMqXXp/Yx3b4z1r+Aoa5m3kLGECKyf1TthW+MzF6JU
         G7knqzShOf4js/1jXwLWDF/hHfuWlf5Ij2wcZUq4PQnNqUUJqAWTpPMpzuKSMHvtsD57
         neyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748418281; x=1749023081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCAzjCL4Bl6CH02UvykJmrP16J+tWlFWZGvoCIzzt7U=;
        b=X6P/XhCFzBdJmqzQKSdqUbdQp3ldLHW3Ntyu8FFwoC/0/mPmLUieUE2ol1YwNJclFL
         eUnnM+y8cnq1vR3gQ+pp7WM6hymDtlyuiAqYBb3RpMy8M2VXV1Zic/zwaq4kDlm7kowR
         vxnkMo2Q46D6zf8LyNQykKHe3JfdFgKBAkwpa8vH816/ZcAfl5unxz2kMlURraIB2VaF
         9K+5hc6GA29TgVRkHIaEFcM2W9gH5yOJ921x8h+5WkBoh/o29MekJTtYGf/XvysThzJA
         fDS6aoNTNuqrRC2d8uTgd7VwVLTpYnh9gc8ny/BzHkah2ZXIzaGSWtprWs43vLmljiOS
         X08Q==
X-Forwarded-Encrypted: i=1; AJvYcCVf48ppeoeg9lJvPfl4h8E5s/RkitlyOd2sIIa8C1IksRiU0p2TEtDFd8rITG3Mr4JHH05AD2GXyZ7tdBaf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zzf9wuHXmMLRKzswN9ioKQhhHa0EtdYUfYxAyJ2qvVsLpGCA
	Q93+49rXG/ztaO/z9jkCsoYH29ngReMn0GI6g63UvK+PJa6Brni53DAZXi+kdaSkOKw=
X-Gm-Gg: ASbGncu5N6G9lA4jd7T4w10i7rRuyd98aBphFFYq5Dy3PryjCFXb4CJIGMQsMAM/QPn
	yCbOcvr0df0JBi46AClRjQvzIUx9x30rzmYO3zHjHacZt5d6rDqu50o0DP55sfyoa/gjCcfJJsg
	rCA5zDomRj/4TXn+UMil+mEjLaBmJtjaHWPtDkOhEM2aazajIKQPKBJ1D7y2AYWQ0OOHYlmhdzb
	elZNemU4dgrAa3kVnhepqIAGtrcdafvmF/KIjTbD4E/jZFxE32xQO4mkQ+jmfrgDn3Y/xd9RDyI
	3qXVa6e4wyGxtIi7Cb1mMy0H4+bPvvY/Gp00MUneDEd0fnkS
X-Google-Smtp-Source: AGHT+IE/iUqPKQrG7bwzgJBp3KKnYuDmJ/JAmKt65e94C4RB9c06whWy8YwNSu/XTnIj1izcf15HNw==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-44c91dd158bmr145314685e9.17.1748418281526;
        Wed, 28 May 2025 00:44:41 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064a1246sm12549605e9.10.2025.05.28.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:44:40 -0700 (PDT)
Date: Wed, 28 May 2025 10:44:39 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add interconnect to primary
 USB3 controller
Message-ID: <aDa+57zCFSOXyYY7@linaro.org>
References: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>

On 25-05-27 21:26:17, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems to have been omitted during the initial bringup.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

