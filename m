Return-Path: <linux-arm-msm+bounces-33875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67199886C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9EDF1C21087
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF121C9DCB;
	Thu, 10 Oct 2024 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ce4nYN2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05D1C9ECA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568466; cv=none; b=gB4VW0Ot641t2vG42l+R2Ubql9aIkHqxS7WTrobqeRMcaFBCgGNo29MgNlKtT84+arjww6Apb6KbYuqHwMerylL/QgWU28JfPfxFJ4Q+JlIC8FAw46xrEf4I20kXSWpzQLjTi12y/z+T5rFTzcabC+fYxrl7BLO4+ItvtvTL6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568466; c=relaxed/simple;
	bh=/MdJOYWSFWYjBmuIvZwF0RaW/1K9KTkshG8s96mlx+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqtoGBOjXby6rRNSrVfGhu5hkON1gNyFWglRSzYsPP3Z/naW54sYW9sQJMN1TaQQSM+cMTIXNuNhifo8a3kRblBuhwGu52uFJDKEZQV0eLR1AwlTqrb1pI9xRxN3EpDLMwKIqvuj3lawHYmZqWSK6U3UjednEkg1IlIWUyVQs6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ce4nYN2E; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53993c115cfso1263974e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728568462; x=1729173262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qb9do28lJl8LSAbvRHjfrwyeq3FZfjo+Pf8ixrbq3FY=;
        b=Ce4nYN2EKddNroMmU2PJMQOO7CwwTpKDnyYKRlRkKXgxzmEiwGUo9OLSVFASTHpW4c
         OPtMLBPUF5p/Gx07ypZ23OnBGUhVPRr+Muc5kJ68Qp60w5G3tJ43QqVBvAWGbS22T1OF
         pPoj9KSSyxdwfX1048V7b0npOns7CDT/TxTsabu5UlogsqVgmh/NUby1VHAxJI/q7ExW
         NDJRHxl+sJQM02iMyhB5Gx3IXy893XwKpJn6uPepf9xvLCvo/2SUmMthj2/3Xl2LBIfz
         br3is214NMwK4yK7r6XEj84To1R8zcwpsH9OJGCq05HA70JsB8eDseF4tMEGxBLWInBe
         j2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568462; x=1729173262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb9do28lJl8LSAbvRHjfrwyeq3FZfjo+Pf8ixrbq3FY=;
        b=ViJpaD7fYpzRoWHVmJc2Nvl5Fuel+F2Rhgb0imPLC73nprXrRG2di2tFNqjtUSWWBk
         DgWlGOrtoEr1WRE0ADaXrRDhljzr0nwjl+MZBy/7YLc+ufdarIrqi3oK0FObDdqToNx6
         9n0y5P1JGAbb+LSls1i77Lid7S5zOHPlU/6LEzuQyiihJs6y5is58kPia9OhvLn6sVjS
         Hbk9A1Wr8CZh3S4dLwfQVMisi8drCZzCHhQmQFjgmvDS1pdCdhpLURqnNh4Sc2UgPRC+
         PzKtRRNyqrrfym/ZR+qtnP5J3ISQUQ16thEjhwJKb4b6tZVZsa4vs9r7JYCsx02FB8j3
         extQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw1OY4/QfGaU22stpX7975PZqmAbbE5oGw8gz5rTMnWzyW4JQV+GUDRtGctxi2tD8jR5uS4VwpaYE+XqSC@vger.kernel.org
X-Gm-Message-State: AOJu0YwxClbjzpvSldRrzF6ORAFEJie2D5BAFVFQTDA0s4YjZg69V8tc
	vfE61SaYqTToR+nACxg29ryp430VzXGTK1MGZk2v5Fc1A+RHarYGclh3jvOUT2E=
X-Google-Smtp-Source: AGHT+IETmVHkFlLTgoETu0Xv+7MfN8SyNcGln0i9cCU+nmxqBIFSBYMKVVj3KwdQ5T6DQl1hWggOFQ==
X-Received: by 2002:a05:6512:3d8d:b0:538:9ef8:881a with SMTP id 2adb3069b0e04-539c488e739mr4488887e87.12.1728568462477;
        Thu, 10 Oct 2024 06:54:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c86f9sm264641e87.86.2024.10.10.06.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:54:21 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:54:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <xwscnif4mqzykjinjtbr7jqsksy2buzindyttkk754jmumktm3@p5xxnmia7fxe>
References: <20241009161715.14994-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009161715.14994-1-johan+linaro@kernel.org>

On Wed, Oct 09, 2024 at 06:17:15PM GMT, Johan Hovold wrote:
> The DWC PCIe controller can be used with its internal MSI controller or
> with an external one such as the GICv3 Interrupt Translation Service
> (ITS).
> 
> Add the msi-map properties needed to use the GIC ITS. This will also
> make Linux switch to the ITS implementation, which allows for assigning
> affinity to individual MSIs. This specifically allows NVMe and Wi-Fi
> interrupts to be processed on all cores (and not just on CPU0).
> 
> Note that using the GIC ITS on x1e80100 will cause Advanced Error
> Reporting (AER) interrupts to be received on errors unlike when using
> the internal MSI controller. Consequently, notifications about
> (correctable) errors may now be logged for errors that previously went
> unnoticed.
> 
> Also note that PCIe5 (and PCIe3) can currently only be used with the
> internal MSI controller due to a platform (firmware) limitation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> The PCIe Gen4 stability fixes [1] are now in 6.12-rc1 so that we can enable
> the GIC ITS without being flooded with link error notifications [2].

Cc: <stable+noautosel@kernel.org> # Depends on driver stability fixes
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Johan
> 
> [1] https://lore.kernel.org/lkml/20240911-pci-qcom-gen4-stability-v7-0-743f5c1fd027@linaro.org/
> [2] https://lore.kernel.org/lkml/ZpDnSL8as7km9_0b@hovoldconsulting.com/
> 
> Changes in v2
>  - amend commit message with comment about PCIe3 and PCIe5 only
>    supporting the internal MSI controller
> 
> 

-- 
With best wishes
Dmitry

