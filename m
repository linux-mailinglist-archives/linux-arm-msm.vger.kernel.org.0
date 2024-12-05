Return-Path: <linux-arm-msm+bounces-40596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4B9E5CD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4DF16C769
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7D4224AEA;
	Thu,  5 Dec 2024 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXfu4U+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247912EB1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418925; cv=none; b=rYCVQvmO7cY8RQdXt0B7uAoQDtwjmLhgcwoOl7C7Cn91JJt2UCeGgeEwHP3imds/vCJ9jfYDemLnQGf2fRYnOymhILBSraw03MnVy5t5XwQNGZwAysS8VrCJyhZlvrbUcYJJdgVD5yqMuiLTLcZxtaevajM2rRhs8AcjJJzJWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418925; c=relaxed/simple;
	bh=uJrtJT7gxlW++Ty/O1yTg6+kz0Nk5NMas9el983z21o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLK/O2w2JS+EInAbImXocI619eOj/LFd0eW38XtDZfCRHyXAp+ns+UwXWLfnSvWMWotd3NZtk6gdGJFauQyau0Sy+N0JqcZuR0o7jprVj75JtCSOjl22iVLvRfbQsiXKxOkDv8aiLqEuIVjM8QgZ/lQvpmcdcRcgLQwXtX4hB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXfu4U+i; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de880c77eso1297546e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733418922; x=1734023722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VC7qjn2Ue13WwDYjqbV/OAtsUDuWOgrtwnr0NjndRq8=;
        b=gXfu4U+iqsWHO5Zpnv6R1OphO+fciwmTcW4XfSqA7joXBypPLi4J4TZU/EkX5zAf3o
         PRajMAJXDAUrX2IARVZO5kPizwRmGrVhHDJWv5m7Djl7zc/zTZ8aXB93DizeZxoqBvxL
         W/89Evcx/M8e2lbgiO8FXPBk1RGv3aAn28OByYvCKDO8bUJT+Ju0vDiJBnAdlyVJ87Vl
         k/ce4tYDYRE8PuMDim6LMU+cFsGRM+Z1ohlfgIdSpGtEWyyNq+MSshIjcshfTUQPTm/C
         jvdJ2tqxcXVWko0oU5IvCQSbJecavaSf0c35z1mEOcMsOt79xvxr6Y8AkQj+8kipBxbO
         Viog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418922; x=1734023722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC7qjn2Ue13WwDYjqbV/OAtsUDuWOgrtwnr0NjndRq8=;
        b=eOXvQcOAwmKRy0WoiQD/nbbAcGOMfGJcVnzuXlUlA0EAQBrVKHAkaBagsYsJgUb9jE
         2biE7+q67qnIM9cva44GhcAF/nGpXqqH3+J2SWJ8QwxfCr9+W1LfetHCCWKmCFMYgSL6
         cwM1x2fJkZOeYkb0YkxuxLbPggKxeR8Dnpdq3xDRdQi2qalC9qvBbDSKBSgoy3UDm8f2
         Xe8PrHNN1Gkv0DL0+5NmuVBhJzS2LCoyOATRfWcLbOZx1k6fCL1RJBiB9XB6fRM0dbK5
         gbsei5K7bfgoATpqDWCfYnXeIoRIgr2bLVkal0k6HGUukzAbVPwO+r8FQXNfosXMOz6n
         Cxew==
X-Forwarded-Encrypted: i=1; AJvYcCWcuOov6todaxxkEd2TU9IBrxQPHB/tSa7pxi8B3b0ks/gAy+qdyxWUTLES3UnGHwmS8xsr154gPKvGLnr+@vger.kernel.org
X-Gm-Message-State: AOJu0YwnD+WSJHwvLZfw/jvk+TsO3V6v9HcpjgNsJMxsdqwBfT8YBTKz
	gBhguA3cfC9JI7L6gDlsABBDQs1wgquA/mzc0h09cUtEUQp5RAPX5nU2pdJsBiU=
X-Gm-Gg: ASbGncufPuxVXFKQmZCt9KY/PJyiZ1hIkzmg6vddzeDhI9yKhJBsVEqX5qgqpYiawky
	VXfcdzUgQizbtXNUWLRUrtkMnMXDsjULBhhLXOj/5HVTPMNp4n7U8bt6UGgXVWhHK+7ZyRN3OTW
	QWNf4q9EvX7Jd+nztXit+ntdSxW9FuDS8k8Q+iZlCpjO+DjjEA+b0lZoqnJY1bfA0ft4mf39Sdz
	oL+5BwOC7Q6LMrEdaaq7XvCwiFAzI6rrAUjFTEz1Ws0/4l50tDWjEv/AFgXR7q5Nwg6hUsxOwkf
	vk3+82xkcpHLGYsA7fuy13UojJ8Kkw==
X-Google-Smtp-Source: AGHT+IGH88KxLDDpR3F7Zua2FFnZVp+X450MYJpG7X6Zbx4IrQuk9wIFPeZ+LGfXcyrUOUfPRq9xtw==
X-Received: by 2002:a05:6512:224d:b0:53d:a99e:b768 with SMTP id 2adb3069b0e04-53e129fff72mr4872910e87.25.1733418922320;
        Thu, 05 Dec 2024 09:15:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba710sm290454e87.140.2024.12.05.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:15:21 -0800 (PST)
Date: Thu, 5 Dec 2024 19:15:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: Add PMIH0108 PMIC
Message-ID: <4i4y5sajd7dmqjm7snjxmj2v64hadj52reo6utztvk4lsulwax@p5yq7swn3z2q>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-3-4d5a8269950b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_dt-v3-3-4d5a8269950b@quicinc.com>

On Wed, Dec 04, 2024 at 03:18:03PM -0800, Melody Olvera wrote:
> Add descriptions of PMIH0108 PMIC used on SM8750 platforms.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

