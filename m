Return-Path: <linux-arm-msm+bounces-35252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B69DE9A6922
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D76C11C20EDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BDD1F585A;
	Mon, 21 Oct 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSLIpA55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE31E285E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515168; cv=none; b=gxLd9zeZjBXugTyoSj4T+IX8T5AZArB61cg2N6FSBTWwjGI6TC+GafyEl6Nk/nzUNIIZtCAaWgbt+U/06ospEPyhTH22HtOlXKds5fm1duqhN/rrfubKqWbW4IikD8qj8wv/GfsEUjouPet6GutVvL58nq0AbqmeKqheLeYatXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515168; c=relaxed/simple;
	bh=MY5fYwUCBRuniFqKqOjJ4DfVUGrL6/4V5OoAWNyQ7pM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nyFo4XjKNOxhE3NjIZFs+X9+eoI2A/4i+vZrEGqcgjF4R6HoY1uATeG02yl86j4u5F+TaU+E+966tfXLgQ/SwUK8JJ5/6oDzZgf0wfL7/X6ah+bErGwUqG3QE+mb3d62WUFxDYdoRUkGRnZNQu3iiTo1ovw/7BmXR66bl8GsZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSLIpA55; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d462c91a9so3208777f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729515163; x=1730119963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mp6dlkVEus/qZOdPDwygEZpObCAkg06JLdsdxVS/NJU=;
        b=KSLIpA55Cr0oG572UXk1EE2JlDHg95Cqdo8SNBsuvwob8YqG0cpA4WUjhBmJSqV0yt
         oSp/yMFI4xJlFFquCBUKpla924KTFhg5SwyKaujH1aXEzGrEn8ptPjkWCeFJ9wfi5GJ1
         fx0NXznWvGM8h+/RBvRALM74OePxhwAcPxPZvrMyMMkV4ys3iVWHd8BCZl8E5zRe55EZ
         H4Wlb/mc9gb2uFW4aq9ItkTh/9Gs/ly+piYwq7q8LxQDSestKCuxAdHpiazFO+ik9EcR
         rbTQzRO++zf951FxdmJzykiiXbXPYhnHbGK/Bw0e2NJQ8lXEr2XGbkrz+Jdte3fKu8XZ
         8i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515163; x=1730119963;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mp6dlkVEus/qZOdPDwygEZpObCAkg06JLdsdxVS/NJU=;
        b=UrZ4DEJZmJByEp/gnRD5QxeYvdMNQUigzPdLqGV0/aum2R+jNhUaD+4bpCStYKt7ja
         fHGKdlKQv305noEkJGgQSIYwpXu202m+BXDjS5/4k9CdSnGYDlABJmvpQVklbBRKYRkL
         nYwn/ZAVzhudJ65hO723d1/3GkBix+4vl8IliGuiE/4rUCjb9WcTOP2/I5aV9pCbxybi
         aMJ9rMgxhxtt6k5x+6HBlBolwfkQlHSDCDEaHgtz3DGhguY+P251c0z6/+QDs7zp3JTc
         JcRPEw2aoA2xtO31/ycbLPX9NiG7ykFz3p9wijNghbf4P3ArsdcfB8zS7UMelpX9elnU
         J7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUz9Zv5cA10vBLzkdRrQlxOD5Duhvw2HTe2dFpXuXB0w9fui7hLwYU40eV9pj6qpGn8kobPtFH7/u/zejuT@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+KNlad+Fy3tYjt/nGMuGynDuwik61QhXv65PZ97K/KMPumvi
	yb4Fo96exvU8UMMEbwtaUTbLBgrPu0h/Gq93yRtBDgRh2PJyO7r0icIE76nXxdQ=
X-Google-Smtp-Source: AGHT+IEadmofmR9Rq/iPCc5yC9ZMeiLblSahY9TR4jKE+cbxqu0jWuDxCJDdr/WnWZzH+50XpPSDww==
X-Received: by 2002:adf:e441:0:b0:37d:387b:f080 with SMTP id ffacd0b85a97d-37eab4ee4a0mr6435301f8f.15.1729515163088;
        Mon, 21 Oct 2024 05:52:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f580069sm56388515e9.14.2024.10.21.05.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 05:52:42 -0700 (PDT)
Message-ID: <50f17eab-314e-42cf-92cb-8ec31e30434e@linaro.org>
Date: Mon, 21 Oct 2024 14:52:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Set orientation as none when
 connector is unplugged
To: Abel Vesa <abel.vesa@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>
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
In-Reply-To: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2024 18:01, Abel Vesa wrote:
> Currently, the ucsi glink client is only reporting orientation normal or
> reversed, based on the level of the gpio. On unplug, it defaults to
> orientation normal instead of none. This confuses some of the orientation
> switches drivers as they might rely on orientation none in order to
> configure the HW in some sort of safe mode. So propagate the orientation
> none instead when the connector status flags says cable is disconnected.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi_glink.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 3e4d88ab338e50d4265df15fc960907c36675282..b3bc02e4b0427a894c5b5df470af47433145243e 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -185,6 +185,11 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
>   	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
>   	int orientation;
>   
> +	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
> +		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
> +		return;
> +	}
> +
>   	if (con->num >= PMIC_GLINK_MAX_PORTS ||
>   	    !ucsi->port_orientation[con->num - 1])
>   		return;
> 
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20241017-usb-typec-ucsi-glink-add-orientation-none-73f1f2522999
> 
> Best regards,

Looks safe with phy-qcom-qmp-combo/wcd939x-usbss/fsa4480/nb7vpq904m

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

