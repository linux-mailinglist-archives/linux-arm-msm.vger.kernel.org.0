Return-Path: <linux-arm-msm+bounces-72003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2078B4364C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8723C16A6A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8DE2C376B;
	Thu,  4 Sep 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSp2pW1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6E2264B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975952; cv=none; b=Gp4nxAF3/TIJliCyLgtYffE4X6iWyoAzDoh8AN2hHUDibtMcc3tMNDIsKssKJuDZwrzEsL0451fCP7FsSlqThWnPFaKcvMmK23Lyb8tmNX99AR0red/ct+ZJuePhh2G0XJhTNRZr3TvsfzDihqUUfCNdVQ397Nw0TKWlQtZ1feI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975952; c=relaxed/simple;
	bh=qjZa4YKZFgevyucA5IS3M7gwJDXEq9cxnfkjLJMJsNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qio3B1lJipOZVKrpRcmSiI/Zl+u4DkdeD1vSYjZu7Pyz6y/uv94uQb9m4dryk05/tLJ9HcU4+YFsVWAGDp57CJXzUGWvahg4w8fE9nRyGl0Jd6aj0x+voP2RqI90B/2+ftl2Uhx1W1HJ6nmxfho+pIy4+LgiSR20hjq1BymLupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JSp2pW1X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45cb659e858so6129915e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756975949; x=1757580749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gK6n/g/HuSb43cbH0cdIC2KH3XWzF+uMZuIHFj3Zpo=;
        b=JSp2pW1XWgx5EWNvIZ9CENaCNQS8HjxNimipmNAdi5cRHXsC4qw1FTX9S5XoK36wtQ
         9wxxRe04oFWsaazBDrCg/LtQr4q04+OFmGJBWZzwvZCc1qOsLxl7CBPJkvV3xSxoQOc7
         zdWKOlan3lXDekPXeyRJ/R7ryQBPz5ORHIx4ilryzkwIXZqSGbV4f/EqFz51yZmhbPQb
         yqK9Jho5cch7HNH3MMP0DfudbbtxxlJ7IGjSZ0mNzH6fCaJhTMDvYh5eBui+C/F0yuLn
         CEbOZfHK6mv4lXTQJyDE/ljrvL1LuQtzQ8rsMJAHpKB4r8qALJaWUKUgsI/cy31lVmOE
         mzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975949; x=1757580749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gK6n/g/HuSb43cbH0cdIC2KH3XWzF+uMZuIHFj3Zpo=;
        b=I1Ihy383zmNQMBVqfO/2vTnz+jLk1xsVduzTjyH2hGUbMpzsGqiigHZ/uC0OzBuiR4
         xcZj+VNkMZGlui423hzn4e1aeTlSmlrOLy7snIY4/pDXFcIWO0aojIiBjLaxYGzsyaRF
         Dp7SsXqSUmB6MFtjKpxHI2iRt5n50mpModpAmo8E7UUvuXo0fRgUxOvKJAn8et5tgIh+
         KZq1mLyJv1LV4ewxC2Q6Uu7WvKJrN1YsVpRgWLZTEZkJevxhi0ImtIr7oBGiLROYm3ef
         VlW6QkglXeD2Hm2KLZwhnrzXUsFx8KyEYI7gU8aHel70Z+t9k+rXUFmsf72tKZC24Lpv
         lL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXRlWNXbNowApg91prNi5PF3Hfa4dHZRTKe87WycIsV77HE28K9CVaj4F3rh2/TejsqPtDayYqc+Jn7Jn1R@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2rcUFttO5ObVT9IWAv2kqTQO5BIYU2uKdCMWzUcZ8JNGzPOR
	3uzv+WVWwYHNbvOoyRs3moYGvQoB+9EmaBOTonFzw5r2d7HTzqQCUI1CChyT6wPG/F0=
X-Gm-Gg: ASbGnctSkSARRc8brVbxQFnkn7kkbXDjig14p58HUX7yvRGTz9Ao695z55evfhcrkUp
	Wy27hymLa+xPYWFkQ7w77Q/3Ikx3zIYMBwtYpAQEhkEifUA9Oc0VrYgzmc+5igaB+AOd2L/eCKO
	zklLBHzEtyNw8t2LETi7dfgWhZ43ui77fkzf/a0o92bUYDeRNhG8m3IonNW1KHhwqqfG1yTEivD
	J6GaPfhkZwCnXNbrBzDFCrVAZKJHWt0d6cMEv/0/aj1MJZIWoHMGDJP6IoRVb1++B9aWPtLsT6t
	9eCI/Wox3RTzFD0TRT/V1IQq+75ag+ye1FvxyMFukJPvVZlqQ8i/gsiaTatd/FzLBAwMCXKU69y
	Gt/UWspNAONQLxic8+rnDRC+nal8gAlyZ
X-Google-Smtp-Source: AGHT+IHtO9lhAj+5b+dFwSvHFWLll5r95zkvUmodvWJ+Fdu92nqESPLKzmEOTmjK13cRmo2Ta3LMHg==
X-Received: by 2002:a05:600c:5253:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45d98bef030mr24615585e9.9.1756975949013;
        Thu, 04 Sep 2025 01:52:29 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7ac825b88sm13968312f8f.7.2025.09.04.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:52:28 -0700 (PDT)
Date: Thu, 4 Sep 2025 11:52:26 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add missing TCSR refclk to the
 DP PHYs
Message-ID: <qlqsefvnibw4esm5wz7khmyfdnszn5veinfb3k2w67f5v73kry@rzclmu57ybdh>
References: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
 <20250903-phy-qcom-edp-add-missing-refclk-v2-3-d88c1b0cdc1b@linaro.org>
 <34d9e8eb-e0f4-47e9-a731-fe50e932fea1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34d9e8eb-e0f4-47e9-a731-fe50e932fea1@oss.qualcomm.com>

On 25-09-04 10:40:36, Konrad Dybcio wrote:
> On 9/3/25 2:37 PM, Abel Vesa wrote:
> > The DP PHYs on X1E80100 need the refclk which is provided
> > by the TCSR CC. So add it to the PHYs.
> > 
> > Cc: stable@vger.kernel.org # v6.9
> 
> You want to backport this to 6.9, but you also want to backport
> the driver patch to 6.10, "meh"
> 
> I'm not sure it makes sense to backport functionally, as this would
> only exhibit issues if:
> 
> a) the UEFI did no work to enable the refclk
> or:
> b) unused cleanup would happen
> 
> but the board would not survive booting with b) in v6.9, at least
> it wouldn't have display  - see Commit b60521eff227 ("clk: qcom:
> gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK")
> 
> and a) is not something we'd hit on any of the upstream-supported
> targets

You are correct.

However, HW-wise, this clock is there and is needed, regardless
if UEFI leaves it enabled or not. So it makes sense to go all the way
back to 6.9 and fix it.


