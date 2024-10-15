Return-Path: <linux-arm-msm+bounces-34496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDBD99F6EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 21:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBF928440F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 19:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6961F80C6;
	Tue, 15 Oct 2024 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWhrTocf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E91F80C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729019652; cv=none; b=q2R/HObBqzCEGS9QBR6JiD2vxOcVoFriaDHj7lOudxJ6vM5ZduhgOlGMuSHgQ1Wi/5iZiOLo2TZ/XaraDMCvIzsptWWC/lRgQFksi0lQ5JA0PcMThvqVAGgv72H67v0H3iJiGanNfj6l1Aqz3i5AcygF2XkAwyxfUDhcDk3YTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729019652; c=relaxed/simple;
	bh=QUoW+EGnL7qEE4er8qsyyGx9npMLqKSngGSxVh0Bvwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RX+wICUp1XGfCbZG5OYii5vQS4IIn0PU4jCtJ2IGlps6QuR8hIsE56m+rMWWeacv/mqVp9AIPjQZVOdLqjfvf8usRqzlQjGLPPELn8Nxfw2sDhT0SZ6rd63o4FB4Tr3t4jF11sOSTfPY/0CxMsS1qwbsg+SKzj2SkSisFCfSWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWhrTocf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FCQacQ028136
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 19:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cChTWmJW9sMMLpKfYU94wqDx
	FhEeKmeOjvYClAJ3yvM=; b=eWhrTocf5OORogsXY3ij0QSbBDIz9JMqr15e0a4v
	haJoJ8xWmTmKOr/X+FWZyx1PP+pnt9NDhqR8G9qMOA6hIHsBtcPjny53mQ0dTWdj
	AIiFHBS7dyaBJUeWv0fgGVP/ze/1MJC58iPhZoblNbXU61lmnzW81yLDMRKtq0Wd
	vqgjCF/2pcWixxGYqKVpp3Jijlffr96E7bYGLzf/o6rv9j9L21XevMwSffD5IBx9
	Hlit1IetcdSPruKlvYI86cPuhsIrZDT9Vgb82QRelwiDcIbkvKh4g1Jd8DIjNoFS
	7E24Tl11uJnurHMCvZvzxFwSW9ICH97i/u+My/dwG0EfHQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429exw2p11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 19:14:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71e6a7f3b67so2713989b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 12:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729019647; x=1729624447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cChTWmJW9sMMLpKfYU94wqDxFhEeKmeOjvYClAJ3yvM=;
        b=hqKencf2/hPLme+L2Z15mycvxGKv65BXAevWs+PzZ71ohpzPE7uInCBSPpvUEn83fx
         9za3o0gOo5aIySSWd89l/wKXZwhIf01iBqMi+om1zkZ65BEAP4eqRa906A+bpyhUKEiT
         Wo0JGG6SnSCRaZYiiunV+QD1xhkeno5PRVaEv95ju55hlAJK8cNt90lhJVNE7Vidpmyd
         ayRTFzRApaO6qXFz0oXhfHcXW7rQecBEr+yvuPVLfQ+xVdRwt6oBKzIC/csUDBQ86K49
         pRkDPcADsUanmWcIlqsywHCtIMNlZULB5yr/ZJXHIo8b8FAlJVe33gWChfbQICeWy61j
         yxCg==
X-Forwarded-Encrypted: i=1; AJvYcCWkQdQFrHk7e4370WFv5S7NgKz03Wg25rEpqGCGLrJ7xMZVMc7boItxaSWPUu1dRXr3+Y/WNeXq+B23rSUR@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1KEiLPjdEzspRbW8pvauewUXGBBUyD7sN/v3KGC7dd70coOv
	Bxwh6FYGfWDqKG70Gn3IgKwoIN0mTGpKQHqsHw4bDlHtZWe7A/OuQnLUSANUzipv1+G08jcwtW3
	wpeFRxXgvrpQADv6XES7JTgZNRTXYUQqP1JjVx2Hc9aXge3y7lMETLLMDemXd/QUQgAfDBoWF
X-Received: by 2002:a05:6a00:27a1:b0:71e:7a19:7d64 with SMTP id d2e1a72fcca58-71e7da11097mr1652802b3a.5.1729019647387;
        Tue, 15 Oct 2024 12:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER0AKJa713XjDoMfdq3eu4Xlw1nlRzuGy7JQ42meFRIgt7otBQwpBkpak7bBIndmNj4LvfOw==
X-Received: by 2002:a05:6a00:27a1:b0:71e:7a19:7d64 with SMTP id d2e1a72fcca58-71e7da11097mr1652782b3a.5.1729019647013;
        Tue, 15 Oct 2024 12:14:07 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e7750a524sm1622835b3a.200.2024.10.15.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:14:05 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:14:03 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix slab-use-after-free in
 scmi_bus_notifier
Message-ID: <Zw6++9WJGV8R3OAJ@hu-bjorande-lv.qualcomm.com>
References: <20241015-fix_scmi_slab_use_after_free-v1-1-7d992b6b1488@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-fix_scmi_slab_use_after_free-v1-1-7d992b6b1488@quicinc.com>
X-Proofpoint-ORIG-GUID: RdtizCH6E3KFVSA86tglKjmi5GPqsqwA
X-Proofpoint-GUID: RdtizCH6E3KFVSA86tglKjmi5GPqsqwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150129

On Tue, Oct 15, 2024 at 04:48:26PM +0800, Xinqi Zhang wrote:

Hi Xinqi,

It seems you got linux-arm-msm@vger.kernel.org in your recipients list
when I believe you tried to send only to kernel@quicinc.com? Your patch
looks good, so please expand your commit message a bit and resubmit this
to the full list of recipients suggested by the tools.

> Move release of scmi_dev->name into scmi_device_release to
> avoid slab-use-after-free.

Please provide a sentence describing the problem you're solving before
this technical description of proposed solution, and add () suffix to
function names.

Regards,
Bjorn

> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in strncmp+0xe4/0xec
> Read of size 1 at addr ffffff80a482bcc0 by task swapper/0/1
> 
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.6.38-debug #1
> Hardware name: Qualcomm Technologies, Inc. SA8775P Ride (DT)
> Call trace:
>  dump_backtrace+0x94/0x114
>  show_stack+0x18/0x24
>  dump_stack_lvl+0x48/0x60
>  print_report+0xf4/0x5b0
>  kasan_report+0xa4/0xec
>  __asan_report_load1_noabort+0x20/0x2c
>  strncmp+0xe4/0xec
>  scmi_bus_notifier+0x5c/0x54c
>  notifier_call_chain+0xb4/0x31c
>  blocking_notifier_call_chain+0x68/0x9c
>  bus_notify+0x54/0x78
>  device_del+0x1bc/0x840
>  device_unregister+0x20/0xb4
>  __scmi_device_destroy+0xac/0x280
>  scmi_device_destroy+0x94/0xd0
>  scmi_chan_setup+0x524/0x750
>  scmi_probe+0x7fc/0x1508
>  platform_probe+0xc4/0x19c
>  really_probe+0x32c/0x99c
>  __driver_probe_device+0x15c/0x3c4
>  driver_probe_device+0x5c/0x170
>  __driver_attach+0x1c8/0x440
>  bus_for_each_dev+0xf4/0x178
>  driver_attach+0x3c/0x58
>  bus_add_driver+0x234/0x4d4
>  driver_register+0xf4/0x3c0
>  __platform_driver_register+0x60/0x88
>  scmi_driver_init+0xb0/0x104
>  do_one_initcall+0xb4/0x664
>  kernel_init_freeable+0x3c8/0x894
>  kernel_init+0x24/0x1e8
>  ret_from_fork+0x10/0x20
> 
> Allocated by task 1:
>  kasan_save_stack+0x2c/0x54
>  kasan_set_track+0x2c/0x40
>  kasan_save_alloc_info+0x24/0x34
>  __kasan_kmalloc+0xa0/0xb8
>  __kmalloc_node_track_caller+0x6c/0x104
>  kstrdup+0x48/0x84
>  kstrdup_const+0x34/0x40
>  __scmi_device_create.part.0+0x8c/0x408
>  scmi_device_create+0x104/0x370
>  scmi_chan_setup+0x2a0/0x750
>  scmi_probe+0x7fc/0x1508
>  platform_probe+0xc4/0x19c
>  really_probe+0x32c/0x99c
>  __driver_probe_device+0x15c/0x3c4
>  driver_probe_device+0x5c/0x170
>  __driver_attach+0x1c8/0x440
>  bus_for_each_dev+0xf4/0x178
>  driver_attach+0x3c/0x58
>  bus_add_driver+0x234/0x4d4
>  driver_register+0xf4/0x3c0
>  __platform_driver_register+0x60/0x88
>  scmi_driver_init+0xb0/0x104
>  do_one_initcall+0xb4/0x664
>  kernel_init_freeable+0x3c8/0x894
>  kernel_init+0x24/0x1e8
>  ret_from_fork+0x10/0x20
> 
> Freed by task 1:
>  kasan_save_stack+0x2c/0x54
>  kasan_set_track+0x2c/0x40
>  kasan_save_free_info+0x38/0x5c
>  __kasan_slab_free+0xe8/0x164
>  __kmem_cache_free+0x11c/0x230
>  kfree+0x70/0x130
>  kfree_const+0x20/0x40
>  __scmi_device_destroy+0x70/0x280
>  scmi_device_destroy+0x94/0xd0
>  scmi_chan_setup+0x524/0x750
>  scmi_probe+0x7fc/0x1508
>  platform_probe+0xc4/0x19c
>  really_probe+0x32c/0x99c
>  __driver_probe_device+0x15c/0x3c4
>  driver_probe_device+0x5c/0x170
>  __driver_attach+0x1c8/0x440
>  bus_for_each_dev+0xf4/0x178
>  driver_attach+0x3c/0x58
>  bus_add_driver+0x234/0x4d4
>  driver_register+0xf4/0x3c0
>  __platform_driver_register+0x60/0x88
>  scmi_driver_init+0xb0/0x104
>  do_one_initcall+0xb4/0x664
>  kernel_init_freeable+0x3c8/0x894
>  kernel_init+0x24/0x1e8
>  ret_from_fork+0x10/0x20
> 
> Signed-off-by: Xinqi Zhang <quic_xinqzhan@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 96b2e5f9a8ef0386525f9d91d2925e7e6d48ac28..157172a5f2b577ce4f04425f967f548230c1ebed 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -325,7 +325,10 @@ EXPORT_SYMBOL_GPL(scmi_driver_unregister);
>  
>  static void scmi_device_release(struct device *dev)
>  {
> -	kfree(to_scmi_dev(dev));
> +	struct scmi_device *scmi_dev = to_scmi_dev(dev);
> +
> +	kfree_const(scmi_dev->name);
> +	kfree(scmi_dev);
>  }
>  
>  static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> @@ -338,7 +341,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
>  		atomic_set(&scmi_syspower_registered, 0);
>  
> -	kfree_const(scmi_dev->name);
>  	ida_free(&scmi_bus_id, scmi_dev->id);
>  	device_unregister(&scmi_dev->dev);
>  }
> @@ -410,7 +412,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  
>  	return scmi_dev;
>  put_dev:
> -	kfree_const(scmi_dev->name);
>  	put_device(&scmi_dev->dev);
>  	ida_free(&scmi_bus_id, id);
>  	return NULL;
> 
> ---
> base-commit: eca631b8fe808748d7585059c4307005ca5c5820
> change-id: 20241015-fix_scmi_slab_use_after_free-4709d743931b
> 
> Best regards,
> -- 
> Xinqi Zhang <quic_xinqzhan@quicinc.com>
> 

