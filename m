Return-Path: <linux-arm-msm+bounces-18518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EF8B1A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 07:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704B31C20BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 05:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55273BB4D;
	Thu, 25 Apr 2024 05:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="suBrA2gp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513E23CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 05:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714022485; cv=none; b=btr+cxIbkT7+3Pn+L8PvcHmulSQh5KmJ6BCNlRbZT4W/cMryobt5gjUqvtTYvT7scLXgDXh/atJBKOLFRMaRXmX0xo7qcVHJIZ5W4OcZleleYQdQgvQKC9tWY2OeFNDXm6A3lsJldHJ9W99KVAO6y1j76SJcsDDmZ6/d1NSxcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714022485; c=relaxed/simple;
	bh=a/Ze0XaYIX82SEU6e5VyR23SvkdBDxsyR/DAhqj7Vy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpKfxxntHjhT1RWCphj9EsQglNB79rVjfsGCDbcB2gpQOz+LJikGEIKkuupLWJ3nVap6z7RlXYWJh20OjE6IcHbg7EeBPL2mSWsICF3rROLes3oxiXDesCx2D/napJDgPBWjYLjPlV7L0I17jykSydyItanzx8h5HXtw0FrZkPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=suBrA2gp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso3471965ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 22:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714022482; x=1714627282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hfPEYMjCse3hc+5i+GB80yGJpW4zA31MSrCQZzYF+HI=;
        b=suBrA2gpIFGxodgAuFQ4enXYFu7G9fw3HJ7UoGyB/1Ookm28P/aKzT2EBkKtuIR430
         MAXu9v4OAcrB1jhGKMFvIwCMELhYoSrY3z/efn76hDp4DxdCI5mKPJ0wSoRvqgYEJKLp
         Tr5urlQyDSL0ehhlRZ4FQmQDwckU+D9B6eKY0IHDyHjBNTQ9tCpOXhz1CuAp+evCbMHg
         mhhWpwZSjloAdcyfxCKNH2AtEIuLncaAqHGsb/XrPwl2QpYWdFQMCoKq7UovARpDnjyg
         f4KqSeZgj0ANm0tOcKhe2gqZshWgD9rHmFSdLqRaeVFMu2VpfHYKWTClLBVzmNbsl8nb
         kpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714022482; x=1714627282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfPEYMjCse3hc+5i+GB80yGJpW4zA31MSrCQZzYF+HI=;
        b=ofqetWXXTDK+z4RLjo0mE9FRbLSeurhdW70K6mCiTJcEbkvHclrzBdbIecMmtMh/5g
         yVpadRrTnXFfI//TyKFz/b0LqA43Pvz3uQLQ64dbvZ0PwOKzW1g5GRrGFpQFIR9AcGvL
         ptdcoT/gMKJ5XWtDA5jB1NRLhkp2AJWUg6M1l+ASVD0WUlbFOpSfmXDMT9KokLSpUN/h
         updrHz17mEzUJcOD8ldf9r7t2aFpHfQYd3Zeid8GAofy+721x/RD0vGbKZBS5sxzawQ4
         p7DF5+0nNqS/qdmWZ4DHSa2V6n3gbOHtAtFRiGZWvGDPUHI1yEXHFhZfIGbgWe+lcyXv
         qgZA==
X-Forwarded-Encrypted: i=1; AJvYcCWyx62/nF2c+o5yvvFvFefVnT7yFkldmow6e8t4D+q0nNggapi3YGsm1ihpxB1m3rD4/t6TKIdKJlMfxxX8IcL7bmjLqMyD3yFW0rKJhw==
X-Gm-Message-State: AOJu0YxsE4XBtb06IA6r1/qVLyeXCyGcvBnYLxnwiJc6Ez6/NWo4+vGF
	6Eojw8KQPCsdpMniL4tA3qvw4qPDscJWyoNjDyL1GgMuES+fHp/jQ1pQHjqH8Fs=
X-Google-Smtp-Source: AGHT+IHsjEPrL6/F99lSPpofK2eJpm83AjyY8IbLEp7TdKZ8z822eApg7+tOx98XayD4XYnylEbyaQ==
X-Received: by 2002:a17:903:2985:b0:1e5:2883:6ff6 with SMTP id lm5-20020a170903298500b001e528836ff6mr5973817plb.11.1714022482116;
        Wed, 24 Apr 2024 22:21:22 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm1140996pls.20.2024.04.24.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 22:21:21 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:51:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	manivannan.sadhasivam@linaro.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM4450
 compatibles
Message-ID: <20240425052119.3hsibpa4to6nzll6@vireshk-i7>
References: <20240424101503.635364-1-quic_tengfan@quicinc.com>
 <20240424101503.635364-2-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424101503.635364-2-quic_tengfan@quicinc.com>

On 24-04-24, 18:15, Tengfei Fan wrote:
> Add compatible for EPSS CPUFREQ-HW on SM4450.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied. Thanks.

-- 
viresh

