Return-Path: <linux-arm-msm+bounces-38085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA319CF65B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 21:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C431F209A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 20:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C5A1D63E0;
	Fri, 15 Nov 2024 20:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4vbMYJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46B153800
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731703783; cv=none; b=ijwM1XDjvc12epW86/05K0Xu6YtA5mdla+WFzWTj9Mn1cFJgXnikkMsKn51LZdgPUqdwMag9rEm0TjBzCQpqp0JpD8oSGvUAV2mzzpMXYvzRESb2Q5sPofDcyLazuAvuNsCK/4tai1KZmTATCAfq1wEv0zcBU7xrkLgOH0BU10M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731703783; c=relaxed/simple;
	bh=wCqpy51QFTJAUw9DssWd0FEM1AkBOeMV4Pd0fnFJ9pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnM7OwtZYnWr3TUqs8Q39j0wtuxh72rAasfhXXsb7usH9Bm2WSFUVpjXqlJlF1l03cHOy8E4eP4HJGXNYSni8AdKikFcW044CCFjiaZDEcIWpVCWgQ8q2K9bW/t6N8LrqNFhICJ1V+dQfRGMwdZcTT3bgJi9XbsUeOPrQsEQBpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4vbMYJY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5111747cso12053131fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 12:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731703779; x=1732308579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjYoXr1c/e18FI2TdM2K5pasMyhee97taoyWD1KNeJE=;
        b=Z4vbMYJYiQFfNWOl9MgftjDFHmhYf4z5Xa46SmqzrVd6TjKelaXEZKwLVEpxl7GMMT
         ISacNxipuUqWoYkCtCDAOpBMofXEelMMBvo4QFWbnomz3jB5pl4AnK/raU3GMVihxZA4
         s23fFAjCI7fHal3JHY4ZtcMj/qdQt5nMTgdosZiuZrgaqWag4c5OA7dYJMYpKNVhcB4L
         gFfOV+6cpqbHQUodvgKr4GzUvaIFDnvsr4dT6qJzKFxjwdLPrNot+OVdbL/gfikqhTDL
         p2+TSVJWSdt1X3snzb/XNrkulcGs4BuytNyk4FiZxMi5IJLYwNPHMxYGAbmPufh8AnsR
         9ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731703779; x=1732308579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjYoXr1c/e18FI2TdM2K5pasMyhee97taoyWD1KNeJE=;
        b=shemkOOYT6NsAYI9Hdy4pV0PTxGLDcAYDfGP0hAmF+eYt3oNBPnCcvIBKCFetDSi+O
         mxX+a656p6YIjTxeayazXKAnYztoQc550F6kt0ow03VFwjZKo4uuPwmmDXXzgNY2zw72
         TwjtXVgC8hZ9/wwZN+SxTXJ1ZEBQSWW7+vuZAZEjix/9jzjD1jGG/YbRlW19BBGwQBTi
         cZ+1TkZh+n81H8I2sY6H4rjOy6Ep2rJAen9P4x17v5puVgbJog9xb73y7CMtpWuUSMLv
         5yqZPAeVHPUrkWmemANR1XaNMII+JWcvMLk+i9JaIP8VZHKE5Rxi+wSk181ZwkETBE+j
         tjvA==
X-Forwarded-Encrypted: i=1; AJvYcCVXYVYxD+e6KC3SBI2xcSGxr8OYPlwe8mPAbkOiYASevqn3rGZYgyeeMxsY+ATGMrtbs065X2QGPdqUJawf@vger.kernel.org
X-Gm-Message-State: AOJu0YyPfzD2G2eaWi0HSS+CbLNJL0AmX5Yt3ec0efWIGW8+Kpx2ogc8
	Gd2uf91R8aWFLHNErmd7kGFOdORhJ/TzNSKhLP13giDggvEZPDRad04JdNz+nLo=
X-Google-Smtp-Source: AGHT+IHDw1nSJp6JrS4UrDhL1uYX+VrsqdWEdSsG7SMPlrb85ao1TsV+hOPLPValyHydklEGSDOhZg==
X-Received: by 2002:a05:651c:12c8:b0:2fb:8920:99c6 with SMTP id 38308e7fff4ca-2ff606944f8mr26665191fa.23.1731703779420;
        Fri, 15 Nov 2024 12:49:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff6995980bsm229991fa.41.2024.11.15.12.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 12:49:38 -0800 (PST)
Date: Fri, 15 Nov 2024 22:49:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/5] phy: qcom-qmp-pcie: add dual lane PHY support for
 QCS8300
Message-ID: <vfl3mvq7wn5f4ke2df3hsdd65cmhb6lw4kbzpharo75ufzmayt@e4w76fjipy2m>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-3-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114095409.2682558-3-quic_ziyuzhan@quicinc.com>

On Thu, Nov 14, 2024 at 05:54:06PM +0800, Ziyue Zhang wrote:
> The PCIe Gen4x2 PHY for qcs8300 has a lot of difference with sa8775p.
> So the qcs8300_qmp_gen4x2_pcie_rx_alt_tbl for qcs8300 is added.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 89 ++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

