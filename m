Return-Path: <linux-arm-msm+bounces-57170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD916AAE3E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53045506D01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC1828A1E5;
	Wed,  7 May 2025 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhPIAGv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A9289833
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630438; cv=none; b=cw3/GmeFfVznn+dMjXLKZ74KuAHgCq9zdyQ47qsOWysMVrxoVwrh+vgDb3n3sZAW8tKGEWQ0uR1W9b1Qcd1WC8YJHEdyOHh7IPPCvNYb0kbc2TL8tNz8ipHnpjAxyrzJf+SQYZRL37nxaNfdi+syO2aETN1/8nKhdUKlFMH5lTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630438; c=relaxed/simple;
	bh=pz8ye5e7M9XObP3UChOTHfnACy3PA0Ye6tCjNjm3k0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKjTKFrMNv+ez4Yns54CRB4hd/QkL3Jab01/B5Q15LsZQOYjC/8w5HRoLoOc4+Vs/GiReS/Ns9Das43/QIBNf6KfhuxtSwefvRYUJvfVAEoP4dUyACl5aWf+ne6Zy9f5eFdjpp/9IHppgp9tLxQDv/Q9WLiM49U6O68C/pYdWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhPIAGv+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so65422965e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746630434; x=1747235234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0SsKd1Kg0MlyI8m8KzDXP/8dIexMnrpuvni7IgTwUM=;
        b=IhPIAGv+BadjeIGmE9UfOxWFUkWWVew1DM+20lDkEAPyw3bPsgAJfHPxdVoWUSxdrZ
         1+JvoTl+WdxMeZtbjCcWLAgldPnfORMZRGmk9VVPzfRI4+HM5+o8uopsh1QptYe0EXYH
         URwlTiNVsWkZmQ+jeA/VeM8bMWBt6RmwOy0o/LGslUGEDOJnhbsrsh+w1JHiB/NfAmiO
         cb1KKERXfe2WOxvU8sIF3BknVc/F6V/+Ui76l2yfmZCdOusXC1fEO0fhrvoRZJQOvamC
         qlLOCbkTNsms/P19BVxtFCfkNqttMzy3iPoXyukpTDW4cH70OQeESqe5mI9NbjnCBGJZ
         6r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630434; x=1747235234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SsKd1Kg0MlyI8m8KzDXP/8dIexMnrpuvni7IgTwUM=;
        b=F2P4Mh73Zkru+KjRi2TaWY8JnqEbuVFjmmztDtDLselfmT4cmxY/dRLrHMi+0XMPUQ
         4WvARifK9uUQG5lzB2JkaSNNHMeNqLgc2/I6N3GYhoSw0r0g9wxArkIsDbF/lV3sx9oX
         10l8YyGy0rq/bcvfEnsVY9Jnuk7DRwNJawWSp40PLpFYyKDrm+frr+p0FEfzgDoTM45t
         TsYaQs4tam3Ez6OlPVSrFwqUFTsXTyrCISbumJ/TGY0iyTyUJzeZHpjqaSxruF62k4xZ
         fYv9li9rcLCGXuXD3ct90beQuvVv1KgdbGXcz+EHcSAkU+vJBSbriLB5w/h9cxa8CnDM
         4xvA==
X-Forwarded-Encrypted: i=1; AJvYcCWwCZKPuG864YsRfZn3MxK/nmydW7bM2zn7tsWwmOLDiW2ArmFbux64+Xn53NuV2qmrQ2OObOmXb2tS8cc8@vger.kernel.org
X-Gm-Message-State: AOJu0YxI48Q5Yb0ZsqgIh1ipEq74AREWRt3eTv0RZ4EF6XeUUZYc/uoG
	OBebw6tjBXRp6XglxOnLHutzcN2KW0U6hhN7HAKLNSSJjmr7YqrVyq8dcDJXV4M=
X-Gm-Gg: ASbGncsTotl/pgZlrdB3uEv6afT0Zy3jde1yZ7aKqWaozZR3hV+RExt/2lKF955D6w+
	Wz5Oh/VsuKbjZVPS8BLUwtdOBMpMRuWBygHF3BTEt21U0VUn9cLtH5mXh7emu7dxmBNUudRjZlW
	KummFvEDGGD3i2GefbzFAwivWYrxhEmx9mInM9sMoSsdkV/SQH2SlQdGFs2DNyISWpsl9SD12Tx
	nXgxeRRPwd3h2+Vme2KuYhmLSpSfX1mjDkfUl1lmF2/+AjnSiNybz2V1DxIcUBLw9rxTZeJC7WS
	/oX384RghxygnigLMUkUklnAcz/nX0QcNnuDS7gdjPWIYIxOCrVzVuSA+Y7CgNZvhHQmQcbMP33
	ydRiuaw==
X-Google-Smtp-Source: AGHT+IFe/RN371zSOT3geyllQKE/3rmj0Va8MGOVysneZBCiRZTbhKgyS/SuJAtLvsGkoEeFtxE4JQ==
X-Received: by 2002:a05:600c:1384:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-441d44bc67dmr36585625e9.3.1746630434334;
        Wed, 07 May 2025 08:07:14 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7caasm17416290f8f.54.2025.05.07.08.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:07:13 -0700 (PDT)
Message-ID: <dae06ff6-afd9-46a4-bd37-25bb367ba545@linaro.org>
Date: Wed, 7 May 2025 16:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/25] media: iris: Skip destroying internal buffer if
 not dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
 <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 08:39, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> Also, make sure that all buffers are released during streamoff.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

I'll take your word for it on firmware respecting the software contract 
on close() wrt to DMA - however I think you should split this patch into 
two separate patches along the lines of the "also" in your commit log.

1. Skip destroying buffers for QUEUED flag
2. Make sure all buffers are released during stream off

These are two separate fixes IMO.

---
bod

