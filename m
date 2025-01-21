Return-Path: <linux-arm-msm+bounces-45703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41624A18288
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 18:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DF71888399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 17:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785041F473A;
	Tue, 21 Jan 2025 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y32nto2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B1C1B394B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737479173; cv=none; b=njI8eDgkFWrgsY8hIPylz9HzpXv9Bi4ROR0ObGyg3zkPfqxw0lkjkbhw6K1y2cJu2WYYlVsUJTeFuYixdE/lLjQsJpo4mHNJ1aOQoyj7hfvz/+WGqTltUgcG48XdbyH7dvSNWA21tcOfNzbwU5UEwVLhQHOVLkacA7pCelsJC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737479173; c=relaxed/simple;
	bh=aeJDFFM/KU6G8Vm9vw086ZB0Rc48HlsP+3yObWcRotc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DradGUq5YHV/Ym/VqUgIo+oHOGBrKgqio6/crvj9KXL4/23EGKGo4S9I5JyG1eqnde6kB2p1vlTn2ltKBxtMHCKzv9CQHW22UOaNBa0katwZrBRNG18SNy3XOkSwtMRLAiyrpBFopr1C7tN21gGtaOsCG22AtoujowUHVCP+/K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y32nto2k; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166360285dso114451535ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737479171; x=1738083971; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLZ1M91Tz5+90Z8EdtBju3QcQgjWi+pie1RGDIf4/y8=;
        b=Y32nto2kZh7Ych2wEnMHnbxoEibfmgU3vDLHaK9lLfToun4vvKZZbakjcjjub7ZgbW
         kE/XTPx4DHAC54pTJPD2V/TBWtTPs5fp4FmMqanaHV3fhOdDTKe3b8pUSLkyOtHHfmw0
         iNaCRrEoPwH37DkKR+v/r4eLiuZWT1cUwmJEMtujX3R6g7Mq5eLWTaS1x1/RfNGCm7/R
         9BNWY8KF7scdDPsB7F9cU0vNnYH/3Wx7iUBwEv8HfYvAud2n/wznBxXglJEaoSClXyQx
         o/aEdJmmWGFAqT0FrrLxK/n8a8d6/nV1f6/3+QJg5gh7/1YTGR25Wxg8ipCzUSB9UgZZ
         kW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737479171; x=1738083971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLZ1M91Tz5+90Z8EdtBju3QcQgjWi+pie1RGDIf4/y8=;
        b=KWWt9gtXxl3ljYVKwBe3rt87Qf0VsPAD57RMz/t6i58kkKn9rZATLqkgOFWRktx+Z7
         Nz+duppCwOegdPKFnt3lXQVx5bkEUVlSW6tfiQkqSoE5S2SVCNSwXEVExvhu0um1lKD6
         rRwbzh992193SCritlVNJeOOPEf21zSSLD0T10S0hDYsEh3rJ5Zk/4ylLbAQCy1tXIHg
         xnOPLdbBQ1YkgBB0yzOaFYEV+PVwZewLhxG+0E7ALCf53o48IFsj2Eh9RrhYqG08orpr
         TcTdrnpUY+qdsTjRl6G/TXiYmDuB+xa5iiUM6rRtNV4POQdnWornJyKWpDj73DZLejRm
         NL1A==
X-Forwarded-Encrypted: i=1; AJvYcCWmbsUMh0pHORIE/+HlyUAnqQj6KCF3moJIPfIOJu/V12Ff2X5AUj6P9bJM+igJ4XGJ7eWPq7QTJVoC6eqV@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsNj8HoK0iWOp9AmZ+GZyrYv3TlfgUaSoPsTxe6cK0DCrIjbH
	PY/v4nOXpYuofpvmQmPenzn7GyrrGnnPNCNp+eQdPphKVex5ugtikuKtBOXmocfpeLEwM9NiGYY
	=
X-Gm-Gg: ASbGncsstPotX8WWl0okLOit1c8N5pq8LIZjY4BgytrhUhXq07o/TYIP2dpFvbNFdSP
	ITzb64HN1gw8DlLQ0sGCKwa0iu1azegK2+lLJY+DuMoSdYvLLBB6gRxFysUfJzAZgGOKdr2lLsD
	tLA2lUOTH3ydTVEc7+OPOKoH8ZFqn0yWPXqSEdj1UAatgIimjKSAeVbaF6TnVGWVFWw4peKF3qJ
	VICvFSnutoSE6I/FHlBvDBpywl33GiEzALuId/S38FBphkMePKscqZ+wbThiKi00GnhOgl/5Xzm
	DNO+UaA=
X-Google-Smtp-Source: AGHT+IHn9TYsLmD7P0Ha+IDfjAk5r1UYZLHtwz2kbDOobhswOY9mYpBT9qI01ULKC2BhTtnxTxy1sg==
X-Received: by 2002:a17:902:f546:b0:215:72a7:f39f with SMTP id d9443c01a7336-21c355b78f5mr265880945ad.36.1737479170859;
        Tue, 21 Jan 2025 09:06:10 -0800 (PST)
Received: from thinkpad ([220.158.156.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3abf17sm79278015ad.148.2025.01.21.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 09:06:10 -0800 (PST)
Date: Tue, 21 Jan 2025 22:36:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Message-ID: <20250121170606.ribist6ayw75bzlv@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
 <20250121051624.nhest7s6iyh2ll4m@thinkpad>
 <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>

On Tue, Jan 21, 2025 at 08:29:32AM -0700, Jeffrey Hugo wrote:
> On 1/20/2025 10:16 PM, Manivannan Sadhasivam wrote:
> > On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
> > > Add basic support for the new AIC200 product. The PCIe Device ID is
> > > 0xa110. With this, we can turn on the lights for AIC200 by leveraging
> > > much of the existing driver.
> > > 
> > > Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> > > Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > 
> > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks for the reviews/ack.
> 
> Do you have thoughts on merging the series? I think I could take everything
> through drm-misc, you could take everything through the MHI tree, or we
> could split the series by tree with a phased approach.
> 

You can take the entire series through drm-misc. I don't forsee any core changes
to the MHI host stack next cycle, so it should be fine. If something pops up in
the middle, we can do an immutable branch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

