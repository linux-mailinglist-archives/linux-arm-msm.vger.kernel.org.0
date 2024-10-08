Return-Path: <linux-arm-msm+bounces-33547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DB9948C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46D0286CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B281DE890;
	Tue,  8 Oct 2024 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwONeQnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BE1DE4F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389789; cv=none; b=H6G63kc37Phef/8Rxsk+XowQD7h3C5vzrowUPUhdrgMWIRYhwg1H8cH5Ixwsvvwl/NIxvZv0xoTvoQZFdM2caywM5tUk9V1/h4A8+zq1WyBDIj6s9vlM61qD4OBSZ3o2p2Z74NpJrGtnOkWmySue7HKxJKwIoS/7bRDVD8q/fJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389789; c=relaxed/simple;
	bh=9qdbXPjdWe23w9S7RSdDv46wCwkMvIHtm5Abkl88+L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Am63Ze6JjA+hCrZVgubRdMWFEdrXR3awnU89/Q7kUvxUcaxcAHo6j3hIYwDlVzAVxUo5w48Hua5Egn34Kh8aqsa/eIowx+gxETDUW7qmSNoDZrS7u1vBhmglZNg+jThsf33thocK99BzNiD7p7wKyZGmh9uzw+owbPCEgK41++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwONeQnu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so6003578e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728389786; x=1728994586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GV34hA4NMiiVjlE1ywZwQx4q5MVCQoXK1seYtWiTQLM=;
        b=NwONeQnu7JgdVfMZG1i+pIZv7TizsebSrCHcFIqxfx3ONJekEffUzYaz0KpOV2w7bP
         Sb2RVwn1H2puplv+H3kdDN4sgqd82yZHg42hFdg4aI+MZXPijdLKONlLVM0YYKUWdMKz
         K4mqbPZHs2zZothqjlgVjdIIwusFFJMAKtfM1Wh8Oy2o5GcqqZZVKLeIqh7jfB5/bA4a
         xqImGknJx2Eq8XGhmU6aaFnEoANne58fGhNkHp33GNWLg4zxrw/5BCHqwtkIq6AXvH7h
         6FtlgFDGT2Gl4j57wkFmZnPKPhIuDyFdF9+gfb+TP5Vvh5f1RJVOslacnW7MZk6+IDOq
         NgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389786; x=1728994586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV34hA4NMiiVjlE1ywZwQx4q5MVCQoXK1seYtWiTQLM=;
        b=eCaiGrRDrBgTuH9UB31nnsuKz/y8alYGTsCuX+W1xSOPlHM/a3kayjCYgaLeQe1h41
         gFEE1t9eYoe+KqDTISLYDFjHsp8yTpqOSVHstAA2lfzysrgA3VEQELhRD2QGK0KQDJm9
         1S0IcG7PST+7E22caIAh17L6uKiX1Hc7jzum78w6XLFJRYfMGDJPmWVAkUxP/FZTfX5I
         YKelBXo98aK55uVhYQ7ZBv/iA3PdjmvgIt7TvV/sqbN0yOcMMLMSKj0tP2DpG93n6TBo
         lc4iMwj87v9mRkrtNY0tMssB7gdqYy1Pw4/JFAI3z5fcnHYH84ALtdN6owTda7zsPST5
         m8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5YI2Z5RD0TwyEAT1M6VYmsEyv/P7gHVUx52dxOdWk0BmOqIZj00WU8rHR7jGq8DRUK2VvmPCccRY6p8Ht@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJEo8y5w0kBJhZu82NPGp9RmXNgFJ3a05vMbIYcGjxkjnDxv9
	A0th47W7QM2Jwdd9ADzLK33MNW4tCLqiwvWCXRrJvj8BdwRnWR1fbOa4lyzGNQg=
X-Google-Smtp-Source: AGHT+IFvHDAEsgBpe049F7lJfpgVc4O9jmkr7Fdb6fqdQ4FjOhny5puCZaBdejKa4BjR/s68oO9hGA==
X-Received: by 2002:a05:6512:4019:b0:52e:9425:3cc8 with SMTP id 2adb3069b0e04-539bdaf1abcmr899904e87.19.1728389786257;
        Tue, 08 Oct 2024 05:16:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23d89sm1182590e87.236.2024.10.08.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:16:25 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:16:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
Message-ID: <zluuezrywecffsh3f7yzrtvd2sa3nyzl52sk6bluvjch5icvuu@noecozosseko>
References: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
 <20241008112516.17702-3-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008112516.17702-3-quic_mukhopad@quicinc.com>

On Tue, Oct 08, 2024 at 04:55:16PM GMT, Soutrik Mukhopadhyay wrote:
> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> sa8775p-ride platform.

What is connected to those DP lanes? If they are routed directly to the
DisplayPort connectors, please add corresponding devices (see
dp-connector).

> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> 

-- 
With best wishes
Dmitry

