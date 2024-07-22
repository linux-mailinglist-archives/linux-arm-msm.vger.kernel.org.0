Return-Path: <linux-arm-msm+bounces-26722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8A938B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4871F21026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA60161311;
	Mon, 22 Jul 2024 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIiRBORg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD3B5464A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721636470; cv=none; b=cKPNsZzNfarQD8sKOA7Ep/bPQ9xymDJkvnyYVMbnKsnfVRcVzu4BW7N/rAgxAKZIGXVvhs8ZNaGpEC0TluC1zPlbH+zkNvny1xTt4b6iNEu+IoV0rRlXZp9lvO4EUNEZj19Qp9qFU4F4smz78kkAWV7aPXxvcGdIrbaQXoOZp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721636470; c=relaxed/simple;
	bh=1UWRME8UjecgW+uo8uUWZOJ49UnbJYQ+He2u9cxh/K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xya9U8nzq6ApX5zf+kZ1K0lIrPchBkRfIe7tFlkuwu3WMi56o0OUaov4C2T3WsCEKBxckKnVkZJ4+YCnozJRg/r097RjAzB6FVv4mNtJC8BEwPtiBj+qR75/y84qMW6bf7wron4yECWZp5ynAUGybCDXpfWGGS9OQtAtJiYJU8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIiRBORg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f04150796so765797e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721636467; x=1722241267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uO05PChGh3iOVl9QN4C/DTf4iIyJWKDSt2PZpVRmyXs=;
        b=RIiRBORgQTtIkOoxUd+6ViDQx3O7qOwpyGDpNvMjrG2gNYFAfsxtpJAQkWXzGb8vAw
         vOvDvZiXePnpP6k0g1lzHTPOKGeEBdJkMEme4yI0pB1kZgym1oQI/C8SSPChT64vYYDr
         kgy9b1mmojQ7VNOm+Cplb6yFgE9sxkZvKH8Tfg1vDgUQFIgDzzS/G/SFkZvbTkPLdILh
         QKxZ6qvAg/pIXzbhPnIlRqjGzRtYf+tfO6bYjCCz7MXupYHGSeHEe9iUcw4s8iARMs07
         wqzogUc7tGRRPzOQdqc9HSgHICnQgB5aSDlYb+qbFR6TF/KDlav33QT+rO92J0nLN/c+
         0dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636467; x=1722241267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO05PChGh3iOVl9QN4C/DTf4iIyJWKDSt2PZpVRmyXs=;
        b=sH/GjYhH6Axkcyuil7YO8QIgs3UWSP4meK9YLYGqAdjHbksjrZe7SSOZgJ5xaP1uVl
         jTzx7K8fsejob6JHEVoAaeCV5Fpo1g/Ngenl4wP+s/Dd4x9CafFGqJLI64+8YeWiHsUo
         ArzHul1pOKP9AV4253T4eLERXaX9t/ZaTprfEWvdJ5Fvc5n7Je1cAsuki3R6dI3eUltU
         rILMu6TPGuNgrpub4jogHCgKUUkULaI9Yst+P4mtJBqDrSlrEkKv0Pkv0A35mac0D6BI
         ZfaqwiFUpq/IDnTlToIe6psiMLI4qXiH01P6KrFy6BuW52sFOi+XT1RSH5XynFt3H/kC
         OVgA==
X-Forwarded-Encrypted: i=1; AJvYcCVZz+HCpjmOyDMOL0DCzVahUPbXqRdZMX5/TNB4iWh5DDgiCDWxC6vMuiGeqED7t88iRDpwewf9BSD7hGSJ6sbgYD4dfE3o4ZnJNifXqg==
X-Gm-Message-State: AOJu0YyNLzohF3GRagEEfT6gzKGaZVCC7xKpymetvhFaBem8P6+ucN/K
	zBflGD36C8hF9+RiZ9FeCvMj9syhzODWiKl9cvIDwDPyfv5YODUhF60GQqdY0oo=
X-Google-Smtp-Source: AGHT+IFOYzs4W3Sj0Mw1a+T5H+CE0aw+VqAYln2wj9EwBWio131yafI6yp7GnSY6HSkLNUL0nx6ZpA==
X-Received: by 2002:a2e:b8c3:0:b0:2ef:2f7d:c502 with SMTP id 38308e7fff4ca-2ef2f7dc5d9mr18337991fa.49.1721636466583;
        Mon, 22 Jul 2024 01:21:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f01b6a196csm847621fa.61.2024.07.22.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 01:21:06 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:21:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <jbahzoz76s6nei2wlb5zuu3qeigji32hwghy2fm5sftsgcr7fn@hltr7aal5k6s>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
 <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
 <2024072227-purposely-swinger-86ad@gregkh>
 <0d29ff01-9d8c-48b9-b845-3370222c4ff4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d29ff01-9d8c-48b9-b845-3370222c4ff4@quicinc.com>

On Mon, Jul 22, 2024 at 01:23:56PM GMT, Ekansh Gupta wrote:
> 
> 
> On 7/22/2024 1:09 PM, Greg KH wrote:
> > On Mon, Jul 22, 2024 at 11:42:52AM +0530, Ekansh Gupta wrote:
> >>
> >> On 7/22/2024 11:28 AM, Greg KH wrote:
> >>> On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
> >>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>> initial memory requirements like shell loading. The size of this memory
> >>>> is decided based on the shell size that is passed by the user space.
> >>>> With the current implementation, a minimum of 2MB is always allocated
> >>>> for initmem even if the size passed by user is less than that. For this
> >>>> a MACRO is being used which is intended for shell size bound check.
> >>>> This minimum size of 2MB is not recommended as the PD will have very
> >>>> less memory for heap and will have to request HLOS again for memory.
> >>>> Define a new macro for initmem minimum length of 3MB.
> >>>>
> >>>> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> >>>> Cc: stable <stable@kernel.org>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 3 ++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index a7a2bcedb37e..a3a5b745936e 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -39,6 +39,7 @@
> >>>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >>>>  #define FASTRPC_CTXID_MASK (0xFF0)
> >>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> >>> Meta-comment, for a future change, why not tabs to line things up?
> >> Sure, I'll add a comment.
> > I didn't say anything about comments :(
> Oops, sorry.
> >
> >> Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?
> > As I said, yes, for a future change.
> Noted, thanks.
> >>> How was this tested?
> >> This is tested with fastrpc use cases available in hexagon SDK:
> >> https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps
> > Do you have regression tests that attempt to check the boundry
> > conditions and alignment here?
> For most of the test cases, I used the fastrpc lib:
> https://github.com/quic/fastrpc
> 
> This library is taking care of passing proper shell size which is within the boundary for
> all the platform that I've tried.
> I'll try creating and running some regression tests for this change.

Existing userspace implementation provides an example of good behaviour.
Please consider implenting and publishing 'bad' behaviour testcases
which make sure that the driver doesn't break if it gets passed 'bad'
data.

-- 
With best wishes
Dmitry

