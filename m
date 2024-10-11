Return-Path: <linux-arm-msm+bounces-34103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAF99A52F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E57B5288E19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DF72185B8;
	Fri, 11 Oct 2024 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbC87Zl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4828E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653783; cv=none; b=XfE5q2hqeafay5hYVNfeJ2+Gh2JzQlGUVbOfBorYt1oooKgxV76I278oKKH8caQ16xrHbtzGHAkg9aWLJyAQlEYs12tY74o/OM6h5EUejS2SoNnEVmP04elbxcbAqiRbiJe3xUzMgmJx220mxZ0A000pL0Y9kfsvzhXHi9bVXbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653783; c=relaxed/simple;
	bh=D6gOZfnGcYSVxHiFpN8NO/ZqXyxi89KGytlDAam+Z2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cl735F7FmACrhO0ZCij2ry8DYl8cNojXUzdsm7tV9x1hqPjamXTF4Dh+8yFCdLxK9BJaBUxHe+09WH3HGK9oLTlR1tp/eoWfhS3KQJhkH7tXKf97zgSS+NLdTPtBme77XkYft46R1eUosYPaTiSI+HD85wn9PTjBD653+FOrYTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbC87Zl2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso2745006e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653780; x=1729258580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16NQJIfQQN3RKWzJPPJqfkpmPdgnP/hNFrOu52tsvRQ=;
        b=EbC87Zl2SxN3p1HZxY+HRlfxeQxpVPRyL8hD1C6UOTj1Vto2XK/LpGTUmQxK2H1G9p
         NEA3p0kUFpMRnBqFSuRhnZ/gyBFnInb9YsWD7lh6x+l+y6ERVvz9ljn2v+4/fQRbOSqm
         XCE/s5yCVJ8EKuYQlEPW+t84eAmRAmxtqzOKOItC0JAX6uLHv374H3z5GpKNoFlxS6Kc
         NgfVHDRzlyynwdlSTMMB1TmyJ+gp7VNgAW0JsBqa5oO7cVP9oFdY1grdWRmjhMyvg/Or
         VH3NhgzrEyXgRMIne9XqW1UK3LNHhZ7L6cAfi52QhcUlg8GcIz8MCKiFCsTfTqXYa6XM
         Ip1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653780; x=1729258580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16NQJIfQQN3RKWzJPPJqfkpmPdgnP/hNFrOu52tsvRQ=;
        b=d5sptn3/ntIwKmK3HKgFhS7/xUWd2RKGROClG6qqlZGiYlR/alZ87QkFJOqy66+Xr9
         +TAiRCeJYnVU10WjGIKpfnGq7dzgnQ6ohioE7icRAAeoyIXC8rEPd6AeRt2XqTZvt648
         E2llvK5egiC29tb5CB+ONbeJw8nkLaYpoCFJCGgqhr4yc8g+Vqp6i2uq9vKatjAVzB1I
         duVbLg05DQNFpCWEA4EALk+8NAhhuymd1UlJjVJgjrU61OIVDW2fzwCO7sJl9JknBJB1
         tb3MtczoPMNSIUMEvvtatVS0GKkr9ZUCyf9uMnRizksO4Z/z48i/Ec3byKhF3exaObtM
         AHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGBGjgLpVmfZ5RnHEqIQvEIQtwfi4f05D73UtXJiLjmfVOXY+H/m3du7czjGW+LckDAqgOGimrO95QtPV6@vger.kernel.org
X-Gm-Message-State: AOJu0YyB927s0WNgr3I6HiM/AbiPneYfQlvqv2VdsBlBlirrja7lFWmI
	OGi4XHPk2DVLlRUSOLKMVnJcQ7u1vpSHUw0TfuOYZ5n1+v6kBMA82t20uFSRcvE=
X-Google-Smtp-Source: AGHT+IEl3rntcvnVaj6u16HUW1Qsjdsjk6hBk4pKAVJDuvo7v9gcY4KzRIeDk2gIrVO8gByUKBaGBg==
X-Received: by 2002:a05:6512:31c3:b0:539:9ee4:bab3 with SMTP id 2adb3069b0e04-539da598f02mr1638654e87.59.1728653779871;
        Fri, 11 Oct 2024 06:36:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8d8074sm608931e87.129.2024.10.11.06.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:36:19 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:36:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 10/10] remoteproc: qcom_wcnss_iris: Simplify with
 dev_err_probe()
Message-ID: <6o5takrpkgunudfqptwa7q2xbqzkldsctpiys27f2b5gkilcgr@ojqh2k4byqkb>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-10-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-10-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:18PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error and defer code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_wcnss_iris.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

