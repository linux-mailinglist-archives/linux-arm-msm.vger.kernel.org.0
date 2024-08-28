Return-Path: <linux-arm-msm+bounces-29832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58D963138
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11261C23912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7347E1ABEC4;
	Wed, 28 Aug 2024 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCusYVUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943E1A7AE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874564; cv=none; b=jq5u7+oUiuleochm0GMF+Ic3riavyFz06vCctHauNUboF4V/sGu6A++sA+nTM9lydPXfc2gExdRDmf7TIIUh0dfOrBLCPMJz6B8zgTExyainmAnNxo3UCzdLbGeDEKF90FFS3AbqhMtOe6/g+7oD1V/bjgmPEe5Z492889q1KIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874564; c=relaxed/simple;
	bh=iCpcqPThAPmZLodK+uZfdz3ZGn7+GEtpWdlwHYhSoSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCu/PQcKKQyZvauBEA0oUejrkGvPD65LEHZHRXYoxtoFgpRjSimljJiOR1UL3mL7gsGcQ1Ed42AM022BZvrIZedP+B9XuT2SEL+52kj/oollfFkNoh/DKBsdrGcRm4O1qvqHGhap5/A332kH731JNpjUQkmBdzQNDpJCh9LD2ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCusYVUw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334fdabefbso880834e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724874561; x=1725479361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WfREJfZgElEweHVwJvSVEk/D+r54zJQcIccfYEdIZSM=;
        b=mCusYVUwhkOoWoZ7j3rRMP0aB6XymUwG3Nm3ngxRb5Kf+WyEQ7vQT2kxWYj7ejOKGQ
         mXisgKT1Q3Q/tVY6bq7qla00l86iqNZPDbsYpv4eGkRtxDabeALMxyuvSAt/cg9O4gXm
         CGBG/JWAT9d1Jx27KwioaHCgqdQXBjTsTGsurBwSiqAjGHd4wVJjn/+1UTe4ObDjfnaR
         xmWHe0l1QYpDt0uUlk5c6Ak65AN4297l4FMZxgBYkYVGKgXHcsG/aEb+7JRs5xoxI+pw
         Zaa8/9NsRdzr+Xvym1ITN/eLqnvac3QHRysQmZQ2hDmflO9onPZ3OJyEfcV6zHF1vczm
         Qmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724874561; x=1725479361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfREJfZgElEweHVwJvSVEk/D+r54zJQcIccfYEdIZSM=;
        b=mUBxPvouS2U/pr9ilfUi/wFa7T+HZ9jE8ugsyJ9E5BgtAWoVZdpzNYQjrwDWrc9Y4y
         l+WtNlEYm+FDfm1vgfHxwYL2rcYmeVJwPIvZL8t+F+mWzWaFmdQ86xg+DEDRMN3GBcZc
         Sg5Zsu1y45h1NUT0xIP2ya1RtXWOq31IWrFAKkQpP/3k+5yp7A4RPJyivVwN27QN7qw0
         L/K7Wm1gZrwXiZVpdiVPfaosWZX7qZXiZUSgtXsAjYe/lq7GH3JYUQmL4M+v+AjQg0QV
         jU2JtmGT21O94raMEXw5ttS/oSb67Ube3Bbk5xBOWSSPwEFhKLdpBXCk8Pz4IOq+g2IK
         vPkw==
X-Forwarded-Encrypted: i=1; AJvYcCVBh3TMeyrgW3JNPhNnglckcTXiUQQyQRTsmmi9qSZHXfYBeKIyx551DZSCDuHuAdiALasjXO76Z+G2ceEx@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVZ63IB1fEXZfwGMN4YQfSB2/d5V5evPkrYgXYtfo5bt5HGh7
	/BKpHg+ALR5fP+5UwPrFp0EQndIwScuRF2N+sbJ5VqqQVfSX4/xMnLmq/WJJjZc=
X-Google-Smtp-Source: AGHT+IFR6avFKpr2wHph931hDBC2z+rTIPVUVlBNS/Uou013Y8gMhOrlNprLkZ/3P1WLSkHYPJBA7Q==
X-Received: by 2002:a05:6512:3b97:b0:52f:228:cf91 with SMTP id 2adb3069b0e04-5353eba3ee1mr78077e87.1.1724874560042;
        Wed, 28 Aug 2024 12:49:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea99933sm2248052e87.309.2024.08.28.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 12:49:19 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:49:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Ling Xu <quic_lxu5@quicinc.com>
Subject: Re: [PATCH v4 4/6] misc: fastrpc: Add support for cdsp1 remoteproc
Message-ID: <vuviyau3vbmf4l4mfb47lyh2n2t65fy3j2lxrg5jtyuz34kil2@q5ytlfdcmf7x>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
 <20240805-topic-sa8775p-iot-remoteproc-v4-4-86affdc72c04@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-4-86affdc72c04@linaro.org>

On Mon, Aug 05, 2024 at 07:08:05PM GMT, Bartosz Golaszewski wrote:
> From: Ling Xu <quic_lxu5@quicinc.com>
> 
> The fastrpc supports 4 remoteproc. There are some products which
> support cdsp1 remoteproc. Add changes to support cdsp1 remoteproc.

I'd very much prefer to see this abstracted somehow, but it seems
impossible with the current driver code.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> [Bartosz: ported to mainline]
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

