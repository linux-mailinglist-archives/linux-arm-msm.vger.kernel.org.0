Return-Path: <linux-arm-msm+bounces-62020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87066AE3A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38AB018925E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C126E23505D;
	Mon, 23 Jun 2025 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="en7Qduot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB7BE5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670973; cv=none; b=rWK9jRyaEJOfc/Zo2jw4AE2D6sTsT5JhbZyUtnMWEf+BkI+ej6AOAfLZEPyWVPuoeK5QYK0jTLdey4ogjSSkskf0nyhExPFyS8FQc5ua9Doq3nEeJ+J2zO+pGyJkz2Z9v/n0REjgSueANQy7OMi5w1hjSgqGxrFYLWrTj4Fm6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670973; c=relaxed/simple;
	bh=gWBYYt3JyPGqXwQhPrQUDRDbOAcqv1i29+9fe8OwQBU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kz4aSGWEKLR31xVUrn70xWYfThrTXYb9bZjoCDyUUD78s1uGJxAamep1ZGkP5ODQlWJgok/Y5tM6/YYlXq+h403CqKTltUL/P6j3JANHdHGToQPxRQvpB51yCP7vyPDFHG1/YKeVyx2GJ0GvmGSWX/qTQ62K4LiQtTZTHLkolKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=en7Qduot; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2102161f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 02:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750670970; x=1751275770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngj5t8GmH+4FFdD077aU6bifO5t19kqmO5djN9tFe9Q=;
        b=en7QduotSQa+FQCqMFzdLMTpbH4oam1Q516ZnB+/7aP31fRLJRuR+5ppWJ3CuXV9AO
         P5SZTa3KYZHd0w8cLFNV5fb08X+ra1WdhNqhFMeto4R7xQ8DNBZPwx1IGoJYz8XKDnl2
         xAcmQoH2C5SQIDk3iGLcbjuPmN1H9WWFiaVyffjxhSOqWd3Kgd3+lueGT3D54+i4+jFk
         m5zEABBlUAFysNwRUdNwYGeafeGv73MyJmhZdeuCl2jSCQK9bUnBPMXh9ixveqIupbYN
         D0o7QyPPs0cuEW1PL15McbV6C6M+yTF2d/VoIH7tkXgn7Tv/3mQGMg+y+tBI1IsrR/RZ
         /56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670970; x=1751275770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ngj5t8GmH+4FFdD077aU6bifO5t19kqmO5djN9tFe9Q=;
        b=IycHDZIeH3ytLwM7UtuN2nMpCmT5jPnDUHmgfDbGXxA49fNGbHBJC2qd1GJhGI4gUZ
         8AnhltjOUiz8VDoKWruccM4aSedERIdBG/nIBV1MrwLgywZU5IVkCnxcjJ1tb65/7IbY
         Jp0mtuNOLfqDsPmXy1hCtDw0pLE+ejs0/JyYQhO5i5dbzf3LCcD1B6xRFqOrxxLWOrSA
         QZ/z3PBEBU/XQNH+qqbo37TRx1QXVXY4hNpThvj0o6Z3DsMOiWb70OQzMXsYbmaURmce
         dqYXzcX5EwDuJRR6raiaWaYUwld86pI1arqWDC6FV7nyiYns2lNcphvZAaLKbkdZ/RGL
         ybTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSRET8W/9Vpo2uVMkao0ILpL/leksrfqcyd/WVtB0t02q1ZGqZZlPh9PwgBNfCcKbJlNlAVXXhyhk9iR79@vger.kernel.org
X-Gm-Message-State: AOJu0YxvY+XQF/uOVJtZr9d3CkgbEL7Ifa5xVxXVFT+Bgn3lkuz8KBf+
	KFAhqwyKOhO7O50bD+YPWHTjKVta7LmM7IJM/goUMOXUsn9SNxbc1L673m0FXU/V5cY=
X-Gm-Gg: ASbGncvWbStTygDAJRKlyDJDbT2x5Dc+YtuJuB/YlxncAIpjiuXS2AX2Guni+gpo0zT
	jlM1EobgQ+oRRtUddAj8ZV/SeIlwE5VEIMIiG3KFnokcK8hnIbnJkhR24ff2hi9sENBHztwJtXp
	Oqp2LiquBI8Yxx1B73uVRh+f5wsN+tv58mtrvyztGoCir3Pig7QcFEmrWj+mFGSxmsnf9Yb/298
	FzuHQwNFx4AsapFyWyf1HmxVhMEjvdqzugIjoL+/u9uitxS4F32KehbMaD1XTuCHFhtr79KW4PI
	ubKfLIQAAxPoGBM4iHasmZzrDpIbihAOs2TxsbS7KaMBBebHfNB3ISp2/vewyI7xeqMpMSt6BiH
	eT5vKwMFYDxowsnn9KrSYAMK4LgU6lJYUhMvgeLw=
X-Google-Smtp-Source: AGHT+IHF+D87onURXNuEEXHTNh3PSlTp/JQAyp5NPzUUIc3TTJY2D/Svq407zxyr/iTy0RiaztXs3g==
X-Received: by 2002:a05:6000:1448:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3a6d12fb2dfmr9621702f8f.7.1750670970012;
        Mon, 23 Jun 2025 02:29:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18a29sm9069070f8f.36.2025.06.23.02.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:29:29 -0700 (PDT)
Message-ID: <9ff883f4-e7cc-4b2c-8f12-f583ef5182d0@linaro.org>
Date: Mon, 23 Jun 2025 11:29:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/9] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 16:23, Vladimir Zapolskiy wrote:
> Since a few called V4L2 functions operate with fwnode arguments the change
> from OF device nodes to fwnodes brings a simplification to the code.
> 
> Because camss_probe() as the single caller of camss_of_parse_endpoint_node()
> has no need to know a number of async registered remote devices, it makes
> sense to remove the related computation from it. In addition there is no
> reason to check for a OF device availability on CAMSS side, the check is
> useless as the always passed one.

I think you should explain why it's useless, TBH I'm not even sure why it's
not necessary. What if we set the remote endpoint as disabled, this is
a regression, no ?

Why not replace it with  fwnode_device_is_available() and remove it in another
patch really explaining why it's useless ?

Neil

> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 52 ++++++++++-------------
>   1 file changed, 23 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 39c5472f4552..d4745fb21152 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2973,16 +2973,16 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>   };
>   
>   /*
> - * camss_of_parse_endpoint_node - Parse port endpoint node
> - * @dev: Device
> - * @node: Device node to be parsed
> + * camss_parse_endpoint_node - Parse port endpoint node
> + * @dev: CAMSS device
> + * @ep: Device endpoint to be parsed
>    * @csd: Parsed data from port endpoint node
>    *
>    * Return 0 on success or a negative error code on failure
>    */
> -static int camss_of_parse_endpoint_node(struct device *dev,
> -					struct device_node *node,
> -					struct camss_async_subdev *csd)
> +static int camss_parse_endpoint_node(struct device *dev,
> +				     struct fwnode_handle *ep,
> +				     struct camss_async_subdev *csd)
>   {
>   	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>   	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -2990,7 +2990,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>   	unsigned int i;
>   	int ret;
>   
> -	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>   	if (ret)
>   		return ret;
>   
> @@ -3025,52 +3025,46 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>   }
>   
>   /*
> - * camss_of_parse_ports - Parse ports node
> - * @dev: Device
> - * @notifier: v4l2_device notifier data
> + * camss_parse_ports - Parse ports node
> + * @dev: CAMSS device
>    *
> - * Return number of "port" nodes found in "ports" node
> + * Return 0 on success or a negative error code on failure
>    */
> -static int camss_of_parse_ports(struct camss *camss)
> +static int camss_parse_ports(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> -	struct device_node *node = NULL;
> -	struct device_node *remote = NULL;
> -	int ret, num_subdevs = 0;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	int ret;
>   
> -	for_each_endpoint_of_node(dev->of_node, node) {
> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
>   		struct camss_async_subdev *csd;
> +		struct fwnode_handle *remote;
>   
> -		if (!of_device_is_available(node))
> -			continue;
> -
> -		remote = of_graph_get_remote_port_parent(node);
> +		remote = fwnode_graph_get_remote_port_parent(ep);
>   		if (!remote) {
>   			dev_err(dev, "Cannot get remote parent\n");
>   			ret = -EINVAL;
>   			goto err_cleanup;
>   		}
>   
> -		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
> -					       of_fwnode_handle(remote),
> +		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
>   					       struct camss_async_subdev);
> -		of_node_put(remote);
> +		fwnode_handle_put(remote);
>   		if (IS_ERR(csd)) {
>   			ret = PTR_ERR(csd);
>   			goto err_cleanup;
>   		}
>   
> -		ret = camss_of_parse_endpoint_node(dev, node, csd);
> +		ret = camss_parse_endpoint_node(dev, ep, csd);
>   		if (ret < 0)
>   			goto err_cleanup;
> -
> -		num_subdevs++;
>   	}
>   
> -	return num_subdevs;
> +	return 0;
>   
>   err_cleanup:
> -	of_node_put(node);
> +	fwnode_handle_put(ep);
> +
>   	return ret;
>   }
>   
> @@ -3626,7 +3620,7 @@ static int camss_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> -	ret = camss_of_parse_ports(camss);
> +	ret = camss_parse_ports(camss);
>   	if (ret < 0)
>   		goto err_v4l2_device_unregister;
>   


