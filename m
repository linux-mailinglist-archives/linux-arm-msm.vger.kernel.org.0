Return-Path: <linux-arm-msm+bounces-49609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F686A4744D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B3071884892
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1201B1E521C;
	Thu, 27 Feb 2025 04:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2GY7uxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB22014D2B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630041; cv=none; b=B96XVduedIwtFfsJLe7kAnm/dNXbfNuC2yk3uoRI6ca4MGuoq2Dyr0/Mk5QgEc9V1XJaXo5KP0CJZ8SmBe+EcaeR+X+mcpAMMAX65DH8AiOezX0pLbG+W/GWirWdZ2RKjgvvFe7LgXDmbP8/pMdz/VG5Bz/pqoZf4RifzHltzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630041; c=relaxed/simple;
	bh=D1qPXpKSXGu0P/skKJ8CN57rt1WpnhY+LrH45X3vgoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=envJx5nrmwbzBMf3pm36pmC1Aquen1grkKCndS/yjCMZTkaQPLiDwM45SuASgHXryoNyR+8rWNrfai9rrT1Kju611ERz1v/czsV/Ni4oNR0jHVXfOc02StcMe/jP9+qtX2HQj9cAhdO+U/k1QYdBg61fKjhYcZo5kktjk9v0glg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2GY7uxD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso520387e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740630036; x=1741234836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8u23IlmQo/koZdDGMXILeSJTNSguPrHqDNPpEEp+yE=;
        b=l2GY7uxDTYGSdPLCjCZocnRFmMU5D291UyK1PEYdb1r3bWiR0WQ7NpljWZqGMYOnx+
         Ndz+MM7EoeU4CX5kCI7DxLBfITHtZIWYS3AK37bPW6DTObnYr3zhqsOOosAV9bgite2K
         0JFF33A7YhiSo3KNNgnSYSkikk5MlN/nFjQBFzTP3z92HzYXTrQpDaddTtOyvrixT8Re
         HVTCaszn5gmIaXWjf0JhJodgz2zyfm+3h5LYTWToFHzk/ljHRLbF4UJrxy4cdHYPUn4M
         bF2WxDeZlzkQ8QDJuhkKba3kJ8tPMcqkLIDHuT2rXK9J7uTgkkWLN/tlrKh1HYsHJIFc
         9I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630036; x=1741234836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8u23IlmQo/koZdDGMXILeSJTNSguPrHqDNPpEEp+yE=;
        b=vbA/dpOP6QUwxvmfoTwp4zUwExrckkwKjUGbxrDgHSNiN0UmGtxFvdLR/sS2B9I5Rl
         YP/RqPMReBqLh4DtQD1w7IPs0SY8VB+fACjo7EPdhMrk0y8rNbC5JrgfNdwI3QVTbrcM
         bd1SZmPOl7rvjR550oUGKFrPWmTiRoUF9xtnK5GSsV9HdYdSuy63gn6aDpImgdTABYMK
         ROTD6gJTmGpGddl2cbe3PT8LnrjrSGLsO6UvtIkdtgmnEpBwRExzp6kbGs6+0dJTJ7cn
         FJya+D8TaBQueyTHNvBbz7QyF//kHo4TrZ2ZHLALbndnZpQXJHWLFH7Y+xoQBnxPg8P7
         3Ilw==
X-Forwarded-Encrypted: i=1; AJvYcCWVgqKzOTsGFN7Bmp6T3FI5USbQqBSROiWI56/D4iwey6IodguZLrL1Sg4GRAzKcz9AM0EzFYFlWVi98Ehk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Nk/tiiqNN+Lhj/ZviS1AO733oWlSZHPYbA0jFHOGV1YtOn9j
	X4ZtmYE9fTeoFKgW4FKHsMA14x77USen59cA8ZgbyFD0coi19BsW2yy19Dx0gvU=
X-Gm-Gg: ASbGncsGndUBuDDWxtl88cX1yGtHq3YBrj3iCkvHNQgqRtuDWnO9eBNfhle0f3k1ym7
	hJGeA7ZZURT3Levfo6loVfgwiMx9UOZCqWOl38+JaUt8/oxzYdRHWSQ+Gc+6mjovRQDx9Eut2Bu
	MSkyu1FaSQQ3FjMmFTO96QTJjIULeJ13uby+s3TCT5yXmY+Hx4Q80ImaWc+kNEDm2nsJbKo7F2M
	susrCFnX1YxGWnPDYt5mI5h7G4TwSf4/QfyoZ3FLovFQqcHHOvpy/NUfl++9OqU0jNoqSHYVUMK
	xIV5o8v1TasH5dbmym8JdrOMZXGjw9SadOdXh2F8p7SByWTZvPYp+kBnq/GzXC8hQc4mqlN9lkf
	UgvS5Gw==
X-Google-Smtp-Source: AGHT+IGmU3ylt4nfxdW8+V50WKqSc6Rh6GtYKcalxG8gKf1aJ0RkCuq7iwjbHF3whqn1Nc8rCjt6iw==
X-Received: by 2002:a05:6512:234b:b0:545:27b1:156 with SMTP id 2adb3069b0e04-54838ee91b3mr11320521e87.22.1740630035977;
        Wed, 26 Feb 2025 20:20:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cc9d3sm61249e87.224.2025.02.26.20.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:20:34 -0800 (PST)
Date: Thu, 27 Feb 2025 06:20:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
Message-ID: <o53nnmt5ypuoms3b37lehtmpwloudusr7647alehvnwsiltsyo@grd6ua7mh4o2>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
 <72cc2c52-1d0d-4a60-93da-14acd5947f1f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72cc2c52-1d0d-4a60-93da-14acd5947f1f@quicinc.com>

On Thu, Feb 27, 2025 at 09:42:39AM +0530, Taniya Das wrote:
> 
> 
> On 2/26/2025 10:12 AM, Bjorn Andersson wrote:
> > On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
> >> Certain clocks are not accessible on QCM6490-IDP board,
> >> thus mark them as protected.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >> Mark few clocks as protected on IDP of QCM6490.
> >>
> >> This patchset is separated out from the series[1] to remove dependency from
> >> the LPASS reset.
> >> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
> > 
> > I merged the patch adding this board in November 2023, are you saying
> > that for the last 15 months no one has actually booted it!?
> > 
> 
> I am not sure, I had got request to help boot the board which was not
> due to these clocks.

So, was the original submission in November 2023 broken or was it broken
by a later firmware upgrade which started to protect those clocks?

-- 
With best wishes
Dmitry

