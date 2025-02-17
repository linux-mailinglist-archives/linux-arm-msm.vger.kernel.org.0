Return-Path: <linux-arm-msm+bounces-48271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD19FA38BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA16C188E488
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF3F23236E;
	Mon, 17 Feb 2025 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAnt2mhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299F190497
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818849; cv=none; b=haRAtmHkct8yzBa97HJH61eYqfKfK5IzsSMpaGptJzvERB96PlKMRmPG7ib0VCqoAfpX/mfrnr+yInJ/oWFhgruYnUOILdhSFxhlZBTho5kfZPO97MY/vLgd0FEUoMqOxqCSk65ToFRYC24ggcxyi624Wqa6MgDcsD1e9pI80Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818849; c=relaxed/simple;
	bh=Ve5Mzg9Jp3h7VNxS+Ffmhpm7YF6ykj55ig+/GmxQctw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuKo3oQC/rdbQF7NybOps4+Rig5Cs79xqA2Ua775Zo5LFU9S114SFXeSnXY/jYKcEDCorm7LzRYvnc3EtdvOD89/8hbdq69gbJP2BkA5h/77A3liQSfABCal1cHKFEw7U1GuGGx4udI78zZgH5dkM+xqqooh0sNqL1MEmlYuAHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAnt2mhC; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30615661f98so46686181fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739818845; x=1740423645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOaJBOao+MMu0MuGznU61rfSupDYmEn2N+XP1yk32jY=;
        b=EAnt2mhCxCa9CLCOt2/IkH9QD/qsuPoe58NA/yaeVydtNYA5JNh04kFDg+RFSqleZ/
         ottbGKEzuRurPSote8e2GAeCUHeUDPyM6t9wjcBFKsCy3Ujb5YfnywV6AtOZDH2nEZVX
         cCeb892PYmTiRLOWL/bjUlj1tUEAKFUOIDQv4lGPUfNPPVmTpDzL6oWMenjqZ2EpLkUy
         ffJ/dr7gecjMVvJg2QwGiXosbeeyMHa+Ba/JtSod87GUhqVgwFpWo0EyOOZi3ZQ7lOrh
         LXiHDoARdNh5AV9e8bcHqH4tHgJeOZqRiYJO1kJ9rIjwBisWITNYasB7N59Xjw7ZM7oz
         925w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818845; x=1740423645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOaJBOao+MMu0MuGznU61rfSupDYmEn2N+XP1yk32jY=;
        b=jmX8aTf96tqqvsDK3wzWTXdrvQahgaMW/Zx6GSHGhnfd9Trfht0NT0yjzQ38vpVYY9
         dLGekH+bWemYKvBxGwHFTFZA5gmYpcDigFgEDsuxceAigj/3tS0qtXy55rTPu0oQfqxD
         fYISxl8ifU4WNvC0zUcSoNlv4xJ9U1buQd0b3OVzikECmUjWeAvUq1yTUMMl8DNtxlzS
         tInw01tyK1XZMZpLxX21pK4e57KcWFQJM2ncfs7LoVCcfaE3XCCfwGl9k5e67aDRpRcS
         P5labtTqL/7iTSeCwdYcxcPImygLEmbKCpxY1FK8C2hl9nZCDMsfQ76mC6ijjw7JnT6y
         qMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhp7pcDWuGUdN95UUdMV4u3wx9UMSjC0c8NQvHnt6dOr/fp8vyy8/W1dK5bt33bIc7aM+G4sJCniZlMibz@vger.kernel.org
X-Gm-Message-State: AOJu0YylcKEOFZQjhtPbI7oqARrjIhDrCRewkCJYRdWEY7KAEIdnWGN4
	FRS5IFfs9mhvVyRxIMgmsiqDbNoXXbsfOCi4rXO7VEWvt71morNaO1IHqU0Zt0w=
X-Gm-Gg: ASbGncutgb+Cv19hBuYo8sdKwCE64RIkstnsxamdeqUQ5Tz3UJlvnz72ziTBKu1qPBS
	6OoiP91gcAQPKnY+0TV7mLYBLQceDcCQ0Knm9W7NnJtaB2lpWxGugVtxMDafmnR3ZpuiAu9LJpZ
	Tp4yXeV3uLBGOXdUF8vhJdihNTQpMIedr6zj2Q8Q9mdvKDfUjF5RNgEMF4MIhreOhrVMKfK+rS8
	iqkbO9m0fsyhT9IqPIVHzD9v5c+dFUCGKIOErKr+J3tdtjPNjAGnhicfOeEgRJ0vtVXgfX/BD4D
	wdguFBpfjymEvfcuU6UauIDdFAnbPBY9qmz1sNNS6sULCeFrPDzc10OqRmkCwf/XueUWt7E=
X-Google-Smtp-Source: AGHT+IEslo4JCXXW70CatTE3GyUrVciwejCa+A19BXKrlebG5EgoNg1Rdkp6bulWdiqf9EJHhBrftQ==
X-Received: by 2002:a05:6512:3990:b0:545:746:f36a with SMTP id 2adb3069b0e04-5452fe90480mr4199200e87.34.1739818845416;
        Mon, 17 Feb 2025 11:00:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54531d76843sm923155e87.84.2025.02.17.11.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:00:44 -0800 (PST)
Date: Mon, 17 Feb 2025 21:00:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 09/16] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Message-ID: <eetx7fuv2vearihvpu3mvfaokmfihiq2plstyhkblh5hklspz4@p7fslha5nong>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:30PM +0100, Krzysztof Kozlowski wrote:
> Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
> MERGE_3D blocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

