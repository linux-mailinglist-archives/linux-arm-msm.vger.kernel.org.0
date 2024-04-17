Return-Path: <linux-arm-msm+bounces-17687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E87668A8247
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C523B2602C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AA613C90A;
	Wed, 17 Apr 2024 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Co17iC6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E113C8EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354183; cv=none; b=qN9TQbWi8/uSXIYLwsdue5vy8S7HNN+2QRjG/2fuHSc6tScD4oll8RxKS1qEpRqXJ6XKS/yPIMZKc/ts+xo8UgaUOM1ubyZtJN2lRgjo2KqNT29nAV+tRNSFJV2g7EDX6nY2c6CdH7wcAcwAXDaa3OnwGUv1CUESNHnlo79T9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354183; c=relaxed/simple;
	bh=2j74h0iIytH6PRZNFrTHCHmNEPwJygBB1ndVw5tJ/MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAUlLCxomOjoOwrX2/F6wk9q00eUzj4OHITSClVNe7a7kKmhPRCMY+vqgXwTG1/C1WwMnQCiCtd8eR5oY4WrVWFkOtVKVdTJInloYmse/B3SR0pbiaK40OkVBA+rw4+ImrL2gC2mB5mdGZrajyZCp45Ie5yl/zzrp/jj4AWPsRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Co17iC6C; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso66958821fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713354180; x=1713958980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKy5Kxap6cM6mtyJpA2QMaShqvinZmDMbb6nqhab/os=;
        b=Co17iC6Czo0ZCZF8gIxSGkwXc15HM7JLzXExfHOqvOCpwAjGJKkv1h7ebNrzNLkZ2d
         nqq37E3N1t2rOaPQDMRqeFhuadRMBnknN3AaHCyyNm/YDZTVZQB5NNRlWDIrPsZUTVdI
         ZSvk0ut8za/y3bUVZLd8mwsdcnDHFfsdsyp8LIRCJtbFc1fe2dYK7SMt8rSH+HeXwcta
         QeeZh15UqXNwlY/E4M9pXwyLXrT32w2iyskgZd3wJBLmlM/apaYjDY/wdQrh3MFce3c8
         mzTH/RobFsMXUuIbj3Y6USPynzYvcHLmrnKhgNeQDFzr6HlOsjk3330gHu6wwrOWJowi
         3M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713354180; x=1713958980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKy5Kxap6cM6mtyJpA2QMaShqvinZmDMbb6nqhab/os=;
        b=dHd4hNRstG/G4penZBwO6CGYxZtUuQ5W3qHZhG3nW2F6jWYYRc8pDIWyE2Zs5EdHGb
         y9kBEfGgFFKZwFTF8xrZ3ANxUqhp5rk5DvQN1fmlKwfL4ulERRs4bKQqZxJ2XtSAcNA9
         GmdOqTO86z2ivGiPYwg7WDhaaQI/F68JjR5cp4+56bZvMep6c0OZy4Mv/N59i2vFhnK4
         wX7+n7TCq2c7O0GyYmXhUF3qKF3+ilTYngXc8ABYF5h6U5zDhZLUs3pt+/zVadiikIIC
         4Aeu5ad5IkSvr6N2GTgSs4Lj8gQlEnOFLX/dVMapnApv55BgQI1aAtvjTWk5pdHVJJek
         EyGA==
X-Gm-Message-State: AOJu0YzKJGZ1mw3weNfReiJ3JtBsmqqUPE9VrSI6Eh9zdBEhx72I78Nj
	vN/nw9a6JwX69LHNfVxzrwBLIB8CIhkn8+nCwViSwPLvRVgmopccCSH7bx4+zH0=
X-Google-Smtp-Source: AGHT+IEhy7phkNh8GPAYWeNKIjEQ2zGqofF6B3DRQvcLUKP1Pajvk5PVp8xJ6WRzpZYatNNIwww+sg==
X-Received: by 2002:a2e:998a:0:b0:2d7:61ac:b392 with SMTP id w10-20020a2e998a000000b002d761acb392mr10489311lji.29.1713354180124;
        Wed, 17 Apr 2024 04:43:00 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id g3-20020a05600c310300b00417bab31bd2sm2619839wmo.26.2024.04.17.04.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 04:42:59 -0700 (PDT)
Message-ID: <3b245ae8-31ee-4576-a123-0dc3aba4ce10@linaro.org>
Date: Wed, 17 Apr 2024 12:42:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and
 below
To: Anton Bambura <jenneron@postmarketos.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240413064225.39643-1-jenneron@postmarketos.org>
 <20240413064225.39643-2-jenneron@postmarketos.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240413064225.39643-2-jenneron@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/04/2024 07:42, Anton Bambura wrote:
> This patch returns back the behavior of disabling stop clock on soundwire
> 1.3.0 and below which seems to have been altered by accident which
> results in broken audio on sdm845 + wcd9340. For example, on AYN Odin and
> Lenovo Yoga C630 devices.
> 
> Fixes: 4830bfa2c812 ("soundwire: qcom: set clk stop need reset flag at runtime")
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---
>   drivers/soundwire/qcom.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1e2d6c98186..bc03484a28e8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -628,6 +628,9 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>   			}
>   		}
>   
> +		if (ctrl->version <= SWRM_VERSION_1_3_0)
> +			ctrl->clock_stop_not_supported = true;
> +

This is not the right fix, this can be determined from codec 
clk_stop_mode1 flag.

can you try this patch:

----------------------------->cut<-----------------------------
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 17 Apr 2024 12:38:49 +0100
Subject: [PATCH] ASoC: codecs: wsa881x: set clk_stop_mode1 flag

WSA881x codecs do not retain the state while clock is stopped, so mark
this with clk_stop_mode1 flag.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
  sound/soc/codecs/wsa881x.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 3c025dabaf7a..1253695bebd8 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1155,6 +1155,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
  	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
  	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	pdev->prop.clk_stop_mode1 = true;
  	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);

  	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
-- 
2.21.0
----------------------------->cut<-----------------------------


thanks,
Srini

>   		if (!found) {
>   			qcom_swrm_set_slave_dev_num(bus, NULL, i);
>   			sdw_slave_add(bus, &id, NULL);

