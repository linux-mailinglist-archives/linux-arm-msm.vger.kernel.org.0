Return-Path: <linux-arm-msm+bounces-55572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E8DA9C0CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A33E1BA60E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCB823D281;
	Fri, 25 Apr 2025 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i8KCNbjb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629D23BF96
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569082; cv=none; b=V+ECIOZ/lZYb73CPztVP6na1PILxhI0hoD2KjfcQ0kDB9eEXujFiLvkiriXAxvYtxEQijR3KEwAiWHbuvbDn0XDeGd4QQP/Gu2q4I4qo516BYEVeEnbnxzKDAwWUSeDqlc8Nq0mTWYOPkIltCmVRAbndFOHDYM59pxGMafLBgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569082; c=relaxed/simple;
	bh=ockCoErXJYNNWIE4F1OGfTdTciM14pc2rGFj8KF/fos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjaq/+ZtBPh72VsTjaLCc6U74WGWuCfIqlFzw15h1bT/I5i4Fyr1TSnSE5V2NTiRaJzmuP9mdmeRo9UleUfdGIKbGwXiu/kxVfrztQ5CY9qoK5Clj5bAqssQPUavbD1N1hiVXtvElAcmBmf9YnmGWf62Knb79ruE1LZUcDgnnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i8KCNbjb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso12839745e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745569077; x=1746173877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIik2Dicc6zrNNPkgRyVhu5BjNjWoGlcqMwS0QNX8Sk=;
        b=i8KCNbjbmdKc4sIjtJQPP7WgaU8u7kgQvvJRDHolwlBVdzQNI9ZnLo81t6/elcoa2k
         NUlaEF7k01WJT916nRHvbKnszFcNNlbw4nove37EEIIoXPLw0S1h0mJH8J4phPb1gJWx
         Zku/gMC7L32R8ibcJfkj+eBWyLn8Pi3MnTJaD8XIOEkBoP/VKl2cA+/9OSwvILIi+mjn
         fBW9W5Utg7nbmYjM3S2POgZQ9q3w6nsPAsh7LvqS1oNUGJe7cOTruTBSDuzPveswgDoz
         td+zByLQKPBhOzRw1zB+EAhdDTeJJstKvhOYG8JF0hDcUkSVrjefeA5c1msW6+gwu+w0
         hZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569077; x=1746173877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIik2Dicc6zrNNPkgRyVhu5BjNjWoGlcqMwS0QNX8Sk=;
        b=r1E9uUPgoPk9YRQpYtsoJvTyqThq9qrnEQZpqVsxcpCVOR1lPEppOs3kca3OEoZny8
         hL94wtEm4wlruWQ8JJ7iVPO6Lcpb59VxsPjlIzFAR9F64RWFJZikv770EFUFEaES1wL6
         pPqwXeCSXmCKR6/4b9RMfzJFqHBqDHXK+xjNZ+/OYMmIFtEPX/RmCXPTVzK8HxXHQa2M
         fl65uQWP3TxAhiIMW63lc/Lsr6X/1yQnQHP+jDrZJpV1rqVtrMG3psSni7EohZ5117VY
         jG/LgTS1f6VCg8Fxc35eFcwVqHAsKyet0BJIN8RFpKag8GFMAZT/5dTjkBzghiHvM4ka
         MRAw==
X-Forwarded-Encrypted: i=1; AJvYcCVKnbgxawrQx/45CQoh1ezJZMUeYghCoYkDDNmFzkf8s3QzMHa7xZNAA/UgPoPxDjgbQC8XgDXfkcPnG3FQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsCxw71IzbNIgMOFpl+o8qfRzbfwM6yzeBxSYI4UVOPme/GTs
	q4wfsSlX8JbkL7ef5OrtniEEUc30FUpUZwJIY0FJxjY2nt/W1ggXsSplZLFTkHQ=
X-Gm-Gg: ASbGncuqdgLLGVhvzYoRGUcrNEi/OQuwrfe5uESwy88EKNZNXeM9UCMLExFp2HkEkht
	/oy75X31loLXrRupRZRFfSYmYcpSmVDliJjsrP2bCAaHFSLfjZu/5n3ektcHseBK/uIZs34acbZ
	dcsL+3TZ65UBKB1f+cDf65mpQ0blPqqAqwSDecpCMwG0GhxMly73Y3+7AjaY5RYZj7O3QIAOWB1
	Vb+qnjF+Oauawhuodw7hJ+INHDlCUo38TMG76kEgIgFKevvGK13SAUSnjkEA3eHc/BlB9Cl1s4h
	pAuYkAvKvvj/XYcPiwfm0x1BbQK6n/IHdFUkO8jrYt4FBg==
X-Google-Smtp-Source: AGHT+IFtIhw338SCwM97fT8DE36JSktmwAws0V+m2whiTCc2WvjhYcfxYH8N3RZVkd/V19BgPW5uag==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-440a6346aabmr12093055e9.0.1745569077572;
        Fri, 25 Apr 2025 01:17:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8d1a5sm1671072f8f.13.2025.04.25.01.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:17:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:17:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <1cb8c180-a93e-4d5d-a17a-6452dd154801@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>

On Fri, Apr 25, 2025 at 11:36:24AM +0530, Naresh Kamboju wrote:
> On Wed, 23 Apr 2025 at 22:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The "ret" variable isn't initialized if we don't enter the loop.  For
> > example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> >
> > Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Naresh, could you test this patch and see if it fixes the boot
> > problems you saw?
> 
> Dan, This patch fixes the reported problem.
> 
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 

Thanks Naresh,

I left off your reported by tag as well.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

regards,
dan carpenter


