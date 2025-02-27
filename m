Return-Path: <linux-arm-msm+bounces-49603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A0A473D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD511168C09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B08A1E5211;
	Thu, 27 Feb 2025 03:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjGTnHjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B35111BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628670; cv=none; b=DmmQ/cazoea+qk/z63l9bbddZt7Gm1aDO7R7kApCvnZEx7gpM6JbiYzfiar4vYAA84RvhLFw7wfBs7DSDXAwR4MvCP6IltoF6+DnMhM9lhZeZaENEHMET/AMbn9s8Cppu/Z8uSr7fpGBpKKbJKGqpr/lf6jfBRM08ZkmDMVonjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628670; c=relaxed/simple;
	bh=fxvwW0BgDnU0Z8eptn1J8Yat1c522qae0otlRUcc2DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqRHRPM2pt/DLzj6fyH6/Poh6psBKI+A9omZaZKd9WdIexF4QDk5NzYUOZwh3udyfWGbVSQZxKiGuUbUeByy4e6xtyE4t+7L5MPa4w8SVekqXLUenExCf3NQlEpaLGbYNx5c2F1h8McNRvZGpYbsHZcEJKWmHGOWHlcmkDCDKgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjGTnHjH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22355618fd9so1595295ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 19:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740628667; x=1741233467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SORYFzlf5yk72wXc/hRXcaup5tJCWbmDlOEbyNefL0=;
        b=JjGTnHjH0sQC4/E6Qc+Eu/2cKENM4OUiUSfYXLeGjGa0/fpieQxfmFBqvIW8u0i4vX
         8z6WjA+pPQzbMm+Vidn9p/dVI1zzqvH4tvSO+OaRXXUV7H0+WiiMhrC22TSGSBn4j76Z
         WpDoYZG1kUluwoXmggUyLiwa7GF9xVnibB3NReT9riRA03Od7sp9S7428OnOdoHKhkHb
         Q6Ecm/RCjPTW4SlUvuBMEjDu/nA8H3fnWhhT8I+hmfLxf30mo26sBwScVTCkUOJBHzOs
         fQm384EDtOVbIFLfJWSY6mteq5zqrrII4bvDoJVYCbaw1x3LFE+AXbWuwVZDoQ2oW83Z
         yX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740628667; x=1741233467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SORYFzlf5yk72wXc/hRXcaup5tJCWbmDlOEbyNefL0=;
        b=ixElZi31+3OtaArArjHDDUHJGL5BlAvbLzF5C83XpmVMzaGH+ZoDdrKdVn6A2xHhHN
         A1aaR676zp5I+H+XJgT9Ca5CT0+5Kj7vpiqtItn7Ubz084Q/iMUm85tmuKsZoMpiYcH7
         +781llsGDr3mz0Pnt0R0ldmd/Tn5TNDDhrmH9KfO255dilWhilLcTM6OMUoMpl7QRiNK
         o3lorX6iHOQBT1qgPI6DSKIZaQBc7Zl6ipX2WDBg8VdsuW1OD0+xH/0j/0qPuXQIlmxr
         vx095Xskv1H5fvjMs4F02LEsxbxCRujfENwLyFWSWdaUh7qcPZYrg59Uwg+daT8GPXLO
         uD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGfN6hFAffiSaM7J4VxRJK4djxBaHsqHsrE2xE516d3f/mkAoZzj8ieLAzoJvlZLpsGMiUmCkC3H74uHY3@vger.kernel.org
X-Gm-Message-State: AOJu0YzAeG/5mUP16rmnQLIzr9eRSNzq5Ie+HLCQPya4MiiE1Oy6YtT4
	QOagYHq0A/2XqqSHATyJDyies0/vTSwqy0DETrRSd2vCtbfi1R2B85kyJoyvjw==
X-Gm-Gg: ASbGncsbUKRjS+bHKmiKkfZc5wiE1fGYMeGqwU3AfINrniJ3yPDQIz3daF5c4Bbjbae
	R9Az2B1nXl0yGGP6Pi52OVy8Yrwx/DVCs+4wrqXxcz/7PJm0nR5sTb+9EIq7+lSIcYSLwLCA+F8
	mbQ4YesqIzZtUOb9JKiWOo6oRfgNN5KunfUMfBPvfVJVx1anod8jWEz1+810M+GFHTtbZTiOP4i
	bZJTQ9GpqwukT8pgsU2DRJfjIxUuapsGe9N626b0VtuGTO3v2jguVZ4SNALoSZ3ailDPUQDfOBn
	fHnRmDB53gtCukRNyN6osFXNa154rNJAO6FN
X-Google-Smtp-Source: AGHT+IFGj3WIOcX/QntWrbzx8bfoD4Nny+Kub8u7EqzoQCTumC6GVso2Yd/TuSLqdMuXJvGu8YLpUg==
X-Received: by 2002:a05:6a00:13a2:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73426d989a0mr37909350b3a.20.1740628666891;
        Wed, 26 Feb 2025 19:57:46 -0800 (PST)
Received: from thinkpad ([120.60.51.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003fa5csm437097b3a.145.2025.02.26.19.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 19:57:45 -0800 (PST)
Date: Thu, 27 Feb 2025 09:27:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
	amitk@kernel.org, dmitry.baryshkov@linaro.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jorge.ramirez@oss.qualcomm.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 00/10] PCI: Enable Power and configure the TC956x PCIe
 switch
Message-ID: <20250227035737.q7qlexdcieubbphx@thinkpad>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 03:03:57PM +0530, Krishna Chaitanya Chundru wrote:
> TC956x is the PCIe switch which has one upstream and three downstream
> ports. To one of the downstream ports ethernet MAC is connected as endpoint
> device. Other two downstream ports are supposed to connect to external
> device. One Host can connect to TC956x by upstream port.
> 
> TC956x switch power is controlled by the GPIO's. After powering on
> the switch will immediately participate in the link training. if the
> host is also ready by that time PCIe link will established. 
> 
> The TC956x needs to configured certain parameters like de-emphasis,
> disable unused port etc before link is established.
> 
> As the controller starts link training before the probe of pwrctl driver,
> the PCIe link may come up as soon as we power on the switch. Due to this
> configuring the switch itself through i2c will not have any effect as
> this configuration needs to done before link training. To avoid this
> introduce two functions in pci_ops to start_link() & stop_link() which
> will disable the link training if the PCIe link is not up yet.
> 
> Enable global IRQ for PCIe controller so that recan can happen when
> link was up through global IRQ.
>  

Move these patches to a separate series.

> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> changes in v3:
> - The QPS615 PCIe switch is rebranded version of Toshiba switch TC956x.
>   There is no difference between both the switches, both
>   has two open downstream ports and one embedded downstream port
>   to which Ethernet MAC is connected.
>   As QPS615 is the rebranded version of Toshiba switch rename qps615
>   with tc956x so that this driver can be leveraged by all who are using Toshiba switch.

This should be moved to the description as a NOTE.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

