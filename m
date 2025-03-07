Return-Path: <linux-arm-msm+bounces-50605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9267A56062
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EF0B175E59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04821C27;
	Fri,  7 Mar 2025 05:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaiPhB2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D65192D76
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326675; cv=none; b=tkG2nZcDyR1a28jGK1e0S0M1r9osSMD0p1TujXX4t5Fc4LRrPqdy/MpN/uWygE1XCLPL6HiMGAoshVzjOVlIgooMY/Lrwnq34NWKDJzmx/WkFrKLzytEi+GffRigUh3MCIXMXvrfksxOOxF3gHQ44maGMBT9Y28HwKNdravezmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326675; c=relaxed/simple;
	bh=i0+vWPXN2cdkzD1NTQZZWBolbNXz27fwbs3BiMXdQ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWr/4FQBtqjA0dsYcX2t5gJPKVBaCPLLPa5m+LwFfNEIGK4CWG/24A41eJmFkFNwUkkMiGwfh677mEYfO5xHzOMAPsh70UnHQpriudJEG7P+8Rvla3InEK08jOFumQV+XnBm7+HGQPo8ealdWHiIiuw7dWpV45slykrNA5YJe4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaiPhB2E; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so2957011fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 21:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326672; x=1741931472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
        b=MaiPhB2EOvjjLPWLCzyqtKFLvB98B6FCAOdU3qv48A1AxEGKYkWG1rzxw5VoHd9l6j
         IFLnoW3ffmqGHcz1cp+5gjl5TrlW2pbIpuNDhn1hHVCHFqVdoyneywDveYVciR2N3np+
         OMfZ9j+92f01e9TRBq7ZVvMtvT1uNMWa0FjBLyMs6CvvsMPQNF7CtmcY8oakN+OxwWtJ
         CJuJFc+0jnovxB8eCL+jHdrUCTVFJoT9VzwajsdOwsiPI/9nv6SFEC7D1NyuHQZd9yzW
         qWi5ug0GXGhMwevMpw7+J0B3EQ6jQHXd4stP3F2tti+BpG8QIOBBWqlhJJCO2oR+08LK
         o7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326672; x=1741931472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
        b=FegShlqQYfgKBFuejgjZRPndUPJOEgN1XyxuI/gpxu4Fir+a24cgeBoWmVih1ezyUB
         QlCVG6N4G3GyedgdtIjLzWQfW8e9z8SAz20/7F8X7ObZ1z/vJX2y4J1JbGHvxz8NMKOr
         fC6UN+UIlraa3Tm238ygX6RPHd0EI+wqVo7+toys7yqD4ZiWGcFHTlH/8cKjlvoSjaV+
         l6jlzhyvmBw2drDjkSC5HVR1w1P8QvUMz06Kh/a4bJvQNGzaXK9f9QG9ACvKjPQFhJ3y
         rlpPtJj1y17qekL01s7w/uLVG/ES7hjpa6f8YNQ5/ONWh0D0tSDEn1tU91LGbXkfzFXt
         u+6A==
X-Forwarded-Encrypted: i=1; AJvYcCXx2hDUdF9Ljj5sM6EcptrDNQpgnKSi7Pv1twee9ZDfxI5Qw0lvb1hx61Q3TlA8+lnB6f+79rcbrfn5rCmr@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKETzjAy6NSdjc2UnDIw72NOdfJWZw04e3Z3cbESfHOSCv2Ln
	R3XngRwt5t7kOB9S8ERBtmFPfkoA3bPJwz3mjsZ++Clqzr+VXZPsrqqjCguTo8g=
X-Gm-Gg: ASbGncs8yUtSaTUdChre7b1cKxswr/dZB9qLwekbfM3wokcGB82ObE4PBLjDLvtc+c4
	LVcpbEdOic/BlNZsX2pLcCdksy6wbUKqouuXNnuIpUhXnSZAFbXXBFOh3KyQgI5XFKBzJ0MWYzB
	WfYIeipfdOg/yQz8sXifnA0kcCr56skeq3sCI+xjIxUDv7kDpaQ+fkCs9k+LPk88mC8yyHMx+Y+
	/Umf1rx3YXvEKX3xrpZj3gXw0sNu+eLb/My/UIVHyuKvyWn1JEkHxJF4Pd42AS8C0xrMryaLrwL
	pLuBbdAlj9b1FgC4vlXFcyZ4pxVevkWVI9gg9l/nCNKhCUJfUfLAh77IKohXxEWDTbqP0hv6Nwx
	Isze5mxz8xcbwcNqROaWRZ8HK
X-Google-Smtp-Source: AGHT+IGZcu2fypEgK7clxXmR93TzJ7unEXU/+kahsKp0+Qev+odXPrrlaC4iINRI4Yd2AzKHpypLwQ==
X-Received: by 2002:a2e:330e:0:b0:30b:eb08:53e3 with SMTP id 38308e7fff4ca-30bf45360acmr4804561fa.17.1741326672025;
        Thu, 06 Mar 2025 21:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be9a073d0sm4291591fa.112.2025.03.06.21.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:51:10 -0800 (PST)
Date: Fri, 7 Mar 2025 07:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>, g@eriador.lumag.spb.ru
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 09/11] arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop
 clock-names from PS8830
Message-ID: <bth4rfqqu2bat24avosimvxuqmruc52taues4wljnhfcmxnx7m@zkjvf32oiogt>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: bd2dbbb1f35a ("arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

