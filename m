Return-Path: <linux-arm-msm+bounces-31722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4391097801A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 14:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED1641F214E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCBF1DA107;
	Fri, 13 Sep 2024 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oN2eFRy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8931D88D3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230936; cv=none; b=db6RDjS/AYP5G+reoqLZJuk/dVyUy6qk0lH7dQ175NEoiK+YnPcuU+DQIA+8dvfgShM9VgzCTJ+ZkHhDywuIvrg1lA1BQpfFzm97wG46jdFV9/AtwzI5/6LyB9NlGD/7EG78SvpNEzXRk05Pp3r6xu1ZGv+vF+agoxfrd4YZ6MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230936; c=relaxed/simple;
	bh=NGVS6Vkg7fpBgm/3lXqRIBdPrwPvuSL5IBSeL5/syf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvVxjxXW4kaQ4mxtxT7KlNaEY/Jehq5YwqIAJcUvVdmojW+5zbHN++EzCLVqmUM2L6NNlJHRZpb098JBL5PsJJkGEV5LS3M2DmG69KUBOUUwBo8djceTW3Gji8Hm1vkhVct1/PlSW78iT1gtPpllh5sHkmQYpBSZQ81ExqsdAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oN2eFRy8; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso1457942e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726230933; x=1726835733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjJZ4X98ntqTWPk6LArQGhPHBOzVXOE82z4DS0YRyYA=;
        b=oN2eFRy8QpsAIIMaglmdaQWbp+Ts9+sHMfaj+S3n8Exo7hykZB4dzgG/caI+5M0tk9
         o9Psa4HxYJRqA18wV0MR5+JQQsL4mPjRrbjiMauSM8TaTR8B50P403tomKiq2Qk6uBVD
         RPjopaxiljNA3GQ7/WGjHz/vyUQCgB41vJVmg4/WuY8w4AAZY+VgDtzRZEjNdZRB3p3/
         cqFntOFo022nXAys66IHuWzQTOfQpmRaMfkTCVFQMm1tJFFbb5ItjhZRtszCNjZUgU1V
         aLd1jMqigGPWhAKcq90GT2koN2jQRlXZaHjd0RxBg98Jx3YmapCk7X1Q6IwmFtGvC0HE
         vBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726230933; x=1726835733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjJZ4X98ntqTWPk6LArQGhPHBOzVXOE82z4DS0YRyYA=;
        b=DU+o7StwH8X22JtH7Z4ChFkqBhUABlqnJQoGN9QcL5UMqDNnqz2QIY9hVxmnHIFNqk
         6LsYYLXFE1Ycwu5npfmstdoJ2DsuCbA2BT+Ns8BIJITNsxy+b+lQ9LP0yDzejCXCpT/u
         GrSbIvYmZaVqJGeLmlrFtKgSeayHcHNxZdBSzqFE77kkn80aebFiuli+rqNqQZMuQ2G9
         JmjY0yVcG2XRlfDSewZUjk4MxuddmjvxubiSIIKicBntS7Wm9PBuBoHzknCAm2DCNXTc
         7grFw7vyNyjKRNuyeGujq2jCgypiUFkTMGFRvndirH5PvubViVwREv+/U6KhQ4nIvCGX
         q/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg9k5JhK7XYIYkayg78lK5KP4ir+Hcppnp/+d8C63KpQb73fcXOsnVpXa2AENvoVwNa6tJMSLXe+G8FC28@vger.kernel.org
X-Gm-Message-State: AOJu0YxKM99Sah258qFPg1B1t5Qjuqq1pKgksuztQApIYJNeHaM3fIkb
	4IhfROc0DTtea9NXHzWkj3PvIbJIkfEQCUN89pLa1xUQH3MI8FFLeSntopc7qUM=
X-Google-Smtp-Source: AGHT+IHX0DyjU76XALWxmWo1rFtyrXa04JOcs287YwEsi4dcvnoaeAHvh4uSkbpFq6zKRGmVBfQSaQ==
X-Received: by 2002:a05:6512:1247:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-5367feb95f5mr2113449e87.4.1726230933059;
        Fri, 13 Sep 2024 05:35:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f914c72sm2257748e87.305.2024.09.13.05.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:35:32 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <bizip6exhqdm34fhdw7dvqws4oqgexp2f2lp2zxoblqu2zfupi@t33svola3tq4>
References: <20240913083724.1217691-1-quic_qianyu@quicinc.com>
 <20240913083724.1217691-6-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913083724.1217691-6-quic_qianyu@quicinc.com>

On Fri, Sep 13, 2024 at 01:37:24AM GMT, Qiang Yu wrote:
> Describe PCIe3 controller and PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe3.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 202 ++++++++++++++++++++++++-
>  1 file changed, 201 insertions(+), 1 deletion(-)

I didn't verify the addresses, the rest LGTM

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

