Return-Path: <linux-arm-msm+bounces-25109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065C9259F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B327B1C220BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21039180A64;
	Wed,  3 Jul 2024 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i16lebZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965A173326
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003407; cv=none; b=mxTNRqENg0Rt815sttRLnftEL/MIlRmJ2FbTjr/9WlVhwt1PQW06qbZ5p9qmEM5j0WXT3l90t0hmUPYB1p9rPfH1YxjzqcKeeF2t2r3HGctV7OaGrNWlAMnNJ8cBOl9TsWEJrtkSTz7xV9NPBsnICDq+KKSqae367LTUo7EmpPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003407; c=relaxed/simple;
	bh=2wxWeoN2eQclXzHkcGpowUW3NZvFsYJvCo5CaNFq/eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3vpwXlO3IyeAF3RF513HVMJTYl2EjpWhKjG8DTRonbZd8NoXGfkFIz9l5DzCC9GohNFMmsLZt9Zp+5SB3Mq+Mr1Oeb3/XNvp0p4G+/p5XKjqjfrKF8ha6a9CMFWT/VNt9WoOSJ437JOh2YCWf02XCuxSojNWpSXWnaOaKpkb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i16lebZd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e7693c369so7115717e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003404; x=1720608204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBebKiAbFSe/AKxcyTneERXqkxEhAYvVNEM7VkxhZlQ=;
        b=i16lebZd4SxtJ91Cj3I2fItsWruqOn9UNE1KoQXAYs3Ca0OZPJ4m8grePTYpLdkQwy
         jcMhIkVz34+nnz9ipL0OkjsQsbW6FUXOEcHQn0qwhLtnE+DiKXqL4hr/wuOPXc57Ix6C
         7dgQc87soRBa9XGeTQli+dP5KG2393kP189FKpi3ck6BZhHMGXlpP6oHB0DZaCzyG9yO
         msBCvNShx4E5lGu+iyITM+Bb/6mHxvClRRJb4cu4pvznRLqNXFb/H5aX/ljGflYoiGzB
         fEsFsXHwHs8KUHMd8002QnFQ1PpVquoM2JDO7/FVX3uYvHciKECOUYJUC97AjhbxqnIg
         DZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003404; x=1720608204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBebKiAbFSe/AKxcyTneERXqkxEhAYvVNEM7VkxhZlQ=;
        b=qqGCHT9wtVn19wMAmm85RRDWX4ShY38zk2jucy0Nl/x/9lHSUVX3+BrjJI2Et95HF8
         CTUwZp6WN5K7Up5j6q3oiNnf0GPSXwGEsz2GhSi0oAyl8JYzojsVOqjSLAWQ9B3rKnWX
         ZD9C942NeIJYS3D5QatOPjhnUFzH2FfdBOPE4GM+JgU8Gz/p2FmMJnavufoxool/hOzf
         c16LqfUbOTZuMWusUlkD7643HFBOUuShzHtWK1nK9iXoHseU759JhDVQ6n8SE5evnp8z
         zv72fD0b0gM5VmBj1GbOQj5Hib7cHTfG7gaN4RpDHZXmZLZnBOjQNSEny/Aj4AOiKFDU
         pPyA==
X-Forwarded-Encrypted: i=1; AJvYcCUnMNmEwT/A7/F3zPpKULKjYjboLrxyVwexZKYpaDRZB4fM56Jgusmd87412+SzOcey3+oUmj+HJcT/TujvanWStqMUUP8o2CkETjtVTw==
X-Gm-Message-State: AOJu0YxMFb+u1p2XKb47cBox3JcRP1Rp4QCZWDbmJVZb2wvZxuZa3mf2
	742hk3Yi90A6RQiHy4hm1okB7IoWS/iwbdUQqafrr751MZYrfwGlVTRqJcWf5O8=
X-Google-Smtp-Source: AGHT+IGperAsreQwk8XnRev3gOt4q7GzktMMONxmuUmn1kwS+TeNOFT2WVeQTw74xTeeAtlxjJAZJw==
X-Received: by 2002:a05:6512:285:b0:52e:9b74:120 with SMTP id 2adb3069b0e04-52e9b7403f4mr111118e87.19.1720003403696;
        Wed, 03 Jul 2024 03:43:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2ebacsm2124167e87.210.2024.07.03.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:43:22 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:43:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add missing
 qcom,non-secure-domain property
Message-ID: <wlqlcrlh4ogzxkbwmte75hvfatiysodt3ohlxxsyzhxkzyukh7@epjxupcod4z3>
References: <20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com>

On Wed, Jul 03, 2024 at 09:03:01AM GMT, Luca Weiss wrote:
> By default the DSP domains are non secure, add the missing

nit: secure

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> qcom,non-secure-domain property to mark them as non-secure.
> 
> Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
> Fixes: 8eb5287e8a42 ("arm64: dts: qcom: sm6350: Add CDSP nodes")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
With best wishes
Dmitry

