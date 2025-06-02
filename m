Return-Path: <linux-arm-msm+bounces-60037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0BACAA67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D0993A88F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304851CAA96;
	Mon,  2 Jun 2025 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvP28q/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A119CC29
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748851801; cv=none; b=WAi9tDpXwS8zlum/Qhk1pwKh+UrgPmxWiFOUrXajWkGAHppK/6aPgVCHblCDeCRoLDOcq31usxu0qTbDmx3T+OG7kDPe1loS3I+d+rgNpa7cKg6Wvy6gnm0IjJAUVBauqWf4HFOg6ojePv1b+T+yhDdVCHvC2F0qZ+y5Dyb1EBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748851801; c=relaxed/simple;
	bh=UxuN13PmIdB/x/BlClqWyqnfkQfE0IdtSqDqp9f4HX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jjg7w/Mvs35ePdogpkcA4G30NqK79rN7dfNQ53uYDud9JN6u+954s5/yGcCQD7BJXdN9QNTsKpmEWHUKr9Wq3ZihD3+6oOv30NKWRZ4t1PlflHdg8sDovSoRWHmLXLX0PPZPYgWN5WEYy6caaei7A1hKFgUSfeSA+2hRmkcxcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvP28q/W; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so7413294a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748851796; x=1749456596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WM86YJxMluttKbsSnclJLccOcH+h2GT9X8ahniFV+r0=;
        b=gvP28q/WinmLrQfEaPCqypmquUgw+vWqJ0uy4+BhlX7mdZSC8yEhHPd+dLDrfMyZXg
         PCfjLW6bCJUuQl+WaU/uKX+DS29v8PC7U6BUWZKjumh9qbR8aphCpgN4Jow4KetG3dfB
         ainwyxsvCLmZMtSLb63QrQqvs6DQYBNOIQAqNJgUp+UdfNhNSQC9WQWnF5s7cc52mHVL
         09ENqn1kLr+I/Tbrua9h0iZVzGiR3L2iPjf9eZjV3kjmJiILv2gSIyZdo/ohVhBQb4PM
         omnDlQeqHVEI/ef6WF2qNE8QFJd0hqWyEKUh1P79L9RasABs9ECbWYIAdCe2930SUkvX
         6/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851796; x=1749456596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM86YJxMluttKbsSnclJLccOcH+h2GT9X8ahniFV+r0=;
        b=iY9i94Uf4aDSwJ7PSKuuggWYhTP82VXCcwaDMNlqommswILNKdORYJnlXqtRcUXT/w
         v9W5oM49+VVKDzlCdcKHaQodl8ukmH0M0DkHv+Z+3ay+Rqqs1UZrSS3qpuniaN5TEkqR
         SUXDefHHGzaC+hBEjT9IJ/wP6gIrLL8fM381raah6AUT6Ut9zUx+D95vrCxlPfMOD0/w
         hpqHHt7y8KR8km0TFGRgd9NH5EZm1YYEOG9Rlv02mCPflZg2o956XqzgH1B4szYxEP9u
         Xv3mAJLgB5/9DS8NRvMugZet7tJNEfVCftJAOox7UqHarFjPlx+0YTrsYIs60gpYzhpn
         ZTAg==
X-Forwarded-Encrypted: i=1; AJvYcCXA/ptaP1wk9rDk/yjCX5p7eovPBGSDY7M3N3jvijXx3K63AfKZYonzJDe+Sqj1ndkjAJ3oDeivOL8i1jwr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ufoc0fS04fR2NMa3NYK2LWcAe58x5CJmc+XHrD1Zuqn6YC8X
	PjD3SBePnKnVLKB8siNs/UZqg6sI01U+RvsRADJwxGDprCyS1DuXaL7Cva7kQPdN5Vk=
X-Gm-Gg: ASbGncuE5SjMFq/JkZR5VnZdTYWHsdqnGDxd08npixYCCP2Izt44beuN+2jANQYK1gZ
	O6HrgTHFK9JewAWvQSK/RnVjirJsPrrIAQyqgCG1Ogko41UjKQIfuFRvZnfX0KfQDEo43A9GeOw
	N+9SdqTWIOJgYLs+DCZ6wKCAiaril4iG7+JZBs/V4niqyb1EXTeh0GdUhBi+PppO/KWXqM8jGei
	2D/PjHqoS2FcvPZ/WgH/WVloDA0i6/Nhm8iqhHgdvCExG0D+dD99azd4QQucLi/dZIJk9p/bonq
	KMUW/fIMuT3nEgkCY3xW7G04RY5ZCgxzpP6VWOpfS67y/NGxIeAwhoPN613ytpM=
X-Google-Smtp-Source: AGHT+IFeKHggw4Jv/SBl+EY7f7TWu4S/aefMDT8Wy8nBVqk5RywZ+kVMfbcR7IM0tMLybaVfbxltWg==
X-Received: by 2002:a17:907:724b:b0:adb:2bb2:50a8 with SMTP id a640c23a62f3a-adb36b316e0mr998861666b.21.1748851796351;
        Mon, 02 Jun 2025 01:09:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ab8c:6d23:1cdc:f4f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2befaesm767977166b.104.2025.06.02.01.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:09:55 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:09:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
Message-ID: <aD1cUF56-IX_tSpp@linaro.org>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>

On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
> 
> No external dependencies
> 

Are you sure?

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (5):
>       arm64: dts: qcom: msm8916: Add Venus OPP table
>       arm64: dts: qcom: msm8996: Add Venus OPP table
>       arm64: dts: qcom: msm8998: Add Venus OPP table
>       arm64: dts: qcom: sdm630: Add Venus OPP table

None of these platforms has a power domain that supports performance
states specified in the venus node of the DT, and the venus GDSC does
not have any parent either. I think you will need to update the venus
bindings and add

	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },

for all these in the venus driver (plus backwards compat if not already
there). And then add that power domain additionally in the DT.

This series is also introducing new dtbs_check failures :/

qcom/apq8016-sbc.dtb: video-codec@1d00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                               
        from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#         
qcom/apq8096-db820c.dtb: video-codec@c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                             
        from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#     
qcom/msm8998-lenovo-miix-630.dtb: video-codec@cc00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                   
        from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#       

>       arm64: dts: qcom: sdm845: Fix Venus OPP entries

This one has .opp_pmdomain and "cx" in the bindings, so it's probably
fine (didn't check if the current OPPs are really wrong).

Thanks,
Stephan

