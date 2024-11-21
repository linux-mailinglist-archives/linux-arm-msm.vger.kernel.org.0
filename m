Return-Path: <linux-arm-msm+bounces-38698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B79D5293
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 19:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E966F28110B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D51B1A2574;
	Thu, 21 Nov 2024 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MtAvh/zq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8DB139597
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 18:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732213941; cv=none; b=tJDkX2XjXX5fXCxhwTlHaI1NuCFhgRyRGn1u8UmHutCCwxNxNzyB1XJNxhGi4zcve2VZLAsu0TZxSkP46qdDxHzA63LPajIeuN8dMkqJ2vuazrqjPvKrBb/L8uSYbs27PIDCaFxjvs+BHgsnImFFkT2Ym4DwenUOboR9lUt+Zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732213941; c=relaxed/simple;
	bh=NxoNhqN7/s5UCLJhRwnlQc5AL67LK0A9EbK6QoZWtGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDZ6hBp0YRzEy61SzMiCWxGv5Sb2qsASlmaztBZESLyX6puZlc15rwmD0T/+LNwLVvSX1iqZteu4pJ2zksvC1/wrFLLwya+UYnf1dXR9ODWv5kOUaLY2zlMNPnIn4sq7q/xCEy4in1WbYXI5BvZWZjTOj0/M1xRBLhQQ+UBqVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MtAvh/zq; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so13895921fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732213938; x=1732818738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YR6bunkgbvINXjPaA3POQemx6H3ADSr2/yDH9XACR0=;
        b=MtAvh/zqiMK9xbyH573mWvVr4JTnprBhRRFLeSnzBAB82CQgGtIdzrjI5ayDtXKH0K
         y3x6+vWsUph2H/+dbfdWwalioy4JSAdEFvcaBMTOTf591i2c2fod7BWS0YqlQgPiIm3S
         qDZquELaAtlCad+vpEFBETVFieWKxJPnBIydDB5POk3ByMm0bO70pomPXe3lp2f0dDxV
         Z0iW+vi1wHoZ2+RQHIrdeHhf66/aKHst1qPtC4t3o1ahmv6efaAvP7KKBCnKQkKpgEsx
         d886u8vrFI+zM7BsNN1PIZKBZYyxvLlbH/mZyX2psissjP6eVWQm/DzKvcD8Ex9U/72l
         SFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732213938; x=1732818738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YR6bunkgbvINXjPaA3POQemx6H3ADSr2/yDH9XACR0=;
        b=k8nHAYgVvG+ZVUooNtrKW2k3pc7anNB6WgGMp9WvfNtbh87GEjebtFKiVyQpD4dnlN
         1B1gYKkEwSSboKAQC/vLIcBL/+87ZTlKK7zGPrKVVxwNndyXhG8CSZz+bHKQ3+x4HUPl
         lHOvX3yySG5bs4my3V0JT4sIYcsqq0uKgE00x1vcBKlBor3KO0eGA3CaAuOWo7l3LNsb
         Q1dudGmxoRMuud46OmqQdNYsp1wlOlB+/mycdkpOeNcm3A5SyYjn2nnYPxXYqjRmoLTv
         De1cfmahOLSPtrQT0UyXR+n3tGNmE+2x13RawJVBtG06ginH1VJN0ufjdVC+AQt7F3BF
         IkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gLBvpm2dxpNVeUHMbm2VGzXKAckLW320lsMWMb3pa5V3XkmbZuWk75GX6htmJVpGn8k/8Wh1t4IvwTV4@vger.kernel.org
X-Gm-Message-State: AOJu0YyqwZ27ZmKkStZ8rzEuNXZWGNRqrlYRUzFto+sN9F9SzzlDzXp6
	6KhlvcWBwpd6yXh/0MGcE1O+ggPtsDDPlAW1vqO8YryAIBtHTOS4JAbURRdoRvI=
X-Gm-Gg: ASbGncuCTZK4X00+PU8IDfAiDj6e5AyFe+aAGoAGRPcOJ7YE53HT/0tMFBhdnVSuNgb
	IRvSqbVqhThi5TM79CpdybOsxWO0DNGyTrfmw2/eDbeLc0nT6cyFmnShseH7Ws0mIevm+3s+1av
	3pafDAT4tkk12K9erDz5MktUOZe+Z48AfUrYPuwxVR+kT3kur5vjwQsEbKu9HXj7wD6z+83Py30
	yJo7QQueeiRmgYdL4NyLkhI63aZDyIaajQynoocv+/QRS6hjuNWIMWb+vHOX12KYa2nlwnQUAUL
	vp2yH7nYngYRBPw+oqsh0Lz7hOl1Bg==
X-Google-Smtp-Source: AGHT+IFCTWJ72tvI1EYO6Sxeh0nyQQvqWPBwgJgPQ0V5L1GVWbKh7Z5LWaJvnlK5PXvdh7Kz0Y69uA==
X-Received: by 2002:a05:651c:547:b0:2ff:a3c0:a878 with SMTP id 38308e7fff4ca-2ffa3c0aa4emr6655951fa.4.1732213938371;
        Thu, 21 Nov 2024 10:32:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d57be7sm143411fa.62.2024.11.21.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 10:32:17 -0800 (PST)
Date: Thu, 21 Nov 2024 20:32:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, conor@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
Message-ID: <y52pqmnj2bftfkoz5txmsl7wzjpfv3t7x5mtvrucupdubioxdl@dcflltnxnpdm>
References: <20241121051935.1055222-1-quic_varada@quicinc.com>
 <20241121051935.1055222-3-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121051935.1055222-3-quic_varada@quicinc.com>

On Thu, Nov 21, 2024 at 10:49:34AM +0530, Varadarajan Narayanan wrote:
> The 'broadcast' register space is present only in chipsets that
> have multiple instances of LLCC IP. Since IPQ5424 has only one
> instance, both the LLCC and LLCC_BROADCAST points to the same
> register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Fix ipq5424-llcc placement according to the sort order
> 
> v3: Rebase to ToT
>     Remove 'need_llcc_cfg = true'
> 
> v2: Use 'true/false' instead of '1/0' for boolean variables.
>     Add 'no_broadcast_register' to qcom_llcc_config structure
>     to identify SoC without LLCC_BROADCAST register space instead
>     of using 'num_banks'.
> ---
>  drivers/soc/qcom/llcc-qcom.c | 57 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

