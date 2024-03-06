Return-Path: <linux-arm-msm+bounces-13401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D2872E65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F9BC28B728
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 05:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA741A58E;
	Wed,  6 Mar 2024 05:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QU5plOdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACE1B7FB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709703125; cv=none; b=eXL7J2vDbpgvxedAy7QNkmS++MwBFJE+8bkvHw397tLL6Y3zlNQVUGqKGQoliaJxjeSF6nk4p3p4cxq5iLruZR7ZCM8OI2uXKAaP1FCz7RAQ78Jkzmm4f7nQuvdt2ihBn3OEWGOH+ZENin9kazMXrxAMDIbVyPWRpTUoFCQuf64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709703125; c=relaxed/simple;
	bh=8ZwdkK1o5nMt3H6MI7q3MsTaBcRoHRpzOrtlXg1QdYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHkXcHmCfDOZs7Rqay2FjEq8xoLnWr2yEdpwX02WJEutUKiIhz6zioYQs8po/JJKUTYas+btEPkLRhTaoOyzP+r7z+v48cyISoqk942V4BLKcbPixZGvVVLIIDIoIb6fnKVSSxU+k6TOZNOcvJgwEoCIXUhA91Ft0mMYOc1mdek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QU5plOdO; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29abd02d0d9so4233048a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 21:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709703123; x=1710307923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vv4Fvjj+hLabaioHe5ZIqLRtWmYmjjafrhYl8vez/84=;
        b=QU5plOdOMaZ2M3PqJtRnLIvX7WLc2fTDydctUa/PXNSO39tm3np6CyK82JBZf0w2Nj
         ylMNDKNmmpy9Q7bxcDHRFPt4kk2oOd/BnA0vpup4UF8arNRxytjoLKBqyto7Nx15Tw+b
         lbLj48IfcHac6vbWshP3KoA2iwcCjtj30Zb9OMWHK630hPo7Hc+uiiHKuTNv1VCrx6HU
         /nrPHhkaOWZrzoOIWW1VDCmK5DL4E8/01LN5xIITJtQKf2BcGwoiTRN5QvL2tGMM9u+C
         tq+D05nLCFnnzVNI8UIs4JTPJEfIzzFIGi8QFYGKMj5Oegu6XGGRY5/32Dc2nCIcsHUl
         IZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709703123; x=1710307923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv4Fvjj+hLabaioHe5ZIqLRtWmYmjjafrhYl8vez/84=;
        b=liQg1ImLiv6z21E62HbxyeH3DV2X022Tyi4Qd0AHE0Svg/Fe/IpPmQ5d5lJkbaycs4
         QdmG4zEys1rmQiTg930y0crmWbPq0wn7JyKJ32j6ofKKZuj5q8mo6WOQ/6N1Br93ThDf
         +xCLT7lo/R/9tcAomMjgUvPZZvKV3CF1WRM8eJwiUFuUbzzzbK9Ci8Cejo8iu+tgYRDV
         uyojWHBqharAEAAsEbKVkXN3FMt8M4zv9ePcRWFv9/WlAyAXbjn7EqkyOiGdBeb0IrTS
         Ypqxy4qM843bLQx59NQt2G5xz534BKwOOc3F48en79kjDhm+XVxTtgA2j8r7kOUMJ73Y
         ylOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB/ujYqCjxYBDia/rsfolLupvZlZzJalTK9m5e+bBrIYtyOfEBVRB1yS+f9eySPi0YsP8hL3qGsNeCfDpwWk1owWxoS2KKNV0es9BnUQ==
X-Gm-Message-State: AOJu0YyK80XHhr6UVYKaLsUhVpmXacsK6ywXHKSDZSIjRRIbR2Qo5Pp4
	Lh+ZOjhc23mRnfZGgFjgybM3ihWcKsb/gGfbM+fVPa52scRWfNoCbJYrf0CZ+hs=
X-Google-Smtp-Source: AGHT+IF6Dp1NMYhSjLZXpcOkBAA67LHH9kSdq+ASxfFf0Cwmc99nOfJajj256GFSS2pOZvaAOvumWg==
X-Received: by 2002:a17:90a:bf01:b0:29a:a1c7:fc28 with SMTP id c1-20020a17090abf0100b0029aa1c7fc28mr11103516pjs.10.1709703123176;
        Tue, 05 Mar 2024 21:32:03 -0800 (PST)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090aca8600b0029a78f22bd2sm9658195pjt.33.2024.03.05.21.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 21:32:02 -0800 (PST)
Date: Wed, 6 Mar 2024 11:02:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] cpufreq: qcom-nvmem: add support for IPQ5321
Message-ID: <20240306053200.6iwrviltwt3pnfnt@vireshk-i7>
References: <20240228-ipq5321-sku-support-v1-0-14e4d4715f4b@quicinc.com>
 <20240228-ipq5321-sku-support-v1-3-14e4d4715f4b@quicinc.com>
 <20240304071222.cx3s37mphddk23bv@vireshk-i7>
 <20240305043503.tgy5ahl243or7lm5@vireshk-i7>
 <c82e4053-4cef-4010-a734-4dc537574201@quicinc.com>
 <20240306051809.rk4xhl47zai7um3n@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306051809.rk4xhl47zai7um3n@vireshk-i7>

On 06-03-24, 10:48, Viresh Kumar wrote:
> Bjorn,
> 
> On 06-03-24, 10:10, Kathiravan Thirumoorthy wrote:
> > patch 1/3 and 2/3 are already has the R-b and A-b tags. But typically those
> > patches will go via qcom tree. Do you want to pick it via your tree? Sorry,
> > I'm not sure on this...
> 
> Should I pick all the patches ?

Okay, there are conflicts for the first patch itself. Bjorn you can
apply all the patches.

For this patch:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

