Return-Path: <linux-arm-msm+bounces-41454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0C9EC935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ADD9168A2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F67B1D5CC1;
	Wed, 11 Dec 2024 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haC/g3zt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20686338
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909696; cv=none; b=KFg7cLs++hz1a0nl290cy8fv5zNYeeWJmkNSq5ExDcGBfHcEUJ079FCbxmYl1Zu1iur6amujBsmryVSclfVc7HpZYFvUM4DKM2EfhUfLhb88JvoI5KmZmVlWDG9bDRAf6Atk9Qivri5/7B0y25V73uN1FFgiwMPsqkFnoxqTnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909696; c=relaxed/simple;
	bh=H5mXvbU0KXgZqtkfo2Z05aVUMmoMZboGKCvt69cfWdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0zCGxbpCKGTJIP6iyLUvSPvXy3/ten3bu43qhUwePX8dK+ow5yCG9n6tNSpnbL5ah2HSdgvutSPF2iIlOQK90W/4fbwzHDXBYumSB5TmyxYth3kiVcPZwBbkd8+9NrOBEpIE/SELHwcVCfRlOlSaYF8tYQeHSA+liNYp84bTdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haC/g3zt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-728e729562fso1193234b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 01:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733909693; x=1734514493; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cgqV/JO6oR6aFw7Aik89l/GQyuFFq78Hr5VL5rEr7CM=;
        b=haC/g3ztJM7g9KcDgNrzfFHoObTbDiYNu73sOtQXB84/2JOh2N853NmVnwD8k5fKQU
         5+8zUKwinmB2VQMtg9MndlpKpasPiuSzNalWF2xBXocQC3m8nMbTHNvT/AstxYIbA4Av
         CiKYa8ypVIzel1WCpvBHohPzITRNJpBRPjHgeXvlS/1WnLmSQ/HjoISvFhRIonKmvHMZ
         l8r1lqYJOB3qnTuUjIVybssfbGJ4TqbJ3NuUGEOoxiSZA3CP9KW2zC/TK1PEGL3/jMjS
         QxMFkDYHPPZFzyfn/7hMLWQNERkkrOL7f8KAlbIyq5UGOvPusLVF5ZndetlPIrx904Hz
         u6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909693; x=1734514493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgqV/JO6oR6aFw7Aik89l/GQyuFFq78Hr5VL5rEr7CM=;
        b=UXM+BsvIs683+t3ZOfOK2dfVHqyToEQUi20ElDHltp12z4eK9GeVKGXSVOnMY19GSa
         GmOMTO/WLDDNqafPG5VkJrYz4bqObKeTVNvveQUEbYng206N1OfpvGHd31OuVhM7UcIi
         tL0BprXju33tbIUPQOWxiSjxvjAaQi8ggJWtk1sbxa8XweHn9sWPi/9uwVke5prr2JO1
         VdiaN99a1pskXq8BuwmXN7QUo5m6WuzplAA2CDq5aP6t5OubQSgSqu8enrjsRCsVT3ku
         UV55Mgi44KkAPW+kGiuLwHI4ac+olWBRKnijvjEjrcFc6oLtnN3Fz8uIJYzc18fapVWb
         d8ww==
X-Forwarded-Encrypted: i=1; AJvYcCXG5sRLxPAyzP5He2sPW2iUgP02zb2wQRzFau2XZXVtFtM5s3l96f23Ea8ttlTNoBoj6p4k20m4prIxVc7a@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDBlVn2Odn1ip0S9sRZVLOPqOIIdfPldd5CtcLZafGviLQpcP
	WfBzk5G9zgdwP3gs2UDfVvpE2Tp70oN3nSgrqqqjgxXQ135M8UJ4xt5yNibEng==
X-Gm-Gg: ASbGncvI1XNCwgKjdEjaPojoEbacio5BZYLf4/H33MxCS6Dcl/FcxslcjCGQKpNzkyw
	u7tu+CtcADS5U1x+gQ4YygYbG+iUFCpUrz1lxEPjkn1dNIP6ZuWYuKe+r3g41UVkMX2Zc7ubp2T
	nLX2cceP/BCuAR6ouoLSHZJ+Od34NgRQ6Y3nDSQY6vA89eApWMjsm0vee4avjfwlf1qN9X7Oags
	3BCWCVv7gjPXPFK0e9r15qICjaD67qOnx7vmz74lcQtVxpIGzFJ6i1lvkm5LpY=
X-Google-Smtp-Source: AGHT+IH07+qa/4yb9DxmiZHmFWco0nSmlHI3Wipl6jd6BWnIU+MGk8r8cehLwq5q837AcEZzgzZO4A==
X-Received: by 2002:a05:6a20:cf83:b0:1dc:37a:8dc0 with SMTP id adf61e73a8af0-1e1c12df490mr3814479637.21.1733909692958;
        Wed, 11 Dec 2024 01:34:52 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fdde228459sm2593605a12.40.2024.12.11.01.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:34:52 -0800 (PST)
Date: Wed, 11 Dec 2024 15:04:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, p.zabel@pengutronix.de,
	quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Praveenkumar I <quic_ipkumar@quicinc.com>
Subject: Re: [PATCH v2 4/6] pci: qcom: Add support for IPQ5332
Message-ID: <20241211093445.ykmr23zameie7si5@thinkpad>
References: <20241204113329.3195627-1-quic_varada@quicinc.com>
 <20241204113329.3195627-5-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204113329.3195627-5-quic_varada@quicinc.com>

On Wed, Dec 04, 2024 at 05:03:27PM +0530, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> The Qualcomm IPQ5332 PCIe controller instances are based on
> SNPS core 5.90a with Gen3 Single-lane and Dual-lane support.
> The Qualcomm IP can be handled by the 2.9.0 ops, hence using
> that for IPQ5332.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

As Krzysztof mentioned in bindings patch, you can use fallbacks to avoid driver
changes.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

