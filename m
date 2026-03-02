Return-Path: <linux-arm-msm+bounces-94823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGMPNZVbpWlc+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:42:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3621D5B24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFEBE3007B80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F0D38E106;
	Mon,  2 Mar 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhcWPqFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A92DB787
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444563; cv=none; b=iipQizkFs5SjJKE9+gz09UVcZxAbj+xZTMXtPNtWnKAw7GrmdKFaJV7Q4aoPN4KqLECAU2uE6xkAdGB1E5XfF/GVu+HSxsvfRbQNVMLqzwKo4PiwZepQ+UzVUWTGZ2eUVJ9iL2m4D4kny26WWKjvspFMu8pLncJi5AvopAYrVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444563; c=relaxed/simple;
	bh=bPzVi9N69hOaQrGvx6uQEKHmFC+D+3tMRoAwvPYQQ38=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DKqsi4kWF5sBPulZGldroXJSPUJ8mX/jT/WgNDm8NBnFUCzYESrN2vWvQVYJ2W72+LrkwPIwKPM/iZbjl6wx7uan8O1kjXH505gtGemWNSV4ILDtyb4ZZFPKJbzHYdKsXSfhk3b6UOD/M8Q3+RHy7AU1TcWnrZ8Gop+sc+IrTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhcWPqFf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4837584120eso29728935e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772444560; x=1773049360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUMi2IrbtLUuCYJGmkwxz9kL36i5bFYXjmXqzSFVtBU=;
        b=lhcWPqFfe3G9b3UVTesB4YnQU/UIrvD1kpngG5SkMG6bgwnnNYe728EFFROaWS2L3r
         PHfyy6avOrFgsEWTzXhrSgFe7phUI93gRPlzER1ufMKA7wyre/nXg30cvKE94wMO0S+7
         ZP3JN+GhMC2KJHNx9E2uchwWLvKmTht2AVkiyVaXTEG/11iNDiI+hh/thpvcEv2Lyso4
         GavmAl89LF35PCQ4SBOAknQkphSig19u5O8mCOTo++/aquuItkSBOamqSZK6l62AQaRq
         CTQU+nHSCjblsi71gx3jCTHsGkD4DvkarxJoV6FrcumedoA5NgVmVSzkv8op0eDMghBR
         ms5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444560; x=1773049360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUMi2IrbtLUuCYJGmkwxz9kL36i5bFYXjmXqzSFVtBU=;
        b=jBmGSHJtpiejD53eMyfxobdlU6S+11Fb6Qtn/eWggMQjwf+aeMtsEoif+SwBkwxeus
         qRSvMMiY5ITCdXytV1tTuCTvIjWWM/ZLDSAu0gLNqmZqP4I0FQ2RaXmuiZX4r36sZ7nA
         p/ZjNbs/wPoULJGUCBG9+pfWO+yqcklUt4+01Yn9bEa2GUYbWAADXDpjpm+wyh2ClDZ2
         MF3oBQ3ffs9f71V7K/ZgOFD/A/DNG8XN3ioanx2n395DvCfYdU0crHOo2R2VZeLvsHNk
         5gi95L8RJdTsUcCb9ZsgRW+g+kByeDVAJJuodRvK5wETqMgEha4EU5UMp1SFdr20SEdI
         7ucg==
X-Gm-Message-State: AOJu0YyyjTqHJLLCHO32P4yo8RqXeozKvKZqstbRKdlIyVUXEyqnLJX0
	zP9u55Jd4bskJDXZR6ki3LhdZLu0gQE/RIZQXoqgQrL7k8zCYNIgOPMjL69oNVm4koc=
X-Gm-Gg: ATEYQzx3+HFyYDS+k01NcZeOwdIRZ+pmz/E4Dsbp04dlfsbVTK8N7wnMhT5p3gOWnzv
	wWUDkBUYv/Gtfg+AFTPStSY4zlhii5bLG6wRceoab9IrYSXPQFiBff91wHWCs8rJP36Un1YiEcW
	9iWYccwl5NDbKu9eDtwpdTr1tVaor0TA/i8MfHQlLIM9o7rClXlRc/mXt54nSYo+DzLjHdv+QyY
	E5oNADlIgZ3XDpxSxDMNCIKFkFE3zi2+PpItmLzJxW6n4kwk5r0bfRi+cOWKaS1HidPwT3NNCWd
	mXNpwElvpmVEC4e9Ywf/H5L+qyg5llVcmWxCzZ6V307osWkJQ/80pj9AviBqNtXXr8a3ZDqfCny
	VI4NV/cGEtz88z+weZlrL9p/UGPyuLs++2s6Bde8ry7ePMuYdawKvw5HX8NEPBxN7c6gIyNEXnM
	asHjgRsZ0a1W+IWIeRWbfWk5EpAG7E2AponMgZElay7vylqBKhuMPawcoiRrcin0ROLW80zhLK3
	Njy
X-Received: by 2002:a05:600c:458b:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-483c9bdb6a8mr181505995e9.30.1772444559823;
        Mon, 02 Mar 2026 01:42:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c342:61e:309c:3478? ([2a01:e0a:106d:1080:c342:61e:309c:3478])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm417033065e9.7.2026.03.02.01.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:42:39 -0800 (PST)
Message-ID: <17f652e8-1c7a-4578-bd81-5305234cbe52@linaro.org>
Date: Mon, 2 Mar 2026 10:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] phy: qcom: m31-eusb2: Make USB repeater optional
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94823-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 7B3621D5B24
X-Rspamd-Action: no action

On 3/2/26 09:34, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> A repeater is not required for the PHY to function. On systems with
> multiple PHY instances connected to a multi-port controller, some PHYs
> may be unconnected. All PHYs must still probe successfully even without
> attached repeaters, otherwise the controller probe fails.
> 
> So make it optional.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [abel.vesa@oss.qualcomm.com: commit re-worded to reflect actual reason]
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> This has been sent initially by Wesley here:
> https://lore.kernel.org/all/20250920032108.242643-10-wesley.cheng@oss.qualcomm.com/
> 
> This is still needed, but for a different reason, so re-worded the
> commit message to reflect why.
> ---
> Changes in v2:
> - Picked up Bjorn's and Dmitry's R-b tags.
> - Fixed the subject line, as Bjorn suggested.
> - Link to v1: https://patch.msgid.link/20260227-phy-qcom-m31-eusb2-make-repeater-optional-v1-1-07a086bbaba4@oss.qualcomm.com
> ---
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 95cd3175926d..70a81ab2482f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>   
>   	phy_set_drvdata(phy->phy, phy);
>   
> -	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	phy->repeater = devm_phy_optional_get(dev, NULL);
>   	if (IS_ERR(phy->repeater))
>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>   				     "failed to get repeater\n");
> 
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354
> 
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

