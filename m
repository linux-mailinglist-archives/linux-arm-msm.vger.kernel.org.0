Return-Path: <linux-arm-msm+bounces-18674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B758B38E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 15:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D0ECB221F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 13:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A501482EB;
	Fri, 26 Apr 2024 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="A3AzBJ+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6A1482E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714139343; cv=none; b=OeqDpgNYMjjVjewiM+ZzZabfT02uYtY5Pn50l7XcNGNOFNyb9e81Ek3l+yWh/sd3rh4Et1sa9V5ptzZfoCz8NqxsFsqG5cfpWdSuGOAjijMixQMw7HFFXvkJELpGNcgQPBD4w01jrIEFO8LuWxPtEnNHCnLm0MOeNSV8yGUJ7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714139343; c=relaxed/simple;
	bh=2+oagMID39Yp6PXQSC3p6AN5t7mMZ4H8egQQS+jJbqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHTx0PJ2LRtSpv5RH8kcNGIfDpL2AzRK+y2uJsppNt964BxZ7JGMkoKjTsEwJQBZJKqYCuzPE6HexkRfFVt0u9bf7TDftYc7dZo6dxBEMXK42VIXfjPV60x8up/OWC8pbFX8w2iN5baU6Sfv5IBdLUhW9SJUtuEZw4KCl1HATuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=A3AzBJ+W; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <392a0fa9-9d7e-4cdc-b09b-68f9cf92fe23@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1714139337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuoeNzwy6bQX9mtkwmSMkSNch5NUdlMO29Mok9NjbeY=;
	b=A3AzBJ+Wyd5eUtH7CH/tmh+sddNgFDWTRn0mxt84xD3vcZGTxdgW2h0lILN0u5deWLaTjc
	JFoCzEW3wahXzceY8CQza29ZIw3oW+qovk6tdbUIyyiDT1X5zJ83AdpVLIaeRMviEton/y
	b77mTexJGaDvikZsd8GFUaDXoFPzqaSOSguIUZYY/YEqY7DuhSPt9TBZIRGBMPWblRZqGK
	UKG23PQKUT7LX7xAUe5th+qfT1xgz8z2pqmaJIV5U+bMdIz9t1/nz+LoiYqgMyzYqGeJBi
	raziQ/PbPIprljiL7AK4P1HNZT/Bt5mz70ZUvjxHXCklddbbDFxUJUTgTUBqig==
Date: Fri, 26 Apr 2024 16:48:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 5/6] soc: qcom: add pd-mapper implementation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Xilin Wu <wuxilin123@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
 <20240424-qcom-pd-mapper-v7-5-05f7fc646e0f@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20240424-qcom-pd-mapper-v7-5-05f7fc646e0f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 24.04.2024 12:28, Dmitry Baryshkov wrote:
> Existing userspace protection domain mapper implementation has several
> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> reread JSON files if firmware location is changed (or if firmware was
> not available at the time pd-mapper was started but the corresponding
> directory is mounted later), etc.
> 
> Provide in-kernel service implementing protection domain mapping
> required to work with several services, which are provided by the DSP
> firmware.
> 
> This module is loaded automatically by the remoteproc drivers when
> necessary via the symbol dependency. It uses a root node to match a
> protection domains map for a particular board. It is not possible to
> implement it as a 'driver' as there is no corresponding device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
...
> +
> +static const struct qcom_pdm_domain_data *sdm660_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&mpss_wlan_pd,
> +	NULL,
> +};
> +

On my SDM660 device (xiaomi-lavender) I see also the following files on 
modem partition:
  - adsps.jsn with sensor_pd (instance id 74)
  - cdspr.jsn with cdsp root_pd (instance id 76)
  - modemr.jsn with root_pd (instance id 180)

I see these numbers match those you already have defined above, so 
perhaps sdm660_domains should also have adsp_sensor_pd, cdsp_root_pd, 
and mpss_root_pd?

I'm not sure how useful they are currently, as AFAIK cdsp is not added 
to sdm660 DT at all; and ADSP sensors are very hard to use/test, needs 
very special userspace...

-- 
Regards,
Alexey Minnekhanov
postmarketOS developer

