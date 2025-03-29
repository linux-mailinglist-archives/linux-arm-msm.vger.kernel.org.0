Return-Path: <linux-arm-msm+bounces-52802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1771BA753DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 02:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64621756B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 01:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1A61DFFC;
	Sat, 29 Mar 2025 01:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekTOO4iG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA5524F
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211616; cv=none; b=pdUorZY3heC0UuKuiRl79aKu61w6DOnD6o2n7Yfh+c54Hm6YUtPQqoIpnEGZVRctbzXZEIBmt+Bs1GPLspQUj0Dzzgsd5ON5jl4+fL8nX372lHcGMGyWGsWpin+JsoXqisUTMuNsaQ1wQq5hwegfWtJ4d1x7NscnAS/ZLfwpLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211616; c=relaxed/simple;
	bh=ieo3v3eB0Q3Vd8qHSezVD4mOnD8BGH4gMrjlTPEOOWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=NLDD1CS+TNX5o12xjxmB75Yorh8XevWwRI7J6VxfM6I5cdA30VE2YJs+V1LbI9zGb7eA3WcthvFsH+NQS21T5/s6WQKZj6DcJv6XeTSykcQoXb1/C2PdyR6AQzml4toO9L2LZBonB22+C1goxu/Xc2YC+fHRE7+kGTq2qdrZTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekTOO4iG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-399744f74e9so1872294f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211612; x=1743816412; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3qGhnuDainIiSGsnAJ33rQSgGHUL64MysGlQKWygUU=;
        b=ekTOO4iGHIY9n6RbogazejacyBhs3WT8xEMUSvxTKow1CbTN/aG0eMi/ccNE1mi1kQ
         OkwP/q+N4Wzdv0gObmIgoGW/RwQlZZH8tSpqG9pQltEyDdIzgVZUZGA/gCEiuXOMhNFm
         U0zfT72QPqd2saBKAKpoealSQEu4nZg9EYL6db+JbGwibxzuYETVwCPf2vtxLtXKhAC/
         CgeN5elnspGQkPJFKZs46A5Tdq9CYT7zcrFbRbCH8zEkNTijcy6fBiK+X8iR+j0wA7/S
         x9vIiT7P7FUu6vBp5Dy/GyTXi0W8eYeCZ16wptxQ1wQpy8GzyTKOJhqSr6IO7BjCMWhi
         ffNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211612; x=1743816412;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3qGhnuDainIiSGsnAJ33rQSgGHUL64MysGlQKWygUU=;
        b=JKCgLbB6fKoBV7YO9Q150MZTJINwHbV/14oHIy3Ucfmer88slj2eiSyxLTs6P+COL7
         eHtuCA03nmEKk9sn1V/9kIEG5Hx2mlmd5agsJunSwbuGTrKJI/du9L0SkdfbT+t1eY0o
         Dc2pdqA9RGWosZXBMhXl2cHDhtfJlLrYmNV6iLa3WCIC34hQPx0gkpHHDCdycNUHn0w7
         bnV8xwnSknqY4I8XyQI8VBmDVafTA8ScxmTGO6ufY7pIBeu/t5dkX5EucPUcLsUSnaNV
         a0poTuKsUQqLjDIQX3QoTNOEzclLp7c3oCmk41MNpjVLe9jdWfhUPuuyay/2F9d73eVJ
         yi+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9pGHPF6gNbScvTXcxf2MSL+btDPju3Q9LTy4Z2K1qH/kO+41hHvLTb44L1sqePAnUvdm1ChT+d1siD7H4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy640Zo6q4hax5TUeEWu3UCNLwKDFtn8yw2I2DxJ6vctN8gS0Zf
	84K0P1FBoxQjflPXDHcpNUOfihpWcU/7cUtoLHPgNCV25YOJ3r7/paPGYMp37OI=
X-Gm-Gg: ASbGncsy5LDB5+teP24Ih51/0KPQNhyHnnQ10F6IE965POHw35doZFQuO1RqpgwYNUw
	oMK9/YaKRvo/elgUaLWBFNuvWHfA0UfvdG+bn0o24MEVeCWtKt5zgfKMGW/vRt6/RacyjMDgoL+
	B8068DocWxIvB9u7AGtHsUElVVfS3YWkzaLBk3TN7wfk7rt5Pe2cg7iALpHYDG3Sd0xNAi9q4Wj
	CUdtMs87UKhMLca4a2DhC5BuJUagUH0vWI+7xa8CDarbwNuwIMG08ry+DLY5MXSQrfX1LeHTI5T
	0tIkbJjXpy/aeOPEl4C6UPxvyAQzS0Ji7SUOShESeWhYLH+BCDIUyswMxGHoL80txX7dJE2Aplx
	mW5tlvVmVt/Aw5BV0+eu3
X-Google-Smtp-Source: AGHT+IGTHkSX5Lsugh5eM7Cu6CGWHlhiuVXW/CQFpV4/rGcYQLEZya9631aVHT9jxzBaZCaGHcBp/w==
X-Received: by 2002:a05:6000:400b:b0:39c:dfb:9e8e with SMTP id ffacd0b85a97d-39c120c7cc3mr845271f8f.8.1743211611742;
        Fri, 28 Mar 2025 18:26:51 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
Date: Sat, 29 Mar 2025 01:26:49 +0000
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlM52cC/x2NSw7CMAxEr1J5jaWQtEC5SsUiHwNeJEV2qCpVv
 XsDi5HmvcXMBkrCpHDvNhBaWHkuDc6nDuLblxchp8ZgjR2MsyOGHu2AxmHrmRJ7jHPOXCuJ4kL
 lq8jCitlzqS0/TcHdqB9TvFwDtOWP0JPX/+v02PcDoz51poUAAAA=
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Switch from venus Reviewer to Maintainer
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


