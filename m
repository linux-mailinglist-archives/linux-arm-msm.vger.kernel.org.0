Return-Path: <linux-arm-msm+bounces-37226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05D9C035A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA2D2885A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C9B1EF94F;
	Thu,  7 Nov 2024 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBn0vZ0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4901E2615
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977616; cv=none; b=GVIjgv7ISmVFeXjzn4O6T5Hkd8YRG8cIb/CKLR9ut2e1GNpTKn/VJeJnKe7gXzj/KzC3oP+dYDYIIf35WlXKJxRyHtRcsvTT9dT+7HLTka2uIefD35umJdwqFPMFTGLmNZ9xfWdSvyA7JMVX+bGVrPcW3ZIHtYg+ZvYAa4C4ZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977616; c=relaxed/simple;
	bh=ZYTtNkkENvqqW42AEa0uNHQB1QDLf4BhU5B9EYFA0BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5fO/MDjD+BmmW8lW98WzV0yoCn38uzBoOsev6nVR+6+Q86PQvzS4njnqyZdwlhOloXFqo2SvvwVrRp8696ORgvC87wQEYTA+NKQLjgoJI0eRsnitd5HPVNq0ARkNGwm/nLvKtNLrjtr76Q6EsY+0I4v8yZlStYMaR5RFf4SPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBn0vZ0t; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e13375d3so881460e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 03:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730977613; x=1731582413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASyBcKrBKY8NGzfSOTvWexlrMtjkKivNcNfUlPPO4jo=;
        b=rBn0vZ0tiE07FzRohW9Qej9FFbols66/m7cACHyCQlNu4L5qh6L5Jf+65efEp0uTqF
         cmRxMsgbZiFqzdDuITbilz+vtZ6pw49ukTEVFSzIhG+Ft0Vd8/EZKuBDNq7jHAwFUXK0
         IQOee3s3dvpdfAfGKufLZ8R4da2NjWfqc67etqLhZoEfLAx1/x905fFaiC6wKtYjLylF
         XpcbvMW8zLxqPRPCl6BPfYPmqGlOWaSbt0ZRKNTeGtfWAwcOdsbCYnOBFY3gbjYEzBc0
         ZiRNWtWpdWILOx1zT92DObGnbwHYoOABFP/LbhdP8ibSOYeX6fePG+YBslfD1AjSRwL8
         1Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977613; x=1731582413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASyBcKrBKY8NGzfSOTvWexlrMtjkKivNcNfUlPPO4jo=;
        b=Kj7ZDz+MGEsbRTMZzVZIjjhE4rK1TbieqZDLxgRNWSjULknz/9/+DOhMK91kw29B8+
         SUWtYjptAEcmFco3KhkkuVhhyzY/lwEKi9jcVl4FyeyIAitXMOFNkbFTnJYPBYLqAgEj
         Ql6NDZHmU3MunHHjuxGvfs4FYnBt05o7/t6iPxaS1W3oQRS+mEAyJpOgRtqa1bbodB3I
         cGZfNwRNhhpruu8cGao2EfkjYwYL1iPKx1Jc0yVn5am4Ov0XKL/cpJz13dUiN7XhE3RK
         IKkdJDCp3mQI4mtamvIjV4qyDW0pBo9JzV/bxbY+mAzr41dTie/GB7gixyIctQ9oclBc
         TM1A==
X-Forwarded-Encrypted: i=1; AJvYcCWsNYtWw4Bmb5SU5nFr3DCk310zllxg+/hqDlHRaZ8GX0wxc1NTAtr6Ym36vDfelKaHgeB7lj/EFc+DOqnQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqKWu72yydIyDhVS+pUzHP4h+y4QJpOuENI0BadL85qv2unF4
	Ay8HFS8nleSo+Xj/Kx5ld49Nhia/6ysiAcV+uKRMoL+4slOA57zhKdnvaa9jrtk=
X-Google-Smtp-Source: AGHT+IFi3LY+Kr3VywWVQAVjcm+xWKmNQhu5wIXejKiarWn4kE6mkOvT2Gb7mmwc2E0pIjCs2m7I8g==
X-Received: by 2002:a05:6512:33c9:b0:539:f1ce:5fa8 with SMTP id 2adb3069b0e04-53d840ac0femr353800e87.49.1730977612627;
        Thu, 07 Nov 2024 03:06:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678449sm168905e87.12.2024.11.07.03.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:06:52 -0800 (PST)
Date: Thu, 7 Nov 2024 13:06:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] wifi: ath12k: Add wifi device node with WSI
 for QCN9274 in RDP433
Message-ID: <cmvfpctliqggra33u6ituguoxh3jxcuxiyjpbtcjbcgpu6lhoi@4zdthfkc2ed3>
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>

On Thu, Nov 07, 2024 at 11:23:20AM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2024 19:04, Raj Kumar Bhagat wrote:
> > The RDP433 is a Qualcomm Reference Design Platform based on the
> > IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
> > PCIe2, and PCIe3. These devices are also interconnected via a WLAN
> > Serial Interface (WSI) connection. This WSI connection is essential
> > for exchanging control information among these devices.
> > 
> > This patch series describes the WSI interface found in QCN9274 in
> > device tree and uses this device tree node in the Ath12k driver to get the
> > details of WSI connection for Multi Link Operation (MLO) among multiple
> > QCN9274 devices.
> > 
> > NOTES:
> > 1. As ath12k MLO patches are not ready yet, this patchset does not apply
> >    to the ath.git ath-next branch and that's why the patchset is marked
> >    as RFC. These are the work-in-progress patches we have at the moment.
> >    The full set of MLO patches is available at:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274
> > 
> > 2. The dependency marked below applies only to the DTS patch. The
> >    dt-bindings patches do not have this dependency.
> > 
> > Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
> > Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/
> > 
> > v3:
> > - Created a separate binding "qcom,ath12k-wsi.yaml" to describe ath12k PCI
> >   devices with WSI interface.
> 
> Thanks for the changes. When you finish with testing/RFC, please send
> proper version for review (just remember to keep numbering, next one is
> v4 regardless whether this is RFC or not).

Isn't the 'RFC' being an invitation for review per the nature of the tag
itself?

-- 
With best wishes
Dmitry

