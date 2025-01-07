Return-Path: <linux-arm-msm+bounces-44171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D3A045E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5446F3A4CA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB081DFE00;
	Tue,  7 Jan 2025 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JoO8txH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A21D8A16
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266937; cv=none; b=dip6/leSDMudtHHDtJ1sX/LGyRXQ9l2i6ZmM7HCK4ma06A7oFjxeGHKONs2dTW927beSnSQQu0K/PDccYoIp9aZi7FrsdxQZv0S3xraqgwGE/GkUM5dEV/mFeEuyG2oln5FcKTvIj0H889QI1SfBWJn5JtMntzwF9NO1VGHQPLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266937; c=relaxed/simple;
	bh=nYeuGRAzWSAqm0i1toD9NojH0pcUbP4C6vl+ciNCGpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYqZqHjZBOcITPh5FtLwbzwFh0panWrMYkHOHuDj9Ji6GxLd/phqkYe7iP/7phVD5g7dXMFpY1p+HOuxHj6lFO/rajhsdvcph9zokT8vWX2HhbRjWz6jIBIILbP/xljIw3GgQ0pBm7kTvIYNepp9uqnsuQpth2Nl2bt8DWcMo5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JoO8txH2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso16702927e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 08:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736266932; x=1736871732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkFKJqHVSHPk3u3U//GsA5+PwazR7k+2DTG8S4hcJi4=;
        b=JoO8txH2C7/CVoSfVjpO8ytz7KSLf8kPlqn2lyEBF+63bqyiz27GOUmdVz6yWBFiU4
         8h77vcNrMy1H3TZDZwjT6s/nwEpFZ8A1jXOQ9Fvc+1CbjuK7/wIaEkASdWxLzsDRC526
         fkEq0DZ9dQXBZyZiwWuewRCKCadk56wpmzzHepX8eEefWsc+a+blBRfFWMHaFmfL5xYo
         WGu58bPFRO6wP3cpKyYQW9BYT6uxq21xYFYDy0YlyiiTy1mI5GGbaFlKxHDbllOH1Rvq
         ElRhuUGkpDszI70Z/Qu7lQc6ygacOXaxo7oZdTpco/rwqWt+40581+605fZx22pCISQC
         jJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736266932; x=1736871732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkFKJqHVSHPk3u3U//GsA5+PwazR7k+2DTG8S4hcJi4=;
        b=uwkPiDd3BnF9oFD5Aku2fweExZ/kXs+p10s/oUstKdZa9ZdPTI7IDJkKSLxjCgZR+M
         kv6CWGgH9x9yTvRKCRNKtjMqr3SZH3lHhDyG9JvPIWXKRLV08bVXxER9M+Z3PBnzHS6t
         jUq7yeSocbH/SouoGfwBlG6oV/etFwrcZxFVpbJqB89AB4q0f5PwFWvCvCxmS6YuryNb
         uYCqa91IAHCjyF/pg2+14eRDWGB6HGXGw32l9qHMRpz0IFpWpdLnh+4ySLM3anyRyQCr
         plMspmX3GYp4sVkp8voZq2ccWm7ROdvDlTNEvDekktsskxN57+VHHqCJSsGX0rzU6sT6
         NucA==
X-Forwarded-Encrypted: i=1; AJvYcCUwQ5NAwr1DsHd4FhxjTL2OeztwnH1hJLqSKGziJb8zMYpKSaxLaMgD3y7ba7moh7NtiRwydJBUU2HIoP9J@vger.kernel.org
X-Gm-Message-State: AOJu0YxLceQdguyvKQWtOzmJgvxqacoSydSZ29ahBsJFGzRe/zun5yo/
	1+vZc6QoIRGKU4tcBQFhZ+KWZ4rBQ/p6iXoj2XdosGn0zjAeYypkB1uZKBxBTY/tOgFWBlZQkX4
	m
X-Gm-Gg: ASbGncs0b9/E6PK7srXjlxA9uB0VFTk5wpdp+PI7a2np2TH02cg82EIK3tBwhTXfSIU
	zTE0rO2T1XUCqChVYcyC+YHc/fMOOYYQFAM9TeaJPl+HIsVc1Gjdgvn8ufKe29lCcZszPs4+Ekn
	4GoiCduE7Ci816NZiCN529wzGcMKi6ZmafSAp1klEHJR26qcAteUR0pF1WgIXMZ20hXEPDyCObP
	05pgCxlEODKZHN92NMc8lJEVEX/pFBiFMWLQT8Uxudraf/uBoN00NxpVAilzj2yMfa4yltlQmN0
	rvohHZ6fOD08YdyAYpABs5f0xCVZHSs1AVKL
X-Google-Smtp-Source: AGHT+IGtqGmQLedZ+Vatz5VsSVwy8ZasBv0bOPWszqj8gilIw3F7sQRsw1Qn+yjOdhMYWmEg1hRSYQ==
X-Received: by 2002:a05:6512:1044:b0:542:218a:71a with SMTP id 2adb3069b0e04-5422953ac6bmr16878173e87.26.1736266932196;
        Tue, 07 Jan 2025 08:22:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b6csm5306632e87.273.2025.01.07.08.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:22:10 -0800 (PST)
Date: Tue, 7 Jan 2025 18:22:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	neil.armstrong@linaro.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable basic Qualcomm SM8750 SoC
 drivers
Message-ID: <zgz6jzbir5oxkfatmoq3dv3a22diqoszqzefqqcj3z4p2itwo2@2pns4wqlrxfs>
References: <20250107155452.389154-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107155452.389154-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 07, 2025 at 04:54:52PM +0100, Krzysztof Kozlowski wrote:
> Enable necessary drivers for booting Qualcomm SM8750 based boards like
> MTP8750 and QRD8750.  The clock controller (GCC), interconnect and
> pinctrl drivers are considered necessary for early boot debugging, e.g.
> via serial console, thus make them built-in.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

