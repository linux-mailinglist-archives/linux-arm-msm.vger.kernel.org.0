Return-Path: <linux-arm-msm+bounces-7275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173082DC95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 16:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E5B1F22518
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 15:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF9817984;
	Mon, 15 Jan 2024 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCGpj/vy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4365217985
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705333648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnzswkQ+DuK9NjL9QK0UKKPu2vm7bCrl7oml7Skr2oY=;
	b=GCGpj/vy1MLO3RP2wvS/EIYZm5YIn4/2QWs1Dhd90DtAdtMYfJNXXbA3yTGWmxNQDM42kc
	nAJvFOCY4iy8Z1vtTUSHABqvREKs68TBzfWKxnjokbbmlNKhOf0JgaPrixdZ1D4lTH6gPD
	tbxL9zg9fTfwTgMB8I289hpB9mAKUv4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-LGoaGbQ_OZqmmFYqjHwHow-1; Mon, 15 Jan 2024 10:47:05 -0500
X-MC-Unique: LGoaGbQ_OZqmmFYqjHwHow-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429899f12c8so118124631cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 07:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333625; x=1705938425;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnzswkQ+DuK9NjL9QK0UKKPu2vm7bCrl7oml7Skr2oY=;
        b=AVRTZLLeUo7hjCuE0cD2K9l6a3RNOtyF+/c349IeD3biswbHG90F/HQePquTvQNK9/
         zQ/T3Bc4Uj5w2G4LpDs3EtKAUVUB78cwk4GR8tACymA7qA2jFFMDFwH7crenc17tan++
         ZLSoC61tH70tYnjZh9aGW0k8P+QqL4xqpMqBLRqxQlRz+r2K0Qhrj7Shm1AP0PgqNMba
         hcelLju8QwukQN+0WDkrwJItjlMPp/0WPZoic2/CxdfrVBQTxnA/gT9/hSjsDYXAxmFT
         WuLDOSjuium7k3UxpqyU/TtX+pFz5DkCt40tMRHlnqOtey2J0dqC4SXR530Y6hUmqPSI
         zWYA==
X-Gm-Message-State: AOJu0YxQrLxGw+2oV5FdB6duCV3mzGItDHGEOmEgou1tRX8ertXaG1c3
	OTQIpxt90t6csYePxpXoOUKB1Be7PkcbCNebeAocRvq3G2jbuRItnUkDWDqMTCpw4JZCar5hmYu
	2JVcLYxjj+IOLxqcKuy5jrhb+GATdH9cMXA==
X-Received: by 2002:a05:622a:3c8:b0:429:d043:6a11 with SMTP id k8-20020a05622a03c800b00429d0436a11mr7947982qtx.33.1705333624861;
        Mon, 15 Jan 2024 07:47:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFp3tM+8GK9TNJa7xv7RBILG/5a0z3VZf3ahdtAakngZuECE5dAGmy/UIce3ie1YgIY6zPzA==
X-Received: by 2002:a05:622a:3c8:b0:429:d043:6a11 with SMTP id k8-20020a05622a03c800b00429d0436a11mr7947948qtx.33.1705333623644;
        Mon, 15 Jan 2024 07:47:03 -0800 (PST)
Received: from x1 (c-24-2-114-156.hsd1.pa.comcast.net. [24.2.114.156])
        by smtp.gmail.com with ESMTPSA id f12-20020a05622a114c00b00427f1eeddccsm4004027qty.38.2024.01.15.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:47:03 -0800 (PST)
Date: Mon, 15 Jan 2024 10:47:02 -0500
From: Brian Masney <bmasney@redhat.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Shazad Hussain <quic_shazhuss@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Eric Chanudet <echanude@redhat.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
Message-ID: <ZaVTdlyhuKFvpz3D@x1>
References: <ZZYTYsaNUuWQg3tR@x1>
 <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com>
 <ZZxgCKQmQdUL81pX@x1>
 <d9335515-157b-4b6a-ba41-c31ca76362ee@quicinc.com>
 <ZZ2-P1xzsDwk91Yq@x1>
 <37ff80b1-62fa-45ce-b181-955cc887d47d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ff80b1-62fa-45ce-b181-955cc887d47d@quicinc.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Tue, Jan 09, 2024 at 01:56:30PM -0800, Elliot Berman wrote:
> Things have been a bit more reliable for me after adding the power-domains.
> 
> Are you getting stuck at the same spot or somewhere else?
> 
> I've been looking at a similar issue to [1], so I wonder if maybe you're
> facing that instead.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20240104101735.48694-1-laura.nao@collabora.com/T/#m39f7c80b59c750ee4c0082474c5c15b6055927ef

I had some time Friday to setup some automation to bisect this.
Unfortunately, I can't reproduce the hang on a sa8775p with the
upstream ARM64 defconfig on linux-next-20240112. I can reproduce it
using Fedora's arm64 defconfig with the same version of linux-next.
We have a lab move going on this week and our sa8775p boards will be
unavailable. I'll start a bisect with the Fedora config once our boards
are available again.

Brian


