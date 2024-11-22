Return-Path: <linux-arm-msm+bounces-38816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12099D5CD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 638CBB20158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841561CB511;
	Fri, 22 Nov 2024 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8BcMaUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D54176FD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269822; cv=none; b=ZpMWMFv2uRXmn6BAc+UwxgNQicyWRqQPSgTUK6q/noKqysbrA9G6CEdtgMPdqfZDmSn+WbJX0Y+TreWdQC/ildd6QZ36l+wi7Ru7MQ3Ia2HEg/c4NinlNBWBXfYJOrrg7m8MAj2ovkH2Ra9j81BE99SVzy8XcXHiOqO+t1w05m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269822; c=relaxed/simple;
	bh=hOOE3Hpd3X+IfgD1920kuhEgIKOhGUmIcwAdHX0dcPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+lGrZJVZixUkAp+n4Rd9BNVWoBc39Swc86r6m9WGWc7Tr431CWGhFLSWDfecIHywWni3q3kiukmOPh/MiY136K/f/Lg8pc6cThqOfizY69hy4aZRh0mNo4aSMMNyPrbn5nlhQyNd3d7hO+N0drXz+uWI1SnMiz3lVcPB4+pfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8BcMaUf; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2203386e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732269819; x=1732874619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
        b=w8BcMaUfM9AspQc5qieoz9+IGahqzG69zCWPJdHU3Dw1/m9+79oVCQFsMQtLizX0XA
         Mn6uVoJlIts7CknWpYAyM+TU71JSXDOQEsoFHcfvlPXZAO/+6JXXrN6a70jDK/bm9TXO
         8H1j4eoSIyZIGvsBCT4zq7EluENTrQ26KbKN55xXNFQ/mBvOQKA25bjrN623fc5ItEDB
         CrkjJj6kKwZCX/ryGDO3OtE7jIK9vjSbvxdO3YAVoPP7/sMw6GR6tCqjaYGQ3/xC1qfa
         qpbSLJTncQExP+rbdq6gWOV2rXB4NscMdxKeCqR4OoO1IwGEqdc74ZYh32YTFDszeqEW
         DmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269819; x=1732874619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZLT8I4KDbe++vNVuiTZLA4WW9vKk6hhxnM+ns9I/LY=;
        b=JxHnIj7Tok0NN0PRm7UPKiL9e+uMt0sxutxAqnEWV1Ar5ubqDT8eIEiXeExMygYqM4
         Q8owC1Yx+9gDE5ojRLen8EiG2Q28ubh6eS2yAbX5Jox+i/lS5nm2BOA9IwvH6+wz4moA
         kXWqTjhchWDZJ7dx9mEU9zV1Xo8ixbrt8YF5WV6DAxB/sDueWewPgUCrugMIxyWtj/uZ
         arPzhG0moV4/bMr/3czSoK+ji/ILJqhvGZLb06pd86hd0T5DFMKRnl1vRmFVQ96aQwiC
         MnpTEpSYpHBNrWmWgzETVK2IcT1M262pihozA0KvYhusF1wnMjxlTArBr0kUjeE9rKYh
         t+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU0lbWUn+SobS8O3lOtTF03Bb4IzC+y3RRoVtTzHTILkeSPVF/pThua1Ur1aDSchHUzDgJtwo1QmWHcoICc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ETDwm/vA2KdxiHk52YzsQAdUnfYMR7Tu4BRP9jNURYcw3NVw
	1uMvhkpdtlugb9+1YcV+d39vCBR2k51SJ3HqtZdq87B+G1VGeMiLAQTObUREI98=
X-Gm-Gg: ASbGnctTJFwE5onkaLoUb6KqZxQjfA7xduU4T1SE5aWB+VOfigp2lweiZRAID5XTOyI
	DoJtIuBZW12zQfhOeDs9V3JwibMbBm213gijkMDpG1LkkqLLl0Gr/KHbRj8F9WzLygpfmMuy1C1
	AiRIGpZSo4IKHRPdT46XHFj2bZLGeL3YSA4AKV2vsd1eo92BjfS41VGtGSDLjqflMWrPswn8Ldu
	JK3wOOCGEe0eyWugqTXjysvEku4VFRMqIA71lc0G/WPkLQJAIRORFezUNVasvl2OUCXusVwtsSw
	laovmvxeqp1StKb3PfO2CKoPL/NuPQ==
X-Google-Smtp-Source: AGHT+IE3PHq2qPNqY+QbYoKQGe6R086mqzI0wJSLMJ+g6h7CmPQMNZmjuqoEun+JNczYZAXDctuzeg==
X-Received: by 2002:a05:6512:2311:b0:539:ee0a:4f8f with SMTP id 2adb3069b0e04-53dd39b2dbemr1081114e87.44.1732269818813;
        Fri, 22 Nov 2024 02:03:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24517e8sm318249e87.91.2024.11.22.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:03:37 -0800 (PST)
Date: Fri, 22 Nov 2024 12:03:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/9] drm/msm: mdss: Add SM6150 support
Message-ID: <jquwvnj7s3n5ki63ooz52ys3cbenuedr7mkrdkdujrnza3ewa7@i4y2uhy63yvq>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-4-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:47PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for MDSS on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

