Return-Path: <linux-arm-msm+bounces-49277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE0A43E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2DD16A843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF4F2673B8;
	Tue, 25 Feb 2025 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3Jz9xTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D68A205516
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483934; cv=none; b=fXMz++dSNWmlii4yANKH8go8sa5NqWY5ch20MIw6k+fHJQRntYcEnGVXCCK0Spq4M44SfB6zOwc6XsBcT0FmLHQ/zMp/ekWFY9wn8ks7y1MrWI5AbaGbtIS2ZdgfdXtQOQ7gwH92oJ6mZaMA/aODkIPlx03OZvd8jAugmAiBdec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483934; c=relaxed/simple;
	bh=lNYoSjc9rLMv/Em/UzwEXKGOwOxcLg2KyCpuGWQKwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWZcryRmFvSH7TqTKvtKQxaBp8GvKMPlC4bnZgkuubU/A2CRYlLIIvDQ1O9NKMxc5HBEN3hDm3jbD00m1vPC9rELR/t8yeQi2LqbnDbswS/X7ANfTrM3FhD61QP8nQH+0hRjxuSWsA5VmVSggXXXbTfD/QEvVWOMNVXimbXZptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3Jz9xTB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54524740032so5676165e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740483931; x=1741088731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0tAhdMCjgNxZtCb6MshbLajoLe3q2SUGqXEYZ7V7+4=;
        b=b3Jz9xTBYh/SuVqajJgkDfOXogg+OO3Zz1sGln9kkk7lyc1pxEs2PrTtlkyDHxMJOi
         aO/mlJq0jew2HgC8B3Kxua4U8knlQFMJ87klLJaLkZl4tcTbiqRqfKBCHZkxfl+g582V
         oQxelY7aO5dCgWvAds2NZMneEnbs3OA943KmZ3WHHEyO017caGwSPIXlkWn2zUEnHRNQ
         U387CioOB7kU5ps3gCdxhG348rMH7C4a78qOZPOUZfgdkT3O0x0lT/CAm5Yk39gcmdTF
         ky7R/c+b+/XYtnosa6UfztVFNU5V5ajisSp1IsHPxKQT+je0mb215UhJzm0CwXtbxKiX
         sHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483931; x=1741088731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0tAhdMCjgNxZtCb6MshbLajoLe3q2SUGqXEYZ7V7+4=;
        b=O1/LZ2z2SZSgeYIMDpIcBCr8xnzTOghlbFO9H87oMe2qmq/I2EPi3QxhF5bpzCfUXh
         KJME3RyJeBZoTieuaahHcjt4OvtvdXvgdGfOFP9UU2OC0X+d9VM4YKeACY9zOlHX5gGZ
         FR8A56e4BVOgNDSTSg5kOFazC9JT3xkAw0xKYvf4jYoQM45iIweJ2TJwHXUYa0XixKi9
         3mWccARn/y6EjpTcmpuGScQW3Nqt0zfKAJNdHWtLBcSmxDSRd5e+VG5i+Qdx6DBKOOg8
         C/9fOqdy75WOIIQtoMXM9zoD0lJIiCCBQ1W82i+UJEHMOMeO5FROyPoONtQ3WvIDypnu
         YnnA==
X-Forwarded-Encrypted: i=1; AJvYcCVxbBu/+8iR7oqiWA5W0ga0gzjE9GrhE5rksThG1GGThWg/aae2LKLftbUo2fHvF0SzhAajRBq7ryEnnWsd@vger.kernel.org
X-Gm-Message-State: AOJu0YyhmjLtQGfCgWifvkR5tLjcqnFG5zFtpuIsV+n/i1E+DZMe9dbM
	R3lVavaLx/CHHFB8myJCWb68GHkEeKgNLhG9hC6Z4+yDp/22Zv1UMgMdZXP+f4o=
X-Gm-Gg: ASbGncub48/4eiGn1BRpNEClI4HpMVv9rxROQMrmvvYNscI3Oq8sbt2w1v0EmagMeoI
	PiwAtdyFpjsf9ZKLl6x6byNbb8TwtU3wxmKd77igZKKZcRq9V+NFyskHtI25/lUvOCsvqxz9cqr
	m0g6DqTnzHB7O0s6I+msZSpN1oJFOTqynfwHFUaety8Sv6cnNNzalL3PoNBdKTxNsKUkpEv62B0
	tK+yHObjhrE50MaOjzvsHTYIu+QpBhscL5mxiRr9IBeLq0jiRRTRG4FqgUgSZrQX4+F8zSNcfS+
	24jebT1kj1pqpD5IrmK9mC0AbxXMfYbTsB5h3fVXDGD1PXXAcugPFQ8Znh4IIoihE6DkmogZJlQ
	iXc2C8w==
X-Google-Smtp-Source: AGHT+IGmR+d4JyVDHMddvaufnQ8xwjoueCAW9+bbd51HI9oiQPJ9TK1XT6me9WBNmjo7RokqRJmgWg==
X-Received: by 2002:a05:6512:158c:b0:545:169b:9b51 with SMTP id 2adb3069b0e04-548510dba17mr1205685e87.24.1740483930689;
        Tue, 25 Feb 2025 03:45:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b2829sm153561e87.47.2025.02.25.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:45:30 -0800 (PST)
Date: Tue, 25 Feb 2025 13:45:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
Message-ID: <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>

On Tue, Feb 25, 2025 at 11:22:25AM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2025 10:50, Dmitry Baryshkov wrote:
> > On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
> >> There is no such property as qcom,ath12k-calibration-variant: neither in
> >> the bindings nor in the driver.  See dtbs_check:
> >>
> >>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> >>
> > 
> > Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
> > calibration variant in case it is not running on the ACPI system? I see
> > that it uses dmi_walk. Does it work in the non-ACPI case?
> 
> 
> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
> git grep), so how would driver use it?

That's what I'm asking: is the property redundant or is it correct and
it is a driver that needs to be fixed?

-- 
With best wishes
Dmitry

