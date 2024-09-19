Return-Path: <linux-arm-msm+bounces-32001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1997C66B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 10:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B751C21270
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 08:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8356199243;
	Thu, 19 Sep 2024 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USmM3sJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FAA1991D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736328; cv=none; b=Tmie3GDekn+cR86+b4bX35XOhSavY/5rXmSZm1OQXacshdyMiCgl8gAXRLhvcw/iUifErm/ypOYB4KYjjjfTBhiAXDR/vSJkmP+qnVZ8yYi5ktA3hm8Jkn+Zbldz8hCVb6B0YLQrECseiAIAgiXNeQCABwHlRSPzbATBNQICIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736328; c=relaxed/simple;
	bh=+zfXeiZiSuNzsNiN3wIy3QC7ndq9WdhUfYggazg0kgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ccp2W/lYEuSBcXyf9ClCfnLdYl6xCQPjpwVDrzRxMep9TKnSfReRV18kY8djFYB7tUbiO76/1aEWRoc+gbl0k0o9L8p/rswINhRh0vK8uWeae20cGN2udJtjD/7HgCHZG0zzArs/N7dYM1plOlaOJC6FBOlCJPoNxkeo9+8hFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USmM3sJ5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-536a2759f0eso738648e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726736325; x=1727341125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXHgEpJPQTKg5VxPMWp2cnwAueXl3CoWh6s8J/HJRwE=;
        b=USmM3sJ5518qOW+IvG3G/oL6Vt80Si9pUh/SqdxLmRa7XvIMQw/LbkKDTWdP6t10wM
         wE1GUS8E27dTTjXD5/jsIehth0+MA/meyK7qZSpuLEWCmxwg+9YvJ62m4MDI1uvLYO4+
         tH1+OTQKg+vZVR1tnoKGv4KIlFqUwiSuJR3qx5lMpCUB4MeVi6z6AdvHOmpZ0ICgT6UP
         T6oRM0O3s2u9DP0esiQg3m+YvT7URzrKQxGyl0Fyqn+m5Zyz92VELUABZsAxvUyBiCR4
         OOaKL9QXgjcg7uk2Ul4nLUAUzlX+I59KGcF8OZWxjSy8gyDNhTq9Bp4wJaGNdqCtkKfd
         DiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726736325; x=1727341125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXHgEpJPQTKg5VxPMWp2cnwAueXl3CoWh6s8J/HJRwE=;
        b=h6MkKZysLhXyTDqpgUliijngKPtpfzhzExAucnZZbXoCeTNHw9qURgia/nKajsQvlu
         j6XqdfvWaJv3A8+xkDmWYSds6nuiIp1fKxF1wywAyC4NrbqMOmf30FPE+MNPbb4rgluG
         CKgExkTfuGtQ0LC2iuKR4CTjmnoVNUqDHV9Hqeb39Jy194FzM8/El+FnNGfd5m5pDRlG
         oXlhcMZKBsSdzxdmIRSXXXf4kXsJ4eBesKqCwU5qP6VapECQkwxGaLw+zQozo635BGvC
         HScXogg1NBcBa58gq+2NVq8qCFno+UZBoi1mtp17Cgbi9inK3qe+J1q3zWm7NAoPq2iK
         zOGg==
X-Forwarded-Encrypted: i=1; AJvYcCWtQU1LSyxVGH6Lk47T/TmiaRzBaYVfKUAvXJ3nUt623BODLVryMpoMRdpptRfVDQyhLaxgghbmcitAV0+O@vger.kernel.org
X-Gm-Message-State: AOJu0YzuD4k70OBpw/O2ed2E0lp380vqTVcrquJkoepwMJ9O5Lk/f6qW
	xf/iJuS3zsbQnBfJC+fFU/Jhe01yYxXGJRo+Du+dpIxVRb/cYP5NREDK9hEBzkbNmUjbswPdrMi
	xc8Q=
X-Google-Smtp-Source: AGHT+IFBUzIfmPtY1pCP44YLIOzLQTFYZDubfZtnChxYQrERHJQYOlCRJE7atV4PifpFC3roBWellw==
X-Received: by 2002:a05:6512:3b0e:b0:533:4656:d4cd with SMTP id 2adb3069b0e04-53678fc1816mr13501751e87.33.1726736325043;
        Thu, 19 Sep 2024 01:58:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870bbce7sm1771027e87.302.2024.09.19.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:58:44 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:58:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_mapa@quicinc.com, quic_narepall@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V3] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Message-ID: <u7w3muvmj2niwtr5h7sbiudypceywejhq7ch6ampahv7gbt7xw@x444wsh2tpqb>
References: <20240919084826.1117-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919084826.1117-1-quic_sachgupt@quicinc.com>

On Thu, Sep 19, 2024 at 02:18:26PM GMT, Sachin Gupta wrote:
> Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
> 
> Changes from v2:
>  - Moved status "okay" at the last. (Thanks Dmitry)
> 
> Changes from v1:
>  - Moving the pinctrl-related nodes below the PINCTRL comment and relocating
>    the sd-cd node within the PINCTRL-related TLMM section. (Thanks Dmitry)
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

