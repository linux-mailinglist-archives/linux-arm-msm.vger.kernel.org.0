Return-Path: <linux-arm-msm+bounces-22020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278B8FFD3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 09:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F4B9B26A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB55915532D;
	Fri,  7 Jun 2024 07:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+zJIW/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43E155324
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717745574; cv=none; b=ExbuQ8DW8yZo0s8UG8OvvYrfllTyQCj4EkRqRyr0LOymjLUwRg8/CVOslpg9GWmAAzDbQ7uI0UX1dmv+xEbBEN2rCIWZBLjNK8G0ZHCt1u7n1jSj/pKIp2vbB2VieD4uHMkmSHA3+nI1HXX47EtreVC13vT2hk6/Jv2RP8VZqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717745574; c=relaxed/simple;
	bh=O6+oViEp1kbL8aKIcxYCYsubyGZ3xNx4hECm2Tlas0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUysBTocssT7YRS0XjzBmD4YfJi+c+41f9I1MBhn4IcGKOs72EUB3GgBKNrNeYXo1c8TpsxEslTbhozEQWmkxDbuv6k1g62iXL+ct4SqYzUcSRe25av0qk6mJcwykDdb8jCgVbIz3gWg4jK9MmlEbFfE0IpKx/KtsyPFnXXr2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+zJIW/O; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eae2d4da7bso2657541fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717745571; x=1718350371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqYi6/TyXsie6XKRZSwpSrdfbRCQyXuW1iK6UpWUpGA=;
        b=w+zJIW/OGMOrwKsuCh1UNBQdhnw0zCM3kaloTziTqv3N2k1Izwirqb0+GO3u09f1UY
         nA7X+hznIClsEUdWq8lXCdSyrskM59c0KdJK21ArbWA1S17idG0PaQVRwtVvmkVkrNwP
         sFpOIK+OJgp8Au5Xv8bFsdnZwf7hWrk2w8+cY0CoYUs97dynSlqlCRrEvOiaTn27aMXH
         ozEbNY9kymnw/+5zVwuxNU/at6KIUKAost42mKn1DaNh5yldP6excXy22sBQMs+jy1CG
         ySp4evN9dyjfNQok4w11b31CXIq048G63TQZX1OQ70USf23ixDuVrFllxH1ASnSuhjrW
         wgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717745571; x=1718350371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqYi6/TyXsie6XKRZSwpSrdfbRCQyXuW1iK6UpWUpGA=;
        b=jEsM95mpkaUvdJvTPJKUqZp9iXuocjqA2aJn+CMYS1pichUDZ6ryls5P3I6ENCClHz
         b/l+fIioneVo3utZWSdvJ2aOV67DixKRz3l5Zgt3OXvqsMgyTk4/RxZJo2GsLiD3rt55
         D+uo3Lb6AxdbBT/95Xn1gPP2oV4X/OsC/1hs0giNgfxN/YqwzhvrcrhkU5VxV96v9kim
         g8zRPCKyH80TfpP8qoXk8ph0cib/pO3VWLEoaS2xSsD0cMkuQg3ro0RkbFowYTTHjbod
         IJPqpG/idxzklL0gRcfj6Z13hVtWvSZ18RQL76E4YB21Ldh2772XIHWR85yWgf9ja3v2
         8vdg==
X-Forwarded-Encrypted: i=1; AJvYcCUtBCyu0S6qo62AvyAcJb7Vic2r17d6r2uP7wJf/taQmENSFuK1dJJ7fEGr9fi70Z84gOoQ7JWoiRNceZIlDK5bNf2aMDw+mOcnoGM6nA==
X-Gm-Message-State: AOJu0Yxt6ChVboXCRZVnmpqMt36qh4USJu+aaP9by2CMCwZR6Paydc2g
	tQkXTlYRgc3KMwhF9xWuGZ4KfhhNx4fROgRo66xyEdIn8cNetWjFgr3WjmsFqz8qyx0+yXn+vuh
	u
X-Google-Smtp-Source: AGHT+IG28HQrJXRwR3UKDPBL8ZjvFq5oTQoYekMAlyCuQZ+jgjGFPoD6PHNh3NUcAihljpkATtWTog==
X-Received: by 2002:a05:651c:1a11:b0:2e7:2d1f:edbd with SMTP id 38308e7fff4ca-2eadce7f8ecmr18873251fa.39.1717745571348;
        Fri, 07 Jun 2024 00:32:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead41dc957sm4492321fa.135.2024.06.07.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 00:32:50 -0700 (PDT)
Date: Fri, 7 Jun 2024 10:32:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] phy: qcom: qmp-combo: store DP phy power state
Message-ID: <dwwqfd3uwfrufvgov46egztdjpwfiyiy4x2fmm5najv3jy7n5r@n5efircs6l5b>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-2-a03e68d7b8fc@linaro.org>
 <du4345tswno5pfeiux5ks5eo37bbydilvdzw3firnsps2ejgn5@avnoqzxbmzj7>
 <ec78bd64-b1f2-48c1-b1ab-b7e2f0b9e24d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec78bd64-b1f2-48c1-b1ab-b7e2f0b9e24d@linaro.org>

On Thu, Jun 06, 2024 at 03:29:52PM +0200, Neil Armstrong wrote:
> On 27/05/2024 10:59, Dmitry Baryshkov wrote:
> > On Mon, May 27, 2024 at 10:42:34AM +0200, Neil Armstrong wrote:
> > > Switching the PHY Mode requires the DisplayPort PHY to be powered off,
> > > keep track of the DisplayPort phy power state.
> > 
> > How is this different from dp_init_count?
> 
> dp_init_count tracks the DP PHY init, while dp_powered_on tracks
> the DP PHY beeing powered on by the DRM DP driver, those are
> not the same state at all.
> 
> While testing, I figured that de-initializing the DP PHY while
> is was powered-on by the DRM DP, caused the system to freeze and crash.
> 
> SO I've added this to track this state and try to de-init the DP phy
> if still in use.

If you are to send next iteration, please add these bits to the commit
message.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

