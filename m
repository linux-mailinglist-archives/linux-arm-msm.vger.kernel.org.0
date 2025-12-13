Return-Path: <linux-arm-msm+bounces-85160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F3CBB441
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 22:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 733A8300B9AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 21:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472722C21DA;
	Sat, 13 Dec 2025 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+5/fh7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD740273F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765662597; cv=none; b=HPg1+jvH2opasNA7N7WVayiQRFrFE/u6vuMtGMvfqElu0sJkPMp1L/rZ6OmQBqXbOL3LIJYvfdcvkCl79960NWVvbsK7euh5Ycha/x1yQwL4C9zuiORPDl0Ejx+mHO1FSyzR5eKQaYlOmSf9f/6ZcZ5odwvdcFM55LZJ5rSSGv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765662597; c=relaxed/simple;
	bh=e2pcb55PyYuPeFtBxr5wEMCUjpf0rvklOlW57bPjGFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvuYGLEQLaFMKNHGnVVG2ALgMP0+6xPcj+bKCCCxmVElRRiPiS8NYtMCmB1lZl6KQdNlGyrUv5/A9CbXzwmRhA36S0fyzf0IvtLT1b3HnA+fdvE3AldCnAJs0F2WdP3HVXM2S3eTuN4kz3zFKQbVW1eyUy4aq97LgA/txVEa+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+5/fh7l; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso1510956d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765662595; x=1766267395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YKlck/CCtYd4yJQrHwKCnRYQwMh7R9tEpASg0oKNV0=;
        b=D+5/fh7lpKitCVQA/hnoJTjKG5YBCj1jD/zoHshSeyX5QrG04PyhjJh98L9/ihPZC/
         lUp10yAqrjnTyYUG2wuGhazSW1jiqnk54YqxXKAgRYYMafa3QVcDudhTuglzhfjkPrVo
         B4xCNnUTlJtJpP/2y6kh5JNMZIOlTMXvFID4ZjDdaJPvqt39KZy1xaoO95j2DQkrUwCd
         aw4hZIGVW8FiBFLgZj7yaEOXY9ugXO2oxlPT80O13Fekm3m+9Ag14UUOfaAzYnahParx
         cvJ7SsBYBcGEAM3Gas01tQkcav65il9mLE45IqsvxC4K1f4rbwBE19V2ypnST3xbuFGP
         KNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765662595; x=1766267395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YKlck/CCtYd4yJQrHwKCnRYQwMh7R9tEpASg0oKNV0=;
        b=N1F2uxQLPJcc+tc2+Hb2M8inhtoersjhzmc1A/yR8OwUTqRhfCh9Ze6Up3TV6q3hWo
         9hYL1qkUgFR+2bhXvePyb4CikfYkHKUBqlboeRE5zPon8ePMUYZwtciOKpLZ7jOUOaWL
         gfctvUmvP/cWxqqxUrb6DgPbSWEDLVgy50cZtbgpZp/+Xp5jLGR4cRJDmM0OWH9MmTPt
         HK93hPujreE+BIIMsqdec47ZNxSBAmD58QlV8IAgwfEjgmoXHqkr1OOqZQE+fezTNfzv
         Rzygv59x/hbiqSuEQO9JMce4wE4fbk1AxzLP2F7itO6sdvn9Zjcb2WeE9xcY/7T4wGcE
         EZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdzZLECTu/a2+dwmpZT3a8rq9KykrOYtDag4x9VUyFMfwS19Fv3riVNJpoBJczu4e1EsdK8k2Pkc6+3Kji@vger.kernel.org
X-Gm-Message-State: AOJu0YzMuvyBGzDsKm1cVJi2u5ZctQIVy3ZKdYhbDIZp/RvN+Ls1i1Zk
	XPUTx6PbizhuaesvyiZb7rCXCOiMcOqCUSdOruIa7aLIvZ7ROaTEL7wv
X-Gm-Gg: AY/fxX7YtxFLEEGvuamS71z7ihrQ0j7MKZLmQ086sa7U9UjdfJQvyJUS7HhO1mvOFv1
	OXB8VKTtErwOCreuhIe905eBMVcQYFJjaVPG5rLn7G3V4fk+/RwHJhRpWgKni4ICgJ6cRqM/SzK
	JDu3swVVw6ksKS3kmPXVFYl//eYkjJw/SJQz1JDfSua7GeTJxx4xa8YB3H2DP3VGXH4zCbXiNDi
	BAlZmxtOjH2AE2VVDFduC01ueri2wce8hEVfvvtzgGagYX8L+QsBR93R2vmZNIYuuQdX84zE//N
	nJOk8eKWLALmHuiPfl3XpDK6spvNtmyLlsHapZGbxmTddvU7K+WrvWkFKC4NNlSJJfh/md6YRl+
	ug4DCkSXEFKFNRxkH6CNXv//X2+VbErKB4O9o+Rd7r7gFlkqnN2p/mzcH4I6vbnTrB8TRBYpqgk
	NTUuyYQMuCdTGZhg==
X-Google-Smtp-Source: AGHT+IFYIq8qsqW619ZKElnaxqHH6op4Y8u4AELFLc0W1TCE8Lq3LVxJ+0WCm0xzFjN8cNlD19ZF1g==
X-Received: by 2002:a05:6214:da3:b0:880:837d:aa4c with SMTP id 6a1803df08f44-8887f2ecb40mr91238556d6.28.1765662594142;
        Sat, 13 Dec 2025 13:49:54 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993b59838sm20844186d6.13.2025.12.13.13.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 13:49:53 -0800 (PST)
Date: Sat, 13 Dec 2025 16:50:07 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aT3eUlQuwXptSFGD@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
 <25c8ad84-2a3f-4e09-a32f-8af68379858e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c8ad84-2a3f-4e09-a32f-8af68379858e@linaro.org>

On Thu, Dec 11, 2025 at 01:02:49PM +0200, Vladimir Zapolskiy wrote:
> On 12/11/25 03:48, Richard Acayan wrote:
<snip>
> > +  reset-gpios:
> > +    maxItems: 1
> 
> Please explicitly document that the reset GPIO is active low, and make
> the correspondent dts changes.

On my local copy, the DTS already specifies active low, and I haven't
changed it since sending. I'll just change the dt-bindings.

