Return-Path: <linux-arm-msm+bounces-44011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F6A0276B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 15:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B1EC1881C50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D311DFEF;
	Mon,  6 Jan 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AxcDrmFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE723524F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172270; cv=none; b=ICXTOK5NVyPqyyNPUfoebrEaaMZCh0R4n4FbRn9aJCp45XC2KX84kXAelwV1jsXSr4q/RJ+2oqKWiHN83T3Krb05zBBmtGsthQLRfzqCcj4xH4LIQFygNXx9RgrBQOK7FVyK0AwDHE6+7stgqC+ZW3L5w3BWDZ7sl3L5NiQxyoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172270; c=relaxed/simple;
	bh=Wm1ovQHMvMxDSi7FF5AmbNcNDR9Wfa6yclPnItxHYYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2TYGOJz67HSc+WXMpxIkrDhl+dZDeB2UuwK4p7aMsb4Hx2N4d3JWm45P7SAz7ex4CAonQIYEYzPHKVcNM2Et6COaTiszsxrXZWxD0qNMZJkaBuTBgsudt4yEyFhOClt1bu+t15N2p80rhZOh57iD+YyOqE+qo8s9Ms909q4ge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AxcDrmFc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163bd70069so17789915ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172268; x=1736777068; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPCTx7YZO3kYinhY7a/YvtUWfdELIKIx/KCwel3xU3E=;
        b=AxcDrmFcD12EX1003K8Jsqkx3OR1XoonaBdutzv19++pl12ReqktRTYegvohqdw9bv
         Xfzski5DS3YtQAkFMMRJESlD6NMn4+Vgo2YXEfIMPhJ+QUR+f/Y54b21ZtXgOvBKtWyO
         7/yDHxBG1KVJCWxM0Fh9GhNxSwnQsUmOm6OoCNrj8fh/XIYPNhfX08gY8x0QtVWJ4QVS
         FcaDBcQPIPvVm3AP3CKM0+FLavbjRlrWz06ZuUYtS1ZVpm7av+RbbIElbZpNa/9F7pTp
         4gN6H3rkYl/Y0uGzgV0IRSRwvitsv7hWA8dnJ96jsKMt2jdaxsav8S9Jv1eiiM24AhYK
         a1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172268; x=1736777068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPCTx7YZO3kYinhY7a/YvtUWfdELIKIx/KCwel3xU3E=;
        b=RYCpb4dYlRj84H0+k3QEZ/rf1p3cDrmBW071n1lNPrluUrjhKaR+jDUNCupb7FdKRr
         z1AN+Xhj0vl0ZH7M/RAnuk5lNOwtEglVYx0HxHUZ22hBHZ8DE6Nk7NSsISsPbsnoPm5s
         daR9Gp86UDtrK0I/WHnMVpzJNbzbi1SpF4I4NZrTTK8tcGmeslfPuP3nNVyJV3bO8fNT
         biLqipux7uSGN5VRw7K0+5J9jD/lEEKLCTMdVYUjfQ378ah9+7pGf2mNT2GOtNlCp1r0
         qEDwjNBafbA46RCVIQcNlF6W2Z84DXp8d6WzlcRhPxnCr1iin0KuxsXCEdP3XJDAyX/a
         oy6w==
X-Forwarded-Encrypted: i=1; AJvYcCVw+VKMceZrEzbzcUiJivr7xhBp0sZZWZfdrGSTKBAvIQo8Lv2mPjCOUofvXfjoOUGl49vWbO3AUx/2dSfP@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2JIgkyb0yeTJq+LwvSrWUga3S3xLrtu6i6gQ2vseNTP4pPFx
	BRq0i63kr9FDjCJlBG66RihY5selPtX+53aF1aAEXU6u5z5r2YC3Z0wjI1CRCA==
X-Gm-Gg: ASbGncutNDiEysIzEkntX56LfaxL6hFnPjuNwNh7KCMMwzTWYIK/XBjz07Ew7Lzzka+
	E0/WPiqn77z7HlGkYRGa6QEWEFCc66FlvEzjxE9LO+0T9+yfFhHZocvrxTJ7rbrc6FjJqmz6OQ3
	dn015r5G0Sh9t+I33wh61sA+cYkAG59BriuvwYaRywBj4NFo0DcpeQDg61/BETmtwlpJwqYNCse
	ENVl/mVTsPwR5cN8KdcUEbrFfYWaMiNk3ntHUHs5O1TsLO5BMJyWse6iqwpF2hdmVo=
X-Google-Smtp-Source: AGHT+IHOt8/xeOzitH/i9FEolYj7w8e6OxGuhTMPSPoHNq0YQ4Vj0EUbfZi/o55bGUVsRd2Aw/j2rw==
X-Received: by 2002:a17:902:e746:b0:216:6769:9ee7 with SMTP id d9443c01a7336-219e6f13c5dmr848287925ad.41.1736172268112;
        Mon, 06 Jan 2025 06:04:28 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b27sm290329535ad.276.2025.01.06.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:04:27 -0800 (PST)
Date: Mon, 6 Jan 2025 19:34:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Message-ID: <20250106140417.ypyynt2xvixiixhb@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241220093029.z4zsr3owdnqll2vg@thinkpad>
 <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>

On Tue, Dec 24, 2024 at 10:52:03AM +0530, Md Sadre Alam wrote:
> 
> 
> On 12/20/2024 3:00 PM, Manivannan Sadhasivam wrote:
> > On Fri, Nov 22, 2024 at 02:29:30PM +0530, Md Sadre Alam wrote:
> > > v2:
> > >   * Updated commit message
> > >   * Added stable kernel tag
> > >   * Added Fixes tag
> > >   * Renamed the variable from offset_from_qpic to nandc_offset
> > >   * Set buf_count to 512 in the parameter page read
> > >   * Replaced the buf_count value of 512 with the len in bytes
> > > 
> > > v1:
> > >   * These patches will fix the following:
> > >   * 1) onfi param page read which was broken by exec_op() patch.
> > >   * 2) Fixed offset passed to BAM from QPIC base
> > > 
> > > Md Sadre Alam (3):
> > >    mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
> > >    mtd: rawnand: qcom: Fix onfi param page read
> > >    mtd: rawnand: qcom: Fix read len for onfi param page
> > > 
> > 
> > Do you plan to respin this series? FYI, these are regressions, so should go in
> > early as possible.
> Waiting for SPI NAND series patches [1] to be merged (raw nand change patch
> 2-5). On top of that will repost these patches.

This series fixes regression, so these should be merged first. Do not make fixes
depend on feature.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

