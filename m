Return-Path: <linux-arm-msm+bounces-66429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B5B1022B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 114015874E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A888266B6C;
	Thu, 24 Jul 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLQ4F0Gy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8CC1FDE09
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343268; cv=none; b=JWK0117OWJxv3qjbJaublNVBqJOKkrzWs/5T1HzEqnyBdyFWUn4ocz50sk530v7En9Tus8BD6oFXx0gluIZPtLBzQVWpA+zO1JLH9cFl1rY/r+wkAxHCVR1yekpaqVzzmuTvcYiYHeJP78t2Jeh4deyQD037AzZpJWZPZXiFJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343268; c=relaxed/simple;
	bh=GkZlzMsbwC9NT9A0zr+vZfjTAZdKR7nPqVFGiO0aDRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8NqclsjmME+rKBaFkCg7MHVgRjvr5OBBEW51RieloHVmVk/pnyhilPUZRpjS2uZejHtPH+f1eXKQVLjsII4JiRmRP2sRTO2gpj3XkcGCIjZ6mq0ZdDu/s5fTWSxpy/861hw0mp9zhwo0mTx13tfcbbQs4gEgbHAsMBZH4hvHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLQ4F0Gy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so1173255a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753343263; x=1753948063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCsHGBvSyrUsLsBAqIRdWHViyxCBqekwJoXqBFYbpq4=;
        b=NLQ4F0GyGE/Z3lhtFN1g4098p75UQi5NWkYAs09ZPc61C5l5A5ms7zPiU5OJOgR2DN
         adlsmqPDcF6be7+BdLrmhZy8B99jUVRDSs9XhxAhSM/o7xtBokS0X5ciYf+/W6DBBCrK
         UQTENyqEcvHGFF8zYUZG6Zpx3QWBeJAOMAe9OcFVw5qxRTuKpXt5QcQxLVSUnDXZabi/
         8pVsvOh7OPhU8ouNeN1uEn8P8V7BE359hOCzpzIY8Ui8ANpXYFarotuSUldTuQAC+OTM
         kn0GNoi/HVNb18mWUsA3VacocGXE2chlvOR0JkoNp/BGtuTHNvLPtt9vsRUn35IC7FV7
         HlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343264; x=1753948064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCsHGBvSyrUsLsBAqIRdWHViyxCBqekwJoXqBFYbpq4=;
        b=fZKLtvYOzp+n33NTVuMORlV1td1+aptxbMTBtRo5Cm0AAu0x2WGUwJmHFEFK8+Sz+b
         gnZ74PwQd2NRz5MdM+D+RHHFM6ZhHfK49MmtOcWeH9qrcn+c8pZnpL0taVEOGnBTPiMI
         T2t2P6B/ErNJOVpBqqffUfXSA0KM0Xj4Nug5Yw9DCW7zuBSyqFURmEub649wY7LD3co5
         v7bbsTt2aysl76/WgC7QIhBHZi0cvX6NZmTk8eCsCXEvW2/Ww2nLyXqzli9igLEZby/f
         /+TaPs+ilYvYCVeyVgZeXn2fuDHChWCTRVbqr/s63izwQJ56LZgKEDuWPv3b0S50dReV
         uIVg==
X-Forwarded-Encrypted: i=1; AJvYcCWuxn9dCDwtugqovF3rnXhcmP7IlAHli9bdQsY1uEBsYRMqt4/v6PCWDfVoX7HVKsCw3ifHaSkhULG9A+Lw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+ab3mk6Km/1Kq4R4xKKoGAlP2shJMhf45hoyqNhWTKp4jglv
	eaTMgpMrSObt/6s9Mew/djVVFf3TNfJhZpoGtEsBZJWgkctH6xfe2ciQah7OjwUpOj0=
X-Gm-Gg: ASbGncss0NJ2F6qv71m5C4oLPaiaToC3hpxkjK0FcZA7RdXVGMGSWHao7lp2RqiI8FY
	7qkNYYUCWuzEs/t4tJxR+fAeEmiy5mv4RimNh+/wGbs1DaDDtQ+4YkOLi/UtZCxKx/6bIYWhUO3
	1o2nmPtx1sy9uNi8cEkLAK0dP3/fcyWs5c03/IOi6Y5OcoMeDIrX6rahMtLGuNyqaJ1vp0QBx9w
	e4wLQ7jW+iuRK4srJPX4rX7KNlfGCfNFp9a0tr5Cgw1vq49pD1Mf4Bera9Qe3RonlFKmbPVInrb
	3TXK0Frd+vjDfu6SKB0iYGwH+IqCdbOgyxZbhI6B5zOvtrtj9iZLZ+ouMbnW6wHkHQkjH0T4R5I
	LlJLS7DTC+Wwf6dqphZ0epRoibsXN4dcIEw==
X-Google-Smtp-Source: AGHT+IEhhV27yTiJ5gFBxDikiEPBXQLvhGeDpwVDGw+Zc0stcC9d5cV/zCr60GkDvp8aoPbA1HE8EQ==
X-Received: by 2002:a05:6402:42c9:b0:612:a996:5cfe with SMTP id 4fb4d7f45d1cf-6149b5b01d5mr4946103a12.31.1753343263494;
        Thu, 24 Jul 2025 00:47:43 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:706f:1fb4:134c:465d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd31abd2sm480951a12.56.2025.07.24.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:47:43 -0700 (PDT)
Date: Thu, 24 Jul 2025 09:47:41 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/23] arm64: dts: qcom: sm8450: add sound prefix for wsa2
Message-ID: <aIHlHZiy0ArPwSMg@linaro.org>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-21-srinivas.kandagatla@oss.qualcomm.com>
 <g5ymyqh5soso5fj5mzdssz4ovqovecmvja4lvcgnfncnsvep3l@qsip7x3l5err>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g5ymyqh5soso5fj5mzdssz4ovqovecmvja4lvcgnfncnsvep3l@qsip7x3l5err>

On Thu, Jul 24, 2025 at 01:44:09AM +0300, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 11:27:34PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > 
> > WSA and WSA2 are two instances of WSA codec macro, this can lead
> > dupicate dapm widgets and mixers resulting in failing to probe
> > soundcard if both of these instances are part of the dai-link.
> > 
> > Correct way to address this is to add sound-name-prefix to WSA2
> > instances to avoid such confilcting mixers and dapm widgets.
> 
> This looks like a fix for an issue. Please mark it accordinggly and move
> towards the start of the series.
> 

It doesn't really have anything to do with the rest of the series at
all, so those should be ideally sent as a separate series. They can be
picked up much easier compared to the large refactoring of the other
patches.

Thanks,
Stephan

