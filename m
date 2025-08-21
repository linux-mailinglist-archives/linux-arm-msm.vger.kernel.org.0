Return-Path: <linux-arm-msm+bounces-70155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26014B2F792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3FDC5A7C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2023112C2;
	Thu, 21 Aug 2025 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYgxJ9uz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F044E1FBEA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778173; cv=none; b=Yk+qs7hzvAS9b2gkCyBnZfLA61119YghvVwkWsBJiP4aa8sPx2gwqgmTK0N2QKvgNwO6pzU66ewfKhJu5q+aXMNDn85IjzA3gEz1S1gVP6fwhDN0wjlCnGLJ1wpoE5V2aurUATJpojt+Z2ry7kxBGrf8NzTaO5C+sY9pUlHksMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778173; c=relaxed/simple;
	bh=S/Tcj7k1fvyu+MUdyFaMxX8E0mplGdjQTDqgU6HcZaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+B/iB9e58aSFTyureT1tK3L0S1KOUqT+vznNyShwOMKDXToJwQirzgLZCngxugVyy6A69Q0XJDH471LQFvCsCsZCXnyc1Ai7o/x7PJdwm1HvkHlzsTdJke+1IlxD0R3HVlqqz0VCO1FibXQvu07psE5mi7NLnT9woeTwtpjD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYgxJ9uz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce509127bso779204e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755778168; x=1756382968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/Tcj7k1fvyu+MUdyFaMxX8E0mplGdjQTDqgU6HcZaw=;
        b=sYgxJ9uzihuji64/IdMyt4EHsjShPUBnkNNpwV6QSFqQouoiyH5WAGSungprTE2VdU
         /VmVU8taK1f8z4Zso2slAW4m/3X0/KKFwOxJSw8Vl2tR9VVootqxpL3tCdww7BAeiIpG
         AgdDAd8cgCV0i00B/EY2K+rqF5TXPRfZzKWL57lys6L0KA6QEPN/EuheceL76sXzT1sr
         lOeupQeEEFtovuWkiVE3ZHlbYgwHeNUYI3yy5qfXaKC0HoikQC2AUgy3nflsCJ5xWNbU
         v0AgKif78hAxrQVIMAk5FK/le/Sj4cKOWWSn3pD3Jd0ku0fOpWt6fhgHWkO9yfnf0ch4
         E1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755778168; x=1756382968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Tcj7k1fvyu+MUdyFaMxX8E0mplGdjQTDqgU6HcZaw=;
        b=stRzXbaU3JgmOtX2tC/jDGxdAWjCrSK7bv/6H1YWdKAZxvvm+PgxNTQNPgmwDUJdAS
         62egdtwEbulFwV7RySgd2RSW+DwyPsOg/wYWv4D+akNY4KXrtzE8wKCWAfHz3SkbByCY
         3AFcm6ncNfprWdKVlxMdEy0M+qBFagwcdPOxURmLsJQmnJZwpSGTloExLJE9WxB/q62/
         L9NzpK8jck+V3PSrB/V4L7z7RB73ln+k4tieUb5EnM05oIk/UHKrPL1T2xgY2578gEjC
         LdGRN6QcKhtXsMu3ZzwjTVYcPTNYGd0dkqUBNVsnQ0W3viJzft3QuW19Ym0bFhjnOzXg
         rEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhunUtcdmsm1UzW4WtyyPl68BFrX7DAXbzpKRQLrndj2vWBXSxT3PIwJyce8dycf622Z6fOlMk1LYWbn6H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WLX7BJpuecKGlQL0NoSzvRNzOkR4RAhkIF5S/fqArJ0h1c9q
	dZXOptySbp8hCWh0klWMdnzOikx9NNiDRziq1MooAEAZVwASjPzaMLzmlmvRzc9u5OQ=
X-Gm-Gg: ASbGncsPOE/lU76kjl9P7ohZLJ6JoYpqG2Es9FyASgkvY/47NHVa5AYMD2YTPfM6cWI
	dCXaD4eWbUhP/P0X5ni5XmcFHuRnLocfD/o+hTquj8dfuNXeoP3B/YJJVM3adKxTuF2cN68NLoi
	JcZ/gbVb/Bq06WQsuYp1imxydGJFdPXDtCCdoEE1xO46Mf4e16l4Ax+pYpN9HZFMF+nvKeVfhHf
	rv/3FIaS5uw3+k8f6bRCBdZJDsDtFCrrZWIOL6suVk5Ei93JS+RmHUydaAPOuK9Nu9/Sd9lmoiM
	BsOCDNs68fItyu/QBjGthmajCbOl9RZ96A018e6vAysQu/BtVZnZb9DoT+IAvJumFZ8rMD/jly7
	W3feNvZ1NRi1FyYGOfxwFqk9IqwDZisY2LXdgTSCnvBdj
X-Google-Smtp-Source: AGHT+IGaaCCMTb+GY0WxEiA8aIjR4ryzxzqZ4dp3Zq2ctdGCP7YbQha8ZNnpdix3i4pfLzcLwMPwIQ==
X-Received: by 2002:a05:6512:6408:b0:55b:94ea:1d38 with SMTP id 2adb3069b0e04-55e0d4fb7c8mr825892e87.16.1755778168039;
        Thu, 21 Aug 2025 05:09:28 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:6153:383:a3fe:6207])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f358bsm2991125e87.110.2025.08.21.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:09:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:09:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: iris: Fix firmware reference leak and unmap
 memory after load
Message-ID: <aKcMZ7vTYAOBWuha@linaro.org>
References: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
 <fe1fe768-678a-48db-c603-2fda3effffb9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe1fe768-678a-48db-c603-2fda3effffb9@quicinc.com>

On Thu, Aug 21, 2025 at 02:33:18PM +0530, Dikshita Agarwal wrote:
> I noticed that the maintainers were included in the CC list rather than the
> "To" field. please ensure that all relevant maintainers are added directly
> to the "To" list in your future submissions.

Yeah, I had a bit weird choice between To/Cc in this patch. I'll change
it for my patches in the future.

Note however that there isn't any convention given for To/Cc in the
process document [1]. It just says you should "copy the appropriate
subsystem maintainer(s)", so everyone does it a bit differently.

I would recommend to avoid relying on To vs Cc, to make sure you don't
accidentally miss submissions from others as well.

> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks for the review!

Stephan

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

