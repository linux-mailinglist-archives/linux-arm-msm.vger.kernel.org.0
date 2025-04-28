Return-Path: <linux-arm-msm+bounces-55931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66DA9F51D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 18:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC7833AAEEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 16:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF859279785;
	Mon, 28 Apr 2025 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xIvz6iqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531426461D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856284; cv=none; b=Bo/kP3Xb0GxRjuOUXpDQSCqTkzIwrT5080JPUViSbC+XK8WtQmQkoYudam8MkirZxEy/tYCKo0kVp7mMxd9m+sqgTc3p8ETurSt5HSIWZCDQLsOL/KUdJq5eFeHEPhqibpwaQcI5qBwm77T1G4UoayQmxgs6Wwg+uR2i0kWH7Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856284; c=relaxed/simple;
	bh=FrNZmLg/x/OPcRg9cTyCP5WYONcAgeedx2GB1nezExY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3HjIGMcXYG5vPV9hzsQI7M8CvF/hG8KUAJrMCGNLz2y89MHBuEYAbyfDGujGxzmm/onIBbaWjHcB1co2ZOkEYqru14KBwpyAPBgExhDCYShFioJwfyAvytsU94zhoWY3UNSGFrxmdL1c8U5ABw1o8397k9YufDXn4t7ou6KnEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xIvz6iqG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4605281b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745856282; x=1746461082; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=;
        b=xIvz6iqGRwIcyT4Le8cRMdMx61o3c8TbZSiUKEDla2Z8bOsV/sfxuQx/DSyvvD6YMM
         4yzQ2O4lklA2+1r59NdJiDORmFNMOCzI0uNsJITqIfvsSeLH/0I0WA4U6tRBI4r2Pitd
         pf7YVwfmqKEk8pNpBz7ZqJkOY6wDup4tGnHfoePpIzisEw1SAfads6vvWRfW88VkaHuu
         ueMpD/Xahx9MngWqqULRwII7rnmii+C5b5fZQyRlx4c/VAEWJ9PYHUOGmHT1XJZb/nG/
         CcDFeCUzOwN9Z4Jhenr49TfR+C2CEYNctMxWVvY0dgncXf/Swo/na7cYF1A/XED5v1LK
         ddjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856282; x=1746461082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=;
        b=w6O8VHz8BzPrF3WecNk72NM9x9HdjFzmFULzD52K+XLuQr3WOu3e+s1HLjwMilHweS
         s9cDmJtAgN+EVj0QeE6286OjlMQwAxmHc18pFzyxmSSN4VKs1mGJMooJHKKPFIghBGw3
         sz9b45U2hw+vVo9ZqVQ2y9C3uBfvYvdHwYjKmrmqpMbMR0uvtzAErPUR0j05Pm2Hk1ov
         9ur0YXJ3ltqXn4D6IM4kb+OYx6wIeT0fXjxNuX2sof3yja0EkFqqyE0gx1apW7dzXLAu
         ix7WbHkFdugle9tsdnSlcepDvWjTLtF+/sUuebQ32RfvYJ9eV2OiRd1DjVi4dcHovL6i
         cUSw==
X-Forwarded-Encrypted: i=1; AJvYcCWVA5e/53Uly8Zma3OBgX/BMFnrcN4jogOm7KBuY9VaQv01aPEMf5J5DoVoNLy4NcSY4PUs1z2d8Ov35t3h@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MdmnBI4+5bSZM1jA5GPHXmoeyf01gJjc/9ZXMhQjz5nUqBrK
	nOLIpwTf+hRPen6CyNuMFJBjcw537tNrty3enYlDfhIA3IjDVCek0l2iuK7eRw==
X-Gm-Gg: ASbGnctenh5UOCLDcSvKbkwkrSLEUEQnr1DtOYw0vCjmTLWoznU5fINYGu6gEKDNelQ
	QCgwcTKVGCRRiKrGaPe50G1y6jeuf9ZZLmEaCpC291LFtsTT2Vqe+bk4JZQ50z5UT0m7qglwWt6
	l7Pq24D+iAbcrDZodbDAIkuRz3UZwkNQOzj2aWdLGXb5ebi8alJUsT5xoRmSLvaxV83tR10LCtM
	zU758YSiGtDLUMnZ2ulNvtB7gCoW80FYa5Bj8A2PuKMjXsK4Z55aZIL1g5VvqhwZyB2XOARgXQ7
	yoe1v18iWcFzpjiPCJbiM04GNg92hJjoy206kF0lywSpIAIouw==
X-Google-Smtp-Source: AGHT+IGKCxoXxJthszuaQ0YIvxIpdqYl5iZVD54zK+MbWjkRhDGpgNCqL+JAneA3KnXAx0zTvsqeuQ==
X-Received: by 2002:a05:6a21:9984:b0:1f5:8d3b:e272 with SMTP id adf61e73a8af0-2046a404462mr11666596637.1.1745856282535;
        Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
Received: from thinkpad ([120.60.72.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74002791fb3sm3928077b3a.70.2025.04.28.09.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:34:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, quic_carlv@quicinc.com, 
	quic_thanson@quicinc.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, ath11k@lists.infradead.org, jjohnson@kernel.org, 
	quic_bqiang@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <szphluirfkwx2na7o5y4wax6icezxv5scnwofma7la7v4kz2kg@bgplpwnsabkt>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
 <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>

On Fri, Apr 25, 2025 at 09:56:05AM -0700, Jeff Johnson wrote:
> On 4/24/2025 10:37 PM, Manivannan Sadhasivam wrote:
> > I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> > reserved region for the iova_start:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331
> 
> This predates my role as maintainer.
> I was an internal reviewer, but in internal review (as well as the public v1)
> the code was using dedicated 'qcom' DT entries and did not have an offset.
> 
> So I looked at the entire patch history:
> https://lore.kernel.org/linux-wireless/?q=s%3A%22ath11k%3A+Use+reserved+host+DDR+addresses+from+DT+for+PCI+devices%22
> 
> The offset was added in v2.
> 
> There is nothing that describes why the offset was added, and nobody
> questioned it.
> 

Hmm. I'm not sure how this works in the firmware. If firmware uses iova_start as
the start address for the ATU mapping of the MHI data structures, then it won't
be able to access the structures allocated prior to this offset (which would be
very likely).

So the fact that the firmware still works with this offset means it doesn't use
iova at all. But it would be good to remove this offset from the code anyway.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

