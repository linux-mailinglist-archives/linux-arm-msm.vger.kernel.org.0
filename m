Return-Path: <linux-arm-msm+bounces-30157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB541965850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87773286629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750B1152169;
	Fri, 30 Aug 2024 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtQmup2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D71509A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725002553; cv=none; b=NGFn+dp5LBJ8KOCUSYJpCewb2LM/yyn/lVIIPqreJdYAOoSTZj2o57s2ZLYgPygE9kMK2j99VSX5uLy44VWmLAhOkZU+znx69maWEfjS9S/XX+2k6wWGuB94JyRHuw/qOR8mxYE8fHejcMWivCL8vEOL66N/1y82yIv2oe1WtKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725002553; c=relaxed/simple;
	bh=LtIr9/ZqhyDR/GeeKmVMWH4tGiG5mBvDaWrJa1zm1js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMvNozCyMZ/tXFFVkjN4ri6OY+wCJ0pGsfVxoYMnSIIKIc6bTAdGQLjRibO3//bN1Llf5Q28aBbaivP20lyRReJ4wLx+xNN9JZOun86Jk+MMlMe/eisBwV/3MJFwEXeV8PxtQvtENG3bOUbFeEWOrQ591XRyLZZ1ptQO05QDGk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LtQmup2g; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f401b2347dso13935621fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725002550; x=1725607350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9sMeJMps7E2S6f8AwlLA7LKAc9i3wDhfx+fFAsofLaM=;
        b=LtQmup2gzKexh2FaDj8eteELvGrQeB6I9Qa7uG8imTeQWYptD0Bezv/1T0R1UIsCIQ
         TF+h4kBjqlKXbRNgyrHdiZqfwlkwov49pC+Ufmz6n0MmqUuCHYgV5ia7nuLvIk1aHPl8
         gNB1VIJYjx5kV7G+TxiYDfpFLUxfyGWZY1vB2nq5/za9lhYthDs4LEphcWJxGCe/GY5Z
         7kZuXR5d5s+N6F0mPboAR+lKYCWvRsqx3z4nbtH1uU1daG3J9LvqniqrV682DHrS3GJu
         hW8zy6sx0FbS6B/QcYfeWWFkr2BNYyuMNYVmojFLoCiINg9IpTptEcAbtBeQGej9p62G
         mHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725002550; x=1725607350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sMeJMps7E2S6f8AwlLA7LKAc9i3wDhfx+fFAsofLaM=;
        b=tsX8qTywL6ZVB7Rdvdb29wdAHtTPA9l2HKKWlRfFF4PNshw3O+kJXgWz7Y5yS0LdFi
         UrQ5mw2D35IMhoAjt1fTkTVcRGe/kOf3dn9qdpFdIcQmpUgLdkwMww/W/y+b4fq1NYnU
         Tr/VQFSqbQzOw6MOAeFI0/ZSyAQ05uMm17/TLbg9e2M6HZWrDlJiAUc8qTIAXzgEYfzk
         0B+PXooi30BpkAET90cY9StZh5TD4CYH+dy0yVoVzQLlx2ICVJRkKG8f0pn2dgaEV0cB
         /b8GHJTZ78czy8TliVxuhdSz1sJ4zUd+sL5zhLIWS3V5cr0ddX6BngxEoxkmDkeATTBT
         WzvA==
X-Forwarded-Encrypted: i=1; AJvYcCXAnAz6GWq7yshS5G5QGUVJljRXlwM3PQ5iAxP2MYp5jfhN2KZUMrPNWJEA+Ty961WuAWZvgU+NzGkmrIhs@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmMVr5JJ6gavzcGr0InC1HT+l/92zIJdg7+klW/Y1eEZJreH/
	jnl35xhDRcwdOGgXmFwWUWZoUwoXe2th7r/S1Uq7JRZN8oufE1ydWs15w3LVjPk=
X-Google-Smtp-Source: AGHT+IHLWJk3wQEYIS+wD4pUv+R8kJp73nMGNuud3xFIQE2+Ol6M5j/0i54RabtBIsiQzJpRT9LT+w==
X-Received: by 2002:a2e:b88b:0:b0:2f4:1d7:e286 with SMTP id 38308e7fff4ca-2f61e0adffdmr4111671fa.18.1725002549259;
        Fri, 30 Aug 2024 00:22:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed171csm5237831fa.26.2024.08.30.00.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:22:28 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:22:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] bus: qcom: Simplify with dev_err_probe()
Message-ID: <kmnxctfzpye3oz36ojzr637bh5lfis4sjp7ptzv65byfakatqh@7qo3pmzun6qq>
References: <20240829124118.3256437-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829124118.3256437-1-yujiaoliang@vivo.com>

On Thu, Aug 29, 2024 at 08:41:18PM GMT, Yu Jiaoliang wrote:
> Error handling in probe() can be a bit simpler with dev_err_probe().
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>  drivers/bus/qcom-ebi2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

