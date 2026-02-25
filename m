Return-Path: <linux-arm-msm+bounces-94168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNgJFmwen2lcZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:08:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E712819A425
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E98831664DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A80B3EF0AD;
	Wed, 25 Feb 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gehkr11l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED83EF0A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034055; cv=none; b=saG61JeutAMelm7jLo1euNsCgjRx16QlAj1wxblfI6TFG1ENAsWwrZ0Q89j8Lk5UuSbHZFQFkhTdKkehUnM2UE6oWNciL+tMB0bXMfjQz2tGfgDlj5Le9X7YlzqWQAzzoaGBkqGCDKR+6xLUa+rP8UOa1tG2haZgFcT4WTuWXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034055; c=relaxed/simple;
	bh=SlTw6Q3mxs5YUyePAVEH/piwUiAAVGXfWxj49nPRSns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jY3XRrE2ArsjRGg3pOkU373cxjeyg+rkM0XTsm5NWWTVCICWAZ4z2XT8DweaeolNhH9BTYQhy8pXdwyePzmtqKczXFBWwqGm9GIlcL98ceE7XLYMxgOFy0alMy7zs6Z9FpGOrNXXFOTzDyMZr9s35ryfth5qE5Q/eKO/+by0WKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gehkr11l; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43992e14638so509005f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772034052; x=1772638852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfisFREuuziHlUQm98siWP5Hc9OmqGPk3nXbgEd4S04=;
        b=Gehkr11lIGrES8oH9bnsQenTu+2rnbtnv4fumYFTWsAl6RV551ZnjRo7fTk+g8kIl5
         ONjOkkkqj0dfgTfWZIsFczxz8tMVIdt4AnuraxAbL9PgHRPI2j/EU8nWI6wOgA+XWnhS
         3fR9dZCWgcGGFWcab+Q4U9T3Q/zTV6gdr5+XjsLcI7gB1sC1kOmiDD+d4erpQtHvrTPy
         WyZ7r3RLbzbHSs3jsFT65QsPKyfmaHs3YGXD5NrK5bbLszojoKkSvMbGfc1BJ8aMS6ME
         /RMOaZ/b0+SPJ2wFyN23vkH8SgtvlOkRMEXYOfuXBsBwYICSJ3UMvT4r9W5NbzhgfG7q
         TGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772034052; x=1772638852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfisFREuuziHlUQm98siWP5Hc9OmqGPk3nXbgEd4S04=;
        b=ju0z7lWapcwceFfLoPBrQ0mF/6cm2boudkzg99QfTq8eVIdIxCh6i2irPdOS+4WCy6
         fcAEdbwx/KkEAnhdmucOZnFV54ECI2oxYDq7Qrg0eKgRujFvSWmhdRUm8cVqApd3rfwe
         LyYzCpnSKe34aqPdiO+fVieAZLAPItd0JY/n6d+v4nZiwN01zI5Aa+o5AKF1JHFKk7nF
         qvu5xhqUJoDdx2P+8n1QmwgEA0Y7ie2c+1IWJFmWuZTBBP6RkpdqVhM7FnCDHC2WQr/E
         b662a5aoYah1DUVEX/E6NtKjb+sVW5UPk49pOJvOUYol5gIBqIp+RCV4ZNk1o1AiFunv
         JIgg==
X-Gm-Message-State: AOJu0YwqUY3vyjnQMx8CXMZ1kpLG/Xo0CrlTiEngtXNJJFS0JdINEkKe
	PEm82drES7xmX97HShq+xP9HJJmmqA9UfZgebDkUYj3UQQ2BlYEQn6xZ9m11jSstQsY=
X-Gm-Gg: ATEYQzx8vEgPyobtrIuY1+FR6LvWqWTHzTMf5aPWEaZWTzsDg7ZG3tSpMokMRNF60TE
	dd324jpCh6ve5aslygOVzRtR9Z/GxGpbg8l3w+ZLqCiamvaODf444FMo/VqAFa+QWA06cNxhCMi
	opStIoQPt1sgnV6hgke8ylt8+4ofmxyVWhxjel/Mb8TudsojThtWEv0Re30Y/rlK980yocJdDNy
	84ujCIBl4YltyHj9F21v5CuQNLDTFmn9NCjH4xCvNfxYBzJNEZzRWVylGkhKZarMdIO3pBJRFgQ
	jjyj+pn5TtsxxguZj+X5zVKuZj8d9kytBEwxEcF13aSBsYbLolt0TCQGtzlByX4WsmgAq48/o6/
	jV9bEvSuwV89IiGbH50jOdhmax1+qqDYK92bifdBmjJZNn5OoPhUWRRUWAn7+CWJobURFFwB/XC
	ZlncnhwtJQUaODh6sQ1FUJ+RC0imcgcyDh7r5dnMTZkG3M3D/pqJexcx9/b1+InN7V
X-Received: by 2002:a5d:4ecb:0:b0:439:8487:73ae with SMTP id ffacd0b85a97d-43984877507mr8814768f8f.27.1772034052325;
        Wed, 25 Feb 2026 07:40:52 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439899da8dbsm11588457f8f.18.2026.02.25.07.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:40:51 -0800 (PST)
Message-ID: <11249664-38c5-4cab-998d-f715a4e0124c@linaro.org>
Date: Wed, 25 Feb 2026 15:40:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, vladimir.zapolskiy@linaro.org
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94168-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: E712819A425
X-Rspamd-Action: no action

On 25/02/2026 15:22, Loic Poulain wrote:
> +static char *print_fourcc(u32 fmt)
> +{
> +	static char code[5];
> +
> +	code[0] = (unsigned char)(fmt & 0xff);
> +	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> +	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> +	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> +	code[4] = '\0';
> +
> +	return code;
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * Video queue operations
>    */
> @@ -218,6 +231,12 @@ static int video_check_format(struct camss_video *video)
>   	if (ret < 0)
>   		return ret;
>   
> +	pr_debug("%s: format is (%ux%u %s/%up field:%u), trying (%ux%u %s/%up field:%u)",
> +		 video->vdev.name, sd_pix->width, sd_pix->height,
> +		 print_fourcc(sd_pix->pixelformat), sd_pix->num_planes, sd_pix->field,
> +		 pix->width, pix->height, print_fourcc(pix->pixelformat),

The return is static, which means there is one of them but, it gets 
returned twice.

The second call will overwrite the first..

Just use %p4cc - also please use dev_dbg(video->camss->dev, ...);

---
bod

