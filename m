Return-Path: <linux-arm-msm+bounces-31246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC559712ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19902286BA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 09:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB4E1B29D0;
	Mon,  9 Sep 2024 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9nIJuEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C471B29CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725872737; cv=none; b=Jwg6zBOwvxjAE+4Z/xDa2XmZie+gLEwXNbBDSHHABu/eoeMxTa1kTYIETq5AU83oKuLefw2kO3qlCLUGXT75z4kgfDte/P6yHKnn2QsUT/ELwFpN8Jj+puDMC+nyxVfuTSn5ImgmmkgvvLSGoN7Idhwl5gFvUhobDXCbWPrWFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725872737; c=relaxed/simple;
	bh=BB3/H5ySqRyu6/77CobU02zoSYGnRaT8/VTpD8q1nkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ0w/nrufCn79pxNwkxb1bJWfMgEV9nIaBZSsngWn5MtbiwjOIBkS9QFViZBk5l+gqphJvQKHpYPzQ0PNi0Ey3SobRNjj8/vm9+aGzxFjiBXM4SQXMjrsfRi9CYRAtTLjQiCSRXXsQkBpNtJRsud5qIrVMy8XAnaWpb9AYbgH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9nIJuEM; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so46657257b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725872734; x=1726477534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j2t8R4xfnSC9w9Cn08xrD7PLm+PTwWMORf6NFYOH81c=;
        b=S9nIJuEMT4dVh0P4tUIwaCATrYrzoRETQ4/HdZTDqoglVs+gMU8OSXQPwyLkbDZ8BJ
         DmTUaLUaLnqXeY5BeTOfLsgqymqUAKYot214KfI3u7Vluk8m8vdg4b2VY6IeiqmHS9vq
         7g6ZxYs83syCWeaCd4phgJ/Wz/fwLrA5qioLfMdTDaZazgvkTHmuHzOjI6KiAoFlCGmC
         wpl8zLxamWt00ctZCTSq1F2p3bNkf1NaRcU0zqfWXTGmNFh1ADHCk1vECGL0vBeL5x0c
         wZetgMZpeRPTFq0Vhzk7k5ubgKOKWXTILIM5SMaqCu82fO0Ui4zLfel95u4k1AmEL0y1
         SdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872734; x=1726477534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2t8R4xfnSC9w9Cn08xrD7PLm+PTwWMORf6NFYOH81c=;
        b=NvaQPt1LOinu4s7NSgLhPn/+jJ1ezF52HtSqAybUBbVrmzXcxY99oj1vxWqfyAcMn8
         qv8tCDO548zAYCNzSrPxVkLn/ES5siOnY/OFwOtdL0UUwgbHruYrcBdaYbrFV8wlsfzf
         K8YuBb05LJAfpqdCMQUp56EPYqNS4wsGmFUV6IJduQo5+uIKCnAJTw8pXeXXyLolHC+2
         HKmddos12jMU6F0GTuyOKq0QaPM1nczgytnK5GyEfDU9c4OeRDGypvq5Gm6gznB3BumM
         zgVdH9Gg9bOnYCHpLXZ4Vh4FP6Oqu4wcMbKVn5IyoNiCdWToMGoNTXD5NrkUmRNG6JNy
         lFYw==
X-Forwarded-Encrypted: i=1; AJvYcCUQYhHISMUhAEY2pq8O0GRAOjb6G3JRAGYcoePPa2JmXXBugheojlyPxGJIPNRceHflfujewkE0uYKkEUUx@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSzNoi/Rw4GPWJvv+fLzSv6xEPkLmL/GxfPDyaKs3tDpjuPWr
	cXD9hHhj6hj6cqi/3q8gcsIMp9NK4GZJenmpYPpjrVA/c0a5q9Do6NxUWCdiv+hRLNpyBBN2maV
	y1+8WfJeqS8F3jCwz+u3TXrZ3TJ+NREeA2VZ0aA==
X-Google-Smtp-Source: AGHT+IG0rmU+PJ1sUsI9xaYzlyO0fuHlZgEClWUHvIo++2qG8J7dLhkan6PH1kB/kHCDTDrPTR3yTt3ldtPN97UpiV0=
X-Received: by 2002:a05:690c:d1a:b0:6db:2753:cd9c with SMTP id
 00721157ae682-6db45273f36mr119317517b3.44.1725872734530; Mon, 09 Sep 2024
 02:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
 <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com> <68b0476f-dfa1-44cb-a01a-f4afbaaa98e5@gmail.com>
 <vtdrxh57zxpu6xktzehcpx7hkaqclg5kya5jojrbkmo76yswxx@libmc5evobkb>
In-Reply-To: <vtdrxh57zxpu6xktzehcpx7hkaqclg5kya5jojrbkmo76yswxx@libmc5evobkb>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 9 Sep 2024 11:05:23 +0200
Message-ID: <CACMJSeuONLsWy3rQnLsOxm-Qqgcmd67XNhCMPvTd=UtgYoPfzg@mail.gmail.com>
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM allocator
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rudraksha Gupta <guptarud@gmail.com>, regressions@lists.linux.dev, brgl@bgdev.pl, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, 
	quic_gurus@quicinc.com, luzmaximilian@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, srinivas.kandagatla@linaro.org, arnd@arndb.de, 
	quic_eberman@quicinc.com, elder@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, ahalaney@redhat.com, 
	quic_djaggi@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Sept 2024 at 11:57, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Sep 07, 2024 at 01:49:02AM GMT, Rudraksha Gupta wrote:
> > > Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
> > > happens. Can you confirm that the QCom SCM driver probed correctly?
> >
> > Thanks for looking into this! Please let me know how I can help!
> >
> >
> > I've been building the driver into the kernel I believe. Here's the relevant
> > line in the config:
> >
> > $ rg -i "scm"
> > samsung/expressatt/linux.defconfig
> > 1615:# CONFIG_ARM_SCMI_PROTOCOL is not set
> > 1627:CONFIG_QCOM_SCM=y
> > 1628:# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
> >
> >
> > It seems like the scm driver is being probed:
> >
> > ~ # dmesg | grep scm
> > [    0.066438] qcom_scm: convention: smc legacy
> > [    0.362543] bus: 'platform': add driver qcom_scm
>
> The scm driver is added, but it is not probed as there is no SCM node in
> DT. I'll send and RFT patch to add it. However the issue still persists:
> the driver should not crash if there is no SCM device on a system.
> qcom_scm_*_alloc should fall back if there is no SCM.
>

Ugh, so some SCM calls seem to expect that they can get called without
the SCM driver. It's not very intuitive, I would expect that the
driver must be up for SCM to work at all.

I think we should fall back to using kzalloc() in such cases as
there's no struct device to use with the DMA alloc APIs. I'll prepare
a patch.

Bart

