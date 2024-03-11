Return-Path: <linux-arm-msm+bounces-13858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D230587862E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 18:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F7F1F221E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21F94AEED;
	Mon, 11 Mar 2024 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ccg7x5u3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73D4AEE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710177531; cv=none; b=fg1v3jCfpPqn+c2wbDppTj559id936AXbGCAQub0DitkjlrttWWNlzquHR3OK5IxqGc5xW2ocPPTaOEupeSav7KJwo2Tw/WbTbqT7/r0L/FqKIgcC9LQF4DpHPYVpVe2ev8uF3qDo848uVIetdltfeeLF/ECQ+yLbgHzHvFw3GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710177531; c=relaxed/simple;
	bh=CQ2x4RKoS/BNf3CA3Ne1CGsZkL9d/2VEYlQvlAkFeGA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HNO1cb73WcIAbs1pv6PXiYFCVP6GtE6stHZ0VsWzEEQaRSzE/kxw/f9zCPrVIbuId1CYGzf4fCKUj0VzLCcP3Uf0Jn3URCTb81LYn9Fn2/U44+I0sOp5dfuCx/FPuYAei2I1ZfbHxlqy+naRgHzUGaMhMUUZjsx2RZSwF8oOkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ccg7x5u3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5133bd7eb47so5451329e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710177528; x=1710782328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWC5J/cGM6XCAjFO/J36a6zpk4pWW2LeMDWW16YbVDk=;
        b=Ccg7x5u3dUp+pvhCnT+RJrW6gP5senj+2rcF4eho7ag3SdV7j+ILuwCaOazSP2Lk4n
         i6ysZmxtOC2XxslmDRuA2dsF9OkFvQpw7uZAujpnMwBJ7ShYFuaKt39BESs0rCFVakZx
         BHmO7KBYoa9e6dnbWF2RaHe+njT/QzwKx/Efg8ilVwnF3wIz6nlKPYc1tn9aOrFqiEb+
         kk+5Bb3CFXWHiUjYYAsBHhZg7YbMUWpZuUc0TmCK4EvCchCiOY3xWfFzfE6WCt6X8y3z
         ScTfuaXUXSVhJ3k2XEHtnkDh4tpXMqhcQVU9jnCg0641ZPaMrALEoAmFmV7xckZpYcLX
         A/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710177528; x=1710782328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LWC5J/cGM6XCAjFO/J36a6zpk4pWW2LeMDWW16YbVDk=;
        b=Iw7pmH53YWA78Cv24XUqgUcYSz3kgi5W1qyPh5zODjtvPoFAv9+x/Elk6zLMvbKYoZ
         IG/ij8ew5R4APmhQtS5UCqfgrJqSJRhD68PwZdjFgL2/O+EbAlwfyS2sF6GZrtRQxAf+
         az3yzGjcUWL1X5vxB+U2ablMkDyyT+2rRO4JVryczouXaNjqq6qU7EXffpuB+OoTnp0z
         2LDuW8d8gAIWEfCo7QLKUR28TIZrcw8nEyO89N6Om7hywzi7DmmHauzBpMvVWbPMK0mt
         n1k1he0R2A+Mvq9yXw+4WWt7e3NdIFB+U2jZQ1TjSDu5xF0edTMuiHYgczAfKOCzyuSp
         I1Jw==
X-Gm-Message-State: AOJu0YyTjG6+f53z2ordp4MJy5gF8NZlQRz9c5IvyLUvApySXN4fhOej
	3pNbTiLg8c9G5x78/+BSfRdvU/rZQslak9urTaPhn/56oDR3jB2HpFfbMTurmnc=
X-Google-Smtp-Source: AGHT+IHBulF9/MtUC1XCakvXv6EKEIEAq2NXpaF+s/yuZHUUA7/Zf6D4PkK/xSvdNmxFGDbNqVCcyg==
X-Received: by 2002:ac2:51bb:0:b0:513:a1eb:c084 with SMTP id f27-20020ac251bb000000b00513a1ebc084mr3549174lfk.7.1710177527544;
        Mon, 11 Mar 2024 10:18:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402? ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
        by smtp.gmail.com with ESMTPSA id je1-20020a05600c1f8100b00412c1d51a0dsm9656981wmb.45.2024.03.11.10.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 10:18:47 -0700 (PDT)
Message-ID: <e2885cdd-f8d8-4517-9769-0eab23af342c@linaro.org>
Date: Mon, 11 Mar 2024 18:18:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 0/7] soc: qcom: add in-kernel pd-mapper implementation
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2024 16:34, Dmitry Baryshkov wrote:
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
> 
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
> 
> However this configuration is largely static and common between
> different platforms. Provide in-kernel service implementing static
> per-platform data.
> 
> NOTE: this is an RFC / RFT, the domain mapping data might be inaccurate
> (especially for SM6xxx and SC7xxx platforms), which is reflected by
> several TODO and FIXME comments in the code.
> 
> --
> 2.39.2
> 
> ---
> Changes in v4:
> - Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
> - Added configuration for sm6350 (Thanks to Luca)
> - Removed RFC tag (Konrad)
> - Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org
> 
> Changes in RFC v3:
> - Send start / stop notifications when PD-mapper domain list is changed
> - Reworked the way PD-mapper treats protection domains, register all of
>    them in a single batch
> - Added SC7180 domains configuration based on TCL Book 14 GO
> - Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org
> 
> Changes in RFC v2:
> - Swapped num_domains / domains (Konrad)
> - Fixed an issue with battery not working on sc8280xp
> - Added missing configuration for QCS404
> 
> ---
> Dmitry Baryshkov (7):
>        soc: qcom: pdr: protect locator_addr with the main mutex
>        soc: qcom: qmi: add a way to remove running service
>        soc: qcom: add pd-mapper implementation
>        remoteproc: qcom: pas: correct data indentation
>        remoteproc: qcom: adsp: add configuration for in-kernel pdm
>        remoteproc: qcom: mss: add configuration for in-kernel pdm
>        remoteproc: qcom: pas: add configuration for in-kernel pdm
> 
>   drivers/remoteproc/Kconfig          |   3 +
>   drivers/remoteproc/qcom_q6v5_adsp.c |  82 +++++-
>   drivers/remoteproc/qcom_q6v5_mss.c  |  80 +++++-
>   drivers/remoteproc/qcom_q6v5_pas.c  | 502 ++++++++++++++++++++++++++++++------
>   drivers/soc/qcom/Kconfig            |  10 +
>   drivers/soc/qcom/Makefile           |   2 +
>   drivers/soc/qcom/pdr_interface.c    |   6 +-
>   drivers/soc/qcom/qcom_pdm.c         | 346 +++++++++++++++++++++++++
>   drivers/soc/qcom/qcom_pdm_msg.c     | 188 ++++++++++++++
>   drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
>   drivers/soc/qcom/qmi_interface.c    |  67 +++++
>   include/linux/soc/qcom/pd_mapper.h  |  39 +++
>   include/linux/soc/qcom/qmi.h        |   2 +
>   13 files changed, 1302 insertions(+), 91 deletions(-)
> ---
> base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
> change-id: 20240301-qcom-pd-mapper-e12d622d4ad0
> 
> Best regards,


With:
=================><===============================================
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ba53df7ea30e..1cfc52d5247b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -909,6 +909,13 @@ static const struct qcom_pdm_domain_data *sm8350_adsp_domains[] = {
  	&adsp_charger_pd,
  };

+static const struct qcom_pdm_domain_data *sm8550_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_sensor_pd,
+	&adsp_root_pd,
+	&adsp_charger_pd,
+};
+
  static const struct qcom_pdm_domain_data cdsp_root_pd = {
  	.domain = "msm/cdsp/root_pd",
  	.instance_id = 76,
@@ -1477,8 +1484,8 @@ static const struct adsp_data sm8550_adsp_resource = {
  	.ssr_name = "lpass",
  	.sysmon_name = "adsp",
  	.ssctl_id = 0x14,
-	.domains = sm8350_adsp_domains,
-	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
+	.domains = sm8550_adsp_domains,
+	.num_domains = ARRAY_SIZE(sm8550_adsp_domains),
  };

  static const struct adsp_data sm8550_cdsp_resource = {
=================><===============================================

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Thanks,
Neil


