Return-Path: <linux-arm-msm+bounces-12079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C985E055
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 15:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6ED1C23FE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9E07FBB8;
	Wed, 21 Feb 2024 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEkUQiPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138557FBB3
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708527284; cv=none; b=gZtygcdzNGqnF1F30IpEQggA83X3i+cxl6te71ke85dRrA9sOUzrDvgF2FdspgXr06z9xfVxys9SJcMq8rZZYbeFMt7yqnNAtvTd7Na9YzG28KtONKlqEc67YuvuNqe5eGyfhi024z0W9VDKTk4lZlo14QVmUnWBgI8sswlTrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708527284; c=relaxed/simple;
	bh=d605qvE8oJLHFh8wYpuXeD8Ss2JHKYc9jQTlWWU/2bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6sVBpJg5SK9MvN++U1ooAJmzKMQ2PF3DMq89U0UMr+LjZqpOB4wU0NZds3j1QFP+4uNOJobsI05ptakPzFHGENwW5BzDAacgEZeuoZ7Pdsbt28ddbITwb7882qraG8TogmlFP9ZjbrPk9l4IzhQfGMe8sQOKv/tSGH6B7BvhM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEkUQiPu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3d5e77cfbeso1173210966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708527281; x=1709132081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PwDrSDwbjDuhxc0snjMmTqWQWr4yGG/YePGvnYIgDzA=;
        b=VEkUQiPuRTysHhqswZ0Unv01p4biFu22CZMoufZ12rNK2Aofk3L6Pm1+GqyS9YyFlE
         ghwh+rIlsf1L2Ek4khEIWz/bC2mRCoy8uT4dPVaruQZbbwLv/UUwjGexH1DMoHU/h/hY
         VyApC0OubwFJTskhwJYnGI8AFxnc+ERG9xuPVHcGQUa30aJlaAk0s2Y0ZLnJInuMyPa7
         WJm0Wq2NWl0iUOpG8qCBmDCQVnH8fkdIm80UaXggsZUhSL+UD6kh1WNyrIe1tDlWxPU6
         aWwEV+Nshtwd2JDrXOP0422nec9J+ZZvw6jupXRrvoZBraD37YzQf6mexQ97m5SLHqWL
         YTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708527281; x=1709132081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwDrSDwbjDuhxc0snjMmTqWQWr4yGG/YePGvnYIgDzA=;
        b=b4Y79eoNv7MD+tgq+Km0HtxnyKN7ULS8gC0ag2F78SojKWRhtuExqJO4erj6v1ov8j
         VaxLghmTqKvf8xJ3Cf4rieVOI8EN4vqmscivNXFimJn9Xvw/kmwJ7kKhklr2iwzigcHC
         36RkcpKy1Mx/+XdAXsH+octeFStD8WMyo6uI2f0cEl35xlPiSCSG31t4+QGdxJoCCyOs
         VnlMFd9i6ivISktQOUbBx1n7cfS2+8Uj1weiwB8NbbXlgLLXK0339jLl6F5PjKni5iFn
         KJZVaTVQV1q5iym8WinPOzh1m8s9lnoC2lknXPVfEDiIZHNhl/gIHX2dzEYVN3Y8uzNV
         wdzg==
X-Forwarded-Encrypted: i=1; AJvYcCXvNKHLgYB1l4i1wnNkeKKPha6sQy+G1XjgI71eeMYKogl0ghq4BSumN6WxFK1SOs8J9uLjWBcJm/gxiagdSzDQnRRhuhD2qPN4wa8xXA==
X-Gm-Message-State: AOJu0Yzdwfgund06E6Y2p7KKYsX3RrFieaNOgd4du7Ey38eSi7bYdKBn
	KhaCc2rtxvAuulxd3VFtJsjiCnsVCjqbg+/TECKPTCCSQrk10iDOA3y7yHuAOnE=
X-Google-Smtp-Source: AGHT+IFa0ka2O3YAMzNW85WaQJjneiiknkL9slfUTJVV+TJHkqkF2wZ1NixE8hX5BSi21jsQvB7kdQ==
X-Received: by 2002:a17:906:fa87:b0:a3e:c6de:e5ae with SMTP id lt7-20020a170906fa8700b00a3ec6dee5aemr7804788ejb.0.1708527281343;
        Wed, 21 Feb 2024 06:54:41 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id mn6-20020a1709077b0600b00a3e12ded9b7sm4755684ejc.169.2024.02.21.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 06:54:40 -0800 (PST)
Date: Wed, 21 Feb 2024 16:54:39 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: Add SMB2360 pmic dtsi
Message-ID: <ZdYOr6/8dupbMdbF@linaro.org>
References: <20240221-x1e80100-dts-smb2360-v2-0-037d183cc021@linaro.org>
 <20240221-x1e80100-dts-smb2360-v2-2-037d183cc021@linaro.org>
 <bc45229c-6412-4fd5-ba8e-28b293d7864b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc45229c-6412-4fd5-ba8e-28b293d7864b@linaro.org>

On 24-02-21 15:41:41, Konrad Dybcio wrote:
> On 21.02.2024 15:38, Abel Vesa wrote:
> > Add nodes for SMB2360 with the eUSB2 repeater nodes.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/smb2360.dtsi | 51 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/smb2360.dtsi b/arch/arm64/boot/dts/qcom/smb2360.dtsi
> > new file mode 100644
> > index 000000000000..8d7bdb56e6fe
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/smb2360.dtsi
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2023, Linaro Limited
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> > +/ {
> > +};
> > +
> > +&spmi_bus1 {
> > +	smb2360h: pmic@7 {
> 
> Hm, I'm not 100% sure about bringing in this letter-suffix notation..
> 
> But then, is there anything better? What are they called in schematics?
> SMB2360_n, perhaps?


Yeah, just realized that this is wrong. I need to do something like
sc8280xp-pmics.dtsi.

There are different sources of information for the suffix, some of them 
use smb2360k, some of them use smb2360_0. Will go with the second.

> 
> konrad

