Return-Path: <linux-arm-msm+bounces-37799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642319C74AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1102843C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C22273F9;
	Wed, 13 Nov 2024 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbWijaMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F71DF272
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731509075; cv=none; b=m5VKpPy5CoTvhGdPkr4bbbtW1j86ssu6idX+J12mwEgzrG+0xPSnYePABaTnDYqKra86vR6KPDCqIM2D8z+oGrycrzqPH6ic+4Cy150u47lL9HpCMBwSxbEFNtLkAEHcuNzMsARdlkIja1+Sg8tlLIR4ykyGIZzmXt0ERj+t4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731509075; c=relaxed/simple;
	bh=HeZeCSsJu84FolYvJGFPv741kcE6UC0oMqQJcpwtCIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/xoa34dKy/8vI54bPSMDgxeFveBoGWGwT9iLbsB3LqOqu/8EXn04+N/qmjE+CZGBsPzvLk1hoiUu8bRwqIbvUvXuzSCJdsSB2xp/pQDFFEfrI4y9FoelB9fPaW/v61+9NbXTkF62hrzkHaXUeeZ78isyljCqO6PHogVmhO3S7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbWijaMq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53d9ff8ef3aso1035135e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 06:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731509072; x=1732113872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQPpB0phrSoegtCutG0hX/vUb4mF3xNnw+0tCeNiRNA=;
        b=kbWijaMqRvF0FLAsiyzDHAJHnHyM53T+CoAxKl2gQJ9VoCJqrAP26ArAEtpAHmbWGo
         FSHwzIwFMKwLv/ipvlvPRNjTp3CuQNATdwRdvHoJkO7f8p23e2TfBUYS1OgQeKh8Pwl3
         44CbROgyogDntTLw8c05wXfi/2Qssb4NQ1XQxl8lb12xHRBlFnaA0VjOTZc/1U6pXRXq
         sYaD1XfX8di+KVnFDmvprJ8TXudfuE7qfpm+PbTwC7KAZdNtv4z7ReG1pGHUbs8bb+YC
         geb438Pwjgt1OVFUUy8vd1O0aUCAgIGlC1p/H55E2su8FW4tHR9GOclQEmclMtNYlJO7
         lPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731509072; x=1732113872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQPpB0phrSoegtCutG0hX/vUb4mF3xNnw+0tCeNiRNA=;
        b=kghPsJxwAPi/U3xY12ojwWmtBSqpRHYw92XnMZ0mfBM8kXQ5wRoJCWvNU0oYCxQaJF
         HGGRK20Cf2cUTf2SDkncpktvqhtXVIttmtTaS994EZNZA2iVcSrS8x7fndahhpJgvgMW
         inhq/yosVr/a0TDfWTeOArzLr3dbWpj2LqH3h/kohwFnmugf3CSfoQOB958egL+yu3h1
         +j4rBWQgcRNa+ZWgVs6DNRa0h+mJaiL1gGs98LH3Uk1KFLj73hizQIKC9aoErvHojN/X
         saMRHegwLy5zz734Zg/AXNvfW9+haYbBKHNx5d0yCT0yfQ//g0Tpb1awU+ihVoVstOHq
         8QgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/nzcmz6cU3UI7jdtRX9q5p6jMR+zWKqVniVhZJsVVw56dBaTFNkeXM4uHIbDC5EY6zjYBZMQWbq7EPsUb@vger.kernel.org
X-Gm-Message-State: AOJu0YwwibRnRdrdgG4TFhG2ptdw6PNdt37UUZ34+E0fZynQbGDazcnX
	lQ3Aj7kgZGyOtPHSDCawy9IA7KnOpLsmsShMh4Nhl8g+70/0ww6EPdURgBjWPJM=
X-Google-Smtp-Source: AGHT+IEI48XdiEjcdWrwwdwFWY3xjuTvfVBcKE/hPSJ/8GcfhyVPGSydhhwXBFZEyJFFyvXiYAdR6g==
X-Received: by 2002:a05:6512:687:b0:539:f696:777c with SMTP id 2adb3069b0e04-53d862cb2e1mr10285422e87.29.1731509071994;
        Wed, 13 Nov 2024 06:44:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826787ddsm2224961e87.18.2024.11.13.06.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:44:30 -0800 (PST)
Date: Wed, 13 Nov 2024 16:44:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	andersson@kernel.org, konradybcio@kernel.org, mantas@8devices.com, 
	quic_rohiagar@quicinc.com, quic_kriskura@quicinc.com, manivannan.sadhasivam@linaro.org, 
	abel.vesa@linaro.org, quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/6] phy: qcom-qusb2: add QUSB2 support for IPQ5424
Message-ID: <3wacyipnmxdjdgp6rrpfwreh53zjlimjkpadpxqrclu2tdtjj4@enwogkt6wq2e>
References: <20241113072316.2829050-1-quic_varada@quicinc.com>
 <20241113072316.2829050-3-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113072316.2829050-3-quic_varada@quicinc.com>

On Wed, Nov 13, 2024 at 12:53:12PM +0530, Varadarajan Narayanan wrote:
> Add the phy init sequence for the Super Speed ports found
> on IPQ5424.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Change uppercase hexdigits to lowercase
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

