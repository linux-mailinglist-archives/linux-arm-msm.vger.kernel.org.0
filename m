Return-Path: <linux-arm-msm+bounces-34098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7299A51D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4B31C25C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55948218D90;
	Fri, 11 Oct 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WwbaJb1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE4218D81
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653501; cv=none; b=dvETkbds391wutdLU0zP2xnG8+IZMJJ5VExn0VgTXACfeg06DwvTFRHa6DlnL2484pn4txVBBAyIy6R970OW1ymvPw6eA3cGWj0ThseSZTOSmn1FKA8kuK1mAMVAKN/o0MQH3p1anqMSr4Uw6dxS2oLHnjsolfRw9bc5XvbBvHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653501; c=relaxed/simple;
	bh=j/wtLlxySXlF9gYSMdXWCVsVjV+CFdAyaQrF3V57TB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REE/rCk8/4jrON3FZwU0jDPPIOTlyV2HlqvbdBeq8RFZmZcPJK2bSE6Yl/hXLXb2QStwuLndh+zCBbsHU8H/Fn39yo1H5WrEU4GkT0orNVMxy8Yn8mOa1kJJCuJdvVT43Fa7hl55P5kMq/jAeqmC8gb3JspvDsxrd1zU9X4C7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WwbaJb1O; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-537a399e06dso2369093e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653496; x=1729258296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIlPR/9Tg3tHHscVFQyLHlaqdkpPPKNYkKjRrr77Miw=;
        b=WwbaJb1OgXlDq6wMML81xjqw/G+6Z02zHXiKi6eGVqeTDdFGP9y7yNr6vfWzwD+Cco
         QdYsEVC92NupffUtcSRF/g3OkKDBHx4X9I7hHmHv3qy5QmZH10oBwaXZvhqu2ltXvojX
         sUo7CcFbXl9dHGvHDNoEVUN2XK8Sgaw2PcDUDz/T29q3tIdPiNHntw0GJ9nL+hQwOPkh
         OaHCQJ8QAD6l0ZiolvEZ6xfsc6VfXRMCYPSSKc3TgYskdJg5baN/beofAw2oj+Re349Q
         IwHR2XlcO7a+AlA4QzkaorpCIlPmrHfPg3WKdZxMSDFZwIy3LcQKLyO7xdIJSHQDaX2Y
         +9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653496; x=1729258296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIlPR/9Tg3tHHscVFQyLHlaqdkpPPKNYkKjRrr77Miw=;
        b=Oq2NlK1wyoQu1vYJ1Dcfvgk//UndKVobawY6lW+JF+WjfTTZrZrVFGVGJU4orKjIRK
         6d2s4ZKKDq11L5AxCKbxR31f8jxeofUYUabOT5WBCTIy/Tgr5gEHuNYMtH8EediUXcKB
         GsvXwXiLZhYrrCdus+jgQzanZTBMK0T0I1LpB469vjV/C0d1noh5fI8Cs9YuN3FwT9Dl
         HR4hTkOAyC0v6QkMS7J68eGvUpF7fas4Q3uIjQmO39R0lTQzheGir7enZWaHh+MRT9c/
         rUfCI42CTtBplGQ2g5Fgbl5XwT8hCgOdcudQOZr0CmdxZnkBbO+jNOx87mVgcc85HgBv
         rBgg==
X-Forwarded-Encrypted: i=1; AJvYcCVkCxGGe4wFV2Oqqf0eJgTdZb4qwzs5hapUVF3Wr2XEU0ePkcQ5B62UBfHqNMVMz96P/gGBIJB3P//yKPIv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzojxu98WBycbWm5ZBthsO4Q/gDUVmbgZvmvw6TLF2mGdlUhMzB
	zr1y7O93YsILwkyT8q62x8aFW90srtFb+iy/0CccUX90n3p0rEDM7eK8qxOkkSM=
X-Google-Smtp-Source: AGHT+IER+2T7o5roEOHdG2VzoyGI9V0OMobx4hMMs/g1LQaHCUTDYumSlr4X5UmhEj8PNLhbkOKQYw==
X-Received: by 2002:a05:6512:33ce:b0:538:9eb8:c4a2 with SMTP id 2adb3069b0e04-539da3c1dc0mr1463370e87.6.1728653496446;
        Fri, 11 Oct 2024 06:31:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f0f9csm604503e87.189.2024.10.11.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:31:35 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:31:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 05/10] remoteproc: qcom_q6v5_adsp: Simplify with
 dev_err_probe()
Message-ID: <qqocjewtt57shpscam4vkixsvnj5f2rjqlbek3mbzn34qzdyxu@6pqultmfonpg>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-5-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-5-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:13PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error and defer code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_adsp.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

