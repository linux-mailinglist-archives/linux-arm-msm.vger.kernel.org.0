Return-Path: <linux-arm-msm+bounces-27671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F7B94450B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AFD52818FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 07:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB381581E5;
	Thu,  1 Aug 2024 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHL1CJmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EE3647
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495644; cv=none; b=LC2TVblWJ6bLwfKS0K7wKE64O6hnqlva2AxvDpBmbQpUb30Lj41R049u837ytoZcpcObNqKN9PQQrDjfnvv+f4W6jaopr+qVeB6bqXcMJvVZrt+IKGjXqJlwh6W8sqpKy8vCh4tZwc/3aGaMsnkTuISyBsByHJ9JGd7u7SC9np8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495644; c=relaxed/simple;
	bh=KSLg0yzqiI4hPE5ov3n8SQ0mekRG7ftBEc5L0sChKyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMmeJfxmOarNIuQnpdQ/2y8ynhbLI73VK8T1txmTlAg2dQxJzkhjMoQM2WcZsEWl1UFzlnX6dtsnOVBnX4jLibYWzS+0BO7YGKp1B7V1Ru3GnDzn0mxrlX2lKTE9GQxgvzRk36ROCx002bsdURDi56hFY8cbmrlWVSiOxoGKbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHL1CJmp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d2b921cd1so5834536b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722495642; x=1723100442; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mnbrn+r8w67xaS4dRlv2WYPfTmOAIm6sgMTn3y+iDAw=;
        b=AHL1CJmp2PcBF3O+ghTSTaylWJyxJ2QkXwhEf3ak5yDUS1nUf5gDQA3av0u9nhQvAd
         hlIG+DjpFmGPjT8wOsoDDNnFbWFcji2zuIUfFUueBOx2Cp3kj8PbsRhh11BoHmawQaTL
         e9t2TGtlDbi02PXckC8U8FFyn94/GgUxk0lZO/g7RXtdkdXpZLvEZWkyM7sXXsc5i0DE
         8R4tw0s1GRsHSlJ/hGBHPL4kASL3W5Rskixgagd7YZqFVbRrmvwqDmKoYwgiWpQq4vnI
         bT8NdP75Ud5E0ZUGADGjXcH6EaExYECfCbxZzGZZdj/Jw4ADeSi9LEchRu5MdIQgSazS
         ccWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722495642; x=1723100442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mnbrn+r8w67xaS4dRlv2WYPfTmOAIm6sgMTn3y+iDAw=;
        b=vLQrevWtjvLSuH7gqQW0yf18ZoyCEXqx48DqfL7qYaG+Thkxch7FI0IelHaZCviflj
         8ohcUXRUDZ+xD+Rq873LMX4u6O9Gt69drfZCzZ4T6CXVqH/nHsDjcfhwJKSDQ98qxOWV
         Wf/vipg+9dx5UD7Q79rci5YZt6yayLCcihEPyaGTU7uD3nixPnpatM5U/vChOcvWeB5s
         Y4451T5lZ5xNnk3o2THFe3bdiVW4vYSRe3oCsG1t3VgVGQjoYB4/RXno3tyDzpIh7dgg
         PEoINOZxWztnVNzU8XEq9lyT745acVK3bSmtLJY8a6QCxvrs8h6RoILosa6r+Jnfg/PO
         Yebg==
X-Forwarded-Encrypted: i=1; AJvYcCU9DVuta8p0hPP83BJGfAIw994WIqGE8YwqN7KDrEZatNj8ZLqIih0o8hE+lPGwJd+qCPDONHMHhJr7otdO9yGmdm3fAVfi9dPL0LI3Bw==
X-Gm-Message-State: AOJu0Yy6imCsyqun479YA+178hD8g9z6VFqBLdXY1wp1QSjHDQoFHOGO
	N4KUw0KBUcp80kQpIbGd/HQLTsgsDfZ6gB3ryN+AGTRcRIQd6/Q8p7LvrguGtQ==
X-Google-Smtp-Source: AGHT+IEaoqcF6Og6OLvQ7ewWaGYFAcW4sjoa1hHGd0TMPSQdLKOqtrUdh28Iv6TE2SdAUU8BvpA24Q==
X-Received: by 2002:a05:6a20:9f0f:b0:1c4:aedd:7b97 with SMTP id adf61e73a8af0-1c68cf632a9mr2147243637.32.1722495642281;
        Thu, 01 Aug 2024 00:00:42 -0700 (PDT)
Received: from thinkpad ([120.60.66.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8834b1sm11302281b3a.178.2024.08.01.00.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 00:00:41 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:30:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <20240801070026.GB3705@thinkpad>
References: <20240731152548.102987-1-manivannan.sadhasivam@linaro.org>
 <172249532035.256913.2685367794999812971.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172249532035.256913.2685367794999812971.b4-ty@kernel.org>

On Thu, Aug 01, 2024 at 12:25:20PM +0530, Vinod Koul wrote:
> 
> On Wed, 31 Jul 2024 20:55:48 +0530, Manivannan Sadhasivam wrote:
> > These register prints are useful to validate the init sequence against the
> > Qcom internal documentation and also to share with the Qcom hw engineers to
> > debug issues related to PHY.
> > 
> > Sample debug prints:
> > 
> > qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
> > qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] phy: qcom: qmp: Add debug prints for register writes
>       commit: 4e92d504475ea5841716ad775f412342520a3d26
> 

Thanks! Bjorn spotted that it is worth making 'char *name' a const. Can you
please ammend the commit?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

