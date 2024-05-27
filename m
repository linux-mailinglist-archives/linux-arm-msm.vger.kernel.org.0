Return-Path: <linux-arm-msm+bounces-20572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9698CFC86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF9E1C21881
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916C2763EC;
	Mon, 27 May 2024 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kngFFUnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952E69D31
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801125; cv=none; b=FggaQWkCgaWUxBJ4k8LGJ5Y3WNFocaR1Y5uWX2QKasxfgkMda391IevQuqHRidt3KKXlajZFWwqB7JFAsZEloA+jpivTtGwXJREO0G8A5ozsiLrAHGIY+E+2I/4fiElsqZeb3XrAiuQWWGvvE8udu2tOLhSPzLQ2Ihb46kmyr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801125; c=relaxed/simple;
	bh=omcsLZ7jw4cIgeKI7+pOxM3lKFlYforKOKUhCXnfXhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cm+z3TBmNiRceeiMIOArSQCvZYA/UBLjNSEJoPeNd5TtmXSol8TbNvPKjidjge5KaxR8dPcG+FF9jnzhn25RHGhRAeFs6D6cfvMKU5vC0FyzLE7vcU+gcb+y7COmIYsOZ8mRowiYpS/Bx3Rby33/R60CE+VsK5NKFrTDpkUpbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kngFFUnW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52965199234so3293376e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801122; x=1717405922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUzLCXQfyvzXsr//tlfSdUGJTNMyFZqlL5VzENiEL3M=;
        b=kngFFUnW3tKsxDCNuDr4DPB6l5UrKnG1smIeso6+uZUE1XUb2mHaT01Uy2PRPkfwKE
         hITrvqZSEmwSSSjrWvw6ixQLyEOc0gzrX+ah7qoMGCH4AQxhj6f7fmTg/ggxqED197bX
         7o4ZQbcNkhGvbkVPNdg+pBG8H8HcJ84NCYPfaj4pqXTWsWo1R24bjMWSJNsYVsVs2Mr6
         4lRFWvU+WkSifQm+TP6QEFGngwNUPk2TEIvN0lbT6kgjgO/4eWStKmwOrODIM6yHjdlt
         a6HzyYKqA1jpRwaMuOiRu+J+VdXO+jpfBqRQ6xnFdbxw23CSQX3jip4UlcH1Ex8p9Kox
         7CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801122; x=1717405922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUzLCXQfyvzXsr//tlfSdUGJTNMyFZqlL5VzENiEL3M=;
        b=DqQ2Bme75XZv93UUJP2FhOEFZBAMtxzTx78gTkB1Grg2JfwFD5GUuKRDnVzW0edmYa
         qCkkVBooDo+v2VxRYKHz7CUJftvnKLBdBWek6u5VE4PX5krFPxtyvHGvxU3Gl4Y9nmfn
         7ybWHn0TglkRppqIS0jxKyJ8D18XNPF5vLlv908QAaqrWKHUizEh/01YJvv5+A/nDlZ+
         uPdvTlQjkkB8v0OjbXMuChbfEA8gFYlERV43Qjh6Br+CIcRG+c28CqNSGqOCgGZFo/9x
         0NxuVE0SuwjRdCRhNwN0I5zCYyFmaEkOk8IxCeUZHFaBbhVJOaUPft8rXpKz6njYArbl
         tK7g==
X-Forwarded-Encrypted: i=1; AJvYcCWYM067kY4rUccDjaoWszy3xfL+guieBQnuvjfei5PAxTWDVDrZR+ISPJL7Bv1YSaSlOfDOHJzS4z9XTCBGjFSCfSqTlcSe6gUN5NqRZg==
X-Gm-Message-State: AOJu0YxiHBx2o6YNRJJqN1sNDUBmxE9owtzmpyYVrLeZnCcvx9ldgoTD
	cK1a3HncZXfTIMybYJ0RaQ8H8AaaxuF79hP0eBuWJIJGGPzGpAgzfNy4a+Zs7FQ=
X-Google-Smtp-Source: AGHT+IGZUS1FjnbDcOXz2+j+YI5pdcfqWxmUeNluNfPOnSp6/vDkxvdWPICE9xHhyGrzoIUDBj6LNg==
X-Received: by 2002:a05:6512:2395:b0:528:9d15:240e with SMTP id 2adb3069b0e04-529663e6272mr7225372e87.43.1716801121977;
        Mon, 27 May 2024 02:12:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b21dsm526727e87.173.2024.05.27.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:12:01 -0700 (PDT)
Date: Mon, 27 May 2024 12:12:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH 1/3] phy: qcom-qmp: qserdes-txrx: Add missing registers
 offsets
Message-ID: <z5niadir2squ2hxthp7t4f3eijczd26q4l5l6sk6qd4zzafiah@epcsoym66hcq>
References: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
 <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-1-be8a0b882117@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-1-be8a0b882117@linaro.org>

On Mon, May 27, 2024 at 10:20:35AM +0300, Abel Vesa wrote:
> Currently, the x1e80100 uses pure V6 register offsets for DP part of the
> combo PHY. This hasn't been an issue because external DP is not yet
> enabled on any of the boards yet. But in order to enabled it, all these

Nit: '...in order to enable it'

> new V6 N4 register offsets are needed. So add them.
> 
> Fixes: 762c3565f3c8 ("phy: qcom-qmp: qserdes-txrx: Add V6 N4 register offsets")
> Co-developed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

