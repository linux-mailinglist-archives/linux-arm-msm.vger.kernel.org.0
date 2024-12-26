Return-Path: <linux-arm-msm+bounces-43335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BC9FC7F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 05:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80E707A12CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 04:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5C513C689;
	Thu, 26 Dec 2024 04:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkP3NIVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99A38FA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 04:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735187700; cv=none; b=JoSN57hFtMAua7RHGrRJZolKmAgPJf6RISPb7O/JuT5Ip0nHfjWkO1F4tNJbQ0iZFubgjq6O8knTRCi8N6knXoHDe5H9QX5VrembCbcyRNFo77+oiTQ7hOddlWemSo5dTjIBSaYea70g0dZHwvhtixF9iJC74WqQ7aejqEMlJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735187700; c=relaxed/simple;
	bh=ofgtrx+ToL0co1PolJ8/p00OmE4FUa+xQf2Nw+6Q7jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0zYBBid3SOaARrWG5io0wybrJ+lGwBEaJHj2zyW9R8a+mB7/+vhSGzAupsMwCdL+ZKycSUZK4GRnJCWoVx7+Z/Qt2QR/ien4si9nR7Yd4XOIzKsjY1x5C3lfYoE1Buo2fjtW6i7rgG6dVhTakKDVs/KbD/eLtRanR71pv348ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkP3NIVr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso5086364a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Dec 2024 20:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735187698; x=1735792498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMCUr486bsmmq3TlE2yNphtQucspjTQzlA2KwwYZkQw=;
        b=lkP3NIVrTY5shb+pVM48I6Lfexwd78xv5i1CtZOy+7qqi2RaTG15Q7fzcM8EoIRG5N
         bfP0x30tAlHobIwOwzZcJrL8HKwT/KMsu4oz1+HvXTjHU+e0KtX2e2aw9g7Azl3zA+rI
         mJUDmuTRMZpj3yDeQnf7i1MLyR/KGi6JVux+nkL9vLQfYZoDT4XHlzFhADWVlyphDdxI
         TNA9HCsS+2vj7bFXmSmd5lalUCOxDAGxyH4YK6C3Wq3XqyPMCzv6MwwcWKrhmAPOpWpi
         5uCk5p9DG2rHiUxeAN29ABXwuEIaYQjxU09AV7/zzq+Xr+MFSjSCwIUPHFV51d5BfD1K
         GFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735187698; x=1735792498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMCUr486bsmmq3TlE2yNphtQucspjTQzlA2KwwYZkQw=;
        b=eEBIglfrmTGnGIciICrEQCG3oCuA0niNLnr7SrrAhWsH7/fFItAlUjeztizJDWtJSv
         oF36iLfyK/H2WlHJ+FvpWcByUJYoYKavfJ9UGaI2fCl8/K4viWzlvL1heWgZUh5ek0pf
         HrqojdejZepGyUofiYLi+P+R+scuj7h+NpeTVyZDQlTC4xb0QBmGVL4torEXeNDoxnWz
         z53CFTf4zm7zBAx3nnQET3pL2MeDrmh0yRf/AHeD2HhjGM++EoRQnJSB78ol/Er6CZiU
         7L6xQPk84e3f3lAyTrh1gQPNNuX3TUFG+N7WaSMuwva8LU9YPmpfgz951VrVtTl1PIoT
         NEhA==
X-Forwarded-Encrypted: i=1; AJvYcCWpoN1VbbCXC0VyXUa/i+o2etQer/7sj4EfVA8BkrlOPJRWB/wUdZ30EKHk8K07KHUFE7eOKOa+ThEw8O6y@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6y9Hahs6Ky8sRBCLdYqLFAELAPco7m8ab6GTzXZfC9CzByRx
	rZ9Ff1QWmQogsWLVBdJe4r0vrTQNHObM2MmOPffxcE9Y8XwlpyuxnjaRxG4oIA==
X-Gm-Gg: ASbGncvQcAIt0gbomxtgL2pAgrldeNcUs03+AhS1X4A69X8jsLSrDNyHW6L994OWXRr
	sGXpJGog5VIXNiVBIwtdreRaJ3CPvhTJ8JIKF9xR3bPs1vhK2jVO9w3LlliW/HEVBTJxaK6LNz7
	lkCLoEL/IJeZbh/1/s33cLpxIw1RXDhsYApl7S95Qcz4bOyeCeN3rNbq8LNEIOb8bS0c3uSF9SZ
	SgAgXCh5s45mVOR6BSRAoIBpcZU0ODPLoCmTuq33rYksZQ1sn27jN0+WHDlr70qxg==
X-Google-Smtp-Source: AGHT+IGyCAyLDoLYd6WndbUJFcjYDJVuNhReCK6r1pPUXqGqT9ozO6gC5H+W7mYTNQfIe0UKmCQDMQ==
X-Received: by 2002:a17:90a:d88d:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f452e4ace5mr29069894a91.21.1735187697759;
        Wed, 25 Dec 2024 20:34:57 -0800 (PST)
Received: from thinkpad ([36.255.17.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52dfecsm14791061a91.4.2024.12.25.20.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 20:34:57 -0800 (PST)
Date: Thu, 26 Dec 2024 10:04:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Amit Pundir <amit.pundir@linaro.org>,
	Nitin Rawat <quic_nitirawa@quicinc.com>, stable@vger.kernel.org,
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v3 0/4] scsi: ufs: qcom: Suspend fixes
Message-ID: <20241226043451.vnm2nxm52foqnwlo@thinkpad>
References: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>

On Thu, Dec 19, 2024 at 10:20:40PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series fixes the several suspend issues on Qcom platforms. Patch 1 fixes
> the resume failure with spm_lvl=5 suspend on most of the Qcom platforms. For
> this patch, I couldn't figure out the exact commit that caused the issue. So I
> used the commit that introduced reinit support as a placeholder.
> 
> Patch 4 fixes the suspend issue on SM8550 and SM8650 platforms where UFS
> PHY retention is not supported. Hence the default spm_lvl=3 suspend fails. So
> this patch configures spm_lvl=5 as the default suspend level to force UFSHC/
> device powerdown during suspend. This supersedes the previous series [1] that
> tried to fix the issue in clock drivers.
> 
> This series is tested on Qcom SM8550 QRD, SM8650 QRD and Qcom RB5 boards.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org
> 

Martin, can you please pick up this series?

- Mani

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> Changes in v3:
> - Added a patch that honors the runtime/system PM levels set by host drivers.
>   Otherwise patch 4 doesn't have any effect. This was discovered with SM8650
>   QRD.
> - Collected tags
> - Link to v2: https://lore.kernel.org/r/20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org
> 
> Changes in v2:
> - Changed 'ufs_qcom_drvdata::quirks' type to 'enum ufshcd_quirks'
> - Collected tags
> - Link to v1: https://lore.kernel.org/r/20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org
> 
> ---
> Manivannan Sadhasivam (4):
>       scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
>       scsi: ufs: core: Honor runtime/system PM levels if set by host controller drivers
>       scsi: ufs: qcom: Allow passing platform specific OF data
>       scsi: ufs: qcom: Power down the controller/device during system suspend for SM8550/SM8650 SoCs
> 
>  drivers/ufs/core/ufshcd-priv.h |  6 ------
>  drivers/ufs/core/ufshcd.c      | 10 ++++++----
>  drivers/ufs/host/ufs-qcom.c    | 31 +++++++++++++++++++------------
>  drivers/ufs/host/ufs-qcom.h    |  5 +++++
>  include/ufs/ufshcd.h           |  2 --
>  5 files changed, 30 insertions(+), 24 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241211-ufs-qcom-suspend-fix-5618e9c56d93
> 
> Best regards,
> -- 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

