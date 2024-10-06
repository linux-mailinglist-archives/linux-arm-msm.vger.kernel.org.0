Return-Path: <linux-arm-msm+bounces-33260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7C9920B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764EE280E2A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78E818A6D8;
	Sun,  6 Oct 2024 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hl20Dg0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C786A189B9C
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243267; cv=none; b=Qk/3FD21JRYIkQgHR4lqPM0zsd14fRNOJP7LZfMDpwosxHI62GuAw9H8QH/GUt/NH75zJbpMF92H3sNYz0yPurbYKhg6C5nEvkwXQgp49D0q5BGIcwK0XNzfLHJFlMgE41Ga7udEYprI7Mae/GCL4bnS5pyOOPNT4+w6Wa6ycKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243267; c=relaxed/simple;
	bh=yPzaunxJaneO/099P+GEkSWTX5DT9FS9497uaVPrAtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcwzQQ/5ItkCLiOx8Hi0q4T8mD2u1/wZzJq9k499jgfjy9ralYdaj7eEiqfMpM39p8XOwrRz8odzrmZTgaQIaNWoRiZPyw0rvyZofTgqXtHL1kyCS339vaFRvI2CMu4naITe5brKOh8b6Co7eHQULY6WF6p0+Bmnphkr3uTCgvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hl20Dg0P; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398939d29eso4499941e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728243263; x=1728848063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8q3dDlB0727MfbgdMqebUn7s4vTdoYhqoyoWQRyPuQ=;
        b=hl20Dg0PCCmnBMmkC+uVKHpGe0VrhmXiIMXJ4pBoYejM+4tDCUzPsPs8uCmF8PR/9+
         Y9TeMWJ4T5JIsiQf+P4gTsv1NfkzgJWL/Jfb4arxf3JkyCrlA3e39qssAB5F+mej/uNj
         ROlNJm/rXp7i/Z+RJkCqpX/BpcDQHFMuyqG4nrKtcjsk5Mr9B4ThvQrLUJwYjYDXu85U
         dGhoawpbiHPK+4M8qDe4sZxH09yJviKE0SFmO/thN0qfXJ3IOZlfSHBWZeGb2ysqBkA6
         UOq2tr8FyFsWAnA5gN39kCVxMSZqVDMx41PMSMIzfkj3Eo56WBCNIfPdEtiYd79iSMNo
         1vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243263; x=1728848063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8q3dDlB0727MfbgdMqebUn7s4vTdoYhqoyoWQRyPuQ=;
        b=JxedU6rpRvcBlrJhJEbqW3X/kBZSl2i+Y2xll6IxjSLwutAOSHH+2bpdc1b4IsIU/R
         jrawQrawT86Ic69eGLA1PL6sihACRyBfToVHm4H1eVuMYgecnhdsK6mdkUJQcCAePPME
         R6czHOVkmFCbLdqaS9D76pbNwa7CJeVlROoBxWL8AxJyUWsk6oNhhtORik0+lwYSIPmF
         zi8NbC24C17e16gXdTJ09z2DQeHumufynpnB+umocAusVFFiTgWW2ghvo2scrpaoX1Uk
         7O2m5azFtBBpKzMi5Lw7MUcE9omdEEr4T0cw6sBY0oxj4gTGAeHvp/AZnAGdWXz4+32l
         bwxg==
X-Forwarded-Encrypted: i=1; AJvYcCXfby9zazhDRnof49PMBqEys+8VoYONmkazZuSjMpbioUB536eNEKZZ1f8yS1VfUIn1rl242t/flTAcJr3U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwty7yfTL+Bu8hpMBxzS9dFhggIjl/++aK6ktt8uFxXm0tUNfP
	AkkgEFtBQx4BjB7sPTTsG8afVohg/KpFbGvblF11ySmsm4i0AQYWIGFuGMrLiTg=
X-Google-Smtp-Source: AGHT+IFoPrYElR5M4WSqZpXWHN+3fySqpZ3zqAu1PEK8VTNMZekBd0rQ4ZV63xcbV97yoSotb4lYPA==
X-Received: by 2002:a05:6512:3b21:b0:535:45d2:abf0 with SMTP id 2adb3069b0e04-539ab8adcb6mr4175272e87.39.1728243262892;
        Sun, 06 Oct 2024 12:34:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff2831fsm607332e87.264.2024.10.06.12.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:34:21 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:34:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Peripheral Image Loader support for Qualcomm SoCs
Message-ID: <r4zkfioctmlatxkb4lqmfc7vk7cdenenihoicq2k37wvxeihss@gtkzxr26p6ei>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004212359.2263502-1-quic_mojha@quicinc.com>

On Sat, Oct 05, 2024 at 02:53:53AM GMT, Mukesh Ojha wrote:
> Qualcomm is looking to enable remote processors on the SA8775p SoC
> running KVM Linux host and is currently trying to figure out an
> upstream-compatible solution for the IOMMU translation scheme problem it
> is facing when SoCs running with KVM. This issue arises due to
> differences in how IOMMU translation is currently handled on SoCs
> running Qualcomm EL2 hypervisor(QHEE) where IOMMU translation for any
> device is completely owned by it and the other issue is that remote
> processors firmware does not contain resource table where these IOMMU
> configuration setting will be present.
> 
> Qualcomm SoCs running with the QHEE(EL2) have been utilizing the
> Peripheral Authentication Service (PAS) from its TrustZone (TZ) firmware
> to securely authenticate and reset via a single SMC call
> _auth_and_reset_.  This call first gets trapped to QHEE, which then
> makes a call to TZ for authentication. Once it is done, the call returns
> to QHEE, which sets up the IOMMU translation scheme for these remote
> processors and later brings them out of reset. The design of the
> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> is not allowed to set up IOMMU translation for remote processors,
> and only a single stage is being configured for them.
> 
> To make the remote processors’ bring-up (PAS) sequence
> hypervisor-independent, the auth_and_reset SMC call is now entirely
> handled by TZ. However, the problem of IOMMU handling still remains with
> the KVM host, which has no knowledge of the remote processors’ IOMMU
> configuration.
> 
> We have looked up one approach where SoC remoteproc device tree could
> contain resources like iommus for remoteproc carveout and qcom,devmem
> specific binding for device memory needed for remoteproc and these
> properties are optional and will only be overlaid by the firmware if it
> is running with non-QHEE based hypervisor like KVM.

Can you follow the approach that has been implemented for existing
systems (ChromeOS) not using QHEE? See drivers/remoteproc/qcom_q6v5_adsp.c
If this approach can not be used, please describe why.

> 
> - Patch 1/6 adds the iommus and qcom,devmem binding for PAS common yaml.
> - Patch 2/6 and 3/6 add helper function to IOMMU map and unmap carveout
>   and device memory region.
> - Patch 4/6 adds a function to parse individual field of qcom,devmem property.
> - Patch 5/6 add helpers to create/destroy SHM bridge for remoteproc
>   carveout and to get memory from tzmem SHM bridge pool for remoteproc
>   firmware metadata.
> - Patch 6/6 enable all the required support to enable remoteproc for
>   non-QHEE hypervisor based systems like KVM host via parsing the iommus
>   properties and mapping/unmapping carveout and device memory based on
>   it.
> 
> Komal Bajaj (1):
>   remoteproc: qcom: Add iommu map_unmap helper function
> 
> Mukesh Ojha (2):
>   remoteproc: qcom: Add support of SHM bridge to enable memory
>     protection
>   remoteproc: qcom: Enable map/unmap and SHM bridge support
> 
> Shiraz Hashim (3):
>   dt-bindings: remoteproc: qcom,pas-common: Introduce iommus and
>     qcom,devmem property
>   remoteproc: qcom: Add helper function to support IOMMU devmem
>     translation
>   remoteproc: qcom: Add support to parse qcom,devmem property
> 
>  .../bindings/remoteproc/qcom,pas-common.yaml  |  42 +++++
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  20 +++
>  drivers/firmware/qcom/qcom_scm.c              |  29 +++-
>  drivers/firmware/qcom/qcom_tzmem.c            |  14 +-
>  drivers/remoteproc/qcom_common.c              | 148 ++++++++++++++++++
>  drivers/remoteproc/qcom_common.h              |  38 +++++
>  drivers/remoteproc/qcom_q6v5_pas.c            | 140 ++++++++++++++++-
>  include/linux/firmware/qcom/qcom_scm.h        |   1 +
>  include/linux/firmware/qcom/qcom_tzmem.h      |  10 ++
>  9 files changed, 423 insertions(+), 19 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

