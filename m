Return-Path: <linux-arm-msm+bounces-55275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568AA9A2C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44D819451A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069D9199396;
	Thu, 24 Apr 2025 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbFclHgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B53FF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478167; cv=none; b=sx2yUoucJMZ7gqZ9TuON0y/w//mF5y7WHvGZYOpfspvZcNf9/vuQ2/oLrHbVcW3VucRCPuG81aqkMOMjMFfcybSHOfBm3qAY76g9WauVz526ekFiEcqqwBSnsvGz46rzQRHDwz2Q0J/Tm2KE/8J8qlynQEgzIZcuE1kwyjzGqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478167; c=relaxed/simple;
	bh=CsVdIY8q46bTxLPbuwJ8cUP2eUiwXdsgC6RMjJcwonY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9NbXVpuYrpqLhhrMCXE0A4QT6V3UWf7ojFf8KcVKwKVHnk64VL7x9Tyn6ISvolmB7wwlKe0N/93xU9T7HuoMaglJnimBi3fV/CAtayLXu/Su4OXofavr+JV/Qqzh3rrZVVXpVKTIIl2CVfrN844VsyKaAfdlL99wyyGnpZQl2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbFclHgN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso102969866b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478164; x=1746082964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=PbFclHgNjB6RXMecnfIP+Z73qquzU3VIwvxcMjTs4FsrIcbOh/LblRF3NUS4LZfc5y
         ZpCZ8iSj72X1+S7rKtKjYOgzEwam5ASSq7FmFQsu6+NEUUwFI3PDrHuua6eXGQ1eENHH
         +gUZzwTVtO4p4o8zLhYjoXOqoCTIZjdwq43dKKMkroVaj5O7OTlYMIiWPClNx9icGA/O
         6M8yEnilRKLdmNngmnbBLtndXiezGTt++7R6Yf9ACl4E41Uq90JqzIU/pNtYPgrLHSUd
         3DH5g+7z9OR2JE8v1AsfAXbLN5xHzWveov22VvaN38zQrDfdX6aZNyzEC6IK+/wLUwPR
         s2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478164; x=1746082964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=Sw4aOhbRtV01Twa8nxPv2EoLBKTun0RonI/FppJdLy3fAeks9Uik2nr2iADisMsbd2
         9GuYXVpXXGZ8a5zgnjU2o4mbkU22puYosOLl0NESj7nrtYq6InNzCxBLWXOnc9L2l3TX
         jPh0QgxHIeKuG6nCWq2iDRz9VTZySBDz6bglqFSIR0eSFpu7NPpeTSUKjIg6da9Vg5ij
         ET7HGavPKILvONickuSqsD9ZEL29c2KQ9N00ZFnWAKD5+PJSE1d3AipQP/8+056BX++6
         m65wqTlgYbE3DXQN22zwy0ES49GoCxZcuG54WfXwd5m2Omc2v9yqtauVdTl+d5iAJEGU
         uRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW4isuPU5aXefUkUWmalcSms9b2LuMnXOHxpGBZdFGbNAQIWkzM9st5ZnlwNi1H6RB0aSZfAscfyLrWdq9@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBFL5cfPI17e5LQfX1hbTLfFbIp9FPXhBOv+5vwnrhG17XP2U
	tS8TaPhq0LYGscGiiLVF6jT8b0e6qnVIhzlMROMYJYf7NA4Uv46ELXZFdHxyWRU=
X-Gm-Gg: ASbGnctr8+/d0tgIamDePVq0AXivvi6/h86fa43O6S9KYUFD1CssRGVs9nBmDF0l2+8
	vwnjYmvcSJuD7sDjHE0KB/gdcFT9AUngsZjajqQ0AEV+lEaM82ujzq3ekByRrKI8gpsNEze5PwG
	AU0km0iAfAjfX6wX8QC0lxJ82VmPQjOMv/sVMEHiI1aHNALEnvtUzW2cITzZWpnQdxM4Zp90Sca
	Hpf0qthdASyp845xK/DonBejDEyv3GliwjLd0/9B41yt0KouPOUFbrZC2BM9j4X2/9GIxvura4Y
	rqLY5u6D7NARVl1biSOJOBH2RYgVsKEMx0+NwQ==
X-Google-Smtp-Source: AGHT+IHRRXGrXUDu3+rG3nESpdOVayw7JgdtjaocMACREgykhsz0BZozqMiy2x1NiHc65DNK79egqw==
X-Received: by 2002:a17:907:97c1:b0:ac7:95b5:f5d1 with SMTP id a640c23a62f3a-ace57494ecemr146858866b.42.1745478163982;
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace598f6b97sm57765866b.75.2025.04.24.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:02:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
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
Message-ID: <aAniEGwKKRUieo5G@linaro.org>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

On 25-04-23 20:22:05, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

