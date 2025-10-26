Return-Path: <linux-arm-msm+bounces-78817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86EC0B09C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 19:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F59A18889EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 18:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8542E8DFE;
	Sun, 26 Oct 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUWMMd6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1004254B1F
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505109; cv=none; b=HQ0H5jJBdtC68rItYDYuIrVLgkgaFHAY4zKaakG6X3oTEGnYvRWa+z+jqh4beaiYHCPQZ++slV3LE8fNG7s8cUxQLeCLgvDDz3Y+unexD6g7A0S+dODlY8L4w1uZ8/LeqBmB+VuXBrTLQ0bahQ0qWqhZEU23km1OPVSjdvdmCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505109; c=relaxed/simple;
	bh=7Ov3Z6fY7RP8x5Q0JG5MGys/zk1hMSpcwDo3k2U2CFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUqWnpNFwxfMB0i8c0e/SpIo8KE/HZMteahgzeHeO/zkTa0FkwPHSH+Fcrsb8QTzi+iNBPaBSUVyE5wspTVl5s6zVeMNqhr3DqItR8bhoQ/eP1jqGoir0831ALzdVg+UnxqgwwuLw5o7a6R041kLzC+JRF3y+vvnNIa0/AGb87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JUWMMd6t; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4285169c005so1761535f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761505106; x=1762109906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ENsjTeOjLdxslr5mcl6vGKPut02RZ9cd/wR6kYX058=;
        b=JUWMMd6tCMyTrkD/SE8fXhulfqOmzZ/uH2gPEAemBzRdKSvUvSG+ulFisvSXUC5mF2
         Air7zIjl9KRukiVjjzq09uiK1xkTNu1cy9BEEXqzOwmtAU30ocVX7EWldvfyAlv7vRBJ
         aKBxO2mtdx94Ue6CQ4c01lWfytUR+l6+Zz/3dSHd5TJrsl7C10Az8Xx4AlYEB5lkHWbx
         wQx8AhGmqv51bIjRcm2fmqzO+3azhqLypV8hfe6Adnl9vgkBLd3r8U3DXEXV52IxetSW
         yIclWuCpBkmvmSB/94nX7Juy8a+wBO6zSxuM4iG9dUJqqJoTCrUMa9Mo3vQqP+w45epJ
         SrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505106; x=1762109906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ENsjTeOjLdxslr5mcl6vGKPut02RZ9cd/wR6kYX058=;
        b=iacEhekWv4d1Zu51yMqaJDhk5VNB/gXBYmZ1ha7VOw1uFOVqmh2CmIt9vWu6Vfhqlk
         KS5pNW9FRso7M7PzzAusysFd+GXwzJsDi6ny1BADo5cIUDDpDZ24j19yvvdnPQl7j1zj
         7a84hqoh3/aJx8kToIx6aj6JX8GOJQ3ikYFp9cPO/wt6x5S5M9E3+fgVMPtlifI4bYA2
         D58dQAsPxYoj7ruFdfS4CcUuLflT4v5IL/moyIJ5Q4xXabZRqKJyNf6AUNR7fc57EuK1
         8kcNEF76858kbsQKcA72F16hdYB7LMi6CRbfmcg0h/A7KnCnRWpebjYXCpshyvi56GEf
         8enQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmSzwMDmsdvF48T7mXSOotKTl07V/kxlfHHtOCGRx/G/9Vj5dM30aCDtWxkkviKFE4Ooyhn2ydM7GZ7AwO@vger.kernel.org
X-Gm-Message-State: AOJu0YyyBVdDEsO7wpidDbb/30k2M5yrGPlO+WS/JtX8FhkoqO+umRDF
	sZ6cbEG363CctO25TW40ZcP9qH6yS3aQcKn/rKBdfzVcidVltogcck2bJI5kM3znBCaP9QIXDrm
	qJ0Rb
X-Gm-Gg: ASbGnctwSQGkNlPePLxj9EOJuc77jJkeWBJJpTJEtFjR1UYUT11aXKbL4Obsu5Zxlso
	V1GMeHJ4q/JAhNeCZIv59jufP0vgXbb9XqEMft7FfD8AcTGGXp2aOsxsQfogsDqfw5Q7UHE1hjU
	Sge7odoY+VGLLuOnwF2CfYGozOE6KnynLoa3XsEmZNQhfZGUJ/TgjdrqLAgvXwXlD8swTlMOs4X
	yHh18iBVcddhoZErJ8e8RoHye4rapjIyM8E+ry2Mp2BESmGmSQFrKYabVLrbOYk7NuljvZ1qv5V
	9VHOVOY/NYglqkiRETbVwJc4gtf9tpdTrAl9nbDFEyC8pwMFx0cZskhqo36sxoJWL8HmsrxL/O3
	+4uNt8m15+PYzEM3W9SLBFBEfiGQkDHDdpdV02f86AK4uxWXWjCJA7TLci9K3DkmCpsthDi65qh
	Kvu3dztos=
X-Google-Smtp-Source: AGHT+IEGi1LrKdNJgL/lmGIuAv5Pk2ftdAlMUoEl8sApRYc88igr6xA7ES9WSa/L4C+CwTbx4pLi6g==
X-Received: by 2002:a05:6000:40e0:b0:429:927e:f2d with SMTP id ffacd0b85a97d-429927e128emr6579302f8f.38.1761505106117;
        Sun, 26 Oct 2025 11:58:26 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de971sm9880787f8f.39.2025.10.26.11.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:58:25 -0700 (PDT)
Date: Sun, 26 Oct 2025 20:58:23 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/8] phy: qualcomm: qmp-usb: Add support for Glymur
 USB UNI PHY
Message-ID: <uz4otxac4seklrdtlcjv6wr6n2tkri2fmuhyrjni37lpbnbcho@zmvmmtxryinn>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
 <20251024-glymur_usb-v6-7-471fa39ff857@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-glymur_usb-v6-7-471fa39ff857@oss.qualcomm.com>

On 25-10-24 17:47:45, Wesley Cheng wrote:
> Glymur contains a USB multiport controller which supports a QMP UNI PHY.
> These ports do not have typeC capability, so it needs to be differentiated
> in this manner.  Update the QMP PHY sequence required to bring up the UNI
> PHY for Glymur.  The UNI PHY follows mostly the same register field
> definitions as previous SoCs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

