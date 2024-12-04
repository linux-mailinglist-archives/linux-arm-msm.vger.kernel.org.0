Return-Path: <linux-arm-msm+bounces-40395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E019E47BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D43188037D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0061F03DC;
	Wed,  4 Dec 2024 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmxe6/43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84141C3BFC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733350871; cv=none; b=c5KryNO5wiHKIp8wWhpOlxrr+PnfRIUe5KIL60MoMLVzML78PFFYkCRffWgfbMPDqKmprZMEVcot/ta9Mw4l4Yd40sda3+FTdiItmASKrgLu04CWMOvDvZVExWZNux//o56yleThhAbyDUuYC9VkDC7KmgjzkvDTm0+NEOfdCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733350871; c=relaxed/simple;
	bh=1XfksjHiUmLDBwfWEVhZRw6suaxhtKcDRmMSFnlRbIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL29CWStRDyT25mJ5Q1uGQaDmINdChwdyVBjatJf3vcwci+2fhJP8tKyYbH/07g8U6NHgdDMJMMedCY/59jIqWKVn+TBivNfvNKP0OfIJaDbR95tEUPoJp+T4CsM9iejktIGIWtdK8OE0TEOJ+32yX+IK0pTYXrJhMXWmqKH4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmxe6/43; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffdd9fc913so2349241fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733350868; x=1733955668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OH4y0lMP3bH1lveKpeX+aBwZ95mtO7UpbBtdFwlO2l8=;
        b=dmxe6/43c5nCrEDsG3SuGqFFn2sZ5xxLPNi64hW6yfrIbDLs7Mmwrz+Qocjc1aNx+e
         zKfk5JCTscvALQor1UUfbV71YrNF0Dm3KTlpQrjtV2iAMX7KwuodapleVx0PDMbiSAmh
         WEw72zL+NiJ1AXsd5PSCyElTaN2JLQbhEv8TcmwE8GuixEK8c4b+bsYpCI2YB2A0snOx
         6u7ouy14GrUisYNRT5QGnVMFGdtL2DKWS3G+AFJTWlDDwRXFZcTVb+2PxIq/ID5pxsDx
         zPSmFXeG0E4XZa4bBZvkSiNRr+bJ/IOhBEPl8c2z/SFxAiDTmiIbBjt1MBq6XbNumeAe
         fBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733350868; x=1733955668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH4y0lMP3bH1lveKpeX+aBwZ95mtO7UpbBtdFwlO2l8=;
        b=BLLho3nlDb/4FhJ4II2vOJm2x3EJJ5BMKmQOYjVKnkVsLENaWdkfBWvq4j7mGyELPX
         RcEn7XqsI7p4nB92al46QuKXJOLmRRaZbm23YqmcKSYlHv77E7hR2Ov4Aa0AI6ttNiyp
         LdqPzHMXxXObrkDTp3Vxxy7FythIVCB/bMeR58K4GAItg1KDymq12YXPmAokcwLg31fR
         d1AFF+7Z4db/7F07tubaYq+lww595/KWqtpMeMj/NbZwwpSeXaYBmnkfBTYtfQ2Uoojn
         ErGqkFZK/sGeYyphRxT984ioSUMGK4Ax9UUIfEX3vssxsXWLnNELQsiF5omdSQ/HJGL2
         WNMw==
X-Forwarded-Encrypted: i=1; AJvYcCWA1Q9rGUWDCKPWweeCq9q1orKD8ibWyiCJxLrGH4aCl7XxLr2uqpuq3aYpCXE/w3NHPpp3PohkVTgheCYN@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRiyu4tyc3Ea4cIKnZiQ4p1Yo1hR0oxa4HgHUJl1LzQ5H24wa
	lDLmjXpV2Rn3zU5fkkFvywdMnWobyqVst30ysNKbOapbh2mjuzuseLyTJ4VAa78=
X-Gm-Gg: ASbGncvtVIQKRvjlIJGUceBKKGzmm1nK0x6Zc+9x6MooLa0c2O8qFQjYD6WMiip4gcJ
	XlxdGfFuhm5hi7xj7zHNjbeeqj6oiWb1Q05W+0jDfBjoeqCCVnUeXo/J6bzlgRjMztr+wIcpZ/n
	KgD2F9nkgp/5w3cUttj1F+td1JedjIHjbV4hf53TaaWQckBriDD89e8C+VhEDxe5F+r0q1X+PoV
	T+K2l8GHZySItdSBuUjsv/iFggzypYezhKK2Kq38PfGh4ZOCt72LdSAub6YdzQJcfawcSfURONR
	0fJ46iigZu2Wgti4Go9nFrsNSrVulQ==
X-Google-Smtp-Source: AGHT+IFQNKupoOz5B2N+8vVrOXLHYn4xv4Wtyf/8DA/aT70hkUWOnF+im9j6wqbTorBqmEkgbKr9BA==
X-Received: by 2002:a2e:a904:0:b0:2fa:cac0:2a14 with SMTP id 38308e7fff4ca-30009c30156mr45544571fa.11.1733350868075;
        Wed, 04 Dec 2024 14:21:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e20aa9sm23431fa.80.2024.12.04.14.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:21:06 -0800 (PST)
Date: Thu, 5 Dec 2024 00:21:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add interconnect provider
 driver for SM8750
Message-ID: <snccv4rebzwolmqknc2jm6nkfxchi3hm2vauxnneefsisc3xwe@slfyaiss2vat>
References: <20241204-sm8750_master_interconnects-v3-0-3d9aad4200e9@quicinc.com>
 <20241204-sm8750_master_interconnects-v3-2-3d9aad4200e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_interconnects-v3-2-3d9aad4200e9@quicinc.com>

On Wed, Dec 04, 2024 at 01:26:06PM -0800, Melody Olvera wrote:
> From: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> 
> Introduce SM8750 interconnect provider driver using the interconnect
> framework.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm8750.c | 1705 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1716 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

