Return-Path: <linux-arm-msm+bounces-38799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B79D5BC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 909CF288314
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E791DDC3F;
	Fri, 22 Nov 2024 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c3dRNlc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827641DDC29
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267032; cv=none; b=gNlopBaS5DBQjflXB7ba+qZX22qtKCxeLWn7Rs5Q+XVnK4KVo+ADmJzhTnSVN80dgvnAqfht1mJSzw7bXDDSMIAtUdYS9KB8kle4+bvRnoPvIGL/cpMVBvMGBi8aL84cSjSqDh7bBVjVwwGojJu5hF9HCMqOr0TJE/oyAeNr1N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267032; c=relaxed/simple;
	bh=i0KZgfH+7J5E6yaLH88UVVa1emy1LqpM5ZO9CYxOrcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0IqIfS7rnl9lMhfuYVs+79l+6UjN/Lpn9QVEKuywNPENniVbKPmaKR5fSl3rTUwasTsUD9CNd05kcGGWCM2gILpGPKDRLPlXax2aWFy/y01pF2DL0oWeC1Bltq/O4BHYNrIy83a8UsQCbvAXhLaK0aPDjAkiz0QrM4Plu0ozQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c3dRNlc2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so20374521fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732267028; x=1732871828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ksABjJAjGrK4WZJYFnwNA4rXTdpvjlAmljWrW/leao=;
        b=c3dRNlc2gaiyfYZqpVcwXiei0GQP+kk/iJDkF2zX+GrEpAwN9RTmcm2ZJxIYox1N/A
         KkapUKnrevfhxhmtTfsUpYuU3Ia29nNW+5NQbm5fnIqDn2Qk2kPVr/ceNZpEO4DNextQ
         UqOK5jDUn7TbyDEo/gkUmRWDHYc85e0qUK0sp5S5EtAPu0TSf39myQ7QcLcx3nvXTNPZ
         aIuG5SNTQTqmBzHTca04rHAUiPbv+jEwx9CpX7l+P6F1ipiLZX7NVvbxBfs7wLNZeZqs
         X6MA431z6gzFJSI6RDEYnqJ9FwlEBq8eUKuZHHMcZHqr0FpidCK/Va6xO2PNrq7MKC3b
         X6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267028; x=1732871828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ksABjJAjGrK4WZJYFnwNA4rXTdpvjlAmljWrW/leao=;
        b=n7p5hrMyxEvYU+7K81vSsN/CeIRM/dcRzrt4nvbhZP8VdS6SS+i6sYWrdTA/AiQffC
         ytf6Wu8ox/lBfZwdTmp1yaDuEzAHxuaCHF2BWNMKY0ZqMTJhkSFwj2NrZhXios5D+uRl
         oxrKiCe7m6SwNjc5zj2xE28WVkdEpD++dT8IVsK9oY5CriwMB5TGKmrdMpsywpWhUqv8
         BnbocrWC3KsNcLy3flzlSoXACALbg5CY3gEnPGN4l508ePNvycPGQ+j9N6AAsU/bA+Vo
         8yryl9OOEx9ctWv60ozmEOqUG6GFTvFS+mGrOZU08LQXxL6yj313NnmBS3AyAhGTKRKL
         doFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkvgYOqR/H+2STaQmGjZyD9HljxeB2Z8Wi4kAEQgGmC3xYIaXG+9PAxunwrZEQJ3tWHPk2PwUEiO835Te3@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEp+5Yv/7a+uDCySnBySi6TYG1akE/KD6dSKh4fc86n8DgrIR
	si30CqlYs1fpzfWWuN/3fIgxvxqJ0YzioCQY950DYHZZzTMRLOkX2k8LShLRmEU=
X-Gm-Gg: ASbGncvTuFC4W9uap7ifhAARmft1Z5B/MIgOnnsHtLEP52mPUQo98tWcCjawXAKQZ6Y
	bLi8eh2i5utQUn0eYVu4+9rB0G2aelnfow2hjM/UdEq0JDs9XNIPY+cdeR9HoiL5uKxvFXOIDu2
	ltXit6PKd6XcLwVCPnzXWQrrOwXqAeguQ/i5B+RmhUgZFk6nRHrgBSNq5lO+fpeJEtAoC1XmcIs
	uaw1vbQ7COQmF51vTOnqEFnUuBa3foLlnjz4IL63l7XKJ3eDaC+fCPOHIq6S0PMGqWof97agZB/
	HCGSXnhQnGV2R2BtbaVKiNaVogEXfA==
X-Google-Smtp-Source: AGHT+IHBSuiJjpzWzU3YdTTbSzmrCvJAhqrd+J4fXw6qs1ZwVFgAFerBo5+LIflY5eRi3hfZUicu7w==
X-Received: by 2002:a2e:8903:0:b0:2ff:a7c1:8c2c with SMTP id 38308e7fff4ca-2ffa7c18d53mr8486111fa.28.1732267027671;
        Fri, 22 Nov 2024 01:17:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa538ecc5sm2728601fa.99.2024.11.22.01.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:17:06 -0800 (PST)
Date: Fri, 22 Nov 2024 11:17:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: add the GPU SMMU node
Message-ID: <pzfg7qu7tezw5bg7bo6zo4t7or54437kbhl4shd3ryautjxrpb@e3hlgrz5ya5t>
References: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
 <20241122074922.28153-3-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122074922.28153-3-quic_qqzhou@quicinc.com>

On Fri, Nov 22, 2024 at 01:19:22PM +0530, Qingqing Zhou wrote:
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

