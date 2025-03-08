Return-Path: <linux-arm-msm+bounces-50710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5FA57B96
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14CF3B1BC2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F3A1E1E01;
	Sat,  8 Mar 2025 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWUplUDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092961DE884
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741447752; cv=none; b=pcgqF/dNxn9WhnKtrDvhmah0a/OB2Nx/ynqrJ2Zn//y5s+mkZG0tK9jFPZps7jsQlvj2x/ZPDof5Kbk9euga6QIHVojLOsHHwkDoiAkDnqmqxht4gh6blsI8SRTFe+JWMrFD0NikMrCWmLRWK0ZxMvFnDS/DwN+tgE+f1j6zpnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741447752; c=relaxed/simple;
	bh=DngW6UKwtoP4vTNhZNLO04627yOjUXfCZEoZdkARLkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl1yFLvaNfXkeARO1H0FmidvpJ/RUBk7nlE9CGCcP2Pz+yi+UsEoetRDI4hitETv+24QnGYgIVjJ3MBrjDXXJ9bXuPF3B/dSFZ54gKud76k4AQVVIoRTrUYfKisJeyA63uiz/lhrn8kdp7r0kl2iEbmYeEtMNE6dlaUv1j5ogpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWUplUDZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bf1d48843so20606181fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 07:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741447749; x=1742052549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1erwRbEpf42IpSPu2HfeF24p9T9l4keifT6FQUxIMM=;
        b=BWUplUDZeU96vc/TLQ7w/otbqzRgDvT04TbNFonvcJaruyHrXUlYrduHQmt78qat6q
         GmonXuEAXKDRBa90glxwaCN77+Wde2D5FsSFPkXNcQ2vy2MVdRbAu/YuPHQcD3M6EsSR
         dlCD9uJGmSBQYvIpmokxA1U+N/WFnKyJJGNiHwgOTlQGijR17Dz1nBGt/teRWg85WzgL
         MdtsLpgZ7rLGnZzIlDxhE9zg4ijroIIpoCzw/+dfvkBmCa4/V2BOa7Mjm/JL1V+T715o
         oKXC1OtQIA47M2C5tQmXRuaRhiTz5K3fYWqSaWM76Ss3/vq6KjMxEwb+6RarroS5CjCZ
         fW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741447749; x=1742052549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1erwRbEpf42IpSPu2HfeF24p9T9l4keifT6FQUxIMM=;
        b=M7YaYZRzCRsKJgdE9enSB3qASqCuCky3TEnF3XL8GnDWpok3KEf46AIZ9BI4jMZ4PM
         PI4gE604pPDspCbJBR+LCIoQNHsweO/N6J/DErkKWmVfwmjoYfQd8QJqOuBUm1ofNT2V
         blmPC5ktkoGJZJVqh6ppJ0Mii4EuWepUmKavYOSAwTMf0Czag77EVzBqKOHJ/KePioMq
         QHe1Zv49VmG6IRjNVN1CKUH9WxNDIxEzmxBUY+kRuhEHY4GgC0Us7mZnCEbRdaP62V84
         mMRHnHc4qZY9bhUsA686X5eVV3Ei2dEv3F1oJipvQTbDhrNqZIpScoQsIEV9KiUgXK3b
         KklA==
X-Forwarded-Encrypted: i=1; AJvYcCVUj2gsqUL60I7e/EnZQY7mZ7zMLJQg+HJiO4WwMkMEbDnd2yVX9319+aZ7iIDBPP631Y1KQ1n0Hja1jIAC@vger.kernel.org
X-Gm-Message-State: AOJu0YwAOkUtruQtTk7SbMJzf9IzGxNXXmhpqnIBOzYa2ndZtTM9Lald
	jwRBK3vl7/4mI816LkH6g1WQqujHT7dRV+Mrt/m1O2/v/Ut6JZt3tuQnlRx17ho=
X-Gm-Gg: ASbGncvgahaL6S+r83I+Y1deDrli7XYXTSdOE3DQ7lspHjoS1SyZx4Y/Fc4b++vIqPT
	tZ8TEui9QKfN8G8jI5MJZPrn8CnR2H6p+kgjoxLk7VPn+joUES7x5aojQslKVW+LM+W9lVYS7NW
	wHSAHJQxhOp88ftf3XdS2Y0qmOTCtfYJcfsk2xKyTsqnjFxPoO5Ebs9KwXDWB86VR5IUAJXV7U0
	ULNppxlrTpQgRzzMuaBlnQy0dEUeu0tZ6UU3TFAnKDUDIvg50ay4zFg+itccbp34qF6ZR4Jarbo
	qqC8XqS7M5ju7+p07ao1VqhkupY315jP1pHEcJDgU+a1tE/hclH3WY8Yv/yRLocp6ow+2QkbA2j
	VhqDp+DC+mRjj/ctXQMG0Lyds
X-Google-Smtp-Source: AGHT+IHWJzyRENoKYCsCD6ryWleW1FfCxkcxA9oKFolKIPqPM2Gc1cW/mG3/aDezKXNBCG2jOe6Msg==
X-Received: by 2002:a05:651c:2106:b0:30b:b204:6b80 with SMTP id 38308e7fff4ca-30bf44eda0cmr24484481fa.8.1741447749006;
        Sat, 08 Mar 2025 07:29:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfcc80809sm3965871fa.86.2025.03.08.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 07:29:07 -0800 (PST)
Date: Sat, 8 Mar 2025 17:29:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: George Moussalem <george.moussalem@outlook.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, andersson@kernel.org, bhelgaas@google.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	kw@linux.com, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, 
	p.zabel@pengutronix.de, quic_nsekar@quicinc.com, robh@kernel.org, robimarko@gmail.com, 
	vkoul@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v3 2/6] phy: qualcomm: qcom-uniphy-pcie 28LP add support
 for IPQ5018
Message-ID: <fwpdzm4gdulyhfnmcvoqsbnu3fwbqyc6gne3ayz7sr6eu2yyqy@hhii6x4pk7a7>
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883A6C7E8FA6810089453149DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
 <oeu6wkfhx2masvendoweoufzit6dcwwer5bakzvg75dz3uc4bj@bwuj4slnb24e>
 <e2d84147-c061-4f12-a44b-f60919625f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2d84147-c061-4f12-a44b-f60919625f77@oss.qualcomm.com>

On Sat, Mar 08, 2025 at 03:25:05PM +0100, Konrad Dybcio wrote:
> On 5.03.2025 9:39 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 05, 2025 at 05:41:27PM +0400, George Moussalem wrote:
> >> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >>
> >> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> > 
> > Something is wrong here. There can't be two authors for the patch.
> 
> It may be that Nitheesh was the original author, whose patch was then
> picked up by Sricharan for sending (no additional notices of
> co-development), but George later did the same, forgetting to remove
> Sricharan from the chain.

That would go to the SoB trailers. The issue is slightly different. I
can't even come up with a normal way to end up with the patch having
two From: headers:

The only way how one can get the From: header is by doing git
format-patch. But then git am would get rid of it by filling the commit
metadata.

-- 
With best wishes
Dmitry

