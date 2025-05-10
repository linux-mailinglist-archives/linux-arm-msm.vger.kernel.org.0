Return-Path: <linux-arm-msm+bounces-57511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B91AB217A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 08:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B3FA06E0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 06:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B482E1DF261;
	Sat, 10 May 2025 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hdqkUiRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0961A841A
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 May 2025 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858019; cv=none; b=mAK4zaydcSmJUkpyZegd+rlTt3dDPuPCMRRxAUeDipJcTs7FLdBpwBVu8ibik0GCnfx7QZ8P9wK8vvy2YLgexE1FPUEta85ct/rjgFx/aoNHEdAQp4sz1F8UEq/iMtmjAn4DKRBF/NXmO0yNEEQWbDJgJJ3XmrwK0DY7+LFt+Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858019; c=relaxed/simple;
	bh=Dk7Dfhb3qDshCc02/i2kRTxnkiTmOz5FTIQe/rTBlqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWfo1NqKq3JYSJmfw+1/bEOtJC/VNLyDVprypTfXB7khlIBjZfBqfJ9entFj9FI7g2ReSmtw2/jYLKQI2RVQroibVnBhEaTVpWewGKUjjOnjXH0lUwtni5WprMt8kC2OW8KSCceOZUIRPIg6SCx3VkAViv3L74MM7swocrKekgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hdqkUiRN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso28128335e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 23:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858016; x=1747462816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXgZhWymYdoZjhxlKda75oexq5PzR6MLUe8jR3aTpDI=;
        b=hdqkUiRNMJMGrEN4/ZHPZF2Dh2nZN2JGkFawt/EFZ7CMi+ImJTICgaYWGPL6YVTZoO
         V9PwibyY7as8JK3Ys3ZezazwMUB+kbps24BKopoHQ3d7K2/dDVDs1vhS1NJVqLHSaRkn
         kl/7JiWWMQhEd69GLrFqPte/2JiFXjPLZqsABKgRl1VCjU88ZpwneC85Va17q8nS9DVK
         N6RK6F3lJlPrCnwP3P7cBqBc6ZC9JdLzk+vT2t6YLAMQ/7+OgtM6w5DSbUs+sAVweVD6
         mZpZfWL7cCkXPdGqC0VFU3J4v2xSJUFyZn5xlDq9yEpo4NTiUrfKHTlq2BJSVXQeTtlP
         yBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858016; x=1747462816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXgZhWymYdoZjhxlKda75oexq5PzR6MLUe8jR3aTpDI=;
        b=leKwHSSQmWjuVTqIfnpI3cKppxKlRvHTrXO1QO1jwxnOEmrKCy+FuiWoCvxIjuWHqU
         JZO4jS9lIixGWmRY7+D/T7dcRnEhqw84LOgeGZVBcT4aHRspjODySEOrrGhmVxglqoAO
         6xddpm0vEuV7ZHHl0Y8Uyf9lvOsmSm6fpZdE/ombZyyic7A1mRFbxU09eUa+R6gQZKaD
         uvpIT6E1X8P/U25RUacTAiBCiNF+GT1grlsw/7tA7VDMZIhTiva/hAVZH4zpd4ZmUDK7
         vdOGdh/ygqwvfG2Xpxyk6ePMS1njQ9XWSEu6a2kEsGG2w54jLehgWKWz+gJaVquY47US
         wWfw==
X-Forwarded-Encrypted: i=1; AJvYcCXWye1npdJSd5IOzxJZ3Z9WUU+ZDA63MEeyJPNmJ1zGZVZIVvSL1TCqzZR/MADfCLTjs4XMyWWEzdByeHsK@vger.kernel.org
X-Gm-Message-State: AOJu0YwrGdKe27EJk+zTvwM3u91pgPFK6KK+YU7EYefPEN1yC0q+NjX0
	d8GOrvziXazmTrhdNvvD83lnfu2SvRGBYh1lUTG+cn3whQQu9XqSerRn2138WA==
X-Gm-Gg: ASbGncuv3hI3f/6kiB0aS64FNBdfK0CatTs7sPmadAZ9xCtg8G5P7o+XwlTtSrriV89
	k4RQVNTziu+jXe2SgFQXZiJtXUP///EinyUTVZpPX/+ZSgf5TYKDOP6k+lzVh7c03kvbU+1mBBt
	hBYHRX6mXtOVHpfyPH5JsQNkYcSYmayEKhASM5CJCVGqGfPaLtYx1AT5QMcmJrGV1Eco+N7EpQl
	23QjjzdadBmG9EkqrH4rhm5QnPlwhCSPi4kLs3uWEL3ywL85OV9bMnYaJppQU592suE6Mc7NUsP
	HNfkPasZ2cj8+G8ma5g4eyFpDDOoxhuQM/eTRu5YW+W9AUO+d9ySiqQ5sCK4K3anRg+C4b9/1FV
	P09tNuAiHh75qgEeUy3BL1RXenoyGjPzNUKWa
X-Google-Smtp-Source: AGHT+IFLT6sRGijZUGig2XXMD86ed28vfiezSuUDGmX0azeabaJj/gZdKAnc2SLHeSPFBl/N/sVb4Q==
X-Received: by 2002:a05:600c:529a:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-442d6d18c05mr60281245e9.3.1746858015923;
        Fri, 09 May 2025 23:20:15 -0700 (PDT)
Received: from thinkpad.. (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d685c3bdsm51305415e9.29.2025.05.09.23.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:20:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/4] PCI: Add PTM debugfs support
Date: Sat, 10 May 2025 11:50:10 +0530
Message-ID: <174685799198.10507.6972897150034953354.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
References: <20250505-pcie-ptm-v4-0-02d26d51400b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 May 2025 19:54:38 +0530, Manivannan Sadhasivam wrote:
> This series adds debugfs support to expose the PTM context available in the
> capable PCIe controllers. Support for enabling PTM in the requester/responder is
> already available in drivers/pci/pcie.c and this series expands that file to
> add debugfs support for the PTM context info.
> 
> The controller drivers are expected to call pcie_ptm_create_debugfs() with
> 'pcie_ptm_ops' callbacks populated to create the debugfs entries and call
> pcie_ptm_destroy_debugfs() to destroy them.
> 
> [...]

Applied, thanks!

[1/4] PCI: Add debugfs support for exposing PTM context
      commit: 1130deffd29ab25da8091b573e173ef9d889e827
[2/4] PCI: dwc: Pass DWC PCIe mode to dwc_pcie_debugfs_init()
      commit: d831581b3433909e9ce9fa0b4d4f79d357093830
[3/4] PCI: dwc: Add debugfs support for PTM context
      commit: 287af93079f5cd8934b10d2e09e23ae4ca7320e6
[4/4] PCI: qcom-ep: Mask PTM_UPDATING interrupt
      commit: 356fc3e997f3bf54448a8cb39b49c7d73959d166

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

