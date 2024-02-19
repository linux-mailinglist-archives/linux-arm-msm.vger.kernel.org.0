Return-Path: <linux-arm-msm+bounces-11684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E24785A431
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1B3C1C234A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE87533CC4;
	Mon, 19 Feb 2024 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZcdVIMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406EA34CD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347863; cv=none; b=sjcsnyOsH2tMK7EX+PBZGqg3g63h/Sigplj7wJAdr8dJRCJxU+/PYvPboo3ve5JQT6n3iSt3x3R1At91kHVQSBtZPzWVIJtQwLX/X7lwbUGfnLSWwPBWx/XHpdXa+rZNb+7egWShvsuUKqrLLnz3xT+DKuaAnaPPhBsoemYap0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347863; c=relaxed/simple;
	bh=g4AG8yACEdlrgRAYFLRSW0rTdk7RfFh35z1t1F4FKdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIfftehKlra0elm62kwfCNtZfBbIZjEujYkguzlz1de2E0gRgjNKaeBxuab9ZdcCkk1Q/Cy7HZkRglQBKqL3BT+ntcV0vEnM4TRskR8Wz2mFr2MmzoYy/KjlxCiyenJHue2YnpHBAyOYSkwxLojaoVg5IW6XvuXIJC16BZe+cOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZcdVIMy; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7873eaa0ba2so170069485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708347861; x=1708952661; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SY8Y2hH/CXJ9at2J0AQUWNH09vMSJ7Esh7RYr/Ugldg=;
        b=UZcdVIMyioNnKkYnBGISxQnN2sUDn3Pl8RZYoMafIDBVTyF0ZJ+l2RCLqSYAPWN2m5
         LQXlH64lwumPSNqSqRSFMdx5csRFdsy6r0wQb6LE1hQUwZMVR2zMSnmFEOz2l7cYLRnn
         BOHujLWjmfLV1YPfVEzJC34p0WBskC6K1kZieHRReEi38JYL+JobXfXCskARU+Tfth/x
         T2JGFZSpimRSX08R1aYgP4JwWPPrfezeBz+VE4fpe69mjFufa2G98ccTBWfgjOcJ51WC
         clrrxdl7n2MjJtStsxsQSgWHJCpKCY6jh45Hv0i+w1nUWaz2Fk/0R/WQyjTVkpQDyk/u
         ofYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347861; x=1708952661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SY8Y2hH/CXJ9at2J0AQUWNH09vMSJ7Esh7RYr/Ugldg=;
        b=uKs1V+zuGaJB3kHTncJrn7nmdROFBYOlUGUOBwkLhCv0OGFuXGyh7a1EuRnWMEhZmz
         dkJhsoRjhlTZOo/DDJNQn8oNk71PjgCn31iihGDCdSvDpT+pqRlfe2yptu6k958XIek+
         cOV1tgZvY3avUfXkY0GDnrcPkrNxcntHD5jW2KU9n/1qxZ1M2bG7nx3ogqenv996bfn1
         gzl9eUeZMbHa6QPEpJJVnLWnAQQzQoqDvxvnZGbqf9kEWI0gso2QTjqF46A7jktGkney
         RO4P5YxRQZ+Y+0ZmwijMcunXLjAogJTwup0I5tZcUbCcc9dLTCZLnOt5Iva5ZsBehMLy
         EyTw==
X-Forwarded-Encrypted: i=1; AJvYcCXEHwyTR/MjX3nb171UOh7hl7qewIGmnk4n82gmHRAOKGZ3EFNSqMPZhAw7YjrI3L0Js4fcLimS22AblqKrgmQ9Qt8gQVPJD0Yj816+Ng==
X-Gm-Message-State: AOJu0Yw7mutm5/BhwmpvsFsx2LiXVhscmcmWWfGc73GnNhL2WPxWsU7Y
	cSSpmlCysF7w/iXFR9ZEXux7lzonj3Z9Q/sFeWMQytEQs3Hh6yIaPyFQoNrcnw==
X-Google-Smtp-Source: AGHT+IEKBSaPNzIeULQKEG+04Ak6UQqjqmNKykyWAsLL5EoP+wRKjhX8SKhSvx/abI7RnC7ox+lquw==
X-Received: by 2002:a37:c441:0:b0:787:16e1:e970 with SMTP id h1-20020a37c441000000b0078716e1e970mr12977495qkm.21.1708347861130;
        Mon, 19 Feb 2024 05:04:21 -0800 (PST)
Received: from thinkpad ([117.248.7.166])
        by smtp.gmail.com with ESMTPSA id l7-20020a05620a0c0700b007854696725fsm2431669qki.75.2024.02.19.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:04:20 -0800 (PST)
Date: Mon, 19 Feb 2024 18:34:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 0/5] Add QPIC SPI NAND driver
Message-ID: <20240219130412.GC3281@thinkpad>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215134856.1313239-1-quic_mdalam@quicinc.com>

On Thu, Feb 15, 2024 at 07:18:51PM +0530, Md Sadre Alam wrote:
> This series of patches will add initial supports
> for QPIC SPI NAND driver.
> 
> Currently this driver support following commands
> 
> -- RESET
> -- READ ID
> -- BLOCK ERASE
> -- PAGE READ
> -- PAGE WRITE
> -- GET FEATURE
> -- SET FEATURE
> -- BAD BLOCK CHECK
> 
> This driver has been tested with dd command with read/write page
> with multiple file size 1MiB, 10MiB,40MiB etc.
> Also tested with "mtd" command like mtd erase, mtd write, mtd verify etc.
> 

This is not the first version isn't it? Where is the changelog describing what
has changed since then?

- Mani

> Need help to test these all patches on SDX65 and SDX75 platform.
> 
> Md Sadre Alam (5):
>   spi: dt-bindings: add binding doc for spi-qpic-snand
>   drivers: mtd: nand: Add qpic_common API file
>   spi: spi-qpic: Add qpic spi nand driver support
>   arm64: dts: qcom: ipq9574: Add SPI nand support
>   arm64: dts: qcom: ipq9574: Disable eMMC node
> 
>  .../bindings/spi/qcom,spi-qpic-snand.yaml     |   82 ++
>  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |   43 +
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   |    2 +-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   27 +
>  drivers/mtd/nand/Makefile                     |    1 +
>  drivers/mtd/nand/qpic_common.c                |  794 +++++++++++
>  drivers/mtd/nand/raw/qcom_nandc.c             | 1226 +----------------
>  drivers/spi/Kconfig                           |    9 +
>  drivers/spi/Makefile                          |    1 +
>  drivers/spi/spi-qpic-snand.c                  | 1025 ++++++++++++++
>  include/linux/mtd/nand-qpic-common.h          |  548 ++++++++
>  11 files changed, 2547 insertions(+), 1211 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
>  create mode 100644 drivers/mtd/nand/qpic_common.c
>  create mode 100644 drivers/spi/spi-qpic-snand.c
>  create mode 100644 include/linux/mtd/nand-qpic-common.h
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

