Return-Path: <linux-arm-msm+bounces-94122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO/hGFv8nmm+YAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:42:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D5019847B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AED5E3029278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8D83B9614;
	Wed, 25 Feb 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNVLptyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A643B8D46
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026946; cv=none; b=PAkRuEO5RmvAmf+vMiSlow57pHRUUqA9upvjfdB3IQ3u835nl4px7s/3kywU5X191bSpej0vcVA/CipmzytpRDCtyXAVLgI9obyCKcx3106h4nXkKbKwfQCtv6NtrlTX44UXFTVbbI7JfCTow9J1ALnRgXXg9Zyp3jA1JVKfLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026946; c=relaxed/simple;
	bh=tYdjEGnz1EsZUC8A6iACOKdkEfqIBfxVguRN3pG2Qcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+HzHEy89BLqAZHu+HcHhuMDpzwIu3QdNi3XOUPEKcIskYLhS7niw/YoGr1nYJI1UlWoBiNNjWr8JWAt2VECOEer5ap0KlqpZ7SnlqIph0vRlhJ4brhYa7BXxcdO/hNbTkTkX/lQMHJIHG3VLyri9ccoE9BWKyI4j1XQHOSxi2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNVLptyJ; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-65a43a512b0so7815961a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772026943; x=1772631743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
        b=yNVLptyJpnb+yglreV+1vepyRiHjRXHdVbXezDmDD4QVNS5l3jXBM/oud+j4mntewM
         aDNGyvHc6LL83ULDaGiwNIfKWo9nwLIhx5u2jwuAFqIk3Q1ANYBbHtOIUix8WLMLnVkL
         Wa/AZ2wwxaM2RQa6hjbnxtP/j3DehXyQOqjumZI8txDrYiK6BM3IFSZyU2jrTu904QYo
         K0NeUwPnHQ9PzE2dDmL/JjzgQo4bQqSt5UIdODce0JawdFsyOHqZmcSd0MqNAwmW49Vt
         O1Ot3FpEFvz9Dy7D5vOm56aVXERfg32M4QbY5FABNr2lx0tCUPPM9hN+I6ysfNigHc5O
         Tq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026943; x=1772631743;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
        b=llsbl/2YCU9lR8pbspKTk5bNfh9QkwwgoHmMBZlb+yS+mcWIfpQ/2+f5P6dwYB0FO0
         JrxH+HMK6lqbMUD0Dhd4YU0UAIs+8qiKRM83GA6LZc2yziONN+tL7ddcVHN5pzWZvaOV
         DTQl0TWWbTV/O3cWkzOikigIBD2/Vipem+olCgTW2th1DitSZT05/k/8yxnEa21TU+T4
         Sb3564OL5o384rf7mis5R+ri8o9kCVh32rpn7OrunD7SYC6RHbmVg/PkbIPBi4Dp0rRX
         vFn95MzPIJsjKKzw7orWfiaxGRHq8/sKrL+l8/YffMEYun2ApPYWq7qHPD8FGWWv/uGH
         bWWA==
X-Forwarded-Encrypted: i=1; AJvYcCUANwL7R3TSygmbGE3TwwTSon2yGwbpxIuC8o8XiKGAlYRoCMkvKgNUo52COVwAC4eUqeg98n3ZrAapXw2+@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqBs8YWg/c6PH71jUvZeY8C9awZHAdqwfbxP6jNJ8h9JOb/3t
	I0DtHWEF5b//M6kAQmwiRDsX9FXyDAbiHcD+iDg+W4gXwk3wyZmsQbDlPNyyk9+1saY=
X-Gm-Gg: ATEYQzztDY+5G9Heu7B//To4YqKCOdlAQRCP0qbdDi1MsN0l35XuBapXu05vHJQIhbH
	IBtbexXj1eX2xl6MNXC2ieJICBTMuKALEBIcQ1TFYjPZ4j6ee72nqY7Z3g/m7I41R/yQmeBm4CT
	RSVU4IYAq0zk2oljMADfGzt/pDrMq/yqx7GvvhLLqfMNaDa6B3fwIhFUfV8vIWB1pa2xwJQ3lw8
	0+odZUXc5NXn1nHHzfSC6mwMwOdf3jd8ubFI8dCy7uIIFaSOTm2CWBiACXUr1P0UZpLuTtar/j0
	IeMNZVdU3qaAbH90txFNlBTqqpttXuOdEHw007Kmye2NDZtIbF4JQ7vk1vOi7W4be8+zZzShvXg
	apIIAMFJH5lE7IZJ2STS5gZoWXeDctYfpgRd2zmBXEvVAsA81qLBx/6suiDDPriGOZl87ouCZYc
	ZMtKW0o+5EM/VUoebnj5AQowcClD+Rop5Dljh+GOWMJ88rg0iG6y0m0C/utj+w7lD0
X-Received: by 2002:a05:6402:51cc:b0:658:b76f:da7c with SMTP id 4fb4d7f45d1cf-65ea4ed5a89mr10428013a12.13.1772026942535;
        Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba13806sm4384331a12.19.2026.02.25.05.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Message-ID: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Date: Wed, 25 Feb 2026 13:42:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-94122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06D5019847B
X-Rspamd-Action: no action

On 23/02/2026 19:08, Ekansh Gupta wrote:
> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging

What would be really nice to see would be mesa integration allowing 
convergence of the xDSP/xPU accelerator space around something like a 
standard.

See: 
https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html

---
bod

