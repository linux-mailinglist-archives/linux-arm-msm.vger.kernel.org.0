Return-Path: <linux-arm-msm+bounces-3598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20151807A74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 22:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8FCC2824ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 21:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BFC70969;
	Wed,  6 Dec 2023 21:31:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5CCD4B;
	Wed,  6 Dec 2023 13:31:13 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d7e56f6845so172152a34.0;
        Wed, 06 Dec 2023 13:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701898272; x=1702503072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXOKcwNylDDzpj359uSheKfusXLn+oML8Kk/hPty+vk=;
        b=trLYAjApi+4jVlwzW0SLWoeRfikk/L2itL6GTuBd6q6c82gAHTMLCFvv6DNqLted6w
         QhlHnk2QHWvsk9bzfZ5+7J6kkL5uMdgXmNeLJyqVL05ZWAagjxShl95gs1bZeD4KjfX9
         amp8ODwkC0NMkkSP+QA3qFRIFAo3dFZ6oT9Z45ILSptS5CULQUjAF0EleiuX2VLhPxDK
         XOR411cl0vsBARPIvLxRp+DxGe69YPGXn4LFCrr48KvNwhvsjEjYeEkZwC2Nieesimr1
         YVKqcm3xVo5vBL7/6o76x3z9WPz56Xc3UQiOhY2wdq/r8PwpmZmmtUataLg/saxk625m
         TmMA==
X-Gm-Message-State: AOJu0Yw8ebGlZMqyzP96ZqIFL3r/wYjYj3AJk0djkgHGaBJPCXthJb9C
	2y3vMey+jcJXgYnXOzqa1Q==
X-Google-Smtp-Source: AGHT+IFtumfUIKo6aBSB0vh1CEIuF8AUYhrVdYrLyd/wuCnXSl+flurWmeZTod8cYMx1talrMVK7jA==
X-Received: by 2002:a9d:7dd5:0:b0:6d8:585b:410b with SMTP id k21-20020a9d7dd5000000b006d8585b410bmr1698733otn.8.1701898272290;
        Wed, 06 Dec 2023 13:31:12 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n16-20020a9d7410000000b006d94fa88156sm114804otk.14.2023.12.06.13.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 13:31:11 -0800 (PST)
Received: (nullmailer pid 3358370 invoked by uid 1000);
	Wed, 06 Dec 2023 21:31:10 -0000
Date: Wed, 6 Dec 2023 15:31:10 -0600
From: Rob Herring <robh@kernel.org>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, frowand.list@gmail.com, dinguyen@kernel.org, chenhuacai@kernel.org, tsbogend@alpha.franken.de, jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com, mpe@ellerman.id.au, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, jcmvbkbc@gmail.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@quicinc.com
Subject: Re: [RFC PATCH v2 2/6] of: reserved_mem: Swicth call to
 unflatten_device_tree() to after paging_init()
Message-ID: <20231206213110.GA3345785-robh@kernel.org>
References: <20231204185409.19615-1-quic_obabatun@quicinc.com>
 <20231204185409.19615-3-quic_obabatun@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204185409.19615-3-quic_obabatun@quicinc.com>

On Mon, Dec 04, 2023 at 10:54:05AM -0800, Oreoluwa Babatunde wrote:
> Switch call to unflatten_device_tree() to after paging_init() on other
> archs to follow new order in which the reserved_mem regions are
> processed.

You did this so that you could allocate memory for the reserved regions. 
But unflatten_device_tree() can already do allocations using memblock. 
So the same thing should work for you.

I suspect that moving this will break any arch that called an of_* API 
between the original call and the new call location.

Rob

