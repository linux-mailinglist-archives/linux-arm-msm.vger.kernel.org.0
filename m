Return-Path: <linux-arm-msm+bounces-44152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB7A042B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 514353A1CBE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 14:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAA01D958E;
	Tue,  7 Jan 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhbVWt/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D871E0DCE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260716; cv=none; b=JPaLJmvnrC4N3Kki7zGGjdTq5st4mxIINeIMbwxerJgqa8DPVduKXiDCxnEFEAuW7AXGPw6SLywNqo3MPUcBbLc2oYNUgh2qxsG2c7m0NeXCaOkaKFUXOL3gnEK70lMmIdKq+yqGzDl8NRtp3GQhlBwpZhKmti+Fk5Xx3qxmWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260716; c=relaxed/simple;
	bh=EAOJ9Cy4whUatGc01tErXLm3u1bA9IGZtdlzgfVjk20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGPADo/xLDyWwKAiHttX3t8cwY7p0gqvmdnye5BPyq3BSJjRDsZq5Box8M2LWMpprTAB9nakKCeMVn5qnbymz9O3aK+Z3BYAQhUyP9J4mnKiQ12B5NyiMz3F5gORlNCpBQLtFIEzPDNuF7O3pIZzvLY3j3hmTJKFZRJl5PsGiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhbVWt/P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso104414965e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736260710; x=1736865510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo9P0YtQuqJXCqr05Qb0Bv72irxJaHvuePVGR1s+GJw=;
        b=jhbVWt/PCJUaK4jCxtfVQcf/BqyhKHT1mcv/XIzkoA+pKCBd+kbyD2timM2jWDmKmt
         h32X3FdDoyFb/IpWQV3BY+zV8QJ3Fv2PECWFtSnueoyDe/xtsm1JZzTtASshXUkXRdqX
         uxuQZnHcs8va5viV5jlcO0NF9ZAoCTs39ZYAuT7pqPx54TBFc5eClGCdPLeOW8YYOtBy
         1FiSvzhj3aPmGWRWkvdtosm0UM9XE606VmP8myXSC5N2e9UeeEzPNeMcjOudu+Q6Cm95
         VU9q4NqZ4od6BacY9QNS9JLAri5TGpstkHHaWIYm4Ufx3YQJqqEZ0dWXpiW40SRQN/sb
         u+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736260710; x=1736865510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo9P0YtQuqJXCqr05Qb0Bv72irxJaHvuePVGR1s+GJw=;
        b=ryjAcvBj5RTh7tCBm4K86oXno4FFHxg5r4uMS+bfX+/2x+p0GifKU/IVRi1hH7ZrBd
         mWjyHtszwXPy6sfdr2JgzUVjTHkBp5aukQEOY7THeYzd76jLBwS1iTdNZEQYULJ7Sf22
         Y3mJVBMN7wDDBGN2Jhfq/9GuWI1DGhrzfwc78ophziFaoJgJ31lXTasekoPuPAwQs/QH
         juWmdtgE2pdVGDPS1DU+ZmCxUtdTYWysgDLh029dozwUgIEp/q/lUeeXWe2IqZ8jH3cQ
         jVawRxOTLXXP02NgaV4i06oGzUDfW3Vj8qk7EQOGTn05upebqA/eaXl3fPrvX/e+Uvla
         pbtw==
X-Forwarded-Encrypted: i=1; AJvYcCW72J3zmyT29rEmVC3qiGYaZCkGYHwI7jacuMnaOtJwC3JzdrWOvjxiXk82ux9mst29GR3rhOxrzbmbejLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxraJ45iu9LKpVuSWGKtatO8vaiiYzxfNEQ6lLzs9KxAzNomXre
	j0aMuDEn+Xp6vY4Cm6t8iabRTIHa2jmeABd2CLS3WAEe0to3w8GYOw+86uKN/ho=
X-Gm-Gg: ASbGncvICPopyoItn1VPbqlwye6MKERnQDMRWNp41d4vtOsbxdLZCNLH4UCNxTDhI87
	cpVf13vh6ABupyrBhQDJ2BPTvVdSZwchbcbrJKq9GGXzsoxTObeCL9Cf/ZQQrnd2bnW73c6zTT7
	ybbhA96tiShqIu7Olz9gClM3qJvJ9ZFmIhuAFciPAb0Wsur08EnbQMRvHP9P623R5hNLqXDzFRf
	f6TBFATYrdmTWQ3LJRppsk+Wy3aqMUUHc2AXlktfAtyocUtEogIfTo=
X-Google-Smtp-Source: AGHT+IFIF4I4xKP46VS5zqZ0+vproNT/iu73lhD9pH8Af1WZX6MRdbruwQE3ujvVRC8CO0SgR54++A==
X-Received: by 2002:a05:600c:68d7:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4366d357401mr499304255e9.29.1736260710425;
        Tue, 07 Jan 2025 06:38:30 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acadcsm50023052f8f.105.2025.01.07.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:38:29 -0800 (PST)
Date: Tue, 7 Jan 2025 16:38:28 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: Enable fingerprint
 reader
Message-ID: <Z308ZCrnsaLReaIX@linaro.org>
References: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>

On 25-01-07 15:35:07, Abel Vesa wrote:
> On Lenovo ThinkPad T14s, the fingerprint reader placed in the power
> button is connected via the usb_2 controller. The controller has only
> a USB 2.0 PHY which is then connected via a NXP PTN3222 eUSB2 repeater,
> which in turn is connected to the Goodix fingerprint reader.
> 
> So enable all the usb_2 controller and PHY nodes, set dual-role mode to
> host and describe the eUSB2 repeater in order to get the fingerprint
> reader discovered.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Turns out that on resume a couple of things are broken w.r.t. to the usb_2 controller:

[   41.104913] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xe2010600, fsynr=0x110001, cbfrsynra=0x14e0, cb
[   41.104936] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x14e0
[   41.104950] arm-smmu 15000000.iommu: FSYNR0 = 00110001 [S1CBNDX=17 PLVL=1]
[   51.420689] xhci-hcd xhci-hcd.6.auto: xHCI host not responding to stop endpoint command
[   51.420702] xhci-hcd xhci-hcd.6.auto: xHCI host controller not responding, assume dead
[   51.420720] xhci-hcd xhci-hcd.6.auto: HC died; cleaning up
[   51.420836] usb 5-1: PM: dpm_run_callback(): usb_dev_resume returns -22
[   51.420864] usb 5-1: PM: failed to resume async: error -22

So do not apply this yet.

Sorry for not testing this properly before sending.


