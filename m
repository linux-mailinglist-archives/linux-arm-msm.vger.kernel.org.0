Return-Path: <linux-arm-msm+bounces-40597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB89E5CD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068D51883CC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1896A229B07;
	Thu,  5 Dec 2024 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwiSCTz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E78222599
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418952; cv=none; b=jVe2kg9DEMieKRDSIJVdj56yDTDl0j1FkJQLu69oRFtaLjzgkkSsBNSK5Pneif+Yp3MdQ85hjYDnpG5/3ryppUjGIBRLDjvU8FfPRFbZ08Et7HMkU2AOgDrZ/oYkKEFvJtYpp9umaEfnStsToM61nFEH1QH0j5WxQQSTJggpaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418952; c=relaxed/simple;
	bh=rVxdCXnF53bGePiz+b207A98CTZ+XHwr6WSiDwdMXYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZqdCVs2fTy8I7beUeQw6Ot2ijyPrA+gBwQFESz7JTd7K2336eLcIodFLCd9hmuD5dTdeT9yIXD28/0wV5PIyNCJWZ7BOBf908yUO5M4fDNI2SwxQD0nzJUkJ947Z6n7FG7JO5FGN+0n+Bg0FzWHiCzBTDXSCCyekjqjxEPr9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwiSCTz5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so1135547e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733418948; x=1734023748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNxP0LFln0zgtOWEPbGccnsmPf7gfq1YwGA1WaBfZX8=;
        b=KwiSCTz5+jhTr+qli+iLMFBa3N49VrXaD6ykqTTnpCT9ZdyEqMO/N4X/sY93zPUbN/
         p6X16lTOsHKhsyaNhMJzky4I1CvJXca7YF02+vVMdp1OnuH9LbUp7ZQfBPauwKM+aiuh
         YfuAgb+k+JRErL3tLad3Erhlu33sV7RHxhMR2o5XPe/gFd3yCVrWsa+ZQXc9pkoVIdGO
         oyGCPYVXAqilVFV4gggXigzldt36KQEGNw0XeWXPVMvHB4bRrkbFFWfEL8z6NZbL+UPQ
         D7eryEcAchTYkvUG9sKx3KMpEujwpTojI0GlO9Vz55Uiin8dOYxucMRmlzQQd/c3ixuw
         KpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418948; x=1734023748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNxP0LFln0zgtOWEPbGccnsmPf7gfq1YwGA1WaBfZX8=;
        b=ELZLkvSUQxKjDlZEFEFua6MJominfasZrXIlhCrMfW7PSVwAbxwajhjdovB33k+KCu
         lw+PjDJ0M4/vJF31pzM+RQTtqLWJHmzol5RHq9IDBElaJB9uaKETH1zU1I7t3e9fPDho
         fYaD8/JMJlf4+g2mpFZqq7HPOY93Dwb4DZ3beJQdIFH68K0MSXGpmgwfycQTpSb0eox6
         FGHQDrEgkqWmTn1sbAxdjXTRlK8MHqYJSvw0oGUACwz2liSFV6biBkkkbZrajofkin0r
         +GH5OSe8YiZdpp9iPyluEZyUSSZ00ZLMGfX4+rcDmQ6dA3/pS0B3rOVe5ungqZ6efckO
         ekeg==
X-Forwarded-Encrypted: i=1; AJvYcCXUuPmINh0tO4F+qyNsPWXveXxi8fuNwT/JOeGrSI2vpCEZ4E9qZtmoj/SjQ2h81zTynkpFQveApdOBuIYo@vger.kernel.org
X-Gm-Message-State: AOJu0YydRuZzY2kubqLqBo3khoQBenz7rprXRyDTp2xmsJic8mJu0Gjt
	95Gnos/mORfmjaGM0v87keH38SEqaQiCfIg0gaw+SMQLfn3udRkGECzTCrBYcxs=
X-Gm-Gg: ASbGncvyaieNG5IgD44rrLGH6/IKnmVjBvFZ2eGDRlWYGQnOSuSlIS/+WX6ZDk1fnmZ
	RGL0PyGP4kSi504uQqFojD3xJEbtLIC9Dvjva5qdkFlvxsG7H2VFuT4Yn20V1CtuwvexKGL+ZtI
	RS69myxlzo1SCREe8rH4UAS4zEuG/F+D8fgyJ712FxOwb+MqKKsr3oocEa/ZHYxxpFfwlz3QcOi
	zH78wwwQSnyCFrvnXo7ou4iL9VhT0LfG03r6vIGsPkn9M9vLCUV70bUPlCi8lM1N31njdamTYZX
	1b0OEEV2LiQk8nkTYjnWCB7CZJWwmA==
X-Google-Smtp-Source: AGHT+IEyfN0BrcIPh71fjjX8E4/Bx32mFLWHQVrIs1Vx7rUsYWJpnXHHPExUIEGLfLu7e/b8DQpJFA==
X-Received: by 2002:a05:6512:3087:b0:53d:ed89:d78d with SMTP id 2adb3069b0e04-53e1b8785eamr3514553e87.5.1733418948210;
        Thu, 05 Dec 2024 09:15:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22947384sm293663e87.45.2024.12.05.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:15:46 -0800 (PST)
Date: Thu, 5 Dec 2024 19:15:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: qcom: Add PMD8028 PMIC
Message-ID: <jnqgccc6penjqmkhursdlbc46xctikvovfa26vlsvttxwqo5zv@uwh7fhixrmrz>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-2-4d5a8269950b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_dt-v3-2-4d5a8269950b@quicinc.com>

On Wed, Dec 04, 2024 at 03:18:02PM -0800, Melody Olvera wrote:
> Add descriptions of PMD8028 PMIC used on SM8750 platforms.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pmd8028.dtsi | 62 +++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

