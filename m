Return-Path: <linux-arm-msm+bounces-7648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88F833160
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 00:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 900901F231F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 23:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA33458AC8;
	Fri, 19 Jan 2024 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IpWjv6nK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50D38E
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 23:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705706063; cv=none; b=eKJ1biUws/RmkcfeIviUEuelbgMsUosH66Dgt/Ych9i0oE57+YZcPkapY9H4hKHBxrzPf3es3rLUCdEIp9PTszF3jI1t/fIqNbI/p6srDCb/7hV+SNP1Tz97PkCvtP6OPgRmecOSspYfr2LYs2uwCEosnLf0fYTXnTQ90ljWfYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705706063; c=relaxed/simple;
	bh=kZpKbyynWESgUl0uuZ+KU22BQhOS8b5sl21BsX0wLx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUmdjOQ3dr2ON/iwCkVDpfP7W0a/SBuVQHAS2/iQHCKWxoN4EuVTX2Yi16HtUGJcFk3mWO1HFoLpT2HHK9jKOqp1cGbkc64GJw+tZgWpXOmXdaXuKAaoFbTp9XQ7PKC5GCFVDOSorVCg4nbcuFtkWlAXJc5vxzWLJm6Ge/4N/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IpWjv6nK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705706061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IMTTMTFrFS/hDLax2Z45JLr+klfD0L4J5v64Meay0Mc=;
	b=IpWjv6nKi/kmLrZzFxbDUA9bs+P+nPTiNmah9mS9RU8Xuv6unu+wdesyd62mY8Ztgrnmdh
	WzjRKQwhf5wP60bEiGIt75PFHS0wdctJv9DTcCcLIHPTf4QuRfJdREb1+KSNRi+LFNAxPA
	bN1pXHNWuc009PFleHmmY1Om+zIvHmo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-xhMdzpK3Odm2UXBacn6PGg-1; Fri, 19 Jan 2024 18:14:19 -0500
X-MC-Unique: xhMdzpK3Odm2UXBacn6PGg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3bbacb61978so1320436b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 15:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705706058; x=1706310858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMTTMTFrFS/hDLax2Z45JLr+klfD0L4J5v64Meay0Mc=;
        b=cqDFyMdPQo9IHg/hsBFtC13RV6TWpfa8w92XxJUyER2YfHo+KzP2pKKCtY5x1l/cB4
         4MAio1KugschW7UhyYjToCYapBgFMZvpwFUDv4xEg6AeOHbcnPRnNq2/9TQgy4h25xhZ
         YdLxEE9Hsl3C4nTBuxLQKgg4IhGw3bE9eAoJ9LrzOEt3BDdcnRVqiCN97R0MS9OKPzg0
         IRcS2MvxKZhIja7fcIgzzeYb7oa4fiNXKoBy4+88Fn5QHhDGf3lFbmhAqUgqFCS8bJN5
         CcRajM/uxMOwIZ8iGU80Wp8/iRxr5GPfrCa0Om6HDl76R/1+j/Q5DstlM5FjJFIjdwSo
         WjHw==
X-Gm-Message-State: AOJu0Yxwmc/g8CGjz8gkztV026vvt3/WHENT7qRrHET1sCL00aI6IJIk
	aRaekr+H9vgEs81dQTZIQmBAs3aoI/VxkUDoRnZNtqwYdY4cV1JD0BixcbdgWIWapYYwR3afrAS
	Ng93wHItqgIjoqwuwwdyUfMV5bBq53jVhv+31UEpe4WCp3MLbu4YrtGCiFuP9W8A=
X-Received: by 2002:a05:6808:2391:b0:3bc:397f:8417 with SMTP id bp17-20020a056808239100b003bc397f8417mr554717oib.71.1705706058669;
        Fri, 19 Jan 2024 15:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFeZR1Js78cUlb/ZNm/Xg6eX76UZPg+xKRA2k+vfZDoAZntm0noJDGROKATSPW/KIKbkXygw==
X-Received: by 2002:a05:6808:2391:b0:3bc:397f:8417 with SMTP id bp17-20020a056808239100b003bc397f8417mr554709oib.71.1705706058414;
        Fri, 19 Jan 2024 15:14:18 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id pc35-20020a05620a842300b007832961ff29sm105588qkn.4.2024.01.19.15.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 15:14:17 -0800 (PST)
Date: Fri, 19 Jan 2024 18:14:17 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com, 
	kernel@quicinc.com
Subject: Re: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map
 updates to SA8775P
Message-ID: <uhi3qf56tohutn72rk75bkshpggc36u7sw545d2u4c6akiljeg@2ysqdrrgfru6>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>

On Fri, Jan 19, 2024 at 11:11:44AM -0800, Bjorn Andersson wrote:
> On Thu, Jan 18, 2024 at 06:58:19PM -0500, Eric Chanudet wrote:
> > On Thu, Jan 18, 2024 at 09:27:11PM +0530, Ninad Naik wrote:
> > > New memory map layout changes (by Qualcomm firmware) have brought
> > > in updates to base addresses and/or size for different memory regions
> > > like cpcucp_fw, tz-stat, and also introduces new memory regions for
> > > resource manager firmware. This change brings in these corresponding
> > > memory map updates to the SA8775P SoC device tree.
> > > 
> > > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> > 
> > With next-20240118, without this patch, running "./memtester 32G"[1]
> > crashed the board quickly during the mlock:
> > 
> > [   42.144892] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
> 
> Sounds like just passing "memtest=1" on the kernel command line (with
> CONFIG_MEMTEST=y) would trip this...

Actually, this does a better job, not having to deal with the
oom-killer, and picks up the following missing region with this patch:

[    0.000000] early_memtest: # of tests: 1
[    0.000000]   0x0000000090880000 - 0x00000000908b0000 pattern 0000000000000000
[    0.000000]   0x00000000908c1000 - 0x00000000908f0000 pattern 0000000000000000
[    0.000000]   0x0000000090b00000 - 0x0000000090c00000 pattern 0000000000000000
[    0.000000] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP

> > > @@ -373,8 +378,43 @@ smem_mem: smem@90900000 {
> > >  			hwlocks = <&tcsr_mutex 3>;
> > >  		};
> > >  
> > > -		cpucp_fw_mem: cpucp-fw@90b00000 {
> > > -			reg = <0x0 0x90b00000 0x0 0x100000>;
> > > +		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
> > > +			reg = <0x0 0x90c00000 0x0 0x100000>;
> > > +			no-map;
> > > +		};

Re-introducing 0x90b00000-0x90bfffff as no-map passes the kernel
memtest=1 and boots with the firmware I have.
My previous test was incomplete. Please disregard the Tested-by.

-- 
Eric Chanudet


