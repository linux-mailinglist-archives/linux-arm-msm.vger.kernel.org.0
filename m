Return-Path: <linux-arm-msm+bounces-69435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3CB28D5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 13:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DD2A2239C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 11:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09942C0F7F;
	Sat, 16 Aug 2025 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQH53KXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD6A2BDC0F
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755343294; cv=none; b=PB9Xc4zNFiZLStnWymXpCAjIsi61ebD3gOf5tPfeJW/8Y7ZgKO6sDk/j53iyIpRX4Nd3pLaWR6du5ktX7rrjvaNAuHtUnv1aYcJYwnkBlOs2dZVlwaVeJaxC27Eu/hrEN0xuL0kA4waI+J64hQa/oS8WsvMRrUy8/e8rnxIJSAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755343294; c=relaxed/simple;
	bh=e8/bKiSuQ21FHDTgfooFez7lWBHr4zsQzLoYqAy//FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7WUqOyT7Ng13x+ZBDw8SUO/sHpmG56IjKZo/QWJ09G1/3doVRAG8DGPgMbdVGfB1nN+ltiwvkqQpfDoY8aTGEcScBiQ2EZ1C0HCfo8Ydrd1jwdnrfoZTD+U0CnzpCobsyJecIANd6tRk/bFNFBZm1uTPB9XVw4MZ1c0akon1Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQH53KXK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so18442425e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755343291; x=1755948091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGt6rft36yXTfP1TQ0UxXsaJG912+AMVin/TPl3PM4I=;
        b=DQH53KXKRqO9lhGjbAvdpuVGoSh8DkSpDKwkQOvfT8NmVJT/IbVSzRZ6CdsdAXJ4HG
         NTn8Xxjx2kfR0oYBIvQth8YTJdkymXTIKwuGPK0tOwZzwCh02r/4QR/+oUv3kYIumGdb
         aHBBsfkZCfxnFFRup5118vDHttXcf4Ye6i20UyAnDbqnInvwlH37Ve6kJZFESF9lJHNK
         v77OuThf137rX2dmBYi3ZAAxHaSE6zPfpwQNlP9UaVqm15aGwJjHGTVG1BoaMKXdDofj
         McQDnuc/681ptHH5yjSwIf2OgXlJ4ArH+eAszN/rvSLoRqGmcz8zy0GFhB3PQf5sxbVx
         eH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343291; x=1755948091;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGt6rft36yXTfP1TQ0UxXsaJG912+AMVin/TPl3PM4I=;
        b=rVmh+Lk9tsqnJRgAN2DaXUrWzyrX5foDqd77usAMxeXjkkVN97uDe6RSsCe1FoER9u
         oRqeQeChUERgCWJbzKN8umNIH6B31dPDglEo0n06iLsPz94zyRYcoACMCCOSa8C8wsxo
         MWpC6qgT2/z8KOePTKAoo+k2J98q0174DgmYyrHmztrNz2XmlGFTMw0eL2TdS5wwbLsa
         cfHNvXHTLWl158RGKqMVd3IeZav6TuWRW/tbvcQ2HGfUBTsLW+WBlkO9JHlBhaTh0sGR
         2eeQh+7WnHpRkuPc843oB70cOP+30IBk/zG87GhkvIFWLENND4jtfc0y8zQsSaP74QEa
         ufaw==
X-Forwarded-Encrypted: i=1; AJvYcCV84wug8k4mrtYXtvaTKssic9ynVp5C06UU2odJW4JdaJHu5MOEIxtjpRfJFpD5NhwUUCZLtsfsbPMsmu8U@vger.kernel.org
X-Gm-Message-State: AOJu0YxGTPD4ubtp99Jzby9X9U+Xe0QGhbNrA4pWSfhPmk66x7jE2z+P
	7VorJzCPZuv55U1pk/zAtpyBjQ0omCrvp8oDZNKUTJzFg9PTV7YB4BslrIccAl97wIs=
X-Gm-Gg: ASbGncsdxshD1ww5fosflUYs2YZh2v/mwKPt57lziSCSI5Fp8BgOJp7/ISRICE1opAB
	1oBpQc7r6ZoaZp8KhNXlfyRlPicWQWPzuki0txdQkfFrhFiz1XggD0NrwVsvBiuv+zH6DcCPyxE
	LoEJSuS3Vu6r5BPKvZ5pnHYfCaSjCVMkhMue6GIlvTM7GiXF/xn148DyFthDRUe2hmDaF4g1klf
	JHtmOhL7KcVHN6tI6pRYb88HlPfKJ/TLrG04ofq+KyG2wPcmK9YdXEr11R+pbHD3InC7h1MXy78
	JD7FM4tHYd2NbClAKkZhBKKLFANHppQNnxFsYSJpBnhM0IerWHqtfVB/xG+gF77oSSuxGeYb9zb
	XHV5HHNlkmzoBgOJbowDqsLU+kJ4Z9DevUVen3QuNKcFmczMPPEujM4jVGKucqswy
X-Google-Smtp-Source: AGHT+IFCJzvwwfKnWqviGD3X3ToS1q0H0hKgUffoHpr6Y85vQdUW+rTq2liswwooI6XtG9//DSyZdw==
X-Received: by 2002:a05:600c:4e8d:b0:459:df48:3b19 with SMTP id 5b1f17b1804b1-45a21839db7mr21528315e9.18.1755343291266;
        Sat, 16 Aug 2025 04:21:31 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22210a65sm53193325e9.6.2025.08.16.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 04:21:30 -0700 (PDT)
Message-ID: <e4dd20ac-84d8-422a-95a3-4d5c77b875a0@linaro.org>
Date: Sat, 16 Aug 2025 12:21:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/24] media: iris: Add support for video encoder
 device
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-11-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-11-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:38, Dikshita Agarwal wrote:
> +	if (type == DECODER) {
> +		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret)
> +			goto err_vdev_release;
> +		core->vdev_dec = vdev;
> +	} else if (type == ENCODER) {
> +		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret)
> +			goto err_vdev_release;
> +		core->vdev_enc = vdev;
> +	} else {

A bit of duplicate reduction.

if (type == DECODER) {
	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
	core->vdev_dec = vdev;
} else if (type == ENCODER) {
	strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
	core->vdev_enc = vdev;
} else {
	ret = -EINVAL;
	goto err_vdev_release;
}

ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
if (ret)
	goto err_vdev_release;

once done

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

