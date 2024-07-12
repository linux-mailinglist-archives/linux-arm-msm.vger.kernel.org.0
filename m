Return-Path: <linux-arm-msm+bounces-26027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA15592F929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 12:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558171F23C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 10:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0C514D70A;
	Fri, 12 Jul 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3d844oL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B467EF09;
	Fri, 12 Jul 2024 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781444; cv=none; b=r6CcLmUkxWxJfPsvfqyLImBnZpOSC1/NOPQ8jxjQ4xGZN2kIbEc5EMvJn/5R5l+6wqv8K2Ay4SNNKbCvvGJDecTdg13qKc0BSiqwFFBiib2QysOQTmZLAGnm+LRGHjzxSbsz4Lj4s3ROV+LxMKdYw9Ls5Iqkmh7D3uAcY/OTdYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781444; c=relaxed/simple;
	bh=TTgQJQo/G2tMYgIof2LKdcvu0AxiWVsGdT5DInLxBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwamhKAawO2foKdq/5/TBmZFBsYKvbjUsdHzV3UROsyIXBJM1plDPBnVsIE0GvOl64YbzuH47APHla+XcyxvAD3yL9St2FCeqymWDxCGCBqGUzWMJ+jET5xFsyXkN/tsNf+ZfbRtDF7vFTMdd+AArx6uMUmb0ocm4nUnRh04TFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3d844oL; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6bce380eb96so1199164a12.0;
        Fri, 12 Jul 2024 03:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720781442; x=1721386242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7TCbnvsTLgA2dZ/mGwCwrHn+OdV7rHjLUGvbL2tLkc=;
        b=L3d844oL539pMhusRE1//Qb4X+s9b890ODLkMW6clGFeYDDpGdVxt9fXMyhBqeSFmW
         4WctJe8gIgpLHK70cGTtNZ/C3RD7pNTF7OsMd6Nw3v2pEYqJlDrIN70QgkNsizC0sp9W
         NV6xF9v72+X4QRN4Nd3xYrkX5UaMLzoEsyAn66+mxP+mIExsYMADsn/b+ILipWNaMhMw
         3X+18uGDv6fLVGg5rc66rAADQVeJ4TJ9zh3MDtvmqVB3vSs04SdO6+FEY5K915E7tpUd
         VtXIdQvW/KU8EB0pz89zpPtM7KHPmbleMiXbVpKl3SljrBs0UD0kbMpYUEWSd8pinEhS
         9rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781442; x=1721386242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7TCbnvsTLgA2dZ/mGwCwrHn+OdV7rHjLUGvbL2tLkc=;
        b=wJZiYghh+Agxd205vNczuV8KixIi3ykeLPWNSZqbKK4zQIMOEUbQg9uquIqmFTaYem
         JVjwUcvLKHrNCzUcD+yseZD214SqHX/UgMYqX8Rxf7If72NSz4R5VKQnVAUOai1J1v+t
         Mee7lTL5ej78Sk2V3fVoTgKHAUStEHqvbz+qnmmCWZc1gNIpINU9vL1+7qqP0iV1dGXe
         wcHZv95C8UjwOmBXioEqb73zF7/yDHiqRBm6veQDYLIdVDUVDhxGAAffamU2tRLeVruO
         kKQWt62RlNU3aRU1ZnAX4Ku/yyYDhyjSnpZav9b9HazazrfzLaTuaNPHxGmLstsJVBum
         wsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJx2C2RhKjJHgcwrlUNEHlpTL2MvYhMLCdkQnQkxQ6fnoUSnnaZ1wPyE0UcNaGeWPJThLM4aJazhrVsB3oEXosReubY/yXi8WpFbTYovBPGA0KEuQBEMuPvEyUuxgulMe1ovAciB0A8yORJw==
X-Gm-Message-State: AOJu0Yyprt75nK1iTTw9Gvl43TQNnxphUTBvV3gPi7vnqaYv2TvR12Mz
	sTO7rw4mk0LTbbPi2HLeyiIwPWtLPVBazb5Xw0xGqW4xMU21lf6g
X-Google-Smtp-Source: AGHT+IGW+Flmzn4SoM+8nU3MTEHZOX1MEo57N/5N07QTEgv3K0qKU63OL/NURBB4n/qaZMoGXo5yKg==
X-Received: by 2002:a05:6a21:6da6:b0:1bd:2214:e92f with SMTP id adf61e73a8af0-1c29821ffbdmr11698408637.14.1720781442081;
        Fri, 12 Jul 2024 03:50:42 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:2a86:5bd7:c7ce:a9dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a12363sm64355095ad.39.2024.07.12.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:50:40 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:20:35 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers/clocksource/qcom: Add missing iounmap() on
 errors in msm_dt_timer_init() function.
Message-ID: <20240712105035.GB183177@bnew-VirtualBox>
References: <20240712082747.GA182658@bnew-VirtualBox>
 <a6ae5f72-76e2-4c80-8039-b3bb07ce3a3d@linaro.org>
 <512601f7-0299-487b-ba7d-7941cf1f0151@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <512601f7-0299-487b-ba7d-7941cf1f0151@linaro.org>

On Fri, Jul 12, 2024 at 11:54:44AM +0200, Konrad Dybcio wrote:
> On 12.07.2024 11:51 AM, Konrad Dybcio wrote:
> > On 12.07.2024 10:27 AM, Ankit Agrawal wrote:

[...]

> 
> Also:
> 
> Fixes: 6e3321631ac2 ("ARM: msm: Add DT support to msm_timer")

Thank you for pointing this out. I will send a patch v3 to take care
of this. Also, I will use this opportunity to shorten out the title a
bit.

Thanks!
Ankit

