Return-Path: <linux-arm-msm+bounces-39198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4969D970D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 13:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41B8AB2D19A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5391CDA2F;
	Tue, 26 Nov 2024 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2rmipEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D61A260
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732622788; cv=none; b=YR0wJgKZV58GJdJvSFtnhqa70dtImiYRboO3+Twx0ruHy6zEQJVliDtk0Ppr7OHfDMp4gDcKV0ZI2B5/KtyZeJEo6xFaIsqv66VQEyTBoiKeiSyrJ+gdzFc489Vl8DnSgYHHSZtGzMwiMbnsvfZm9KPihET9jhBCgiverVZD60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732622788; c=relaxed/simple;
	bh=aBSMl3iGqThIGaN66zqIdpUQTca2RSFo61QoNLW+2/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRCT8b9pN/r5YrXNyF9SjKjQYe59y/vYv/KSjBQq5h3sk06K1YOIv5DBv2MtA3tEQwSf+L72kDFJLhDtYegErB8R5FAhiOdDOtpqdl1kxlAZkElOJIeGWjocVVsNszazPMqOEEqt1ecAwuD/vPg+xK7K1UIIMbXvxOj6ijVZbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2rmipEs; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so16953371fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 04:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732622784; x=1733227584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24+yU80mKSXh87Yxf0+WEn3/JZAgNat7qgThUG2HLHk=;
        b=v2rmipEsioRpnft20Y5Iz7j4C45+3zZDFyIs/+rMw1JzOQupWIQHL6QCg4DtnmUh3U
         ShCLD6x7JrZAJdhxAoD9EXqocFRYMkmcluwbrYURog7xbL8DQU6CiiCiiyD86lOAIeBQ
         EXdq2L9++Brjf43mLMD2/KyOBhvHJrbJH6she9sE3+mQqH8/XJ7IPuMtpfVoAaFsCwD4
         McsDdYDtr5+nfKkpIXAwRMEpDj8qVZI9mcLqNMGc+fbBl9NljjmZXdSzUUW15iJk0Rb8
         XmxgBDsUTDvir4hDDGvoexHAv1jXobJys1DrAOOWw4tJRDEz/tEC9dcEeYNJzSkxs3QG
         b69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732622784; x=1733227584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24+yU80mKSXh87Yxf0+WEn3/JZAgNat7qgThUG2HLHk=;
        b=Zbt6/xQUDyNWaY9cN7BtdpgD5uooTtttNwAc6EDypFDzKDRyIn4zTCSV0u+uePHE4d
         gD4h4BE+cP49WuRSvLSwuO9GyhcyZI4Do06CeUi1l18Tb465RKFfNy38+K/hn2LanIQX
         CmxIPEPvbOG2pxczKQNiysnZqcls1CGTrDta9DdU5S6Fv7pmkmH6tKxuJJm+PKwMG8AK
         TMieP+RgXKeOgrKcZE+MqYzxO2gG5DiXy7vSEZdLNqsJY+EMiQNI+HFAk9II1fBKqLEi
         jbyLq0/dkOuyvYKJa9GITZQGO08MB4+Qvz3uI3hlS//xZBgDXOvvKIwgR24lUsLW7qB7
         D3yA==
X-Forwarded-Encrypted: i=1; AJvYcCUWEJn5IDunB7rtRI5lt7hqC5qlWcCveSRT9GEB9XNP9GqvmjBUub+tyLzMKuVfvGRAP18bHwEMZ0f65sfp@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDw3eVXx6kwhWqCixgh5/X2H/dVYGbJZBEEqjhgOhNcsGvKQw
	SK744ahs3UHXHuAaq5Z0oCNdyozNODWHPhlVXKaJcChl3VPN0v4Sg0RZLCXvPuQ=
X-Gm-Gg: ASbGnctA7Bwi3vQb7yS/iEKhTyZWGZBo/a8e0I6C2yb9HXfrDHBi9dvYjhjZWzrrW1k
	xr2x+nig94r5rtKaQ76b5rYjPCNU5+b1oM35o18I+av6T95/xGVQs8ijb3HOPvCdWwWrf5s+KY9
	3qAr2JJ+NGHHPfrkKNxs+2NaMtsc9k4pNVVWgpp0gwcVL2bixLpCMtCJkgOD58K1OKAyLtszIK3
	O+YruVfj1Lrg2WeFhj+8fJi3rEGQjl0nbNKoOHmqabtp3BQmwc3reMGnQePwm2AY1w6q5o9J+IJ
	P0Pw54wvZpFy7FVxYaYeJKJ6ebaPBA==
X-Google-Smtp-Source: AGHT+IFsGQmOebH7tN67AoV1IxaFR1B1MXlotxDp/bRA7hKzT6XbBkXI8ArKgYdjdZCKUAoytEK3JA==
X-Received: by 2002:a2e:a5c1:0:b0:2ff:552c:290b with SMTP id 38308e7fff4ca-2ffa711b581mr69039891fa.10.1732622784527;
        Tue, 26 Nov 2024 04:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d1693bsm18921321fa.14.2024.11.26.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:06:23 -0800 (PST)
Date: Tue, 26 Nov 2024 14:06:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH v9 3/7] thermal/drivers/tsens: Add TSENS enable and
 calibration support for V2
Message-ID: <n325yyrj5le46bockmua5iebbxgyqe5vet5navn7gnmets4lle@ak6kgoaer46r>
References: <20241125050728.3699241-1-quic_mmanikan@quicinc.com>
 <20241125050728.3699241-4-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125050728.3699241-4-quic_mmanikan@quicinc.com>

On Mon, Nov 25, 2024 at 10:37:24AM +0530, Manikanta Mylavarapu wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> SoCs without RPM need to enable sensors and calibrate them from the kernel.
> The IPQ5332 and IPQ5424 use the tsens v2.3.3 IP and do not have RPM.
> Therefore, add a new calibration function for V2, as the tsens.c calib
> function only supports V1. Also add new feature_config, ops and data for
> IPQ5332, IPQ5424.
> 
> Although the TSENS IP supports 16 sensors, not all are used. The hw_id
> is used to enable the relevant sensors.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V9:
> 	- Update variable declaration order in tsens_v2_calibrate_sensor()
> 	- Replace tab with space during the 'val' computation in the
> 	  tsens_v2_calibrate_sensor()
> 	- Update 'RSEULT_FORMAT_TEMP' to 'RESULT_FORMAT_TEMP'
> 
>  drivers/thermal/qcom/tsens-v2.c | 178 ++++++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.c    |   8 +-
>  drivers/thermal/qcom/tsens.h    |   4 +-
>  3 files changed, 188 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

