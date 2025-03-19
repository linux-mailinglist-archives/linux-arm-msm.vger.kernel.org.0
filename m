Return-Path: <linux-arm-msm+bounces-51924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F79A6890B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F9C16A31A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C80212FBC;
	Wed, 19 Mar 2025 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k52VKG88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363CC1F866A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378780; cv=none; b=XVMk3iepyOuDg8bU50s+tGzizWOoF05g0VhzJs5V1pocO9Nc3g2rcQqR982jeQTjpGr0dqS8E5egikgbt6tUIGY2iVX+rqoEvVR7tyDkbdVEjfGVq3OgrzxjLawVwy3P2HSj79T8cSpHZITHYBh/uIqZhX/oii6GomgeX3qOsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378780; c=relaxed/simple;
	bh=4vaJuEvzjXdXBSh6/Y5a0hdOgg6StyNQc0yWT2KFVcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5ttpU6oqdiB05mJkQer/gJWKxGxrIHzm6+J2lebXFQhH8ZbtrzoGtcavGtYggN1CvDlX2ZQlnuGXlj3d7WIV7OChmN0Kwxc6fyxwEZpHOPgRkkBFZWjAkIVe2k7E8tRONHAlSMwBaQFgwfGlUox52g3lFyhIQN43K+N0yMdntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k52VKG88; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf3d64849dso1090972966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742378776; x=1742983576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dkmCrBTQNmjyJ9LfpOQNHoaOW35hiIjttNIV6ARHzg4=;
        b=k52VKG88FULWXgzPiUQvZPZL9mFkBQkFUUiI8JmRafVV03hfGtDyxdEN7F34lWCp6D
         AStue904vYYMUxhMkYvFMDrj8i5IlenM60mu7rM3BHqBLmhzcqmdFMU9RkqKWi2i0qk4
         yUamj2yisqm/1plPGc/R8ZYS7YhDc2FhptyAoDzMuLIQZeAsms/Ruecey0an34c5AM8J
         gMmFzwcKnzV5jk5e8Gzv+/VYswHU2IEQmTC02EIEpVecn0Z1lc9yUkY3OTW2Nbk9HEn4
         iAxqKWUH6ha6OQCO85GkER7My7GApyByPKJ66BuZReLm/+18kndVuotf9ari4y6aYdSB
         ljnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378776; x=1742983576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkmCrBTQNmjyJ9LfpOQNHoaOW35hiIjttNIV6ARHzg4=;
        b=dQ6YqdXVaxlNLVgddfX96ugKTkaHx9AwuDo84vMEl4SwFt058gxghM3GeqScsdloF7
         AXV7W45iAn1X+PPoTUsnnaD2HwrkKMhwIACOh+SaS4uhGOT+CNZjeCUBQq+oPV71/KtR
         yZSlVzI0CDrnZhYGdtS8yAqrNvCprYsFPO/3LNmy88Y8ahkSKPOTlyGw4Sll5b8f4Xdo
         0NfR58eN2w0Fuv+++S6hSGYzpWvkJ9JDkNjvCgGSsj5rY/zwZfUC/uosmLgtASRgLrWx
         sGbontpezI51rYqyd0sEgo9TdJvrEjt4Scl8Cwnjn4cZByPmGdMtfSRYGcKNF+QKPcc7
         oztA==
X-Forwarded-Encrypted: i=1; AJvYcCXU1ZHEtzcPFPQ46JssSJ8RTferUa+2p4ud2rxnDNc7UgK89uT/ULq8SEworoEI5RESd3aqaiZO6Ts1BmZN@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSalN2AgxWUhGI/2pHYcJ6rO9MRjLaoGRNq3QdbJLVyJ/g8zJ
	BoSNeRMQQsKH+aT8gTFMHvI/YbiCS32FjqWgBUGDsolVSepoLPM/Ck12vxVsSAg=
X-Gm-Gg: ASbGnctDiOzltPThHzd69CL0gQzmrRkpJ7D/9juyJsyJYsRDkTGiflpUc0fF5xmJ8gB
	Hjyg6EUo3uy1+W/gYWcP4FWaHBObFcX9XXwEsnE113uBQhdMYj3m6o1e6XCWO1gxYeK52J5IU31
	8sb7xXPeChOddBbsezjrmvJDGs9cWOK2ag25cOQgk/nh1R9x/lORblfLKfoP5rk6bA3yIq1KihL
	ObrCo4SISbXKud7ELbajemI0IbwWnJ+JEn/wp+a/kRynZD7WSMZtpGjTPezzTXgn4ESDPHwYxmp
	F6ILOVujTGxwQf0dBvs+7vRrquN1Xsb9/KivIghQKUez2I6nKgL864cn
X-Google-Smtp-Source: AGHT+IFI9YoiP3I0niuCpSgGRcKt34Gyjun9cAeLDdB4irqA7sbsTU6nGtTRm3pLUmCGA+WVV222Cw==
X-Received: by 2002:a17:907:d9f:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-ac3b7dc20a7mr204929866b.30.1742378776366;
        Wed, 19 Mar 2025 03:06:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:1274:3124:56cf:f607])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0077sm998578466b.93.2025.03.19.03.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:06:16 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:06:12 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: bjorn.andersson@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
Message-ID: <Z9qXFLmnae86_GT9@linaro.org>
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>

On Tue, Mar 18, 2025 at 10:17:02PM -0500, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> The Qualcomm X Elite reference design uses the PM8010 PMIC for camera
> use cases, but the Dell XPS13 doesn't. Disable this PMIC to avoid the
> error in the kernel log caused by an attempt to access it during boot.
> 
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Usually we do the opposite: disable nodes by default that may or may not
be there and enable them where needed. E.g. for the 4 SMB2360 instances
in x1e80100-pmics.dtsi.

I think the same approach would also be preferable here. You shouldn't
get an error in the log just because you didn't go through all of your
DT includes and checked if you really have all of the components listed
there. I think it's okay to enable PMICs that are more or less
guaranteed to be there, but clearly this is not the case for PM8010.

Thanks,
Stephan

