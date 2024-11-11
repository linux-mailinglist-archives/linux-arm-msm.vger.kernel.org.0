Return-Path: <linux-arm-msm+bounces-37444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA29C3729
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 04:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D161A1C21759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 03:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73B114A4DF;
	Mon, 11 Nov 2024 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3DvrBT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC14503C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 03:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731296934; cv=none; b=In1ijTOWZGcoNA+R29xx12WaTu1ajMc+5Y6ibnKiKJUqmSlHQtrAQKAEKY52pCRVyipZbQGhQikrPsvkYXHpqHLJxZeP3Ql8FaWOdsOrNuN5IGdkKTpcfeKMpuE3qIv/nYuf1wJbWKP4nivE4bpO3rvEw6tPradxQj3JUcTkxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731296934; c=relaxed/simple;
	bh=DAqC1m0UzBkEna+kh4qJ5m7WFoRARHIRxJyd6v1CUH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koQ1z7V6kk5R5NKHdbM7RCkFFqn2ChmL/qW8le2WpS90tO7JOse2rTv5+1MII+30onGvxdUOl/J5x/mWkpls639lQtFHyXE+Oa46tYrJDKn7+sX0BSomrDahF1VuL1LEiij8OYwXxxRJx5hakl9TPjHyoaIZFmTcx0EX99N04RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3DvrBT/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso2924715a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 19:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731296931; x=1731901731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cyBoacIe/beqOmXqqDNGWcJXEOI0SPSE7QTB0nEVwZQ=;
        b=e3DvrBT/J+Htj8XjSxfaDDW04HOp1eS2HphyVdXSYkGtn3fZiUTrmXQ3SbxispmDTp
         KN/Z4Rpvj+syXIsD1zK2DbcmrBOssx+3eHZJ1X7txi+9rqgqwktv5oileP2rTJibWki1
         mi4zv+GYszyYnVVO2GwuZ7CK9+n+cu4MatDW6a7DhdiUDF4mUxZUC1VOFn9VzAgvhbId
         xCo3IBjwn9gk+alVOXnVKcpd22s9Q4g4PRvcZI+S5dlRUIcqdsmP67Ok6bJWbSdSDKwW
         1L5fghlHRNXhJdADYithh0e8l5MVN1+qBK4DyY5nbUgvoMV43QL1c+t/KOcnicVHmXB3
         0lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731296931; x=1731901731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyBoacIe/beqOmXqqDNGWcJXEOI0SPSE7QTB0nEVwZQ=;
        b=f2DsyjUovqGZZ2wdcnhCC3qFSCN1LI9MOUm2UygloB1uFAbLuWEEcglP5bdiFI+61h
         2hxaTSikXo8Umg5Gb4rXw/e16/gBLtOUc6n4onBGJ3kpeUPAftTIyGozUAtNnOxIySDl
         dI604ad/pYAEaJHzxi2iFNgpaSZ2TsVU3bus4TJ82O05FB2wC/6beVHpQcD/eXOefQvw
         az/WDUF4E2+0DWEBidMuO4KuERvjFHDI67I1C4QvJ+TVJ3A/xqNcap/eNc/QFCsK7085
         Cpd1IqktN9RK1uUJqKqFzSVRGGthdtg0+M5hnkGT/7e7JaSXbTKxsatvKeWQhAY/eOvK
         P/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWhnxhelgLSlgfDqCs3BBxomug9VQ186LgvOu9HFJAQzXgoypUFL5ArgV/SNmYZOPTH4OZx4+OQCp8SXui@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xB0erfAXIzh5XS4p9X7XSDaSEGoLCLXRAePQqRbFaRBVML61
	2+KZqaP3VKL54jNKwRg9YNVDKmvFzSxI3idkWfZ6/gKnGanhf9yNsPx0eIhsrjh/f6xpbXDFq49
	b
X-Google-Smtp-Source: AGHT+IGYrXj9oPlPSmY8T67CTPIqdUFk8LRkxz3VZqL+QyxxAM/tx5DxSPFaPEc+Y36IKUhOf2R9rw==
X-Received: by 2002:a17:90b:39c5:b0:2d8:b043:9414 with SMTP id 98e67ed59e1d1-2e9b1f8e54emr14638700a91.18.1731296931268;
        Sun, 10 Nov 2024 19:48:51 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd180fsm7451733a91.33.2024.11.10.19.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:48:50 -0800 (PST)
Date: Mon, 11 Nov 2024 09:18:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	morten.rasmussen@arm.com, dietmar.eggemann@arm.com,
	lukasz.luba@arm.com, pierre.gondois@arm.com,
	vincent.guittot@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH V7 1/2] cpufreq: scmi: Fix cleanup path when boost
 enablement fails
Message-ID: <20241111034848.wyryvgeqvu33jilm@vireshk-i7>
References: <20241031132745.3765612-1-quic_sibis@quicinc.com>
 <20241031132745.3765612-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031132745.3765612-2-quic_sibis@quicinc.com>

On 31-10-24, 18:57, Sibi Sankar wrote:
> Include free_cpufreq_table in the cleanup path when boost enablement fails.
> 
> cc: stable@vger.kernel.org
> Fixes: a8e949d41c72 ("cpufreq: scmi: Enable boost support")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

