Return-Path: <linux-arm-msm+bounces-47955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92BA350EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 23:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C107188DCE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 22:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6BE269825;
	Thu, 13 Feb 2025 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OX8Q74YC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07F720D50E
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739484567; cv=none; b=kcZWg+J+mRUNxKH7IexROj3Odl7jmmv15zLaHXIFLBN1p8fqKX+pDOXNAcFhiSsVpxUZYn47vXB8vLr6UiMnVczC0ht49eJxOcjXi6x+v7h+76p77XPP7nEzigWRO1RV17vRFiyR97Q5dheGR8nU1iGvlJNHvsAC1fNk1YnlUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739484567; c=relaxed/simple;
	bh=TiogawfA+d8HAgfcQDsyQvJAW4KatS/M0fvAd2ugozE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxsIRKzrDo6TfDQVvg7e5vOFsqp7K+5WrCZwLkLnTnEZbpFGqNydFUWf7k522ivnzO2wwE1El65CJwL1C6ONRNlCV3Z3jD6xNn5dSU9uqpH6a9f0671z46/wu5O5T5lId0/nWMZ4lUDOspy3GWLed9ezy3X719K11QBdFU7Wk/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OX8Q74YC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-308dc0878dfso14627271fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739484563; x=1740089363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxuQQ2aIsssajEjEPLBiy4yR+691Ol3xWx3H0aH87Bo=;
        b=OX8Q74YCeHUIU+ahbFWfnVFxeyeM+wpFudVhM2USdzBzRuCvi10S9iSKZTzTzNHFAl
         e/X8HbLGHIZzxAuni+2keviN0t1Azivnc9+6Plo5x9NQ5JzqSpHn8uVOLJVkJSAwDLVA
         2zmmUSjhLb3yz59HDX2DjkfL5isMynBpbePTel/wM2k2cz78EYgrK+brP7jt3K6/f/2N
         7Lq49YkMG76pLjyFbqrzI1+4zgUE9zJps0FB0cv0p2C924Z4VKNDZw/c58WYcgWvpuPY
         G9esM+HtfFdNY6Wp0cxV6ZW3mm6yoXZlmdT2HWk5J/N0ADuQ+qMa/G62Z2bVuiovIQ8X
         kjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484563; x=1740089363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxuQQ2aIsssajEjEPLBiy4yR+691Ol3xWx3H0aH87Bo=;
        b=w4CAoZ/x3KSLz9asVY6as07XeV2YNfD5lNNl11oXgexyHQ2oQ+mUn8ZJdG4sdKEyl7
         pwBShwHodCOepBZkYQjLJ2rW9brmYn/pVpMHpiJ9BLGqwb9IVMakZbKVJMCZUXXWIF/x
         HM3Jh5fJIXlHP+LRvrT8haBsv4+d+L0UrRBCQE18F9ybpw/qtKNa0Q/JlwIgVLl2+KGm
         NOTvDD3NGQ+MqTyNov1QFVgw53uBBOSCLum7FCRTRTp9h1yVpndl0633tG+cKgWzjj8T
         IIhbh7tD9bo1ulnrkKAQdEVXBlYftYPyIHaeZwsug2KaL396ajO6Zvrm51pKNCc9umW/
         I4WA==
X-Forwarded-Encrypted: i=1; AJvYcCXaPJxp0KLch7Zthwak/AcmtG1m3FayIwKOxS7fwx+4r3BPGqk0H45gyzLjB67x22domxvARQRtQf7shrQh@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhG205QDnpkxPv5tu/Und/wOXRCy6pUh5dUW0cm78pEVlAkhM
	0AtvnWR4U7CTTnVwRDs8GeKS0xfvQUCs7OIIbYLnxOHWS+UAwO+6kwRFXWBp9vQ=
X-Gm-Gg: ASbGncsk2SSeWKDh/VkSkM0+CIVs5hhNaAiAFoX1Qivaafwx82xA1tfZxbhiVrGE/EJ
	gBqyNN4yFDyZeUvZCe7qKKXuR0VtxVr4DCkdZ82eiqZKmhKKnqka+8f+4vpyXy5i+h1wS8ZiF33
	UPm7BgpfXGJMpP/QrE4MFoPxidM49/5mVGtjO/movDZNGbKoBfzoNkQqS27AHzdX7DazBR6+DdG
	89EE5tfveabLBkTG2Nj597G6uR3lAZVw/w/ggxcN0tIDIWE79yJcX4/HQ/Go9JYYwb1pY6+NPF1
	2mGXI3B8wwiMBo0iK1AAWyJkrc0t8Yz87riKSN2jpciozlqiHMAIUe2VTUi9sDatoC2E8Ws=
X-Google-Smtp-Source: AGHT+IEQZiaXM9iD4RqwV8Exvhjv8IXXzp3pQe7MYgKZr4kvCi50te+wsM5WWvl1NzvFC4pn4eF+IQ==
X-Received: by 2002:a2e:bc16:0:b0:300:2a29:d47c with SMTP id 38308e7fff4ca-309036d731bmr35341951fa.24.1739484562644;
        Thu, 13 Feb 2025 14:09:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100c5751sm3165361fa.14.2025.02.13.14.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:09:21 -0800 (PST)
Date: Fri, 14 Feb 2025 00:09:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	david.collins@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] thermal: qcom-spmi-temp-alarm: add support for LITE
 PMIC peripherals
Message-ID: <2v2nxdv2ofd2cwvatrpmo6w7o46o26y6w77myioailuin5ymal@z2mabzkbcrgl>
References: <20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com>
 <20250213210403.3396392-5-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213210403.3396392-5-anjelique.melendez@oss.qualcomm.com>

On Thu, Feb 13, 2025 at 01:04:03PM -0800, Anjelique Melendez wrote:
> Add support for TEMP_ALARM LITE PMIC peripherals. This subtype
> utilizes a pair of registers to configure a warning interrupt
> threshold temperature and an automatic hardware shutdown
> threshold temperature.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 204 +++++++++++++++++++-
>  1 file changed, 203 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index a10f368f2039..081db1a85b8a 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -22,6 +22,7 @@
>  #define QPNP_TM_REG_TYPE		0x04
>  #define QPNP_TM_REG_SUBTYPE		0x05
>  #define QPNP_TM_REG_STATUS		0x08
> +#define QPNP_TM_REG_IRQ_STATUS		0x10

Is it a generic register or a LITE one?

The rest LGTM

>  #define QPNP_TM_REG_SHUTDOWN_CTRL1	0x40
>  #define QPNP_TM_REG_ALARM_CTRL		0x46
>  

-- 
With best wishes
Dmitry

