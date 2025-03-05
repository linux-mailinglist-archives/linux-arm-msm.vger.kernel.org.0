Return-Path: <linux-arm-msm+bounces-50304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B9A4F4CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 03:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF8A188F32A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 02:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59C61632E4;
	Wed,  5 Mar 2025 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlHfb1P2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632817588
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741142343; cv=none; b=Iy4FV2S3CeiHpiDKLUZqJ6Rg3df6NqcwW+r0TJNMCQtBt+9VIb+vpnwKVAzVVkWfSB42GOlTKzTavMpL7m4xVDRWnhPmura3VvhJk3tbwz2DWd0UOSXK8yke59hhPprkrNom3fCZxoteYYqQc7jkUFk5GTCH8AYzn4/oL//ohiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741142343; c=relaxed/simple;
	bh=SQ76C5rbHLEvyAuhYgb5Co9/owZstZm6x8yOx43jG5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoXX2U4QwlrGvevN87L6msFfm4rYyW057KHTClzimJr5R8jQwXoFZTzK4BkmHWt53Awu69ADeaxiIOddkqi5eOMNw0YBY4uIMfCSnjTLVntDx5xZMlN6+Yvi4EZCu7EZp5n0n5ykASld6hYX9Kh7ZCudrcS0zhWiIxItD6dfPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlHfb1P2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30b9f7c4165so37270391fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 18:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142339; x=1741747139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLGnKKW2QVH83jr7sLdLSDsyrmFRn2bnko/hsD8r/Pg=;
        b=SlHfb1P2pCA7U6vK37ufNaTFRopWHxWdF1P00AQ6/MbSz+Szm4jtA5qrnWmqw5PmM7
         0V+BNr2GDF7UM3JUeyDn180pppEeohFPpu3co9NQZx8IHKZNY334KFjwSbB6fPdUrQ8P
         t3Kcid+zofCRqp7E44UTQM5hZdJsmEzjoVamE8rrZdVU6/3bJNm1/Wur9LoscYJuDF6D
         gG4b6ZEaly0lv1QlpXO8KHlpHu6YbD/ccxdGRFIhx+kcD7LDgiAQWcJuHiwQKjIL+rDT
         QUFTILOoy0/3ziCasly9sx1TUOYp2yQbQKkeeXzI/Wm00p63939oRaw45zGyeEpsge0r
         V8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142339; x=1741747139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLGnKKW2QVH83jr7sLdLSDsyrmFRn2bnko/hsD8r/Pg=;
        b=sr+oUglIHpQjbf+zrxCCwERM+mwRAQsHTRV7nv7PN0TxFOdbE6U+potE0DFpGUUamx
         AbC7G+TdXWRjPDbeiZNEZvm9/qCbdZzKdPW9VMFHvBt3Rph8Iwqb8X0aiwZPDMb7oz7V
         PlKOMw2I+14YSYm/TFYtIfhHTitKGuncH4qhEKHenO/twuz8JXBfcTB9XFHbJUinxSy0
         Ndx5H3e9wNMlgw8hiQRsR6PIa6xGQ5D3TSFY5DX2AZUh3STHSvbYv7BdwG0hw8TYjBy2
         RV/YwZmPvTQPnleBE99pHqG2gH/30PT5IxG2Zc9v5L3He5Y74u71DCl8uInYO2+Kyp1N
         N3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Q5uW/Bt2+AUuwfvA+9z69l9/3z0NRZU4DJCLfrj+ni6CteX1ub01/pz0odWL7KPvmA+8js2PjXezach6@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSkmMcZkaMkyCS4hjV7cC2U1Pc/ad1+j9sBYDqdVw44CDhsx9
	yUJWO+Acbw5qPOzXfl8P3/OGmfFD5kcFezjuT2TZvT5Q1dZClo2c1GBqw9QQ7FM=
X-Gm-Gg: ASbGnctHWMeIl8POO3KA899i19rdREfjcspxqccaaaL//vPfejO5HoRoeIdr+LmVJxe
	5cyEIeLsf7qDu5jP+ueeWnl1X8QKT6kMkjoluzfN1IKW35dSvCRXaPV5K8lP0UHsTRnS8Q376hX
	YcwQrBeTia8M4UR2bkjnnmzS1qFxsmN8sSCKdTvG75RWv/E2E2721lSHWMH/NhtrBKvp80OjDQ7
	KXpi7fzhKHWf8YFJiXWlssk+Q3pndMGdRXBEwBGy4giIlmtMAhGlySqXftEIR94CYu/wK3dSAeX
	K5nTBdbWj72iX3hLGefHCQ+CK08uCk4vaY9m4ApmLz+5pajS3QE9VZ5JyTAlG9SbO9L7NDvnM7b
	2LBpnkoPPEOTyQoSGBGHrUGl6
X-Google-Smtp-Source: AGHT+IFcXeQaKKWQj1dnu4UH8WH8BgBFKYFWB8PfbtIdp7r23eOpCjIksDm9zsbkHWStqwV0YfIVwg==
X-Received: by 2002:a2e:be10:0:b0:308:e5e8:9d4c with SMTP id 38308e7fff4ca-30bd7af5da7mr4043671fa.28.1741142339042;
        Tue, 04 Mar 2025 18:38:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc7264141sm5553261fa.13.2025.03.04.18.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:38:57 -0800 (PST)
Date: Wed, 5 Mar 2025 04:38:55 +0200
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
Subject: Re: [PATCH v2 5/9] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Message-ID: <6e742b2dke3pcqq3v6nzs3gfvwau4sk4gtadzgca2zk5merzvi@ubc6l3hsafok>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:38PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
> different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
> needs to be updated to remove associations to a specific vendor.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

