Return-Path: <linux-arm-msm+bounces-52742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F3A74646
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA5703BB31D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFDB214209;
	Fri, 28 Mar 2025 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nw6sNeId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9F213E60
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153739; cv=none; b=QVtcUTTk3rI8DOzVAnCfsQCHooAqzkw+F02hOh+bpedsNX3kD43PZ4SX6RJNMcJk+oduSI14VmVErzbfYe9APrYloosl8mKQueuoCLzTETFTGbeNaqLaA6QDPmbsLtkWgvVXIA0DuFoKYlONfXsEUYfef1Ho7+6JIHJMS1VHMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153739; c=relaxed/simple;
	bh=3n5NcSWbMxNV65pkiH8xO7XiulAHfo9FuvZJ/52Zbn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brpdNJoCYBqjjAZqDNAiQV1+iBVlxz3VRjV/GKBVfW1vl0rbEkB8Li2LVAFRf8T2/cuf60Fk2fdNhq1FcAB7ABJ6i6Ysq8q2H1W2srTDhC8twmEVfd1fkLgkqdTcPQGVdnVHJaJDVLtb31mRufxNCdoREI+E35piAdlQuKC+1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nw6sNeId; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac34257295dso371026766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743153734; x=1743758534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8F6/Mi5t6CvVa6NbJV7qdkNj8IUB4iUseQrodXPdQU=;
        b=Nw6sNeIdeMenm31Ozp9zvLFT4ZPDxWlDC0/xuDM4AlHNphNItUXe8s+cE5Ten/Jf69
         lTK8JwKSd7JXPFYmWERLVFTRRn4LGyUbgnkKXaiqaazYrFgvrwzKyuMEgiz7m4chXGAU
         5N20ifyoLnKHscaGLth7Y9yFv7HumouRleXmhuRc3yhhJm67NE7tijwNiHeOd0tn6u1m
         cdkjp+A+a7jA0ktPZ+DV5kX0+hXu5Ro1/0OA0mc17+iwFk06Vb4P88Lv703IcLwJn/NQ
         PYqvyMTjeJIf+TChxT+uTbJDOvMEFRCW4YwP41mlxLSPqR+XHMWjY0UjmkRJjKKqbAMQ
         b3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743153734; x=1743758534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8F6/Mi5t6CvVa6NbJV7qdkNj8IUB4iUseQrodXPdQU=;
        b=B+As+IPerdGWLJp9q9Ddx/AdHRv/7tdqDhs4XQ4ZXpDL/ylbQsQLwRAylZR1AVCiGg
         Dj1w3n1U6PgHXckkCB12LHdKEjJMiSYGzLlfR+lAg+A0CoA7ZxaIQK2pLr8GCpR1rOk7
         IqWAvYcUBCw/IXv5YMfXep/yakWaGCg6vy7kuEyKAM/yfrVWtr4iISW8e2MpAT+jbUEx
         9RSh0Wa4WYSs+ojhuOTSvVlGMO6pt2Qsr9KscYr2t9MGWcNK1jx4dsAH+Oc0DczcVikr
         dQ+FFGNRqesAUFRAc90UdtaZxODHSDVPHyu5AJbAeRhFg59FvQYgJCcYvHf4MJ0pXJFX
         a/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWf8wK4uQ++4ar9RDtGfhw7UQSIV0P/0wxcR693I1nEw1Z3D6cH1EwPQ3hq7OAJp8AW2NM7ouHkOoC5b8vA@vger.kernel.org
X-Gm-Message-State: AOJu0YxRG6hA7pOmKo93Lfvrpapd41/5WBT9Z0HFXWk+wTmLK9+c7v/h
	fxf5Xqeh27j+nvA41xzOxxtCLdyTM+paentuGRcht1k8ubs3jM0V95LiJ8p3Mfg=
X-Gm-Gg: ASbGncsbcozvVFnZcrPHZ1DZRt5kfB06m/OmnbLmylpoeRq4iuryK01zWhUGGcKJdAC
	MHg1BHS5avUWNR8ZBTdS38AUFpYYnsE7qrkShNaZup8V/39tVS1MpZoEePMOc/Cw+qfdgSbcY0T
	8kupHYvpstWndsdXhMkbFWqaBge+HBW6Gs+4P9T1uczsMs2EYWAePbh3uN/Iye1sLCyZGgHgj6Y
	AsK4UZZUlXJLpo3B8vTBoSAErp5iSE76SwNuQ7geFI4WvKuaJfXRlnHwaA9g2BCVjW0N/vfMoFN
	fduZHuU0pz5TY0b9gB5h+wolmmDt5NhncC9oE38HxA==
X-Google-Smtp-Source: AGHT+IGqVO5GOBdKSR0UHnmKwqXfKTUeeVTD7NtsjeXDRVx37M2iiHUK4xT403SV1qcakAEOpZYu7A==
X-Received: by 2002:a17:906:c153:b0:ac3:4227:139c with SMTP id a640c23a62f3a-ac6faf2eefemr758055966b.24.1743153734352;
        Fri, 28 Mar 2025 02:22:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71971bf3fsm126205666b.182.2025.03.28.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:22:13 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:22:11 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
Message-ID: <Z+ZqQ4pU/YHEI2M5@linaro.org>
References: <20250328084154.16759-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328084154.16759-1-johan+linaro@kernel.org>

On 25-03-28 09:41:54, Johan Hovold wrote:
> Jens reported that the sanity checks added to the new ps883x USB retimer
> driver breaks USB and display on the HP X14. Turns out the X14 only has
> a retimer on one of the ports, but this initially went unnoticed due to
> the missing sanity check (and error handling) in the retimer driver.
> 
> Drop the non-existing retimer from the devicetree to enable the second
> USB port and the display subsystem.
> 
> Note that this also matches the ACPI tables.
> 
> Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
 
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

