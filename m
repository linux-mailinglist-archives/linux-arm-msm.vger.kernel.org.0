Return-Path: <linux-arm-msm+bounces-51667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9BA66982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D2393AF130
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 05:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C81F1D8DFE;
	Tue, 18 Mar 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLl9v818"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA41C9B97
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276327; cv=none; b=OFMGzrr6g8C9kF6VGXq0JKKcQpX4Rj95gxLHb+VTRmNQYTMEAwoob2dfPS6WQJkA52Ht7HsBGu5zeQTqFUXNCYcOfLSKA26C+wuD9k9ehIzBOCxk/WPAdVDyQ0nUp0ZPBHTETa+Ie4z1qZ5gvCcntXm7Pz1SnhUKuWdhRgWpHlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276327; c=relaxed/simple;
	bh=P5iM0uabpaJ1AbJIJnKcL+VevuH5PXzgqzzKXmVjFEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIhBdRrQZ5nyStbbOjhlTUdn75v2OJc7smp9b1EsvxTfVRVBPn9bX5kdwTdTvQe9Ow1fnQl9f0sehCCPevNL5x59eGZOXk9D4ywM6LwVy3Mcwir0/iRVY5n6o0fJ7To7da1YyTLzPlYiJFEv52dkB4SXCcPnwgCA9AHMA4DSRds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLl9v818; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223594b3c6dso106950455ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 22:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742276325; x=1742881125; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdaqatqISFRYNU0Pl5hfD9x9pMSiXYmVb+XBgyOMwkY=;
        b=QLl9v818V12gQj0t843raaAQ3YRcjybkx4tqoaoX3tZumoohYu9dBHxkiDImCIi9ph
         1gu9zg1gsV6DkAKiPqxbY0qB7FTbIRi7JTNuY/6dZoJQOn1ZmsUSMyA1IrcqlI2Pbzfc
         zTP5K4yzt5B8Lwsr6rklRmZzSCy9L/nUKT3/j+i1x5C9hVaoTe3TocaHt1zFkJHhwxnG
         0vkxGZVGJ36SFYvaoaUhq8bRUQxEq8+08AkBGEb3CDGExn/+uK7QSynrwTUi4inXOLOr
         9LW5/MFph9JSqbTfHHNfXWQjex+Ce59aZnyEICG4NIW2KOCxQKpGyXntw7d1RT9OEFJt
         VWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276325; x=1742881125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdaqatqISFRYNU0Pl5hfD9x9pMSiXYmVb+XBgyOMwkY=;
        b=uCOR++cX8eyuG2XwTdp0aPnERGI/t33pTTG3SSqUc4k8BlQWQzHTJPFEGbynorfIk2
         MPmGd3q/n4adTRrYq6i0+Pt3Jt9QHdTzYTPQuPLFVPI6uJaZvw5e8hbEvJkqigxI5RFN
         m2WYmYjmgEySYeOVps3ERJjpyVEgCao/vMfbQWyD0u61VAarS9XVnbudtcR+Jszb0EnU
         jt6umI+cl1VXSq1ecDrAEWxQq/rUrFsvdxrVXstvPFH5X0jortH4pYPJ4Ce9WE33e7Bk
         czyh2HeUVQxQfrGGeCC5QYXvi5x7YFJ3VdZxnd46xvWrijUN3xMP85E/gD+11/qsPaIY
         KLhA==
X-Forwarded-Encrypted: i=1; AJvYcCXusu1cAvp8iw64kgmj/CYt8YVWXdMWYIeMtLiQwQrTvU0CxvHhJTojayqpgamnpz3KxipkWablUbi8UTL6@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUylUGqQ6+bFRd1XZcbsBvJt0fijlRQmEeQ+BHkPcXCokc1IV
	4ybk2qHdO/E6spxt7H83/XZBks9iZwIm3Xts6RMB5H7ad2dRctRhVgGyyhVnpw==
X-Gm-Gg: ASbGncuSMMASV0/akGZ9TtPgV9bHVn6Er1DhbK3eo++fTBBTP8ODGRsEG9QHOCSkzFC
	w2YK/Kh8jRUvlAbW8HJZq5wYe0CZQgsbLUjJ0BecZXdMjAJDz4HSzf19Y7p5NRyZgmlNdIax+iu
	Nn+PmNH/r8refnUmH0PQpFH2bOni7M5vWtM3L2bAWG4tQ4p445/pyiznl7RAzT5Cx7CvJyOfKQZ
	l/JVZI5rpmEqOrDU8rRPF0XrnMF3/WXSv4QMQa3xCoDboYJDuEIbb5dyxx5e9AYMWT2DDh+dmyJ
	n/Nooe9fj4QNAEqzqc7Bbkyb2PtkfE6OJWJtDK9EYN3IKbH+mgcay0pMMeulIqqR2eE=
X-Google-Smtp-Source: AGHT+IGtKPupstxaJ9l2OYhRXppRqOSSephtsRZM9k0tdvFT4Iz+eKcqIdvaN6lvgoSbh8+SItbTKA==
X-Received: by 2002:a05:6a00:464f:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-737223fd0ecmr16558503b3a.22.1742276324825;
        Mon, 17 Mar 2025 22:38:44 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1024sm8604240b3a.168.2025.03.17.22.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:38:44 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:08:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, quic_krichai@quicinc.com,
	johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 4/8] PCI: qcom: Add QCS8300 PCIe support
Message-ID: <20250318053836.tievnd5ohzl7bmox@thinkpad>
References: <20250310063103.3924525-1-quic_ziyuzhan@quicinc.com>
 <20250310063103.3924525-5-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310063103.3924525-5-quic_ziyuzhan@quicinc.com>

On Mon, Mar 10, 2025 at 02:30:59PM +0800, Ziyue Zhang wrote:
> Add support for QCS8300 SoC that uses controller version 5.90 so reusing
> the 1.34.0 config.

This is not a valid argument. You should mention that the controller is of
version <Qcom IP version>, but compatible with version 1.34.0 controllers and
hence reusing that ops.

5.90 is the synopsys IP version, not Qcom one. You should mention both.

> 

Please add more info about the controller like link speed, max lane count,
etc...

Moreover, cfg_1_34_0 has the 'override_no_snoop' bit set to override read/write
no snoop attributes. Are they applicable to this controller also?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

