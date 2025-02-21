Return-Path: <linux-arm-msm+bounces-48847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7CA3F0C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A09AF16D284
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EB52054F3;
	Fri, 21 Feb 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHUjeeBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED551FECA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130914; cv=none; b=ei6Di3M4VPwQypPLevmeNJyzpVQSz7R2tx4WRTmCcubUxXI+5OcIRNUGhhsu2QnBlORZMT6hUur5RGP6Y7yb7GyLuCNjkaavqW6ALLZ1SG20FgSkUPY7PIyJsvamDz1fgrwvH7z4SC8RPv2eNteEXu5ff7MPGhOIQLXQnC05ZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130914; c=relaxed/simple;
	bh=Ekj3mlDaIzCTqaCGVbDb2HM9pKkxti3ayHLfFEuWNB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4j1bvp3N8boSjlh4kA1bwyLplz3juhbNd9hE6ZZvx3u+06esFphEsvXdzcJ1rO9XzJD/HGDCTIlvCCM+AeqDZsPgE5xHV/ljX/vWA0KFD0CEgrPSU/FPWMJqPOCXCrRqmV4IF/0E+LKU+PP2kBkJU7lYrvw3gbRB8pqeWJRiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHUjeeBY; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so299935666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740130911; x=1740735711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf5UFYhuzwCYSZfhV/w3wT5Q92fYNVjy6s3M1z5Zdlw=;
        b=XHUjeeBYb8sZNEgp9l7fGPOIxO33Tu5eOAnP/sbzrQzHe3EqSxunMmaP2qbb7TiiHr
         bDkzuFxen1SmQ2DqbDEBNJJzoynktqTeg4SJ3olHREsZv+sxVqNWiq9AZlg5fyiN33bq
         NuqntajhvBkRCEd0QH7wlRzXEVvbDeJv4F6xNJzwKeDOyZTDgdviBtHHoSin9PMLfFHe
         6/neaiaqHgNG5TENClCIZ1PKThJKn/WL54vxJQxfKifs7kv84s9i22Q3quB3ryr8Rh2x
         B9pJPhtNumPMOPj+cUzzHpI1kqIT6T2qo5jTk3KuNe79eb8blL9Et1y9bZLHZOLKmF8K
         5sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130911; x=1740735711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf5UFYhuzwCYSZfhV/w3wT5Q92fYNVjy6s3M1z5Zdlw=;
        b=iVmDbcrtovK9GmHQ4cJJ/0yFqwxEw4ODXnfZbAuA3ZHpj8GsxjfLRNOOSAjsp2qym6
         YjVugmVfbHsYdzpbtaIK8nCzJRWV1+rrp7A2KlBV6zBXwOCBlQyJdMBd3NkWESVNO5tu
         B2t6NOF+er8fY9SDU8/s/8n7XA+xnE3lxZv8OBvcNWRNsIRcxUNrIJ+pZ+mmLl5gCfhU
         UdPvBz+6//rHu+BnmRijHF4t9849qz2yMudKucqdVL2uTDV0DyRbCSjpCyHJsr+sNqOT
         3eLFF7ny49B3tRPJVQpFYwx9msnarfcgRtIx5v0gfd1XwqnTyDX3PrAqlqklZctpE0P2
         Ug8g==
X-Forwarded-Encrypted: i=1; AJvYcCXz9yzrDKuuQ5vlICwvV3fQLVf60IawWJsDu23bzlDDDtJhWPJobh2lQEAniL2LjguNDPS+ZokS+zpzhQi3@vger.kernel.org
X-Gm-Message-State: AOJu0YweizStjsw1ATi06oelF6aU7MZm08ptwJv9qoPAU/G0f5rOFrYN
	eyizTOrELc/uBXhh+2+aoIR5OebfZcmODE1rbzHC5xbP2MuEBvGbyd5TMJwfJLc=
X-Gm-Gg: ASbGnctbKhGVZxZFoiKWVE78xoWUSK4MDECNlxhilupkMGeWVVZGx2J5sMDCykLLmTk
	Sa8rUHZXEwVzgLzSP5jRG18X2r2ohSlrSWZVWqO7se8QoLpuRa/wfNh/l2rg+Zg3FgrLOqPw6yb
	kH+YzvaKL1vm4BP2eZuii2KHAB0pEwoZ7uXrM1gOrRNBUD1hDt1SZwJQwbSG5Il64CVvcoHq9ia
	ELzKxKLoEdrUi/H5DB1+8hOTPKzRuU1UgcEpn47jmozSW5dT/Jqdulcol0jTSmQOkirD0dt8x8p
	jKJVKGGBlz8zA/b3V0ZqmJU=
X-Google-Smtp-Source: AGHT+IGbaRycsJ0mOBkrChn5+O4lWjguYUx2LL4IDLzJpPhuq5e6fQovvvo7BGaxVVcet2Lgi3vlnA==
X-Received: by 2002:a17:907:7ea0:b0:ab7:e8d6:3b12 with SMTP id a640c23a62f3a-abc099b83e0mr313942266b.1.1740130910690;
        Fri, 21 Feb 2025 01:41:50 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm814380366b.113.2025.02.21.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:41:50 -0800 (PST)
Date: Fri, 21 Feb 2025 11:41:48 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
Message-ID: <Z7hKXNOwHlLLNtNx@linaro.org>
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <Z7hGbEUsQU_MUL5t@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7hGbEUsQU_MUL5t@hovoldconsulting.com>

On 25-02-21 10:25:00, Johan Hovold wrote:
> On Thu, Feb 20, 2025 at 07:42:29PM +0200, Abel Vesa wrote:
> > Since the driver and dt-bindings have been alread merged, it has been
> > agreed offline that there is no point of holding on to these DT patches
> > even though there are some issues with plug/unplug during suspend in
> > both pmic-glink-altmode and ucsi-glink. These issues are being worked on
> > meanwhile. Merging these means that even though this will provide external DP
> > and USB orientation, plug/unplug during suspend will give some splats
> > and render both the USB orientation and DP broken. But then, other
> > X Elite boards already have these nodes described, so lets bring the crd
> > and t14s to the same level.
> > 
> > These patches are just a resend of the ones found in v5 and dropped in the v6
> > patchset of the driver and dt-bindings.
> > 
> > Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Abel Vesa (4):
> >       arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
> >       arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
> >       arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
> >       arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
> 
> It looks like you've addressed all the comments I had on v1 (except for

Oh, sorry, missed that one.

Let me respin.

> a stray newline after a t14s port@2 node) and I've been running with
> these patches for a long time now without any issues (other than the
> glink hotplug issues mentioned above):
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

Thanks for reviewing and testing!

Abel

