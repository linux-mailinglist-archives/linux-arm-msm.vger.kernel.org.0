Return-Path: <linux-arm-msm+bounces-63863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE10AFA6B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 19:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D88B1189AC93
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D05C28F930;
	Sun,  6 Jul 2025 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="KaE/xcLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2B2882A9;
	Sun,  6 Jul 2025 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751821777; cv=none; b=f3SC0jY9D9IgFF+CjZiEasM3XkDtC4B68naslVWHxdupHD3YGVoKEhv69Oap5IwARZs5QsdCR2235qPY+Tgzsy5tawN6yWWmt0HR7PLa8eLgsVrYdMcKbU2DYH5FSGr2cPfZubP7z8zegTOGPk8P7oQzFglmppBsCb2lQ+Fbr+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751821777; c=relaxed/simple;
	bh=Hc4ngSAjDssjvAcpzFrGEHUpIrfzVejNbQxf7kJLeqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SN9VXf1ajYC6mtO2yBvpwX866GGTZ2A+1i7nK73mqrwED5we/LHltBCm3ZjagW09JHxtkW+JGVbbc1nQakBqHOLKn6dFPEoJ7MypOA+H17HJW9xHFWove7A5SVeR6j/GBjVaC63siPQFfHnckWAdKxgN7pIFEVg/aox23HhmNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=KaE/xcLE; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751821771; bh=Hc4ngSAjDssjvAcpzFrGEHUpIrfzVejNbQxf7kJLeqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KaE/xcLEy7F6wmsYESlPyLsMMBqyc+zSMbYp4TzDG0WqBRQUUit+2lNC1G9MQV6dS
	 r1oY1p0u6hoc40cyScpu7EwmFGYZfkQyWPl8G8gVbbkhAesQx9PR4FWD6MczYzJIVH
	 Ctpu5CUCA8hbilzYynuULPM4Gffjh52IahsBNtjE=
Message-ID: <a1f18aa8-7650-4009-a874-d1d6c69e334d@lucaweiss.eu>
Date: Sun, 6 Jul 2025 19:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_mss: support loading MBN file on
 msm8974
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-07-2025 4:47 p.m., Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> On MSM8974 / APQ8074, MSM8226 and MSM8926 the MSS requires loading raw
> MBA image instead of the ELF file. Skip the ELF headers if mba.mbn was
> specified as the firmware image.

Appears to work on my msm8974pro-fairphone-fp2!

Tested-by: Luca Weiss <luca@lucaweiss.eu> # msm8974pro-fairphone-fp2

[  175.530764] remoteproc remoteproc1: powering up fc880000.remoteproc
[  175.544439] remoteproc remoteproc1: Booting fw image mba.mbn, size 299792
[  177.707706] qcom-q6v5-mss fc880000.remoteproc: MBA booted without 
debug policy, loading mpss
[  180.375633] remoteproc remoteproc1: remote processor 
fc880000.remoteproc is now up
[  180.841751] wwan wwan0: port wwan0at0 attached
[  180.846972] wwan wwan0: port wwan0at1 attached
[  181.004199] wwan wwan0: port wwan0qmi0 attached
(this is with 'firmware-name = "mba.mbn", "modem.mbn";')

I can also test on other MSM8974 devices and MSM8926 if you think that's 
useful.

Regards
Luca

> 
> Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Expanded to cover MSM8226 and MSM8926.
> - Link to v3: https://lore.kernel.org/r/20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com
> 
> Changes in v3:
> - Reverted back to the simple patch from v1
> - Added define for 0x1000 (Konrad)
> - Added MBA firmware size check
> - Corrected the Fixes tag to point to the commit adding firmware-name
>    support
> - Link to v2: https://lore.kernel.org/r/20230508153524.2371795-1-dmitry.baryshkov@linaro.org
> 
> Changes in v2:
> - Replace fixed offset 0x1000 with the value obtained from ELF headers
> - Implement ELF validity checks
> - Link to v1: https://lore.kernel.org/r/20230507172041.2320279-1-dmitry.baryshkov@linaro.org
> ---
>   drivers/remoteproc/qcom_q6v5_mss.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0c0199fb0e68d6286f1e238d110539554d1d5f14..636f00d481ea80508fc9db28d8e2e225ea52372c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -498,6 +498,8 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc, void *mba_region)
>   	release_firmware(dp_fw);
>   }
>   
> +#define MSM8974_B00_OFFSET 0x1000
> +
>   static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>   {
>   	struct q6v5 *qproc = rproc->priv;
> @@ -516,7 +518,16 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>   		return -EBUSY;
>   	}
>   
> -	memcpy(mba_region, fw->data, fw->size);
> +	if ((qproc->version == MSS_MSM8974 ||
> +	     qproc->version == MSS_MSM8226 ||
> +	     qproc->version == MSS_MSM8926) &&
> +	    fw->size > MSM8974_B00_OFFSET &&
> +	    !memcmp(fw->data, ELFMAG, SELFMAG))
> +		memcpy(mba_region,
> +		       fw->data + MSM8974_B00_OFFSET,
> +		       fw->size - MSM8974_B00_OFFSET);
> +	else
> +		memcpy(mba_region, fw->data, fw->size);
>   	q6v5_debug_policy_load(qproc, mba_region);
>   	memunmap(mba_region);
>   
> 
> ---
> base-commit: b12a9fa1c88a441daa33f15edfa3ded8cd6d3556
> change-id: 20250706-msm8974-fix-mss-e1b8e114b7e0
> 
> Best regards,


