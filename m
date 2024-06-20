Return-Path: <linux-arm-msm+bounces-23387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDF910A49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF661C22C40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD811B1408;
	Thu, 20 Jun 2024 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNS3gFlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DB61AE0B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898266; cv=none; b=dwE+JvtQiW6Vdz3uKEZb4o2x5C94Xz1+YSgllKCrWgDDYw8Gjqu+6EikDMu4EKo+OnY5XxujsMp4F2pyg/h7qcJOg/Ioxyyc77tmT3i/djlTI+CHA3y7Y3gnPO4972u+iAfN7SXR5ZiOIb35hwk0jylW8OQuVDmqQNbiUU0UKcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898266; c=relaxed/simple;
	bh=ogZMxd+1FYUQWMng1Y8qNe/15VwGRE4+XFCXtGVC5eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcH/4EZyqpavSyc+npN5WfJHmWhyWRLxg99FncZeUao92O/R5crncOdd0IL9NBzDN8ZFkHMMYUao/E4Jnep+3IZ0qHp+PbD5+2IE+vGr0EQ7xhVi2936Bm1eFfEHH74hk80vwnuu4uoA7TbhwlybS99HL3+k/+ahdAvL+x87zgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNS3gFlT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc335e49aso1114807e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718898263; x=1719503063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tWRo6cEOERtjp9Vlw6tlL4I6ASG3axwxU4zpe6oJ5c=;
        b=bNS3gFlTE/z5hKF/3Nrvfn+cv/dYPPIZwK74DMcLLQObGPsq882Jgkb2DOE9OV8fG4
         1cASfn7WtO4NNoraDHoTj/kzdTWiC5XWw8VpSJkQM+d22csDUcbsZcqmtangw56QoVVH
         zAylxBMRpPNAND+ieK16aMwIHwQk1as+k+FLnMfa2EK3jG7JAEb4G0baRFvpKiFWOkCV
         Jbc4p5uI2kf4HpM/vRbbBehqgI5VKPlW4Z9SBkfKQUgA4kjSXmR+++L5gd8cWfPSrW1Y
         dCcymS/1S+20mSBYJwrhxT0bSFZflIgQrnT6fGJExvw95vjizGrH6F99rJM2l+cz6mUl
         kqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718898263; x=1719503063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tWRo6cEOERtjp9Vlw6tlL4I6ASG3axwxU4zpe6oJ5c=;
        b=FL5siIAnQdg2XiH74OQVkYk+jLEE/Y1dEfnjw/xjITe091Z2aJHdaUzVW5xwAKMrDF
         tDDVU1s2K28Jl0KN1kxDXfylVCChNypIGaTNG1pXThpu0vFit35UimX/JAH7o0/WfRcA
         aCasPo9pKEaTmWYMrwlxB92JZv+3g0pqFPn/MtsIF/jdYfXHVIQ+2bERe6r5DQfr+r9A
         IXkft5tBCX725hbYmZBsw6woX7EhzJaKocSjXzF5nGz8GxlZOd9cbpUzuSoSg7xVESiP
         oC0qjJQCheUKRclQDQ82bYr3Xuv6xdUtUiI6WudzKdNX/7CscI+woUeBkCiefCyTnZ9L
         O4wA==
X-Forwarded-Encrypted: i=1; AJvYcCU2QakoOU3yx/xBArkTyk6NbQDm6BVgDJ26Tuf3NtP9nxcX+uKMaV/okeieC4vG6XSVauPP8O+PVLE/iIpKdpsJk2k42dp5Dxexu8O3xw==
X-Gm-Message-State: AOJu0Yx+VzbTXJv2mjNCdL9Y/sxQ3gBe/BgynufmyfKplvKf/wkFt0rn
	NF1pJYHBovbASZAEuwwQw4ijiOIxshIiJ2sjUiHyrM6PyZmIeR1EQ3klXHbUZcY=
X-Google-Smtp-Source: AGHT+IFCpS984ANy97xL8ZuN4RP3xgQuf3Puse0Rs2EDtrKBP3a1mYYqXpq2aQH3bEPCSv7SfUpchw==
X-Received: by 2002:a05:6512:3190:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-52ccaa5dee7mr4853484e87.17.1718898262858;
        Thu, 20 Jun 2024 08:44:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cbf72e9d4sm1030554e87.245.2024.06.20.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:44:22 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:44:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_mojha@quicinc.com
Subject: Re: [PATCH v2] arm64: defconfig: Enable secure QFPROM driver
Message-ID: <rwdkuhxom2ynyq4lvax6bgqstzxby5e65umvj2okrjve2x25sy@l6v47jhgzhwu>
References: <20240620112716.1339-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620112716.1339-1-quic_kbajaj@quicinc.com>

On Thu, Jun 20, 2024 at 04:57:16PM GMT, Komal Bajaj wrote:
> Enable the secure QFPROM driver used by Qualcomm QDU1000
> platform to read the secure qfprom region allowing LLCC driver
> to get the DDR channel configuration.
> 
> Currently, LLCC is the only user of secure QFPROM, and hence
> setting CONFIG_NVMEM_QCOM_SEC_QFPROM as module to the convenience
> of LLCC module.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
> Changes in v2:
> * Setting the CONFIG_NVMEM_QCOM_SEC_QFPROM as module
> * Modified the commit message to mention the need for driver enablement
> * Link to v1: https://lore.kernel.org/all/20240619105642.18947-1-quic_kbajaj@quicinc.com/
> ---
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

