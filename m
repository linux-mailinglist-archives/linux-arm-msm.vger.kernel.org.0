Return-Path: <linux-arm-msm+bounces-34447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B4D99EDAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C111C21CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DC01B2186;
	Tue, 15 Oct 2024 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XD8NOGWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AC149E16
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999199; cv=none; b=RSibp3+cqOo0MEF18LzUSvP5braSXrkq0QVL/WhlGXiqKX3ndzEGGkgW27+sO1ZQ00oeju7HOyhLd3IxgzX+gcPHsRgpOAvmQDtW//a216UDonQuu1sXaSa8/VH4UFIT38gh+8wCkxF6gKzP6H9z5S0CisOp76/bogtQt9L/cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999199; c=relaxed/simple;
	bh=fqVIDi6e3Pi70KY1AuVHU+nl+Y7/64vheBPcEyNObZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRxaks5iOvy4OvgC1VAwOAcqLRchEKiMs/Nbk9ABxbOmm66cUVqO09BKpeknVAcFP0b457M4CYobh1Q/1ZZXifvYAqJM4y7/RT882gEHXY+rhuW3OV9TFexp7q6G8HEX89DnIhnV9qTKex09v+8910WVA3VI6+0huBEkya64+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XD8NOGWH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb518014b9so15337061fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728999195; x=1729603995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8dvw0BVQzEB9X8CFHtRp0QZ8vrqFpv2fHeUKrcBo1TY=;
        b=XD8NOGWHBjy/qQf+WZlvVRCf3a45wfNnoPpMRd5UO1g8d2XTQXD6gpu8evwuUG9cDM
         O6l1RVL2pARf1Zq4OlG2adJIwwkI9TNqbKNj+DbiqztqaXras/W3MZEPgbyHt87wQcih
         qwHMNGMpfxeC2aTfpaXkAWzAr/0IP5yCe595m7KD2ZiCpaMeu8ZjKpyFjJvjbG5BC2fy
         AOLvWgnMSFAHuotYsnFEKSm+igex/4Z2xNPWRS7vdgEhOurkLetgmsGxX7S2Fqdk32cx
         GGRzwnTICUq7+80QV68q4o/iKQwvCNaj0mXssLZrbpPcDxBPTpXqPYa0GwPv6SKkWx9T
         JEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728999195; x=1729603995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dvw0BVQzEB9X8CFHtRp0QZ8vrqFpv2fHeUKrcBo1TY=;
        b=o5KkTYYoIR3eZoAGnOTe8IC/3I+cdIDzPXOQNyRtmNddrKXVGGcdyXySl9IR7vQRTE
         8joykD91MkP3RDX9cRTDAnh9PAxOKi2XEtdaHyUc8I0gNPq9QYVwFSIFBfjWPkoAv94Z
         aM2Omwj9LL6pKAtCNmqzT6blcm1t16KyLgC3tgVKa52Ht00jbhuOz/i9SmU5rFzZXOBR
         8qOgUHnOTEM1Tr3Pv1mO74tv4rw5qQ4hA9uMCVEurUZ8Xw1VmKH+INL1F9RGvysnqUD7
         MMNj/V1PKmdmaj6uJOJe/x4cNL5focB5vP1PrpZPgiL4fp6w+4jYXA596OtZBU5AChsX
         mdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRDUVfBFDssHIq+SmTlVJSKgoPJ4C/NN2hA+O5m1l45VmDUJPC/Wi0Zk/dzfaIrNe1eIXlBsyEjTB9JY/0@vger.kernel.org
X-Gm-Message-State: AOJu0YyjL4GU/lAYfJvspNPLw4aUqTLzsYpMqeeJQdbJq10/Y3ZL6Pz8
	haLXp2JQl639BF0naOE9oKlHsHtn5xyxu7Dh7xFHKVL08uHQ0K25JT38bycJyJY=
X-Google-Smtp-Source: AGHT+IFK/Bdt+DSfI3J7VfTsOap19LZdteNeX/8IXzgcY2WkwjwnNPkEkYbIBoLD/sv9TK8hsUwKnA==
X-Received: by 2002:a2e:d01:0:b0:2fb:45cf:5eef with SMTP id 38308e7fff4ca-2fb61bacbf3mr2872721fa.30.1728999194974;
        Tue, 15 Oct 2024 06:33:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb6288f34csm55761fa.126.2024.10.15.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:33:14 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:33:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rakesh Kota <quic_kotarake@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kamalw@quicinc.com, 
	quic_jprakash@quicinc.com
Subject: Re: [PATCH V2] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators
 load/mode setting
Message-ID: <fqznmc3airujuxyepg6mv3wbwissvd7xdirr3elrhvwis7qnuw@n2m4e4lrnvvi>
References: <20241015132049.2037500-1-quic_kotarake@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015132049.2037500-1-quic_kotarake@quicinc.com>

On Tue, Oct 15, 2024 at 06:50:49PM +0530, Rakesh Kota wrote:
> The UFS driver expects to be able to set load (and by extension, mode)
> on its supply regulators. Add the necessary properties to make that
> possible.
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
> Changes V2:
>  - Dropped the removing Min and Max Voltage change as suggusted by the Dmitry
>  - Link to v1: https://lore.kernel.org/all/20241004080110.4150476-1-quic_kotarake@quicinc.com
> --- 
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

