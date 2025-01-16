Return-Path: <linux-arm-msm+bounces-45305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4EAA1405C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 18:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A273A03FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE8122B8B3;
	Thu, 16 Jan 2025 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZHiaE2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974537081E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047425; cv=none; b=athZEz7Ua0S9UKh8DK1CcZtvb8roJpDQVSXS83HdoF6NQcHCzxzvXeYCtREz54PHDRbCBlG/PqddRXP4CG1lkS3amZ7p2xk8kOstcPo37XAZSv3mrjQpptUNkooI/PppOYyOgOYeNIrpGFNL+PTlxXSQUTr3/tfnpaHZgUqS7yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047425; c=relaxed/simple;
	bh=0+csCrr4692adIibOQFpvzflsWpcZWDhPh+l7iT1Y+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hv0x+v2mC4fGZJo3ZdKM5vYltmbvEosUEd7Zbe/jcK8QtZNXAo4Ernhe1y4fDilQxsB7IYHE3edNrlzOsxnol8A+lbkMtn2HCvWYtJSTv0LNcCnfAb5ItGE93391eelVR5mv2uhT/nJySpZUgauZtfHajKwY9nN3rdEpn++AnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OZHiaE2r; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166022c5caso20270815ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737047423; x=1737652223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3a4fDQ0edVO3KpLvTInYDMVl/7bZp9NSvT62CDgMNsw=;
        b=OZHiaE2rbNS1j7Yja9O1128UWg6xu6AsmoQu95fwchLzny59DkMqHjuhcZ5ATgOwPL
         e2QUc9NlqvH/w60MgqttRvAl7ZZ4LK4SB8g6CObFPCEpwRZTDh3ARl/fcN8Hpzh786m5
         qgH3q5ekB1Lwoe/2+99qDmll6WG8CLqpzj3C4JsOm0RAeao218ipawLCRiBZ7TSWSJpu
         uE64STa4Z7nQXMf1E90bNAL9DDLT+S+pfI7mNJQNhk3m+D+k6UaF9ri0gxLBG5GCnGDT
         NCIi9DXZECwGNwuk61INsP1viXm74lktMzJZYmgwoORMZnJM46HGAOFUFk0Ce98p62Il
         02Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047423; x=1737652223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a4fDQ0edVO3KpLvTInYDMVl/7bZp9NSvT62CDgMNsw=;
        b=uCzoRBJOBuUAciYuY7MWlPGVl//yrY0vfiCbkPXprkX+XuZ02/Bhh9z+3gsW/AUyV9
         iNQmvQdk191TUB9mUDk2eFb5JtSWB8OH/lmLhS/sC1pCGCFf9jXPDx4Sc6Q+VqVjpDf/
         CW8jjyGdANuJgpjqUHIZgeGFeLhVipGRkFSBRfj2QLpTKnJq57D5BXWBukOrzvVuCVU9
         zNnjorkRzKi2dTY2KQPFU15+WPSnhOhSyycC0Vwszl4eCk1waS9qn8x6f0N80lIZtQPO
         Tq3ZkERsl0guwJhydFECvqu064vLpWSkTF/FfSBPfkXIgSi6I4Mrx/S45YzP0Kx2bl8g
         UWjg==
X-Forwarded-Encrypted: i=1; AJvYcCUH+XowMYRck65Sh+n31G9oP4uPGg+GIQemM/JgR1NCrru89zXNVhHCNhmZBig95Eb2gc2L48Ou2div9K+t@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTD0kVKCtP/Dl03hBLoFDY0g7dGpW5aTQsNo1yokrWJLTeLMK
	1xUosEYtKeb4S5CIfM9mwME6k+VO15LQGczmG4o1Ts5WXM1ImAzTVvkvszTd2g==
X-Gm-Gg: ASbGnctihslqeabyve988HGX1zfO8KWYn3uwFBah180S6OgPmcEaQT6+thTI8+VT8S5
	xylmZrOwALaQwbmRJufRfY7RTxGC1crXiPGeqw55fqBo5hILXF3ggFaRm98AMMg//dp55iFO7bU
	EW9GYBZlBvA5EkudroPpJT9mi6TLsmqBUuPyq9y5SFO4sKTVj1SlhhyLPSHMu37a6TWyvHi+Usu
	oWxaX/3ryo/oGkyxMa1xUw4ywuBo7HNNFFNNDoGZVAbPBPDwJB7jeMB2URBNYkgSDc=
X-Google-Smtp-Source: AGHT+IE6z2dUwqkoyAySw2Q7XUlUMsfTswTyuxhk+t0IYd3aWtK0Xli9iFaSAAV9AWhDsimgl8t/JQ==
X-Received: by 2002:a17:902:d510:b0:216:5568:38c9 with SMTP id d9443c01a7336-21a83f765dbmr532412725ad.31.1737047423008;
        Thu, 16 Jan 2025 09:10:23 -0800 (PST)
Received: from thinkpad ([120.60.79.208])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdf0b5153sm243379a12.70.2025.01.16.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:10:22 -0800 (PST)
Date: Thu, 16 Jan 2025 22:40:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: kw@linux.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	lpieralisi@kernel.org, shuah@kernel.org, kishon@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Migrate PCI Endpoint Subsystem tests to Kselftest
Message-ID: <20250116171015.oe67k57qkrg4p3f7@thinkpad>
References: <20250116135106.19143-1-manivannan.sadhasivam@linaro.org>
 <Z4knZyKrEvVNopeX@ryzen>
 <20250116161227.gk2psmbzpexswgrm@thinkpad>
 <CCADFA64-D3BD-4972-994A-48E2606CCC66@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CCADFA64-D3BD-4972-994A-48E2606CCC66@kernel.org>

On Thu, Jan 16, 2025 at 05:39:30PM +0100, Niklas Cassel wrote:
> 

[...]

> So the output matched the suggested values in the documentation.
> 
> After this series, the documentation still suggests msi == 16 and msi-x == 8,
> but the example output now shows that
> there was no failures.
> 

Ah, I misunderstood what you meant.

> 
> So I think it is most consistent to just update the example in the same commit (in this series) that updates the output to show everything as good.
> 

Yeah, makes sense. Let me change it in next revision, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

