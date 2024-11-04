Return-Path: <linux-arm-msm+bounces-36911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9FB9BB26A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4B6A1F2121B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3B31EB9E9;
	Mon,  4 Nov 2024 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehvVF8Ab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A71EB9EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717705; cv=none; b=kTzIjAedTJYVVc4eeBZeGUlq9dxvRJNn04+cFaWJdvGYhIdlny2UU9RcpLDBoyitg0oXEpG5BfZYoBtc7FGQEebf678H16NUILcZU3bOyEPf+JffSQb1BjGtANTODXSK2tKx9u4Tf4mi1xrO731k5rWRsxCcJZ9Q+jB3Ng6e/VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717705; c=relaxed/simple;
	bh=I9OiWUCyKv2i9D1CwAcyraCsNGRc6/tNnnnAMUwXakI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB19jJkKZ3TSSZCvPOi8vr1PLANhuXXQRai46ceUyaqWYhCJiSmvEMrjSo8gsw3H5cGzx8IAKWdzAovlCcuH4Elrz1h3bHxqC6GlqXxPJLey4E6p24Q06rpOzXT5tG6XXSj5PXXfc4cMCoWJiZMDV+pShZtTDzoIWwi1dHY/WyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehvVF8Ab; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53a0c160b94so4470790e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730717701; x=1731322501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=upe7MW1samf6eEWvfqgJG4VdfRS5tGsncnrDJbr4CFw=;
        b=ehvVF8Abiyfq0cgPrRjJP2WUEJidSxnLx2yAPiqikwx+hPBxsxdzyGtv9WwnfHNIvJ
         AWm4yO2A2GufN+3Jk5qRQTHTb2NM5PV1oNp2W0PwRfJaLzUQ0RpOFXyznX3LE6kLknzs
         8M1rKwTD7XEd8AZQfsuwruJzbFJBm3o1/Cx0b+lyxWruJAoyx1YIHb+ZOqoZmvezyIiS
         YNtsm22wD0i/NE5IbBSjStg6eYgnoi8MRYlHtuBNioStR7C9jc0Oc8ZqQHtwF2044rku
         J6OTEPJuVupVxKl2JU8hSQT4XubuPSlM/r35HoCjYYPOlU+i1Bp7HruFsjrZ5x6UVpx7
         Pv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717701; x=1731322501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upe7MW1samf6eEWvfqgJG4VdfRS5tGsncnrDJbr4CFw=;
        b=ng2QHLKV9VW1Hsje6vkowaV0piVs3UdcG+LnLJq7cWsm+f7fSbS8yazHgVOs9EL8Y/
         6GiAhKJQ9K8xN1F7Zec4uUEI0OdYtXMWbq67mFLF2/qiwtigicvuTQnnj92AXKZeXTCS
         eUVc58h9vMTRnd5YLKih3fAfRkIJJ+zNSme9jyQEkHx0bi517Dhv64Wo6WF+8778aZ2A
         yyQ9ihgfOr8Qw5LSIQMs48/BmCB5O8zOcsEQfGstlBS9yw34fplAtwzJ4O1/vd/6+bbi
         8NsLML2uXuvkooMDlb4C5aGfP9huafCk1yIet257TNuFtVnph6c/Z28PR4sDrtJpV/vt
         FycA==
X-Forwarded-Encrypted: i=1; AJvYcCXSYOYKd7MYBKngWh06bP3g/7+qN4IkQlCvC8GcGF9KTxe0jCzy/kA78sF07jm3K2ArdEO3LEOmcnNH62/O@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXUX6GyUQyKXb0qnLm1goQS8yYh69Wq87f7hCc/ITNo/xxGKr
	AGUrLNRyDetts5oPXZNc7iVwuzkPab3UDTWtmvyxYjB74OwVggiyi///l0ype4x+yOOq+LxgLav
	MaaM=
X-Google-Smtp-Source: AGHT+IHUBwMeOaPmp1xgOzS0MycFuKWOfrs4hmJDzT6l2IQ76clWN20uWq7MD2t7TvXn3CfLtTD79Q==
X-Received: by 2002:a05:6512:6cd:b0:536:52ed:a23f with SMTP id 2adb3069b0e04-53d65d945a9mr5861120e87.0.1730717700730;
        Mon, 04 Nov 2024 02:55:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc96136sm1631523e87.10.2024.11.04.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:54:59 -0800 (PST)
Date: Mon, 4 Nov 2024 12:54:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] soc: qcom: rmtfs: constify rmtfs_class
Message-ID: <c2agcw3hnwknxtsp5al4bfyjlzauyrz6d43imcbagp2wm5rmrd@y3t5kmbxuxgo>
References: <20241014130303.123394-1-brgl@bgdev.pl>
 <20241014130303.123394-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014130303.123394-2-brgl@bgdev.pl>

On Mon, Oct 14, 2024 at 03:03:03PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The rmtfs class object is never modified and can be made constant.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/rmtfs_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

