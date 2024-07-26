Return-Path: <linux-arm-msm+bounces-27082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D060993D2AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A971F21E77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 12:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CAB17BB19;
	Fri, 26 Jul 2024 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuZlufqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519017BB08
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721995239; cv=none; b=KEOJtLESDCk68eQsgyFsBghpLmlIzLkicQ92QZ8QsozUxyJd30tBWS1YSgurfXZ7Lln8bY8jKAmx6F/8mtwuQgQN7ezxoQrAc+LUKadiG5Q/ZeUyrEGpBxwogciE9I39XQND2aJvqjsjciGcvx5HAUlSUpGWb1Sj+dYafH/eBE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721995239; c=relaxed/simple;
	bh=t3NW53ZkPecb65g7j6b0wRbYmlTbwnDzeBcUWc6cKiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKNjwA04dAr5usjluhGzPGPTT7x5DkGj2wiE8b5VeQ78CYFdTKtkc09dQCTcNyjWm2OfdvZ5btR+SwsxQRtnY19yfgpEHL8Am/A01+kKQqanEd+crlr4EwcN7vSvKjDn9zASrbH/nJI/NEsp9HdWmmqsD4YTNnD7mNh74HSqKqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuZlufqB; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-81f921c40f2so9523739f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721995236; x=1722600036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPFRRW8AIlKuxP8Q7EZWY4b5/1cZ7kF3YNc7kBeCMNA=;
        b=HuZlufqBGFtw5tz/HtAUy969P3ORfDrEf4aXeT6Lbmre3BuoKNM/hpUGZGKgpVNw2y
         wklD9Bqi6jEGxv+g0qcBqbgAanr0FXJH/9i3Q9Dq4WJxDJHJIyvjEH84BZdOE8FCB0QJ
         U9LyRQT74gisK1+hEEjRnxFkEzbG8jfyRCKoKGVlnyJstNkjY9Xda3YV+VVWfJHUS+my
         4RlpQFpt4ClhjjBZ+O1no0SsOOJrZFDrMVMUMbdowyyZC4kXSKAUEWgt7UummJRyZpit
         nelCah4mh/Pt4qomvrJCBNNKp2RUKibjW0mhO34WR3nMqn+knFzuggwpdrdBjGO84MHF
         24gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721995236; x=1722600036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPFRRW8AIlKuxP8Q7EZWY4b5/1cZ7kF3YNc7kBeCMNA=;
        b=eAYZwEcalGo/4rb6sDAqWhAMhXQLyXpppwwF7aZSA/MHEpDpkFPUZ2b85usZZ6sobf
         hPszKITlawYMPRjSjYt394TvJerfpopEI/sPj2LbsqdViY+raNR6biQArcH8TJbw/69U
         RAQK/F1QssjsBoKuXJbokFWD+HZ4sJWzZTf3eK0c2iallUrH4PCj52bhNwy2wv2fXYU+
         jAZmWRvy5Vt7cTjxlLUlaZgvEamEVI9uqw1dmfSrkTnn45XTFbpVqFHMivfInrOM3cxn
         OKvBo7qQgIhfgF/GWWHlumeJ24672ri0UaC105mmKFwKp8/rf+af/cwfAIws/suMuUSh
         n/ew==
X-Forwarded-Encrypted: i=1; AJvYcCWdb3pVoiIFVRrfRTqICKdYiikw/Ss1mcLbdvG8GTC0zJ2MDR0uXs45KETyid1lCMyMviL3qfC6CqNTvkCxo4LOG1rB/5+vpNJoLHT2pw==
X-Gm-Message-State: AOJu0YzIQEacHBCTsewH2xfsjEslXZDSO9Oc0rIm+0oqrCmYrDlcVIMR
	GpLd1JyGwxW0l8Is8Y0nd0KVjJVsw++/8fCPGN2ALiUarHHeQeU4qUV6JcmygQ==
X-Google-Smtp-Source: AGHT+IGF1Vy8+vSXqTOa6id6FOH6iP3wriAe5OvwBBfxhoWQnfblL/Mji+X+LUi4afRVv7DXfGZn1w==
X-Received: by 2002:a05:6602:6d8e:b0:803:85ba:3cf9 with SMTP id ca18e2360f4ac-81f7e43ed89mr685325739f.10.1721995235684;
        Fri, 26 Jul 2024 05:00:35 -0700 (PDT)
Received: from thinkpad ([2409:40f4:201d:928a:9e8:14a5:7572:42b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72bd1esm2623180b3a.96.2024.07.26.05.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 05:00:35 -0700 (PDT)
Date: Fri, 26 Jul 2024 17:30:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Disable ASPM L0s on x1e801800
Message-ID: <20240726120029.GH2628@thinkpad>
References: <20240726-x1e80100-pcie-disable-l0s-v1-1-8291e133a534@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726-x1e80100-pcie-disable-l0s-v1-1-8291e133a534@linaro.org>

On Fri, Jul 26, 2024 at 09:54:13AM +0300, Abel Vesa wrote:
> Confirmed by Qualcomm that the L0s should be disabled on this platform
> as well. So use the sc8280xp config instead.
> 

What are the implications of not disabling L0s? Is it not supported on this
platform or the PHY sequence doesn't support L0s?

Please add these info in commit message.

- Mani

> Fixes: 6d0c39324c5f ("PCI: qcom: Add X1E80100 PCIe support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 0180edf3310e..04fe624b49c1 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1739,7 +1739,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> -	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
>  	{ }
>  };
>  
> 
> ---
> base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
> change-id: 20240725-x1e80100-pcie-disable-l0s-548a2f316eec
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

