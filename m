Return-Path: <linux-arm-msm+bounces-80269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DDAC302DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 10:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 60E6534D1AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 09:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE3930F93E;
	Tue,  4 Nov 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRxC8ZhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE56309F0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247424; cv=none; b=tKj83YKFuu676+lp8QKXLMYvIyZ9ZBy9/E0P0+4wD1vB0cvc2qCPY+DMb/Yi74wdPkYuFu9188R+YDUICWePEMlBI+bmPKOXKiETgHwlwkMduH2C8hYE3o7iBKhDPJImtViUQotUE39qRGNxp/GzrnpwULSnG/BXZjLoYb7Dj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247424; c=relaxed/simple;
	bh=e+WrZa3ef8AdRcYId27XHT8jL0SxKU0LfZDZgv50HDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5UMnzmHsDcIiOsAfYaT5vE8nnwrIWSc3Ao7+FTLOizK2QCeyQyIivyV3iyjzEHgYSEkJLxdXtV78bdqTD1S+7a05YlCeTA00qM8NjJhtjCvh1qxCSSzW5ByffeYcPAtAYm5UXyPCSR/V5TLLC4P6mq9ZXNhXxfxZVcvLmBOgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRxC8ZhC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47754b9b050so4677945e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 01:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762247421; x=1762852221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DpweAw5zruf0A8JomoHVO706aMoW4BuNB+DPtZgoR0c=;
        b=sRxC8ZhCitcb8jMy8baFppofJesOvJhYxATqmidj2fyLLKycALUDZWc/iwXFuV1y5e
         5vN131LXZfckyA3Z3Wf1z99UlavzxmGGdgmjTrHQ+jgWqjRZst/F5uYTwmqW8vNuoHsK
         3+OTxrNP9AF400wvn91K+4JrHGa0AMeWaVVst/yFG3l5tTYMENtM++/UBzftx50ZBUNk
         CCVe/5nhtOZRzDaiYcVBdWhD67lLgXG9frGXXkFG63/yIgCztmOnJ4NrDn+IqAMcqC3k
         pRHOHL9uTZ5tUJQlSaZWiO/ZqCQgW+44851/fIUZ1knxd1/56dNtWtZI/ZogAW0KIhx0
         UT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247421; x=1762852221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpweAw5zruf0A8JomoHVO706aMoW4BuNB+DPtZgoR0c=;
        b=Tt8NJf4H+uD1gcsUpmRO86aow/7zbbB/SWF/7gbQkZoHiqnRvBmzYfRsLz/oyw78L9
         JirDbrzW05vawTdBsgsTrLVjhE1YX7B5dT6NqiLFtYdNIWw+Ehau9j3VP4/enX2fiZUC
         BOBzq79zr3qd4YLbCXXcl3+mWeQP5epRkAyIShP57KfAagcDqGFw9WfY06sGfRgXGf7d
         NKPJeAcIFcq2Upcdu0VtCsWwYfxPcIVcIJehXdSPJQ0D72wc31YjDU29/yh6TGvhtBqN
         smRdHlPNIqQ9nn882CpGaDNJqGHVZVAAjf24ZAN/WYyjifyi/IQWhGQ98CfLp91X/5IC
         k5jw==
X-Forwarded-Encrypted: i=1; AJvYcCVQnzICpgyUEQCda65qZqdE3bQL1e4GWcknU1D/R3Ad0uTzcst5utuzdSuziF/4NU4Bmc4gT98KcS9bCmMt@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIlg6f32+6A0mWOia8E988PyQdaGxfu7yagjn+mey56Cwsnn8
	WalOccxkO2ZX9XvRz7bxHHrYLOsxHgK3tn0rYDwVtAosahsjrZb7LJfXx697EXf/FQs=
X-Gm-Gg: ASbGncu7yRpuFrohJ5vECkcM4JBhBIlofGVO1toNnKpTXxEVXfTQgK8YjjRhuVtaiXq
	I422hiphmhy/2hh6OGiccOTinTur3+YH7mV8iwiza584eW8suQTmTZ/SK5B6QQRj5DWPNDCSR8w
	kuIzx9QX0z3FzqJzuzkXMRqbjq8USuyeQctr08rQOygfOFgYcwnm2aJtZSByCUvFzbc5A5IEFn1
	VeAp4OshdSUkL1i1wIWkGXSS/fcymCXxOUirsxvES/hcBeYA8PLQSWZu6toBQ2+9h1p4M76fZ/d
	1xoOV3O2ZUUGvWgRpiP4MHgBvlG3mutrPZ3kC6zAF8xPKMMdTD8XhMUMksbb4xIHnJVztEWxp3n
	6sVTut9/URORHdBhIKpvTN5SzSq4Ajgs9eZOU82+ja3HUVUwRSMPLfoNzlHASXgDPOighsDAQ
X-Google-Smtp-Source: AGHT+IHCBO7xLP5BokKxzK7/sqIK85VXUnkSNyV6W821hzOhPl8zMr4wD6F/COlyyLObPR50tBq6Ig==
X-Received: by 2002:a05:600c:3b03:b0:477:54cd:200f with SMTP id 5b1f17b1804b1-47754cd211emr18406055e9.9.1762247421039;
        Tue, 04 Nov 2025 01:10:21 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c2ff714sm200016665e9.8.2025.11.04.01.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 01:10:20 -0800 (PST)
Date: Tue, 4 Nov 2025 11:10:18 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Message-ID: <2cdrb57borduwntzkihdikdrmnytibbtw7eyh6xjmyqi3yppyf@iwafnggbrnzb>
References: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
 <20251103-kaanapali-pcie-phy-v3-5-18b0f27c7e96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-kaanapali-pcie-phy-v3-5-18b0f27c7e96@oss.qualcomm.com>

On 25-11-03 19:08:17, Qiang Yu wrote:
> Add QMP PCIe PHY support for the Kaanapali platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

