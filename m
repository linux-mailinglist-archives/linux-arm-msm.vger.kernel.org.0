Return-Path: <linux-arm-msm+bounces-37622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077AA9C596C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 14:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B5A282575
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0461F6677;
	Tue, 12 Nov 2024 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxcwkGQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18715A85B
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731419108; cv=none; b=EFGlDCqjLk7LFEfQxLzjl8+DFzJB/xLEhTrnAfwVh2im06sNOPDIX/h6TpTlGzy1IYNpj4rw14G2jVUlLHOmWueePyxms5LVjig10PXC0/2/V4xVEIq7jxhD9ufKPzY7t/S9VaVEIyggZNpbm8XMMtdgycDSyPA4MJuMZaJWNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731419108; c=relaxed/simple;
	bh=nF71dfXw9piCIlT2j/742VJmP1SWGegOHqfZKKdLKlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okVU1Uur/ztmLXt3+mOiKa5rjapjjo//uSV29RlvVKWCLTVA6dztpeGlsXXY8wp4jfIu3keYguh8WSxYG2STz9QcUrUzFTkanQ9oPlvwOXkICFAe4Vi6ZCeH/nF6dVPnWaxVSkhG6VZT0l25XgvhfkPqJTaGBgSSwWuRxY232rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxcwkGQs; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53c78ebe580so7214417e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731419104; x=1732023904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8XhL/KO7ax4DYfSEQl2Gemn7CXDKPvYLisy0AOZrYc=;
        b=lxcwkGQs4+0XP9ra9K+anbA8sJV894bMriN4IrhuN7H0cKQD0qvVTsRNrLO/ULABnj
         n9EewOya4VEjIdaSyPis++Izc+IZVQ7w7jLKSJw1yqXABZee3Aqb8BXv8nXnpBiv60SM
         NeUDvfyn6wimaBOZS3cTjMUB5u7xExR7YnMf890XLDzSwizSDYLzUNkdf2XVL4O5BEA6
         1Oxf1hHmGtQ00pcdx85c3XWdCYf4tS6SrqCHpDrkEo5Lz888g/w9dY8AcGDh0qZtt2X7
         LTNGkVgfdtCVJ29WA25Cg8EU8xfzuqlNDyvFVq/f5Grj2PCNy4ii09zRdXj6IOri6jk3
         9mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419104; x=1732023904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8XhL/KO7ax4DYfSEQl2Gemn7CXDKPvYLisy0AOZrYc=;
        b=LJ94vnrgoI851S/IXegYuwTN6bUnP0v/9iQv1otm3BYTU8rGa3MrR/fguWdXOsXODD
         laRHBnL0PsSPQCMURUdNxN4BrtNw7tDHmIlkNZLEmmg9Voxt5gg56rls50oyojvg0jX1
         iVBeNJkwqlhHEfCUSi4tNJnB8kNdu5oTeoBaJr/WnAXBvVjkUe5ijIfE9mF9E4783BDw
         8/XvRszrKQLVN8erdES9K4CtSB16qe9yHYegYpFY8Q5fmWB7D+x0yHnE4d2E7zFaIoTb
         YiOfWkOORgqsjvDbfTEZgayBNlBoST8b07Es826APxh9lHQdRRl1fX95kK9fAFbPPHA+
         D8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXAABp66gBIEWbtP54TKzzNSkoyJyFv5G32Le21owP5YA1tKOAbAwo1uEmXdJMAG4b4d0AA9+C1s3SYgOgV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+8mM0zNV7T5v16dzd9EiPInRdJY3peEm/cCPYmqAxpbRV84gz
	+xj6X9f74SnyA8RH9Ci1To2p3ITnHurf8LlmgahwVz8Xv0yuE1R3zYBv5rKgAA4=
X-Google-Smtp-Source: AGHT+IFAwO32Ncdw+qEGZ4aWRj0mcaaHcO3uY0rwX+jAaJsbwSik56EmV6ZmRwhhKG4oqdNuqcKamA==
X-Received: by 2002:a05:6512:124f:b0:539:ea33:c01b with SMTP id 2adb3069b0e04-53d866c91d7mr5071381e87.9.1731419103995;
        Tue, 12 Nov 2024 05:45:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9c42sm1890161e87.215.2024.11.12.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 05:45:02 -0800 (PST)
Date: Tue, 12 Nov 2024 15:45:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	andersson@kernel.org, konradybcio@kernel.org, mantas@8devices.com, 
	quic_rohiagar@quicinc.com, johan+linaro@kernel.org, quic_kriskura@quicinc.com, 
	abel.vesa@linaro.org, quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 4/6] phy: qcom: qmp: Enable IPQ5424 support
Message-ID: <i6z3rplnp2awqwqlkpwwzgaweoxi5yi6jz6klveop7namcovns@q5aecu5mcb3l>
References: <20241112091355.2028018-1-quic_varada@quicinc.com>
 <20241112091355.2028018-5-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112091355.2028018-5-quic_varada@quicinc.com>

On Tue, Nov 12, 2024 at 02:43:53PM +0530, Varadarajan Narayanan wrote:
> Enable QMP USB3 phy support for IPQ5424 SoC.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

