Return-Path: <linux-arm-msm+bounces-50303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A85A4F4C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 03:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0F31890D13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 02:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653541624D3;
	Wed,  5 Mar 2025 02:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kooRwLJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB97815573F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741142267; cv=none; b=hAvLTJrVcB/Tb1/83Vy1NY2BuhUx0h1xxaOrqlnkbT2aESOhnLtLUBDeWlt1D8DH00rYi21SfAb89k0D9bXeuZhZ3U8Dp7F9HiKdgvSnidq5mv+0Q4iNrTdLriH1AZgHHfi9t5AQOgvQo9VHhMA7xODDYgfWa3yJ569Gs1GmAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741142267; c=relaxed/simple;
	bh=oxBgNmxdENcaCJquuWTf/U9k8IjF40VaPYhmT3ZZHy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxNxhpqZ+TrI5o2M0n2V4YGtKb2XeCQhFFWyUc4lrdnFQRaj2XG70XgmcNQPLqL3sQEaN79ZxRV1HcfHYornVMM3eZroxgqHGbEO+GmdB0ohx9WhAXobGERGErOItPi4e38O4w3eEd9N7xFE3qOkAgcmInqaLiHaxQw8oaH2ROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kooRwLJz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549490e290dso4932749e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 18:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142263; x=1741747063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=;
        b=kooRwLJzxzEdOhokl3zQO3Xx84jqsBBY9dgmfKwi0jz7uhWiZ3G5hlD57tR7nDF8Bk
         vlXk5+mBNuZBVSflJAW6HN6F6J0U0o7LAZu3zeWUm/DPyyZoWTyph88hooWedIyZTPnd
         y4Xqd6HImr0dDeaafY97ZpmIsdCNZp5VUxSJAENc0SjaGoC8uUgKR1irXvsg0j10qUCx
         i0t18gNiJXTPhcCx92etEpud+kZWX3wTiTgm5nJqFc0MRkCEj51ENOkXiqDE+TNHnGkU
         toazh99YJ72LgD1TZeNxy3p2wYLO0rf3CbtweGU32AARYrTUi9uki0MG7NObNG4qfR8Q
         6dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142263; x=1741747063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=;
        b=PJktMh7Svj2dTQrUZo59GfJefoXoz9gGhY1xpgy6Xe8tGHftt9Ri1DYPE6F/Oaj1sD
         2kLfrSLZw6tMisY7IC5v+SHbDyG4B+FxsM16IMZvb7uD6ik88rhcgFlqchwYkAJRvwjA
         JGv9qD8A9MSKARE7qTE5AHBGIfWn+cJZoiRbCcQzvmzrwc4q2hLyHo0F19sNzhFUC0NC
         JuAHnDKSChgT/Yk+Ab8cFbDk4eqE273UnWepDfyLl5UXmjxU3g/R6TPclzQ8h4RVdnXy
         FVe8uAMtAcrte+g5meNDjGyUnT3ZqUs50XZz5LKuDDDqPSYZOpHeuUBSvStyeNAxpjO2
         JZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwqr6fEtctNQFs7ijKmVBpHh/elDWFhx6ZilTDeVEMACrk5+DWsT0Vt7jU8fC57uF/pGTg+74rfbmsiRMc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GTOA7+LHGumSxDRXTuslwuD7q0htFq3vbR8G772ETEgaay5b
	4Fbs7+xks3aD4ZMq4EsDRARkpWFkR7kY2ogV0VZl2s27CJS8hjunyZKywM8RbsM=
X-Gm-Gg: ASbGnctuVNQJmK5EO1lNOx2+0AOf3cGL98rteIb1iyc/59aGbQekZz+iEZxEAmIksIr
	T/+TZaPW7t6zwYTVLt5ZMmA9lrhAOiRxA78rFBn+Shfbt63McQe8Ln9YFZ0oj2WLOtkGQYwDMNZ
	m66g3Qbh90v1F7QLKQYaWGt9O7dicuhrXo8y83itZrIW2DuoRNJCvZtqfUUIoaaRXSYpF5dCisP
	aUW0RC5cydYvqDX5KhHTWgAAxOkzKb2wjLz9+TGD8D5qp3+w85E9Gr5zlB4q7jL9PrL16G8JsjS
	aN/qOmwFM/EKLukomfRl2LT1D5N+W8fhJTJGnNAp254BjPy4jUnygIWfpqfT5DskguCghxOZDoy
	tbVY6ZfBHVJeO5pmDCw4UJ1hj
X-Google-Smtp-Source: AGHT+IExjENqSk5hjjIhys2YXSgdpIqL5VVjIyb8jsl9tsSbsyXgT3nWgdPRJ4khQWdE/LA6vVB24w==
X-Received: by 2002:a05:6512:693:b0:545:c7d:1790 with SMTP id 2adb3069b0e04-5497d336432mr449658e87.22.1741142262813;
        Tue, 04 Mar 2025 18:37:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495ba98c6bsm1058122e87.232.2025.03.04.18.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:37:41 -0800 (PST)
Date: Wed, 5 Mar 2025 04:37:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/9] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <jr4lvgumvnjhybvwuo7crpjhaogjvet2d7llt65qzstjnoekuj@zx6z3npa37xg>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-4-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-4-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:37PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

