Return-Path: <linux-arm-msm+bounces-26271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C7932043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 08:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D90E283F17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 06:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653B1A277;
	Tue, 16 Jul 2024 06:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KAsr8bZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B246918059
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 06:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721109945; cv=none; b=T16xrhfd1+S3zOB2eQrdEJWg+b1e/XOWdC0ivt8ogQGTgK0ovMbc6klOiUnr78UgieBd6ysuqRBo/MFbAKnchh/Rylv13ferdimSaFvsOGG06bTU0SdDaccNBdIuS0x9fKu/EjrLZuhLyaRtRCJbpYLGVJbhdkaqcggWX6MveuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721109945; c=relaxed/simple;
	bh=gRFQNWu34dknQ+rvjmZpgC6AueEx0tvylKHT2NLukGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hX4Uh2q9+OGWPBNQJQDn/E9fTba6/vxm8/oy9D/gLbNkEiPxnuelrPcD/+ogA+ApaZttTNpxwpQHnnKg9wEEmnGsJEAiKLe3Z1ZlnaOD6uYG9O3qA+fiDSJ6ZyRCZsWNCO1dslK2LKxLxuBMXe483hIrka7Ebm7Ur1LyJTSTE1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KAsr8bZ1; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b702be5e4so2544537b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 23:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721109943; x=1721714743; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O10iCKYxk+ue4943lGDmv3A7VtKpJBt5vhwqbYGmtnI=;
        b=KAsr8bZ1msla5EcALbtaTXjneJyPPG9jUzWxcZaSTSui09EkNMW+wdDptMaySqNRVp
         Ph+5hhQbNJ3ZgARox9BI+aSXnYD4/XYUPt0i5MBVJJGEXIqOgl1aXz+Y2EMzzUEwb3Tk
         O6mdHhw36iCP/LfLMMQZxCnPPwH4U/oeDebr007yNfIL5WxObX5TuIcCLXQeWemOydfa
         nyCSSSF3xVSIva8XYxwi+hFVoQfrB1aobE3LzUom7B4/PkgNZU49M1LPNrfltTTQdSP4
         k9NCWuZ0YxcdkFPeW8p2CL78Sp3WTUpVSRPil00z3aNCdvHAoQ0qxG6NGQHwukzoalnv
         NELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721109943; x=1721714743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O10iCKYxk+ue4943lGDmv3A7VtKpJBt5vhwqbYGmtnI=;
        b=T9i71u2mZvAy4YJO7KmYFNzIDyQ2Zr1kXoNDm8tL1gppyJ8vTF+T7bbWMUaaoPVLLW
         XqcGSxCsch4wYT+M3xpg6OwuDEiAyejeTVBchZ31oEdUY96jUYe9TbngjnV8jaaNCnAD
         Dq5JKk+jupqixliBb0oxg08PeYAxPmy4fNVFSEwlH8rf1yi2Si5Fo0T2lNEs8D0AYn4s
         zbL7m5sLzyWg8H8hWwROb8grdnfAUaODlnIyiIJATjx7A05gURxM3wMnxDKgXBTOe8JX
         +BuolRaBQHS1OgvS/IQ/VKVHlGd9cGB4NB538CHGcnoZoZEnifcl9iQrVetf12/k8Dxv
         Wa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnjeen7UkdJWNVCKo8/VdyICdBCZaNIvgQj48tk96yQWST+BnpOGZkZYmev6zeykUCYTNQQoMUrma4bFlMJF4xYjTKLqCVN3r7AT7MtA==
X-Gm-Message-State: AOJu0Yxb0lkPyIEl7oSzkqhnFqGij0WrUn4LphDemppoaoyBc2gpEBJ2
	wNU+eQprpfVuNV/+PrVZGiYZ4BLUXRpnRypNKTksL98kpqjPlbRgGz/Bm20Kng==
X-Google-Smtp-Source: AGHT+IEES3tuucRCnqSrLmYrhGb20AoucpX/SdgfB8LtRVnsYbNlhwslTyUrU/Hp4D9M0LXcDqZegA==
X-Received: by 2002:a05:6a21:6d87:b0:1c1:d866:7db8 with SMTP id adf61e73a8af0-1c3f120315bmr1552920637.9.1721109942813;
        Mon, 15 Jul 2024 23:05:42 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedc92d88sm5384035a91.37.2024.07.15.23.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 23:05:42 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:35:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Mark APPS and PCIE SMMUs as
 DMA coherent
Message-ID: <20240716060536.GH3446@thinkpad>
References: <20240715071649.25738-1-quic_qqzhou@quicinc.com>
 <nulprwjd52j2iq7cpx5nq733cbi6ccdpemq6a7ocglv4ep5jmh@jvs6zof5u535>
 <c8b0c7ce-f02a-4d38-8473-4c20287ddbcc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8b0c7ce-f02a-4d38-8473-4c20287ddbcc@quicinc.com>

On Tue, Jul 16, 2024 at 02:00:15PM +0800, Qingqing Zhou wrote:
> 
> 
> 在 7/16/2024 2:14 AM, Andrew Halaney 写道:
> > On Mon, Jul 15, 2024 at 12:46:49PM GMT, Qingqing Zhou wrote:
> >> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
> >> mark the APPS and PCIE ones as well.
> >>
> >> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> > 
> > I think this deserves a Fixes tag as well, not treating it as
> > dma-coherent is a bug and can lead to difficult to debug errors based on
> > a quick search through lkml.
> > 
> > Thanks,
> > Andrew
> > 
> 
> Andrew, thanks for your review comments, do you mean to add below two lines?
> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
> Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")
> 

Yes, looks to be it. With the tags added,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

And CC stable if the offending commits went into any stable kernels.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

