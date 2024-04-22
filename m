Return-Path: <linux-arm-msm+bounces-18192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 746708AD1C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 18:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE6A280F12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 16:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9C915358D;
	Mon, 22 Apr 2024 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMxp9/Cb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A02153560
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713802843; cv=none; b=hC06+yjm9V+Dk9/KuhY8oyv/L6FeIOZVvxp5LPK9ZHOK/t/fsXLsFMugnMPBPeNjqzAZDd23L1cshIcpbQS206JkuHeHfQQf1AVxUG/6inG2s5ctluTyhBRAsDB3ktTO1ubHJp+YXyID/snw4R+gI2Q+q8LKoDGv/hs/gCbW+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713802843; c=relaxed/simple;
	bh=1RVmdqoNjPvhMddsjlY+Xa3pKKSVN/+WNm0VO+799Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn/g2ipEd9sybhqIDsnPhFYOIreujv/eQwWUUllkl8l9FE21N4tObIObvoPP1jxsm258eLnvIF2fAqWlYbuXJG2UC6/o7do8MdypJpEzOapsfbKAhyBOSwOlA18Ck3Iypw6/P6huWyV9WsJpCwuldb9HpBRHIVIbjCfWGuHTHWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMxp9/Cb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41a4f291f60so9096975e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713802840; x=1714407640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X18imHTv2CCCHmqGW/+6bF3p/ote05AGlg/ZRuYja/w=;
        b=qMxp9/CbAifSXDricfddLb4xc+2kKW/TS88uxuopIwdRY4SrCJtDkP9Y8H25LXKW+x
         yw2y/BF29LAFcxC19zM+Yl4dgV10e9dr7qRJBsnBEL9l9o/nMjMzcZix1wE497VJklTY
         LEnObtGe5xxxGZDXBDvfi3Sa3QPwSylJ2719zDv3nkYlVBGGakuv/q+Os5nMNlVUeb3n
         jZZsxnB5SocaCSedfDFmcMwUT1E7xE69mhhuCTMEdngmbrQ/6XdYFI5xf+UmprWtKbdc
         yi/sdBTBvVE9vvgTlNHd8t0fDYoJErPAh/zOsyK48WPrcn9WCrfFE/KqXC6+HawJ0Vim
         xGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713802840; x=1714407640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X18imHTv2CCCHmqGW/+6bF3p/ote05AGlg/ZRuYja/w=;
        b=Awczo/DO25ytXlKqAWHo79hvoc7KUYJFExv2Y/pnSVohJf9reZ3G84bwbz4Hnc4CHe
         Gom2kMkdCw2vY8qoW0FKtOwpnCpdIeJiuWZ95lg0o9tgEkOKm4kXmkQdl79OsBWnHpQr
         MKtImcMro4Kstfe8hFmSWd/vToJoChI/zSUfZfoTsHoQQUslY3TI0GPdflfa/LElkVVL
         +V+ODAUZEkfLioVRd7FxEmZOyU0izGwhf1TbAerAmOyOwyt+X72ZLuKA0p0S5upJfvMQ
         KNmN4grrgwhxTie5w243K/z8CkJNs8t+PyMB3lfFEqIbXQLtGb27WMaYT2Ta2wBRN0xB
         R2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVkaLDANQqa9Ru5PNokTMbje7oAVNUD8SVgw3VBz3RyEXzyANRmGhycPXjwHXYeawEzXD/GK6K22itA1CfDXneTa4n3daE3xe3M+YJIFw==
X-Gm-Message-State: AOJu0YzHNHZO3RhQa0u8mq9RqFbzLxdH0OpJbJxn/wXNnHySZezT79L0
	Kxx8uzhFk+X9ZgRqMtUskcaFDgSGB8BAsDZPeF5iROIHgOXlth0Qgaj2KAOUaCg=
X-Google-Smtp-Source: AGHT+IHPk9adqP6eJkbR/7Nl+/mXtpqukJJpRa60kXcBIC6/iAGnc2ywKkthA/KqVFBeuTaE/5dV8g==
X-Received: by 2002:a05:600c:3d8f:b0:41a:9cb2:752e with SMTP id bi15-20020a05600c3d8f00b0041a9cb2752emr527200wmb.27.1713802840285;
        Mon, 22 Apr 2024 09:20:40 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id hg12-20020a05600c538c00b00415dfa709dasm17032958wmb.15.2024.04.22.09.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 09:20:39 -0700 (PDT)
Message-ID: <b61cf974-8ab8-461f-9318-d5fc31aa59e7@linaro.org>
Date: Mon, 22 Apr 2024 18:20:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: thermal: tsens: Fix null pointer dereference
Content-Language: en-US
To: Aleksandr Mishin <amishin@t-argos.ru>,
 Christian Marangi <ansuelsmth@gmail.com>
Cc: Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240411114021.12203-1-amishin@t-argos.ru>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240411114021.12203-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/04/2024 13:40, Aleksandr Mishin wrote:
> compute_intercept_slope() is called from calibrate_8960() (in tsens-8960.c)
> as compute_intercept_slope(priv, p1, NULL, ONE_PT_CALIB) which lead to null
> pointer dereference (if DEBUG or DYNAMIC_DEBUG set).
> Fix this bug by adding null pointer check.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: dfc1193d4dbd ("thermal/drivers/tsens: Replace custom 8960 apis with generic apis")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


