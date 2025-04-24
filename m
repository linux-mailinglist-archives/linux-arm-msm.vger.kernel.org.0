Return-Path: <linux-arm-msm+bounces-55272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8769DA9A292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 08:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC81E1891C00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 06:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAF91DE2CC;
	Thu, 24 Apr 2025 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohRDjLKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8284FAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477371; cv=none; b=fgG7XTnyaQ42fFLKyE+v85KOuJEKI72qSDN4YKV6c05tlikbpQA78NOPz6o0Ckp6PTQMMLBtQUfjiCATAnAitFHGVuflN5eLva2EIKsXuTtUKlPg9M14wz41KJLlpXS0tfTu82jhCNuJ3y/51oBJnPU0kgIh8isGO0TotdvG9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477371; c=relaxed/simple;
	bh=YY05EULblqpqOJ20Ca2qJAkFfKoRl4Lnom2DVdns5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCGUEGnOJr3S8QT8pq58eWf3LMnG65nialu+b55vFZlpCzqOQhKLQ+yVb1mLNPabAIrgoWD+5GRyVimrDcQNGdEg622yaTpLMt1Jxi8/NcyWNPIBLyogGOHmlt4VPLB7XjxV0XfiEja9o+3x7y7vcIgwfctluMAnH4I9IQQHCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohRDjLKo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so1228625a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745477367; x=1746082167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FO96JtbCvJe3mUseWa0OQALrV8LUqckkiAryhK/dOSI=;
        b=ohRDjLKoZHrt860xcyNcRM6ef7aY/SfxsNBLLKF08fD8KNCh8idbIfQvUHp3wO8gwQ
         S98QC6TTnRRvc3o4JzKbpAwKdux4Go5riFQxnKm3mry9CeGkdHqbtJmUdTXzFJdS9CxZ
         eGZPRYD+6rLhnYkSHx9+/07//pIViq2NszbbDxrlHwNTl5CeEwgZuQC/9uld1voGxxJj
         9Kar10lAE6M9j5mVkjqOFVum48tP400eacu2ixJSENA+lDK4Um07RYR3WmFWkAT5waDo
         /HJ8H7CQhWZ/V7kG4EPT/ib1mRgNzfd4wX6jKFxa5VXJtViAeAJQG/zCCoHzaxP+YNVK
         TwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745477367; x=1746082167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO96JtbCvJe3mUseWa0OQALrV8LUqckkiAryhK/dOSI=;
        b=b/iyXnuZPk0/xeeBa18Aq8Xh8pJEOEHraPAxhi+QyBONhXuKRG7PwATqI5E5RcHa/J
         yzve5Sr3fhTvIwjzCCdsu/q2Z9uJZGR7mAwZxF++6s1XmsZgGn05tp+n4Vw1PcdgPp5Y
         6yUAApD6zzUodCUMWRMLIGwp+ar6AtsK4su4anHpJNcJW6uJzMBHOFkCrzm7wXQvZHw4
         VrdsbUDr/tKuXMDBxzCK28dvmck9Jx5T53ldLfb4wfstd1VLZ51aEzVvgCSfbK6GsAN7
         VBw8eLRl6CPe5gItITy7smS5wQS/Os3zCU4LnZ1adCIXpCSMdVsrj9VqsrO52mxRHd0Z
         xsrw==
X-Forwarded-Encrypted: i=1; AJvYcCWGIQVNFvaEBKAUm836XplpmvLhls4WznmlNhWAdF364SmXzugGmkEfQpKxX+hfQRss+Fn+Vu7In4M10+KU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4buhkoGCt6ASIxdSeR2O4m53Xo46+nCKSBEurUji+ga8UAH9A
	1ahgJAm/lJiL6y1iUOQuDoSKXHAHn6B8F5BdU17GiTMsuc61bC0PiQjQzwPlUpk=
X-Gm-Gg: ASbGnctzrW7uWqpzY7r9AQDrh28fNwthDjzQTbYooZzNSiY/A2UBL69bqJhR44RwRP+
	lEpXXOsO27rgmAQDm1gYL2YgrbAEv+AauHTyJ2KiM8my/es8gJkKtP/JDcWkO64patWaCat0btJ
	8tuWumCp76sALFMtAyZWSKS6jJZqEGLBzxOTj9i4cQioqnwoa+235QFS2OHRH1G4gLor1VVytV1
	qmb15oRJyrtmH1kD6KDc9ksrpsLLJk7+Eq1jccK8O8S1+W0j01PQqFkaxx0ijjB1zRiTB1sSI34
	LzBmrWAWapbNxYSxCe99o1VgNV+DEulNAjYxIg==
X-Google-Smtp-Source: AGHT+IEfj/5HzaH2h358gMY8v05hd2yzGKyunuo5psGHsXusc1uw2LNAuC+EPj7nse1eDky0duEC/Q==
X-Received: by 2002:a17:907:1b08:b0:aca:c7c6:b218 with SMTP id a640c23a62f3a-ace570e0d55mr131378866b.1.1745477367496;
        Wed, 23 Apr 2025 23:49:27 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c261f4sm56013866b.146.2025.04.23.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:49:26 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:49:24 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
Message-ID: <aAne9K79PNfdQc8h@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>

On 25-04-23 09:30:06, Stephan Gerhold wrote:
> Several of the Qualcomm X1* device trees upstream specify the wrong voltage
> for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
> configured with 1256000 uV instead of the 1200000 uV. Change all affected
> device trees to use the same for consistency and correctness.
> 
> In the other device trees upstream, the voltage is already correct:
>  - x1e78100-lenovo-thinkpad-t14s.dtsi
>  - x1e80100-dell-xps13-9345.dts
>  - x1e80100-microsoft-romulus.dtsi
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

