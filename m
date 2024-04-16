Return-Path: <linux-arm-msm+bounces-17609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE58A7248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 19:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210761C21460
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 17:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8F813280C;
	Tue, 16 Apr 2024 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgF0QLxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD913328B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713288522; cv=none; b=YIXeGX7adEjA1AoAktfH3O05bJJgDVpsya0YGNqysStW+EFwIaeuGXvKaAR8pTV678Gs7ewDdIDqlH0qx5l7vlK0HHVMgPr8PjOsN8eU8RtPA0Hh/bzs1qVTM6yWJJt02Hx9uz2wVY7gJ9ZdVDsuFllnIFBEsnFcTzrbLWIrVOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713288522; c=relaxed/simple;
	bh=8XPbzCyiV/2fpDM6Skf+nUqvJTuMI/dwcR/DrTukkjE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KOSDIMddawwMIwh0HfNIENdPQjnI/CTLPe4B/sFOd/fs1il2Kyp6upS24nOUxAcwPG0qVQKizq7CIrQ6EdzKi3uAyem40b52RLA9Ib3gsAVlFmGxS+6retVTE4ZcUmU5Yj7gVXtK0i1rE28pTD+ReoOiqm+rWrjEkDgiaD82JQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgF0QLxS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2a4df5d83c7so3078420a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713288520; x=1713893320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTuR9E70nAlgpS27zTEvS3dG58ZWZq9znfhZxK8dgH8=;
        b=XgF0QLxSWJBkRaKDnbr0k3ufopsEOk1qDWNcqrma7Mt8CoamJkuwTAZy0LDUhuqLJ9
         8L4UMWd594VKRzbKD44Dy1PsyJFEMr5uyQCC8dQaqSsFTmt3FzUHQsl3RHjohagFdATN
         RJgO6atmwhONjyeEwQimUG/u+uZNL8cL/na3OCduGR8GxtnBp2QtxB5cLO8LQqAauK6r
         cir43PDLCBbNmEFCBi+3U3Rc0LGFCNaps9iU3s/gZJ4iIVkpaOY+N2hVL97YAiNFZ0ku
         prGOeUSfnU8ORbU0fhJ5GO4CMFk8DrWhODTrhUJAP5OxNWBR4t29vgKOf911r41gtJKf
         wJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713288520; x=1713893320;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zTuR9E70nAlgpS27zTEvS3dG58ZWZq9znfhZxK8dgH8=;
        b=LxjyswV1ZGmx3v7Ukq1DM0TqTOCgq/bv5ogQikJWHYJESQRtnvmWOKUp6ekLBKr7HB
         k0sPbyZTHpfQv5MH1eEJLOcCRbwT1DhThSjFe+GOsfSQLRFbAhtZj086H/zZl3eYaRj+
         YSvhJGbrtbPOac/7TKeDx4l4LesPhrAr6MD3yI6oylmHwgwPctDpnSRMzN6Aosshokp9
         KheupugjTlRa19oVPRKwhUehXF5rfZ1HJP9qT7p+iRPmsdsneoWMIx/ywJkOMauRZN7C
         v8jqBTfK6cd8Xb38cKDBCZy+Eqo3SHvBGH+HvOZMqNf4dyQTMQJzMVXqrw8qaMogPE1O
         0CsA==
X-Forwarded-Encrypted: i=1; AJvYcCVYQCKBuHdt7PhSmwwq4a5tkAiZhFAZkYs+3qTFUe2MROHyGTBmp327wF9EA4Miq3vY4WFqF4dPHWPC2KM/tdcHJsy4GLvllmQ6hon8fw==
X-Gm-Message-State: AOJu0Yxsn65VbcgetjHy+11j5lUDaLxtCOrVV5m0G8D6f6A5tjYg1tXh
	r3+w2sK+2N2ZIwVgJ8FUl+721eNusVjINPOltOJ4ve2ymBtqP6jxGzCC86TrfU8=
X-Google-Smtp-Source: AGHT+IFxfA3rNQm6U5J0p3r8Nmv4+VJasUOaU4viGZz2EHrZrD+RsVzSJM5qFCloHItvUeR4h80LJw==
X-Received: by 2002:a17:90a:8d84:b0:2aa:5c79:853c with SMTP id d4-20020a17090a8d8400b002aa5c79853cmr4465059pjo.21.1713288519972;
        Tue, 16 Apr 2024 10:28:39 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.156])
        by smtp.gmail.com with ESMTPSA id 42-20020a17090a09ad00b002a2a3aebb38sm10035010pjo.48.2024.04.16.10.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 10:28:39 -0700 (PDT)
Message-ID: <2d0a026f-a4f0-49e2-8501-358db5935e14@linaro.org>
Date: Tue, 16 Apr 2024 19:28:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/8] usb: typec: ucsi: glink: use le32 for message data
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-4-890db00877ac@linaro.org>
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
In-Reply-To: <20240416-ucsi-glink-altmode-v1-4-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2024 04:20, Dmitry Baryshkov wrote:
> The message structures as transferred by the PMIC_GLINK use le32 for
> data encoding. Correct struct accessors to follow the lead of the main
> pmic_glink.c driver.
> 
> Fixes: 62b5412b1f4a ("usb: typec: ucsi: add PMIC Glink UCSI driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 6be9d89d4a28..d029cc9d82e3 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -33,7 +33,7 @@ struct ucsi_read_buf_req_msg {
>   struct ucsi_read_buf_resp_msg {
>   	struct pmic_glink_hdr   hdr;
>   	u8                      buf[UCSI_BUF_SIZE];
> -	u32                     ret_code;
> +	__le32                  ret_code;
>   };
>   
>   struct ucsi_write_buf_req_msg {
> @@ -44,13 +44,13 @@ struct ucsi_write_buf_req_msg {
>   
>   struct ucsi_write_buf_resp_msg {
>   	struct pmic_glink_hdr   hdr;
> -	u32                     ret_code;
> +	__le32                  ret_code;
>   };
>   
>   struct ucsi_notify_ind_msg {
>   	struct pmic_glink_hdr   hdr;
> -	u32                     notification;
> -	u32                     receiver;
> +	__le32                  notification;
> +	__le32                  receiver;
>   	u32                     reserved;
>   };
>   
> @@ -255,7 +255,7 @@ static void pmic_glink_ucsi_write_ack(struct pmic_glink_ucsi *ucsi, const void *
>   	if (resp->ret_code)
>   		return;
>   
> -	ucsi->sync_val = resp->ret_code;
> +	ucsi->sync_val = le32_to_cpu(resp->ret_code);
>   	complete(&ucsi->write_ack);
>   }
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

