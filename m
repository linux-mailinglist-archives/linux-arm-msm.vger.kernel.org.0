Return-Path: <linux-arm-msm+bounces-85081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B8CB7727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43EC43016DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 00:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B10205E25;
	Fri, 12 Dec 2025 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK22BrbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743701F5842
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765498992; cv=none; b=NPhd5oSlgh2SXFyDAHO5CQcXHTZwV6O0yiCM+d95nZgT4XylABAYdytENe+U0NdiIQD2r4MPFNWfyWkjxW/gsQ7y1BjoYMZjDQe0SJMd8+0QqxwCuiDvLVy3PA6vgRsjVVqDlK1qhrfWJHsKuSACCeENnQnylwm4lIyF66yjz50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765498992; c=relaxed/simple;
	bh=VJs0HdDUTreYqiEPWEYMgLI1QKUAgzDJ9UQWKudR/pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kzi7jpnq+YsCh1R2JLZDbbwg/utukOnqIzMYlGSQJiQqIQAt5tatJkTRMKa1pbZFxVx3NQlhSwcn/3ygVJyWNHOzoAx40bUHVk8LlD7bdMsOnsjMzbw6TZrc7/a8cvEuwHhPj3Awy5ZPy0K/2t6AgXUnAkI6fUdQipppUzDwEqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK22BrbX; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8804ca2a730so8676576d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 16:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765498989; x=1766103789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekAwpn4hrC8FLTzr9F7/ywbCXH3vu/SZcsviAIsYxIc=;
        b=YK22BrbXV5FHxPeIt23zE5zrZcTEt2AnaIRgDN22h+OOV//u+pj6H08XpvQ1i1ph4+
         hJO/0jveAc4JH6mTHMN0MKywrEvVa7f1WZaS0t+bBH9Qlj1lkZKrhqcJtSivrcGIO2Jb
         iccIMbASuXSws/a+XVouHcEPAmbO0Y/vURpZo7JXGLs+PZQbQIa7MD89khQ7d7ZrJEnj
         UfP5PE8B9EEfB7mB1W5Tu2z8UKan+37Z6p+8dRldg/dJWimBYxIIQ4AUkWw8/jqd0aUV
         FQPYXyOTgdlTeX4Ei8xvBaVGPLM7ocrGKfR8EKledy7G2+s0NzlXpdmHcRmK4IGjk8bd
         Y8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765498989; x=1766103789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekAwpn4hrC8FLTzr9F7/ywbCXH3vu/SZcsviAIsYxIc=;
        b=rPhUWG2H2yB5FOqHmAEgPaGsOq2LXwZxiPgQkiQN1ronaPzV1RwDsPAWsbkJx5oHwo
         Fh+T4qDaBM4XRAsLTZ2gkBGMJU0+0CyK4fALOvZGK5a+Kb2FrzHTdnyeDcN+Ac8BnXe1
         UMZ1r93aWXL9z4CQtYAAF/QCqvIig02l0l2d/NYG+R06FPIACmxliwDWRpuCUrOMwiZw
         0YUxdxuWcdXi4zkgq+Vr5EOZLANt21y/Dw6toWQUTdU4f3/cRgdkf0zLyQ0yndPda00z
         WUTnVlsxVHyJmXLad3xZwpuL1jY6qvxgdOy9GmJYSHPjmqXpphPc6u7fOOhkOktDwKb/
         N9iw==
X-Forwarded-Encrypted: i=1; AJvYcCVaW6raGEL9zZNbparjmJv7oUZwIdDyyOC7rDrP0oGRmf4CFxj88Amp9PgNegaVU6R5ed7TvdP19nvwTNOg@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvgg+6O1kXfy7Qz6ywxcvgX9LVEeM3DR2CPOTuOXdin5SlaaJ
	+gvu4vfdKCqTBgmOK1DpUZc77SgndTTrYwo/4sshQyUWaoOJxtSaFdLW
X-Gm-Gg: AY/fxX4lE8wknFEWFhsZQ99AyazwcuNVCsHpGw5TXShAgixnOnB6/b76hxrxH0tQ1CK
	UDpMP9i3Hd90cpu31JGBofqLQ4htNTJ605T5CiKY6y8frQxMNHD+48tziElIzLjulsnXY9CaARF
	SYXihWhA5RlDNRp2lGX0YVmDzQoA0Lwcjw23wC9soZFV0MJ/y4Fr8LcRyZ1oSZfhZFy+athaPbc
	2oZkuGeVpG4MP7Wb4iGa4K5G5MALqawr3Hssl8Ef7SMYLH8ylgJlUfEHnZY97yA10NOYAAnhHvb
	fnMiqzQUqjwL65TQ1mCdRI/+uSNe21qkS2tKwocoWi8eEzn6qsb0PuIWGnu+SNHK8bzQ4bDLF2k
	zCpfPMl1cXqMTwPFdFDnSsF4zHY6Utlc1ImGbaOUQZ17MMfbqdfihCW80qwvEbF7mAMiohLjl2j
	NXZzgLucl7NThMSA==
X-Google-Smtp-Source: AGHT+IEKDNtd1pW2MAhHOKkF8+slYPOoo67H1JhA1doiQXfU/rc0lm22DiXFt1BHYTZJO8wln/CpTA==
X-Received: by 2002:a05:6214:400a:b0:882:4b1f:a812 with SMTP id 6a1803df08f44-8887e12cacdmr8674496d6.51.1765498989224;
        Thu, 11 Dec 2025 16:23:09 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef30a2asm34637666d6.50.2025.12.11.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 16:23:08 -0800 (PST)
Date: Thu, 11 Dec 2025 19:23:22 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aTtgetS9Hx5MeBzY@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
 <bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org>

On Thu, Dec 11, 2025 at 06:02:51AM +0100, Krzysztof Kozlowski wrote:
> On 11/12/2025 02:48, Richard Acayan wrote:
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml
> > +        unevaluatedProperties: false
> > +
> 
> Ah, here, this obviously was not ever tested. Heh, please do not use the
> community as a testing service. Missing props...

Just a rookie mistake, I forgot to test on my smartphone which has the
dtschema validation.

