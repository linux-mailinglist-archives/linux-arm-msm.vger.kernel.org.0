Return-Path: <linux-arm-msm+bounces-28001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 900879493B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E091F25EF0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 14:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1213E1D6DA5;
	Tue,  6 Aug 2024 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7aEYzl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A81BE23E;
	Tue,  6 Aug 2024 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955817; cv=none; b=RwHCZ8TMDqQ9IXMIPw6OFg3foghZmuGXXFEqnI0ZUX1i6AOkzALREVJ8qwwzYElSNy25AEpAhyrZiI672xJ9vNLSzvm6yRb3+ZeG/ceZXydKCHKoDGQ7bslZ9bnoR2XbQ464920YMe4g6b3I/8zurN0vvlHBX8F5Ky9JfS3cYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955817; c=relaxed/simple;
	bh=Oz7qSUD/KpSY3UkpQxjeZSRwS0zAQNSUl64r7woFeHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoX3OCqDBB7+guS1jPWnJkSwNSHZRgvfCJ0wCnMl3YYAgXaDIOTOogr0o5O4Afl/XB+3VUjm6eYEoW3AEBNQBMHr2uDVLYW9d3xqDO45orp76S6WYIDVup9KtPuFHfDzJsYYuC6SQXwkdd1T+y7+PdWsixRfBDiRj8XUo9MDeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7aEYzl5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955816; x=1754491816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oz7qSUD/KpSY3UkpQxjeZSRwS0zAQNSUl64r7woFeHY=;
  b=d7aEYzl5Sff5GLwu3j3GnQ4SiG2KTKHwlQDQw0nchw/rq6S/Emx+n7DL
   eDKYoi6Z45/CovBWWhHUlup2fYucs8pZG1TdoadSvHl8q3XA3ZxocL1ws
   HfnmlLawQcjmgMu/DWdWJs95OuRaz9AumuYopIK68K5suN4zMf416uJk3
   jxx0vSZZLZJs+B4mb5akS1fHc8+SUkEAfGAnrWSOjtF+ewxVXKV0cIXNo
   +M4AY4lqb8c7XK2CV9rtb8PgfSQ0B0kqAW1gs73I49gvwMdrpRaA6NFGi
   TGsyxzmN5uVzGtqTKGMVlEhANwJFAfERYgym8QNeVmw8hUT2x9XPP04ZP
   A==;
X-CSE-ConnectionGUID: 8tIbHWGnRMKvLbrk/m+khQ==
X-CSE-MsgGUID: vItcAn75QR6KeOggNZM6dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101455"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21101455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:50:12 -0700
X-CSE-ConnectionGUID: gpz1VDRMRQiy+vklacVUxA==
X-CSE-MsgGUID: /WU0HS0aRFe10vT6NSeMCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87476457"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:50:06 -0700
Message-ID: <b8e67410-49a0-4ee8-a0a5-4b7ba03483c8@linux.intel.com>
Date: Tue, 6 Aug 2024 16:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/34] usb: host: xhci-mem: Cleanup pending secondary
 event ring events
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-6-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-6-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> As part of xHCI bus suspend, the XHCI is halted.  However, if there are

XHCI -> xHCI

> pending events in the secondary event ring, it is observed that the xHCI
> controller stops responding to further commands upon host or device
> initiated bus resume.  Iterate through all pending events and update the
> dequeue pointer to the beginning of the event ring.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-mem.c  |  7 ++++++-
>   drivers/usb/host/xhci-ring.c | 33 ++++++++++++++++++++++++++++++++-
>   drivers/usb/host/xhci.c      |  2 +-
>   drivers/usb/host/xhci.h      |  6 ++++++
>   4 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 2ca5937b73f4..60dfc59260d8 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1816,7 +1816,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>   		tmp &= ERST_SIZE_MASK;
>   		writel(tmp, &ir->ir_set->erst_size);
>   
> -		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
> +		xhci_update_erst_dequeue(xhci, ir, true);
>   	}
>   }
>   
> @@ -1859,6 +1859,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
>   		return;
>   	}
>   
> +	/*
> +	 * Cleanup secondary interrupter to ensure there are no pending events.
> +	 * This also updates event ring dequeue pointer back to the start.
> +	 */
> +	xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
>   	intr_num = ir->intr_num;
>   
>   	xhci_remove_interrupter(xhci, ir);
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 80dca780317a..a012ddf94fb5 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3012,7 +3012,7 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
>    * - When all events have finished
>    * - To avoid "Event Ring Full Error" condition
>    */
> -static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> +void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>   				     struct xhci_interrupter *ir,
>   				     bool clear_ehb)
>   {
> @@ -3112,6 +3112,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
>   	return 0;
>   }
>   
> +/*
> + * Move the event ring dequeue pointer to skip events kept in the secondary
> + * event ring.  This is used to ensure that pending events in the ring are
> + * acknowledged, so the XHCI HCD can properly enter suspend/resume.  The

XHCI -> xHCI

> + * secondary ring is typically maintained by an external component.
> + */
> +void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
> +	struct xhci_ring *ring,	struct xhci_interrupter *ir)
> +{
> +	union xhci_trb *current_trb;
> +	u64 erdp_reg;
> +	dma_addr_t deq;
> +
> +	/* disable irq, ack pending interrupt and ack all pending events */
> +	xhci_disable_interrupter(ir);

That seems like a bit weird place to disable interrupter? Perhaps 
suspend and resume functions should be updated to handle more 
interrupters instead?


