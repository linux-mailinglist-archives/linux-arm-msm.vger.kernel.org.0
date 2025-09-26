Return-Path: <linux-arm-msm+bounces-75240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B081BA28A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBB1B38827B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDF927B341;
	Fri, 26 Sep 2025 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPuJnlhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA6279DA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868885; cv=none; b=rbiXQM21ubSWOsO/FfJmdnpYOZs6oFUBA1q99JWR67F5w7nrIC/DKTttQOUD2IV22kq6GzB07n2hvjxuZd+E1s9YAQ9uk4fsH7fbrjVBznI5+ZuSEitej3lE1O0IKOJLa45ld2ocfKQyRCCzy+BiRZlteSXTXBclNRDvq4EZdEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868885; c=relaxed/simple;
	bh=uUAMECIXNIvOv86QPecXlecTiTn1dP75K3fLk2BLhWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDy7hiU0YMLWlikksY62mD0Bs/SXk8I+qFY3ksZDAMFBHPtthUq3fZr5WnMVl/EShj8YYv4F6uUY9fqwv4NyaF/jfycFdWKWCqx2lByApOZ9j5sO4FHVPMLgNEb6nXfoW61B9aERRN5mOpHGHYyTskBAEnVCTr06vnIgxjoRY2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPuJnlhX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46cf7bbfda8so9870265e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758868881; x=1759473681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eAXEhH9mCSkyuGynwGFcg/vSjwNz5p5yU5r7l9pKHs0=;
        b=YPuJnlhX7yIjxgjiogwF+jukcbvUHirAZzvNF6i6AHLGNu1+H2M/fFq8U54W1CQyKO
         77wFmffT1/brnGjxDbI+IpQgErvQ5X1m0a3z5Kb+5iSqKcl4NU0Dly4njLvyQ/GdITF/
         56iipAyNa3Z5Sowlbcv3M20ybusGGqzmnvfd165H43OIVjbN2KUuWfrCkvuhO+BnnsDm
         iFXmRFyfD6n59sEd8HpRJGCw/fzvlgW5G9qDVSWscyJ8PwjXXpwAK6IkI8xHanLcNtGr
         v0YhXL6pUJi9+Wa2ukgEX7kxLJ1Bu54p6AEPu3PXbrYntMlTJpjO9Xy2WKNSoWb83dFX
         rvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868881; x=1759473681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAXEhH9mCSkyuGynwGFcg/vSjwNz5p5yU5r7l9pKHs0=;
        b=oiWyKEBsdfHUpOERScvrMXFpTCJNqLYEnNuV5/Pw23a/1iRQskS73iSfsixeJ9lp7o
         34B/0EOU4DaNTfbMi+1GpsAS9XxYeVK+3BgTIvse9fD2x5B64oqtQy+Y7Y1Mvv3wVXiK
         qW8pI526j4awoye5Ev0Jg2irDPiJjDOGHdBBsmFrLVb7o+4g6++ocm5KNPw1WuA0fDZW
         Kr7lJEZeofPLUccWeROxsF5/O+ZupQyOM+2QitV8r9O8EHvWV9EEeL7nFYZzpGJIo5yR
         CQzJ8nmSkPRrEH8iVIekI+JEnTF/ENMETQYjmTydmyJ6f+ZX+z/hVk5ni/sCtsXe0aU+
         h+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp4IRSjZj09aR8y/Gck2LRx9r3F93B+3VDWDpbvRjKTDXSbUqQ8hYmY1iIku7zC2qb3H+2iL8UNgb0vJaD@vger.kernel.org
X-Gm-Message-State: AOJu0YxFvoRIumgnIlp0PuZimbiu9Kc2s6egVC6Avx67VG9oPbwwcx7x
	6YpjGftTlMZw2wTB2BiP3zhAUYrLCzI6lD5DUlyQPP3Yf6Rgq+jnu7Muj5XhoiGdVQs=
X-Gm-Gg: ASbGncvkW1YJynjIhkHIn7JP/5FP9xCAnd2cYXqYtzuyKVJpwFc75aeeY/BYXTlgZKv
	pp3V6dAq2cdMiS7ysDuj0Ru1d6ZiV+PpjrFk6kM/uFuuegHKgLWQ/Rs4DVYI9vH6hsnjQ12d4xX
	xgcIftqNsSVST2DbjD+4fhiV2MFaGXLir/dPZP+2k2py8TwZyfqrFUARqKWzJHvap+2g3+JjgJG
	e5YiV+m3agLJiRj4TXajZpjYjVelc/Ce1Y7UOiWTJ5x3lGidCyA90hgMUjK/Yeu6sWZ65HDFaqH
	7gRen5ryfE07EYEU457i2Wnu+UL8TrRlGmrUwXy1sOKqYQqg3ZbHRrZ1+Sg5K6+Q4bBm3eMphXq
	+FUY5duxpnI1IdlDTlfmzVOtgPKlvhIEZ
X-Google-Smtp-Source: AGHT+IEC51Z3oUc6PBQE26U0pANRwet5KzFeYNOAHSrBB1u4TiB+919unwkMAvmSkArm1PJoNLlhdA==
X-Received: by 2002:a05:600c:8418:b0:46e:39e1:fc27 with SMTP id 5b1f17b1804b1-46e39e1fd05mr21856915e9.5.1758868881334;
        Thu, 25 Sep 2025 23:41:21 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33be359dsm59755235e9.13.2025.09.25.23.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:41:20 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:41:19 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org, 
	robh@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <27lkxf65evdhfdqzs3w6sfura6r3sewqsm6dr6qapvsjuwrirk@lwqs46vppei3>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>

On 25-09-24 19:28:47, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +

I think you dropped the v8 headers since v2.

Please make sure you add them back (maybe separate patches) in v4.

